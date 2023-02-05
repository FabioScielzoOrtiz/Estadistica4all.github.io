---
title: 'Algoritmos de ajuste de hiperparámetros'
author: 'Fabio Scielzo Ortiz'
date: '05/02/23'
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

$\hspace{0.5cm}$ Scielzo Ortiz, Fabio. (2023). Algoritmos de ajuste de hiperparámetros. http://estadistica4all.com/Articulos/ajuste_hiperparametros.html


</p>
 
</p></span>
</div>


***Se recomienda abrir el artículo en un ordenador o en una tablet.***
 
 
 
 
 <br>
 
 
 
En un modelo de aprendizaje estadistico un hiper-parámetro es un parámetro del modelo que no es estimado por el propio modelo cuando este es entrenado. Es decir, es un parámetro al que hay que asignarle un valor a priori del entrenamiento del modelo. 
 
Los algoritmos de ajuste de hiper-parámetros son una familia de algoritmos cuyo propósito es seleccionar un valor óptimo (o razonablemente óptimo) para los hiper-parámetros de un modelo dado.

En este artículo nos centraremos en el algoritmo Grid Search (busqueda en rejilla o cuadricula), tanto en su versión determinista como en su versión aleatoria (Random Search).

Grid search puede ser aplicado tanto a modelos de aprendizaje supervisado como a modelos de aprendizaje no supervisado. Pero en este artículo nos centraremos en su aplicación a modelos de aprendizaje supervisado, concretamente usaremos KNN como modelo supervisado para realizar los ejemplos de aplicación. No obstante, es fácilmente extrapolable su aplicación a otros modelos supervisados y también a modelos no supervisados.

