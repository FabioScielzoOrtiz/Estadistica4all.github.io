---
title: ''
author: ''
date: ''
output:
  pdf_document:
    includes:
      in_header: "wrap-code.tex"
      before_body: portada4.sty
    toc_depth: 6
    number_sections: yes
  html_document:
    toc_depth: '6'
    df_print: paged
header_includes:
- \usepackage{longtable}
- \usepackage{lscape}
geometry: left=3cm,right=3cm,top=2cm,bottom=2cm
institute: Universidad Carlos III de Madrid
documentclass: article
papersize: a4
linestrech: 1.5
fontsize: 11pt
urlcolor: blue
---

# Introducción

En este trabajo se va a realizar un análisis y clasificación de textos. Para ellos se utilizaran dos lenguajes de programación, `Python` y `R`. El trabajo puede dividirse en dos partes bien diferenciadas, una primera parte en la que se trabaja con `Python` y una segunda en la que se usa `R`.

En la primera parte, en la que trabajamos con `Python`, se llevará acabo una descripción y preprocesado del data-set con el que trabajaremos, posteriormente se llevara acabo un análisis de texto, y para finalizar se realizaran tareas de clasificación aplicando algoritmos de clasificación supervisada, especialmente el algoritmo de clasificación ingenua bayesiana.

En la parte en la que trabajamos con `R` se seguirán los pasos del ejemplo ilustrado en clase.





# Carga de los datos (`Python`)

El data-set con el que vamos a trabajar contiene como observaciones noticias, y como variables la fecha, el título y el texto de la noticia, y si es una noticia falsa (fake new) o es verdadera (no fake new). La variable respuesta será `Fake` . Las variables predictoras que se usaran en el apartado de aplicación de algoritmos de clasificación   no aparecen en el data-set original, pero serán creadas usando la información de la variable `texto`

Importamos la libreria `pandas`, que es la liberia de `Python` mas usada para la manipulación y manejo de datos en formato de tabla, es decir, data-frames.



```python
import pandas as pd
```


Ahora importamos los datos, que originalmente estan distribuidos en dos data-sets, uno que contiene las fake news (`df_Fake`) y otro que contiene las no fake news (`df_True`):

```python
df_Fake = pd.read_csv('Fake.csv')
df_True = pd.read_csv('True.csv')
```

Creamos una variable que indicará en nuestro data-set final si la noticia es fake o no fake:

```python
df_Fake['Fake'] = 1
df_True['Fake'] = 0
```

Si para una noticia la nueva variable creada `Fake` toma el valor 1 , indica que es fake new, y si toma el 0 indica que no es fake new.


Ahora concatenamos (por filas) los dos data-sets anteriores, para generar el data-set con el que trabajaremos:

```python
Fake_News_Data = pd.concat([df_Fake, df_True])
```

Seleccionamos las columnas (variables) de nuestro interés:

```python
Fake_News_Data = Fake_News_Data.loc[: , ['Fake', 'title', 'text', 'date'] ]
```

Añadimos un índice al data-set:

```python
Fake_News_Data.index = range(0 , len(Fake_News_Data))
```


Ahora vamos a ver de qué tipo son nuestras variables en `Python` :


```python
Fake_News_Data.dtypes
```


    Fake      int64
    title    object
    text     object
    date     object
    dtype: object



El tipo `object` es propio de variables no cuantitativos, como categoricas o texto, y el tipo `int64` es propio de variables enteras.

En este caso dejaremos los types como están, salvo el de la variable `Fake` que es categorica y por tanto es más adecuado que su type sea `object`


```python
Fake_News_Data['Fake'] = Fake_News_Data['Fake'].astype('object')
```

Calculamos el numero de valores faltantes (NA) en cada una de las variables:

```python
Fake_News_Data.isnull().sum()
```


    Fake     0
    title    0
    text     0
    date     0
    


# Descripción estadistica de los datos (`Python`)

Hacemos una breve descripción estadistica de las variables del data-set:

```python
Fake_News_Data.describe(include='all')
```

```

              Fake                title       
count         44898               44898        
unique        2                   38729        
top           1                   Factbox: Trump fills top jobs for his administ...          
freq          23481               14         



              date                  text 
count         44898                 44898
unique        2397                  38646
top           December 20, 2017     (no se muestra por tamaño excesivo)
freq          182                   627

```

Esta tabla nos da alguna informacion relevante, como que en el data-set hay mas fake news que no fake news. Concretamente hay 44898 noticias, de las cuales 23481 son fakes y 44898-23481 = 21417 son no fakes. 



Vamos ahora a realizar un análisis descriptivo del data-set algo más profundo.


## Gráfico de barras de la variable respuesta (`Fake`)

Importamos algunas librerias necesarias para realizar este análisis en `Python`

Concretamente la libreria `numpy` da soporte para crear vectores y matrices grandes multidimensionales, junto con una gran colección de funciones matemáticas de alto nivel para operar con ellas. En general es una de las librerias de `Python` más empleadas junto con `pandas`

