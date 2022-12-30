---
title: 'El algoritmo KNN'
author: 'Fabio Scielzo Ortiz'
date: '23/12/22'
output: 
   rmdformats::readthedown:
      use_bookdown: true
      self_contained: true
      thumbnails: true
      lightbox: true
      gallery: false
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


$\hspace{0.3cm}$ **Más artículos:    $\hspace{0.1cm}$ [Estadistica4all](https://fabioscielzoortiz.github.io/Estadistica4all.github.io/)**

$\hspace{0.3cm}$ **Autor:** $\hspace{0.1cm}$ [Fabio Scielzo Ortiz](http://estadistica4all.com/autores/autores.html)

$\hspace{0.3cm}$ **Si utilizas este artículo, por favor, cítalo:** 

$\hspace{0.5cm}$ Scielzo Ortiz, F. (2022). El algoritmo KNN. http://estadistica4all.com/Articulos/KNN.html


</p>
 
</p></span>
</div>


***Se recomienda abrir el artículo en un ordenador o en una tablet.***
 
 
 
 
 <br>
 
 
# Problema de clasificación supervisada <a class="anchor" id="1"></a>  



Un problema de **clasificación supervisada**  es un problema estadistico que consiste en predecir una variable respuesta **categorica** usando para ello **información**   de unas **variables predictoras** y de la propia variable **respuesta**.


La solución estadística al problema de regresión pasa por proponer un modelo o algoritmo que sea capaz usar la información muestral disponible de los predictores y la respuesta para predecir los valores de la respuesta para cada vector de observaciones de los predictores que se considere.
 





<br>



# KNN como algoritmo de clasificación supervisada 

Un algoritmo de clasificación supervisada  es un algoritmo que permite predecir una variable respuesta **categorica** usando para ello información sobre una serie de predictores y de la propia respuesta, es decir, es una modelo que permite resolver un problema de clasificación supervisada.



- Se consideran $\hspace{0.1cm} p\hspace{0.1cm}$ predictores $\hspace{0.1cm}\mathcal{X}_1,...,\mathcal{X}_p\hspace{0.1cm}$ y una variable respuesta **categórica** $\hspace{0.1cm}\mathcal{Y}$ $\\[0.5cm]$


- La variable respuesta **categorica**  tiene $\hspace{0.1cm}g\hspace{0.1cm}$ categorias , ya que $\hspace{0.1cm}R(\mathcal{Y})=\lbrace 0,1,...,g-1 \rbrace \\$

- Se tiene una muestra de observaciones $\hspace{0.1cm}X_r = (x_{1r},...,x_{nr})^t\hspace{0.1cm}$ de la variable $\hspace{0.1cm}\mathcal{X}_r\hspace{0.1cm}$ , para cada $\hspace{0.1cm}r \in \lbrace 1,...,p \rbrace$ $\\[0.5cm]$


- Se tiene una muestra de observaciones $\hspace{0.1cm}Y = (y_1,...,y_n)^t\hspace{0.1cm}$ de la variable $\hspace{0.1cm}\mathcal{Y}$ $\\[0.5cm]$


- En conclusión, se tiene una muestra de observaciones de los predictores y la respuesta. 

$$D=[\hspace{0.12cm}X_1,...,X_p,Y \hspace{0.12cm}]\hspace{0.12cm}=\begin{pmatrix}
    x_{11}&x_{12}&...&x_{1p}& y_1\\
    x_{21}&x_{22}&...&x_{2p} & y_2\\
    ... &...& ...& .... & ...\\
    x_{n1}&x_{n2}&...&x_{np}& y_n
    \end{pmatrix} = \begin{pmatrix}
    x_{1}& y_1\\
    x_{2}& y_2 \\
     ...&... \\
     x_{n} & y_n
    \end{pmatrix}$$
  

 
<br>

 ---

A continuación vamos a hacer una exposición teorica del algoritmo de KNN para clasificación supervisada.
 
<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>


$\hspace{0.15cm}$ El algoritmo **KNN** para **clasificación supervisada** tiene los siguientes pasos:


- Se define una medida de distancia  entre pares de observaciones de variables estadisticas $\hspace{0.15cm} \Rightarrow \hspace{0.15cm}$ $\delta  \\$

 

 
- Dada una nueva observación $\hspace{0.1cm}x_{new}\hspace{0.1cm}$ de los predictores $\hspace{0.1cm}(\mathcal{X}_1 ,...,\mathcal{X}_p)\hspace{0.1cm}$ , es decir, una observación que no está en la muestra de datos $\hspace{0.1cm}D\hspace{0.1cm}$, se calculan las distancias entre el par de observaciones $\hspace{0.1cm}(x_{new} \hspace{0.05cm} , \hspace{0.05cm} x_i)$ , para $\hspace{0.1cm}i=1,...,n \hspace{0.2cm} \Rightarrow \hspace{0.2cm} \delta(x_{new},x_i)$
 
$\hspace{0.25cm}$ Aquí no se va a entrar en este asunto, pero $\hspace{0.1cm}D\hspace{0.1cm}$ está jugando el papel de muestra de entrenamiento.
 


- Se seleccionan las $\hspace{0.1cm}k\hspace{0.1cm}$ observaciones   $\hspace{0.1cm}x_1,...,x_n\hspace{0.1cm}$ que son más cercanas a la nueva observación $\hspace{0.1cm}x_{new}\hspace{0.1cm}$, según la medida de distancia $\hspace{0.1cm}\delta\hspace{0.1cm}$

    El conjunto de estas $\hspace{0.1cm}k\hspace{0.1cm}$ observaciones son los **k vecinos más cercanos de $\hspace{0.1cm}x_{new}\hspace{0.1cm}$** y se denota por $\hspace{0.1cm}K_{x_{new}} \\$



- Se calcula la frecuencia relativa de cada categoría de la variable respuesta en el conjunto $\hspace{0.1cm}K_{x_{new}}$

    Denotamos por $\hspace{0.15cm}P\hspace{0.05cm}[\hspace{0.1cm} K_{x_{new}} \hspace{0.1cm},\hspace{0.1cm} r\hspace{0.1cm}]\hspace{0.15cm}$ a la frecuencia relativa (proporción) de observaciones del conjunto $\hspace{0.1cm}K_{x_{new}}\hspace{0.1cm}$ tales que $\hspace{0.1cm}\mathcal{Y}=r$

    Es decir:

  $$P\hspace{0.05cm}[\hspace{0.1cm} K_{x_{new}} \hspace{0.1cm},\hspace{0.1cm} r \hspace{0.1cm}] \hspace{0.15cm}=\hspace{0.15cm} \dfrac{ \# \hspace{0.1cm}\left\lbrace\hspace{0.1cm} i \hspace{0.13cm}/\hspace{0.13cm} x_i \in K_{x_{new}} \hspace{0.3cm}\text{y}\hspace{0.3cm}  y_i = r \hspace{0.1cm} \right\rbrace  }{\# \hspace{0.1cm} K_{x_{new}} } \\$$
  
  
    Notese que  $\hspace{0.15cm}\# \hspace{0.1cm} K_{x_{new}} \hspace{0.1cm}=\hspace{0.1cm} k \\$



- Para la nueva observación de los predictores $\hspace{0.1cm} x_{new} \hspace{0.1cm}$ se predice la variable respuesta como la categoría más frecuente en el conjunto $\hspace{0.1cm}K_{x_{new}}$


    Es decir:

    $$\hspace{0.6 cm} \text{Si} \hspace{0.5 cm} r^*  \hspace{0.05 cm}= \hspace{0.05 cm}  arg \hspace{0.15 cm} \underset{r\in R(\mathcal{Y})}{Max} \hspace{0.2cm} P\hspace{0.05cm}[\hspace{0.1cm} K_{x_{new}} \hspace{0.1cm},\hspace{0.1cm} r \hspace{0.1cm}]  \hspace{0.3cm}  \Rightarrow \hspace{0.3cm} \widehat{y}_{new} \hspace{0.05 cm}=\hspace{0.05 cm} r^* \hspace{0.1cm}$$


    Donde $\hspace{0.12cm}\widehat{y}_{new}\hspace{0.12cm}$ es el valor de la variable respuesta que el modelo predice para la observación $\hspace{0.12cm}x_{new}\hspace{0.12cm}$ de los predictores.


</p>
 
</p></span>
</div>

<br>

---

<br>



# KNN para clasificación supervisada con `sklearn`  <a class="anchor" id="3"></a>

Importamos algunos de los paquetes y modulos que vamos a utilizar:

```python
import seaborn as sns
import pandas as pd
import numpy as np
from sklearn.utils import resample
import math as math
import matplotlib as mpl
import matplotlib.pyplot as plt
```

Cargamos los datos con los que vamos a trabajar, los cuales han sido descritos a nivel conceptual en el artículo de [regresión lineal](http://estadistica4all.com/Articulos/Linear-Regression-new.html)

```python
Data = pd.read_csv('House_Price_Regression.csv')
```


Seleccionamos las variables con las que vamos a trabajar:

```python
Data_Mixed = Data.loc[:, ['latitude', 'longitude', 'price', 'size_in_m_2', 'balcony_recode', 'private_garden_recode', 'quality_recode']]

Data_Mixed.head()
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
      <th>latitude</th>
      <th>longitude</th>
      <th>price</th>
      <th>size_in_m_2</th>
      <th>balcony_recode</th>
      <th>private_garden_recode</th>
      <th>quality_recode</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>25.113208</td>
      <td>55.138932</td>
      <td>2700000</td>
      <td>100.242337</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>2.0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>25.106809</td>
      <td>55.151201</td>
      <td>2850000</td>
      <td>146.972546</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>2.0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>25.063302</td>
      <td>55.137728</td>
      <td>1150000</td>
      <td>181.253753</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>2.0</td>
    </tr>
    <tr>
      <th>3</th>
      <td>25.227295</td>
      <td>55.341761</td>
      <td>2850000</td>
      <td>187.664060</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>25.114275</td>
      <td>55.139764</td>
      <td>1729200</td>
      <td>47.101821</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>2.0</td>
    </tr>
  </tbody>
</table>
</div>



Dividimos el data set inicial en dos partes. Una parte jugará el rol de datos de entrenamiento, con ellos se entrenará el modelo. La otra parte jugara el rol de datos nuevos que no han sido usados para entrenar el modelo, y para los que se quiere predecir la variable respuesta. 

En la vida real es conjunto de datos nuevos serían exclusivamente de los predictores, y en base a esa información y el modelo entrenado se predecirian los valores de la respuesta para esos predictores, los cuales serían desconocidos de partida. Pero en este ejemplo no realista disponemos tambien de datos sobre la respuesta en el conjunto de datos nuevos. Esto permitirá medir de algun modo el error que comete el modelo al predecir la respuesta para las nuevas observaciones de los predictores, comparando las predicciones con los valores reales disponibles en la nueva muestra. Este principio es el que está detras de las técnicas de validación cruzada que serán estudiadas con detalle en futuros artículos.

```python
Data_Mixed_train = Data_Mixed.sample(frac=0.8, replace=False, weights=None, random_state=123, axis=None, ignore_index=False)

Data_Mixed_new =  Data_Mixed.drop( Data_Mixed_train.index , )
```

En este caso la variable respuesta será la calidad de la vivienda (quality), que es la variable que se va a predecir. Es decir, dada una vivienda vamos a predecir su calidad, esto es, vamos a clasificarla en una de las categorias definidas por la variable quality.

```python
## TRAIN DATA (Datos dispobles --> se usan para entrenar el modelo)

X_train = Data_Mixed_train.loc[: , Data_Mixed_train.columns != 'quality_recode']
Y_train = Data_Mixed_train.loc[: , 'quality_recode']

## NEW DATA (Nuevos datos de los predictores)

X_new = Data_Mixed_new.loc[: , Data_Mixed_new.columns != 'quality_recode']

# En la práctica real no se tienen datos sobre la respuesta asociado a las nuevas obsrvaciones de los predictores
# Eso es justo lo que se quiere predecir.
# Pero en este ejemplo al usar como "nuevos" datos una parte del data set original, si que tenemos esa información.

Y_new = Data_Mixed_new.loc[: , 'quality_recode'] 

```

Veamos la pinta que tienen los data-frames que acabamos de crear:

```python
X_train.head()
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
      <th>latitude</th>
      <th>longitude</th>
      <th>price</th>
      <th>size_in_m_2</th>
      <th>balcony_recode</th>
      <th>private_garden_recode</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>382</th>
      <td>25.196489</td>
      <td>55.272126</td>
      <td>15800000</td>
      <td>488.019459</td>
      <td>0.0</td>
      <td>1.0</td>
    </tr>
    <tr>
      <th>732</th>
      <td>25.107984</td>
      <td>55.244923</td>
      <td>1700000</td>
      <td>138.704179</td>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>1888</th>
      <td>25.071504</td>
      <td>55.128579</td>
      <td>1300000</td>
      <td>171.220229</td>
      <td>1.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>679</th>
      <td>25.054336</td>
      <td>55.203423</td>
      <td>999000</td>
      <td>116.035847</td>
      <td>1.0</td>
      <td>1.0</td>
    </tr>
    <tr>
      <th>1004</th>
      <td>25.087251</td>
      <td>55.145574</td>
      <td>2990000</td>
      <td>162.208638</td>
      <td>1.0</td>
      <td>0.0</td>
    </tr>
  </tbody>
</table>
</div>




```python
X_new.head()
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
      <th>latitude</th>
      <th>longitude</th>
      <th>price</th>
      <th>size_in_m_2</th>
      <th>balcony_recode</th>
      <th>private_garden_recode</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>1</th>
      <td>25.106809</td>
      <td>55.151201</td>
      <td>2850000</td>
      <td>146.972546</td>
      <td>1.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>25.063302</td>
      <td>55.137728</td>
      <td>1150000</td>
      <td>181.253753</td>
      <td>1.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>3</th>
      <td>25.227295</td>
      <td>55.341761</td>
      <td>2850000</td>
      <td>187.664060</td>
      <td>1.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>8</th>
      <td>25.106668</td>
      <td>55.149275</td>
      <td>2100000</td>
      <td>203.085958</td>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>16</th>
      <td>25.132021</td>
      <td>55.151405</td>
      <td>3499000</td>
      <td>151.710599</td>
      <td>1.0</td>
      <td>0.0</td>
    </tr>
  </tbody>
</table>
</div>








```python
Y_train.head()
```
```
382     2.0
732     1.0
1888    2.0
679     0.0
1004    2.0
Name: quality_recode, dtype: float64
```



```python
Y_new.head()
```
```
1     2.0
2     2.0
3     1.0
8     1.0
16    2.0
Name: quality_recode, dtype: float64
```


<br>
  

Importamos la libreria `sklearn`y los modulos necesarios para aplicar KNN para clasificación supervisada en `Python`


```python
import sklearn

from sklearn.neighbors import NearestNeighbors
```

En la siguiente caja de codigo podemos ver todos los parametros disponibles para la función `KNeighborsClassifier`, la cual permite implementar el algoritmo KNN para clasificación supervisada.
```python
# sklearn.neighbors.KNeighborsClassifier(n_neighbors=10, *, weights='uniform', algorithm='auto', leaf_size=30, p=2, metric='minkowski', metric_params=None, n_jobs=None) 
```


Fijamos algunos parametros del algoritmo. En concreto usaremos $k=10$ vecinos y la distancia de Minkowski con $p=2$, es decir, la distancia Euclidea.

```python
knn_classification = sklearn.neighbors.KNeighborsClassifier(n_neighbors=10 ,  p=2, metric='minkowski')
```

Entrenamos el modelo usando los data-frames X_train y Y_train, que contienen observaciones de los predictores y la respuesta, respectivamente.



```python
knn_classification.fit(X_train, Y_train)
```




    KNeighborsClassifier(n_neighbors=10)



Usando el método `predict` podemos predecir la respuesta para cada una de las observaciones de los predictores que consideremos. Para ello tenemos que pasarle al método los vectores de observaciones como filas de un array, en este caso esto ya lo tenemos en el data-frame X_new, que contiene las nuevas observaciones de los predictores como filas.

```python
knn_classification.predict( X_new ) 
```




    array([2., 2., 2., 1., 2., 2., 2., 2., 2., 2., 2., 2., 2., 2., 2., 1., 2.,
           1., 2., 2., 2., 2., 2., 2., 2., 2., 2., 2., 2., 2., 2., 2., 2., 2.,
           2., 2., 2., 0., 2., 2., 3., 1., 2., 2., 2., 2., 2., 2., 2., 2., 2.,
           2., 2., 2., 1., 2., 2., 2., 1., 2., 2., 2., 2., 1., 2., 2., 1., 1.,
           2., 2., 2., 2., 2., 2., 2., 2., 1., 1., 2., 2., 2., 2., 2., 2., 2.,
           2., 2., 1., 2., 2., 1., 2., 2., 2., 2., 2., 2., 1., 1., 1., 2., 2.,
           2., 2., 2., 2., 2., 2., 2., 2., 2., 2., 2., 2., 1., 2., 2., 2., 2.,
           1., 2., 2., 2., 2., 2., 2., 2., 2., 2., 2., 2., 2., 1., 1., 2., 2.,
           2., 1., 2., 2., 2., 2., 1., 2., 2., 2., 2., 2., 2., 2., 1., 2., 2.,
           1., 2., 2., 2., 2., 2., 2., 2., 2., 2., 2., 2., 2., 2., 2., 2., 1.,
           2., 2., 2., 2., 1., 1., 2., 2., 2., 2., 2., 1., 2., 2., 1., 1., 2.,
           2., 1., 2., 2., 2., 2., 2., 1., 2., 1., 2., 2., 2., 2., 2., 2., 2.,
           2., 1., 2., 2., 2., 3., 1., 2., 2., 2., 2., 2., 2., 2., 2., 2., 2.,
           3., 1., 2., 2., 2., 2., 2., 3., 2., 2., 3., 2., 2., 2., 2., 1., 2.,
           1., 1., 2., 2., 1., 2., 2., 2., 2., 2., 2., 2., 2., 2., 2., 2., 1.,
           2., 2., 2., 2., 2., 1., 2., 2., 2., 1., 2., 2., 2., 2., 0., 2., 2.,
           2., 1., 2., 0., 2., 2., 1., 2., 1., 2., 2., 2., 1., 1., 1., 2., 2.,
           2., 1., 2., 2., 2., 2., 1., 2., 2., 2., 2., 2., 1., 2., 2., 2., 1.,
           1., 1., 2., 2., 2., 2., 1., 2., 2., 1., 2., 1., 2., 2., 2., 2., 2.,
           2., 2., 2., 1., 2., 2., 2., 2., 1., 2., 2., 2., 1., 2., 2., 2., 2.,
           2., 2., 2., 2., 2., 2., 1., 2., 2., 2., 1., 2., 2., 2., 1., 2., 2.,
           2., 2., 1., 1., 2., 2., 2., 1., 2., 2., 1., 2., 2., 1., 2., 1., 2.,
           2., 2., 2., 2., 2., 2., 1.])



Como disponemos de los valores reales de la respuesta para las nuevas obserciones de los predictores, podemos calcular la tasa de acierto en la clasificación como la proporción de clasificaciones correctas :

```python
TA = sum( knn_classification.predict( X_new )  == Y_new.reset_index().quality_recode ) / len(Y_new)

TA
```

    0.5249343832020997



<br>

Podemos probar el algoritmo con otras funciones de distancia.

Por ejemplo con la distancia de Minkowski con $p=1$ (distancia Manhattan):


```python
knn_classification = sklearn.neighbors.KNeighborsClassifier(n_neighbors=10 , p=1,  metric='minkowski')

knn_classification.fit(X_train, Y_train)
```

Calculamos la tasa de  acierto de la clasificación:
```python
TA = sum( knn_classification.predict( X_new )  == Y_new.reset_index().quality_recode ) / len(Y_new)
TA
```



    0.5275590551181102

<br>


Probamos ahora con la distancia coseno:

```python
knn_classification = sklearn.neighbors.KNeighborsClassifier(n_neighbors=10 ,   metric='cosine')

knn_classification.fit(X_train, Y_train)

```

Calculamos la tasa de  acierto de la clasificación:
```python
TA = sum( knn_classification.predict( X_new )  == Y_new.reset_index().quality_recode ) / len(Y_new)
TA
```

    0.5643044619422573




<br>



# KNN  para clasificación supervisada programado en `Python` <a class="anchor" id="4"></a>

Vamos a crear una función que replique el algoritmo KNN para clasificación supervisada que anteriormente fue descrito. Este es un buen ejercicio para entender mejor como funciona realmente el algoritmo, y para practicar nuestra programación.



**Primero definimos algunas de las funciones de distancia que usará nuestro algoritmo:**


- Definimos la distancia Euclidea y la matriz de distancias Euclideas:
```python
def Dist_Euclidea(x_i, x_r):

        Dist_Euclidea = ( ( x_i - x_r )**2 ).sum()

        Dist_Euclidea = np.sqrt(Dist_Euclidea)

        return Dist_Euclidea
```


```python
def Matrix_Dist_Euclidea(Data):

    # Paso previo necesario si Data es pd.DataFrame  -->  Data = Data.to_numpy()

    n = len(Data)

    M =  np.empty((n , n))

    
    for i in range(0, n):

         for r in range(0, n):

             if i >= r :
               
                 M[i,r] = 0

             else :

                 M[i,r] = Dist_Euclidea(Data[i,:] , Data[r,:])   

                      
    return M 
```

<br>

- Definimos la distancia Minkowski y la matriz de distancias Minkowski:
```python
def Dist_Minkowski(x_i, x_r, q):

    Dist_Minkowski = ( ( ( abs( x_i - x_r) )**q ).sum() )**(1/q)

    return Dist_Minkowski
```


```python
def Matrix_Dist_Minkowski(Data, q):

    # Paso previo necesario si Data es pd.DataFrame  -->  Data = Data.to_numpy()

    n = len(Data)

    M =  np.empty((n , n))

    
    for i in range(0, n):

         for r in range(0, n):

             if i >= r :
               
                 M[i,r] = 0

             else :

                 M[i,r] = Dist_Minkowski(Data[i,:] , Data[r,:], q)   

                      
    return M 
```


<br>

- Definimos la distancia Canberra y la matriz de distancias Canberra:
```python
def Dist_Canberra(x_i, x_r):

    numerator =  abs( x_i - x_r )

    denominator =  ( abs(x_i) + abs(x_r) )
       
    numerator=np.array([numerator], dtype=float)

    denominator=np.array([denominator], dtype=float)

    # The following code is to eliminate zero division problems

    Dist_Canberra = ( np.divide( numerator , denominator , out=np.zeros_like(numerator), where=denominator!=0) ).sum() 

    return Dist_Canberra
```


```python
def Matrix_Dist_Canberra(Data):

    # Paso previo necesario si Data es pd.DataFrame  -->  Data = Data.to_numpy()

    n = len(Data)

    M =  np.empty((n , n))

    
    for i in range(0, n):

         for r in range(0, n):

             if i >= r :
               
                 M[i,r] = 0

             else :

                 M[i,r] = Dist_Canberra(Data[i,:] , Data[r,:])   

                      
    return M 
```


<br>

- Definimos la distancia Mahalanobis y la matriz de distancias de Mahalanobis:
```python
def Dist_Mahalanobis_2(x_i, x_r, S_inv):  # Más eficiente que la anterior

    # All the columns of Data must be type = 'float' or 'int' (specially not 'object'), in other case we will find 
    # dimensional problems when Python compute   x @ S_inv @ x.T

    x = (x_i - x_r)
    
    # x = np.array([x]) 
    
    # En este caso este paso no será necesario por el tipo de estructura Python (una lista) que va a ser un medoid en el
    # algoritmo que a continuación definiremos. De hecho si este paso no se suprimer salta un error al usar la distancia
    # de Mahalanobis, puesto que la operacion x @ S_inv @ x.T no está bien definida.

    Dist_Maha = np.sqrt( x @ S_inv @ x.T )  # x @ S_inv @ x.T = np.matmul( np.matmul(x , S_inv) , x.T )

    Dist_Maha = float(Dist_Maha)

    return Dist_Maha
```


```python
def Dist_Mahalanobis_3(x, S_inv):  # Más eficiente que la anterior

    # All the columns of Data must be type = 'float' or 'int' (specially not 'object'), in other case we will find 
    # dimensional problems when Python compute   x @ S_inv @ x.T

    # x = (x_i - x_r)

    # x = np.array([x]) # necessary step to transpose a 1D array

    Dist_Maha = np.sqrt( x @ S_inv @ x.T )  # x @ S_inv @ x.T = np.matmul( np.matmul(x , S_inv) , x.T )

    Dist_Maha = float(Dist_Maha)

    return Dist_Maha
```


```python
def Matrix_Dist_Mahalanobis_3(Data):

    # Paso previo necesario si Data es pd.DataFrame  -->  Data = Data.to_numpy()

    n = len(Data)

    M =  np.empty((n , n))

    S_inv=np.linalg.inv( np.cov(Data , rowvar=False) )

   
    for i in range(0, n):

         for r in range(0, n):

             if i >= r :
               
                 M[i,r] = 0

             else :

                 M[i,r] = Dist_Mahalanobis_3(x = np.array([Data[i,:] - Data[r,:]]) , S_inv=S_inv ) 

                      
    return M 
```


<br>

- Definimos la matriz de distancias de Gower:

```python
def a_b_c_d_Matrix(Data):

    X = Data

    a = X @ X.T

    n = X.shape[0]

    p = X.shape[1]

    ones_matrix = np.ones((n, p)) 

    b = (ones_matrix - X) @ X.T

    c = b.T

    d = (ones_matrix - X) @ (ones_matrix - X).T

    return a , b , c , d , p
```



```python
def alpha(x_i, x_r):

    alpha = sum(x_i == x_r)

    return(alpha)
```


```python
def Matrix_Gower_Similarity(Data, p1, p2, p3 ):

    # Data tiene que ser un numpy array tal que:
    # las primeras p1 tiene que ser variables cuantitativas, 
    # las siguientes p2 binarias y las restantes p3 multicales

    # Si Data no contiene variables cuantitativas --> p1=0
    # Si Data no contiene variables binarias --> p2=0
    # Si Data no contiene variables multiclase --> p3=0

    n = len(Data)

    M =  np.empty((n , n))

############################################################
    
    G_vector = np.repeat(0.5, p1)

    for k in range(0, p1):

        G_vector[k] = Data[:,k].max() - Data[:,k].min()

############################################################
   
    ones = np.repeat(1, p1)

    Quant_Data = Data[: , 0:p1]

    Binary_Data = Data[: , (p1):(p1+p2)]

    Multiple_Data = Data[: , (p1+p2):(p1+p2+p3) ]

############################################################

    a, b, c, d, p = a_b_c_d_Matrix(Binary_Data)

############################################################

    for i in range(0, n):

         for r in range(0, n):

            if i > r :
               
                 M[i,r] = 0
            
            elif i == r :
               
                 M[i,r] = 1
            
            else :

                # Calculo de la distancia de Gower entre las observaciones x_i y x_r

                numerator_part_1 = ( ones - ( abs(Quant_Data[i,:] - Quant_Data[r,:]) / G_vector ) ).sum() 

                numerator_part_2 = a[i,r] + alpha(Multiple_Data[i,:], Multiple_Data[r,:])

                numerator = numerator_part_1 + numerator_part_2
                

                if p1 + (p2 - d[i,r]) + p3 == 0:

                    M[i,r] = 0

                else:
                    
                    denominator = p1 + (p2 - d[i,r]) + p3

                    M[i,r] = numerator / denominator
                      
   
    return M  
```

```python
def Matrix_Gower_Distance(Data, p1, p2, p3 ):

    M = Matrix_Gower_Similarity(Data, p1, p2, p3)

    M = M + M.T - np.diag(np.repeat(1 , len(M)), k=0)

    M = np.sqrt( 1 - M )

    return M
```


<br>

---

<br>

**Programamos desde "cero" el algoritmo KNN para clasificación supervisada:**

```python
def KNN(Distance_Matrix_New_Data , k, X_train, Y_train ) :

    # k es el hiper-parametro del algoritmo KNN.

    # 'Distance_Matrix_New_Data' debe contenere las distancias entre las nuevas observaciones de los predictores y las de train.
    # Su fila i-esima debe contener las distancias entre la i-esima nueva observacion de los predictores y las observaciones de train de los predictores.
    
    # X_train tiene que ser un data-frame con las observaciones de los predictores con las que se va a entrenar el modelo.
    
    # Y_train tiene que ser un numpy array que contenga las observaciones de la respuesta con las que se va a entrenar el modelo.


    Y_predict_x_new_i_LIST = []

    for i in range(0, len(Distance_Matrix_New_Data)):

        distancias_x_new_i = pd.DataFrame({'id_x_train': X_train.index  , 'distancias': Distance_Matrix_New_Data[i,:]})

        distancias_x_new_i_sort = distancias_x_new_i.sort_values(by=["distancias"]).reset_index(drop=True)

        knn_x_new_i = distancias_x_new_i_sort.iloc[0:k , :]

        categorias_knn_x_new_i = []

        
        for j in knn_x_new_i.iloc[:,0]:

            categorias_knn_x_new_i.append(Y_train[j])

    
        unique, counts = np.unique(categorias_knn_x_new_i , return_counts=True)

        unique_Y , counts_Y = np.unique(Y_train , return_counts=True)

    
        if len(unique) == len(unique_Y) :

            proporciones_categorias_knn_x_new_i = pd.DataFrame({'prop_categoria': counts/k, 'categoria': unique_Y })
        
        elif len(unique) < len(unique_Y) :

            proporciones_categorias_knn_x_new_i = pd.DataFrame({'prop_categoria': counts/k, 'categoria': unique })


        Y_predict_x_new_i = proporciones_categorias_knn_x_new_i.sort_values(by=["prop_categoria"], ascending=False).iloc[0,:]['categoria']


        Y_predict_x_new_i_LIST.append(Y_predict_x_new_i)

    
    df_predictions = pd.DataFrame({'id_x_new':range(0, len(Distance_Matrix_New_Data)) , 'Y_predict': Y_predict_x_new_i_LIST})

    return df_predictions
```



Probaremos la función con la distancia de Gower. Para ello necesitamos calcular la matriz de distancias de Gower entre las nuevas observaciones y las observaciones de entrenamiento de los predictores.

```python
X = pd.concat([X_train , X_new])

X.head()
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
      <th>latitude</th>
      <th>longitude</th>
      <th>price</th>
      <th>size_in_m_2</th>
      <th>balcony_recode</th>
      <th>private_garden_recode</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>382</th>
      <td>25.196489</td>
      <td>55.272126</td>
      <td>15800000</td>
      <td>488.019459</td>
      <td>0.0</td>
      <td>1.0</td>
    </tr>
    <tr>
      <th>732</th>
      <td>25.107984</td>
      <td>55.244923</td>
      <td>1700000</td>
      <td>138.704179</td>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>1888</th>
      <td>25.071504</td>
      <td>55.128579</td>
      <td>1300000</td>
      <td>171.220229</td>
      <td>1.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>679</th>
      <td>25.054336</td>
      <td>55.203423</td>
      <td>999000</td>
      <td>116.035847</td>
      <td>1.0</td>
      <td>1.0</td>
    </tr>
    <tr>
      <th>1004</th>
      <td>25.087251</td>
      <td>55.145574</td>
      <td>2990000</td>
      <td>162.208638</td>
      <td>1.0</td>
      <td>0.0</td>
    </tr>
  </tbody>
</table>
</div>

```python
M_Gower = Matrix_Gower_Distance(Data=X.to_numpy(), p1=4, p2=2, p3=0)
M_Gower
```


    array([[0.        , 0.64817837, 0.76118906, ..., 0.70588672, 0.62389777,
            0.76544317],
           [0.64817837, 0.        , 0.5387377 , ..., 0.51390107, 0.61030246,
            0.53192923],
           [0.76118906, 0.5387377 , 0.        , ..., 0.38695255, 0.48555238,
            0.20821652],
           ...,
           [0.70588672, 0.51390107, 0.38695255, ..., 0.        , 0.477898  ,
            0.33432523],
           [0.62389777, 0.61030246, 0.48555238, ..., 0.477898  , 0.        ,
            0.45160134],
           [0.76544317, 0.53192923, 0.20821652, ..., 0.33432523, 0.45160134,
            0.        ]])




```python
M_Gower_new_data = M_Gower[ len(X_train):len(X) , 0:len(X_train) ]  

# Nos quedamos con las filas de la 1524 a la 1904 , que son las correspondientes a las nuevas observaciones de los predictores.
# Nos queamos con las columnas de la 0 a la 1524, que son las correspondientes a las observaciones de train de los predictores.

# 'M_new_data' contiene las distancias (de Gower) entre las nuevas observaciones de los predictores y las de entrenamiento.

# Su fila i-esima contiene las distancias entre la i-esima nueva observacion de los predictores y las observaciones de entrenamiento.
```


```python
M_Gower_new_data.shape
```

    (381, 1524)





```python
df_predictions = KNN(Distance_Matrix_New_Data = M_Gower_new_data , k=10, X_train=X_train, Y_train=Y_train)
```


```python
df_predictions
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
      <th>id_x_new</th>
      <th>Y_predict</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>0</td>
      <td>2.0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>1</td>
      <td>2.0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>2</td>
      <td>2.0</td>
    </tr>
    <tr>
      <th>3</th>
      <td>3</td>
      <td>1.0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>4</td>
      <td>2.0</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>376</th>
      <td>376</td>
      <td>2.0</td>
    </tr>
    <tr>
      <th>377</th>
      <td>377</td>
      <td>2.0</td>
    </tr>
    <tr>
      <th>378</th>
      <td>378</td>
      <td>2.0</td>
    </tr>
    <tr>
      <th>379</th>
      <td>379</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>380</th>
      <td>380</td>
      <td>2.0</td>
    </tr>
  </tbody>
</table>
<p>381 rows × 2 columns</p>
</div>

<br>



Podemos calcular la tasa de acierto en la clasificación obtenida con el algoritmo usando nuestra función con la distancia de Gower:

```python
TA = sum( df_predictions.Y_predict == Y_new.reset_index().quality_recode ) / len(Y_new)

TA
```

    0.7611548556430446




 

<br>


Probamos ahora el algoritmo con la distancia Euclidea:



```python
M_Euclidea = Matrix_Dist_Euclidea(Data=X.to_numpy())

M_Euclidea  = M_Euclidea + M_Euclidea.T

M_Euclidea_new_data = M_Euclidea[ len(X_train):len(X) , 0:len(X_train) ]  
```


```python
df_predictions = KNN(Distance_Matrix_New_Data = M_Euclidea_new_data , k=10, X_train=X_train, Y_train=Y_train)
```


```python
df_predictions
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
      <th>id_x_new</th>
      <th>Y_predict</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>0</td>
      <td>2.0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>1</td>
      <td>1.0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>2</td>
      <td>2.0</td>
    </tr>
    <tr>
      <th>3</th>
      <td>3</td>
      <td>1.0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>4</td>
      <td>2.0</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>376</th>
      <td>376</td>
      <td>2.0</td>
    </tr>
    <tr>
      <th>377</th>
      <td>377</td>
      <td>2.0</td>
    </tr>
    <tr>
      <th>378</th>
      <td>378</td>
      <td>1.0</td>
    </tr>
    <tr>
      <th>379</th>
      <td>379</td>
      <td>2.0</td>
    </tr>
    <tr>
      <th>380</th>
      <td>380</td>
      <td>2.0</td>
    </tr>
  </tbody>
</table>
<p>381 rows × 2 columns</p>
</div>




```python
TA = sum( df_predictions.Y_predict == Y_new.reset_index().quality_recode ) / len(Y_new)
TA
```

    0.5958005249343832



Como se puede comprobar se obtiene la misma tasa de acierto que con el algoritmo aplicado con `sklearn`, usando también la distancia Euclidea.



<br>

<br>


# Problema de regresión


Un problema de **regresión**  es un problema estadístico que consiste en predecir una variable respuesta **cuantitativa** usando para ello **información**  de unas **variables predictoras** y de la propia variable **respuesta**.

Un ejemplo de problema de regresión es la predicción del precio de viviendas de cierta región en base a características de dichas viviendas.


La solución estadística al problema de regresión pasa por proponer un modelo o algoritmo que sea capaz de usar la información muestral disponible de los predictores y la respuesta para predecir los valores de la respuesta para cada vector de observaciones de los predictores que se considere.



<br>


# KNN como algoritmo de regresión  <a class="anchor" id="5"></a>

Un modelo de regresión es un modelo estadístico que permite predecir una respuesta **cuantitativa** usando para ello información sobre una serie de predictores y de la propia respuesta.


- Se consideran $\hspace{0.1cm} p\hspace{0.1cm}$ predictores $\hspace{0.1cm}\mathcal{X}_1,...,\mathcal{X}_p\hspace{0.1cm}$ y una variable respuesta **cuantitativa** $\hspace{0.1cm}\mathcal{Y}$ $\\[0.5cm]$




- Se tiene una muestra de observaciones $\hspace{0.1cm}X_r = (x_{1r},...,x_{nr})^t\hspace{0.1cm}$ de la variable $\hspace{0.1cm}\mathcal{X}_r\hspace{0.1cm}$ , para cada $\hspace{0.1cm}r \in \lbrace 1,...,p \rbrace$ $\\[0.5cm]$


- Se tiene una muestra de observaciones $\hspace{0.1cm}Y = (y_1,...,y_n)^t\hspace{0.1cm}$ de la variable $\hspace{0.1cm}\mathcal{Y}$ $\\[0.5cm]$


- En conclusión, se tiene una muestra de observaciones de los predictores y la respuesta. 

$$D=[\hspace{0.12cm}X_1,...,X_p,Y \hspace{0.12cm}]\hspace{0.12cm}=\begin{pmatrix}
    x_{11}&x_{12}&...&x_{1p}& y_1\\
    x_{21}&x_{22}&...&x_{2p} & y_2\\
    ... &...& ...& .... & ...\\
    x_{n1}&x_{n2}&...&x_{np}& y_n
    \end{pmatrix} = \begin{pmatrix}
    x_{1}& y_1\\
    x_{2}& y_2 \\
     ...&... \\
     x_{n} & y_n
    \end{pmatrix}$$
  


 



<br>

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>

$\hspace{0.15cm}$ El algoritmo KNN para regresión tiene los siguientes pasos:


- Se define una medida de distancia  entre pares de observaciones de variables estadisticas $\hspace{0.15cm} \Rightarrow \hspace{0.15cm}$ $\delta \\$


 
- Dada una nueva observación $x_{new}$ de los predictores $\hspace{0.1cm}(\mathcal{X}_1 ,...,\mathcal{X}_p)$ , es decir, una observación que no está en la muestra de train, se calculan las distancias entre el par de observaciones $\hspace{0.1cm}(x_{new} \hspace{0.1cm},\hspace{0.1cm} x_i)\hspace{0.1cm}$ , para $\hspace{0.1cm}i=1,...,n  \hspace{0.25cm} \Rightarrow \hspace{0.25cm} \delta(x_{new} , x_i) \\$
 



- Se seleccionan las $\hspace{0.1cm}k\hspace{0.1cm}$ observaciones  $\hspace{0.1cm}x_1,...,x_n\hspace{0.1cm}$ que son más cercanas a la nueva observación $\hspace{0.1cm}x_{new}\hspace{0.1cm}$ , según la distancia $\hspace{0.1cm}\delta$.

    El conjunto de estas $\hspace{0.1cm}k\hspace{0.1cm}$ observaciones son los **k vecinos más cercanos de $x_{new}$** y se denota por $\hspace{0.1cm}K_{x_{new}} \\$



- Se predice la respuesta para la nueva observacion $\hspace{0.1cm}x_{new}\hspace{0.1cm}$ de los predictores como la media de la respuesta en el conjunto $\hspace{0.1cm}K_{x_{new}}$




    $$\widehat{y}_{new}  \hspace{0.15cm} = \hspace{0.15cm} \dfrac{1}{k} \cdot \sum_{ \hspace{0.05cm} i \hspace{0.05cm} \in \hspace{0.05cm} \Delta }  y_i $$



    Donde: 

    $$\hspace{0.1cm}\Delta = \left\lbrace i = 1,...,n \hspace{0.15cm}  / \hspace{0.15cm}  x_i \in K_{x_{new}} \right\rbrace \\$$


    - Otra forma de expresar el punto anterior es la siguiente:

        - Si  $\hspace{0.15cm}Y_{K_{x_{new}}}\hspace{0.1cm}$ es la muestra de la respuesta para los $\hspace{0.1cm}k\hspace{0.1cm}$ individuos asociados al conjunto $\hspace{0.1cm}K_{x_{new}}\hspace{0.1cm}$ , es decir: $\\[0.5cm]$

         $$Y_{K_{x_{new}}} = \left(\hspace{0.1cm} y_i \hspace{0.25cm} / \hspace{0.25cm}  i\in \lbrace 1,...,n \rbrace \hspace{0.3cm}  \text{y} \hspace{0.3cm} x_i \in K_{x_{new}}\hspace{0.1cm} \right)\\[0.3cm]$$

       $\hspace{0.8cm}$  entonces:


         $$\widehat{y}_{new} =  \overline{\hspace{0.15cm} Y}_{K_{x_{new}}}\\$$
 
</p>
 
</p></span>
</div>



<br>



# KNN para regresión con `sklearn` <a class="anchor" id="6"></a>

Volvemos a crear los data-frames con los que entrenaremos el modelo y los que usaremos para predecir la respuesta. En este caso la variable respuesta es el precio de las viviendas (price).

```python
## TRAIN DATA (Datos dispobles --> se usan para entrenar el modelo)

X_train = Data_Mixed_train.loc[: , Data_Mixed_train.columns != 'price']
Y_train = Data_Mixed_train.loc[: , 'price']

## NEW DATA (Nuevos datos de los predictores)

X_new = Data_Mixed_new.loc[: , Data_Mixed_test.columns != 'price']

# En la práctica real no se tienen datos sobre la respuesta asociado a las nuevas obsrvaciones de los predictores
# Eso es justo lo que se quiere predecir.
# Pero en este ejemplo al usar como "nuevos" datos una parte del data set original, si que tenemos esa información.

Y_new = Data_Mixed_new.loc[: , 'price'] 

```

Fijamos algunos parametros de la función `KNeighborsRegressor`
```python
knn_regression = sklearn.neighbors.KNeighborsRegressor(n_neighbors=10 , p=2,  metric='minkowski')
```

Entrenamos el algoritmo con las observaciones de los predictores contenidas en X_train y con las observaciones de la respuesta contenidas en Y_train.
```python
knn_regression.fit(X_train, Y_train)
```




    KNeighborsClassifier(n_neighbors=10)



Predecimos la respuesta para las observaciones de los predictores contenidas en X_new

```python
knn_regression.predict( X_new ) 
```

```
array([ 1963827.5,  3046500. ,  2523990. ,  2477788.8,  2513966.5,
        1732699.8,  2209200. ,  1629939.2,  2014867.5,  1567750.3,
         938557.7,  1272000. ,  1739199.8,  5767999. ,  2620300. ,
        2699000. ,  2184789.9,  1313399.9,  1606889.9,  1606988.7,
        2143900. ,   456800. ,  2475000. ,   923199.9,  1514399.6,
        2689500. ,   627404.9,  1807950. ,  2860688.7,   934390.3,
       11746999.9,  1370299.9,  1412638.6,   624110. ,  3395900. ,
         463982.8,  1092166.4,  1523899.9,   712312.9,  1008838.9,
        2053188.6,  1253360.8,   832938. ,  1569545.9,   730918.7,
        2728490. ,  2270500. ,  2048800. ,  3383900. ,  1847288.7,
        1162499.9,   994277.6,  3398877.8,  1392877.6,  1598200. ,
        1731699.8,  1695900. ,  1443087.8,  2424182.7,  3602390. ,
        2430588.8,  7251000. ,  1356689.2,   635069. ,  1806400. ,
        1465699.9,  2592000. ,  3567400. ,  2359377.6,  1399400. ,
        2120779.8,  1227612.6,  2239000. ,  1172078.8,  2170779.8,
        2262490. ,  5347499. ,  5502999. ,  1626888.8,  2748877.6,
         556904.8,  1380093.3,  3455000. ,   916588.6,   893834.4,
         785402.6,  1721288.8,  1900700. ,  4439900. , 15675244. ,
        1604676.6,  1416399.9,  1004399.9, 13611999.9,   620450. ,
        2070489.9,  2066000. ,  1664843.7,   653822.8,  1671599.9,
        5767999. ,  1687399.9,  2356188.8,  3228400. ,  1825599.9,
        1223644. ,   599630. ,  1781599.7,  2264280. ,  3247066.3,
        1139777.6,  2990688.7,  1489220.3,  1523966. ,  1009100. ,
         876888.8,  3582390. ,  1646445.8,   511216.4,  2684899.8,
       23276900. ,  1723199.8,  1085766.4,  3153566.4,  3153566.4,
        2870077.6,  1694366. ,  2375490. ,  1457078.6,  3383900. ,
        1509499.9,  3604800. ,   923788.8,  1739199.8,  1108618.8,
         759798.4,  1644599.9,   994055.3,  1323967.6,  1600478.4,
         873700. ,  1579500. ,  4622500. ,   888788.8,  3602499.4,
        1816988.7,   720980.2,   648950.1,  1992588.8,  1678499.9,
        1807840.2,  1212560.8,  2330084.6,  2684899.8,   997867.6,
         975277.6,  1616279.3,  1881200. ,  1170000. ,  1895077.5,
        1030537.9,  7541000. ,  1363877.6,  2118999.9,  1598899.9,
        1138660.8,  7949288.7,  1243228. ,   502651.3,  1036966.4,
        4669900. ,  3317499.3,  1272000. ,  1712995. ,  2412994.9,
         749812.9,  3067487.8,   927177.5,  4859999. ,   938557.7,
        2858566.5,  1908288.7,   615977.6,  1816150.4,  2458688.8,
        2893800. ,  2324295. ,  2182066.4,  1464800. ,   990813.2,
         662341. ,   936288.8,  2831880. ,  1053266.4,  2433999.9,
         595600.2,  1203499.9,  1305488.8,  2322600. ,  2069713.2,
        1455966. ,  1712995. ,   978589.9,   994277.6,   508982.8,
        4824899.9,  2050988.7,  1094100. ,  1046666.4,  4839999. ,
         417811.6,  1006100. ,  2114990. ,   923771.8,  1846988.7,
        1422690. ,  2717377.6,  5767999. ,  2589590. , 16459244. ,
        1135179.1,   717239.7,   717239.7,   572791.5,  1232336.8,
        1868516.1,  1242336.8,  2196889.9,   990537.9,  1036966.4,
        1748738.6,  3455000. ,  2545500. ,  1953493.8,   936288.8,
        1412638.6,  1305488.8,   945488.4,  2307788.8,   494885. ,
        1205939. ,   983588.7,  1984766.4,   494885. ,  1545567.5,
         545205.2,  2044588.7,   896000. ,  1509316.6,  1839238.7,
        1110888.8,  1751279.3,  2590044.1,  2059244.1,   962783.7,
       11746999.9,  1163723.8,  1012000. ,  1307138.6,  1497966.3,
         999400. ,  1434700. ,  1712995. ,   611224.1,  1658084.6,
         884047.7,  1721542.7,   610902.5,  1002500. ,  3242494.3,
        1751279.3,  1088657.4,  1868516.1,  1456367.4,  2077777.6,
         595244.8,   859625. ,   945537.9,  1877838.7,  1536750.3,
        1938940. ,  1409288.8,  2209428.6,   451400. ,  2532088.7,
        2255977.5,  1657695. ,  2341290. ,  2209200. ,  1036966.4,
        2209200. ,   995488.8,   518897. ,  2940173.4,  4451900. ,
        3604800. ,  1877838.7,  2468990. ,  4621994.9,   669129.9,
        2240490. ,  2343584.6,   998788.7,  1723066.6,  1305149.6,
        1277828. ,   991699.9,  2170779.8,   942600. ,  3567400. ,
        1569935. ,   942861. ,  1192490. ,  2719500. ,  6827988.8,
        1933590. ,  1305488.8,  1038588.8,  2524683.8,  1278449.6,
       19871255.2,   651977.6,  5767999. ,  1472677.5,  1296977.6,
        1088657.4,   893834.4,   624697.1,   635638.5,  1579500. ,
         608100. ,  2458688.8,  1330832.9,  3094900. ,  1845988.7,
        1044499.9,  1192055.2,  2020488.7,   783602.6,  2799990. ,
        1814999.9,  2581178.8,   896000. ,  7977988.8,  2968487.9,
         887678.9,  2513966.5,  2468990. ,  2604090. ,  3036389.8,
        1809838.7,  1625762.7,   514805.2,  1758590. ,  1833999.7,
        1500399.8,  1581399.8,  1792945.1,  7473288.8,  2217783.8,
        1956490. ,   595689. ,  1089428. ,   669198.4,  2748877.6,
         449866.4,  3317499.3,  1520567.5,  5132388.8,  2490490. ,
        2462875. ,  2589590. ,  1479284.2,  1835499.9,  1488677.6,
        2015688.7,  7541000. , 15675244. ,  1088657.4,  1165544. ,
        1130149.8])
```
 
 
Como disponemos de los valores de la respuesta para las observaciones de los predictores con las que hemos predicho la respuesta podemos comparar los valores reales con los predichos a través de una métrica de error como el error cuadratico medio (ECM):
```python
ECM = sum( (knn_regression.predict( X_new )  - Y_new.reset_index().price )**2 ) / len(Y_new)

ECM
```

    2405540681171.826


 

Para reducir la dimension de la cantidad anterior y además lograr que se mida en las mismas unidades que la respuesta tomamos la raiz cuadrada:

```python
np.sqrt(ECM)
```

    1550980.5547368499



 
 

<br>








# KNN  para regresión  programado en `Python` <a class="anchor" id="7"></a>


**Programamos desde "cero" el algoritmo KNN para regresión:**

```python
def KNN_regresion(Distance_Matrix_New_Data , k , X_train, Y_train) :

    # k es el hiper-parametro del algoritmo KNN.

    # 'Distance_Matrix_New_Data' debe contenere las distancias entre las nuevas observaciones de los predictores y las de train.
    # Su fila i-esima debe contener las distancias entre la i-esima nueva observacion de los predictores y las observaciones de train de los predictores.
    
    # X_train tiene que ser un data-frame con las observaciones de los predictores con las que se va a entrenar el modelo.
    
    # Y_train tiene que ser un numpy array que contenga las observaciones de la respuesta con las que se va a entrenar el modelo.


    Y_predict_x_new_i_LIST = []

    for i in range(0, len(Distance_Matrix_New_Data)):

        distancias_x_new_i = pd.DataFrame({'id_x_train': X_train.index  , 'distancias': Distance_Matrix_New_Data[i,:]})

        distancias_x_new_i_sort = distancias_x_new_i.sort_values(by=["distancias"]).reset_index(drop=True)

        knn_x_new_i = distancias_x_new_i_sort.iloc[0:k , :]

        Y_values_knn_x_new_i = []

        
        for j in knn_x_new_i.iloc[:,0]:

            Y_values_knn_x_new_i.append(Y_train[j])


        Y_predict_x_new_i = sum(Y_values_knn_x_new_i)/k    

        Y_predict_x_new_i_LIST.append(Y_predict_x_new_i)

    
    df_predictions = pd.DataFrame({'id_x_new':range(0, len(Distance_Matrix_New_Data)) , 'Y_predict': Y_predict_x_new_i_LIST})

    return df_predictions
```


Probamos el algoritmo con la distancia de Gower y $k=10$ :

```python
X = pd.concat([X_train , X_new])
```

```python
M_Gower = Matrix_Gower_Distance(Data=X.to_numpy(), p1=3, p2=2, p3=1)

M_Gower_new_data = M_Gower[ len(X_train):len(X) , 0:len(X_train) ]  
```


```python
df_predictions = KNN_regresion(Distance_Matrix_New_Data=M_Gower_new_data , k=10 , X_train=X_train, Y_train=Y_train) 
df_predictions
```

```
     id_x_new   Y_predict
0           0   2081499.9
1           1   1710999.9
2           2   2639277.7
3           3   2817500.0
4           4   2839583.6
..        ...         ...
376       376   4778999.9
377       377  12093477.6
378       378   1019720.0
379       379   1260699.9
380       380   1088923.8
```


Calculamos el error cuadrático medio:

```python
ECM = sum( (df_predictions.Y_predict - Y_new.reset_index().price)**2 ) / len(Y_new)

ECM
```

    2694547525120.1924


```python
np.sqrt(ECM)
```

    1641507.6987696989



<br>

Probamos ahora el algoritmo con la distancia Euclidea y $k=10$ :

```python
M_Euclidea = Matrix_Dist_Euclidea(Data=X.to_numpy())

M_Euclidea  = M_Euclidea + M_Euclidea.T

M_Euclidea_new_data = M_Euclidea[ len(X_train):len(X) , 0:len(X_train) ]  
```


```python
df_predictions = KNN_regresion(Distance_Matrix_New_Data=M_Euclidea_new_data , k=10 , X_train=X_train, Y_train=Y_train) 
```

Calculamos el error cuadrático medio:
```python
ECM = sum( (df_predictions.Y_predict - Y_new.reset_index().price)**2 ) / len(Y_new)

ECM
```

    2406009496239.313

 
Como vemos el ECM obtenido es similar al que obteniamos al implementar el algoritmo con `sklearn` , también con la distancia Euclidea y $k=10$


<br>

------

<br>




# Bibliografía

- Grané Chavez, Aurea. (2022). *Análisis Discriminante* [Presentación de PowerPoint]. Aula Global UC3M. $\\[0.4cm]$

- Scikit-learn Developers. KNeighborsClassifier. Scikit-learn.
https://scikit-learn.org/stable/modules/generated/sklearn.neighbors.KNeighborsClassifier.html $\\[0.1cm]$

- Scikit-learn Developers. KNeighborsRegressor. Scikit-learn. 
https://scikit-learn.org/stable/modules/generated/sklearn.neighbors.KNeighborsRegressor.html



<br>

<br>