Este algoritmo usa a su vez algoritmos y métricas de validación, por ello es muy recomendable leer el artículo que tenemos en el blog sobre [algoritmos de validación para modelos de aprendizaje supervisado](http://estadistica4all.com/Articulos/Algoritmos-de-validacion-cruzada.html). Además, puesto que los ejemplos se ilustraran usando KNN como modelo supervisado de referencia, también es recomendable leer el artículo que tenemos en el blog sobre [KNN](http://estadistica4all.com/Articulos/KNN.html).
 


<br>


# Grid Search - Random Search


Tenemos un modelo de aprendizaje estadístico $\hspace{0.05cm} M \hspace{0.05cm}$, el cual tiene $\hspace{0.1cm}r\hspace{0.1cm}$ hiper-parámetros $\hspace{0.1cm}h_1,...,h_r\hspace{0.1cm}$, cuyos campos de variación son $\hspace{0.1cm}R(h_1),...,R(h_r)\hspace{0.1cm}$, respectivamente. 

Usaremos la notación $\hspace{0.1cm}M(h) = M(h_1,...,h_r)\hspace{0.1cm}$ para denotar al modelo $M$ con vector de hiper-parámetros   $\hspace{0.1cm}h=(h_1,...,h_r)\hspace{0.1cm}$.

Esta notación nos interesa para hacer explicitos los hiper-parámetros que tiene el modelo.

Se define el espacio de búsqueda $\hspace{0.05cm}S\hspace{0.05cm}$ como un subconjunto del conjunto de posibles combinaciones de valores de los hiper-parámetros:


$$S \hspace{0.1cm} \subseteq \hspace{0.1cm} R(h_1)\hspace{0.1cm}\text{x}\dots \text{x}\hspace{0.1cm}R(h_r)$$

<br>


El algoritmo grid search tienen los siguientes pasos:



<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>


- Para cada posible combinación de valores de los hiper-parametros contenida en el espacio de busqueda, es decir, para cada $\hspace{0.1cm}s=(s_1,...,s_r) \in S$

    - Se valida $M(h=s)\hspace{0.1cm}=\hspace{0.1cm}M(h_1=s_1 \hspace{0.05cm} ,..., \hspace{0.05cm} h_r=s_r)\hspace{0.15cm}$ usando algún **algoritmo de validación** de modelos de aprendizaje estadístico (ya sean supervisados o no-supervisados). Con ello se obtiene un valor de una **métrica de validacion** para la combinacion de hiper-parámetros $\hspace{0.1cm} s=(s_1,...,s_r)\\$


- Tras el paso anterior se obtienen $\hspace{0.05cm}\#\hspace{0.05cm} S\hspace{0.05cm}$ valores de la métrica de validación calculada aplicando cierto algoritmo de validación.

    - Si, por ejemplo, tuvieramos un modelo de regresión y la métrica usada fuera el $\hspace{0.1cm}ECM\hspace{0.1cm}$, entonces se obtienen los siguientes valores de la métrica:
    
    $$\Bigl\{  \hspace{0.1cm} ECM \hspace{0.05cm}[ \hspace{0.05cm}  M(h=s) \hspace{0.05cm}]_{test}^* \hspace{0.2cm} : \hspace{0.2cm}  s\in S \hspace{0.1cm}  \Bigl\}\\$$




- Se selecciona el vector de hiper-parámetros $\hspace{0.1cm}s=(s_1,...,s_r) \in S\hspace{0.1cm}$ con el que se obtiene un mejor valor de la métrica de validacion. Si la metrica es de *error*, se selecciona el $\hspace{0.1cm}s\hspace{0.1cm}$ con el que se obtiene *menor* valor de la métrica. Si la métrica es de *acierto*, se seleciona el $\hspace{0.1cm}s\hspace{0.1cm}$ con el que se obtiene *mayor* valor de la metrica. $\\[0.5cm]$

    - Si, por ejemplo, tuvieramos un modelo de regresión y la métrica usado fuera el $\hspace{0.05cm}ECM\hspace{0.05cm}$, que es una métrica de error, entonces el vector de hiper-parámetros seleccionado sería $\hspace{0.1cm}s^*\hspace{0.1cm}$, donde:
 
    $$s^* \hspace{0.12cm}=\hspace{0.12cm} arg\hspace{0.25cm} \underset{s \in S}{Min}\hspace{0.25cm} ECM \hspace{0.05cm}[ \hspace{0.05cm} M(h=s) \hspace{0.05cm} ]_{test}^* \\$$

    - Si, por ejemplo, tuvieramos un modelo de clasificación supervisada y la métrica usado fuera la $\hspace{0.1cm}TAC\hspace{0.1cm}$, que es una métrica de acierto, entonces el vector de hiper-parámetros seleccionado sería $\hspace{0.1cm}s^*\hspace{0.1cm}$, donde:
 
    $$s^* \hspace{0.12cm}=\hspace{0.12cm} arg\hspace{0.25cm} \underset{s \in S}{Max}\hspace{0.25cm} TA\hspace{0.05cm}[ \hspace{0.05cm} M(h=s) \hspace{0.05cm} ]_{test}^*$$


</p>
 
</p></span>
</div>


<br>

**¿ Cómo definir $\hspace{0.1cm}S\hspace{0.1cm}$ ?**

Lo ideal es que $\hspace{0.05cm}S \hspace{0.05cm} = \hspace{0.1cm} R(h_1)\hspace{0.1cm}\text{x}\dots \text{x}\hspace{0.1cm}R(h_r)\hspace{0.1cm}$, pero cuando el número de hiper-parámetros es demasiado alto, o estos tienen campos de variación grandes, esto no es factible en la práctica. Por ello se suelen seguir dos vías más eficientes a nivel computacional, pero menos a nivel estadístico:

- Se toma $\hspace{0.05cm}S\hspace{0.05cm}$ como un subconjunto estricto de  las posibles combinaciones de hiper-parámetros , es decir, $\hspace{0.1cm}S \hspace{0.1cm} \subset \hspace{0.1cm} R(h_1)\hspace{0.1cm}\text{x}\dots \text{x}\hspace{0.1cm}R(h_r)$.

    La definición de $\hspace{0.05cm}S\hspace{0.05cm}$ en este contexto puede ser **determinista**, el usuario define las combinaciones de hiper-parametros que se van a considetar. O bien **aleatoria**, es decir, se escogen aleatoriamente las combinaciones de hiper-parámetros que definirán a $\hspace{0.05cm}S\hspace{0.05cm}$.

    - Si la definición de $\hspace{0.05cm}S\hspace{0.05cm}$ es **aleatoria**, el algoritmo suele denominarse Random Grid Search, o simplemente **Random Search**. $\\[0.35cm]$ 
    
    - Si la definción de  $\hspace{0.05cm}S\hspace{0.05cm}$  es **determinista**, el algoritmo se denomina **Grid search**.


<br>

---

<br>


# Grid Search - Random Search programados en `Python` 

Importamos las librerías que vamos a utilizar en esta sección:


```python
import pandas as pd
import numpy as np
import math
import sklearn
import itertools

from sklearn.utils import resample
from sklearn.neighbors import NearestNeighbors

import seaborn as sns
import matplotlib.pyplot as plt

sns.set(rc={'figure.figsize':(9 , 6)})
sns.set_theme()
```


<br>

Cargamos los datos con los que vamos a trabajar:

```python
Data = pd.read_csv('House_Price_Regression.csv')

Data = Data.loc[:, ['latitude', 'longitude', 'no_of_bathrooms', 'no_of_bedrooms', 'price', 'size_in_m_2', 'balcony_recode', 'private_garden_recode', 'quality_recode']]

Data.head()
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
      <th>no_of_bathrooms</th>
      <th>no_of_bedrooms</th>
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
      <td>2</td>
      <td>1</td>
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
      <td>2</td>
      <td>2</td>
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
      <td>5</td>
      <td>3</td>
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
      <td>3</td>
      <td>2</td>
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
      <td>1</td>
      <td>0</td>
      <td>1729200</td>
      <td>47.101821</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>2.0</td>
    </tr>
  </tbody>
</table>
</div>



<br>



## Algoritmos de validación

A continuación vamos a definir algunos algoritmos de validación que serán usados en esta sección, al construir el algoritmo Grid y Random search en base a ellos. 

Estos programas han sido sacados del artículo [algoritmos de validación para modelos de aprendizaje supervisado](http://estadistica4all.com/Articulos/Algoritmos-de-validacion-cruzada.html), que puede encontrarse en nuestro blog.


Programamos el algoritmo de validación simple aleatoria:

```python
def simple_validation_random(D, k, response, random_seed, metric, model):

    # D --> have to be a pandas data frame.

    # k --> is the proportion of observation of D that define D_train.

    # response --> have to be a string with the name of the response variable.

    # random_seed --> seed to replicate the random process

    N = len(D)

    D_train = D.sample(frac=k, replace=False, random_state=random_seed)

    D_test = D.drop( D_train.index , )

    X_train = D_train.loc[: , D_train.columns != response]
    Y_train = D_train.loc[: , response]

    X_test = D_test.loc[: , D_test.columns != response]
    Y_test = D_test.loc[: , response]

############################################################################

    # Training the model wit train sample

    model.fit(X_train, Y_train)

    # Making predictions with test sample

    Y_predict_test = model.predict( X_test ) 

####################################################################

 # Computing the test metric

    if metric == 'ECM' :  
        
        ECM_test = np.mean( (Y_predict_test - Y_test)**2 )

        return ECM_test

    elif metric == 'TAC' :  
        
        TA_test = np.mean( (Y_predict_test == Y_test) )

        return TA_test
```


<br>

Programamos el algoritmo de validación simple aleatoria repetida:


```python
def repeated_random_simple_validation(D, k, B, response, random_seed, metric, model):

    # D --> have to be a pandas data frame.

    # k --> is the proportion of observation of D that define D_train.

    # B --> number of replications of the random simple validation algorithm

    # response --> have to be a string with the name of the response variable.

    # random_seed --> seed to replicate the random process


    np.random.seed(random_seed)

    ECM_test_list , TA_test_list = [ ] , [ ]

    seed_array = np.random.randint(9999999, size=(B))


    if metric == 'ECM':

        for b in range(0,B) :

            ECM_test_list.append( simple_validation_random(D, k, response, random_seed=seed_array[b], metric=metric, model=model) )


        ECM_test = np.mean(ECM_test_list)    

        return ECM_test 


    elif metric == 'TAC':

        for b in range(0,B) :

            TA_test_list.append( simple_validation_random(D, k, response, random_seed=seed_array[b], metric=metric, model=model) )


        TA_test = np.mean(TA_test_list)    

        return TA_test 
```


<br>

Programamos el algoritmo de validación repeated K-Fold:

```python
def repeated_K_Fold_CV(D, B, K, response, random_seed, metric, model):


    ECM_Repeated_K_Folds_vector , TA_Repeated_K_Folds_vector = [] , []

    np.random.seed(random_seed)


    for b in range(0, B):

        sample = resample(range(0, len(D)), n_samples=len(D), replace=False)

        df_sample = pd.DataFrame({'index': range(0,len(D)) , 'sample':sample})

        
        Q = []

        
        for q in np.arange(0 , 1 + 1/K , 1/K):

            Q.append( np.quantile( range(0, len(D)) , q ).round(0) )



        ECM_K_FOLDS_vector , TA_K_FOLDS_vector = [] , []

        for j in range(0, len(Q)-1):

            X_test = D.loc[df_sample.loc[Q[j]:(math.floor(Q[j+1])-1), 'sample'] , D.columns != response ] 
            Y_test = D.loc[df_sample.loc[Q[j]:(math.floor(Q[j+1])-1), 'sample'] , D.columns == response ]

            X_train = D.loc[ : , D.columns != response ].drop(df_sample.loc[Q[j]:(math.floor(Q[j+1])-1), 'sample'] )
            Y_train = D.loc[ : ,  D.columns == response ].drop(df_sample.loc[Q[j]:(math.floor(Q[j+1])-1), 'sample'])      

            Y_test = Y_test.to_numpy()

        #######################################################################
            
            # Training the model wit train sample

            model.fit(X_train, Y_train)

            # Making predictions with test sample

            Y_predict_test = model.predict( X_test )   

        #######################################################################

            if metric == 'ECM' :  ECM_K_FOLDS_vector.append( np.mean( ( Y_predict_test - Y_test )**2 ) )

            elif metric == 'TAC' :  TA_K_FOLDS_vector.append( np.mean( ( Y_predict_test == Y_test ) ) )

    
    #######################################################################
    
        if metric == 'ECM' : ECM_Repeated_K_Folds_vector.append( np.mean(ECM_K_FOLDS_vector) )

        elif metric == 'TAC' : TA_Repeated_K_Folds_vector.append( np.mean(TA_K_FOLDS_vector) )

##########################################################################################################################

    if metric == 'ECM' :
        
        ECM_Repeated_K_Folds = np.mean(ECM_Repeated_K_Folds_vector)

        return  ECM_Repeated_K_Folds
        

    elif metric == 'TAC' :
        
        TA_Repeated_K_Folds = np.mean(TA_Repeated_K_Folds_vector)

        return  TA_Repeated_K_Folds
    
    
```



<br>

## Grid Search - Random Search


Vamos a programar el algoritmo Grid Search, tanto su versión determinista como su versión random.

Esta función tiene los siguientes parametros:

- Data: conjunto de datos de interés. $\\[0.3cm]$

- Response: nombre de la variable respuesta. $\\[0.3cm]$

- model: nombre del modelo que se va a utilizar. En esta versión, por simplicidad, solo se ha considerado el modelo KNN, por ello los nombres disponibles son 'knn_regression' y 'knn_classification'. $\\[0.3cm]$

- Search_Space: es el espacio de búsqueda para los hiper-parámetros del modelo. $\\[0.3cm]$

- validation: es el nombre del algoritmo de validación que va a utilizar el algoritmo Grid Search. En esta versión hay dos posibles algoritmos de validación disponibles, validación simple aleatoria repetida y repeated K-fold. Los nombres disponibles son 'repeated_random_simple_validation' y 'repeated_K_Fold_CV'. $\\[0.3cm]$

- metric: es el nombre de la métrica de validación que usará el algoritmo. En esta versión, por simplicidad, solo se han considerado dos, el error cuadrático medio para modelos de regresión y la tasa de acierto para modelos de clasificación supervisada. Los nombres dispobles son 'ECM' y 'TAC'. $\\[0.3cm]$

- B y k: son parámetros asociados a la función repeated_random_simple_validation. B es el número de repeticiones y k la proporcion de observaciones de train. Para ver más detalles sobre la función repeated_random_simple_validation, se recomienda, una vez más, leer el artículo sobre [algoritmos de validación para modelos de aprendizaje supervisado](http://estadistica4all.com/Articulos/Algoritmos-de-validacion-cruzada.html). $\\[0.3cm]$


- B y k: son parámetros asociados a la función repeated_K_Fold_CV. B es el número de repeticiones y K el número de folds. Para ver más detalles sobre la función repeated_K_Fold_CV, se recomienda, una vez más, leer el artículo sobre [algoritmos de validación para modelos de aprendizaje supervisado](http://estadistica4all.com/Articulos/Algoritmos-de-validacion-cruzada.html). $\\[0.3cm]$


- random_seed_2: es la semilla aleatoria de la funcion repeated_random_simple_validation. $\\[0.3cm]$


- random_search: es un parámetro que toma como valores 'True' o 'False'. Si es 'True' el algoritmo implementado es Random Search, si es 'False' es Grid Search determinista. $\\[0.3cm]$

- random_seed_1: es la semilla aleatoria de Random Search. $\\[0.3cm]$

- random_samples: es el número de vectores de valores posibles de los hiper-parametros que se van a considerar en Random Search. $\\[0.3cm]$


La función devuelve un data-frame con las distintas combinaciones de hiper-parámetros que han sido evaluadas, y los valores de la métrica de validación que han sido obtenidos para cada una de esas combinaciones. $\\[0.3cm]$

La función con la que se ha  programado el algoritmo es la siguiente:

```python
def Grid_search(Data, Search_Space, response, model, validation, metric, B, k, K, random_seed_2, random_search, random_seed_1, random_samples):

   Grid_Search_Metric_list = []

   hyperparameter_combinations = list( itertools.product(Search_Space[0], Search_Space[1]) )

   if random_search == True : 
      
      hyperparameter_combinations = resample(hyperparameter_combinations, n_samples=random_samples, replace=False, random_state=random_seed_1)
   
   else : 
      
      pass


   if model == 'knn_regression' :

      if validation == 'repeated_random_simple_validation' :

         for h in hyperparameter_combinations :
            
            # Setting the hyperparameters of the model

            knn_regression = sklearn.neighbors.KNeighborsRegressor(n_neighbors=h[0] ,  metric=h[1]) 

            # Applying a validation algorithm on the model  

            Grid_Search_Metric_list.append( repeated_random_simple_validation(Data, k, B, response, random_seed_2, metric, model=knn_regression) )

      #######################################################################   
          
      if validation == 'repeated_K_Fold_CV' :
            
         for h in hyperparameter_combinations :
            
            # Setting the hyperparameters of the model

            knn_regression = sklearn.neighbors.KNeighborsRegressor(n_neighbors=h[0], metric=h[1]) 

            # Applying a validation algorithm on the model  

            Grid_Search_Metric_list.append( repeated_K_Fold_CV(Data, B, K, response, random_seed_2, metric, model=knn_regression) )


####################################################################################

   if model == 'knn_classification' :

      if validation == 'repeated_random_simple_validation' :

         for h in hyperparameter_combinations :
            
            # Setting the hyperparameters of the model

            knn_classification = sklearn.neighbors.KNeighborsClassifier(n_neighbors=h[0],  metric=h[1]) 

            # Applying a validation algorithm on the model  

            Grid_Search_Metric_list.append( repeated_random_simple_validation(Data, k, B, response, random_seed_2, metric, model=knn_classification) )

            #######################################################################   
          
      if validation == 'repeated_K_Fold_CV' :
            
         for h in hyperparameter_combinations :
            
            # Setting the hyperparameters of the model

            knn_classification = sklearn.neighbors.KNeighborsClassifier(n_neighbors=h[0] ,  metric=h[1]) 

            # Applying a validation algorithm on the model  

            Grid_Search_Metric_list.append( repeated_K_Fold_CV(Data, B, K, response, random_seed_2, metric, model=knn_classification) )


####################################################################################

   df = pd.DataFrame({'(k , distance)': hyperparameter_combinations, metric: Grid_Search_Metric_list})

   if metric == 'ECM' :

      df = df.sort_values(by=metric, ascending=True)

   elif metric == 'TAC' :

      df = df.sort_values(by=metric, ascending=False)


   return df
```




<br>

A continuación vamos a realizar diferentes pruebas de la función programada:




- Grid Search para KNN para regresión, siendo range(1,100) el espacio de búsqueda para el hiper-parámetro *k* (nº de vecinos), y  ['euclidean', 'cosine', 'cityblock', 'manhattan'] el espacio de búsqueda para el hiper-parámetro *distancia*, usando el algoritmo de validación simple aleatoria repetida, con B=10 y k=0.75, y la métrica ECM.

```python
Grid_search_1 = Grid_search(Data=Data, Search_Space=[range(1,100) , ['euclidean','cosine','cityblock','manhattan']], response='price', model='knn_regression', validation='repeated_random_simple_validation', metric='ECM', B=10, k=0.75, K='no', random_search=False, random_samples=150, random_seed_1=123, random_seed_2=123)
```
Tiempo de ejecución: 56.8 segundos.






```python
Grid_search_1
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
      <th>(k , distance)</th>
      <th>ECM</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>57</th>
      <td>(15, cosine)</td>
      <td>2.064764e+12</td>
    </tr>
    <tr>
      <th>61</th>
      <td>(16, cosine)</td>
      <td>2.067621e+12</td>
    </tr>
    <tr>
      <th>65</th>
      <td>(17, cosine)</td>
      <td>2.079897e+12</td>
    </tr>
    <tr>
      <th>53</th>
      <td>(14, cosine)</td>
      <td>2.086479e+12</td>
    </tr>
    <tr>
      <th>58</th>
      <td>(15, cityblock)</td>
      <td>2.088501e+12</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>395</th>
      <td>(99, manhattan)</td>
      <td>3.470547e+12</td>
    </tr>
    <tr>
      <th>392</th>
      <td>(99, euclidean)</td>
      <td>3.471920e+12</td>
    </tr>
    <tr>
      <th>1</th>
      <td>(1, cosine)</td>
      <td>3.646170e+12</td>
    </tr>
    <tr>
      <th>2</th>
      <td>(1, cityblock)</td>
      <td>3.677001e+12</td>
    </tr>
    <tr>
      <th>3</th>
      <td>(1, manhattan)</td>
      <td>3.677001e+12</td>
    </tr>
  </tbody>
</table>
<p>396 rows × 2 columns</p>
</div>



 <br>
    

- Grid Search para KNN para clasificación, siendo range(1,100) el espacio de búsqueda para el hiper-parámetro *k* (nº de vecinos), y  ['euclidean','cosine','cityblock','manhattan'] el espacio de búsqueda para el hiper-parámetro *distancia*, usando el algoritmo de validación simple aleatoria repetida, con B=10 y k=0.75, y la métrica TAC.


```python
Grid_search_1_2 = Grid_search(Data=Data, Search_Space=[range(1,100) , ['euclidean','cosine','cityblock','manhattan']], response='quality_recode', model='knn_classification', validation='repeated_random_simple_validation', metric='TAC', B=10, k=0.75, K='no', random_search=False, random_samples=150, random_seed_1=123, random_seed_2=123)
```


```python
Grid_search_1_2
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
      <th>(k , distance)</th>
      <th>TAC</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>210</th>
      <td>(53, cityblock)</td>
      <td>0.595168</td>
    </tr>
    <tr>
      <th>211</th>
      <td>(53, manhattan)</td>
      <td>0.595168</td>
    </tr>
    <tr>
      <th>301</th>
      <td>(76, cosine)</td>
      <td>0.594958</td>
    </tr>
    <tr>
      <th>293</th>
      <td>(74, cosine)</td>
      <td>0.594958</td>
    </tr>
    <tr>
      <th>297</th>
      <td>(75, cosine)</td>
      <td>0.594748</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>12</th>
      <td>(4, euclidean)</td>
      <td>0.483403</td>
    </tr>
    <tr>
      <th>5</th>
      <td>(2, cosine)</td>
      <td>0.429622</td>
    </tr>
    <tr>
      <th>7</th>
      <td>(2, manhattan)</td>
      <td>0.411555</td>
    </tr>
    <tr>
      <th>6</th>
      <td>(2, cityblock)</td>
      <td>0.411555</td>
    </tr>
    <tr>
      <th>4</th>
      <td>(2, euclidean)</td>
      <td>0.401050</td>
    </tr>
  </tbody>
</table>
<p>396 rows × 2 columns</p>
</div>



<br>


- Grid Search para KNN para regresión, siendo range(1,100) el espacio de búsqueda para el hiper-parámetro *k* (nº de vecinos), y  ['euclidean', 'cosine', 'cityblock', 'manhattan'] el espacio de búsqueda para el hiper-parámetro *distancia*, usando el algoritmo de validación simple aleatoria repetida, con B=20 y k=0.75, y la métrica ECM.

```python
Grid_search_2 = Grid_search(Data=Data, Search_Space=[range(1,100) , ['euclidean','cosine','cityblock','manhattan']], response='price', model='knn_regression', validation='repeated_random_simple_validation', metric='ECM', B=20, k=0.75, K='no', random_search=False, random_samples=150, random_seed_1=123, random_seed_2=123)
```

Tiempo de ejecución: 1.57 segundos.


```python
Grid_search_2
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
      <th>(k , distance)</th>
      <th>ECM</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>61</th>
      <td>(16, cosine)</td>
      <td>2.079239e+12</td>
    </tr>
    <tr>
      <th>57</th>
      <td>(15, cosine)</td>
      <td>2.084669e+12</td>
    </tr>
    <tr>
      <th>65</th>
      <td>(17, cosine)</td>
      <td>2.090697e+12</td>
    </tr>
    <tr>
      <th>53</th>
      <td>(14, cosine)</td>
      <td>2.108925e+12</td>
    </tr>
    <tr>
      <th>73</th>
      <td>(19, cosine)</td>
      <td>2.109291e+12</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>391</th>
      <td>(98, manhattan)</td>
      <td>3.700114e+12</td>
    </tr>
    <tr>
      <th>388</th>
      <td>(98, euclidean)</td>
      <td>3.703232e+12</td>
    </tr>
    <tr>
      <th>394</th>
      <td>(99, cityblock)</td>
      <td>3.710922e+12</td>
    </tr>
    <tr>
      <th>395</th>
      <td>(99, manhattan)</td>
      <td>3.710922e+12</td>
    </tr>
    <tr>
      <th>392</th>
      <td>(99, euclidean)</td>
      <td>3.714191e+12</td>
    </tr>
  </tbody>
</table>
<p>396 rows × 2 columns</p>
</div>





<br>


- Grid Search para KNN para clasificación, siendo range(1,100) el espacio de búsqueda para el hiper-parámetro *k* (nº de vecinos), y  ['euclidean', 'cosine', 'cityblock', 'manhattan'] el espacio de búsqueda para el hiper-parámetro *distancia*, usando el algoritmo de validación simple aleatoria repetida, con B=20 y k=0.75, y la métrica TAC.



```python
Grid_search_2_2 = Grid_search(Data=Data, Search_Space=[range(1,100) , ['euclidean','cosine','cityblock','manhattan']], response='quality_recode', model='knn_classification', validation='repeated_random_simple_validation', metric='TAC', B=20, k=0.75, K='no', random_search=False, random_samples=150, random_seed_1=123, random_seed_2=123)
```


```python
Grid_search_2_2
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
      <th>(k , distance)</th>
      <th>TAC</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>369</th>
      <td>(93, cosine)</td>
      <td>0.597689</td>
    </tr>
    <tr>
      <th>349</th>
      <td>(88, cosine)</td>
      <td>0.597689</td>
    </tr>
    <tr>
      <th>321</th>
      <td>(81, cosine)</td>
      <td>0.597689</td>
    </tr>
    <tr>
      <th>345</th>
      <td>(87, cosine)</td>
      <td>0.597689</td>
    </tr>
    <tr>
      <th>325</th>
      <td>(82, cosine)</td>
      <td>0.597584</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>12</th>
      <td>(4, euclidean)</td>
      <td>0.478782</td>
    </tr>
    <tr>
      <th>5</th>
      <td>(2, cosine)</td>
      <td>0.431092</td>
    </tr>
    <tr>
      <th>7</th>
      <td>(2, manhattan)</td>
      <td>0.416071</td>
    </tr>
    <tr>
      <th>6</th>
      <td>(2, cityblock)</td>
      <td>0.416071</td>
    </tr>
    <tr>
      <th>4</th>
      <td>(2, euclidean)</td>
      <td>0.406092</td>
    </tr>
  </tbody>
</table>
<p>396 rows × 2 columns</p>
</div>




 <br>




- Grid Search para KNN para regresión, siendo range(1,200) el espacio de búsqueda para el hiper-parámetro *k* (nº de vecinos), y  ['euclidean', 'cosine', 'cityblock', 'manhattan'] el espacio de búsqueda para el hiper-parámetro *distancia*, usando el algoritmo de validación simple aleatoria repetida, con B=20 y k=0.75, y la métrica ECM.


```python
Grid_search_3 = Grid_search(Data=Data, Search_Space=[range(1,200) , ['euclidean','cosine','cityblock','manhattan']], response='price', model='knn_regression', validation='repeated_random_simple_validation', metric='ECM', B=20, k=0.75, K='no', random_search=False, random_samples=150, random_seed_1=123, random_seed_2=123)
```

Time: 5.3min


```python
Grid_search_3
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
      <th>(k , distance)</th>
      <th>ECM</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>61</th>
      <td>(16, cosine)</td>
      <td>2.079239e+12</td>
    </tr>
    <tr>
      <th>57</th>
      <td>(15, cosine)</td>
      <td>2.084669e+12</td>
    </tr>
    <tr>
      <th>65</th>
      <td>(17, cosine)</td>
      <td>2.090697e+12</td>
    </tr>
    <tr>
      <th>53</th>
      <td>(14, cosine)</td>
      <td>2.108925e+12</td>
    </tr>
    <tr>
      <th>73</th>
      <td>(19, cosine)</td>
      <td>2.109291e+12</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>791</th>
      <td>(198, manhattan)</td>
      <td>4.670408e+12</td>
    </tr>
    <tr>
      <th>788</th>
      <td>(198, euclidean)</td>
      <td>4.672717e+12</td>
    </tr>
    <tr>
      <th>794</th>
      <td>(199, cityblock)</td>
      <td>4.676174e+12</td>
    </tr>
    <tr>
      <th>795</th>
      <td>(199, manhattan)</td>
      <td>4.676174e+12</td>
    </tr>
    <tr>
      <th>792</th>
      <td>(199, euclidean)</td>
      <td>4.678516e+12</td>
    </tr>
  </tbody>
</table>
<p>796 rows × 2 columns</p>
</div>



<br>
 
    
- Grid Search para KNN para clasificación, siendo range(1,200) el espacio de búsqueda para el hiper-parámetro *k* (nº de vecinos), y  ['euclidean', 'cosine', 'cityblock', 'manhattan'] el espacio de búsqueda para el hiper-parámetro *distancia*, usando el algoritmo de validación simple aleatoria repetida, con B=20 y k=0.75, y la métrica TAC.


```python
Grid_search_3_2 = Grid_search(Data=Data, Search_Space=[range(1,200) , ['euclidean','cosine','cityblock','manhattan']], response='quality_recode', model='knn_classification', validation='repeated_random_simple_validation', metric='TAC', B=20, k=0.75, K='no', random_search=False, random_samples=150, random_seed_1=123, random_seed_2=123)
```


```python
Grid_search_3_2
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
      <th>(k , distance)</th>
      <th>TAC</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>349</th>
      <td>(88, cosine)</td>
      <td>0.597689</td>
    </tr>
    <tr>
      <th>369</th>
      <td>(93, cosine)</td>
      <td>0.597689</td>
    </tr>
    <tr>
      <th>321</th>
      <td>(81, cosine)</td>
      <td>0.597689</td>
    </tr>
    <tr>
      <th>345</th>
      <td>(87, cosine)</td>
      <td>0.597689</td>
    </tr>
    <tr>
      <th>301</th>
      <td>(76, cosine)</td>
      <td>0.597584</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>12</th>
      <td>(4, euclidean)</td>
      <td>0.478782</td>
    </tr>
    <tr>
      <th>5</th>
      <td>(2, cosine)</td>
      <td>0.431092</td>
    </tr>
    <tr>
      <th>7</th>
      <td>(2, manhattan)</td>
      <td>0.416071</td>
    </tr>
    <tr>
      <th>6</th>
      <td>(2, cityblock)</td>
      <td>0.416071</td>
    </tr>
    <tr>
      <th>4</th>
      <td>(2, euclidean)</td>
      <td>0.406092</td>
    </tr>
  </tbody>
</table>
<p>796 rows × 2 columns</p>
</div>


 

<br>

- Random Search para KNN para regresión, siendo range(1,200) el espacio de búsqueda para el hiper-parámetro *k* (nº de vecinos), y  ['euclidean', 'cosine', 'cityblock', 'manhattan'] el espacio de búsqueda para el hiper-parámetro *distancia*, usando el algoritmo de validación simple aleatoria repetida, con B=20 y k=0.75, y la métrica ECM, usando random_samples=200.


```python
Grid_search_4 = Grid_search(Data=Data, Search_Space=[range(1,200) , ['euclidean','cosine','cityblock','manhattan']], response='price', model='knn_regression', validation='repeated_random_simple_validation', metric='ECM', B=20, k=0.75, K='no', random_search=True, random_samples=200, random_seed_1=123, random_seed_2=123)
```

Tiempo de ejecución: 1.2 minutos.


```python
Grid_search_4
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
      <th>(k , distance)</th>
      <th>ECM</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>23</th>
      <td>(15, cosine)</td>
      <td>2.084669e+12</td>
    </tr>
    <tr>
      <th>190</th>
      <td>(15, manhattan)</td>
      <td>2.124952e+12</td>
    </tr>
    <tr>
      <th>165</th>
      <td>(17, euclidean)</td>
      <td>2.126173e+12</td>
    </tr>
    <tr>
      <th>47</th>
      <td>(19, cityblock)</td>
      <td>2.128057e+12</td>
    </tr>
    <tr>
      <th>68</th>
      <td>(19, manhattan)</td>
      <td>2.128057e+12</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>128</th>
      <td>(196, cityblock)</td>
      <td>4.657349e+12</td>
    </tr>
    <tr>
      <th>199</th>
      <td>(196, euclidean)</td>
      <td>4.659289e+12</td>
    </tr>
    <tr>
      <th>17</th>
      <td>(198, cityblock)</td>
      <td>4.670408e+12</td>
    </tr>
    <tr>
      <th>142</th>
      <td>(198, manhattan)</td>
      <td>4.670408e+12</td>
    </tr>
    <tr>
      <th>154</th>
      <td>(198, euclidean)</td>
      <td>4.672717e+12</td>
    </tr>
  </tbody>
</table>
<p>200 rows × 2 columns</p>
</div>

 

<br>

 
- Random Search para KNN para clasificación, siendo range(1,200) el espacio de búsqueda para el hiper-parámetro *k* (nº de vecinos), y  ['euclidean', 'cosine', 'cityblock', 'manhattan'] el espacio de búsqueda para el hiper-parámetro *distancia*, usando el algoritmo de validación simple aleatoria repetida, con B=20 y k=0.75, y la métrica TAC, con random_samples=200.
 
 

```python
Grid_search_4_2 = Grid_search(Data=Data, Search_Space=[range(1,200) , ['euclidean','cosine','cityblock','manhattan']], response='quality_recode', model='knn_classification', validation='repeated_random_simple_validation', metric='TAC', B=20, k=0.75, K='no', random_search=True, random_samples=200, random_seed_1=123, random_seed_2=123)
```


```python
Grid_search_4_2
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
      <th>(k , distance)</th>
      <th>TAC</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>125</th>
      <td>(93, cosine)</td>
      <td>0.597689</td>
    </tr>
    <tr>
      <th>167</th>
      <td>(87, cosine)</td>
      <td>0.597689</td>
    </tr>
    <tr>
      <th>73</th>
      <td>(66, euclidean)</td>
      <td>0.597584</td>
    </tr>
    <tr>
      <th>175</th>
      <td>(83, cosine)</td>
      <td>0.597584</td>
    </tr>
    <tr>
      <th>119</th>
      <td>(66, manhattan)</td>
      <td>0.597584</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>160</th>
      <td>(3, cosine)</td>
      <td>0.507983</td>
    </tr>
    <tr>
      <th>91</th>
      <td>(4, cosine)</td>
      <td>0.504727</td>
    </tr>
    <tr>
      <th>78</th>
      <td>(3, manhattan)</td>
      <td>0.488866</td>
    </tr>
    <tr>
      <th>118</th>
      <td>(2, cosine)</td>
      <td>0.431092</td>
    </tr>
    <tr>
      <th>57</th>
      <td>(2, euclidean)</td>
      <td>0.406092</td>
    </tr>
  </tbody>
</table>
<p>200 rows × 2 columns</p>
</div>




<br>

- Grid Search para KNN para regresión, siendo range(1,100) el espacio de búsqueda para el hiper-parámetro *k* (nº de vecinos), y  ['euclidean','cosine','cityblock','manhattan'] el espacio de búsqueda para el hiper-parámetro *distancia*, usando el algoritmo de validación repeated K-Fold, con B=5 y K=10, y la métrica ECM.

```python
Grid_search_5 = Grid_search(Data=Data, Search_Space=[range(1,100) , ['euclidean','cosine','cityblock','manhattan']], response='price', model='knn_regression', validation='repeated_K_Fold_CV', metric='ECM', B=5, k='no', K=10, random_search=False, random_samples=150, random_seed_1=123, random_seed_2=123)
```

Tiempo de ejecución: 4.37 minutos.


```python
Grid_search_5
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
      <th>(k , distance)</th>
      <th>ECM</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>69</th>
      <td>(18, cosine)</td>
      <td>2.213103e+12</td>
    </tr>
    <tr>
      <th>73</th>
      <td>(19, cosine)</td>
      <td>2.213636e+12</td>
    </tr>
    <tr>
      <th>57</th>
      <td>(15, cosine)</td>
      <td>2.215151e+12</td>
    </tr>
    <tr>
      <th>61</th>
      <td>(16, cosine)</td>
      <td>2.221992e+12</td>
    </tr>
    <tr>
      <th>65</th>
      <td>(17, cosine)</td>
      <td>2.222929e+12</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>391</th>
      <td>(98, manhattan)</td>
      <td>4.068432e+12</td>
    </tr>
    <tr>
      <th>388</th>
      <td>(98, euclidean)</td>
      <td>4.072752e+12</td>
    </tr>
    <tr>
      <th>394</th>
      <td>(99, cityblock)</td>
      <td>4.087051e+12</td>
    </tr>
    <tr>
      <th>395</th>
      <td>(99, manhattan)</td>
      <td>4.087051e+12</td>
    </tr>
    <tr>
      <th>392</th>
      <td>(99, euclidean)</td>
      <td>4.093847e+12</td>
    </tr>
  </tbody>
</table>
<p>396 rows × 2 columns</p>
</div>




<br>

- Grid Search para KNN para clasificación, siendo range(1,100) el espacio de búsqueda para el hiper-parámetro *k* (nº de vecinos), y  ['euclidean', 'cosine', 'cityblock', 'manhattan'] el espacio de búsqueda para el hiper-parámetro *distancia*, usando el algoritmo de validación repeated K-Fold, con B=5 y K=10, y la métrica TAC.



```python
Grid_search_5_2 = Grid_search(Data=Data, Search_Space=[range(1,100) , ['euclidean','cosine','cityblock','manhattan']], response='quality_recode', model='knn_classification', validation='repeated_K_Fold_CV', metric='TAC', B=5, k='no', K=10, random_search=False, random_samples=150, random_seed_1=123, random_seed_2=123)
```


```python
Grid_search_5_2
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
      <th>(k , distance)</th>
      <th>TAC</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>395</th>
      <td>(99, manhattan)</td>
      <td>0.601331</td>
    </tr>
    <tr>
      <th>322</th>
      <td>(81, cityblock)</td>
      <td>0.601331</td>
    </tr>
    <tr>
      <th>324</th>
      <td>(82, euclidean)</td>
      <td>0.601331</td>
    </tr>
    <tr>
      <th>326</th>
      <td>(82, cityblock)</td>
      <td>0.601331</td>
    </tr>
    <tr>
      <th>327</th>
      <td>(82, manhattan)</td>
      <td>0.601331</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>1</th>
      <td>(1, cosine)</td>
      <td>0.450732</td>
    </tr>
    <tr>
      <th>5</th>
      <td>(2, cosine)</td>
      <td>0.383782</td>
    </tr>
    <tr>
      <th>6</th>
      <td>(2, cityblock)</td>
      <td>0.375330</td>
    </tr>
    <tr>
      <th>7</th>
      <td>(2, manhattan)</td>
      <td>0.375330</td>
    </tr>
    <tr>
      <th>4</th>
      <td>(2, euclidean)</td>
      <td>0.374087</td>
    </tr>
  </tbody>
</table>
<p>396 rows × 2 columns</p>
</div>



<br>



- Grid Search para KNN para regresión, siendo range(1,100) el espacio de búsqueda para el hiper-parámetro *k* (nº de vecinos), y  ['euclidean', 'cosine', 'cityblock', 'manhattan'] el espacio de búsqueda para el hiper-parámetro *distancia*, usando el algoritmo de validación repeated K-Fold, con B=15 y K=10, y la métrica ECM.




```python
Grid_search_6 = Grid_search(Data=Data, Search_Space=[range(1,100) , ['euclidean','cosine','cityblock','manhattan']], response='price', model='knn_regression', validation='repeated_K_Fold_CV', metric='ECM', B=15, k='no', K=10, random_search=False, random_samples=150, random_seed_1=123, random_seed_2=123)
```

Tiempo de ejecución: 14.35 minutos.


```python
Grid_search_6
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
      <th>(k , distance)</th>
      <th>ECM</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>65</th>
      <td>(17, cosine)</td>
      <td>2.212144e+12</td>
    </tr>
    <tr>
      <th>69</th>
      <td>(18, cosine)</td>
      <td>2.214874e+12</td>
    </tr>
    <tr>
      <th>61</th>
      <td>(16, cosine)</td>
      <td>2.215972e+12</td>
    </tr>
    <tr>
      <th>73</th>
      <td>(19, cosine)</td>
      <td>2.220315e+12</td>
    </tr>
    <tr>
      <th>57</th>
      <td>(15, cosine)</td>
      <td>2.226790e+12</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>390</th>
      <td>(98, cityblock)</td>
      <td>4.082009e+12</td>
    </tr>
    <tr>
      <th>388</th>
      <td>(98, euclidean)</td>
      <td>4.086456e+12</td>
    </tr>
    <tr>
      <th>394</th>
      <td>(99, cityblock)</td>
      <td>4.101063e+12</td>
    </tr>
    <tr>
      <th>395</th>
      <td>(99, manhattan)</td>
      <td>4.101063e+12</td>
    </tr>
    <tr>
      <th>392</th>
      <td>(99, euclidean)</td>
      <td>4.105382e+12</td>
    </tr>
  </tbody>
</table>
<p>396 rows × 2 columns</p>
</div>




<br>

- Grid Search para KNN para clasificación, siendo range(1,100) el espacio de búsqueda para el hiper-parámetro *k* (nº de vecinos), y  ['euclidean', 'cosine', 'cityblock', 'manhattan'] el espacio de búsqueda para el hiper-parámetro *distancia*, usando el algoritmo de validación repeated K-Fold, con B=15 y K=10, y la métrica TAC.



```python
Grid_search_6_2 = Grid_search(Data=Data, Search_Space=[range(1,100) , ['euclidean','cosine','cityblock','manhattan']], response='quality_recode', model='knn_classification', validation='repeated_K_Fold_CV', metric='TAC', B=15, k='no', K=10, random_search=False, random_samples=150, random_seed_1=123, random_seed_2=123)
```


```python
Grid_search_6_2
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
      <th>(k , distance)</th>
      <th>TAC</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>395</th>
      <td>(99, manhattan)</td>
      <td>0.601570</td>
    </tr>
    <tr>
      <th>322</th>
      <td>(81, cityblock)</td>
      <td>0.601570</td>
    </tr>
    <tr>
      <th>324</th>
      <td>(82, euclidean)</td>
      <td>0.601570</td>
    </tr>
    <tr>
      <th>326</th>
      <td>(82, cityblock)</td>
      <td>0.601570</td>
    </tr>
    <tr>
      <th>327</th>
      <td>(82, manhattan)</td>
      <td>0.601570</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>1</th>
      <td>(1, cosine)</td>
      <td>0.451868</td>
    </tr>
    <tr>
      <th>5</th>
      <td>(2, cosine)</td>
      <td>0.383867</td>
    </tr>
    <tr>
      <th>7</th>
      <td>(2, manhattan)</td>
      <td>0.375072</td>
    </tr>
    <tr>
      <th>6</th>
      <td>(2, cityblock)</td>
      <td>0.375072</td>
    </tr>
    <tr>
      <th>4</th>
      <td>(2, euclidean)</td>
      <td>0.373949</td>
    </tr>
  </tbody>
</table>
<p>396 rows × 2 columns</p>
</div>   

<br>


- Random Search para KNN para regresión, siendo range(1,100) el espacio de búsqueda para el hiper-parámetro *k* (nº de vecinos), y  ['euclidean','cosine','cityblock','manhattan'] el espacio de búsqueda para el hiper-parámetro *distancia*, usando el algoritmo de validación repeated K-Fold, con B=15 y K=10, y la métrica ECM, con random_samples=200.

```python
Grid_search_7 = Grid_search(Data=Data, Search_Space=[range(1,100) , ['euclidean','cosine','cityblock','manhattan']], response='price', model='knn_regression', validation='repeated_K_Fold_CV', metric='ECM', B=15, k='no', K=10, random_search=True, random_samples=200, random_seed_1=123, random_seed_2=123)
```

Tiempo de ejecución: 7.29 minutos


```python
Grid_search_7
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
      <th>(k , distance)</th>
      <th>ECM</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>164</th>
      <td>(16, cosine)</td>
      <td>2.215972e+12</td>
    </tr>
    <tr>
      <th>138</th>
      <td>(14, cosine)</td>
      <td>2.241301e+12</td>
    </tr>
    <tr>
      <th>196</th>
      <td>(13, cosine)</td>
      <td>2.245269e+12</td>
    </tr>
    <tr>
      <th>125</th>
      <td>(8, cosine)</td>
      <td>2.246148e+12</td>
    </tr>
    <tr>
      <th>50</th>
      <td>(7, cityblock)</td>
      <td>2.249594e+12</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>36</th>
      <td>(97, euclidean)</td>
      <td>4.069186e+12</td>
    </tr>
    <tr>
      <th>53</th>
      <td>(98, manhattan)</td>
      <td>4.082009e+12</td>
    </tr>
    <tr>
      <th>134</th>
      <td>(99, cityblock)</td>
      <td>4.101063e+12</td>
    </tr>
    <tr>
      <th>130</th>
      <td>(99, manhattan)</td>
      <td>4.101063e+12</td>
    </tr>
    <tr>
      <th>146</th>
      <td>(99, euclidean)</td>
      <td>4.105382e+12</td>
    </tr>
  </tbody>
</table>
<p>200 rows × 2 columns</p>
</div>



<br>

- Random Search para KNN para clasificación, siendo range(1,100) el espacio de búsqueda para el hiper-parámetro *k* (nº de vecinos), y  ['euclidean', 'cosine', 'cityblock', 'manhattan'] el espacio de búsqueda para el hiper-parámetro *distancia*, usando el algoritmo de validación repeated K-Fold, con B=15 y K=10, y la métrica ECM, con random_samples=200.

```python
Grid_search_7_2 = Grid_search(Data=Data, Search_Space=[range(1,100) , ['euclidean','cosine','cityblock','manhattan']], response='quality_recode', model='knn_classification', validation='repeated_K_Fold_CV', metric='TAC', B=15, k='no', K=10, random_search=True, random_samples=200, random_seed_1=123, random_seed_2=123)
```

```python
Grid_search_7_2
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
      <th>(k , distance)</th>
      <th>TAC</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>199</th>
      <td>(83, euclidean)</td>
      <td>0.601570</td>
    </tr>
    <tr>
      <th>160</th>
      <td>(84, euclidean)</td>
      <td>0.601570</td>
    </tr>
    <tr>
      <th>152</th>
      <td>(91, manhattan)</td>
      <td>0.601570</td>
    </tr>
    <tr>
      <th>36</th>
      <td>(97, euclidean)</td>
      <td>0.601570</td>
    </tr>
    <tr>
      <th>37</th>
      <td>(83, cityblock)</td>
      <td>0.601570</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>94</th>
      <td>(1, euclidean)</td>
      <td>0.451919</td>
    </tr>
    <tr>
      <th>121</th>
      <td>(2, cosine)</td>
      <td>0.383867</td>
    </tr>
    <tr>
      <th>82</th>
      <td>(2, cityblock)</td>
      <td>0.375072</td>
    </tr>
    <tr>
      <th>182</th>
      <td>(2, manhattan)</td>
      <td>0.375072</td>
    </tr>
    <tr>
      <th>150</th>
      <td>(2, euclidean)</td>
      <td>0.373949</td>
    </tr>
  </tbody>
</table>
<p>200 rows × 2 columns</p>
</div>


<br>

- Random Search para KNN para regresión, siendo range(1,100) el espacio de búsqueda para el hiper-parámetro *k* (nº de vecinos), y  ['euclidean', 'cosine', 'cityblock', 'manhattan'] el espacio de búsqueda para el hiper-parámetro *distancia*, usando el algoritmo de validación repeated K-Fold, con B=5 y K=10, y la métrica ECM, con random_samples=200.


```python
Grid_search_8 = Grid_search(Data=Data, Search_Space=[range(1,100) , ['euclidean','cosine','cityblock','manhattan']], response='price', model='knn_regression', validation='repeated_K_Fold_CV', metric='ECM', B=5, k='no', K=10, random_search=True, random_samples=200, random_seed_1=123, random_seed_2=123)
```

Tiempo de ejecución: 2.16 minutos.


```python
Grid_search_8
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
      <th>(k , distance)</th>
      <th>ECM</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>164</th>
      <td>(16, cosine)</td>
      <td>2.221992e+12</td>
    </tr>
    <tr>
      <th>138</th>
      <td>(14, cosine)</td>
      <td>2.233684e+12</td>
    </tr>
    <tr>
      <th>196</th>
      <td>(13, cosine)</td>
      <td>2.242026e+12</td>
    </tr>
    <tr>
      <th>106</th>
      <td>(14, manhattan)</td>
      <td>2.251908e+12</td>
    </tr>
    <tr>
      <th>6</th>
      <td>(14, cityblock)</td>
      <td>2.251908e+12</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>36</th>
      <td>(97, euclidean)</td>
      <td>4.056875e+12</td>
    </tr>
    <tr>
      <th>53</th>
      <td>(98, manhattan)</td>
      <td>4.068432e+12</td>
    </tr>
    <tr>
      <th>134</th>
      <td>(99, cityblock)</td>
      <td>4.087051e+12</td>
    </tr>
    <tr>
      <th>130</th>
      <td>(99, manhattan)</td>
      <td>4.087051e+12</td>
    </tr>
    <tr>
      <th>146</th>
      <td>(99, euclidean)</td>
      <td>4.093847e+12</td>
    </tr>
  </tbody>
</table>
<p>200 rows × 2 columns</p>
</div>


<br>

 
- Random Search para KNN para clasificación, siendo range(1,100) el espacio de búsqueda para el hiper-parámetro *k* (nº de vecinos), y  ['euclidean', 'cosine', 'cityblock', 'manhattan'] el espacio de búsqueda para el hiper-parámetro *distancia*, usando el algoritmo de validación repeated K-Fold, con B=15 y K=10, y la métrica TAC, con random_samples=200.

```python
Grid_search_8_2 = Grid_search(Data=Data, Search_Space=[range(1,100) , ['euclidean','cosine','cityblock','manhattan']], response='quality_recode', model='knn_classification', validation='repeated_K_Fold_CV', metric='TAC', B=5, k='no', K=10, random_search=True, random_samples=200, random_seed_1=123, random_seed_2=123)
```

```python
Grid_search_8_2
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
      <th>(k , distance)</th>
      <th>TAC</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>199</th>
      <td>(83, euclidean)</td>
      <td>0.601331</td>
    </tr>
    <tr>
      <th>160</th>
      <td>(84, euclidean)</td>
      <td>0.601331</td>
    </tr>
    <tr>
      <th>155</th>
      <td>(96, cosine)</td>
      <td>0.601331</td>
    </tr>
    <tr>
      <th>36</th>
      <td>(97, euclidean)</td>
      <td>0.601331</td>
    </tr>
    <tr>
      <th>37</th>
      <td>(83, cityblock)</td>
      <td>0.601331</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>94</th>
      <td>(1, euclidean)</td>
      <td>0.451380</td>
    </tr>
    <tr>
      <th>121</th>
      <td>(2, cosine)</td>
      <td>0.383782</td>
    </tr>
    <tr>
      <th>182</th>
      <td>(2, manhattan)</td>
      <td>0.375330</td>
    </tr>
    <tr>
      <th>82</th>
      <td>(2, cityblock)</td>
      <td>0.375330</td>
    </tr>
    <tr>
      <th>150</th>
      <td>(2, euclidean)</td>
      <td>0.374087</td>
    </tr>
  </tbody>
</table>
<p>200 rows × 2 columns</p>
</div>



<br>


- Grid Search para KNN para regresión, siendo range(1,100) el espacio de búsqueda para el hiper-parámetro *k* (nº de vecinos), y  ['euclidean', 'cosine', 'cityblock', 'manhattan'] el espacio de búsqueda para el hiper-parámetro *distancia*, usando el algoritmo de validación repeated K-Fold, con B=1 y K=10, y la métrica ECM.

```python
Grid_search_9 = Grid_search(Data=Data, Search_Space=[range(1,100) , ['euclidean','cosine','cityblock','manhattan']], response='price', model='knn_regression', validation='repeated_K_Fold_CV', metric='ECM', B=1, k='no', K=10, random_search=False, random_samples=200, random_seed_1=123, random_seed_2=123)
```


```python
Grid_search_9
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
      <th>(k , distance)</th>
      <th>ECM</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>30</th>
      <td>(8, cityblock)</td>
      <td>2.149765e+12</td>
    </tr>
    <tr>
      <th>31</th>
      <td>(8, manhattan)</td>
      <td>2.149765e+12</td>
    </tr>
    <tr>
      <th>28</th>
      <td>(8, euclidean)</td>
      <td>2.167357e+12</td>
    </tr>
    <tr>
      <th>69</th>
      <td>(18, cosine)</td>
      <td>2.172008e+12</td>
    </tr>
    <tr>
      <th>33</th>
      <td>(9, cosine)</td>
      <td>2.179763e+12</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>391</th>
      <td>(98, manhattan)</td>
      <td>4.028750e+12</td>
    </tr>
    <tr>
      <th>388</th>
      <td>(98, euclidean)</td>
      <td>4.032013e+12</td>
    </tr>
    <tr>
      <th>394</th>
      <td>(99, cityblock)</td>
      <td>4.048032e+12</td>
    </tr>
    <tr>
      <th>395</th>
      <td>(99, manhattan)</td>
      <td>4.048032e+12</td>
    </tr>
    <tr>
      <th>392</th>
      <td>(99, euclidean)</td>
      <td>4.049301e+12</td>
    </tr>
  </tbody>
</table>
<p>396 rows × 2 columns</p>
</div>


<br>

- Grid Search para KNN para clasificación, siendo range(1,100) el espacio de búsqueda para el hiper-parámetro *k* (nº de vecinos), y  ['euclidean','cosine','cityblock','manhattan'] el espacio de búsqueda para el hiper-parámetro *distancia*, usando el algoritmo de validación repeated K-Fold, con B=1 y K=10, y la métrica TAC.



```python
Grid_search_9_2 = Grid_search(Data=Data, Search_Space=[range(1,100) , ['euclidean','cosine','cityblock','manhattan']], response='quality_recode', model='knn_classification', validation='repeated_K_Fold_CV', metric='TAC', B=1, k='no', K=10, random_search=False, random_samples=200, random_seed_1=123, random_seed_2=123)
```


```python
Grid_search_9_2
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
      <th>(k , distance)</th>
      <th>TAC</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>395</th>
      <td>(99, manhattan)</td>
      <td>0.601334</td>
    </tr>
    <tr>
      <th>327</th>
      <td>(82, manhattan)</td>
      <td>0.601334</td>
    </tr>
    <tr>
      <th>312</th>
      <td>(79, euclidean)</td>
      <td>0.601334</td>
    </tr>
    <tr>
      <th>314</th>
      <td>(79, cityblock)</td>
      <td>0.601334</td>
    </tr>
    <tr>
      <th>315</th>
      <td>(79, manhattan)</td>
      <td>0.601334</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>1</th>
      <td>(1, cosine)</td>
      <td>0.450322</td>
    </tr>
    <tr>
      <th>5</th>
      <td>(2, cosine)</td>
      <td>0.381866</td>
    </tr>
    <tr>
      <th>7</th>
      <td>(2, manhattan)</td>
      <td>0.375512</td>
    </tr>
    <tr>
      <th>6</th>
      <td>(2, cityblock)</td>
      <td>0.375512</td>
    </tr>
    <tr>
      <th>4</th>
      <td>(2, euclidean)</td>
      <td>0.375330</td>
    </tr>
  </tbody>
</table>
<p>396 rows × 2 columns</p>
</div>




 
<br>

## Visualización de resultados


Primero hacemos unas transformaciones necesarias para la visualización gráfica que implementaremos:
```python
Grid_search_1['(k , distance)'] = Grid_search_1['(k , distance)'].astype('str') 
Grid_search_1_2['(k , distance)'] = Grid_search_1_2['(k , distance)'].astype('str')
Grid_search_2['(k , distance)'] = Grid_search_2['(k , distance)'].astype('str') 
Grid_search_2_2['(k , distance)'] = Grid_search_2_2['(k , distance)'].astype('str')
Grid_search_3['(k , distance)'] = Grid_search_3['(k , distance)'].astype('str') 
Grid_search_3_2['(k , distance)'] = Grid_search_3_2['(k , distance)'].astype('str')
Grid_search_4['(k , distance)'] = Grid_search_4['(k , distance)'].astype('str')
Grid_search_4_2['(k , distance)'] = Grid_search_4_2['(k , distance)'].astype('str') 
Grid_search_5['(k , distance)'] = Grid_search_5['(k , distance)'].astype('str') 
Grid_search_5_2['(k , distance)'] = Grid_search_5_2['(k , distance)'].astype('str') 
Grid_search_6['(k , distance)'] = Grid_search_6['(k , distance)'].astype('str') 
Grid_search_6_2['(k , distance)'] = Grid_search_6_2['(k , distance)'].astype('str') 
Grid_search_7['(k , distance)'] = Grid_search_7['(k , distance)'].astype('str')
Grid_search_7_2['(k , distance)'] = Grid_search_7_2['(k , distance)'].astype('str') 
Grid_search_8['(k , distance)'] = Grid_search_8['(k , distance)'].astype('str') 
Grid_search_8_2['(k , distance)'] = Grid_search_8_2['(k , distance)'].astype('str')
Grid_search_9['(k , distance)'] = Grid_search_9['(k , distance)'].astype('str') 
Grid_search_9_2['(k , distance)'] = Grid_search_9_2['(k , distance)'].astype('str') 
```


- Gráfico de los resultados obtenidos con las distintas variantes probadas del algoritmo Grid Search para el ajuste de los hiper-parámetros del modelo KNN para regresión:


```python
fig, ax = plt.subplots()

p1 = sns.lineplot(y="ECM", x ='(k , distance)' , data=Grid_search_1.iloc[0:30 , :], color='red')

plt.title("KNN regression - Grid search - Repeated random simple validation (k=0.75 , B=10)", fontsize=13)

plt.setp(p1.get_xticklabels(), rotation=90)

plt.tight_layout()

fig.savefig('p1_new.jpg', format='jpg', dpi=1200)

plt.show()
```

```python
fig, ax = plt.subplots()

p3 = sns.lineplot(y="ECM", x='(k , distance)' , data=Grid_search_2.iloc[0:30 , :], color='red')

plt.setp(p3.get_xticklabels(), rotation=90)

plt.title("KNN regression - Grid search - Repeated random simple validation (k=0.75 , B=20)", fontsize=13)

plt.tight_layout()

fig.savefig('p2_new.jpg', format='jpg', dpi=1200)
``` 
 
```python
fig, ax = plt.subplots()

p5 = sns.lineplot(y="ECM", x='(k , distance)' , data=Grid_search_3.iloc[0:30, :], color='red')

plt.setp(p5.get_xticklabels(), rotation=90)

plt.title("KNN regression - Grid search - Repeated random simple validation (k=0.75 , B=20)", fontsize=13)

plt.tight_layout()

fig.savefig('p3_new.jpg', format='jpg', dpi=1200)
``` 
 
```python
fig, ax = plt.subplots()

p6 = sns.lineplot(y="ECM", x='(k , distance)' , data=Grid_search_4.iloc[0:30 , :], color='red')

plt.setp(p6.get_xticklabels(), rotation=90)

plt.title("KNN regression - Random search - Repeated random simple validation (k=0.75 , B=20)", fontsize=13)

plt.tight_layout()

fig.savefig('p4_new.jpg', format='jpg', dpi=1200)
```


```python
fig, ax = plt.subplots()

p7 = sns.lineplot(y="ECM", x='(k , distance)' , data=Grid_search_5.iloc[0:30, :], color='red')

plt.setp(p7.get_xticklabels(), rotation=90)

plt.title("KNN regression - Random search - Repeated K Fold (K=10 , B=5)", fontsize=13)

plt.tight_layout()

fig.savefig('p5_new.jpg', format='jpg', dpi=1200)
```

```python
fig, ax = plt.subplots()

p8 = sns.lineplot(y="ECM", x='(k , distance)' , data=Grid_search_6.iloc[0:30, :], color='red')

plt.setp(p8.get_xticklabels(), rotation=90)

plt.title("KNN regression - Grid search - Repeated K Fold (K=10 , B=15)", fontsize=13)

plt.tight_layout()

fig.savefig('p6_new.jpg', format='jpg', dpi=1200)
```
```python
fig, ax = plt.subplots()

p9 = sns.lineplot(y="ECM", x='(k , distance)' , data=Grid_search_7.iloc[0:30 , :], color='red')

plt.setp(p9.get_xticklabels(), rotation=90)

plt.title("KNN regression - Random search - Repeated K Fold (K=10 , B=15)", fontsize=13)

plt.tight_layout()

fig.savefig('p7_new.jpg', format='jpg', dpi=1200)
```
```python
fig, ax = plt.subplots()

p10 = sns.lineplot(y="ECM", x='(k , distance)' , data=Grid_search_8.iloc[0:30, :], color='red')

plt.setp(p10.get_xticklabels(), rotation=90)

plt.title("KNN regression - Random search - Repeated K Fold (K=10 , B=5)", fontsize=13)

plt.tight_layout()

fig.savefig('p8_new.jpg', format='jpg', dpi=1200)
```
```python
fig, ax = plt.subplots()

p11 = sns.lineplot(y="ECM", x='(k , distance)' , data=Grid_search_9.iloc[0:30 , :], color='red')

plt.setp(p11.get_xticklabels(), rotation=90)

plt.title("KNN regression - Random search - Repeated K Fold (K=10 , B=1)", fontsize=13)

plt.tight_layout()

fig.savefig('p9_new.jpg', format='jpg', dpi=1200)
```

<center>

![](p1_new.jpg){width="60%"}

![](p2_new.jpg){width="60%"}

![](p3_new.jpg){width="60%"}

![](p4_new.jpg){width="60%"}

![](p5_new.jpg){width="60%"}

![](p6_new.jpg){width="60%"}

![](p7_new.jpg){width="60%"}

![](p8_new.jpg){width="60%"}

![](p9_new.jpg){width="60%"}

</center>   


Como puede verse, la combinación óptima de hiper-parámetros varía en función de la versión utilizada del algoritmo de ajuste de hiper-parámetros.


<br>

- Gráfico de los resultados obtenidos con las distintas variantes probadas del algoritmo Grid Search para el ajuste de los hiper-parámetros del modelo KNN para clasificación:

```python
fig, ax = plt.subplots()

p2 = sns.lineplot(y="TAC", x='(k , distance)' , data=Grid_search_1_2.iloc[0:30 , :], color='red')

plt.setp(p2.get_xticklabels(), rotation=90)

plt.title("KNN classification - Grid search - Repeated random simple validation (k=0.75 , B=10)", fontsize=13)

plt.tight_layout()

fig.savefig('p1_2_new.jpg', format='jpg', dpi=1200)
```
```python
fig, ax = plt.subplots()

p4 = sns.lineplot(y="TAC", x='(k , distance)' , data=Grid_search_2_2.iloc[0:30 , :], color='red')

plt.setp(p4.get_xticklabels(), rotation=90)

plt.title("KNN classification - Grid search - Repeated random simple validation (k=0.75 , B=20)", fontsize=13)

plt.tight_layout()

fig.savefig('p2_2_new.jpg', format='jpg', dpi=1200)
```


```python
fig, ax = plt.subplots()

p5_2 = sns.lineplot(y="TAC", x='(k , distance)' , data=Grid_search_3_2.iloc[0:30 , :], color='red')

plt.setp(p5_2.get_xticklabels(), rotation=90)

plt.title("KNN classification - Grid search - Repeated random simple validation (k=0.75 , B=20)", fontsize=13)

plt.tight_layout()

fig.savefig('p3_2_new.jpg', format='jpg', dpi=1200)
```
```python
fig, ax = plt.subplots()

p6_2 = sns.lineplot(y="TAC", x='(k , distance)' , data=Grid_search_4_2.iloc[0:30 , :], color='red')

plt.setp(p6_2.get_xticklabels(), rotation=90)

plt.title("KNN classification - Random search - Repeated random simple validation (k=0.75 , B=20)", fontsize=13)

plt.tight_layout()

fig.savefig('p4_2_new.jpg', format='jpg', dpi=1200)
```
```python
fig, ax = plt.subplots()

p7_2 = sns.lineplot(y="TAC", x='(k , distance)' , data=Grid_search_5_2.iloc[0:30, :], color='red')

plt.setp(p7_2.get_xticklabels(), rotation=90)

plt.title("KNN classification - Random search - Repeated K Fold (K=10 , B=5)", fontsize=13)

plt.tight_layout()

fig.savefig('p5_2_new.jpg', format='jpg', dpi=1200)
```
```python
fig, ax = plt.subplots()

p8_2 = sns.lineplot(y="TAC", x='(k , distance)', data=Grid_search_6_2.iloc[0:30, :], color='red')

plt.setp(p8_2.get_xticklabels(), rotation=90)

plt.title("KNN classification - Grid search - Repeated K Fold (K=10 , B=15)", fontsize=13)

plt.tight_layout()

fig.savefig('p6_2_new.jpg', format='jpg', dpi=1200)
```
```python
fig, ax = plt.subplots()

p9_2 = sns.lineplot(y="TAC", x='(k , distance)', data=Grid_search_7_2.iloc[0:30, :], color='red')

plt.setp(p9_2.get_xticklabels(), rotation=90)

plt.title("KNN classification - Random search - Repeated K Fold (K=10 , B=15)", fontsize=13)

plt.tight_layout()

fig.savefig('p7_2_new.jpg', format='jpg', dpi=1200)
```
```python
fig, ax = plt.subplots()

p10_2 = sns.lineplot(y="TAC", x='(k , distance)' , data=Grid_search_8_2.iloc[0:30 , :], color='red')

plt.setp(p10_2.get_xticklabels(), rotation=90)

plt.title("KNN classification - Random search - Repeated K Fold (K=10 , B=5)", fontsize=13)

plt.tight_layout()

fig.savefig('p8_2_new.jpg', format='jpg', dpi=1200)
```
```python
fig, ax = plt.subplots()

p11_2 = sns.lineplot(y="TAC", x='(k , distance)' , data=Grid_search_9_2.iloc[0:30, :], color='red')

plt.setp(p11_2.get_xticklabels(), rotation=90)

plt.title("KNN classification - Random search - Repeated K Fold (K=10 , B=1)", fontsize=13)

plt.tight_layout()

fig.savefig('p9_2_new.jpg', format='jpg', dpi=1200)
```




<center>

![](p1_2_new.jpg){width="60%"}

![](p2_2_new.jpg){width="60%"}

![](p3_2_new.jpg){width="60%"}

![](p4_2_new.jpg){width="60%"}

![](p5_2_new.jpg){width="60%"}

![](p6_2_new.jpg){width="60%"}

![](p7_2_new.jpg){width="60%"}

![](p8_2_new.jpg){width="60%"}

![](p9_2_new.jpg){width="60%"}

</center> 


Como ocurría en el caso anterior, la combinación óptima de hiper-parámetros varía en función de la versión utilizada del algoritmo de ajuste de hiper-parámetros. 

Cabe destacar que en los últimos casos, las 30 combinaciones de hiper-parámetros representadas tienen el mismo valor de la métrica TAC, que es además el máximo alcanzado, por tanto son todas igual de óptimas, en el contexto de la variante del algoritmo empleada.


<br>

---

<br>

# Ajuste de hiperparámetros con `sklearn`
 
## Grid search con `sklearn`
     

La función que vamos a utilizar para aplicar el algoritmo de ajuste de hiper-parámetros Grid Search es `GridSearchCV`, de la libreria `sklearn`.

Esta función tiene, entre otros, los siguientes parámetros:


- estimator: es el modelo que cuyos hiper-parámetros quieren ajustarse. $\\[0.3cm]$

- param_grid: es un diccionario con los valores considerados para cada uno de los hiper-parámetros del modelo. $\\[0.3cm]$

- cv: esta función utiliza como algoritmo de validación el K-Fold. cv es el parámetro K, es decir, el número de folds. $\\[0.3cm]$

- scoring: es la métrica de validación que usará el algoritmo. $\\[0.3cm]$



Importamos la función `GridSearchCV`:

```python
from sklearn.model_selection import GridSearchCV
```


En este primer ejemplo vamos a utilizar como modelo el KNN para *regresión*.

```python
knn_regression = sklearn.neighbors.KNeighborsRegressor( )
```


Inicializamos la función `GridSearchCV` con los siguientes parametros:

```python
grid_search = GridSearchCV(estimator = knn_regression, param_grid = {'n_neighbors': range(1,200), 'metric': ['euclidean','cosine','cityblock','manhattan']}, cv = 10, scoring='neg_mean_squared_error')
```

Creamos un array con la variable respuesta, que en este caso es *price*, y un data-frame con los predictores, que serán el resto de variables del data-set con el que estamos trabajando:

```python
Y = Data.loc[:,'price']

X = Data.loc[:, Data.columns != 'price']
```


Ajustamos la función `GridSearchCV` con los datos de `Y` y `X` usando el método `fit` 

```python
grid_search.fit(X,Y)
```
 
Podemos acceder a alguna información relevante tras ajustar la función con los datos.



La combinación de hiper-parámetros óptimos:


```python
grid_search.best_params_
```




    {'metric': 'cosine', 'n_neighbors': 17}


El valor de la métrica que se ha considerado para esa combinación de hiper-parámetros óptimos:

```python
grid_search.best_score_
```

    -2278523570223.8994






Podemos crear un data-frame con las distintas combinaciones de valores de los hiper-parámetros que han sido utilizadas y el valor de la métrica de validación que se ha obtenido para cada una de esas combinaciones. Esto es justamente lo que nos devolvía nuestra función programada en la sección anterior.

```python
df_grid_search_sklearn = pd.DataFrame({'k': grid_search.cv_results_['param_n_neighbors'], 'distance': grid_search.cv_results_['param_metric'] , 'ECM': - grid_search.cv_results_['mean_test_score']})

df_grid_search_sklearn = df_grid_search_sklearn.sort_values(by='ECM', ascending=True)

df_grid_search_sklearn
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
      <th>k</th>
      <th>distance</th>
      <th>ECM</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>215</th>
      <td>17</td>
      <td>cosine</td>
      <td>2.278524e+12</td>
    </tr>
    <tr>
      <th>209</th>
      <td>11</td>
      <td>cosine</td>
      <td>2.287579e+12</td>
    </tr>
    <tr>
      <th>214</th>
      <td>16</td>
      <td>cosine</td>
      <td>2.300468e+12</td>
    </tr>
    <tr>
      <th>216</th>
      <td>18</td>
      <td>cosine</td>
      <td>2.305225e+12</td>
    </tr>
    <tr>
      <th>210</th>
      <td>12</td>
      <td>cosine</td>
      <td>2.308334e+12</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>794</th>
      <td>198</td>
      <td>manhattan</td>
      <td>5.264590e+12</td>
    </tr>
    <tr>
      <th>197</th>
      <td>198</td>
      <td>euclidean</td>
      <td>5.266036e+12</td>
    </tr>
    <tr>
      <th>198</th>
      <td>199</td>
      <td>euclidean</td>
      <td>5.272047e+12</td>
    </tr>
    <tr>
      <th>596</th>
      <td>199</td>
      <td>cityblock</td>
      <td>5.273960e+12</td>
    </tr>
    <tr>
      <th>795</th>
      <td>199</td>
      <td>manhattan</td>
      <td>5.273960e+12</td>
    </tr>
  </tbody>
</table>
<p>796 rows × 3 columns</p>
</div>



Realizamos algunos cambios orientados a una mejor visualización gráfica posterior.

```python
df_grid_search_sklearn['k'] = df_grid_search_sklearn['k'].astype(str) 

df_grid_search_sklearn['distance'] = df_grid_search_sklearn['distance'].astype(str)

df_grid_search_sklearn['k-distance'] = df_grid_search_sklearn[['k', 'distance']].agg('-'.join, axis=1)
```


<br>


Ahora vamos a aplicar la función `GridSearchCV` al modelo KNN para clasificación.


```python
knn_classification = sklearn.neighbors.KNeighborsClassifier( )
```

Inicializamos los parámetros de la función `GridSearchCV`:

```python
grid_search = GridSearchCV(estimator = knn_classification, param_grid = {'n_neighbors': range(1,200), 'metric': ['euclidean','cosine','cityblock','manhattan']}, cv = 10, scoring='accuracy')
```

Creamos un array con la variable respuesta, que en este caso es *quality_recode*, y un data-frame con los predictores, que serán el resto de variables del data-set con el que estamos trabajando:

```python
Y = Data.loc[:,'quality_recode']

X = Data.loc[:, Data.columns != 'quality_recode']
```

 
Podemos acceder a alguna información relevante tras ajustar la función con los datos.



La combinación de hiper-parámetros óptimos:

```python
grid_search.fit(X,Y)
```



 
```python
grid_search.best_estimator_
```

 
    {'metric': 'euclidean', 'n_neighbors': 34}


El valor de la métrica que se ha considerado para esa combinación de hiper-parámetros óptimos:

```python
grid_search.best_params_
```


    0.6036731882061174



Podemos crear un data-frame con las distintas combinaciones de valores de los hiper-parámetros que han sido utilizadas y el valor de la métrica de validación que se ha obtenido para cada una de esas combinaciones. Esto es justamente lo que nos devolvía nuestra función programada en la sección anterior.

```python
df_grid_search_sklearn = pd.DataFrame({'k': grid_search.cv_results_['param_n_neighbors'], 'distance': grid_search.cv_results_['param_metric'] , 'TAC': grid_search.cv_results_['mean_test_score']})

df_grid_search_sklearn = df_grid_search_sklearn.sort_values(by='TAC', ascending=False)

df_grid_search_sklearn
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
      <th>k</th>
      <th>distance</th>
      <th>TAC</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>33</th>
      <td>34</td>
      <td>euclidean</td>
      <td>0.603673</td>
    </tr>
    <tr>
      <th>160</th>
      <td>161</td>
      <td>euclidean</td>
      <td>0.601573</td>
    </tr>
    <tr>
      <th>158</th>
      <td>159</td>
      <td>euclidean</td>
      <td>0.601573</td>
    </tr>
    <tr>
      <th>157</th>
      <td>158</td>
      <td>euclidean</td>
      <td>0.601573</td>
    </tr>
    <tr>
      <th>156</th>
      <td>157</td>
      <td>euclidean</td>
      <td>0.601573</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>600</th>
      <td>4</td>
      <td>manhattan</td>
      <td>0.460890</td>
    </tr>
    <tr>
      <th>200</th>
      <td>2</td>
      <td>cosine</td>
      <td>0.410485</td>
    </tr>
    <tr>
      <th>598</th>
      <td>2</td>
      <td>manhattan</td>
      <td>0.394762</td>
    </tr>
    <tr>
      <th>399</th>
      <td>2</td>
      <td>cityblock</td>
      <td>0.394762</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>euclidean</td>
      <td>0.384260</td>
    </tr>
  </tbody>
</table>
<p>796 rows × 3 columns</p>
</div>



Hacemos algunos cambios orientados a una mejor visualización gráfica posterior:

```python
df_grid_search_sklearn['k'] = df_grid_search_sklearn['k'].astype(str) 

df_grid_search_sklearn['distance'] = df_grid_search_sklearn['distance'].astype(str)

df_grid_search_sklearn['k-distance'] = df_grid_search_sklearn[['k', 'distance']].agg('-'.join, axis=1)
```




<br>


## Random search con `sklearn`

La función que vamos a utilizar para aplicar el algoritmo de ajuste de hiper-parámetros Grid Search es `RandomizedSearchCV`, de la libreria `sklearn`.

Esta función tiene, entre otros, los siguientes parámetros:


- estimator: es el modelo que cuyos hiper-parámetros quieren ajustarse. $\\[0.3cm]$

- param_distributions: es un diccionario con los valores considerados para cada uno de los hiper-parámetros del modelo. $\\[0.3cm]$

- cv: esta función utiliza como algoritmo de validación el K-Fold. cv es el parámetro K, es decir, el número de folds. $\\[0.3cm]$

- scoring: es la métrica de validación que usará el algoritmo. $\\[0.3cm]$

- n_iter: es el número de combinaciones de hiper-paramétros que se van a seleccionar aleatoriamente. $\\[0.3cm]$

- random_state: es la semilla aleatoria de la parte aleatoria que tiene el algoritmo Random Search. $\\[0.3cm]$



Importamos la función `RandomizedSearchCV` de la librería `sklearn`:

```python
from sklearn.model_selection import RandomizedSearchCV
```

Inicializamos algunos parámetros de la función `RandomizedSearchCV`:

```python
random_search = RandomizedSearchCV(estimator = knn_regression, param_distributions = {'n_neighbors': range(1,200), 'metric': ['euclidean','cosine','cityblock','manhattan']}, cv = 10, n_iter=100, random_state=123, scoring='neg_mean_squared_error')
```

Creamos un array con la variable respuesta, que en este caso es *price*, y un data-frame con los predictores, que serán el resto de variables del data-set con el que estamos trabajando:

```python
Y = Data.loc[:,'price']

X = Data.loc[:, Data.columns != 'price']
``` 

Entrenamos la función `RandomizedSearchCV` con los datos : 

```python
random_search.fit(X,Y)
```

Podemos crear un data-frame con las distintas combinaciones de valores de los hiper-parámetros que han sido utilizadas y el valor de la métrica de validación que se ha obtenido para cada una de esas combinaciones. Esto es justamente lo que nos devolvía nuestra función programada en la sección anterior.
 

```python
df_random_search_sklearn = pd.DataFrame({'k': random_search.cv_results_['param_n_neighbors'], 'distance': random_search.cv_results_['param_metric'] , 'ECM': - random_search.cv_results_['mean_test_score']})

df_random_search_sklearn = df_random_search_sklearn.sort_values(by='ECM', ascending=True)
df_random_search_sklearn
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
      <th>k</th>
      <th>distance</th>
      <th>ECM</th>
      <th>k-distance</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>18</th>
      <td>11</td>
      <td>cosine</td>
      <td>2.287579e+12</td>
      <td>11-cosine</td>
    </tr>
    <tr>
      <th>38</th>
      <td>11</td>
      <td>manhattan</td>
      <td>2.321534e+12</td>
      <td>11-manhattan</td>
    </tr>
    <tr>
      <th>91</th>
      <td>14</td>
      <td>euclidean</td>
      <td>2.334281e+12</td>
      <td>14-euclidean</td>
    </tr>
    <tr>
      <th>84</th>
      <td>19</td>
      <td>cosine</td>
      <td>2.337300e+12</td>
      <td>19-cosine</td>
    </tr>
    <tr>
      <th>78</th>
      <td>12</td>
      <td>euclidean</td>
      <td>2.339571e+12</td>
      <td>12-euclidean</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>60</th>
      <td>189</td>
      <td>cityblock</td>
      <td>5.180324e+12</td>
      <td>189-cityblock</td>
    </tr>
    <tr>
      <th>43</th>
      <td>189</td>
      <td>euclidean</td>
      <td>5.182189e+12</td>
      <td>189-euclidean</td>
    </tr>
    <tr>
      <th>46</th>
      <td>190</td>
      <td>cityblock</td>
      <td>5.187852e+12</td>
      <td>190-cityblock</td>
    </tr>
    <tr>
      <th>17</th>
      <td>194</td>
      <td>manhattan</td>
      <td>5.227831e+12</td>
      <td>194-manhattan</td>
    </tr>
    <tr>
      <th>27</th>
      <td>196</td>
      <td>euclidean</td>
      <td>5.247368e+12</td>
      <td>196-euclidean</td>
    </tr>
  </tbody>
</table>
<p>100 rows × 4 columns</p>
</div>




Realizamos cambios para una posterior mejor visualización gráfica:

```python
df_random_search_sklearn['k'] = df_random_search_sklearn['k'].astype(str) 

df_random_search_sklearn['distance'] = df_random_search_sklearn['distance'].astype(str)

df_random_search_sklearn['k-distance'] = df_random_search_sklearn[['k', 'distance']].agg('-'.join, axis=1)
```

 
<br>


Ahora vamos a aplicar la función `RandomizedSearchCV` al modelo KNN para clasificación.

Inicializamos algunos parámetros de la función `RandomizedSearchCV`: 

```python
random_search = RandomizedSearchCV(estimator = knn_classification, param_distributions = {'n_neighbors': range(1,200), 'metric': ['euclidean','cosine','cityblock','manhattan']}, cv = 10, n_iter=100, random_state=123, scoring='accuracy')
```


Creamos un array con la variable respuesta, que en este caso es *quality_recode*, y un data-frame con los predictores, que serán el resto de variables del data-set con el que estamos trabajando:

```python
Y = Data.loc[:,'quality_recode']

X = Data.loc[:, Data.columns != 'quality_recode']
``` 


Entrenamos la función con los datos:
```python
random_search.fit(X,Y)
```


Podemos crear un data-frame con las distintas combinaciones de valores de los hiper-parámetros que han sido utilizadas y el valor de la métrica de validación que se ha obtenido para cada una de esas combinaciones. Esto es justamente lo que nos devolvía nuestra función programada en la sección anterior.
 
```python
df_random_search_sklearn = pd.DataFrame({'k': random_search.cv_results_['param_n_neighbors'], 'distance': random_search.cv_results_['param_metric'] , 'TAC': random_search.cv_results_['mean_test_score']})

df_random_search_sklearn = df_random_search_sklearn.sort_values(by='TAC', ascending=False)
df_random_search_sklearn
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
      <th>k</th>
      <th>distance</th>
      <th>TAC</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>50</th>
      <td>101</td>
      <td>cityblock</td>
      <td>0.601573</td>
    </tr>
    <tr>
      <th>69</th>
      <td>92</td>
      <td>euclidean</td>
      <td>0.601573</td>
    </tr>
    <tr>
      <th>32</th>
      <td>156</td>
      <td>cityblock</td>
      <td>0.601573</td>
    </tr>
    <tr>
      <th>33</th>
      <td>173</td>
      <td>euclidean</td>
      <td>0.601573</td>
    </tr>
    <tr>
      <th>80</th>
      <td>97</td>
      <td>manhattan</td>
      <td>0.601573</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>57</th>
      <td>5</td>
      <td>euclidean</td>
      <td>0.517093</td>
    </tr>
    <tr>
      <th>70</th>
      <td>5</td>
      <td>cosine</td>
      <td>0.515999</td>
    </tr>
    <tr>
      <th>14</th>
      <td>4</td>
      <td>cosine</td>
      <td>0.482937</td>
    </tr>
    <tr>
      <th>4</th>
      <td>4</td>
      <td>manhattan</td>
      <td>0.460890</td>
    </tr>
    <tr>
      <th>94</th>
      <td>2</td>
      <td>cosine</td>
      <td>0.410485</td>
    </tr>
  </tbody>
</table>
<p>100 rows × 3 columns</p>
</div>



Realizamos algunos cambios orientados a una mejor visualización gráfica posterior:
```python
df_random_search_sklearn['k'] = df_random_search_sklearn['k'].astype(str) 

df_random_search_sklearn['distance'] = df_random_search_sklearn['distance'].astype(str)


df_random_search_sklearn['k-distance'] = df_random_search_sklearn[['k', 'distance']].agg('-'.join, axis=1)
```

<br>

## Visualización de resultados

Vamos a visualizar los resultados obtenidos aplicando las funciones  `GridSearchCV`  y  `RandomizedSearchCV` al modelo KNN para regresión:


```python
fig, axs = plt.subplots()

p1 = sns.lineplot(y="ECM", x='k-distance' , data=df_grid_search_sklearn.iloc[0:30, :], color='red')

plt.setp(p1.get_xticklabels(), rotation=90)

p1.title.set_text('KNN regression - Grid search - K fold (K=10)')

fig.savefig('pp1.jpg', format='jpg', dpi=1200)

plt.show()
```

```python
fig, axs = plt.subplots()

p2 = sns.lineplot(y="ECM", x='k-distance' , data=df_random_search_sklearn.iloc[0:30, :], color='red')

plt.setp(p2.get_xticklabels(), rotation=90)

p2.title.set_text('KNN regression - Random search - K fold (K=10)')

fig.savefig('pp2.jpg', format='jpg', dpi=1200)

plt.show()
```

<center>

![](pp1.jpg){width="60%"}

![](pp2.jpg){width="60%"}

</center> 


Como puede verse, la combinación óptima de hiper-parámetros varía en función de la versión utilizada del algoritmo de ajuste de hiper-parámetros.

<br>



Ahora vamos a visualizar los resultados obtenidos aplicando las funciones  `GridSearchCV`  y  `RandomizedSearchCV` al modelo KNN para clasificación:

```python
fig, axs = plt.subplots()

p1 = sns.lineplot(y="TAC", x='k-distance' , data=df_grid_search_sklearn.iloc[0:30, :], color='red')

plt.setp(p1.get_xticklabels(), rotation=90)

p1.title.set_text('KNN classification - Grid search - K fold (K=10)')

fig.savefig('pp3.jpg', format='jpg', dpi=1200)

plt.show()
```
```python
fig, axs = plt.subplots()

p2 = sns.lineplot(y="TAC", x='k-distance' , data=df_random_search_sklearn.iloc[0:30, :], color='red')

plt.setp(p2.get_xticklabels(), rotation=90)

p2.title.set_text('KNN classification - Random search - K fold (K=10)')

fig.savefig('pp4.jpg', format='jpg', dpi=1200)

plt.show()
```

    
     
<center>

![](pp3.jpg){width="60%"}

![](pp4.jpg){width="60%"}

</center> 



La combinación óptima de hiper-parámetros varía en función de la versión utilizada del algoritmo de ajuste de hiper-parámetros. 

Cabe destacar que en el segundo caso, las 30 combinaciones de hiper-parámetros representadas tienen el mismo valor de la métrica TAC, que es además el máximo alcanzado, por tanto son todas igual de óptimas.


 


<br>

---

<br>



# Bibliografía <a class="anchor" id="1"></a> 


- Aler Mur, Ricardo. (2022). *Metodología: evaluación de modelos.* [Presentación de PowerPoint]. Aula Global UC3M. $\\[0.635cm]$
 
- Rodriguez, Daniel. (julio 2018). GridSearchCV. *AnalyticsLane*. https://www.analyticslane.com/2018/07/02/gridsearchcv/
 
<br> 
 
 
 
 
 
