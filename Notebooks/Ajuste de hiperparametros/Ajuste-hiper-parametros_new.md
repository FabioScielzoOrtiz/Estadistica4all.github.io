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
    




# Ajuste de hiperparametros con `Sklearn`


```python
from sklearn.model_selection import GridSearchCV
```


```python
knn_regression = sklearn.neighbors.KNeighborsRegressor( )
```


```python
grid_search = GridSearchCV(estimator = knn_regression, param_grid = {'n_neighbors': range(1,200), 'metric': ['euclidean','cosine','cityblock','manhattan']}, cv = 10, scoring='neg_mean_squared_error')
```


```python
Y = Data.loc[:,'price']

X = Data.loc[:, Data.columns != 'price']
```


```python
grid_search.fit(X,Y)
```


    ---------------------------------------------------------------------------

    KeyboardInterrupt                         Traceback (most recent call last)

    c:\Users\Usuario\Documents\fabio\Fabio\Estadistica4all.github.io-1\Notebooks\Ajuste de hiperparametros\Ajuste-hiper-parametros.ipynb Cell 91 in <cell line: 1>()
    ----> <a href='vscode-notebook-cell:/c%3A/Users/Usuario/Documents/fabio/Fabio/Estadistica4all.github.io-1/Notebooks/Ajuste%20de%20hiperparametros/Ajuste-hiper-parametros.ipynb#Y162sZmlsZQ%3D%3D?line=0'>1</a> grid_search.fit(X,Y)
    

    File c:\Users\Usuario\AppData\Local\Programs\Python\Python310\lib\site-packages\sklearn\model_selection\_search.py:891, in BaseSearchCV.fit(self, X, y, groups, **fit_params)
        885     results = self._format_results(
        886         all_candidate_params, n_splits, all_out, all_more_results
        887     )
        889     return results
    --> 891 self._run_search(evaluate_candidates)
        893 # multimetric is determined here because in the case of a callable
        894 # self.scoring the return type is only known after calling
        895 first_test_score = all_out[0]["test_scores"]
    

    File c:\Users\Usuario\AppData\Local\Programs\Python\Python310\lib\site-packages\sklearn\model_selection\_search.py:1392, in GridSearchCV._run_search(self, evaluate_candidates)
       1390 def _run_search(self, evaluate_candidates):
       1391     """Search all candidates in param_grid"""
    -> 1392     evaluate_candidates(ParameterGrid(self.param_grid))
    

    File c:\Users\Usuario\AppData\Local\Programs\Python\Python310\lib\site-packages\sklearn\model_selection\_search.py:838, in BaseSearchCV.fit.<locals>.evaluate_candidates(candidate_params, cv, more_results)
        830 if self.verbose > 0:
        831     print(
        832         "Fitting {0} folds for each of {1} candidates,"
        833         " totalling {2} fits".format(
        834             n_splits, n_candidates, n_candidates * n_splits
        835         )
        836     )
    --> 838 out = parallel(
        839     delayed(_fit_and_score)(
        840         clone(base_estimator),
        841         X,
        842         y,
        843         train=train,
        844         test=test,
        845         parameters=parameters,
        846         split_progress=(split_idx, n_splits),
        847         candidate_progress=(cand_idx, n_candidates),
        848         **fit_and_score_kwargs,
        849     )
        850     for (cand_idx, parameters), (split_idx, (train, test)) in product(
        851         enumerate(candidate_params), enumerate(cv.split(X, y, groups))
        852     )
        853 )
        855 if len(out) < 1:
        856     raise ValueError(
        857         "No fits were performed. "
        858         "Was the CV iterator empty? "
        859         "Were there no candidates?"
        860     )
    

    File c:\Users\Usuario\AppData\Local\Programs\Python\Python310\lib\site-packages\joblib\parallel.py:1046, in Parallel.__call__(self, iterable)
       1043 if self.dispatch_one_batch(iterator):
       1044     self._iterating = self._original_iterator is not None
    -> 1046 while self.dispatch_one_batch(iterator):
       1047     pass
       1049 if pre_dispatch == "all" or n_jobs == 1:
       1050     # The iterable was consumed all at once by the above for loop.
       1051     # No need to wait for async callbacks to trigger to
       1052     # consumption.
    

    File c:\Users\Usuario\AppData\Local\Programs\Python\Python310\lib\site-packages\joblib\parallel.py:861, in Parallel.dispatch_one_batch(self, iterator)
        859     return False
        860 else:
    --> 861     self._dispatch(tasks)
        862     return True
    

    File c:\Users\Usuario\AppData\Local\Programs\Python\Python310\lib\site-packages\joblib\parallel.py:779, in Parallel._dispatch(self, batch)
        777 with self._lock:
        778     job_idx = len(self._jobs)
    --> 779     job = self._backend.apply_async(batch, callback=cb)
        780     # A job can complete so quickly than its callback is
        781     # called before we get here, causing self._jobs to
        782     # grow. To ensure correct results ordering, .insert is
        783     # used (rather than .append) in the following line
        784     self._jobs.insert(job_idx, job)
    

    File c:\Users\Usuario\AppData\Local\Programs\Python\Python310\lib\site-packages\joblib\_parallel_backends.py:208, in SequentialBackend.apply_async(self, func, callback)
        206 def apply_async(self, func, callback=None):
        207     """Schedule a func to be run"""
    --> 208     result = ImmediateResult(func)
        209     if callback:
        210         callback(result)
    

    File c:\Users\Usuario\AppData\Local\Programs\Python\Python310\lib\site-packages\joblib\_parallel_backends.py:572, in ImmediateResult.__init__(self, batch)
        569 def __init__(self, batch):
        570     # Don't delay the application, to avoid keeping the input
        571     # arguments in memory
    --> 572     self.results = batch()
    

    File c:\Users\Usuario\AppData\Local\Programs\Python\Python310\lib\site-packages\joblib\parallel.py:262, in BatchedCalls.__call__(self)
        258 def __call__(self):
        259     # Set the default nested backend to self._backend but do not set the
        260     # change the default number of processes to -1
        261     with parallel_backend(self._backend, n_jobs=self._n_jobs):
    --> 262         return [func(*args, **kwargs)
        263                 for func, args, kwargs in self.items]
    

    File c:\Users\Usuario\AppData\Local\Programs\Python\Python310\lib\site-packages\joblib\parallel.py:262, in <listcomp>(.0)
        258 def __call__(self):
        259     # Set the default nested backend to self._backend but do not set the
        260     # change the default number of processes to -1
        261     with parallel_backend(self._backend, n_jobs=self._n_jobs):
    --> 262         return [func(*args, **kwargs)
        263                 for func, args, kwargs in self.items]
    

    File c:\Users\Usuario\AppData\Local\Programs\Python\Python310\lib\site-packages\sklearn\utils\fixes.py:216, in _FuncWrapper.__call__(self, *args, **kwargs)
        214 def __call__(self, *args, **kwargs):
        215     with config_context(**self.config):
    --> 216         return self.function(*args, **kwargs)
    

    File c:\Users\Usuario\AppData\Local\Programs\Python\Python310\lib\site-packages\sklearn\model_selection\_validation.py:672, in _fit_and_score(estimator, X, y, scorer, train, test, verbose, parameters, fit_params, return_train_score, return_parameters, return_n_test_samples, return_times, return_estimator, split_progress, candidate_progress, error_score)
        668     estimator = estimator.set_params(**cloned_parameters)
        670 start_time = time.time()
    --> 672 X_train, y_train = _safe_split(estimator, X, y, train)
        673 X_test, y_test = _safe_split(estimator, X, y, test, train)
        675 result = {}
    

    File c:\Users\Usuario\AppData\Local\Programs\Python\Python310\lib\site-packages\sklearn\utils\metaestimators.py:288, in _safe_split(estimator, X, y, indices, train_indices)
        286         X_subset = X[np.ix_(indices, train_indices)]
        287 else:
    --> 288     X_subset = _safe_indexing(X, indices)
        290 if y is not None:
        291     y_subset = _safe_indexing(y, indices)
    

    File c:\Users\Usuario\AppData\Local\Programs\Python\Python310\lib\site-packages\sklearn\utils\__init__.py:376, in _safe_indexing(X, indices, axis)
        370     raise ValueError(
        371         "Specifying the columns using strings is only supported for "
        372         "pandas DataFrames"
        373     )
        375 if hasattr(X, "iloc"):
    --> 376     return _pandas_indexing(X, indices, indices_dtype, axis=axis)
        377 elif hasattr(X, "shape"):
        378     return _array_indexing(X, indices, indices_dtype, axis=axis)
    

    File c:\Users\Usuario\AppData\Local\Programs\Python\Python310\lib\site-packages\sklearn\utils\__init__.py:218, in _pandas_indexing(X, key, key_dtype, axis)
        213     key = list(key)
        215 if key_dtype == "int" and not (isinstance(key, slice) or np.isscalar(key)):
        216     # using take() instead of iloc[] ensures the return value is a "proper"
        217     # copy that will not raise SettingWithCopyWarning
    --> 218     return X.take(key, axis=axis)
        219 else:
        220     # check whether we should index with loc or iloc
        221     indexer = X.iloc if key_dtype == "int" else X.loc
    

    File c:\Users\Usuario\AppData\Local\Programs\Python\Python310\lib\site-packages\pandas\core\generic.py:3703, in NDFrame.take(self, indices, axis, is_copy, **kwargs)
       3699 nv.validate_take((), kwargs)
       3701 self._consolidate_inplace()
    -> 3703 new_data = self._mgr.take(
       3704     indices, axis=self._get_block_manager_axis(axis), verify=True
       3705 )
       3706 return self._constructor(new_data).__finalize__(self, method="take")
    

    File c:\Users\Usuario\AppData\Local\Programs\Python\Python310\lib\site-packages\pandas\core\internals\managers.py:894, in BaseBlockManager.take(self, indexer, axis, verify)
        887 indexer = (
        888     np.arange(indexer.start, indexer.stop, indexer.step, dtype=np.intp)
        889     if isinstance(indexer, slice)
        890     else np.asanyarray(indexer, dtype=np.intp)
        891 )
        893 n = self.shape[axis]
    --> 894 indexer = maybe_convert_indices(indexer, n, verify=verify)
        896 new_labels = self.axes[axis].take(indexer)
        897 return self.reindex_indexer(
        898     new_axis=new_labels,
        899     indexer=indexer,
       (...)
        902     consolidate=False,
        903 )
    

    File c:\Users\Usuario\AppData\Local\Programs\Python\Python310\lib\site-packages\pandas\core\indexers\utils.py:291, in maybe_convert_indices(indices, n, verify)
        289 if verify:
        290     mask = (indices >= n) | (indices < 0)
    --> 291     if mask.any():
        292         raise IndexError("indices are out-of-bounds")
        293 return indices
    

    File c:\Users\Usuario\AppData\Local\Programs\Python\Python310\lib\site-packages\numpy\core\_methods.py:54, in _any(a, axis, dtype, out, keepdims, where)
         50 def _prod(a, axis=None, dtype=None, out=None, keepdims=False,
         51           initial=_NoValue, where=True):
         52     return umr_prod(a, axis, dtype, out, keepdims, initial, where)
    ---> 54 def _any(a, axis=None, dtype=None, out=None, keepdims=False, *, where=True):
         55     # Parsing keyword arguments is currently fairly slow, so avoid it for now
         56     if where is True:
         57         return umr_any(a, axis, dtype, out, keepdims)
    

    KeyboardInterrupt: 