Tambien importamos las librerias `seaborn` y `matplotlib`que son muy empleadas para visualización de datos (creación de gráficos).

```python
import numpy as np

import seaborn as sns
import matplotlib as mpl
import matplotlib.pyplot as plt

sns.set(rc={'figure.figsize':(8,8)})
```


Vamos a calcular un gráfico de barras para la variable `Fake`:


```python
prop_Fake_yes = len( Fake_News_Data.loc[ Fake_News_Data['Fake']== 1 , :] ) / len(Fake_News_Data)

prop_Fake_no = len( Fake_News_Data.loc[ Fake_News_Data['Fake']== 0 , :] ) / len(Fake_News_Data)
```


```python
Fake_News_Data['proportion_Fakes'] = 0


for i in range(0, len(Fake_News_Data)):

    if Fake_News_Data['Fake'][i] == 1 :

        Fake_News_Data['proportion_Fakes'][i] = prop_Fake_yes

    else :

        Fake_News_Data['proportion_Fakes'][i] = prop_Fake_no
```


```python
p1 = sns.barplot(x='Fake', y='proportion_Fakes', data=Fake_News_Data, palette="Spectral") 
p1.set_yticks( np.arange(0, 0.85, 0.1)  )
p1.set_xticklabels(['No', 'Yes'])
p1.axes.set(xlabel='Fakes', ylabel='proportion')
```



    
![Gráfico de barras de la variable `Fake` ](output_15_1.png)
    


Las proporciones exactas de fake y no fake news son:

```python
[prop_Fake_no , prop_Fake_yes]
```

    [0.47701456635039424, 0.5229854336496058]


El número exacto de fake y no fake news es:

```python
[prop_Fake_no*len(Fake_News_Data) , prop_Fake_yes*len(Fake_News_Data)]
```


    [21417.0, 23481.0]


Eliminamos la columna `proportion_Fakes` del data-set, que ha sido creada solamente de manera auxiliar para poder generar el gráfico de barras anterior:

```python
Fake_News_Data = Fake_News_Data.loc[ : , Fake_News_Data.columns != 'proportion_Fakes']
```


## Número de palabras por noticia

Una forma de calcular en `Python` el número de palabras de cada notica es la siguiente:

```python
Fake_News_Data['word_count'] = Fake_News_Data['text'].str.split().str.len()
```

Vamos a ver el data-set con la nueva columna `word_count` que contiene el nº de palabras por noticia

```python
Fake_News_Data
```
```
      Fake   title        
      
0        1   Donald Trump Sends Out Embarrassing New Year’...   
1        1   Drunk Bragging Trump Staffer Started Russian ...   
2        1   Sheriff David Clarke Becomes An Internet Joke...   
3        1   Trump Is So Obsessed He Even Has Obama’s Name...   
4        1   Pope Francis Just Called Out Donald Trump Dur...

...    ...                                                ...   

44893    0  'Fully committed' NATO backs new U.S. approach...   
44894    0  LexisNexis withdrew two products from Chinese ...   
44895    0  Minsk cultural hub becomes haven from authorities   
44896    0  Vatican upbeat on possibility of Pope Francis ...   
44897    0  Indonesia to buy $1.14 billion worth of Russia...   



       text                                               date               
       
0      Donald Trump just couldn t wish all Americans ...  December 31, 2017   
1      House Intelligence Committee Chairman Devin Nu...  December 31, 2017   
2      On Friday, it was revealed that former Milwauk...  December 30, 2017   
3      On Christmas day, Donald Trump announced that ...  December 29, 2017   
4      Pope Francis used his annual Christmas Day mes...  December 25, 2017   

...                                                  ...                ...   

44893  BRUSSELS (Reuters) - NATO allies on Tuesday we...   August 22, 2017    
44894  LONDON (Reuters) - LexisNexis, a provider of l...   August 22, 2017    
44895  MINSK (Reuters) - In the shadow of disused Sov...   August 22, 2017    
44896  MOSCOW (Reuters) - Vatican Secretary of State ...   August 22, 2017    
44897  JAKARTA (Reuters) - Indonesia will buy 11 Sukh...   August 22, 2017    


       word_count
       
0             495  
1             305  
2             580  
3             444  
4             420  

...           ...  

44893         466  
44894         125  
44895         320  
44896         205  
44897         210  

```


## Numero medio de palabras por noticia en función de si son fake o no

Calculamos ahora la media de palabras de las fakes news y de la sno fake news. Es decir, el nº medio de palabras en el cojuntos de las noticias fake, y por otro lado en el conjutno de las no fake:


```python
Fake_News_Data.groupby('Fake')['word_count'].mean()
```

    Fake   Mean word_count
    
    0        385.640099
    
    1        423.197905
    







# Preprocesado de texto

En este apartado se vana a hacer una serie de operaciones orientadas al preprocesado de texto, para poder posteriormente realizar analasis mas profundos, y para poder implementar algoritmos de clasificación sobre texto.

