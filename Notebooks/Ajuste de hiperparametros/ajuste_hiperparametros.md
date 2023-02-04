---
title: 'Ajuste de hiperparámetros'
author: 'Fabio Scielzo Ortiz'
date: '04/02/23'
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

$\hspace{0.5cm}$ Scielzo Ortiz, F. (2023). Ajuste de hiperparámetros. http://estadistica4all.com/Articulos/ajuste_hiperparametros.html


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


# Grid search


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


- Para cada posible combinación de valores de los hiper-parametros contenida en el espacio de busqueda, es decir, para cada $\hspace{0.1cm}s=(s_1,...,s_r)\hspace{0.05cm} \in \hspace{0.05cm} S$

    - Se valida $M(h=s)\hspace{0.1cm}=\hspace{0.1cm}M(h_1=s_1 \hspace{0.05cm} ,..., \hspace{0.05cm} h_r=s_r)\hspace{0.15cm}$ usando algún **algoritmo de validación** de modelos de aprendizaje estadístico (ya sean supervisados o no-supervisados). Con ello se obtiene un valor de una **métrica de validacion** para la combinacion de hiper-parámetros $\hspace{0.1cm} s=(s_1,...,s_r)\\$


- Tras el paso anterior se obtienen $\hspace{0.05cm}\#\hspace{0.05cm} S\hspace{0.05cm}$ valores de la métrica de validación calculada aplicando cierto algoritmo de validación.

    - Si, por ejemplo,tuvieramos un modelo de regresión y la métrica usada fuera el $\hspace{0.1cm}ECM\hspace{0.1cm}$, entonces se obtienen los siguientes valores de la métrica:
    
    $$\left\lbrace \hspace{0.1cm} ECM[\hspace{0.05cm}M(h=s)\hspace{0.05cm}]_{test}^* \hspace{0.15cm} / \hspace{0.15cm}  s\in S \hspace{0.1cm} \right\rbrace\\$$




- Se selecciona el vector de hiper-parametros $\hspace{0.1cm}s=(s_1,...,s_r) \in S\hspace{0.1cm}$ con el que se obtiene un mejor valor de la métrica de validacion. Si la metrica es de error, se selecciona el $\hspace{0.1cm}s\hspace{0.1cm}$ con el que se obtiene menor valor de la metrica. Si la metrica es de acierto, se seleciona el $\hspace{0.1cm}s\hspace{0.1cm}$ con el que se obtiene mayor valor de la metrica. $\\[0.5cm]$

    - Si, por ejemplo,  la métrica usado fuera el $\hspace{0.1cm}ECM\hspace{0.1cm}$, que es una métrica de error, entonces el vector de hiper-parámetros seleccionado seria $\hspace{0.1cm}s^*\hspace{0.1cm}$, donde:
 
    $$s^* \hspace{0.2cm}=\hspace{0.2cm} arg\hspace{0.25cm} \underset{s \in S}{Min}\hspace{0.25cm} ECM( \hspace{0.05cm} M(h=s) \hspace{0.05cm} )_{test}^* \\$$

    - Si, por ejemplo, la métrica usado fuera la $\hspace{0.1cm}TA\hspace{0.1cm}$, que es una métrica de acierto, entonces el vector de hiper-parámetros seleccionado seria $\hspace{0.1cm}s^*\hspace{0.1cm}$, donde:
 
    $$s^* \hspace{0.2cm}=\hspace{0.2cm} arg\hspace{0.25cm} \underset{s \in S}{Max}\hspace{0.25cm} TA\left( \hspace{0.05cm} M(h=s) \hspace{0.05cm}\right)_{test}^*$$


</p>
 
</p></span>
</div>


<br>

**¿ Cómo definir $\hspace{0.1cm}S\hspace{0.1cm}$ ?**