```python
grid_search.best_estimator_
```




    KNeighborsRegressor(metric='cosine', n_neighbors=17)




```python
grid_search.best_params_
```




    {'metric': 'cosine', 'n_neighbors': 17}




```python
grid_search.best_score_
```




    -2278523570223.8994




```python
df_grid_search_sklearn = pd.DataFrame({'k': grid_search.cv_results_['param_n_neighbors'], 'distance': grid_search.cv_results_['param_metric'] , 'ECM': - grid_search.cv_results_['mean_test_score']})

```


```python
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




```python
df_grid_search_sklearn['k'] = df_grid_search_sklearn['k'].astype(str) 

df_grid_search_sklearn['distance'] = df_grid_search_sklearn['distance'].astype(str)
```


```python
df_grid_search_sklearn['k-distance'] = df_grid_search_sklearn[['k', 'distance']].agg('-'.join, axis=1)
```




```python
from sklearn.model_selection import RandomizedSearchCV
```


```python
random_search = RandomizedSearchCV(estimator = knn_regression, param_distributions = {'n_neighbors': range(1,200), 'metric': ['euclidean','cosine','cityblock','manhattan']}, cv = 10, n_iter=100, random_state=123, scoring='neg_mean_squared_error')
```


```python
random_search.fit(X,Y)
```




    RandomizedSearchCV(cv=10, estimator=KNeighborsRegressor(), n_iter=100,
                       param_distributions={'metric': ['euclidean', 'cosine',
                                                       'cityblock', 'manhattan'],
                                            'n_neighbors': range(1, 200)},
                       random_state=123, scoring='neg_mean_squared_error')




```python
df_random_search_sklearn = pd.DataFrame({'k': random_search.cv_results_['param_n_neighbors'], 'distance': random_search.cv_results_['param_metric'] , 'ECM': - random_search.cv_results_['mean_test_score']})
```


```python
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




