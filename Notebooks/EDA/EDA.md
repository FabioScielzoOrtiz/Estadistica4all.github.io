---
title: 'Exploratory Data Analysis'
author: 'Fabio Scielzo Ortiz'
date: '25/02/23'
output: 
   rmdformats::readthedown:
      use_bookdown: true
      self_contained: true
      thumbnails: true
      lightbox: true
      gallery: true
      highlight: tango
      

css: custom.css
---


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
    
 
    table {
     display: block;
     overflow-x: auto;
     border-collapse: collapse;
     border-spacing: 0;
     border: 0px solid;
     color: var(--jp-ui-font-color1);
     font-size: 14px;
     margin-left: auto;
     margin-right: auto;
     
            }
            
</style>



<div class="warning" style='background-color:#FCF2EC; color: #000000; border-left: solid #FE9554 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:10em;'>


$\hspace{0.3cm}$ **More articles:    $\hspace{0.1cm}$ [Estadistica4all](https://fabioscielzoortiz.github.io/Estadistica4all.github.io/)**

$\hspace{0.3cm}$ **Author:** $\hspace{0.1cm}$ [Fabio Scielzo Ortiz](http://estadistica4all.com/autores/autores.html)

$\hspace{0.3cm}$ **If you use this article, please, reference it:** 

$\hspace{0.5cm}$ Scielzo Ortiz, Fabio. (2023). Exploratory Data Analysis. http://estadistica4all.com/Articulos/EDA.html


</p>
 
</p></span>
</div>


***It's recommended to open the article on a computer or tablet.***
 
 
 
 
 <br>
 
 

# Exploratory Data Analysis (EDA) <a class="anchor" id="1"></a>

Exploratory data analysis (EDA) refers to the descriptive statistical analysis of a data-set. 

Next we are going to propose a metodology to carry out an EDA.



# First step: data-set structure

## Import data-set

A continuación cargamos el data-set al que vamos a aplicar un EDA

```python
import pandas as pd

Netflix_Data = pd.read_csv('titles.csv')
```

 

<br>

## Data-set conceptual description


## Data-set size

## info() method

## Column types

## NaN identification 




# Auxiliar step: data preprocessing

## Categorization of cuantitative variables

## Dummification of categorical variables 

## Recodefication of categorical variables

## Variable Scaling 





# Second step: statistical description

## Statistical variable

### types: quantitative and categorical

## Sample of a statisitcal variable


## Mean 

## Median

## Mode

## Variance

## Cuantiles

## Kurtosis

## Skewness

## Outliers



## Data matrix

## Covariance

## Correlation






## Statistical description for quantitative variables

mean. median, variance, cuantiles, kurtosis, skewness, outliers


frequency tables --> https://www.statology.org/frequency-tables-python/


## Statistical description for categorical variables

mode, quantiles

frequency tables 


## Statistical description for variable crossings (cruces de variables cuantis-categoricas, categroicas-categoricas, cuantis-cuantis)

quantitative-categorical --> mean, median, vaariance, quantiles etc BY GROUPS.  Joint and conditional frequency tables.

categorical-categorical --> Joint and conditional frequency tables.

quantitative-quantitative --> transform to categorical-categorical case.





# Third step: statistical visualization


## Visualization for quantitative variables

## Visualization for categorical variables

## Visualization for quantitative-categorical

## Visualization for categorical-categorical














## Tamaño

Lo primero es determinar el tamaño del data-set al que se le aplica el EDA. El tamaño de un data-set se puede concebir como su nº de filas y columnas.


```python
Netflix_Data.shape
```

    (5850, 15)


El data set tiene 5850 filas (observaciones) y 15 columnas (variables).


## Descripción conceptual de las variables

Esta data-set contieene información sobre 15 variables para 5850 títulos de Netflix.

La siguiente tabla contiene una breve descripción de las variables del data-set:


|      Variable           |          Descripción   |  Tipo  |
|:------------------------:|:---------------------:|:---------------------:|
| id   |The title ID on JustWatch | Identificador  |
| title | The name of the title | Texto |
| type    |TV show or movie  | Categórica |
|  description |A brief description | Texto |
|  release_year   | Año de lanzamiento | Cuantitativa |
| age_certification  |  La calificación de edad   | Categórica |
|  runtime   |  el nº de episiodios (show), el tiempo de durancion en minutos (movie)   |Cuantitativa|
|  genres | A list of genres      |Categórica |
| production_countries    |   A list of countries that produced the title     | Categórica |
|  seasons |     Number of seasons if it's a SHOW   | Cuantitativa |
| imdb_id    |   The title ID on IMDB      | Identificador |
|  imdb_score |   Puntuación en IMDB   | Cuantitativa |
|  imdb_votes   |     nº de votos en IMDB    | Cuantitativa |
| tmdb_popularity  |   Popularity on TMDB | Cuantitativa |
| tmdb_score  |   Puntuación en TMDB    | Cuantitativa |

 

 

 
<br>



## Tipo de variables

Ahora vamos a ver de que tipo son cada una de las 15 variables en `Python`

```python
Netflix_Data.info()
```

    <class 'pandas.core.frame.DataFrame'>
    RangeIndex: 5850 entries, 0 to 5849
    Data columns (total 15 columns):
     #   Column                Non-Null Count  Dtype  
    ---  ------                --------------  -----  
     0   id                    5850 non-null   object 
     1   title                 5849 non-null   object 
     2   type                  5850 non-null   object 
     3   description           5832 non-null   object 
     4   release_year          5850 non-null   int64  
     5   age_certification     3231 non-null   object 
     6   runtime               5850 non-null   int64  
     7   genres                5850 non-null   object 
     8   production_countries  5850 non-null   object 
     9   seasons               2106 non-null   float64
     10  imdb_id               5447 non-null   object 
     11  imdb_score            5368 non-null   float64
     12  imdb_votes            5352 non-null   float64
     13  tmdb_popularity       5759 non-null   float64
     14  tmdb_score            5539 non-null   float64
    dtypes: float64(5), int64(2), object(8)
    memory usage: 685.7+ KB
    

El Dtype `object` es el típico de variables categoricas, identificadores o texto. 

El Dtype `float64` y `int64` es típico de variables cuantitativas (continuas y discretas, respectivamente).

<br>


## Valores faltantes (NA)

Ahora vamos a calcular la proporcion de valores faltantes sobre el total de datos, para cada una de las variables:
```python
Prop_NA = Netflix_Data.isnull().sum() / len(Netflix_Data)

Prop_NA
```


    id                      0.000000
    title                   0.000171
    type                    0.000000
    description             0.003077
    release_year            0.000000
    age_certification       0.447692
    runtime                 0.000000
    genres                  0.000000
    production_countries    0.000000
    seasons                 0.640000
    imdb_id                 0.068889
    imdb_score              0.082393
    imdb_votes              0.085128
    tmdb_popularity         0.015556
    tmdb_score              0.053162
    dtype: float64



<br>

Podemos ver que hay variables como `age_certification` con una alta proporción de valores faltantes (44.77%).

`season`sería la variable con mayor proporción de valores faltantes, pero esto se debe a que solo esta definida para las series (`type=SHOW`)

En este artículo no se hará un tratamiento de los valores faltantes, el cual será expuesto en un futuro articulo sobre pre-procesamiento de datos.
<br>

# Descripción Estadistica Básica 



A continuación vamos a realizar una descripción estadistica básica de las variables, a traves de dicersos estadisticos básicos.


## Estadisticos básicos para las variables cuantitativas

Para las variables cuantitativas:

```python
Netflix_Data.describe()
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
      <th>release_year</th>
      <th>runtime</th>
      <th>seasons</th>
      <th>imdb_score</th>
      <th>imdb_votes</th>
      <th>tmdb_popularity</th>
      <th>tmdb_score</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>count</th>
      <td>5850.000000</td>
      <td>5850.000000</td>
      <td>2106.000000</td>
      <td>5368.000000</td>
      <td>5.352000e+03</td>
      <td>5759.000000</td>
      <td>5539.000000</td>
    </tr>
    <tr>
      <th>mean</th>
      <td>2016.417094</td>
      <td>76.888889</td>
      <td>2.162868</td>
      <td>6.510861</td>
      <td>2.343938e+04</td>
      <td>22.637925</td>
      <td>6.829175</td>
    </tr>
    <tr>
      <th>std</th>
      <td>6.937726</td>
      <td>39.002509</td>
      <td>2.689041</td>
      <td>1.163826</td>
      <td>9.582047e+04</td>
      <td>81.680263</td>
      <td>1.170391</td>
    </tr>
    <tr>
      <th>min</th>
      <td>1945.000000</td>
      <td>0.000000</td>
      <td>1.000000</td>
      <td>1.500000</td>
      <td>5.000000e+00</td>
      <td>0.009442</td>
      <td>0.500000</td>
    </tr>
    <tr>
      <th>25%</th>
      <td>2016.000000</td>
      <td>44.000000</td>
      <td>1.000000</td>
      <td>5.800000</td>
      <td>5.167500e+02</td>
      <td>2.728500</td>
      <td>6.100000</td>
    </tr>
    <tr>
      <th>50%</th>
      <td>2018.000000</td>
      <td>83.000000</td>
      <td>1.000000</td>
      <td>6.600000</td>
      <td>2.233500e+03</td>
      <td>6.821000</td>
      <td>6.900000</td>
    </tr>
    <tr>
      <th>75%</th>
      <td>2020.000000</td>
      <td>104.000000</td>
      <td>2.000000</td>
      <td>7.300000</td>
      <td>9.494000e+03</td>
      <td>16.590000</td>
      <td>7.537500</td>
    </tr>
    <tr>
      <th>max</th>
      <td>2022.000000</td>
      <td>240.000000</td>
      <td>42.000000</td>
      <td>9.600000</td>
      <td>2.294231e+06</td>
      <td>2274.044000</td>
      <td>10.000000</td>
    </tr>
  </tbody>
</table>
</div>


<br>

## Estadisticos básicos para las variables categóricas

Para las variables categóricas (no cuantitativas, en general) : 

```python
Netflix_Data.loc[: , ['title', 'description', 'age_certification', 'genres', 'production_countries' ]].describe()
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
      <th>title</th>
      <th>description</th>
      <th>age_certification</th>
      <th>genres</th>
      <th>production_countries</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>count</th>
      <td>5849</td>
      <td>5832</td>
      <td>3231</td>
      <td>5850</td>
      <td>5850</td>
    </tr>
    <tr>
      <th>unique</th>
      <td>5798</td>
      <td>5829</td>
      <td>11</td>
      <td>1726</td>
      <td>452</td>
    </tr>
    <tr>
      <th>top</th>
      <td>The Gift</td>
      <td>Five families struggle with the ups and downs ...</td>
      <td>TV-MA</td>
      <td>['comedy']</td>
      <td>['US']</td>
    </tr>
    <tr>
      <th>freq</th>
      <td>3</td>
      <td>2</td>
      <td>883</td>
      <td>484</td>
      <td>1959</td>
    </tr>
  </tbody>
</table>
</div>


<br>




 

## Gráficos conjuntos  para las variables cuantitativas

En esta seccion vamos a hacer un analisis gráfico básico de las variables cuantitativas, consideradas de manera conjunta.

Cargamos las librerias necesarias para los gráficos:
```python
import numpy as np

import seaborn as sns
import matplotlib as mpl
import matplotlib.pyplot as plt
```

### Histograma conjunto de las variables cuantitativas

Vamos a generar un grafico con un histograma para cada una de las variables cuantitativas:

```python
fig, axs = plt.subplots(3, 3, figsize=(11, 11))

p1 = sns.histplot(data=Netflix_Data, x="release_year", stat="proportion", bins=15, color="skyblue", ax=axs[0, 0])
 

p2 = sns.histplot(data=Netflix_Data, x="runtime", stat="proportion", bins=15, color="olive", ax=axs[0, 1])
p2.axes.set(xlabel='runtime', ylabel=' ')
 

p3 = sns.histplot(data=Netflix_Data, x="seasons", stat="proportion", bins=15, color="blue", ax=axs[0, 2])
p3.axes.set(xlabel='seasons', ylabel=' ')
 

p4 = sns.histplot(data=Netflix_Data, x="imdb_score", stat="proportion", bins=15, color="teal", ax=axs[1, 0])
p4.axes.set(xlabel='imdb_score', ylabel=' ')
 

p5 = sns.histplot(data=Netflix_Data, x="imdb_votes", stat="proportion", bins=15, color="purple", ax=axs[1, 1])
p5.axes.set(xlabel='imdb_votes', ylabel=' ')
 

p6 = sns.histplot(data=Netflix_Data, x="tmdb_popularity", stat="proportion", bins=15, color="pink", ax=axs[1, 2])
p6.axes.set(xlabel='tmdb_popularity', ylabel=' ')
 
 
p7 = sns.histplot(data=Netflix_Data, x="tmdb_score", stat="proportion", bins=15, color="red", ax=axs[2, 0])
p7.axes.set(xlabel='tmdb_score', ylabel=' ')
 
fig.savefig('p1.png', format='png', dpi=1200)

plt.show()
```

<br>

<center>

![Histograma conjunto de las variables cuantitativas](p1.png){width="80%"}

</center>

<br>
    
    


### Box-Plot conjunto de las variables cuantitativas

Vamos a generar un grafico con un box-plot para cada una de las variables cuantitativas:

```python
fig, axs = plt.subplots(3, 3, figsize=(11, 11))

p1 = sns.boxplot(data=Netflix_Data, x="release_year", color="skyblue", ax=axs[0, 0])
 

p2 = sns.boxplot(data=Netflix_Data, x="runtime",  color="olive", ax=axs[0, 1])
p2.axes.set(xlabel='runtime', ylabel=' ')
p2.set_xticks( range(int(Netflix_Data['runtime'].min()) , int(Netflix_Data['runtime'].max()) , 100) )
p2.set_yticks( np.arange(0, 1, 0.1)  )

p3 = sns.boxplot(data=Netflix_Data, x="seasons", color="blue", ax=axs[0, 2])
p3.axes.set(xlabel='seasons', ylabel=' ')
 

p4 = sns.boxplot(data=Netflix_Data, x="imdb_score", color="teal", ax=axs[1, 0])
p4.axes.set(xlabel='imdb_score', ylabel=' ')
p4.set_xticks( range(int(Netflix_Data['imdb_score'].min()) , int(Netflix_Data['imdb_score'].max()) , 300) )
p4.set_yticks( np.arange(0, 1, 0.1)  )

p5 = sns.boxplot(data=Netflix_Data, x="imdb_votes", color="purple", ax=axs[1, 1])
p5.axes.set(xlabel='imdb_votes', ylabel=' ')
p5.set_xticks( range(int(Netflix_Data['imdb_votes'].min()) , int(Netflix_Data['imdb_votes'].max()/2) , 500000) )
p5.set_yticks( np.arange(0, 1, 0.1)  )

p6 = sns.boxplot(data=Netflix_Data, x="tmdb_popularity", color="pink", ax=axs[1, 2])
p6.axes.set(xlabel='tmdb_popularity', ylabel=' ')
p6.set_xticks( range(int(Netflix_Data['tmdb_popularity'].min()) , int(Netflix_Data['tmdb_popularity'].max()+1) , 1000) )
p6.set_yticks( np.arange(0, 1, 0.1)  )
 
p7 = sns.boxplot(data=Netflix_Data, x="tmdb_score", color="red", ax=axs[2, 0])
p7.axes.set(xlabel='tmdb_score', ylabel=' ')
p7.set_xticks( range(int(Netflix_Data['tmdb_score'].min()) , int(Netflix_Data['tmdb_score'].max()+1) , 2) )
p7.set_yticks( np.arange(0, 1, 0.1)  )

plt.show()
```


<br>

<center>

![Box-Plot conjunto de las variables cuantitativas](p2.png){width="80%"}

</center>

<br>
    

### Empirical-Cumulative-Distribution-Function-Plot conjunto de las variables cuantitativas

Vamos a generar un grafico con un ECDF-plot para cada una de las variables cuantitativas:

```python
fig, axs = plt.subplots(3, 3, figsize=(11, 11))

p1 = sns.ecdfplot(data=Netflix_Data, x="release_year", color="skyblue", ax=axs[0, 0])
p1.set_xticks( range(int(Netflix_Data['release_year'].min()) , int(Netflix_Data['release_year'].max()+20) , 20) )
p1.set_yticks( np.arange(0, 1, 0.1)  )

p2 = sns.ecdfplot(data=Netflix_Data, x="runtime",  color="olive", ax=axs[0, 1])
p2.axes.set(xlabel='runtime', ylabel=' ')
p2.set_xticks( range(int(Netflix_Data['runtime'].min()) , int(Netflix_Data['runtime'].max()) , 100) )
p2.set_yticks( np.arange(0, 1, 0.1)  )

p3 = sns.ecdfplot(data=Netflix_Data, x="seasons", color="blue", ax=axs[0, 2])
p3.axes.set(xlabel='seasons', ylabel=' ')
p3.set_xticks( range(int(Netflix_Data['seasons'].min()) , int(Netflix_Data['seasons'].max()) , 4) )
p3.set_yticks( np.arange(0, 1, 0.1)  )

p4 = sns.ecdfplot(data=Netflix_Data, x="imdb_score", color="teal", ax=axs[1, 0])
p4.axes.set(xlabel='imdb_score', ylabel=' ')
p4.set_xticks( range(int(Netflix_Data['imdb_score'].min()) , int(Netflix_Data['imdb_score'].max()) , 300) )
p4.set_yticks( np.arange(0, 1, 0.1)  )

p5 = sns.ecdfplot(data=Netflix_Data, x="imdb_votes", color="purple", ax=axs[1, 1])
p5.axes.set(xlabel='imdb_votes', ylabel=' ')
p5.set_xticks( range(int(Netflix_Data['imdb_votes'].min()) , int(Netflix_Data['imdb_votes'].max()/2) , 500000) )
p5.set_yticks( np.arange(0, 1, 0.1)  )

p6 = sns.ecdfplot(data=Netflix_Data, x="tmdb_popularity", color="pink", ax=axs[1, 2])
p6.axes.set(xlabel='tmdb_popularity', ylabel=' ')
p6.set_xticks( range(int(Netflix_Data['tmdb_popularity'].min()) , int(Netflix_Data['tmdb_popularity'].max()+1) , 1000) )
p6.set_yticks( np.arange(0, 1, 0.1)  )
 
p7 = sns.ecdfplot(data=Netflix_Data, x="tmdb_score", color="red", ax=axs[2, 0])
p7.axes.set(xlabel='tmdb_score', ylabel=' ')
p7.set_xticks( range(int(Netflix_Data['tmdb_score'].min()) , int(Netflix_Data['tmdb_score'].max()+1) , 50) )
p7.set_yticks( np.arange(0, 1, 0.1)  )

plt.show()
```


    
<br>

<center>

![ECDF-Plot conjunto de las variables cuantitativas](p3.png){width="80%"}

</center>

<br>
    








## Gráficos conjuntos  para las variables categoricas


### Bar-plot conjunto de las variables categóricas

Vamos a generar un grafico con un  bar-plot para cada una de las variables categóricas, excepto para aquellas cuyo nº de categorias es excesivo, y por tanto no es práctico el gráfico:

```python
fig, axs = plt.subplots(1, 2, figsize=(13, 6))

p1 = sns.countplot(x='type', data=Netflix_Data, ax=axs[0]) 
p1.set_xticklabels(['Movie', 'Show'])
p1.axes.set(xlabel='type', ylabel='count')

p2 = sns.countplot(x='age_certification', data=Netflix_Data, ax=axs[1]) 

plt.show()
```

<br>

<center>

![Bar-Plot conjunto de variables categoricas](p4.png){width="75%"}

</center>

<br>

# Análisis Estadístico

En la sección anterior se hizo una descripción estadistica básica de las variables del data-set con el que estamos trabajando, pero no se ha hecho ningun analisis de los resultados obtenidos. 

En esta seccion además de ampliar la descripción estadistica de los datos, se llevará a cabo un analisis de los resultados obtenidos.


<br>


## Estadisticos para las variables cuantitativas






## Estadisticos para las variables categoricas


## Tablas de frecuencias

## Gráficos individuales para las variables cuantitativas

## Gráficos individuales para las variables categoricas


