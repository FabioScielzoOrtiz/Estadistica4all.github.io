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



# KNN como modelo de clasificación supervisada <a class="anchor" id="1"></a>  


Un modelo de clasificación supervisada  es un modelo estadístico que permite predecir una variable respuesta **categorica** usando para ello información sobre una serie de predictores y de la propia respuesta, es decir, es una modelo que permite resolver un problema de clasificación supervisada.

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


El algoritmo KNN para clasificación supervisada consiste en lo siguiente:


- Se define una medida de distancia  entre pares de observaciones de variables estadisticas $\hspace{0.15cm} \Rightarrow \hspace{0.15cm}$ $\delta (\cdot , \cdot) \\$

 

 
- Dada una nueva observación $\hspace{0.1cm}x_{new}\hspace{0.1cm}$ de los predictores $\hspace{0.1cm}(\mathcal{X}_1 ,...,\mathcal{X}_p)\hspace{0.1cm}$ , es decir, una observación que no está en la muestra de datos $\hspace{0.1cm}D\hspace{0.1cm}$, se calculan las distancias entre el par de observaciones $\hspace{0.1cm}(x_{new} , x_i)$ , para $\hspace{0.1cm}i=1,...,n \\$
 
Aqui no se va a entrar en este asunto, pero $\hspace{0.1cm}D\hspace{0.1cm}$ está jugando el papel de muestra de entrenamiento.
 


- Se seleccionan las $\hspace{0.1cm}k\hspace{0.1cm}$ observaciones   $\hspace{0.1cm}x_1,...,x_n\hspace{0.1cm}$ que son más cercanas a la nueva observación $\hspace{0.1cm}x_{new}$, segun la medida de distancia $\hspace{0.1cm}\delta\hspace{0.1cm}$

El conjunto de estas $\hspace{0.1cm}k\hspace{0.1cm}$ observaciones son los ***k vecinos más cercanos de $\hspace{0.1cm}x_{new}\hspace{0.1cm}$*** y se denota por $\hspace{0.1cm}K(x_{new}) \\$



- Se calcula la frecuencia relativa de cada categoría de la respuesta sobre el conjunto $\hspace{0.1cm}K_{x_{new}}$

Sea $\hspace{0.1cm}P\hspace{0.05cm}[\hspace{0.1cm} K_{x_{new}} \hspace{0.1cm},\hspace{0.1cm} r\hspace{0.1cm}]\hspace{0.1cm}$ la frecuencia relativa (proporción) de observaciones de $\hspace{0.1cm}K_{x_{new}}\hspace{0.1cm}$ tales que $\hspace{0.1cm}\mathcal{Y}=r$