Lo ideal es que $\hspace{0.1cm}S \hspace{0.1cm} = \hspace{0.1cm} R(h_1)\hspace{0.1cm}\text{x}...\text{x}\hspace{0.1cm}R(h_r)\hspace{0.1cm}$, pero cuando el numero de hiper-parametros es demasiado alto, o estos tienen campos de variacion grandes, esto no es factible en la practica. Por ello se suelen seguir dos vías más eficientes:

- Se toma $\hspace{0.1cm}S\hspace{0.1cm}$ como un subconjunto estricto de  las posibles combinaciones de hiper-parametros , es decir, $\hspace{0.1cm}S \hspace{0.1cm} \subset \hspace{0.1cm} R(h_1)\hspace{0.1cm}\text{x}...\text{x}\hspace{0.1cm}R(h_r)$

La definición de $\hspace{0.1cm}S\hspace{0.1cm}$ en este contexto puede ser determinista, el usuario define las combinaciones de hiper-parametros que se van a considetar. O bien aleatoria, es decir, se escogen aleatoriamente las combinaciones de hiper-parametros que definirán a $\hspace{0.1cm}S\hspace{0.1cm}$

Si la definición de $\hspace{0.1cm}S\hspace{0.1cm}$ es aleatoria, el algoritmo suele denominarse random grid search, o simplemente random search.


<br>

<br>


# Grid search programado en `Python` <a class="anchor" id="1"></a>  




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





## Algoritmos de validación


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





## Grid search 


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


```python
Grid_search_1 = Grid_search(Data=Data, Search_Space=[range(1,100) , ['euclidean','cosine','cityblock','manhattan']], response='price', model='knn_regression', validation='repeated_random_simple_validation', metric='ECM', B=10, k=0.75, K='no', random_search=False, random_samples=150, random_seed_1=123, random_seed_2=123)
```

Time: 56.8seg


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




```python
fig, ax = plt.subplots()

p1 = sns.barplot(x="ECM", y ='(k , distance)' , data=Grid_search_1.iloc[0:15 , :], palette='mako')

plt.title("KNN regression - Grid search - Repeated random simple validation (k=0.75 , B=10)", fontsize=13)

plt.tight_layout()

fig.savefig('p1.jpg', format='jpg', dpi=1200)
```


    
![png](output_16_0.png)
    



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




```python
fig, ax = plt.subplots()

p2 = sns.barplot(x="TAC", y ='(k , distance)' , data=Grid_search_1_2.iloc[0:15 , :], palette='mako')

plt.title("KNN classification - Grid search - Repeated random simple validation (k=0.75 , B=10)", fontsize=13)

plt.tight_layout()

fig.savefig('p2.jpg', format='jpg', dpi=1200)
```


    
![png](output_19_0.png)
    





```python
Grid_search_2 = Grid_search(Data=Data, Search_Space=[range(1,100) , ['euclidean','cosine','cityblock','manhattan']], response='price', model='knn_regression', validation='repeated_random_simple_validation', metric='ECM', B=20, k=0.75, K='no', random_search=False, random_samples=150, random_seed_1=123, random_seed_2=123)
```

Time: 1.57seg


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




```python
fig, ax = plt.subplots()

p3 = sns.barplot(x="ECM", y ='(k , distance)' , data=Grid_search_2.iloc[0:15 , :], palette='mako')

plt.title("KNN regression - Grid search - Repeated random simple validation (k=0.75 , B=20)", fontsize=13)

plt.tight_layout()

fig.savefig('p3.jpg', format='jpg', dpi=1200)
```


    
![png](output_24_0.png)
    



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




```python
fig, ax = plt.subplots()

p4 = sns.barplot(x="TAC", y ='(k , distance)' , data=Grid_search_2_2.iloc[0:15 , :], palette='mako')

plt.title("KNN classification - Grid search - Repeated random simple validation (k=0.75 , B=20)", fontsize=13)

plt.tight_layout()

fig.savefig('p4.jpg', format='jpg', dpi=1200)
```


    
![png](output_27_0.png)
    





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