```python
df_random_search_sklearn['k'] = df_random_search_sklearn['k'].astype(str) 

df_random_search_sklearn['distance'] = df_random_search_sklearn['distance'].astype(str)
```


```python
df_random_search_sklearn['k-distance'] = df_random_search_sklearn[['k', 'distance']].agg('-'.join, axis=1)
```


```python
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
      <th>k-distance</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>215</th>
      <td>17</td>
      <td>cosine</td>
      <td>2.278524e+12</td>
      <td>17-cosine</td>
    </tr>
    <tr>
      <th>209</th>
      <td>11</td>
      <td>cosine</td>
      <td>2.287579e+12</td>
      <td>11-cosine</td>
    </tr>
    <tr>
      <th>214</th>
      <td>16</td>
      <td>cosine</td>
      <td>2.300468e+12</td>
      <td>16-cosine</td>
    </tr>
    <tr>
      <th>216</th>
      <td>18</td>
      <td>cosine</td>
      <td>2.305225e+12</td>
      <td>18-cosine</td>
    </tr>
    <tr>
      <th>210</th>
      <td>12</td>
      <td>cosine</td>
      <td>2.308334e+12</td>
      <td>12-cosine</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>794</th>
      <td>198</td>
      <td>manhattan</td>
      <td>5.264590e+12</td>
      <td>198-manhattan</td>
    </tr>
    <tr>
      <th>197</th>
      <td>198</td>
      <td>euclidean</td>
      <td>5.266036e+12</td>
      <td>198-euclidean</td>
    </tr>
    <tr>
      <th>198</th>
      <td>199</td>
      <td>euclidean</td>
      <td>5.272047e+12</td>
      <td>199-euclidean</td>
    </tr>
    <tr>
      <th>596</th>
      <td>199</td>
      <td>cityblock</td>
      <td>5.273960e+12</td>
      <td>199-cityblock</td>
    </tr>
    <tr>
      <th>795</th>
      <td>199</td>
      <td>manhattan</td>
      <td>5.273960e+12</td>
      <td>199-manhattan</td>
    </tr>
  </tbody>
</table>
<p>796 rows × 4 columns</p>
</div>






```python
fig, axs = plt.subplots(1, 2, figsize=(17, 10))