Es decir:

  $$P\hspace{0.05cm}[\hspace{0.1cm} K_{x_{new}} \hspace{0.1cm},\hspace{0.1cm} r \hspace{0.1cm}] \hspace{0.15cm}=\hspace{0.15cm} \dfrac{ \# \hspace{0.1cm}\left\lbrace\hspace{0.1cm} i \hspace{0.13cm}/\hspace{0.13cm} x_i \in K_{x_{new}} \hspace{0.3cm}\text{y}\hspace{0.3cm}  y_i = r \hspace{0.1cm} \right\rbrace  }{\# \hspace{0.1cm} K_{x_{new}} } \hspace{0.15cm}=\hspace{0.15cm} \dfrac{ \# \hspace{0.1cm}\left\lbrace\hspace{0.1cm} i \hspace{0.13cm}/\hspace{0.13cm} x_i \in K_{x_{new}} \hspace{0.3cm}\text{y}\hspace{0.3cm}  y_i = r \hspace{0.1cm} \right\rbrace  }{  k } \\$$



- Para la nueva observación de los predictores $\hspace{0.1cm} x_{new} \hspace{0.1cm}$ se predice la respuesta como la categoria mas frecuente en el conjunto $\hspace{0.1cm}K_{x_{new}}$


Es decir:

$$\hspace{0.6 cm} \text{Si} \hspace{0.4 cm} r^*  \hspace{0.05 cm}= \hspace{0.05 cm}  arg \hspace{0.1 cm} \underset{r}{Max} \hspace{0.15cm} P\hspace{0.05cm}[\hspace{0.1cm} K_{x_{new}} \hspace{0.1cm},\hspace{0.1cm} r \hspace{0.1cm}]  \hspace{0.25cm}  \Rightarrow \hspace{0.25cm} \widehat{y}_{new} = r^* \hspace{0.1cm}$$








<br>


# Modelo KNN de clasificación supervisada aplicado en `Python` con `sklearn`  <a class="anchor" id="3"></a>


 


```python
import pandas as pd
import numpy as np
```



Cargamos los datos con los que vamos a trabajar:

```python
Gender_classification = pd.read_csv('gender_classification.csv')
```

Es un conjunto de datos donde la respuesta es el sexo y los predictores variables biometricas. Este data set es apto para la aplicación de modelos de clasificación supervisada.  

```python
Gender_classification.head()
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
      <th>long_hair</th>
      <th>forehead_width_cm</th>
      <th>forehead_height_cm</th>
      <th>nose_wide</th>
      <th>nose_long</th>
      <th>lips_thin</th>
      <th>distance_nose_to_lip_long</th>
      <th>gender</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>11.8</td>
      <td>6.1</td>
      <td>1</td>
      <td>0</td>
      <td>1</td>
      <td>1</td>
      <td>Male</td>
    </tr>
    <tr>
      <th>1</th>
      <td>0</td>
      <td>14.0</td>
      <td>5.4</td>
      <td>0</td>
      <td>0</td>
      <td>1</td>
      <td>0</td>
      <td>Female</td>
    </tr>
    <tr>
      <th>2</th>
      <td>0</td>
      <td>11.8</td>
      <td>6.3</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>Male</td>
    </tr>
    <tr>
      <th>3</th>
      <td>0</td>
      <td>14.4</td>
      <td>6.1</td>
      <td>0</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>Male</td>
    </tr>
    <tr>
      <th>4</th>
      <td>1</td>
      <td>13.5</td>
      <td>5.9</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>Female</td>
    </tr>
  </tbody>
</table>
</div>


<br>


Recodificamos la respuesta para obtener la codificación estandar:


```python
from sklearn.preprocessing import OrdinalEncoder

ord_enc = OrdinalEncoder()
```


```python
Gender_classification['gender'] = ord_enc.fit_transform(Gender_classification[['gender']])
```

La recodificación aplicada es la siguiente:

Female = 0 , Male = 1



```python
Gender_classification.head()
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
      <th>long_hair</th>
      <th>forehead_width_cm</th>
      <th>forehead_height_cm</th>
      <th>nose_wide</th>
      <th>nose_long</th>
      <th>lips_thin</th>
      <th>distance_nose_to_lip_long</th>
      <th>gender</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>11.8</td>
      <td>6.1</td>
      <td>1</td>
      <td>0</td>
      <td>1</td>
      <td>1</td>
      <td>1.0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>0</td>
      <td>14.0</td>
      <td>5.4</td>
      <td>0</td>
      <td>0</td>
      <td>1</td>
      <td>0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>0</td>
      <td>11.8</td>
      <td>6.3</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1.0</td>
    </tr>
    <tr>
      <th>3</th>
      <td>0</td>
      <td>14.4</td>
      <td>6.1</td>
      <td>0</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1.0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>1</td>
      <td>13.5</td>
      <td>5.9</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0.0</td>
    </tr>
  </tbody>
</table>
</div>



Vemos el type que tienen las variables en `Python`:

```python
Gender_classification.dtypes
```




    long_hair                      int64
    forehead_width_cm            float64
    forehead_height_cm           float64
    nose_wide                      int64
    nose_long                      int64
    lips_thin                      int64
    distance_nose_to_lip_long      int64
    gender                       float64
    dtype: object




<br>

Para aplicar el método de validación simple aleatoria, se divide aleatoriamente el data-set en dos partes, una de train y otra de test:


```python
Gender_classification_Train = Gender_classification.sample(frac=0.8, replace=False, weights=None, random_state=222, axis=None, ignore_index=False)

Gender_classification_Test = Gender_classification.drop( Gender_classification_Train.index , )
```


```python
## TEST

X_test = Gender_classification_Test.loc[: , Gender_classification_Test.columns != 'gender']
Y_test = Gender_classification_Test.loc[: , 'gender']

Data_Test = pd.concat([Y_test , X_test], axis=1)

##################################################################################################

## TRAIN

X_train = Gender_classification_Train.loc[: , Gender_classification_Test.columns != 'gender']
Y_train = Gender_classification_Train.loc[: , 'gender']

Data_Train = pd.concat([Y_train , X_train], axis=1)
```


```python
# Como ejemplo de x_new cogemos la sexta (5 en Python) observación de X_test

x_new = X_test.iloc[ 5 , :]
```

---

<br>

Importamos la libreria `sklearn` y el modulo `NearestNeighbors`


```python
import sklearn

from sklearn.neighbors import NearestNeighbors
```

Podemos ver cuales son los parametros de la función `KNeighborsClassifier` 

```python
sklearn.neighbors.KNeighborsClassifier(n_neighbors=5, *, weights='uniform', algorithm='auto', leaf_size=30, p=2, metric='minkowski', metric_params=None, n_jobs=None) 
```
Se recomienda ver primero la documentación de sklearn:

https://scikit-learn.org/stable/modules/generated/sklearn.neighbors.KNeighborsClassifier.html


Fijamos los parametros que usaremos en la función `KNeighborsClassifier`, entre otros, usaremos K=10 , y la distancia Minkowski con p=2 (equivalente a la Euclidea):

```python
knn_classification = sklearn.neighbors.KNeighborsClassifier(n_neighbors=10 ,  weights='uniform', p=2, metric='minkowski')
```

<br>

Entrenamos el modelo KNN definido en `knn_classification` con la muestra de train de los predictores y la respuesta:

```python
knn_classification.fit(X_train, Y_train)
```

<br>

Predecimos la respuesta para una nueva observación $x_new$ de los predictores (la observación seis de la muestra de test de los predictores):

```python
knn_classification.predict( [x_new] ) 
```

    [1.]
    
<br>

Obtenemos la frecuencia relativa de las categorias (0, 1) de la respuesta en el conjunto $KNN(x_new)$

```python
knn_classification.predict_proba([x_new]) 
```

    [[0. 1.]]
    



<br>

 

## Validación simple con `sklearn`  <a class="anchor" id="3.2"></a>


Entrenamos el modelo con las muestra de train:

```python
knn_classification = sklearn.neighbors.KNeighborsClassifier(n_neighbors=10 ,  weights='uniform', p=2, metric='minkowski')

knn_classification.fit(X_train, Y_train)
```


<br>

Calculamos TEC con la muestra de test:

```python
TEC_sklearn = 1 - knn_classification.score(X_test, Y_test)

TEC_sklearn
```


    0.03700000000000003


<br>

---


Veamos ahora como funciona la función `KNeighborsClassifier` con otras medidas de distancias :


Usando la distancia cityblock:
```python
knn = sklearn.neighbors.KNeighborsClassifier(n_neighbors=10 ,  weights='uniform',  metric='cityblock')
```


```python
knn.fit(X_train, Y_train)

knn.predict( [x_new] ) 
 
knn.predict_proba([x_new])
```

    [1.]
    
    [[0. 1.]]
    



Usando la distancia coseno:

```python
knn = sklearn.neighbors.KNeighborsClassifier(n_neighbors=10 ,  weights='uniform', metric='cosine')
```


```python
knn.fit(X_train, Y_train)

knn.predict( [x_new] )  

knn.predict_proba([x_new]) 
```

    [1.]
    
    [[0. 1.]]
    


Usando la distancia nan_euclidea

```python
knn = sklearn.neighbors.KNeighborsClassifier(n_neighbors=10 ,  weights='uniform', metric='nan_euclidean')
```


```python
knn.fit(X_train, Y_train)

knn.predict( [x_new] )  

knn.predict_proba([x_new]) 
```

    [1.]
    
    [[0. 1.]]
    


Usando la distanchia manhattan:

```python
knn = sklearn.neighbors.KNeighborsClassifier(n_neighbors=10 ,  weights='uniform', metric='manhattan')
```


```python
knn.fit(X_train, Y_train)

knn.predict( [x_new] ) 

knn.predict_proba( [x_new] )
```

    [1.]
    
    [[0. 1.]]
    



<br>



# Modelo KNN de clasificación supervisada con algoritmo de creación propia en `Python` <a class="anchor" id="4"></a>

Vamos a crear una función que replique al algoritmo KNN anterirmente descrito. Este ejercicio es una forma de entender mejor como funciona realmente el algoritmo, y de practicar nuestra programación.




















<br>



# KNN como modelo de regresión  <a class="anchor" id="5"></a>

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


El modelo KNN para regresión se basa en el siguiente algoritmo:


$1. \hspace{0.15cm}$ Se define una medida de distancia  entre pares de observaciones de variables estadisticas $\hspace{0.15cm} \Rightarrow \hspace{0.15cm}$ $\delta (\cdot , \cdot) \\$


 
$2. \hspace{0.15cm}$ Dada una nueva observación $x_{new}$ de los predictores $\hspace{0.1cm}(\mathcal{X}_1 ,...,\mathcal{X}_p)$ , es decir, una observación que no está en la muestra de train, se calculan las distancias entre el par de observaciones $\hspace{0.1cm}(x_{new} , x_i)$ , para $\hspace{0.1cm}i=1,...,n \\$
 



$3. \hspace{0.15cm}$ Se seleccionan las $\hspace{0.1cm}k\hspace{0.1cm}$ observaciones del vector $\hspace{0.1cm}(x_1,...,x_n)\hspace{0.1cm}$ que son más cercanas a la nueva observación $\hspace{0.1cm}x_{new} $

El conjunto de estas $\hspace{0.1cm}k\hspace{0.1cm}$ observaciones se denota por $\hspace{0.1cm}KNN(x_{new}) \\$



$4. \hspace{0.15cm}$ Se predice la respuesta para la nueva observacion $\hspace{0.1cm}x_{new}\hspace{0.1cm}$ como la media de la respuesta en el conjunto $\hspace{0.1cm}KNN(x_{new})$




$$\widehat{y}_{new}  \hspace{0.14cm} = \hspace{0.14cm} \dfrac{1}{ k }\cdot \sum_{  i \hspace{0.05cm} \in\hspace{0.05cm} \mathcal{I} \left[  \hspace{0.08cm} KNN(x_{new}) \hspace{0.08cm} \right]}  y_i$$



Donde: 

$\hspace{0.1cm}\mathcal{I} \left[  \hspace{0.08cm} KNN(x_{new}) \hspace{0.08cm} \right] = \lbrace i = 1,...,n \hspace{0.15cm}  / \hspace{0.15cm}  x_i \in KNN(x_{new}) \rbrace \\$


Otra forma de expresarlo:

Si  $\hspace{0.1cm}Y_{KNN(x_{new})}\hspace{0.1cm}$ es la muestra de la respuesta para los $\hspace{0.1cm}k\hspace{0.1cm}$ individuos asociados al conjunto $\hspace{0.1cm}KNN(x_{new})\hspace{0.1cm}$ , es decir: 

$$Y_{KNN(x_{new})} = (\hspace{0.15cm} y_i \hspace{0.25cm} / \hspace{0.25cm}  i=1,...,n \hspace{0.25cm}  \text{y} \hspace{0.25cm} x_i \in KNN(x_{new})\hspace{0.15cm} )^t$$

Entonces:


$$\widehat{y}_{new} =  \overline{\hspace{0.15cm} Y}_{KNN(x_{new})}$$
 




<br>



# Modleo KNN de  regresión aplicado en `Python` con  `sklearn`<a class="anchor" id="6"></a>


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



# Modelo KNN de regression  con algoritmo de creación propia en `Python` <a class="anchor" id="7"></a>








<br>

# Selección del hiper-parámetro k



En este artículo no mostraremos cómo seleccionar el hiper-parámetro $k$ del modelo KNN, esta cuestión será tratada en otro articulo más genérico sobre ajuste de hiper-parámetros.


<br>

<br>


# Anexo



## Ejemplo de juguete de KNN para clasificación supervisada <a class="anchor" id="2"></a>



- Tamaño muestral: $n=3 \\$



- Predictores: $\hspace{0.15cm} X1 = (10 , 2 , 4)$ , $\hspace{0.15cm} X2 = (20 , 25, 40) \\$


- Observaciones: $\hspace{0.15cm} x_1 =(10,20)$ , $\hspace{0.15cm} x_2=(2,25)$ , $\hspace{0.15cm} x_3=(4,40) \\$



- Respuesta  $\hspace{0.1cm}2$ categories $(0,1)$: $\hspace{0.18cm} Y =( 1 , 1 , 0 ) \\$




- Distancia $\hspace{0.15cm} \Rightarrow \hspace{0.15cm}$  $\delta_{Euclidean} \\$

 

- Nueva observación:  $\hspace{0.15cm} x_{new}=(6, 20) \\$



- Calculamos las distancias:

$\hspace{0.85cm} \delta(x_{new}, x_1)_{Euclidean} = (10-6)^2 + (20-20)^2 = 16$

$\hspace{0.85cm} \delta(x_{new}, x_2)_{Euclidean} = (2-6)^2 + (25-20)^2 = 16 + 25 = 41$

$\hspace{0.85cm} \delta(x_{new}, x_3)_{Euclidean} = (4-6)^2 + (40-20)^2 = 4 + 400 = 404 \\$

 
- Seleccionamos $\hspace{0.05cm} k=2 \hspace{0.05cm}$ vecinos más cercanos $\hspace{0.05cm}x_{new}$ $\hspace{0.2cm}\Rightarrow\hspace{0.215cm}$ $KNN \hspace{0.01cm}=\hspace{0.01cm} \lbrace\hspace{0.1cm} x_1 , x_2 \hspace{0.1cm}\rbrace \\$

 
- Calculamos las proporciones $f^{KNN(x_{new})}$ : 

$\hspace{0.85cm}$ Notese que $\hspace{0.1cm} y_1 = 1 \hspace{0.2cm}$ y $\hspace{0.2cm} y_2 = 1\hspace{0.2cm} \Rightarrow \hspace{0.2cm} f^{knn}_0 =  0/2 = 0\hspace{0.2cm}$ y $\hspace{0.2cm} f^{knn}_1 =  2/2 = 1 \\$

 
- Así que, el algoritmo predice que el valor de la respuesta asociado a la nueva observación es  $\hspace{0.15cm} \hat{y}_{new} = 1$




<br>

------

<br>




# Bibliography

Scikit-learn Developers. KNeighborsClassifier. Scikit-learn. 
https://scikit-learn.org/stable/modules/generated/sklearn.neighbors.KNeighborsClassifier.html

Scikit-learn Developers. KNeighborsRegressor. Scikit-learn. 
https://scikit-learn.org/stable/modules/generated/sklearn.neighbors.KNeighborsRegressor.html

Grané Chavez, Aurea. (2022). *Análisis Discriminante* [Presentación de PowerPoint]. Aula Global UC3M.


<br>

<br>