```python
fig, ax = plt.subplots()

p5 = sns.barplot(x="ECM", y ='(k , distance)' , data=Grid_search_3.iloc[0:15 , :], palette='mako')

plt.title("KNN regression - Grid search - Repeated random simple validation (k=0.75 , B=20)", fontsize=13)

plt.tight_layout()

fig.savefig('p5.jpg', format='jpg', dpi=1200)
```


    
![png](output_32_0.png)
    



```python
Grid_search_3_2 = Grid_search(Data=Data, Search_Space=[range(1,200) , ['euclidean','cosine','cityblock','manhattan']], response='quality_recode', model='knn_classification', validation='repeated_random_simple_validation', metric='TAC', B=20, k=0.75, K='no', random_search=False, random_samples=150, random_seed_1=123, random_seed_2=123)
```


```python
Grid_search_3_2
```


```python
fig, ax = plt.subplots()

p5_2 = sns.barplot(x="TAC", y ='(k , distance)' , data=Grid_search_3_2.iloc[0:15 , :], palette='mako')

plt.title("KNN classification - Grid search - Repeated random simple validation (k=0.75 , B=20)", fontsize=13)

plt.tight_layout()

fig.savefig('p5_2.jpg', format='jpg', dpi=1200)
```


    
![png](output_35_0.png)
    





```python
Grid_search_4 = Grid_search(Data=Data, Search_Space=[range(1,200) , ['euclidean','cosine','cityblock','manhattan']], response='price', model='knn_regression', validation='repeated_random_simple_validation', metric='ECM', B=20, k=0.75, K='no', random_search=True, random_samples=200, random_seed_1=123, random_seed_2=123)
```

Time: 1.2min


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




```python
fig, ax = plt.subplots()

p6 = sns.barplot(x="ECM", y ='(k , distance)' , data=Grid_search_4.iloc[0:15 , :], palette='mako')

plt.title("KNN regression - Random search - Repeated random simple validation (k=0.75 , B=20)", fontsize=13)

plt.tight_layout()

fig.savefig('p6.jpg', format='jpg', dpi=1200)
```


    
![png](output_40_0.png)
    



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




```python
fig, ax = plt.subplots()

p6_2 = sns.barplot(x="TAC", y ='(k , distance)' , data=Grid_search_4_2.iloc[0:15 , :], palette='mako')

plt.title("KNN classification - Random search - Repeated random simple validation (k=0.75 , B=20)", fontsize=13)

plt.tight_layout()

fig.savefig('p6_2.jpg', format='jpg', dpi=1200)
```


    
![png](output_43_0.png)
    





```python
Grid_search_5 = Grid_search(Data=Data, Search_Space=[range(1,100) , ['euclidean','cosine','cityblock','manhattan']], response='price', model='knn_regression', validation='repeated_K_Fold_CV', metric='ECM', B=5, k='no', K=10, random_search=False, random_samples=150, random_seed_1=123, random_seed_2=123)
```

Time: 4.37 min


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




```python
fig, ax = plt.subplots()

p7 = sns.barplot(x="ECM", y ='(k , distance)' , data=Grid_search_5.iloc[0:15 , :], palette='mako')

plt.title("KNN regression - Random search - Repeated K Fold (K=10 , B=5)", fontsize=13)

plt.tight_layout()

fig.savefig('p7.jpg', format='jpg', dpi=1200)
```


    
![png](output_48_0.png)
    



```python
Grid_search_5_2 = Grid_search(Data=Data, Search_Space=[range(1,100) , ['euclidean','cosine','cityblock','manhattan']], response='quality_recode', model='knn_classification', validation='repeated_K_Fold_CV', metric='TAC', B=5, k='no', K=10, random_search=False, random_samples=150, random_seed_1=123, random_seed_2=123)
```


```python
Grid_search_5_2
```


