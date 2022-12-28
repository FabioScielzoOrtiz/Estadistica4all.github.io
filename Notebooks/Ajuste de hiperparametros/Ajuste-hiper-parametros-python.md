```python
import warnings
warnings.filterwarnings("ignore")
```


```python
import pandas as pd
import numpy as np
import math
import sklearn
import itertools

from sklearn.utils import resample
from sklearn.neighbors import NearestNeighbors
```


```python
Data = pd.read_csv('House_Price_Regression.csv')

Data = Data.loc[:, ['latitude', 'longitude', 'price', 'size_in_m_2', 'balcony_recode', 'private_garden_recode', 'quality_recode']]

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

    elif metric == 'TA' :  
        
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


    elif metric == 'TA':

        for b in range(0,B) :

            TA_test_list.append( simple_validation_random(D, k, response, random_seed=seed_array[b], metric=metric, model=model) )


        TA_test = np.mean(TA_test_list)    

        return TA_test 
```







## Grid search 


```python
def Grid_search(Data, Search_Space, response, model, validation, metric, B, k, K, random_search, random_seed_1, random_seed_2, random_samples):

   Grid_Search_Metric_list = []

   hyperparameter_combinations = list( itertools.product(Search_Space[0], Search_Space[1]) )

   if random_search == True : hyperparameter_combinations = resample(hyperparameter_combinations, n_samples=random_samples, replace=False, random_state=random_seed_1)
   else : pass


   if model == 'knn_regression' :

      if validation == 'repeated_random_simple_validation' :

         for h in hyperparameter_combinations :
            
            # Setting the hyperparameters of the model

            knn_regression = sklearn.neighbors.KNeighborsRegressor(n_neighbors=h[0] ,  metric=h[1]) 

            # Applying a validation algorithm on the model  

            Grid_Search_Metric_list.append( repeated_random_simple_validation(Data, k, B, response, random_seed_2, metric, model=knn_regression) )


         df = pd.DataFrame({'(k , distance)': hyperparameter_combinations, metric: Grid_Search_Metric_list})

         if metric == 'ECM' :

            df = df.sort_values(by=metric, ascending=True)

         elif metric == 'TA' :

            df = df.sort_values(by=metric, ascending=False)
   
   
   return df
```


```python
df_Grid_Search = Grid_search(Data=Data, Search_Space=[range(1,200) , ['euclidean','cosine','cityblock','manhattan']], response='price', model='knn_regression', validation='repeated_random_simple_validation', metric='ECM', B=10, k=0.75, K='no', random_search=False, random_samples=150, random_seed_1=123, random_seed_2=123)
```

Time: 2.54min


```python
df_Grid_Search
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
      <td>2.090463e+12</td>
    </tr>
    <tr>
      <th>57</th>
      <td>(15, cosine)</td>
      <td>2.093899e+12</td>
    </tr>
    <tr>
      <th>65</th>
      <td>(17, cosine)</td>
      <td>2.094901e+12</td>
    </tr>
    <tr>
      <th>58</th>
      <td>(15, cityblock)</td>
      <td>2.100255e+12</td>
    </tr>
    <tr>
      <th>59</th>
      <td>(15, manhattan)</td>
      <td>2.100255e+12</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>790</th>
      <td>(198, cityblock)</td>
      <td>4.361641e+12</td>
    </tr>
    <tr>
      <th>791</th>
      <td>(198, manhattan)</td>
      <td>4.361641e+12</td>
    </tr>
    <tr>
      <th>792</th>
      <td>(199, euclidean)</td>
      <td>4.364307e+12</td>
    </tr>
    <tr>
      <th>794</th>
      <td>(199, cityblock)</td>
      <td>4.367750e+12</td>
    </tr>
    <tr>
      <th>795</th>
      <td>(199, manhattan)</td>
      <td>4.367750e+12</td>
    </tr>
  </tbody>
</table>
<p>796 rows × 2 columns</p>
</div>




```python
df_Grid_Search = Grid_search(Data=Data, Search_Space=[range(1,200) , ['euclidean','cosine','cityblock','manhattan']], response='price', model='knn_regression', validation='repeated_random_simple_validation', metric='ECM', B=10, k=0.75, K='no', random_search=True, random_samples=150, random_seed_1=123, random_seed_2=123)
```

Time: 33 seg


```python
df_Grid_Search
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
      <td>2.093899e+12</td>
    </tr>
    <tr>
      <th>97</th>
      <td>(14, cityblock)</td>
      <td>2.103775e+12</td>
    </tr>
    <tr>
      <th>44</th>
      <td>(14, manhattan)</td>
      <td>2.103775e+12</td>
    </tr>
    <tr>
      <th>145</th>
      <td>(20, manhattan)</td>
      <td>2.120384e+12</td>
    </tr>
    <tr>
      <th>59</th>
      <td>(20, cityblock)</td>
      <td>2.120384e+12</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>56</th>
      <td>(188, euclidean)</td>
      <td>4.292571e+12</td>
    </tr>
    <tr>
      <th>110</th>
      <td>(190, manhattan)</td>
      <td>4.312643e+12</td>
    </tr>
    <tr>
      <th>128</th>
      <td>(196, cityblock)</td>
      <td>4.351279e+12</td>
    </tr>
    <tr>
      <th>142</th>
      <td>(198, manhattan)</td>
      <td>4.361641e+12</td>
    </tr>
    <tr>
      <th>17</th>
      <td>(198, cityblock)</td>
      <td>4.361641e+12</td>
    </tr>
  </tbody>
