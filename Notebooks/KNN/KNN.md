---
title: 'K Nearest Neighbors (KNN)'
author: 'Fabio Scielzo Ortiz'
date: '13/11/22'
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






> More articles in my blog:   $\hspace{0.1cm}$   [Estadistica4all](https://fabioscielzoortiz.github.io/Estadistica4all.github.io/)




 


# KNN como modelo de clasificación supervisada <a class="anchor" id="1"></a>  


Un modelo de clasificación supervisada  es un modelo estadistico que permite predecir una respuesta **categorica** usando para ello informacion sobre una serie de predictores y de la propia respuesta.

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

El modelo KNN para clasificacion supervisada se basa en el siguiente algoritmo:


$1. \hspace{0.15cm}$ Se define una medida de distancia  entre pares de observaciones de variables estadisticas $\hspace{0.15cm} \Rightarrow \hspace{0.15cm}$ $\delta (\cdot , \cdot) \\$

 

 
$2. \hspace{0.15cm}$ Dada una nueva observación $\hspace{0.1cm}x_{new}\hspace{0.1cm}$ de los predictores $\hspace{0.1cm}(\mathcal{X}_1 ,...,\mathcal{X}_p)\hspace{0.1cm}$ , es decir, una observación que no está en la muestra de train, se calculan las distancias entre el par de observaciones $\hspace{0.1cm}(x_{new} , x_i)$ , para $\hspace{0.1cm}i=1,...,n \\$
 
 


$3. \hspace{0.15cm}$ Se seleccionan las $\hspace{0.1cm}k\hspace{0.1cm}$ observaciones del vector $\hspace{0.1cm}(x_1,...,x_n)\hspace{0.1cm}$ que son más cercanas a la nueva observación $\hspace{0.1cm}x_{new}$

El conjunto de estas $\hspace{0.1cm}k\hspace{0.1cm}$ observaciones se denota por $\hspace{0.1cm}KNN(x_{new}) \\$



$4. \hspace{0.15cm}$ Se calcula la frecuencia relativa de cada categoría de la respuesta sobre el conjunto $\hspace{0.1cm}KNN(x_{new})$

Sea $\hspace{0.1cm}f^{KNN(x_{new})}_r\hspace{0.1cm}$ la frecuencia relativa (proporción) de observaciones de $\hspace{0.1cm}KNN(x_{new})\hspace{0.1cm}$ tales que $\hspace{0.1cm}\mathcal{Y}=r$

Es decir:

  $$\hspace{0.1 cm} f^{KNN(x_{new})}_{r} \hspace{0.15cm}=\hspace{0.15cm} \dfrac{ \# \hspace{0.1cm}\lbrace\hspace{0.1cm} i \hspace{0.1cm}/\hspace{0.1cm} x_i \in KNN(x_{new}) \hspace{0.3cm}\text{y}\hspace{0.3cm}  y_i = r \hspace{0.1cm}\rbrace  }{\# \hspace{0.1cm} KNN(x_{new}) = k} \\$$



$5. \hspace{0.15cm}$ Para la nueva observación de los predictores $\hspace{0.1cm} x_{new} \hspace{0.1cm}$ se predice la respuesta como la categoria mas frecuente en el conjunto $\hspace{0.1cm}KNN(x_{new})$


Es decir:

$$\hspace{0.6 cm} \text{Si} \hspace{0.4 cm} r^*  \hspace{0.05 cm}= \hspace{0.05 cm} \underset{\hspace{0.7 cm} r}{arg \hspace{0.1 cm} Max} \hspace{0.05 cm} \left(\hspace{0.1 cm} f^{KNN(x_{new})}_{r} \hspace{0.1 cm}\right) \hspace{0.2 cm} \hspace{0.15cm}  \Rightarrow \hspace{0.25cm} \widehat{y}_{new} = r^* \hspace{0.1cm}$$






<br>




# Ejemplo de juguete <a class="anchor" id="2"></a>



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


# Modelo KNN de clasificación supervisada aplicado en `Python` con `sklearn`  <a class="anchor" id="3"></a>


```python
import warnings
warnings.filterwarnings("ignore")
```


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

## Validación simple con función propia <a class="anchor" id="3.1"></a>


Creamos una función que entrena el modelo con una muestra de train de los predictores y la respuesta, pasada como argumento, y calcula la métrica de validación TEC con una muestra de test de los predictores que también es pasada como argumento:


```python
def Simple_Validation_Classification(Data_Test, X_train, Y_train, Y_test) :

    ##########################

    from joblib import Parallel, delayed
    import multiprocessing

    n_jobs  = multiprocessing.cpu_count()

    ##########################

    knn_classification = sklearn.neighbors.KNeighborsClassifier(n_neighbors=10 ,  weights='uniform', p=2, metric='minkowski')

    ##########################

    def prediction(i, Data_Test, X_train, Y_train ):

     x_new = Data_Test.iloc[ i , range(1, Data_Test.shape[1])]

     knn_classification.fit(X_train, Y_train)
     
     y_new_predict = knn_classification.predict( [x_new] )

     return(y_new_predict)

    ##########################

    y_predictions_vector = []

    # Paralelizamos el siguiente bucle for :

    # for i in  range(0, len(Data_Test)):

        # y_new_predict = prediction(i, Data_Test, X_train, Y_train )

        # y_predictions_vector.append( y_new_predict )

    
    y_predictions_vector = Parallel(n_jobs=n_jobs)( delayed(prediction)( i, Data_Test, X_train, Y_train) for i in range(0, len(Data_Test)) )

    #########################

    from itertools import chain

    y_predictions_vector = list(chain(*y_predictions_vector))

    TEC = 1 - sum(y_predictions_vector == Y_test)/len(Y_test)     

 
    return(y_predictions_vector , TEC)
    
```


Aplicamos la funcion creada para calcular la metrica TEC con la muestra de test, con el modelo KNN con distancia Minkowski y q=2:


```python
y_predictions_vector , TEC = Simple_Validation_Classification(Data_Test, X_train, Y_train, Y_test)
```


```python
TEC
```


    0.03700000000000003



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


Vemos ahora como funciona la función `KNeighborsClassifier` con otras medidas de distancias :


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


```python
def KNN_classification( X , Y , x_new, k, distance = "Minkowski" , q = 0, p1=0, p2=0, p3=0 ):

    
## Para paralelizar el algoritmo 

    from joblib import Parallel, delayed
    import multiprocessing

    n_jobs  = multiprocessing.cpu_count()

####################################################################################################################################################################################################################################################

    # Y, X y x_new deben ser objetos Pandas ya que luego seran convertidos a objetos Numpy automaticamente por el algoritmo
    
    # Y tiene que ser un Pandas data frame con la variable respuesta (que en este caso debe ser categorica y con categorias estandar {0,1,2,...}) 

    # X tiene que ser un Pandas data frame con los predictotres (X1,...,Xp). 

    # x_new tiene que ser un vector con una nueva observacion de los predictores. 


####################################################################################################################################################################################################################################################

    Y = Y.to_numpy()

    X = X.to_numpy() 

    x_new = x_new.to_numpy()

    X = np.concatenate((X, [x_new]), axis=0)


    distances = []

    groups_knn = []

##########################################################################################
    
    def a(Binary_Data) :

            X = Binary_Data

            a = X @ X.T

            return(a)

##########################################################################################

    def d(Binary_Data):

            X = Binary_Data

            ones_matrix = np.ones(( X.shape[0] , X.shape[1])) 

            d = (ones_matrix - X) @ (ones_matrix - X).T

            return(d)

##########################################################################################

    def alpha_py(i,j, Multiple_Categorical_Data):

        X = Multiple_Categorical_Data

        alpha = np.repeat(0, X.shape[1])

        for k in range(0, X.shape[1]) :

            if X[i-1, k] == X[j-1, k] :

                alpha[k] = 1

            else :

                alpha[k] = 0

        alpha = alpha.sum()

        return(alpha)

####################################################################################################################################################################################################################################################
    
    if distance == "Euclidean":

        def Dist_Euclidea_Python(i, j, Quantitative_Data_set): 

            Dist_Euclidea = ( ( Quantitative_Data_set[i-1, :] - Quantitative_Data_set[j-1, :] )**2 ).sum()

            Dist_Euclidea = np.sqrt(Dist_Euclidea)

            return Dist_Euclidea

    ###################################################################
           
        ## PARTE DEL CODIGO A PARALELIZAR

        #for j in range(1, len(X)):

          # distances.append( Dist_Euclidea_Python( len(X), i , X ) )

        n_jobs  = multiprocessing.cpu_count()

        distances = Parallel(n_jobs=n_jobs)( delayed(Dist_Euclidea_Python)( len(X), s , X ) for s in range(1, len(X)) )
           

    ###################################################################

    if distance == "Minkowski":

        def Dist_Minkowski_Python(i,j, q , Quantitative_Data_set):

            Dist_Minkowski = ( ( ( abs( Quantitative_Data_set[i-1, :] - Quantitative_Data_set[j-1, :] ) )**q ).sum() )**(1/q)

            return Dist_Minkowski

    ###################################################################

        ## PARTE DEL CODIGO A PARALELIZAR

        # for i in range(1, len(X)):

          #  distances.append( Dist_Minkowski_Python( len(X), i , q , X) )

        n_jobs  = multiprocessing.cpu_count()

        distances = Parallel(n_jobs=n_jobs)( delayed(Dist_Minkowski_Python)( len(X), s , q , X) for s in range(1, len(X)) )

    ###################################################################

    if distance == "Canberra":

        def Dist_Canberra_Python(i,j, Quantitative_Data_set):

            numerator =  abs( Quantitative_Data_set[i-1, :] - Quantitative_Data_set[j-1, :] )  

            denominator =  ( abs(Quantitative_Data_set[i-1, :]) + abs(Quantitative_Data_set[j-1, :]) )
       
            numerator=np.array([numerator], dtype=float)

            denominator=np.array([denominator], dtype=float)

            Dist_Canberra = ( np.divide( numerator , denominator , out=np.zeros_like(numerator), where=denominator!=0) ).sum()

            return Dist_Canberra

    ###################################################################

        ## PARTE DEL CODIGO A PARALELIZAR

        # for i in range(1, len(X)):

          #  distances.append( Dist_Canberra_Python( len(X), i , X) )

        n_jobs  = multiprocessing.cpu_count()

        distances = Parallel(n_jobs=n_jobs)( delayed(Dist_Canberra_Python)( len(X), s , X) for s in range(1, len(X)) )
                

    ###################################################################
   
    if distance == "Pearson":

        def Dist_Pearson_Python(i, j, Quantitative_Data_set):

            Dist_Pearson = ( ( Quantitative_Data_set[i-1, ] - Quantitative_Data_set[j-1, ] )**2 / Quantitative_Data_set.var() ).sum()

            Dist_Pearson = np.sqrt(Dist_Pearson)

            return Dist_Pearson

    ###################################################################

       ## PARTE DEL CODIGO A PARALELIZAR
       
       # for i in range(1, len(X)):

        #   distances.append( Dist_Pearson_Python( len(X), i , X) )

        
        n_jobs  = multiprocessing.cpu_count()

        distances = Parallel(n_jobs=n_jobs)( delayed(Dist_Pearson_Python)( len(X), s , X) for s in range(1, len(X)) )

    ###################################################################
    
    if distance == "Mahalanobis":

        def Dist_Mahalanobis_Python(i, j, Quantitative_Data_set):

            # All the columns of Quantitative_Data_set must be type = 'float' or 'int' (specially not 'object'), in other case we will find 
            # dimensional problems when Python compute   x @ S_inv @ x.T

            x = (Quantitative_Data_set[i-1, :] - Quantitative_Data_set[j-1, :])

            x = np.array([x]) # necessary step to transpose a 1D array

            S_inv = np.linalg.inv( np.cov(Quantitative_Data_set , rowvar=False) ) # inverse of covariance matrix

            Dist_Maha = np.sqrt( x @ S_inv @ x.T )  # x @ S_inv @ x.T = np.matmul( np.matmul(x , S_inv) , x.T )

            Dist_Maha = float(Dist_Maha)

            return Dist_Maha

        
    ###################################################################

    ## PARTE DEL CODIGO A PARALELIZAR

       # for i in range(1, len(X)):

        #    distances.append( Dist_Mahalanobis_Python( len(X), i , X) )

        n_jobs  = multiprocessing.cpu_count()

        distances = Parallel(n_jobs=n_jobs)( delayed(Dist_Mahalanobis_Python)( len(X), s , X) for s in range(1, len(X)) )
       

    ###################################################################
    
    if distance == "Sokal":

        a = X @ X.T
        n = X.shape[0]
        p = X.shape[1]
        ones_matrix = np.ones((n, p))
        b = (ones_matrix - X) @ X.T
        c = b.T
        d = (ones_matrix - X) @ (ones_matrix - X).T


        def Sokal_Similarity_Py(i, j):

            Sokal_Similarity = ( a[i-1 , j-1] + d[i-1 , j-1] ) / p

            return Sokal_Similarity


        def Dist_Sokal_Python(i, j, Binary_Data_set):

            dist_Sokal = np.sqrt( 2 - 2*Sokal_Similarity_Py(i,j, Binary_Data_set) )

            return dist_Sokal

    ###################################################################

    ## PARTE DEL CODIGO A PARALELIZAR

      #  for i in range(1, len(X)):

        #    distances.append( Dist_Sokal_Python( len(X), i , X) )

        n_jobs  = multiprocessing.cpu_count()

        distances = Parallel(n_jobs=n_jobs)( delayed(Dist_Sokal_Python)( len(X), s , X) for s in range(1, len(X)) )

    ###################################################################
   
    if distance == "Jaccard":


        a = X @ X.T
        n = X.shape[0]
        p = X.shape[1]
        ones_matrix = np.ones((n, p))
        b = (ones_matrix - X) @ X.T
        c = b.T
        d = (ones_matrix - X) @ (ones_matrix - X).T


        def Jaccard_Similarity_Py(i, j):

            Jaccard_Similarity = a[i-1,j-1] / (a[i-1,j-1] + b[i-1,j-1] + c[i-1,j-1])
            
            return Jaccard_Similarity


        def Dist_Jaccard_Python(i, j):

            dist_Jaccard = np.sqrt( Jaccard_Similarity_Py(i,i) + Jaccard_Similarity_Py(i,i) - 2*Jaccard_Similarity_Py(i,j) )

            return dist_Jaccard

    ###################################################################

    ## PARTE DEL CODIGO A PARALELIZAR

       # for i in range(1, len(X)):

        #    distances.append( Dist_Jaccard_Python( len(X), i , X) )

        n_jobs  = multiprocessing.cpu_count()

        distances = Parallel(n_jobs=n_jobs)( delayed(Dist_Jaccard_Python)( len(X), s , X) for s in range(1, len(X)) )

    ###################################################################
    
    if distance == "Matches":

        def matches_similarity_py(i, j, Multiple_Categorical_Data):

            p = Multiple_Categorical_Data.shape[1]

            matches_similarity = alpha_py(i,j, Multiple_Categorical_Data) / p

            return(matches_similarity)


        def Dist_Matches_Py(i,j, Multiple_Categorical_Data):

            Dist_Matches = np.sqrt( matches_similarity_py(i, i, Multiple_Categorical_Data) +  matches_similarity_py(j, j, Multiple_Categorical_Data) - 2*matches_similarity_py(i, j, Multiple_Categorical_Data) )

            return( Dist_Matches )

    ###################################################################

        # for i in range(1, len(X)):

          #  distances.append( Dist_Matches_Py( len(X), i , X) )

        n_jobs  = multiprocessing.cpu_count()

        distances = Parallel(n_jobs=n_jobs)( delayed(Dist_Matches_Py)( len(X), s , X) for s in range(1, len(X)) )

 ##############################################################################################################################################   
   
    if distance == "Gower":

        # The data matrix X have to be order in the following way:
        # The p1 first are quantitative, the following p2 are binary categorical, and the following p3 are multiple categorical.



##########################################################################################


        def Gower_Similarity_Python(i,j, Mixed_Data_Set, p1, p2, p3):

            X = Mixed_Data_Set

   # The data matrix X have to be order in the following way:
   # The p1 first are quantitative, the following p2 are binary categorical, and the following p3 are multiple categorical.

   #####################################################################################
        
            def G(k, X):

                range = X[:,k].max() - X[:,k].min() 

                return(range)

            G_vector = np.repeat(0.5, p1)

            for r in range(0, p1):

                G_vector[r] = G(r, X)
                
      
    ##########################################################################################
    
            ones = np.repeat(1, p1)

            Quantitative_Data = X[: , 0:p1]

            Binary_Data = X[: , (p1):(p1+p2)]
            
            Multiple_Categorical_Data = X[: , (p1+p2):(p1+p2+p3) ]

    ##########################################################################################

            numerator_part_1 = ( ones - ( abs(Quantitative_Data[i-1,:] - Quantitative_Data[j-1,:]) / G_vector ) ).sum() 

            numerator_part_2 = a(Binary_Data)[i-1,j-1] + alpha_py(i,j, Multiple_Categorical_Data)

            numerator = numerator_part_1 + numerator_part_2
 
            denominator = p1 + (p2 - d(Binary_Data)[i-1,j-1]) + p3

            Similarity_Gower = numerator / denominator  

            return(Similarity_Gower)

##########################################################################################

        def Dist_Gower_Py(i, j, Mixed_Data , p1, p2, p3):

            Dist_Gower = np.sqrt( 1 - Gower_Similarity_Python(i, j, Mixed_Data , p1, p2, p3) )

            return(Dist_Gower)    

    ###################################################################

        # for i in range(1, len(X)):

            # distances.append( Dist_Gower_Py( len(X), i , X, p1, p2, p3) )

        n_jobs  = multiprocessing.cpu_count()

        distances = Parallel(n_jobs=n_jobs)( delayed(Dist_Gower_Py)( len(X), s , X, p1, p2, p3) for s in range(1, len(X)) )

##############################################################################################################################################

    if distance == "Gower-BM" :

        def GowerBM_Similarity_Python(i,j, BM_Data_Set, p2, p3):

            X = BM_Data_Set

          # The data matrix X have to be order in the following way:
          # The p2 first are binary categorical, and the following p3 are multiple categorical.

##########################################################################################
       
            Binary_Data = X[: , 0:p2]

            Multiple_Categorical_Data = X[: , (p2):(p2+p3)]
 
##########################################################################################

 
            numerator_part_2 = a(Binary_Data)[i-1,j-1] + alpha_py(i,j, Multiple_Categorical_Data)

            numerator = numerator_part_2

            denominator = (p2 - d(Binary_Data)[i-1,j-1]) + p3

            Similarity_Gower = numerator / denominator  

            return(Similarity_Gower)

##############################################################################################################################################
        
        def Dist_GowerBM_Py(i, j, BM_Data ,  p2, p3):

            Dist_Gower = np.sqrt( 1 - GowerBM_Similarity_Python(i, j, BM_Data , p2, p3) )

            return(Dist_Gower)

##############################################################################################################################################

        # for i in range(1, len(X)):

            # distances.append( Dist_GowerBM_Py( len(X), i , X, p2, p3) )

        n_jobs  = multiprocessing.cpu_count()

        distances = Parallel(n_jobs=n_jobs)( delayed(Dist_GowerBM_Py)( len(X), s , X, p2, p3) for s in range(1, len(X)) )

##############################################################################################################################################
    
    if distance == "Gower-BQ" :

        def GowerBQ_Similarity_Python(i,j, BQ_Data_Set, p1, p2):

            X = BQ_Data_Set


        # The data matrix X have to be order in the following way:
        # The p1 first are quantitative, the following p2 are binary categorical 

##########################################################################################
        
            def G(k, X):

                range = X[:,k].max() - X[:,k].min() 

                return(range)

            G_vector = np.repeat(0.5, p1)

            for r in range(0, p1):

                G_vector[r] = G(r, X)
##########################################################################################
    
            ones = np.repeat(1, p1)

            Quantitative_Data = X[: , 0:p1]

            Binary_Data = X[: , (p1):(p1+p2)]
         
 
##########################################################################################

            numerator_part_1 = ( ones - ( abs(Quantitative_Data[i-1,:] - Quantitative_Data[j-1,:]) / G_vector ) ).sum() 

            numerator_part_2 = a(Binary_Data)[i-1,j-1] 
     
            numerator = numerator_part_1 + numerator_part_2

            denominator = p1 + (p2 - d(Binary_Data)[i-1,j-1])  

            Similarity_Gower = numerator / denominator  

            return(Similarity_Gower)

###############################################################################

        def Dist_GowerBQ_Py(i, j, BQ_Data ,  p1, p2):

            Dist_Gower = np.sqrt( 1 - GowerBQ_Similarity_Python(i, j, BQ_Data , p1, p2) )

            return(Dist_Gower)

##############################################################################################################################################

        # for i in range(1, len(X)):

        # distances.append( Dist_GowerBQ_Py( len(X), i , X, p1, p2) )

        n_jobs  = multiprocessing.cpu_count()

        distances = Parallel(n_jobs=n_jobs)( delayed(Dist_GowerBQ_Py)( len(X), s , X, p1, p2) for s in range(1, len(X)) )


##############################################################################################################################################
    
    if distance == "Gower-MQ" :
        
        def GowerMQ_Similarity_Python(i,j, MQ_Data_Set, p1, p3):

            X = MQ_Data_Set

   # The data matrix X have to be order in the following way:
   # The p1 first are quantitative, the following p2 are binary categorical, and the following p3 are multiple categorical.

##########################################################################################
            
            def G(k, X):

                range = X[:,k].max() - X[:,k].min() 

                return(range)

            G_vector = np.repeat(0.5, p1)

            for r in range(0, p1):

                G_vector[r] = G(r, X)

##########################################################################################
    
            ones = np.repeat(1, p1)

            Quantitative_Data = X[: , 0:p1]
    
            Multiple_Categorical_Data = X[: , (p1):(p1+p3)]
 
    
##########################################################################################

            numerator_part_1 = ( ones - ( abs(Quantitative_Data[i-1,:] - Quantitative_Data[j-1,:]) / G_vector ) ).sum() 

            numerator_part_2 =   alpha_py(i,j, Multiple_Categorical_Data)

            numerator = numerator_part_1 + numerator_part_2

            denominator = p1 + p3

            Similarity_Gower = numerator / denominator  

            return(Similarity_Gower)



############################################################################################

        def Dist_GowerMQ_Py(i, j, MQ_Data ,  p1, p3):

                Dist_Gower = np.sqrt( 1 - GowerMQ_Similarity_Python(i, j, MQ_Data , p1, p3) )

                return(Dist_Gower)


######################################################################################################################################
        # for i in range(1, len(X)):

        # distances.append( Dist_GowerMQ_Py( len(X), i , X, p1, p3) )

        n_jobs  = multiprocessing.cpu_count()

        distances = Parallel(n_jobs=n_jobs)( delayed(Dist_GowerMQ_Py)( len(X), s , X, p1, p3) for s in range(1, len(X)) )

######################################################################################################################################

######################################################################################################################################

    distances = pd.DataFrame({'distances': distances})

    distances = distances.sort_values(by=["distances"]).reset_index(drop=False)
        
    knn = distances.iloc[0:k , :]

    for i in knn.iloc[:,0]:

        groups_knn.append(Y[i])

    unique, counts = np.unique(groups_knn , return_counts=True)

    unique_Y , counts_Y = np.unique(Y , return_counts=True)

    if len(unique) == len(unique_Y) :

        proportions_groups_knn = pd.DataFrame({'proportions_groups': counts/k, 'groups': unique_Y })
    
    elif len(unique) < len(unique_Y) :

        proportions_groups_knn = pd.DataFrame({'proportions_groups': counts/k, 'groups': unique })



    prediction_group = proportions_groups_knn.sort_values(by=["proportions_groups"], ascending=False).iloc[0,:]['groups']
                                      

    return prediction_group, proportions_groups_knn   
```


<br>

## Aplicación a clasificación binaria

Probamos nuestra función  `KNN_classification` en un problema de clasificación binaria.

En este caso se va a usar la distancia Euclidea y un $K=10$


```python
prediction_group, proportions_groups_knn  = KNN_classification( X_train , Y_train , x_new, 10 , distance = "Euclidean" )
```


El grupo/clase/categoria que el modelo predice para la nueva observacion de los predictores $x_{new}$ es la 1 (Male):

```python
prediction_group
```


    1.0


Podemos ver también la proporcion de cada clase en el conjunto $KNN(x_{new})$

```python
proportions_groups_knn
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
      <th>proportions_groups</th>
      <th>groups</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1.0</td>
      <td>1.0</td>
    </tr>
  </tbody>
</table>
</div>




Probamos a usar otras medidas de distancias:


```python
prediction_group, proportions_groups_knn  =  KNN_classification( X_train , Y_train , x_new, 10 , distance = "Minkowski" , q = 2 )
```


```python
prediction_group
```




    1.0




```python
proportions_groups_knn
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
      <th>proportions_groups</th>
      <th>groups</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1.0</td>
      <td>1.0</td>
    </tr>
  </tbody>
</table>
</div>





Usando la distancia Minkowski con q=1 :

```python
prediction_group, proportions_groups_knn  =  KNN_classification( X_train , Y_train , x_new, 10 , distance = "Minkowski" , q = 1 )
```


```python
prediction_group
```




    1.0




```python
proportions_groups_knn
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
      <th>proportions_groups</th>
      <th>groups</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1.0</td>
      <td>1.0</td>
    </tr>
  </tbody>
</table>
</div>



Usando la distancia Canberra:


```python
prediction_group, proportions_groups_knn  =  KNN_classification( X_train , Y_train , x_new, 10 , distance = "Canberra")
```


```python
prediction_group
```




    1.0




```python
proportions_groups_knn
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
      <th>proportions_groups</th>
      <th>groups</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1.0</td>
      <td>1.0</td>
    </tr>
  </tbody>
</table>
</div>




Usando la distancia de Pearson:

```python
prediction_group, proportions_groups_knn  =  KNN_classification( X_train , Y_train , x_new, 10 , distance = "Pearson")
```


```python
prediction_group
```




    1.0




```python
proportions_groups_knn
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
      <th>proportions_groups</th>
      <th>groups</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1.0</td>
      <td>1.0</td>
    </tr>
  </tbody>
</table>
</div>




Usando la distancia de Mahalanobis

```python
prediction_group, proportions_groups_knn  =  KNN_classification( X_train , Y_train , x_new, 10 , distance = "Mahalanobis")
```


```python
prediction_group
```




    1.0




```python
proportions_groups_knn
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
      <th>proportions_groups</th>
      <th>groups</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1.0</td>
      <td>1.0</td>
    </tr>
  </tbody>
</table>
</div>




Usando la distancia de Gower:

```python
# KNN_classification( X_train , Y_train , x_new, 10 , distance = "Gower"  )
```

En este caso la distancia de Gower no puede ser implementada porque $X_{train}$  no es una matriz de datos mixtos (solo tiene variables  cuantitativas y binarias, no hay variables multiclase). 

Tampoco podrian usarse las distancias de Sokal y Jaccard, ya que $X_{train}$ no es una matriz de datos binarios.

Tampoco podria usarse la distancia de coencidencias (Matches), porque $X_{train}$ no es una matriz de datos multiclase.



<br> 

Como en este caso $X_{train}$ es una matriz de datos binaria-cuantitativa (binary-quantitative), la medida de distancia mas adecuada es la distancia de Gower binaria-cuantitativa (Gower-BQ).



Para usar nuestra distancia de Gower-BQ tenemos que re-ordenar las columnas de $X_{train}$ de manera apropiada. Las primeras $p_1$ tiene que ser variables cuantitativas, las siguientes $p_2$ variables binarias.


```python
X_train_2 = X_train.loc[: , ['forehead_width_cm', 'forehead_height_cm',   # Quantitative (2)

                 'long_hair', 'nose_wide', 'nose_long', 'lips_thin', 'distance_nose_to_lip_long'     # Binary (5)
                 
                            ]] 
```


Como la distancia de Gower tiene un coste computacional alto, vamos a trabajar con el subconjunto de las primeras 2000 filas de $X_{train}$ re-ordenada.

```python
X_train_subset = X_train_2.iloc[0:2000 , ]
Y_train_subset = X_train_2.iloc[0:2000 , ]
```

Aplicamos nuestra funcion `KNN_classification` con K=10 y la distancia Gower-BQ:
```python
prediction_group, proportions_groups_knn  = KNN_classification( X_train_subset, Y_train_subset , x_new, 10 ,  "Gower-BQ" , 2, 5 )
```


```python
prediction_group
```




    1.0




```python
proportions_groups_knn
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
      <th>proportions_groups</th>
      <th>groups</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>0.2</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>4.8</td>
      <td>1.0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>0.1</td>
      <td>6.7</td>
    </tr>
    <tr>
      <th>3</th>
      <td>0.1</td>
      <td>6.8</td>
    </tr>
    <tr>
      <th>4</th>
      <td>0.3</td>
      <td>6.9</td>
    </tr>
    <tr>
      <th>5</th>
      <td>0.3</td>
      <td>7.0</td>
    </tr>
    <tr>
      <th>6</th>
      <td>0.2</td>
      <td>7.1</td>
    </tr>
    <tr>
      <th>7</th>
      <td>0.2</td>
      <td>11.5</td>
    </tr>
    <tr>
      <th>8</th>
      <td>0.4</td>
      <td>11.6</td>
    </tr>
    <tr>
      <th>9</th>
      <td>0.1</td>
      <td>11.7</td>
    </tr>
    <tr>
      <th>10</th>
      <td>0.1</td>
      <td>11.8</td>
    </tr>
    <tr>
      <th>11</th>
      <td>0.1</td>
      <td>11.9</td>
    </tr>
    <tr>
      <th>12</th>
      <td>0.1</td>
      <td>12.0</td>
    </tr>
  </tbody>
</table>
</div>




Observación: con 3000 observaciones la funcion tarda en ejecutarse 2 minutos, pero con todo el data-set (4000) tara casi 9 minutos.




<br>



### Validación simple con función propia  <a class="anchor" id="4.1"></a>


```python
def Simple_Validation_Classification(Data_Test, X_train, Y_train, Y_test) :

    ##########################

    from joblib import Parallel, delayed
    import multiprocessing

    n_jobs  = multiprocessing.cpu_count()

    ##########################

    ##########################

    def prediction(i, Data_Test, X_train, Y_train ):

     x_new = Data_Test.iloc[ i , range(1, Data_Test.shape[1])]

     prediction_group, proportions_groups_knn  =  KNN_classification( X_train , Y_train , x_new, 10 , distance = "Minkowski" , q = 2 )
     
     y_new_predict = prediction_group

     return(y_new_predict)

    ##########################

    y_predictions_vector = []

    # Paralelizamos el siguiente bucle for :

    # for i in  range(0, len(Data_Test)):

        # y_new_predict = prediction(i, Data_Test, X_train, Y_train )

        # y_predictions_vector.append( y_new_predict )

    
    y_predictions_vector = Parallel(n_jobs=n_jobs)( delayed(prediction)( i, Data_Test, X_train, Y_train) for i in range(0, len(Data_Test)) )

    #########################

    from itertools import chain

    TEC = 1 - sum(y_predictions_vector == Y_test)/len(Y_test)     

 
    return(y_predictions_vector , TEC)
```

<br>

Calculamos la métrica de validación TEC por validacion simple con la función anterior, para un KNN con K=10 y distancia Euclidea (Minkowski con q=2):


```python
y_predictions_vector , TEC = Simple_Validation_Classification(Data_Test, X_train, Y_train, Y_test)
```


```python
TEC
```




    0.03700000000000003





<br>

## Aplicación a clasificación multi-clase

Probamos nuestra función `KNN_classification` en un problema de clasificación multiclase:


```python
Wine_Classification = pd.read_csv('WineQT.csv')
```


```python
Wine_Classification.head()
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
      <th>fixed acidity</th>
      <th>volatile acidity</th>
      <th>citric acid</th>
      <th>residual sugar</th>
      <th>chlorides</th>
      <th>free sulfur dioxide</th>
      <th>total sulfur dioxide</th>
      <th>density</th>
      <th>pH</th>
      <th>sulphates</th>
      <th>alcohol</th>
      <th>quality</th>
      <th>Id</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>7.4</td>
      <td>0.70</td>
      <td>0.00</td>
      <td>1.9</td>
      <td>0.076</td>
      <td>11.0</td>
      <td>34.0</td>
      <td>0.9978</td>
      <td>3.51</td>
      <td>0.56</td>
      <td>9.4</td>
      <td>5</td>
      <td>0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>7.8</td>
      <td>0.88</td>
      <td>0.00</td>
      <td>2.6</td>
      <td>0.098</td>
      <td>25.0</td>
      <td>67.0</td>
      <td>0.9968</td>
      <td>3.20</td>
      <td>0.68</td>
      <td>9.8</td>
      <td>5</td>
      <td>1</td>
    </tr>
    <tr>
      <th>2</th>
      <td>7.8</td>
      <td>0.76</td>
      <td>0.04</td>
      <td>2.3</td>
      <td>0.092</td>
      <td>15.0</td>
      <td>54.0</td>
      <td>0.9970</td>
      <td>3.26</td>
      <td>0.65</td>
      <td>9.8</td>
      <td>5</td>
      <td>2</td>
    </tr>
    <tr>
      <th>3</th>
      <td>11.2</td>
      <td>0.28</td>
      <td>0.56</td>
      <td>1.9</td>
      <td>0.075</td>
      <td>17.0</td>
      <td>60.0</td>
      <td>0.9980</td>
      <td>3.16</td>
      <td>0.58</td>
      <td>9.8</td>
      <td>6</td>
      <td>3</td>
    </tr>
    <tr>
      <th>4</th>
      <td>7.4</td>
      <td>0.70</td>
      <td>0.00</td>
      <td>1.9</td>
      <td>0.076</td>
      <td>11.0</td>
      <td>34.0</td>
      <td>0.9978</td>
      <td>3.51</td>
      <td>0.56</td>
      <td>9.4</td>
      <td>5</td>
      <td>4</td>
    </tr>
  </tbody>
</table>
</div>




```python
Wine_Classification_Train = Wine_Classification.sample(frac=0.8, replace=False, weights=None, random_state=222, axis=None, ignore_index=False)

Wine_Classification_Test = Wine_Classification.drop( Wine_Classification_Train.index , )
```


```python
## TEST

X_test = Wine_Classification_Test.loc[: , Wine_Classification_Test.columns != 'quality']
Y_test = Wine_Classification_Test.loc[: , 'quality']

Data_Test = pd.concat([Y_test , X_test], axis=1)

##################################################################################################

## TRAIN

X_train = Wine_Classification_Train.loc[: , Wine_Classification_Train.columns != 'quality']
Y_train = Wine_Classification_Train.loc[: , 'quality']

Data_Train= pd.concat([Y_train , X_train], axis=1)
```


```python
x_new = X_test.iloc[5, :]
```



In this case response variable $Y$ has $10$ categories, so we are in a multi-class classification problem.




```python
prediction_group, proportions_groups_knn  = KNN_classification( X_train , Y_train , x_new, 10 , distance = "Euclidean" )
```


```python
prediction_group
```




    5.0




```python
proportions_groups_knn
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
      <th>proportions_groups</th>
      <th>groups</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>0.2</td>
      <td>4</td>
    </tr>
    <tr>
      <th>1</th>
      <td>0.7</td>
      <td>5</td>
    </tr>
    <tr>
      <th>2</th>
      <td>0.1</td>
      <td>6</td>
    </tr>
  </tbody>
</table>
</div>





Probamos con otras medidas de distancia:


```python
prediction_group, proportions_groups_knn  = KNN_classification( X_train , Y_train , x_new, 10 , distance = "Minkowski" , q = 1 )
```


```python
prediction_group
```




    5.0




```python
proportions_groups_knn
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
      <th>proportions_groups</th>
      <th>groups</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>0.1</td>
      <td>4</td>
    </tr>
    <tr>
      <th>1</th>
      <td>0.8</td>
      <td>5</td>
    </tr>
    <tr>
      <th>2</th>
      <td>0.1</td>
      <td>6</td>
    </tr>
  </tbody>
</table>
</div>






```python
prediction_group, proportions_groups_knn  = KNN_classification( X_train , Y_train , x_new, 10 , distance = "Mahalanobis" )
```


```python
prediction_group
```




    6.0




```python
proportions_groups_knn
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
      <th>proportions_groups</th>
      <th>groups</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>0.4</td>
      <td>5</td>
    </tr>
    <tr>
      <th>1</th>
      <td>0.6</td>
      <td>6</td>
    </tr>
  </tbody>
</table>
</div>




<br> 


Vamos a utilizar ahora en este mismo problema la funcion de `sklearn`:


```python
knn = sklearn.neighbors.KNeighborsClassifier(n_neighbors=10 ,  weights='uniform',  metric='euclidean')
```

Obtenemos la prediccion de la respuesta para la nueva observación y tambien las proporciones de las categorias de la respuesta para los K-vecinos mas cercanos de la nueva observación:

```python
knn.fit(X_train , Y_train)

knn.predict( [x_new] ) 

knn.predict_proba([x_new]) 
```

    [5]
    
    [[0.  0.2 0.7 0.1 0.  0. ]]
    

Cada proporcion corresponde con las siguientes categorias de la resspuesta:


```python
np.sort(Y_train.unique())
```




    array([3, 4, 5, 6, 7, 8], dtype=int64)






```python
knn = sklearn.neighbors.KNeighborsClassifier(n_neighbors=10 ,  weights='uniform',   p=1, metric='minkowski')
```


```python
knn.fit(X_train , Y_train)

print( knn.predict( [x_new] ) )

print( knn.predict_proba([x_new]) )
```

    [5]
    
    [[0.  0.1 0.8 0.1 0.  0. ]]
    



<br>


**Validación simple con función propia:**


```python
y_predictions_vector , TEC = Simple_Validation_Classification(Data_Test, X_train, Y_train, Y_test)
```


```python
TEC
```




    0.5502183406113537





**Validación simple con `sklearn`**


```python
knn_classification = sklearn.neighbors.KNeighborsClassifier(n_neighbors=10 ,  weights='uniform', p=2, metric='minkowski')

knn_classification.fit(X_train, Y_train)
```




    KNeighborsClassifier(n_neighbors=10)




```python
TEC_sklearn = 1 - knn_classification.score(X_test, Y_test)

TEC_sklearn
```




    0.5502183406113537





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



## Validación simple con función propia <a class="anchor" id="6.1"></a>


La siguiente función  considera un KNN para regresión con K=10 y distancia Euclidea , lo entrena con muestras de train  $X_{train}, Y_{train})$ pasadas como parametros, y calcula la metrica de validación ECM (error cuadratico medio) con una muetra de test de los predictores $X_{test}$, que tambén es pasada como parametro:

```python
def Simple_Validation_Regression(Data_Test, X_train, Y_train, Y_test) :

    ##########################

    from joblib import Parallel, delayed
    import multiprocessing

    n_jobs  = multiprocessing.cpu_count()

    ##########################

    knn_regression = sklearn.neighbors.KNeighborsRegressor(n_neighbors=10,  weights='uniform', p=2, metric='minkowski')

    ##########################

    def prediction(i, Data_Test, X_train, Y_train ):

     x_new = Data_Test.iloc[ i , range(1, Data_Test.shape[1])]

     knn_regression.fit(X_train, Y_train)
     
     y_new_predict = knn_regression.predict( [x_new] )

     return(y_new_predict)

    ##########################

    y_predictions_vector = []

    # Paralelizamos el siguiente bucle for :

    # for i in  range(0, len(Data_Test)):

        # y_new_predict = prediction(i, Data_Test, X_train, Y_train )

        # y_predictions_vector.append( y_new_predict )

    
    y_predictions_vector = Parallel(n_jobs=n_jobs)( delayed(prediction)( i, Data_Test, X_train, Y_train) for i in range(0, len(Data_Test)) )

    #########################

    from itertools import chain

    y_predictions_vector = list(chain(*y_predictions_vector))

    ECM = sum( (Y_test - y_predictions_vector)**2 )/len(Y_test)     

 
    return(y_predictions_vector , ECM)
```


Aplicamos la función anterior a nuestras muestras de train y test:

```python
y_predictions_vector , ECM = Simple_Validation_Regression(Data_Test, X_train, Y_train, Y_test)
```


```python
ECM
```




    1705355050546.1501



<br>



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


```python
def KNN_regression( X , Y , x_new, k, distance = "Minkowski" , q = 0, p1=0, p2=0, p3=0 ):

    
## Para paralelizar el algoritmo 

    from joblib import Parallel, delayed
    import multiprocessing

    n_jobs  = multiprocessing.cpu_count()

####################################################################################################################################################################################################################################################

    # Y, X y x_new deben ser objetos Pandas ya que luego seran convertidos a objetos Numpy automaticamente por el algoritmo
    
    # Y tiene que ser un Pandas data frame con la variable respuesta (que en este caso debe ser cuantitativa) 

    # X tiene que ser un Pandas data frame con los predictotres (X1,...,Xp). 

    # x_new tiene que ser un vector con una nueva observacion de los predictores. 


####################################################################################################################################################################################################################################################

    Y = Y.to_numpy()

    X = X.to_numpy() 

    x_new = x_new.to_numpy()

    X = np.concatenate((X, [x_new]), axis=0)


    distances = []

    Y_values_knn = []

##########################################################################################
    
    def a(Binary_Data) :

            X = Binary_Data

            a = X @ X.T

            return(a)

##########################################################################################

    def d(Binary_Data):

            X = Binary_Data

            ones_matrix = np.ones(( X.shape[0] , X.shape[1])) 

            d = (ones_matrix - X) @ (ones_matrix - X).T

            return(d)

##########################################################################################

    def alpha_py(i,j, Multiple_Categorical_Data):

            X = Multiple_Categorical_Data

            alpha = np.repeat(0, X.shape[1])

            def argumento_bucle_for(k):

                if X[i-1, k] == X[j-1, k] :

                    alpha[k] = 1

                else :

                    alpha[k] = 0

                return(alpha) 
    
            alpha=Parallel(n_jobs=n_jobs)( delayed(argumento_bucle_for)( k ) for k in range(0, X.shape[1]) )
    
            alpha = sum(alpha)

            return(alpha)

####################################################################################################################################################################################################################################################
    
    if distance == "Euclidean":

        def Dist_Euclidea_Python(i, j, Quantitative_Data_set): 

            Dist_Euclidea = ( ( Quantitative_Data_set[i-1, :] - Quantitative_Data_set[j-1, :] )**2 ).sum()

            Dist_Euclidea = np.sqrt(Dist_Euclidea)

            return Dist_Euclidea

    ###################################################################
           
        ## PARTE DEL CODIGO A PARALELIZAR

        #for j in range(1, len(X)):

          # distances.append( Dist_Euclidea_Python( len(X), i , X ) )

        n_jobs  = multiprocessing.cpu_count()

        distances = Parallel(n_jobs=n_jobs)( delayed(Dist_Euclidea_Python)( len(X), s , X ) for s in range(1, len(X)) )
           

    ###################################################################

    if distance == "Minkowski":

        def Dist_Minkowski_Python(i,j, q , Quantitative_Data_set):

            Dist_Minkowski = ( ( ( abs( Quantitative_Data_set[i-1, :] - Quantitative_Data_set[j-1, :] ) )**q ).sum() )**(1/q)

            return Dist_Minkowski

    ###################################################################

        ## PARTE DEL CODIGO A PARALELIZAR

        # for i in range(1, len(X)):

          #  distances.append( Dist_Minkowski_Python( len(X), i , q , X) )

        n_jobs  = multiprocessing.cpu_count()

        distances = Parallel(n_jobs=n_jobs)( delayed(Dist_Minkowski_Python)( len(X), s , q , X) for s in range(1, len(X)) )

    ###################################################################

    if distance == "Canberra":

        def Dist_Canberra_Python(i,j, Quantitative_Data_set):

            numerator =  abs( Quantitative_Data_set[i-1, :] - Quantitative_Data_set[j-1, :] )  

            denominator =  ( abs(Quantitative_Data_set[i-1, :]) + abs(Quantitative_Data_set[j-1, :]) )
       
            numerator=np.array([numerator], dtype=float)

            denominator=np.array([denominator], dtype=float)

            Dist_Canberra = ( np.divide( numerator , denominator , out=np.zeros_like(numerator), where=denominator!=0) ).sum()

            return Dist_Canberra

    ###################################################################

        ## PARTE DEL CODIGO A PARALELIZAR

        # for i in range(1, len(X)):

          #  distances.append( Dist_Canberra_Python( len(X), i , X) )

        n_jobs  = multiprocessing.cpu_count()

        distances = Parallel(n_jobs=n_jobs)( delayed(Dist_Canberra_Python)( len(X), s , X) for s in range(1, len(X)) )
                

    ###################################################################
   
    if distance == "Pearson":

        def Dist_Pearson_Python(i, j, Quantitative_Data_set):

            Dist_Pearson = ( ( Quantitative_Data_set[i-1, ] - Quantitative_Data_set[j-1, ] )**2 / Quantitative_Data_set.var() ).sum()

            Dist_Pearson = np.sqrt(Dist_Pearson)

            return Dist_Pearson

    ###################################################################

       ## PARTE DEL CODIGO A PARALELIZAR
       
       # for i in range(1, len(X)):

        #   distances.append( Dist_Pearson_Python( len(X), i , X) )

        
        n_jobs  = multiprocessing.cpu_count()

        distances = Parallel(n_jobs=n_jobs)( delayed(Dist_Pearson_Python)( len(X), s , X) for s in range(1, len(X)) )

    ###################################################################
    
    if distance == "Mahalanobis":

        def Dist_Mahalanobis_Python(i, j, Quantitative_Data_set):

            # All the columns of Quantitative_Data_set must be type = 'float' or 'int' (specially not 'object'), in other case we will find 
            # dimensional problems when Python compute   x @ S_inv @ x.T

            x = (Quantitative_Data_set[i-1, :] - Quantitative_Data_set[j-1, :])

            x = np.array([x]) # necessary step to transpose a 1D array

            S_inv = np.linalg.inv( np.cov(Quantitative_Data_set , rowvar=False) ) # inverse of covariance matrix

            Dist_Maha = np.sqrt( x @ S_inv @ x.T )  # x @ S_inv @ x.T = np.matmul( np.matmul(x , S_inv) , x.T )

            Dist_Maha = float(Dist_Maha)

            return Dist_Maha

        
    ###################################################################

    ## PARTE DEL CODIGO A PARALELIZAR

       # for i in range(1, len(X)):

        #    distances.append( Dist_Mahalanobis_Python( len(X), i , X) )

        n_jobs  = multiprocessing.cpu_count()

        distances = Parallel(n_jobs=n_jobs)( delayed(Dist_Mahalanobis_Python)( len(X), s , X) for s in range(1, len(X)) )
       

    ###################################################################
    
    if distance == "Sokal":

        a = X @ X.T
        n = X.shape[0]
        p = X.shape[1]
        ones_matrix = np.ones((n, p))
        b = (ones_matrix - X) @ X.T
        c = b.T
        d = (ones_matrix - X) @ (ones_matrix - X).T

        def Sokal_Similarity_Py(i, j):

            Sokal_Similarity = ( a[i-1 , j-1] + d[i-1 , j-1] ) / p

            return Sokal_Similarity


        def Dist_Sokal_Python(i, j, Binary_Data_set):

            dist_Sokal = np.sqrt( 2 - 2*Sokal_Similarity_Py(i,j, Binary_Data_set) )

            return dist_Sokal

    ###################################################################

    ## PARTE DEL CODIGO A PARALELIZAR

      #  for i in range(1, len(X)):

        #    distances.append( Dist_Sokal_Python( len(X), i , X) )

        n_jobs  = multiprocessing.cpu_count()

        distances = Parallel(n_jobs=n_jobs)( delayed(Dist_Sokal_Python)( len(X), s , X) for s in range(1, len(X)) )

    ###################################################################
   
    if distance == "Jaccard":

        def Jaccard_Similarity_Py(i, j, Binary_Data_Matrix):

            X = Binary_Data_Py
            a = X @ X.T
            n = X.shape[0]
            p = X.shape[1]
            ones_matrix = np.ones((n, p)) 
            b = (ones_matrix - X) @ X.T
            c = b.T
            d = (ones_matrix - X) @ (ones_matrix - X).T

            Jaccard_Similarity = a[i-1,j-1] / (a[i-1,j-1] + b[i-1,j-1] + c[i-1,j-1])
            
            return Jaccard_Similarity


        def Dist_Jaccard_Python(i, j, Binary_Data_set):

            dist_Jaccard = np.sqrt( Jaccard_Similarity_Py(i,i, Binary_Data_set) + Jaccard_Similarity_Py(i,i, Binary_Data_set) - 2*Jaccard_Similarity_Py(i,j, Binary_Data_set) )

            return dist_Jaccard

    ###################################################################

    ## PARTE DEL CODIGO A PARALELIZAR

       # for i in range(1, len(X)):

        #    distances.append( Dist_Jaccard_Python( len(X), i , X) )

        n_jobs  = multiprocessing.cpu_count()

        distances = Parallel(n_jobs=n_jobs)( delayed(Dist_Jaccard_Python)( len(X), s , X) for s in range(1, len(X)) )

    ###################################################################
    
    if distance == "Matches":

        def matches_similarity_py(i, j, Multiple_Categorical_Data):

            p = Multiple_Categorical_Data.shape[1]

            matches_similarity = alpha_py(i,j, Multiple_Categorical_Data) / p

            return(matches_similarity)


        def Dist_Matches_Py(i,j, Multiple_Categorical_Data):

            Dist_Matches = np.sqrt( matches_similarity_py(i, i, Multiple_Categorical_Data) +  matches_similarity_py(j, j, Multiple_Categorical_Data) - 2*matches_similarity_py(i, j, Multiple_Categorical_Data) )

            return( Dist_Matches )

    ###################################################################

        # for i in range(1, len(X)):

          #  distances.append( Dist_Matches_Py( len(X), i , X) )

        n_jobs  = multiprocessing.cpu_count()

        distances = Parallel(n_jobs=n_jobs)( delayed(Dist_Matches_Py)( len(X), s , X) for s in range(1, len(X)) )

 #######################################################################   
   
    if distance == "Gower":

        # The data matrix X have to be order in the following way:
        # The p1 first are quantitative, the following p2 are binary categorical, and the following p3 are multiple categorical.

##########################################################################################


        def Gower_Similarity_Python(i,j, Mixed_Data_Set, p1, p2, p3):

            X = Mixed_Data_Set

   # The data matrix X have to be order in the following way:
   # The p1 first are quantitative, the following p2 are binary categorical, and the following p3 are multiple categorical.

   #####################################################################################
        
            def G(k, X):

                range = X[:,k].max() - X[:,k].min() 

                return(range)

            G_vector = np.repeat(0.5, p1)

            for r in range(0, p1):

                G_vector[r] = G(r, X)
                
      
    ##########################################################################################
    
            ones = np.repeat(1, p1)

            Quantitative_Data = X[: , 0:p1]

            Binary_Data = X[: , (p1):(p1+p2)]
            
            Multiple_Categorical_Data = X[: , (p1+p2):(p1+p2+p3) ]

    ##########################################################################################

            numerator_part_1 = ( ones - ( abs(Quantitative_Data[i-1,:] - Quantitative_Data[j-1,:]) / G_vector ) ).sum() 

            numerator_part_2 = a(Binary_Data)[i-1,j-1] + alpha_py(i,j, Multiple_Categorical_Data)

            numerator = numerator_part_1 + numerator_part_2
 
            denominator = p1 + (p2 - d(Binary_Data)[i-1,j-1]) + p3

            Similarity_Gower = numerator / denominator  

            return(Similarity_Gower)

##########################################################################################

        def Dist_Gower_Py(i, j, Mixed_Data , p1, p2, p3):

            Dist_Gower = np.sqrt( 1 - Gower_Similarity_Python(i, j, Mixed_Data , p1, p2, p3) )

            return(Dist_Gower)    

    ###################################################################

        # for i in range(1, len(X)):

            # distances.append( Dist_Gower_Py( len(X), i , X, p1, p2, p3) )

        n_jobs  = multiprocessing.cpu_count()

        distances = Parallel(n_jobs=n_jobs)( delayed(Dist_Gower_Py)( len(X), s , X, p1, p2, p3) for s in range(1, len(X)) )

##############################################################################################################################################

    if distance == "Gower-BM" :

        def GowerBM_Similarity_Python(i,j, BM_Data_Set, p2, p3):

            X = BM_Data_Set

          # The data matrix X have to be order in the following way:
          # The p2 first are binary categorical, and the following p3 are multiple categorical.

##########################################################################################
       
            Binary_Data = X[: , 0:p2]

            Multiple_Categorical_Data = X[: , (p2):(p2+p3)]
 
##########################################################################################

 
            numerator_part_2 = a(Binary_Data)[i-1,j-1] + alpha_py(i,j, Multiple_Categorical_Data)

            numerator = numerator_part_2

            denominator = (p2 - d(Binary_Data)[i-1,j-1]) + p3

            Similarity_Gower = numerator / denominator  

            return(Similarity_Gower)

##############################################################################################################################################
        
        def Dist_GowerBM_Py(i, j, BM_Data ,  p2, p3):

            Dist_Gower = np.sqrt( 1 - GowerBM_Similarity_Python(i, j, BM_Data , p2, p3) )

            return(Dist_Gower)

##############################################################################################################################################

        # for i in range(1, len(X)):

            # distances.append( Dist_GowerBM_Py( len(X), i , X, p2, p3) )

        n_jobs  = multiprocessing.cpu_count()

        distances = Parallel(n_jobs=n_jobs)( delayed(Dist_GowerBM_Py)( len(X), s , X, p2, p3) for s in range(1, len(X)) )

##############################################################################################################################################
    
    if distance == "Gower-BQ" :

        def GowerBQ_Similarity_Python(i,j, BQ_Data_Set, p1, p2):

            X = BQ_Data_Set


        # The data matrix X have to be order in the following way:
        # The p1 first are quantitative, the following p2 are binary categorical 

##########################################################################################
        
            def G(k, X):

                range = X[:,k].max() - X[:,k].min() 

                return(range)

            G_vector = np.repeat(0.5, p1)

            for r in range(0, p1):

                G_vector[r] = G(r, X)
##########################################################################################
    
            ones = np.repeat(1, p1)

            Quantitative_Data = X[: , 0:p1]

            Binary_Data = X[: , (p1):(p1+p2)]
         
 
##########################################################################################

            numerator_part_1 = ( ones - ( abs(Quantitative_Data[i-1,:] - Quantitative_Data[j-1,:]) / G_vector ) ).sum() 

            numerator_part_2 = a(Binary_Data)[i-1,j-1] 
     
            numerator = numerator_part_1 + numerator_part_2

            denominator = p1 + (p2 - d(Binary_Data)[i-1,j-1])  

            Similarity_Gower = numerator / denominator  

            return(Similarity_Gower)

###############################################################################

        def Dist_GowerBQ_Py(i, j, BQ_Data ,  p1, p2):

            Dist_Gower = np.sqrt( 1 - GowerBQ_Similarity_Python(i, j, BQ_Data , p1, p2) )

            return(Dist_Gower)

##############################################################################################################################################

        # for i in range(1, len(X)):

        # distances.append( Dist_GowerBQ_Py( len(X), i , X, p1, p2) )

        n_jobs  = multiprocessing.cpu_count()

        distances = Parallel(n_jobs=n_jobs)( delayed(Dist_GowerBQ_Py)( len(X), s , X, p1, p2) for s in range(1, len(X)) )


##############################################################################################################################################
    
    if distance == "Gower-MQ" :
        
        def GowerMQ_Similarity_Python(i,j, MQ_Data_Set, p1, p3):

            X = MQ_Data_Set

   # The data matrix X have to be order in the following way:
   # The p1 first are quantitative, the following p2 are binary categorical, and the following p3 are multiple categorical.

##########################################################################################
            
            def G(k, X):

                range = X[:,k].max() - X[:,k].min() 

                return(range)

            G_vector = np.repeat(0.5, p1)

            for r in range(0, p1):

                G_vector[r] = G(r, X)

##########################################################################################
    
            ones = np.repeat(1, p1)

            Quantitative_Data = X[: , 0:p1]
    
            Multiple_Categorical_Data = X[: , (p1):(p1+p3)]
 
    
##########################################################################################

            numerator_part_1 = ( ones - ( (Quantitative_Data[i-1,:] - Quantitative_Data[j-1,:]).abs() / G_vector ) ).sum() 

            numerator_part_2 =   alpha_py(i,j, Multiple_Categorical_Data)

            numerator = numerator_part_1 + numerator_part_2

            denominator = p1 + p3

            Similarity_Gower = numerator / denominator  

            return(Similarity_Gower)



############################################################################################

        def Dist_GowerMQ_Py(i, j, MQ_Data ,  p1, p3):

                Dist_Gower = np.sqrt( 1 - GowerMQ_Similarity_Python(i, j, MQ_Data , p1, p3) )

                return(Dist_Gower)


######################################################################################################################################
        # for i in range(1, len(X)):

        # distances.append( Dist_GowerMQ_Py( len(X), i , X, p1, p3) )

        n_jobs  = multiprocessing.cpu_count()

        distances = Parallel(n_jobs=n_jobs)( delayed(Dist_GowerMQ_Py)( len(X), s , X, p1, p3) for s in range(1, len(X)) )
    
######################################################################################################################################
    
    distances = pd.DataFrame({'distances': distances})

    distances = distances.sort_values(by=["distances"]).reset_index(drop=False)
        
    knn = distances.iloc[0:k , :]

    for i in knn.iloc[:,0] :

        Y_values_knn.append(Y[i , ])


    y_predict = sum(Y_values_knn)/k

    
                                     
    return y_predict , distances 
```

<br>

Probando nuestra función `KNN_regression` :


```python
y_predict , distances  = KNN_regression( X_train, Y_train , x_new, k=10, distance = "Minkowski" , q = 2 )
```


```python
y_predict
```




    2026203.4




```python
distances
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
      <th>index</th>
      <th>distances</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>622</td>
      <td>3.092918</td>
    </tr>
    <tr>
      <th>1</th>
      <td>141</td>
      <td>4.384152</td>
    </tr>
    <tr>
      <th>2</th>
      <td>841</td>
      <td>4.455426</td>
    </tr>
    <tr>
      <th>3</th>
      <td>457</td>
      <td>4.823216</td>
    </tr>
    <tr>
      <th>4</th>
      <td>1414</td>
      <td>5.331320</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>1519</th>
      <td>922</td>
      <td>515.588851</td>
    </tr>
    <tr>
      <th>1520</th>
      <td>1276</td>
      <td>571.648778</td>
    </tr>
    <tr>
      <th>1521</th>
      <td>598</td>
      <td>572.971905</td>
    </tr>
    <tr>
      <th>1522</th>
      <td>1401</td>
      <td>625.342887</td>
    </tr>
    <tr>
      <th>1523</th>
      <td>1496</td>
      <td>700.606618</td>
    </tr>
  </tbody>
</table>
<p>1524 rows × 2 columns</p>
</div>



Probando otras medidas de distancias:


```python
y_predict , distances  = KNN_regression( X_train , Y_train , x_new, k=10, distance = "Minkowski" , q = 5 )
```


```python
y_predict
```




    2026203.4






```python
y_predict , distances  = KNN_regression( X_train , Y_train , x_new, k=10, distance = "Pearson" )
```


```python
y_predict
```




    2026203.4






```python
y_predict , distances  = KNN_regression( X_train , Y_train , x_new, k=10, distance = "Canberra" )
```


```python
y_predict
```




    1500199.9






```python
y_predict , distances  = KNN_regression( X_train , Y_train , x_new, k=10, distance = "Mahalanobis" )
```


```python
y_predict
```




    1706999.8





Since in this case $X$ is a matrix of **mixed data**, the most suitable distance allowed by our `KNN_regression` function is the **Gower distance**.

To use our Gower distance we must order the columns of $X$ appropriately. The first $p1$ will be the quantitative variables, the next $p2$ the binary ones and the last $p3$ the multi class ones


```python
X_train_new = X_train.loc[ : , ['size_in_m_2',  'latitude', 'longitude', 'no_of_bedrooms', 'no_of_bathrooms',           # Quantitatives (5)
                                    
                                     'maid_room_recode', 'unfurnished_recode', 'balcony_recode', 'barbecue_area_recode', 'central_ac_recode',
                                     'childrens_play_area_recode', 'childrens_pool_recode', 'concierge_recode', 'covered_parking_recode',
                                     'kitchen_appliances_recode', 'maid_service_recode', 'pets_allowed_recode', 'private_garden_recode',         # Binary (21)
                                     'private_gym_recode', 'private_jacuzzi_recode', 'private_pool_recode', 'security_recode',
                                     'shared_gym_recode', 'shared_pool_recode', 'shared_spa_recode', 'view_of_water_recode' ,
                                       
                                     'neighborhood_recode', 'quality_recode'         # Multi-class (2)
                                       
                            ]]    
```


```python
y_predict , distances  = KNN_regression( X_train_new , Y_train , x_new, 10,  "Gower",  5, 21, 2  )
```


```python
y_predict
```




    2261610.0




```python
distances
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
      <th>index</th>
      <th>distances</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>771</td>
      <td>0.467648</td>
    </tr>
    <tr>
      <th>1</th>
      <td>992</td>
      <td>0.467826</td>
    </tr>
    <tr>
      <th>2</th>
      <td>712</td>
      <td>0.474961</td>
    </tr>
    <tr>
      <th>3</th>
      <td>357</td>
      <td>0.479484</td>
    </tr>
    <tr>
      <th>4</th>
      <td>508</td>
      <td>0.485017</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>1519</th>
      <td>28</td>
      <td>0.772241</td>
    </tr>
    <tr>
      <th>1520</th>
      <td>1504</td>
      <td>0.789965</td>
    </tr>
    <tr>
      <th>1521</th>
      <td>1496</td>
      <td>0.793064</td>
    </tr>
    <tr>
      <th>1522</th>
      <td>364</td>
      <td>0.811451</td>
    </tr>
    <tr>
      <th>1523</th>
      <td>45</td>
      <td>0.853938</td>
    </tr>
  </tbody>
</table>
<p>1524 rows × 2 columns</p>
</div>





<br>



## Validación Simple con función propia <a class="anchor" id="7.1"></a>


```python
def Simple_Validation_Regression(Data_Test, X_train, Y_train, Y_test) :

    ##########################

    from joblib import Parallel, delayed
    import multiprocessing

    n_jobs  = multiprocessing.cpu_count()

    ##########################

    # Aqui usamos ahora nuestra funcion en lugar de la de Sklearn

    ##########################

    def prediction(i, Data_Test, X_train, Y_train ):

     x_new = Data_Test.iloc[ i , range(1, Data_Test.shape[1])]

     y_predict , distances  = KNN_regression( X_train , Y_train , x_new, k=10, distance = "Minkowski" , q = 2 )

     return(y_predict)

    ##########################

    y_predictions_vector = []

    # Paralelizamos el siguiente bucle for :

    # for i in  range(0, len(Data_Test)):

        # y_new_predict = prediction(i, Data_Test, X_train, Y_train )

        # y_predictions_vector.append( y_new_predict )

    
    y_predictions_vector = Parallel(n_jobs=n_jobs)( delayed(prediction)( i, Data_Test, X_train, Y_train) for i in range(0, len(Data_Test)) )

    #########################

    ECM = sum( (Y_test - y_predictions_vector)**2 )/len(Y_test)     

 
    return(y_predictions_vector , ECM)
```


```python
y_predictions_vector , ECM = Simple_Validation_Regression(Data_Test, X_train, Y_train, Y_test)
```


```python
ECM
```


    1705111679187.3896


<br>

# Selección del hiper-parámetro k



En este artículo no mostraremos cómo seleccionar el hiper-parámetro $k$ del modelo KNN, esta cuestión será tratada en otro articulo más genérico sobre ajuste de hiper-parámetros.




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
