# Cross Validation in `Python`


```python
import warnings
warnings.filterwarnings("ignore")
```


```python
import pandas as pd
import numpy as np
import math
import sklearn

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





## Not random simple validation


```python
def simple_validation_not_random(D, k, response, metric, model):

    # D --> have to be a pandas data frame.

    # k --> is the proportion of observation of D that define D_train.

    # response --> have to be a string with the name of the response variable.

    N = len(D)

    D_train = D.iloc[0:(math.floor(k*N)+1) , :]

    D_test = D.iloc[(math.floor(k*N)+1):N , :]

    X_train = D_train.loc[: , D_train.columns != response]
    Y_train = D_train.loc[: , response]

    X_test = D_test.loc[: , D_test.columns != response]
    Y_test = D_test.loc[: , response]

############################################################################

    # Training the model wit train sample

    model.fit(X_train, Y_train)

    # Making predictions with test sample

    Y_predict_test = model.predict( X_test )     

############################################################################

 # Computing the test metric

    if metric == 'ECM' :  
        
        ECM_test = np.mean( (Y_predict_test - Y_test)**2 )

        return ECM_test

    elif metric == 'TA' :  
        
        TA_test = np.mean( (Y_predict_test == Y_test) )

        return TA_test
```


```python
knn_regression = sklearn.neighbors.KNeighborsRegressor(n_neighbors=10 ,  p=2, metric='minkowski')
```


```python
ECM_test  = simple_validation_not_random(D=Data, k=0.75, response='price', metric='ECM', model=knn_regression)

ECM_test
```




    2198758842331.1843




```python
knn_classification = sklearn.neighbors.KNeighborsClassifier(n_neighbors=10 ,  p=2, metric='minkowski')
```


```python
TA_test  = simple_validation_not_random(D=Data, k=0.75, response='quality_recode', metric='TA', model=knn_classification)

TA_test
```




    0.5651260504201681





## Random simple validation


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
knn_regression = sklearn.neighbors.KNeighborsRegressor(n_neighbors=10 ,  p=2, metric='minkowski')
```


```python
ECM_test = simple_validation_random(D=Data, k=0.75, response='price', random_seed=123, metric='ECM', model=knn_regression)

ECM_test
```




    2505043526308.227




```python
knn_classification = sklearn.neighbors.KNeighborsClassifier(n_neighbors=10 ,  p=2, metric='minkowski')
```


```python
TA_test = simple_validation_random(D=Data, k=0.75, response='quality_recode', random_seed=123, metric='TA', model =knn_classification)

TA_test
```




    0.5777310924369747





## Repeted random simple validation


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


```python
knn_regression = sklearn.neighbors.KNeighborsRegressor(n_neighbors=10 ,  p=2, metric='minkowski')
```


```python
ECM_test = repeated_random_simple_validation(D=Data, k=0.75, B=1000, response='price', random_seed=123, metric='ECM', model=knn_regression)
```

Time: 14.4seg


```python
ECM_test
```




    2306416584216.64




```python
knn_classification = sklearn.neighbors.KNeighborsClassifier(n_neighbors=10 ,  p=2, metric='minkowski')
```


```python
TA_test = repeated_random_simple_validation(D=Data, k=0.75, B=1000, response='quality_recode', random_seed=123, metric='TA', model=knn_classification)
```

Time: 43 seg


```python
TA_test
```




    0.5519558823529411





## Leave one out


```python
def leave_one_out_validation(D, response, metric, model):

    # D --> have to be a pandas data frame.

    # k --> is the proportion of observation of D that define D_train.

    # response --> have to be a string with the name of the response variable.

    ECM_test_list , TA_test_list = [ ] , [ ]

    N = len(D)

    for r in range(0,N):

        D_test = D.iloc[r,:]
        D_train = D.drop( r , )

        X_train = D_train.loc[: , D_train.columns != response]
        Y_train = D_train.loc[: , response]

        X_test = D_test.loc[D_test.index != response]
        Y_test = D_test.loc[response]

############################################################################

        # Training the model wit train sample

        model.fit(X_train, Y_train)

        # Making predictions with test sample

        Y_predict_test = model.predict( pd.DataFrame([X_test]) ) 
        
############################################################################

        if metric == 'ECM' :  ECM_test_list.append( np.mean( (Y_predict_test - Y_test)**2 ) )
    
        elif metric == 'TA' :  TA_test_list.append( np.mean( (Y_predict_test == Y_test ) ) )

############################################################################
        
    if metric == 'ECM' : 
        
        ECM_test = np.mean(ECM_test_list)

        return ECM_test


    elif metric == 'TA' :

        TA_test = np.mean(TA_test_list)

        return TA_test

```


```python
knn_regression = sklearn.neighbors.KNeighborsRegressor(n_neighbors=10 ,  p=2, metric='minkowski')
```


```python
ECM_test = leave_one_out_validation(D=Data, response='price', metric='ECM', model=knn_regression)
```

Time: 24seg


```python
ECM_test
```




    2284557265816.7




```python
knn_classification = sklearn.neighbors.KNeighborsClassifier(n_neighbors=10 ,  p=2, metric='minkowski')
```


```python
TA_test = leave_one_out_validation(D=Data, response='quality_recode', metric='TA', model=knn_classification)

TA_test
```




    0.5511811023622047



Time: 26seg



# K Folds