p1 = sns.barplot(x="ECM", y ='k-distance' , data=df_grid_search_sklearn.iloc[0:15, :], palette='mako', ax=axs[0])

p1.title.set_text('KNN regression - Grid search - K fold (K=10)')

p2 = sns.barplot(x="ECM", y ='k-distance' , data=df_random_search_sklearn.iloc[0:15, :], palette='mako', ax=axs[1])

p2.title.set_text('KNN regression - Random search - K fold (K=10)')

fig.savefig('p3big.jpg', format='jpg', dpi=1200)

plt.show()
```


    
![png](output_108_0.png)
    




### Repetir lo anterior con knn classification y Accuracy (TAC),  con Sklearn.


```python
knn_classification = sklearn.neighbors.KNeighborsClassifier( )
```


```python
grid_search = GridSearchCV(estimator = knn_classification, param_grid = {'n_neighbors': range(1,200), 'metric': ['euclidean','cosine','cityblock','manhattan']}, cv = 10, scoring='accuracy')
```


```python
Y = Data.loc[:,'quality_recode']

X = Data.loc[:, Data.columns != 'quality_recode']
```


```python
grid_search.fit(X,Y)
```




    GridSearchCV(cv=10, estimator=KNeighborsClassifier(),
                 param_grid={'metric': ['euclidean', 'cosine', 'cityblock',
                                        'manhattan'],
                             'n_neighbors': range(1, 200)},
                 scoring='accuracy')




```python
grid_search.best_estimator_
```




    KNeighborsClassifier(metric='euclidean', n_neighbors=34)




```python
grid_search.best_score_
```




    0.6036731882061174




```python
df_grid_search_sklearn = pd.DataFrame({'k': grid_search.cv_results_['param_n_neighbors'], 'distance': grid_search.cv_results_['param_metric'] , 'TAC': grid_search.cv_results_['mean_test_score']})