```python
fig, ax = plt.subplots()

p7_2 = sns.barplot(x="TAC", y ='(k , distance)' , data=Grid_search_5_2.iloc[0:15 , :], palette='mako')

plt.title("KNN classification - Random search - Repeated K Fold (K=10 , B=5)", fontsize=13)

plt.tight_layout()

fig.savefig('p7_2.jpg', format='jpg', dpi=1200)
```


    
![png](output_51_0.png)
    





```python
Grid_search_6 = Grid_search(Data=Data, Search_Space=[range(1,100) , ['euclidean','cosine','cityblock','manhattan']], response='price', model='knn_regression', validation='repeated_K_Fold_CV', metric='ECM', B=15, k='no', K=10, random_search=False, random_samples=150, random_seed_1=123, random_seed_2=123)
```

Time: 14.35min


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




```python
fig, ax = plt.subplots()

p8 = sns.barplot(x="ECM", y ='(k , distance)' , data=Grid_search_6.iloc[0:15 , :], palette='mako')

plt.title("KNN regression - Grid search - Repeated K Fold (K=10 , B=15)", fontsize=13)

plt.tight_layout()

fig.savefig('p8.jpg', format='jpg', dpi=1200)
```


    
![png](output_56_0.png)
    



```python
Grid_search_6_2 = Grid_search(Data=Data, Search_Space=[range(1,100) , ['euclidean','cosine','cityblock','manhattan']], response='quality_recode', model='knn_classification', validation='repeated_K_Fold_CV', metric='TAC', B=15, k='no', K=10, random_search=False, random_samples=150, random_seed_1=123, random_seed_2=123)
```


```python
Grid_search_6_2
```


```python
fig, ax = plt.subplots()

p8_2 = sns.barplot(x="TAC", y ='(k , distance)' , data=Grid_search_6_2.iloc[0:15 , :], palette='mako')

plt.title("KNN classification - Grid search - Repeated K Fold (K=10 , B=15)", fontsize=13)

plt.tight_layout()

fig.savefig('p8_2.jpg', format='jpg', dpi=1200)
```


    
![png](output_59_0.png)
    





```python
Grid_search_7 = Grid_search(Data=Data, Search_Space=[range(1,100) , ['euclidean','cosine','cityblock','manhattan']], response='price', model='knn_regression', validation='repeated_K_Fold_CV', metric='ECM', B=15, k='no', K=10, random_search=True, random_samples=200, random_seed_1=123, random_seed_2=123)
```

Time: 7.29 mins


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




```python
fig, ax = plt.subplots()

p9 = sns.barplot(x="ECM", y ='(k , distance)' , data=Grid_search_7.iloc[0:15 , :], palette='mako')

plt.title("KNN regression - Random search - Repeated K Fold (K=10 , B=15)", fontsize=13)

plt.tight_layout()

fig.savefig('p9.jpg', format='jpg', dpi=1200)
```


    
![png](output_64_0.png)
    



```python
Grid_search_7_2 = Grid_search(Data=Data, Search_Space=[range(1,100) , ['euclidean','cosine','cityblock','manhattan']], response='quality_recode', model='knn_classification', validation='repeated_K_Fold_CV', metric='TAC', B=15, k='no', K=10, random_search=True, random_samples=200, random_seed_1=123, random_seed_2=123)
```


```python
fig, ax = plt.subplots()

p9_2 = sns.barplot(x="TAC", y ='(k , distance)', data=Grid_search_7_2.iloc[0:15 , :], palette='mako')

plt.title("KNN classification - Random search - Repeated K Fold (K=10 , B=15)", fontsize=13)

plt.tight_layout()

fig.savefig('p9_2.jpg', format='jpg', dpi=1200)
```


    
![png](output_66_0.png)
    





```python
Grid_search_8 = Grid_search(Data=Data, Search_Space=[range(1,100) , ['euclidean','cosine','cityblock','manhattan']], response='price', model='knn_regression', validation='repeated_K_Fold_CV', metric='ECM', B=5, k='no', K=10, random_search=True, random_samples=200, random_seed_1=123, random_seed_2=123)
```