</table>
<p>150 rows × 2 columns</p>
</div>







## Grid search como metodo de optimizacion de funciones matematicas


```python
values = []

for x in range(-99999 , 99999) :

    values.append( x**2 )

```


```python
df = pd.DataFrame({'x':range(-99999 , 99999)  , 'f(x)':values})
```


```python
df.sort_values(by='f(x)')
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
      <th>x</th>
      <th>f(x)</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>99999</th>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>99998</th>
      <td>-1</td>
      <td>1</td>
    </tr>
    <tr>
      <th>100000</th>
      <td>1</td>
      <td>1</td>
    </tr>
    <tr>
      <th>100001</th>
      <td>2</td>
      <td>4</td>
    </tr>
    <tr>
      <th>99997</th>
      <td>-2</td>
      <td>4</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>2</th>
      <td>-99997</td>
      <td>9999400009</td>
    </tr>
    <tr>
      <th>199996</th>
      <td>99997</td>
      <td>9999400009</td>
    </tr>
    <tr>
      <th>199997</th>
      <td>99998</td>
      <td>9999600004</td>
    </tr>
    <tr>
      <th>1</th>
      <td>-99998</td>
      <td>9999600004</td>
    </tr>
    <tr>
      <th>0</th>
      <td>-99999</td>
      <td>9999800001</td>
    </tr>
  </tbody>
</table>
<p>199998 rows × 2 columns</p>
</div>






```python
values , Search_Space_list = [] , []

Search_Space_1 = range(-100 , 100)

Search_Space_2 = range(-100 , 100)

hyperparameter_combinations = list( itertools.product(Search_Space_1, Search_Space_2) )

for x in hyperparameter_combinations :

    Search_Space_list.append(x)

    values.append( x[0]**2 + x[1]**2)

```


```python
df = pd.DataFrame({'(x_1,x_2)':Search_Space_list , 'f(x_1,x_2)':values})
```


```python
df.sort_values(by='f(x_1,x_2)', ascending=True )
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
      <th>(x_1,x_2)</th>
      <th>f(x_1,x_2)</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>20100</th>
      <td>(0, 0)</td>
      <td>0</td>
    </tr>
    <tr>
      <th>20101</th>
      <td>(0, 1)</td>
      <td>1</td>
    </tr>
    <tr>
      <th>20300</th>
      <td>(1, 0)</td>
      <td>1</td>
    </tr>
    <tr>
      <th>20099</th>
      <td>(0, -1)</td>
      <td>1</td>
    </tr>
    <tr>
      <th>19900</th>
      <td>(-1, 0)</td>
      <td>1</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>39800</th>
      <td>(99, -100)</td>
      <td>19801</td>
    </tr>
    <tr>
      <th>200</th>
      <td>(-99, -100)</td>
      <td>19801</td>
    </tr>
    <tr>
      <th>199</th>
      <td>(-100, 99)</td>
      <td>19801</td>
    </tr>
    <tr>
      <th>1</th>
      <td>(-100, -99)</td>
      <td>19801</td>
    </tr>
    <tr>
      <th>0</th>
      <td>(-100, -100)</td>
      <td>20000</td>
    </tr>
  </tbody>
</table>
<p>40000 rows × 2 columns</p>
</div>