Este tipo de preprocesado es básico y fundamental en areas de la ciencia de datos que trabajan con texto, como son la mineria de texto (text minning), el procesamiento del lenguaje natural (PLN) y la recuperación de información (information retrival).


Una de las operaciones centrales del preproceso de textos es la `tokenización`.



## Tokenizacion



Existen algunas librerias de `Python` que tienen funciones para realizar operaciones de tokenizacion, como por ejemplo las librerias `sklearn`, `nltk` o `spaCy`

En este caso no usaremos ninguna función de alguna de esas librerias, sino que crearemos nuestra propia función para realizar la tokenización.

Esta función esta totalmente inspirada en la función creada por el cientifico de datos [Joaquín Amat Rodrigo](), el cual es el creador del excelente blog sobre ciencia de datos  [Cienciadedatos.net](https://www.cienciadedatos.net/). En este blog Joaquin tiene un articulo sobre analisis de texto en `Python` en el cual se encuentra la función que ahora vamos a presentar. Ademas muchas otras partes de este trabajo estan basadas en dicho articulo, es por ello que s ele hace una especial mención tanto aqui como en el apartado de bibliografia. 

La función `limpiar_tokenizar` toma como input texto y devuelve como output un vector de tokens asociado a ese texto, es decir, un vector con las cadenas caracteres del texto, pero no con cualquier tipo, sino que la función no considera signos de puntuación , palabras que empiezan por "http", números, espacios en blancos múltiples, tokens con longitud menor que 2.

Un token aqui es considerado como una cadena de caracteres, es decir, una concatenacion de símbolos (sin considerar el espacio en blanco como un símbolo). 


Veamos un ejemplo de lo que consideramos tokens:

Dado el siguiente texto:

" Esto es 1 ejemplo de l'limpieza de6 TEXTO  https://t.co/rnHPgyhx4Z @cienciadedatos #textmining "

Los tokens (en sentido estricto, no en el sentido restrictivo que considera la función `limpiar_tokenizar` ) asociados a dicho texto  son:

[ Esto , es , 1 , ejemplo , de , l'limpieza , de6 , TEXTO , https://t.co/rnHPgyhx4Z , @cienciadedatos , #textmining ]

```python
def limpiar_tokenizar(texto):

    import re
    
    '''
    Esta función limpia y tokeniza el texto en palabras individuales.
    El orden en el que se va limpiando el texto no es arbitrario.
    El listado de signos de puntuación se ha obtenido de: print(string.punctuation)
    y re.escape(string.punctuation)
    '''
    
    # Se convierte todo el texto a minúsculas:

    nuevo_texto = texto.lower()
    
    
    # Eliminacion de paginas web (palabras que empiezan por "http"):
    
    ## Las cadenas de caracteres que sean enlaces a webs no serán consideradas como tokens
    
    nuevo_texto = re.sub('http\S+', ' ', nuevo_texto)
    
    
    # Eliminacion de signos de puntuación:
    
    ## Si una cadena de caractrer contiene un signo de puntuacion estos serán eliminados y sustituidos por un   espacio en blanco. Si  por ejemplo tenemos las cadenas  '@FabioScielzo' y 'Fabio@Scielzo' ,
    ## la funcion las transforma en  'FabioScielzo' en el primer caso  y en el par de cadenas 'Fabio' , 'Scielzo' en el segundo. Y si tenemos
    ## una cadena de signos d puntuacion   como '@#!' la elimina directamente.
    
    regex = '[\\!\\"\\#\\$\\%\\&\\\'\\(\\)\\*\\+\\,\\-\\.\\/\\:\\;\\<\\=\\>\\?\\@\\[\\\\\\]\\^_\\`\\{\\|\\}\\~]'
    
    nuevo_texto = re.sub(regex , ' ', nuevo_texto)
    
    
    # Eliminacion de numeros:
    
    ## Si una cadena de caracter tiene numeros estos serán eliminados y sustituidos por un espacio en blanco. Si por ejemplo tenemos las cadenas '4FabioScielzo' y 'Fabio44Scielzo' la funcion las transforma en 'FabioScielzo' y 'Fabio' , 'Scielzo' , respectivamente. Ademas si una cadena solo contienen numeros, por ejemplo '123' la elimina directamente.
    
    nuevo_texto = re.sub("\d+", ' ', nuevo_texto)
    
    
    
    # Eliminacion de espacios en blanco multiples:
    
    ## Si tenemos en un texto dos o mas espacios en blanco consecutivos la funcion los transforma en un solo espacio en blanco. Por ejemplo si tenemos el texto "Fabio     es abogado" la funcion lo transforma en "Fabio es abogado".
    
    nuevo_texto = re.sub("\\s+", ' ', nuevo_texto)
    
    
    # Una vez que a un texto se le han aplicado las operaciones anteriores ya solo quede considerar las cadenas de caracteres de ese texto como tokens, ya que son cadenas con buenas propiedades, a saber, sin signos de puntuacion, sin numeros, sin links de web. Ademas la eliminacion de espacios en blanco multiples es fundamental para que la siguiente operacion funcione bien, ya que en el texto final resultante todas las cadenas estan separadas entre si por un solo espacio, y la siguiente operacion utiliza esa propiedad para identificar a las cadenas, que ya serán considerados tokens en sentido estricto.
    
    # Obtención de tokens:
    
    nuevo_texto = nuevo_texto.split(sep = ' ')
    
    
    # Eliminacion de tokens con una longitud menor que  2:
    
    ## Una ultima operacion es solo considerar los tokens obteenidos tras las operaciones anteriores que tengan un tamaño (nº de caracteres) igual o superior a 2 , es decir, dejar fuera tokens con solo un caracter.
    
    nuevo_texto = [token for token in nuevo_texto if len(token) >=  2]
    
    return(nuevo_texto)
```




 Probamos el funcionamiento de la función `limpiar_tokenizar` con el mismo texto que fue usado antes como ejemplo ilustrativo.

```python

test = "Esto es 1 ejemplo de l'limpieza de6 TEXTO  https://t.co/rnHPgyhx4Z @cienciadedatos #textmining"

print(limpiar_tokenizar(texto=test))
```

    ['esto', 'es', 'ejemplo', 'de', 'limpieza', 'de', 'texto', 'cienciadedatos', 'textmining']
    

Ahora probamos la función `limpiar_tokenizar` con la primera noticia del data-set `Fake_News_Data`:

```python
Fake_News_Data['text'][0]
```




    'Donald Trump just couldn t wish all Americans a Happy New Year and leave it at that. Instead, he had to give a shout out to his enemies, haters and  the very dishonest fake news media.  The former reality show star had just one job to do and he couldn t do it. As our Country rapidly grows stronger and smarter, I want to wish all of my friends, supporters, enemies, haters, and even the very dishonest Fake News Media, a Happy and Healthy New Year,  President Angry Pants tweeted.  2018 will be a great year for America! As our Country rapidly grows stronger and smarter, I want to wish all of my friends, supporters, enemies, haters, and even the very dishonest Fake News Media, a Happy and Healthy New Year. 2018 will be a great year for America!  Donald J. Trump (@realDonaldTrump) December 31, 2017Trump s tweet went down about as welll as you d expect.What kind of president sends a New Year s greeting like this despicable, petty, infantile gibberish? Only Trump! His lack of decency won t even allow him to rise above the gutter long enough to wish the American citizens a happy new year!  Bishop Talbert Swan (@TalbertSwan) December 31, 2017no one likes you  Calvin (@calvinstowell) December 31, 2017Your impeachment would make 2018 a great year for America, but I ll also accept regaining control of Congress.  Miranda Yaver (@mirandayaver) December 31, 2017Do you hear yourself talk? When you have to include that many people that hate you you have to wonder? Why do the they all hate me?  Alan Sandoval (@AlanSandoval13) December 31, 2017Who uses the word Haters in a New Years wish??  Marlene (@marlene399) December 31, 2017You can t just say happy new year?  Koren pollitt (@Korencarpenter) December 31, 2017Here s Trump s New Year s Eve tweet from 2016.Happy New Year to all, including to my many enemies and those who have fought me and lost so badly they just don t know what to do. Love!  Donald J. Trump (@realDonaldTrump) December 31, 2016This is nothing new for Trump. He s been doing this for years.Trump has directed messages to his  enemies  and  haters  for New Year s, Easter, Thanksgiving, and the anniversary of 9/11. pic.twitter.com/4FPAe2KypA  Daniel Dale (@ddale8) December 31, 2017Trump s holiday tweets are clearly not presidential.How long did he work at Hallmark before becoming President?  Steven Goodine (@SGoodine) December 31, 2017He s always been like this . . . the only difference is that in the last few years, his filter has been breaking down.  Roy Schulze (@thbthttt) December 31, 2017Who, apart from a teenager uses the term haters?  Wendy (@WendyWhistles) December 31, 2017he s a fucking 5 year old  Who Knows (@rainyday80) December 31, 2017So, to all the people who voted for this a hole thinking he would change once he got into power, you were wrong! 70-year-old men don t change and now he s a year older.Photo by Andrew Burton/Getty Images.'




```python
print(limpiar_tokenizar(texto=Fake_News_Data['text'][0]))
```

    ['donald', 'trump', 'just', 'couldn', 'wish', 'all', 'americans', 'happy', 'new', 'year', 'and', 'leave', 'it', 'at', 'that', 'instead', 'he', 'had', 'to', 'give', 'shout', 'out', 'to', 'his', 'enemies', 'haters', 'and', 'the', 'very', 'dishonest', 'fake', 'news', 'media', 'the', 'former', 'reality', 'show', 'star', 'had', 'just', 'one', 'job', 'to', 'do', 'and', 'he', 'couldn', 'do', 'it', 'as', 'our', 'country', 'rapidly', 'grows', 'stronger', 'and', 'smarter', 'want', 'to', 'wish', 'all', 'of', 'my', 'friends', 'supporters', 'enemies', 'haters', 'and', 'even', 'the', 'very', 'dishonest', 'fake', 'news', 'media', 'happy', 'and', 'healthy', 'new', 'year', 'president', 'angry', 'pants', 'tweeted', 'will', 'be', 'great', 'year', 'for', 'america', 'as', 'our', 'country', 'rapidly', 'grows', 'stronger', 'and', 'smarter', 'want', 'to', 'wish', 'all', 'of', 'my', 'friends', 'supporters', 'enemies', 'haters', 'and', 'even', 'the', 'very', 'dishonest', 'fake', 'news', 'media', 'happy', 'and', 'healthy', 'new', 'year', 'will', 'be', 'great', 'year', 'for', 'america', 'donald', 'trump', 'realdonaldtrump', 'december', 'trump', 'tweet', 'went', 'down', 'about', 'as', 'welll', 'as', 'you', 'expect', 'what', 'kind', 'of', 'president', 'sends', 'new', 'year', 'greeting', 'like', 'this', 'despicable', 'petty', 'infantile', 'gibberish', 'only', 'trump', 'his', 'lack', 'of', 'decency', 'won', 'even', 'allow', 'him', 'to', 'rise', 'above', 'the', 'gutter', 'long', 'enough', 'to', 'wish', 'the', 'american', 'citizens', 'happy', 'new', 'year', 'bishop', 'talbert', 'swan', 'talbertswan', 'december', 'no', 'one', 'likes', 'you', 'calvin', 'calvinstowell', 'december', 'your', 'impeachment', 'would', 'make', 'great', 'year', 'for', 'america', 'but', 'll', 'also', 'accept', 'regaining', 'control', 'of', 'congress', 'miranda', 'yaver', 'mirandayaver', 'december', 'do', 'you', 'hear', 'yourself', 'talk', 'when', 'you', 'have', 'to', 'include', 'that', 'many', 'people', 'that', 'hate', 'you', 'you', 'have', 'to', 'wonder', 'why', 'do', 'the', 'they', 'all', 'hate', 'me', 'alan', 'sandoval', 'alansandoval', 'december', 'who', 'uses', 'the', 'word', 'haters', 'in', 'new', 'years', 'wish', 'marlene', 'marlene', 'december', 'you', 'can', 'just', 'say', 'happy', 'new', 'year', 'koren', 'pollitt', 'korencarpenter', 'december', 'here', 'trump', 'new', 'year', 'eve', 'tweet', 'from', 'happy', 'new', 'year', 'to', 'all', 'including', 'to', 'my', 'many', 'enemies', 'and', 'those', 'who', 'have', 'fought', 'me', 'and', 'lost', 'so', 'badly', 'they', 'just', 'don', 'know', 'what', 'to', 'do', 'love', 'donald', 'trump', 'realdonaldtrump', 'december', 'this', 'is', 'nothing', 'new', 'for', 'trump', 'he', 'been', 'doing', 'this', 'for', 'years', 'trump', 'has', 'directed', 'messages', 'to', 'his', 'enemies', 'and', 'haters', 'for', 'new', 'year', 'easter', 'thanksgiving', 'and', 'the', 'anniversary', 'of', 'pic', 'twitter', 'com', 'fpae', 'kypa', 'daniel', 'dale', 'ddale', 'december', 'trump', 'holiday', 'tweets', 'are', 'clearly', 'not', 'presidential', 'how', 'long', 'did', 'he', 'work', 'at', 'hallmark', 'before', 'becoming', 'president', 'steven', 'goodine', 'sgoodine', 'december', 'he', 'always', 'been', 'like', 'this', 'the', 'only', 'difference', 'is', 'that', 'in', 'the', 'last', 'few', 'years', 'his', 'filter', 'has', 'been', 'breaking', 'down', 'roy', 'schulze', 'thbthttt', 'december', 'who', 'apart', 'from', 'teenager', 'uses', 'the', 'term', 'haters', 'wendy', 'wendywhistles', 'december', 'he', 'fucking', 'year', 'old', 'who', 'knows', 'rainyday', 'december', 'so', 'to', 'all', 'the', 'people', 'who', 'voted', 'for', 'this', 'hole', 'thinking', 'he', 'would', 'change', 'once', 'he', 'got', 'into', 'power', 'you', 'were', 'wrong', 'year', 'old', 'men', 'don', 'change', 'and', 'now', 'he', 'year', 'older', 'photo', 'by', 'andrew', 'burton', 'getty', 'images']
    



Ahora aplicamos la función `limpiar_tokenizar` a cada una de las noticias del data-set `Fake_News_Data`

```python
Fake_News_Data['text_tokenizado'] = Fake_News_Data['text'].apply( limpiar_tokenizar )
```

Creamos una columna que identifique las noticias:

```python
Fake_News_Data['id_text'] = range(0, len(Fake_News_Data))
```


Vemos como queda tras estos cambios el data-set `Fake_News_Data`:

```python
Fake_News_Data
```
```
      Fake                    title                                            
      
0        1   Donald Trump Sends Out Embarrassing New Year’...   
1        1   Drunk Bragging Trump Staffer Started Russian ...   
2        1   Sheriff David Clarke Becomes An Internet Joke...   
3        1   Trump Is So Obsessed He Even Has Obama’s Name...   
4        1   Pope Francis Just Called Out Donald Trump Dur...   

...    ...                     ...   

44893    0  'Fully committed' NATO backs new U.S. approach...   
44894    0  LexisNexis withdrew two products from Chinese ...   
44895    0  Minsk cultural hub becomes haven from authorities   
44896    0  Vatican upbeat on possibility of Pope Francis ...   
44897    0  Indonesia to buy $1.14 billion worth of Russia...   


                         text                                   date                

0      Donald Trump just couldn t wish all Americans ...  December 31, 2017   
1      House Intelligence Committee Chairman Devin Nu...  December 31, 2017   
2      On Friday, it was revealed that former Milwauk...  December 30, 2017   
3      On Christmas day, Donald Trump announced that ...  December 29, 2017   
4      Pope Francis used his annual Christmas Day mes...  December 25, 2017 

...                     ...                                      ...   

44893  BRUSSELS (Reuters) - NATO allies on Tuesday we...   August 22, 2017    
44894  LONDON (Reuters) - LexisNexis, a provider of l...   August 22, 2017    
44895  MINSK (Reuters) - In the shadow of disused Sov...   August 22, 2017    
44896  MOSCOW (Reuters) - Vatican Secretary of State ...   August 22, 2017    
44897  JAKARTA (Reuters) - Indonesia will buy 11 Sukh...   August 22, 2017   


       word_count              text_tokenizado                        id_text  

0         495     [donald, trump, just, couldn, wish, all, ameri...      0  
1         305     [house, intelligence, committee, chairman, dev...      1  
2         580     [on, friday, it, was, revealed, that, former, ...      2  
3         444     [on, christmas, day, donald, trump, announced,...      3  
4         420     [pope, francis, used, his, annual, christmas, ...      4  

...       ...                        ...                                ...  

44893     466     [brussels, reuters, nato, allies, on, tuesday,...    44893  
44894     125     [london, reuters, lexisnexis, provider, of, le...    44894  
44895     320     [minsk, reuters, in, the, shadow, of, disused,...    44895  
44896     205     [moscow, reuters, vatican, secretary, of, stat...    44896  
44897     210     [jakarta, reuters, indonesia, will, buy, sukho...    44897  

```



Creamos un nuevo data-frame solo con las columnas (variables) `id_text` , `text_tokenizado` y `Fake`, en ell que la columna `text_tokenizado` esta expandida, es decir, al ser una columna cuyos elementos son vectores, lo que se hace con la operacion `explode` es expandir cada uno de esos vectores en un nuevo data-frame, es decir, para cada uno de esos vectores se crean tantas filas en el nuevo data-frame como elementos hay en el vector, y en cada una de esas filas la columna `text_tokenizado` contendra un elemento del vector expandido. Visualmente es mas facil de entenderlo como se verá a continuación:

```python
Fake_News_Tokens = Fake_News_Data.loc[:, ['id_text', 'text_tokenizado', 'Fake'] ].explode(column='text_tokenizado')


# Renombramos la columna `text_tokenizado` como `token` :

Fake_News_Tokens = Fake_News_Tokens.rename(columns={'text_tokenizado':'token'})
```

Imprimimos el nuevo data-frame creado `Fake_News_Tokens`  al expandir la columna `text_tokenizado` del data-frame `Fake_News_Data`

```python
Fake_News_Tokens
```
```
       id_text       token    Fake
0            0      donald      1
0            0       trump      1
0            0        just      1
0            0      couldn      1
0            0        wish      1

...        ...         ...     ...

44897    44897  technology      0
44897    44897         and      0
44897    44897    aviation      0
44897    44897       among      0
44897    44897      others      0

```

\newpage

# Descripción estadística de los datos tras la `tokenización`


## Numero de tokens del conjunto de noticias en funcion de si son fake o no

```python
# nº de palabras (tokens) en el conjunto de textos clasificados como fake y en los no fake

Fake_News_Tokens.groupby(by='Fake')['token'].count()
```




    Fake
    0    7891501
    1    9611544
    Name: token, dtype: int64


## Numero de tokens *únicos* del conjunto de noticias en funcion de si son fake o no


```python
# nº de palabras (tokens) *unicos* en el conjunto de textos clasificados como fake y en los no fake

Fake_News_Tokens.groupby(by='Fake')['token'].nunique()
```




    Fake
    0    78020
    1    85642
    Name: token, dtype: int64



## Numero de tokens en cada una de las noticias individualmente

```python
# nº de palabras (tokens) en cada texto individual clasificados como fake y en los no fake

df1 = pd.DataFrame( Fake_News_Tokens.groupby(by = ["id_text" , "Fake"] )["token"].count().rename('nº_tokens') )
```


```python
df1
```

```
                     nº_tokens
id_text   Fake           
  0         1           447
  1         1           294
  2         1           563
  3         1           426
  4         1           415

 ...       ...          ...

44893       0           433
44894       0           120
44895       0           307
44896       0           196
44897       0           197

```


Hay noticias que no tienen tokens :

```python
df1.loc[df1['nº_tokens'] == 0, :]
```

```
                 nº_tokens
id_text  Fake           

9358      1           0
10923     1           0
11041     1           0
11190     1           0
11225     1           0

 ...     ...         ...

21857     1           0
21869     1           0
21870     1           0
21873     1           0
32451     0           0

```

Algunos ejemplos de estas noticias son los siguientes:

```python
Fake_News_Data.loc[Fake_News_Data.id_text == 9358]
```

```
        Fake   title  
9358     1     https://100percentfedup.com/served-roy-moore-v...   


        text  
9358    https://100percentfedup.com/served-roy-moore-v...   


        date  word_count  
9358              1   


      text_tokenizado   id_text  
9358        []           9358  
```



```python
Fake_News_Data.loc[Fake_News_Data.id_text == 10923]
```
```
       Fake      title 
10923    1       TAKE OUR POLL: Who Do You Think President Trum...        

       text     date            word_count   text_tokenizado   id_text  
10923           May 10, 2017        0              []           10923

```


Nos quedamos por tanto solo con las noticias que tienen algun token :

```python
df2 = df1.loc[df1['nº_tokens'] != 0, :]

df2
```
```
                 nº_tokens
id_text   Fake           

0          1           447
1          1           294
2          1           563
3          1           426
4          1           415

...       ...          ...

44893      0           433
44894      0           120
44895      0           307
44896      0           196
44897      0           197

```

 
Calculamos el numero medio de tokens para las noticas que tienen uno o mas tokens en funcion se si son fake o no:

```python
df2.groupby("Fake")["nº_tokens"].agg(['mean'])
```

```
            mean
Fake            
0     368.486225
1     422.169983
```
 
Se puede interpretar como la longitud media de las noticas fake y de las no fake

\vspace{0.5cm}


Hay diferencias entre lo obtenido mediante esta operación y lo obtenido al usar el siguiente código, que fue visto anteriormente:

```python
Fake_News_Data['word_count'] = Fake_News_Data['text'].str.split().str.len()

Fake_News_Data.groupby('Fake')['word_count'].mean()
```
```
Fake   Mean word_count
    
0        385.640099
    
1        423.197905
```

Y esto es debido a que el  código `Fake_News_Data['text'].str.split()` hace una operacion  similar a la realizada por nuestra funcion `limpiar_tokenizar` pero **no exactamente igual**, y esto lleva a que con la primera opcion se obtiene un conjunto de tokens diferente al obtenido con la funcion `limpiar_tokenizar`, en los distintos documentos, y esto lleva a que la longitud de los documentos sea diferente si se consideran los tokens obtenidos con  `Fake_News_Data['text'].str.split()`    a si se usan los obtenidos con `limpiar_tokenizar`, llo que lleva a diferencias en las longitudes medias obtenidas.



```python
Fake_News_Data['text'].str.split()
```

```

0        [Donald, Trump, just, couldn, t, wish, all, Am...
1        [House, Intelligence, Committee, Chairman, Dev...
2        [On, Friday,, it, was, revealed, that, former,...
3        [On, Christmas, day,, Donald, Trump, announced...
4        [Pope, Francis, used, his, annual, Christmas, ...
                               ...                        
44893    [BRUSSELS, (Reuters), -, NATO, allies, on, Tue...
44894    [LONDON, (Reuters), -, LexisNexis,, a, provide...
44895    [MINSK, (Reuters), -, In, the, shadow, of, dis...
44896    [MOSCOW, (Reuters), -, Vatican, Secretary, of,...
44897    [JAKARTA, (Reuters), -, Indonesia, will, buy, ...
```

Como se pueden ver con el código anterior se obtiene por ejemplo que '-' y ', Donald' son tokens , cuando con la función `limpiar_tokenizar`  no serían  considerados un tokens.

\vspace{0.5cm}



Otra forma de calcular lo anterior:


```python
m0 = ( Fake_News_Tokens.loc[Fake_News_Tokens['Fake']==0].groupby('id_text')['token'].count() ).mean()
```


```python
m1 = ( Fake_News_Tokens.loc[Fake_News_Tokens['Fake']==1].groupby('id_text')['token'].count() ).mean()
```


```python
pd.DataFrame({'fake_new': [0,1] , 'tokens_mean':[m0 , m1]})
```
```
   fake_new  tokens_mean
0         0   368.469020
1         1   409.332822

```


 
 
 
 
 
 




```python
df = pd.DataFrame(  (Fake_News_Tokens.groupby(by = ["Fake", "token"] )["token"].count().unstack(fill_value=0).stack().reset_index(name='frecuencia_token')))

# .unstack(fill_value=0).stack() para que tambien aparezcan los tokens con count = 0 , si no solo aprecerian los que tienen count > 0.
```


```python
df # Nos da el nº de veces que sale cada token en el conjunto de las noticas fake y por otro lado en el de las no fake (solo salen tokens con count > 0 )
```

```
        Fake       token  frecuencia_token
0          0          aa                22
1          0         aaa                 7
2          0  aaaaaaaand                 0
3          0   aaaaackkk                 0
4          0  aaaaapkfhk                 0
...      ...         ...               ...
251605     1        ””it                 0
251606     1      ””when                 0
251607     1         •if                 0
251608     1        $\surd$                 0
251609     1 $\Rightarrow$              0

```





```python
df.loc[df['token']=='yes' , ] # El token 'yes' aprece 1775 veces en el conjunto de las fake news y 336 en el de las no fake news
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Fake</th>
      <th>token</th>
      <th>frecuencia_token</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>116577</th>
      <td>0</td>
      <td>yes</td>
      <td>336</td>
    </tr>
    <tr>
      <th>242382</th>
      <td>1</td>
      <td>yes</td>
      <td>1775</td>
    </tr>
  </tbody>
</table>
</div>




```python
df.loc[df['token']=='true' , ] # El token 'true' aparece 2595 veces en el conjunto de las fake news y 412 en el de las no fake news
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Fake</th>
      <th>token</th>
      <th>frecuencia_token</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>106608</th>
      <td>0</td>
      <td>true</td>
      <td>412</td>
    </tr>
    <tr>
      <th>232413</th>
      <td>1</td>
      <td>true</td>
      <td>2595</td>
    </tr>
  </tbody>
</table>
</div>




```python
df.loc[df['Fake']==0 , ] # frecuencia de tokens en el conjunto de las no fake news
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Fake</th>
      <th>token</th>
      <th>frecuencia_token</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>0</td>
      <td>aa</td>
      <td>22</td>
    </tr>
    <tr>
      <th>1</th>
      <td>0</td>
      <td>aaa</td>
      <td>7</td>
    </tr>
    <tr>
      <th>2</th>
      <td>0</td>
      <td>aaaaaaaand</td>
      <td>0</td>
    </tr>
    <tr>
      <th>3</th>
      <td>0</td>
      <td>aaaaackkk</td>
      <td>0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>0</td>
      <td>aaaaapkfhk</td>
      <td>0</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>125800</th>
      <td>0</td>
      <td>””it</td>
      <td>1</td>
    </tr>
    <tr>
      <th>125801</th>
      <td>0</td>
      <td>””when</td>
      <td>1</td>
    </tr>
    <tr>
      <th>125802</th>
      <td>0</td>
      <td>•if</td>
      <td>3</td>
    </tr>
    <tr>
      <th>125803</th>
      <td>0</td>
      <td> $\surd$  </td>
      <td>3</td>
    </tr>
    <tr>
      <th>125804</th>
      <td>0</td>
      <td> $\Rightarrow$  </td>
      <td>1</td>
    </tr>
  </tbody>
</table>
<p>125805 rows × 3 columns</p>
</div>




```python
df.loc[df['Fake']==1 , ] # nº de tokens en el conjunto de las fake news
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Fake</th>
      <th>token</th>
      <th>frecuencia_token</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>125805</th>
      <td>1</td>
      <td>aa</td>
      <td>24</td>
    </tr>
    <tr>
      <th>125806</th>
      <td>1</td>
      <td>aaa</td>
      <td>9</td>
    </tr>
    <tr>
      <th>125807</th>
      <td>1</td>
      <td>aaaaaaaand</td>
      <td>1</td>
    </tr>
    <tr>
      <th>125808</th>
      <td>1</td>
      <td>aaaaackkk</td>
      <td>1</td>
    </tr>
    <tr>
      <th>125809</th>
      <td>1</td>
      <td>aaaaapkfhk</td>
      <td>1</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>251605</th>
      <td>1</td>
      <td>””it</td>
      <td>0</td>
    </tr>
    <tr>
      <th>251606</th>
      <td>1</td>
      <td>””when</td>
      <td>0</td>
    </tr>
    <tr>
      <th>251607</th>
      <td>1</td>
      <td>•if</td>
      <td>0</td>
    </tr>
    <tr>
      <th>251608</th>
      <td>1</td>
      <td> $\surd$ </td>
      <td>0</td>
    </tr>
    <tr>
      <th>251609</th>
      <td>1</td>
      <td> $\Rightarrow$  </td>
      <td>0</td>
    </tr>
  </tbody>
</table>
<p>125805 rows × 3 columns</p>
</div>





