```python
def K_Fold_CV(D, K, response, random_seed, metric, model):

    ECM_K_FOLDS_vector , TA_K_FOLDS_vector = [] , []

    np.random.seed(random_seed)

    sample = resample(range(0, len(D)), n_samples=len(D), replace=False)

    df_sample = pd.DataFrame({'index': range(0,len(D)) , 'sample':sample})

    Q = []

    for q in np.arange(0 , 1 + 1/K , 1/K):

        Q.append( np.quantile( range(0, len(D)) , q ).round(0) )


    for j in range(0, len(Q)-1):

            X_test = D.loc[df_sample.loc[Q[j]:(math.floor(Q[j+1])-1), 'sample'] , D.columns != response ] 
            Y_test = D.loc[df_sample.loc[Q[j]:(math.floor(Q[j+1])-1), 'sample'] , D.columns == response ]

            X_train = D.loc[ : , D.columns != response ].drop(df_sample.loc[Q[j]:(math.floor(Q[j+1])-1), 'sample'] )
            Y_train = D.loc[ : ,  D.columns == response ].drop(df_sample.loc[Q[j]:(math.floor(Q[j+1])-1), 'sample'])
            
            Y_test = Y_test.to_numpy()

           #########################################################################

            if model == 'knn_regression' :

              # Training the model wit train sample

                knn_regression.fit(X_train, Y_train)


               # Making predictions with test sample

                Y_predict_test = knn_regression.predict( X_test ) 

    
            elif model == 'knn_classification' :

               # Training the model wit train sample

                knn_classification.fit(X_train, Y_train)


               # Making predictions with test sample

                Y_predict_test = knn_classification.predict( X_test )  

            #########################################################################

            if metric == 'ECM' :  ECM_K_FOLDS_vector.append( np.mean( ( Y_predict_test - Y_test )**2 ) )

            elif metric == 'TA' :  TA_K_FOLDS_vector.append( np.mean( ( Y_predict_test == Y_test ) ) )

##################################################################################################################################################

    if metric == 'ECM' :

        ECM_K_Folds = np.mean(ECM_K_FOLDS_vector)
    
        return  ECM_K_Folds

    
    elif metric == 'TA' :

        TA_K_Folds = np.mean(TA_K_FOLDS_vector)
    
        return  TA_K_Folds
```


```python
knn_regression = sklearn.neighbors.KNeighborsRegressor(n_neighbors=10 ,  p=2, metric='minkowski')
```


```python
ECM_K_Folds = K_Fold_CV(D=Data, response='price', K=10, random_seed=123, metric='ECM', model='knn_regression')
```

Time: 0.3seg


```python
ECM_K_Folds
```




    2234798522449.1147




```python
knn_classification = sklearn.neighbors.KNeighborsClassifier(n_neighbors=10 ,  p=2, metric='minkowski')
```


```python
TA_K_Folds = K_Fold_CV(D=Data, response='quality_recode', K=10, random_seed=123, metric='TA', model='knn_classification')

TA_K_Folds
```




    0.5366807546993878



Time: 0.5 seg



## Repeted k-folds


```python
def repeated_K_Fold_CV(D, B, K, response, random_seed, metric, model):


    ECM_Repeted_K_Folds_vector , TA_Repeted_K_Folds_vector = [] , []

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
            
            if model == 'knn_regression' :

              # Training the model wit train sample

                knn_regression.fit(X_train, Y_train)


               # Making predictions with test sample

                Y_predict_test = knn_regression.predict( X_test ) 

    
            elif model == 'knn_classification' :

               # Training the model wit train sample

                knn_classification.fit(X_train, Y_train)


               # Making predictions with test sample

                Y_predict_test = knn_classification.predict( X_test )  

        #######################################################################

            if metric == 'ECM' :  ECM_K_FOLDS_vector.append( np.mean( ( Y_predict_test - Y_test )**2 ) )

            elif metric == 'TA' :  TA_K_FOLDS_vector.append( np.mean( ( Y_predict_test == Y_test ) ) )

        #######################################################################
    
        if metric == 'ECM' : ECM_Repeted_K_Folds_vector.append( np.mean(ECM_K_FOLDS_vector) )

        elif metric == 'TA' : TA_Repeted_K_Folds_vector.append( np.mean(TA_K_FOLDS_vector) )

##########################################################################################################################

    if metric == 'ECM' :
        
        ECM_Repeted_K_Folds = np.mean(ECM_Repeted_K_Folds_vector)

        return  ECM_Repeted_K_Folds
        

    elif metric == 'TA' :
        
        TA_Repeted_K_Folds = np.mean(TA_Repeted_K_Folds_vector)

        return  TA_Repeted_K_Folds
    
    
```


```python
knn_regression = sklearn.neighbors.KNeighborsRegressor(n_neighbors=10 ,  p=2, metric='minkowski')
```


```python
ECM_repeated_K_Folds = repeated_K_Fold_CV(D=Data, response='price', K=10, B=100, random_seed=123, metric='ECM', model='knn_regression')
```

Time: 19seg


```python
ECM_repeated_K_Folds
```




    2279041727691.3813




```python
knn_classification = sklearn.neighbors.KNeighborsClassifier(n_neighbors=10 ,  p=2, metric='minkowski')
```


```python
TA_repeated_K_Folds = repeated_K_Fold_CV(D=Data, response='quality_recode', K=10, B=100, random_seed=123, metric='TA', model='knn_classification')
```

Time:30seg


```python
TA_repeated_K_Folds
```




    0.5372861131666384






