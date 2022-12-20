---
title: 'K Nearest Neighbors (KNN)'
author: 'Fabio Scielzo Ortiz'
date: '25/12/22'
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

$\hspace{0.3cm}$ **Si utilizas este artículo, por favor, cítalo:** $\hspace{0.1cm}$ [Fabio Scielzo Ortiz](http://estadistica4all.com/autores/autores.html)


</p>
 
</p></span>
</div>


***Se recomienda abrir el artículo en un ordenador o en una tablet.***
 
 
 
 
 <br>
 
 
# Problema de clasificación supervisada


Un problema de **clasificación supervisada**  es un problema estadistico que consiste en predecir una variable respuesta **categorica** usando para ello **información**   de unas **variables predictoras** y de la propia variable **respuesta**.


<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>

- Tenemos $\hspace{0.1cm}p\hspace{0.1cm}$ predictores  $\hspace{0.1cm}(\mathcal{X}_1 ,...,\mathcal{X}_p)\hspace{0.1cm}$ y una variable respuesta **categorica** $\hspace{0.1cm}\mathcal{Y}\hspace{0.1cm}$ sobre los que disponemos una muestra de datos.


- Tenemos una **muestra** de tamaño $\hspace{0.1cm}n\hspace{0.1cm}$ de los $\hspace{0.1cm}p\hspace{0.1cm}$ **predictores** $\hspace{0.1cm}X_1,...,X_p\hspace{0.1cm}$  y de la **respuesta**.

$\hspace{0.25cm}$ Por tanto tenemos la siguiente matriz de datos: $\\[0.8cm]$

$$D=[X_1,...,X_p, Y]=\begin{pmatrix}
    x_{11}&x_{12}&...&x_{1p}&y_1 \\
    x_{21}&x_{22}&...&x_{2p}&y_2 \\
    ... &...& ...&...&...\\
    x_{n1}&x_{n2}&...&x_{np}&y_n
    \end{pmatrix} = \begin{pmatrix}
    x_{1} & y_1\\
    x_{2}  & y_2\\
     ... & ...\\
     x_{n} & y_n
    \end{pmatrix} \\[1.5cm]$$
    


- La solución estadística al problema de regresión pasa por proponer un modelo o algoritmo que sea capaz usar la información muestral disponible $\hspace{0.1cm}D\hspace{0.1cm}$ de los predictores y la respuesta para predecir los valores de la respuesta para cada vector de observaciones de los predictores que se considere.
 


</p>
 
</p></span>
</div>


<br>



# KNN como algoritmo de clasificación supervisada <a class="anchor" id="1"></a>  


Un algoritmo de clasificación supervisada  es un algoritmo que permite predecir una variable respuesta **categorica** usando para ello información sobre una serie de predictores y de la propia respuesta, es decir, es una modelo que permite resolver un problema de clasificación supervisada.

Como se ha mencionado antes:

- Tenemos $p$ predictores $\hspace{0.1cm}(\mathcal{X}_1 ,...,\mathcal{X}_p)\hspace{0.1cm}$ y una respuesta **categorica** $\hspace{0.1cm}\mathcal{Y} \\$

- La variable respuesta **categorica**  tiene $\hspace{0.1cm}g\hspace{0.1cm}$ categorias , ya que $\hspace{0.1cm}Rango(\mathcal{Y})=\lbrace 0,1,...,g-1 \rbrace \\$

- Tenemos una muestra de tamaño $\hspace{0.1cm}n\hspace{0.1cm}$ de los $\hspace{0.1cm}p\hspace{0.1cm}$ predictores $\hspace{0.1cm}X_1,...,X_p\hspace{0.1cm}$ y de la respuesta  $\hspace{0.1cm}Y \\$

$$D=[X_1,...,X_p,Y]=\begin{pmatrix}
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

    $$\hspace{0.6 cm} \text{Si} \hspace{0.5 cm} r^*  \hspace{0.05 cm}= \hspace{0.05 cm}  arg \hspace{0.15 cm} \underset{r}{Max} \hspace{0.2cm} P\hspace{0.05cm}[\hspace{0.1cm} K_{x_{new}} \hspace{0.1cm},\hspace{0.1cm} r \hspace{0.1cm}]  \hspace{0.3cm}  \Rightarrow \hspace{0.3cm} \widehat{y}_{new} \hspace{0.05 cm}=\hspace{0.05 cm} r^* \hspace{0.1cm}$$


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
Y_train.head()
```
382     2.0
732     1.0
1888    2.0
679     0.0
1004    2.0
Name: quality_recode, dtype: float64




```python
Y_new.head()
```
1     2.0
2     2.0
3     1.0
8     1.0
16    2.0
Name: quality_recode, dtype: float64



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



# KNN  para clasificación supervisada programado desde "cero" con `Python` <a class="anchor" id="4"></a>

Vamos a crear una función que replique el algoritmo KNN para clasificación supervisada que anteriormente fue descrito. Este es un buen ejercicio para entender mejor como funciona realmente el algoritmo, y para practicar nuestra programación.



Primero definimos algunas de las funciones de distancia que usará nuestro algoritmo:


Definimos la distancia Euclidea y la matriz de distancias Euclideas:
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

Definimos la distancia Minkowski y la matriz de distancias Minkowski:
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

Definimos la distancia Canberra y la matriz de distancias Canberra:
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

Definimos la distancia Mahalanobis y la matriz de distancias de Mahalanobis:
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

Definimos la matriz de distancias de Gower:

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

Definimos la función KNN con la que replicamos el algoritmo KNN para clasificación supervisada que hemos expuesto anteriormente:

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

 
<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>

- Tenemos $\hspace{0.1cm} p\hspace{0.1cm}$ predictores $\hspace{0.1cm}(\mathcal{X}_1 ,...,\mathcal{X}_p)\hspace{0.1cm}$ y una respuesta **cuantitativa** $\hspace{0.1cm}\mathcal{Y} \\$



- Tenemos una **muestra** de tamaño $\hspace{0.1cm}n\hspace{0.1cm}$ de los $\hspace{0.1cm}p\hspace{0.1cm}$ predictores $\hspace{0.1cm}X_1,...,X_p\hspace{0.1cm}$ y de la respuesta  $\hspace{0.1cm}Y \\$

$$D=[X_1,...,X_p,Y]=\begin{pmatrix}
    x_{11}&x_{12}&...&x_{1p}& y_1\\
    x_{21}&x_{22}&...&x_{2p} & y_2\\
    ... &...& ...& .... & ...\\
    x_{n1}&x_{n2}&...&x_{np}& y_n
    \end{pmatrix} = \begin{pmatrix}
    x_{1}& y_1\\
    x_{2}& y_2 \\
     ...&... \\
     x_{n} & y_n
    \end{pmatrix} \\[1.5cm]$$



- La solución estadística al problema de regresión pasa por proponer un modelo o algoritmo que sea capaz de usar la información muestral disponible $\hspace{0.1cm}D\hspace{0.1cm}$ de los predictores y la respuesta para predecir los valores de la respuesta para cada vector de observaciones de los predictores que se considere.


</p>
 
</p></span>
</div>

<br>


# KNN como algoritmo de regresión  <a class="anchor" id="5"></a>

Un modelo de regresión es un modelo estadistico que permite predecir una respuesta **cuantitativa** usando para ello información sobre una serie de predictores y de la propia respuesta.

- Tenemos $\hspace{0.1cm} p\hspace{0.1cm}$ predictores $\hspace{0.1cm}(\mathcal{X}_1 ,...,\mathcal{X}_p)\hspace{0.1cm}$ y una respuesta **cuantitativa** $\hspace{0.1cm}\mathcal{Y} \\$

- La variable respuesta **cuantitativa**  tiene $g$ categorias , ya que $\hspace{0.1cm}Rango(\mathcal{Y})=\lbrace 0,1,...,g-1 \rbrace \\$

- Tenemos una muestra de tamaño $n$ de los $p$ predictores $\hspace{0.1cm}X_1,...,X_p\hspace{0.1cm}$ y de la respuesta  $\hspace{0.1cm}Y \\$

$$D=[X_1,...,X_p,Y]=\begin{pmatrix}
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

El algoritmo KNN para regresión tiene los siguientes pasos:


- Se define una medida de distancia  entre pares de observaciones de variables estadisticas $\hspace{0.15cm} \Rightarrow \hspace{0.15cm}$ $\delta (\cdot , \cdot) \\$


 
- Dada una nueva observación $x_{new}$ de los predictores $\hspace{0.1cm}(\mathcal{X}_1 ,...,\mathcal{X}_p)$ , es decir, una observación que no está en la muestra de train, se calculan las distancias entre el par de observaciones $\hspace{0.1cm}(x_{new} , x_i)$ , para $\hspace{0.1cm}i=1,...,n \\$
 



- Se seleccionan las $\hspace{0.1cm}k\hspace{0.1cm}$ observaciones del vector $\hspace{0.1cm}(x_1,...,x_n)\hspace{0.1cm}$ que son más cercanas a la nueva observación $\hspace{0.1cm}x_{new} $

    El conjunto de estas $\hspace{0.1cm}k\hspace{0.1cm}$ observaciones se denota por $\hspace{0.1cm}KNN(x_{new}) \\$



- Se predice la respuesta para la nueva observacion $\hspace{0.1cm}x_{new}\hspace{0.1cm}$ como la media de la respuesta en el conjunto $\hspace{0.1cm}KNN(x_{new})$




    $$\widehat{y}_{new}  \hspace{0.14cm} = \hspace{0.14cm} \dfrac{1}{ k }\cdot \sum_{  i \hspace{0.05cm} \in\hspace{0.05cm} \mathcal{I} \left[  \hspace{0.08cm} KNN(x_{new}) \hspace{0.08cm} \right]}  y_i$$



    Donde: 

    $\hspace{0.1cm}\mathcal{I} \left[  \hspace{0.08cm} KNN(x_{new}) \hspace{0.08cm} \right] = \lbrace i = 1,...,n \hspace{0.15cm}  / \hspace{0.15cm}  x_i \in KNN(x_{new}) \rbrace \\$


    Otra forma de expresarlo:

    Si  $\hspace{0.1cm}Y_{KNN(x_{new})}\hspace{0.1cm}$ es la muestra de la respuesta para los $\hspace{0.1cm}k\hspace{0.1cm}$ individuos asociados al conjunto $\hspace{0.1cm}KNN(x_{new})\hspace{0.1cm}$ , es decir: 

    $$Y_{KNN(x_{new})} = (\hspace{0.15cm} y_i \hspace{0.25cm} / \hspace{0.25cm}  i=1,...,n \hspace{0.25cm}  \text{y} \hspace{0.25cm} x_i \in KNN(x_{new})\hspace{0.15cm} )^t$$

    Entonces:


$$\widehat{y}_{new} =  \overline{\hspace{0.15cm} Y}_{KNN(x_{new})}$$
 
</p>
 
</p></span>
</div>



<br>



# KNN para regresión con `sklearn` <a class="anchor" id="6"></a>


Cargamos los datos con los que vamos a trabajar en esta sección. 
Son datos sobre casas de Dubai, la respuesta será el precio, los predictores caracteristicas de las casas.

```python
House_Price_Regression = pd.read_csv('House_Price_Regression.csv')
```


```python
House_Price_Regression.head()
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
      <th>neighborhood_recode</th>
      <th>latitude</th>
      <th>longitude</th>
      <th>price</th>
      <th>no_of_bedrooms</th>
      <th>no_of_bathrooms</th>
      <th>quality_recode</th>
      <th>maid_room_recode</th>
      <th>unfurnished_recode</th>
      <th>balcony_recode</th>
      <th>...</th>
      <th>private_garden_recode</th>
      <th>private_gym_recode</th>
      <th>private_jacuzzi_recode</th>
      <th>private_pool_recode</th>
      <th>security_recode</th>
      <th>shared_gym_recode</th>
      <th>shared_pool_recode</th>
      <th>shared_spa_recode</th>
      <th>view_of_water_recode</th>
      <th>size_in_m_2</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>46.0</td>
      <td>25.113208</td>
      <td>55.138932</td>
      <td>2700000</td>
      <td>1</td>
      <td>2</td>
      <td>2.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>100.242337</td>
    </tr>
    <tr>
      <th>1</th>
      <td>46.0</td>
      <td>25.106809</td>
      <td>55.151201</td>
      <td>2850000</td>
      <td>2</td>
      <td>2</td>
      <td>2.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>146.972546</td>
    </tr>
    <tr>
      <th>2</th>
      <td>36.0</td>
      <td>25.063302</td>
      <td>55.137728</td>
      <td>1150000</td>
      <td>3</td>
      <td>5</td>
      <td>2.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>181.253753</td>
    </tr>
    <tr>
      <th>3</th>
      <td>11.0</td>
      <td>25.227295</td>
      <td>55.341761</td>
      <td>2850000</td>
      <td>2</td>
      <td>3</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>187.664060</td>
    </tr>
    <tr>
      <th>4</th>
      <td>46.0</td>
      <td>25.114275</td>
      <td>55.139764</td>
      <td>1729200</td>
      <td>0</td>
      <td>1</td>
      <td>2.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>47.101821</td>
    </tr>
  </tbody>
</table>
<p>5 rows × 29 columns</p>
</div>



Hacemos la division aleatoria del data-set original en parte de train y de test, para aplicar validación simple aleatoria:

```python
House_Price_Regression_Train = House_Price_Regression.sample(frac=0.8, replace=False, weights=None, random_state=222, axis=None, ignore_index=False)

House_Price_Regression_Test = House_Price_Regression.drop( House_Price_Regression_Train.index , )
```


```python
House_Price_Regression_Train
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
      <th>neighborhood_recode</th>
      <th>latitude</th>
      <th>longitude</th>
      <th>price</th>
      <th>no_of_bedrooms</th>
      <th>no_of_bathrooms</th>
      <th>quality_recode</th>
      <th>maid_room_recode</th>
      <th>unfurnished_recode</th>
      <th>balcony_recode</th>
      <th>...</th>
      <th>private_garden_recode</th>
      <th>private_gym_recode</th>
      <th>private_jacuzzi_recode</th>
      <th>private_pool_recode</th>
      <th>security_recode</th>
      <th>shared_gym_recode</th>
      <th>shared_pool_recode</th>
      <th>shared_spa_recode</th>
      <th>view_of_water_recode</th>
      <th>size_in_m_2</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>925</th>
      <td>22.0</td>
      <td>25.083483</td>
      <td>55.148688</td>
      <td>3195000</td>
      <td>3</td>
      <td>4</td>
      <td>2.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>233.558142</td>
    </tr>
    <tr>
      <th>1502</th>
      <td>6.0</td>
      <td>25.065872</td>
      <td>55.232983</td>
      <td>430000</td>
      <td>0</td>
      <td>1</td>
      <td>2.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>43.478604</td>
    </tr>
    <tr>
      <th>867</th>
      <td>15.0</td>
      <td>25.191285</td>
      <td>55.275202</td>
      <td>3499900</td>
      <td>3</td>
      <td>3</td>
      <td>2.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>221.016237</td>
    </tr>
    <tr>
      <th>746</th>
      <td>34.0</td>
      <td>25.083858</td>
      <td>55.138714</td>
      <td>8000000</td>
      <td>3</td>
      <td>4</td>
      <td>2.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>240.340061</td>
    </tr>
    <tr>
      <th>729</th>
      <td>37.0</td>
      <td>25.046296</td>
      <td>55.200783</td>
      <td>635356</td>
      <td>1</td>
      <td>2</td>
      <td>3.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>58.435987</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>131</th>
      <td>22.0</td>
      <td>25.073593</td>
      <td>55.137516</td>
      <td>2175000</td>
      <td>2</td>
      <td>3</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>128.670655</td>
    </tr>
    <tr>
      <th>1324</th>
      <td>34.0</td>
      <td>25.072573</td>
      <td>55.131009</td>
      <td>2300000</td>
      <td>2</td>
      <td>3</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>127.277110</td>
    </tr>
    <tr>
      <th>1391</th>
      <td>34.0</td>
      <td>25.079895</td>
      <td>55.134126</td>
      <td>1396000</td>
      <td>1</td>
      <td>2</td>
      <td>2.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>78.874647</td>
    </tr>
    <tr>
      <th>1191</th>
      <td>15.0</td>
      <td>25.191719</td>
      <td>55.270677</td>
      <td>3100000</td>
      <td>3</td>
      <td>5</td>
      <td>2.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>185.341485</td>
    </tr>
    <tr>
      <th>879</th>
      <td>37.0</td>
      <td>25.049772</td>
      <td>55.204243</td>
      <td>835000</td>
      <td>1</td>
      <td>2</td>
      <td>2.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>82.683670</td>
    </tr>
  </tbody>
</table>
<p>1524 rows × 29 columns</p>
</div>




```python
## TEST

X_test = House_Price_Regression_Test.loc[: , House_Price_Regression_Test.columns != 'price']
Y_test = House_Price_Regression_Test.loc[: , 'price']

Data_Test = pd.concat([Y_test , X_test], axis=1)

##################################################################################################

## TRAIN

X_train = House_Price_Regression_Train.loc[: , House_Price_Regression_Train.columns != 'price']
Y_train = House_Price_Regression_Train.loc[: , 'price']

Data_Train = pd.concat([Y_train , X_train], axis=1)
```


```python
# Como ejemplo de x_new cogemos la sexta (5 en python) observacion de X_test

x_new = X_test.iloc[ 8 , :]
```



<br>

Importamos la clase necesaria para aplicar KNN para regresión con `sklearn`




```python
import sklearn

from sklearn.neighbors import NearestNeighbors
```


```python
## sklearn.neighbors.KNeighborsRegressor(n_neighbors=5, weights='uniform', algorithm='auto', leaf_size=30, p=2, metric='minkowski', metric_params=None, n_jobs=None)
```

Para informarse sobre la definición de los parametros se recomienda leer la documentación oficial:

https://scikit-learn.org/stable/modules/generated/sklearn.neighbors.KNeighborsRegressor.html


Definimos un KNN para regresión con K=10 y la distancia Minkowski con p=2 (es decir, la Euclidea):

```python
knn = sklearn.neighbors.KNeighborsRegressor(n_neighbors=10,  weights='uniform', p=2, metric='minkowski')
```

Entrenamos el modelo con muestras de train de los predictores y respuesta:

```python
knn.fit(X_train , Y_train)
```


Predecimos la respuesta para la nueva observación:
```python
knn.predict( [x_new] ) 
```

    [2026203.4]
    


Probamos ahora con otras medidas de distancias:

```python
knn = sklearn.neighbors.KNeighborsRegressor(n_neighbors=10,  weights='uniform', p=5, metric='minkowski')
```


```python
knn.fit(X_train , Y_train)

print( knn.predict( [x_new] ) )
```

    [2026203.4]
    




```python
knn = sklearn.neighbors.KNeighborsRegressor(n_neighbors=10,  weights='uniform', metric='cityblock')
```


```python
knn.fit(X_train , Y_train)

print( knn.predict( [x_new] ) )
```

    [1789314.6]
    




```python
knn = sklearn.neighbors.KNeighborsRegressor(n_neighbors=10,  weights='uniform', metric='cosine')
```


```python
knn.fit(X_train , Y_train)

print( knn.predict( [x_new] ) )
```

    [1750914.6]
    



---


## Validación simple con `sklearn` <a class="anchor" id="6.2"></a>

En este caso `sklearn` no calcula el $ECM$ , sino el $R^2$ , que en el fondo es una función del $ECM$ 


```python
knn_regression = sklearn.neighbors.KNeighborsRegressor(n_neighbors=10,  weights='uniform', p=2, metric='minkowski')

knn_regression.fit(X_train , Y_train)
```






```python
R2_sklearn = knn_regression.score(X_test, Y_test)

R2_sklearn
```




    0.745616988261137





<br>



# KNN  para regresión  programado desde "cero" en `Python` <a class="anchor" id="7"></a>









<br>




<br>

------

<br>




# Bibliografía

- Grané Chavez, Aurea. (2022). *Análisis Discriminante* [Presentación de PowerPoint]. Aula Global UC3M.

- Scikit-learn Developers. KNeighborsClassifier. Scikit-learn.
https://scikit-learn.org/stable/modules/generated/sklearn.neighbors.KNeighborsClassifier.html

- Scikit-learn Developers. KNeighborsRegressor. Scikit-learn. 
https://scikit-learn.org/stable/modules/generated/sklearn.neighbors.KNeighborsRegressor.html



<br>

<br>