Time: 2.16min


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




```python
fig, ax = plt.subplots()

p10 = sns.barplot(x="ECM", y ='(k , distance)' , data=Grid_search_8.iloc[0:15 , :], palette='mako')

plt.title("KNN regression - Random search - Repeated K Fold (K=10 , B=5)", fontsize=13)

plt.tight_layout()

fig.savefig('p10.jpg', format='jpg', dpi=1200)
```


```python
Grid_search_8_2 = Grid_search(Data=Data, Search_Space=[range(1,100) , ['euclidean','cosine','cityblock','manhattan']], response='quality_recode', model='knn_classification', validation='repeated_K_Fold_CV', metric='TAC', B=5, k='no', K=10, random_search=True, random_samples=200, random_seed_1=123, random_seed_2=123)
```


```python
fig, ax = plt.subplots()

p10_2 = sns.barplot(x="TAC", y ='(k , distance)' , data=Grid_search_8_2.iloc[0:15 , :], palette='mako')

plt.title("KNN classification - Random search - Repeated K Fold (K=10 , B=5)", fontsize=13)

plt.tight_layout()

fig.savefig('p10_2.jpg', format='jpg', dpi=1200)
```


    
![png](output_73_0.png)
    





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




```python
fig, ax = plt.subplots()

p11 = sns.barplot(x="ECM", y ='(k , distance)' , data=Grid_search_9.iloc[0:15 , :], palette='mako')

plt.title("KNN regression - Random search - Repeated K Fold (K=10 , B=1)", fontsize=13)

plt.tight_layout()

fig.savefig('p11.jpg', format='jpg', dpi=1200)
```


    
![png](output_77_0.png)
    



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




```python
fig, ax = plt.subplots()

p11_2 = sns.barplot(x="TAC", y ='(k , distance)' , data=Grid_search_9_2.iloc[0:15 , :], palette='mako')

plt.title("KNN classification - Random search - Repeated K Fold (K=10 , B=1)", fontsize=13)

plt.tight_layout()

fig.savefig('p11_2.jpg', format='jpg', dpi=1200)
```


    
![png](output_80_0.png)
    





```python
fig, axs = plt.subplots(5, 2, figsize=(27, 27))

p1 = sns.barplot(x="ECM", y ='(k , distance)' , data=Grid_search_1.iloc[0:15 , :], palette='mako', ax=axs[0, 0])

p1.title.set_text('KNN regression - Grid search - Repeated random simple validation (k=0.75 , B=10)')

p3 = sns.barplot(x="ECM", y ='(k , distance)' , data=Grid_search_2.iloc[0:15 , :], palette='mako', ax=axs[0, 1])

p3.title.set_text('KNN regression - Grid search - Repeated random simple validation (k=0.75 , B=20)')

p5 = sns.barplot(x="ECM", y ='(k , distance)' , data=Grid_search_3.iloc[0:15 , :], palette='mako', ax=axs[1, 0])

p5.title.set_text('KNN regression - Grid search (greater search space)- Repeated random simple validation (k=0.75 , B=20)')

p6 = sns.barplot(x="ECM", y ='(k , distance)' , data=Grid_search_4.iloc[0:15 , :], palette='mako', ax=axs[1, 1])

p6.title.set_text('KNN regression - Random search - Repeated random simple validation (k=0.75 , B=20)')

p7 = sns.barplot(x="ECM", y ='(k , distance)' , data=Grid_search_5.iloc[0:15 , :], palette='mako', ax=axs[2, 0])

p7.title.set_text('KNN regression - Random search - Repeated K Fold (K=10 , B=5)')

p8 = sns.barplot(x="ECM", y ='(k , distance)' , data=Grid_search_6.iloc[0:15 , :], palette='mako', ax=axs[2, 1])

p8.title.set_text('KNN regression - Grid search - Repeated K Fold (K=10 , B=15)')

p9 = sns.barplot(x="ECM", y ='(k , distance)' , data=Grid_search_7.iloc[0:15 , :], palette='mako', ax=axs[3, 0])

p9.title.set_text('KNN regression - Random search - Repeated K Fold (K=10 , B=15)')

p10 = sns.barplot(x="ECM", y ='(k , distance)' , data=Grid_search_8.iloc[0:15 , :], palette='mako', ax=axs[3, 1])

p10.title.set_text('KNN regression - Random search - Repeated K Fold (K=10 , B=5)')

p11 = sns.barplot(x="ECM", y ='(k , distance)' , data=Grid_search_9.iloc[0:15 , :], palette='mako', ax=axs[4, 0])

p11.title.set_text('KNN regression - Random search - Repeated K Fold (K=10 , B=1)')

fig.savefig('p1big.jpg', format='jpg', dpi=1200)

plt.show()
```


    
![png](output_82_0.png)
    