```


```python
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




```python
df_grid_search_sklearn['k'] = df_grid_search_sklearn['k'].astype(str) 

df_grid_search_sklearn['distance'] = df_grid_search_sklearn['distance'].astype(str)
```


```python
df_grid_search_sklearn['k-distance'] = df_grid_search_sklearn[['k', 'distance']].agg('-'.join, axis=1)
```




```python
random_search = RandomizedSearchCV(estimator = knn_classification, param_distributions = {'n_neighbors': range(1,200), 'metric': ['euclidean','cosine','cityblock','manhattan']}, cv = 10, n_iter=100, random_state=123, scoring='accuracy')
```


```python
random_search.fit(X,Y)
```




    RandomizedSearchCV(cv=10, estimator=KNeighborsClassifier(), n_iter=100,
                       param_distributions={'metric': ['euclidean', 'cosine',
                                                       'cityblock', 'manhattan'],
                                            'n_neighbors': range(1, 200)},
                       random_state=123, scoring='accuracy')




```python
df_random_search_sklearn = pd.DataFrame({'k': random_search.cv_results_['param_n_neighbors'], 'distance': random_search.cv_results_['param_metric'] , 'TAC': random_search.cv_results_['mean_test_score']})
```


```python
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




```python
df_random_search_sklearn['k'] = df_random_search_sklearn['k'].astype(str) 

df_random_search_sklearn['distance'] = df_random_search_sklearn['distance'].astype(str)
```


```python
df_random_search_sklearn['k-distance'] = df_random_search_sklearn[['k', 'distance']].agg('-'.join, axis=1)
```


```python
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
      <th>k-distance</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>33</th>
      <td>34</td>
      <td>euclidean</td>
      <td>0.603673</td>
      <td>34-euclidean</td>
    </tr>
    <tr>
      <th>160</th>
      <td>161</td>
      <td>euclidean</td>
      <td>0.601573</td>
      <td>161-euclidean</td>
    </tr>
    <tr>
      <th>158</th>
      <td>159</td>
      <td>euclidean</td>
      <td>0.601573</td>
      <td>159-euclidean</td>
    </tr>
    <tr>
      <th>157</th>
      <td>158</td>
      <td>euclidean</td>
      <td>0.601573</td>
      <td>158-euclidean</td>
    </tr>
    <tr>
      <th>156</th>
      <td>157</td>
      <td>euclidean</td>
      <td>0.601573</td>
      <td>157-euclidean</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>600</th>
      <td>4</td>
      <td>manhattan</td>
      <td>0.460890</td>
      <td>4-manhattan</td>
    </tr>
    <tr>
      <th>200</th>
      <td>2</td>
      <td>cosine</td>
      <td>0.410485</td>
      <td>2-cosine</td>
    </tr>
    <tr>
      <th>598</th>
      <td>2</td>
      <td>manhattan</td>
      <td>0.394762</td>
      <td>2-manhattan</td>
    </tr>
    <tr>
      <th>399</th>
      <td>2</td>
      <td>cityblock</td>
      <td>0.394762</td>
      <td>2-cityblock</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>euclidean</td>
      <td>0.384260</td>
      <td>2-euclidean</td>
    </tr>
  </tbody>
</table>
<p>796 rows × 4 columns</p>
</div>




```python
fig, axs = plt.subplots(1, 2, figsize=(17, 10))

p1 = sns.barplot(x="TAC", y ='k-distance' , data=df_grid_search_sklearn.iloc[0:15, :], palette='mako', ax=axs[0])

p1.title.set_text('KNN classification - Grid search - K fold (K=10)')

p2 = sns.barplot(x="TAC", y ='k-distance' , data=df_random_search_sklearn.iloc[0:15, :], palette='mako', ax=axs[1])

p2.title.set_text('KNN classification - Random search - K fold (K=10)')

fig.savefig('p4big.jpg', format='jpg', dpi=1200)

plt.show()
```


    
![png](output_129_0.png)
    






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