```python
fig, axs = plt.subplots(5, 2, figsize=(27, 27))

p2 = sns.barplot(x="TAC", y ='(k , distance)' , data=Grid_search_1_2.iloc[0:15 , :], palette='mako', ax=axs[0, 0])

p2.title.set_text('KNN classification - Grid search - Repeated random simple validation (k=0.75 , B=10)')

p4 = sns.barplot(x="TAC", y ='(k , distance)' , data=Grid_search_2_2.iloc[0:15 , :], palette='mako', ax=axs[0, 1])

p4.title.set_text('KNN classification - Grid search - Repeated random simple validation (k=0.75 , B=20)')

p5_2 = sns.barplot(x="TAC", y ='(k , distance)' , data=Grid_search_3_2.iloc[0:15 , :], palette='mako', ax=axs[1,0])

p5_2.title.set_text('KNN classification - Grid search (greater search space)- Repeated random simple validation (k=0.75 , B=20)')

p6_2 = sns.barplot(x="TAC", y ='(k , distance)' , data=Grid_search_4_2.iloc[0:15 , :], palette='mako', ax=axs[1,1])

p6_2.title.set_text('KNN classification - Random search - Repeated random simple validation (k=0.75 , B=20)')

p7_2 = sns.barplot(x="TAC", y ='(k , distance)' , data=Grid_search_5_2.iloc[0:15 , :], palette='mako', ax=axs[2, 0])

p7_2.title.set_text('KNN classification - Random search - Repeated K Fold (K=10 , B=5)')

p8_2 = sns.barplot(x="TAC", y ='(k , distance)' , data=Grid_search_6_2.iloc[0:15 , :], palette='mako', ax=axs[2, 1])

p8_2.title.set_text('KNN classification - Grid search - Repeated K Fold (K=10 , B=15)')

p9_2 = sns.barplot(x="TAC", y ='(k , distance)', data=Grid_search_7_2.iloc[0:15 , :], palette='mako', ax=axs[3, 0])

p9_2.title.set_text('KNN classification - Random search - Repeated K Fold (K=10 , B=15)')

p10_2 = sns.barplot(x="TAC", y ='(k , distance)' , data=Grid_search_8_2.iloc[0:15 , :], palette='mako', ax=axs[3, 1])

p10_2.title.set_text('KNN classification - Random search - Repeated K Fold (K=10 , B=5)')

p11_2 = sns.barplot(x="TAC", y ='(k , distance)' , data=Grid_search_9_2.iloc[0:15 , :], palette='mako', ax=axs[4, 0])

p11_2.title.set_text('KNN classification - Random search - Repeated K Fold (K=10 , B=1)')

fig.savefig('p2big.jpg', format='jpg', dpi=1200)

plt.show()
```


    
![png](output_83_0.png)
    






<br>

<br>

# Bibliografia

- Aler Mur, Ricardo. (2022). *Metodología: evaluación de modelos.* [Presentación de PowerPoint]. Aula Global UC3M.
 
 
 
<br> 
 
 
 
 
 
