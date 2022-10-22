---
title: 'Model Selection in Linear Regression'
author: 'Fabio Scielzo Ortiz'
date: '16/10/22'
css: custom.css
output: 
   rmdformats::readthedown:
      use_bookdown: true
      self_contained: true
      thumbnails: true
      lightbox: true
      gallery: false
      highlight: tango
      
---




# Linear Regression with `Python` and `R`



More articles in my blog:   $\hspace{0.1cm}$   [Estadistica4all](https://fabioscielzoortiz.github.io/Estadistica4all.github.io/)

&nbsp;

How to reference this article ? 

Scielzo Ortiz, F. (2022). Linear Regression with Python and R. *Estadistica4all*.  [Linear Regression with Python and R](https://fabioscielzoortiz.github.io/Estadistica4all.github.io/Articulos/Linear%20Regression%20in%20Python%20and%20R.html )



## Index



* [Data-set description](#1)
* * [Data Manipulation in `R`](#2)
* * [Data Manipulation in `Python`](#3)




  
* [Introduction to the Linear Regression Model](#4)
* * [Usefulness of the Linear Regression Model](#5)
* * [Formal Approach to the Linear Regression Modelo](#6)
* * [Basic Assumptions](#7)
* * [Assumptions Consequences](#8)
* * [Matrix representation of the basic assumption of the model](#9)
  
 <br>

  
* [Estimation](#10)
  
  
* * [Prediction of Response Variable](#11)
* * [Estimation of model coefficients](#12)
* * [Estimation of model errors](#13)
* * [Residual sum of squares (RSS)](#13.1)
* * [Regression Hyperplane ](#14)
* * [Hat-Matrix](#15)
  

* * [Estimation of the Linear Regression Model in `R`](#16)
* * [Estimation of Linear Regression Model in `Python` with `statsmodels`](#17)
* * [Estimation of Linear Regression Model in `Python` with `scikit-learn`](#18)


* * [Precision of the estimations of model coefficients](#19)
* * * [Estimation of the standard deviation of coefficients estimators in `R`](#20)
* * * [Estimation of the standard deviation of coefficients estimators in `Python`](#21)


* * [Model Predictions in `R`](#22)
* * [ Model Predictions in `Python` with `Statsmodels`](#23)
* * [Model Predictions in `Python` with `Sk-learn`](#24)


* * [Estimation of model errors in `R` ](#25)
* * [Estimation of model errors in `Python`](#26)
  


* * [Estimation of the error variance (Residual Variance)](#27)
* * * [Estimation of the error variance in `R` ](#28)
* * * [Estimation of the error variance in `Python` ](#29)

<br>

 

* [Model Training Validation ](#30)
* * [Model Training Validation in `R`](#31)
* * [Model Training Validation in `Python`](#32)

<br>



* [Model Coefficients Interpretation](#33)
* * [Null Coefficient](#34)
* * [Quantitative Predictor Coefficient](#35)
* * [Categorical Predictor Coefficient](#36)
* * * [Example of coefficients interpretation](#37)
* * [Interaction  Coefficient](#38)
* * * [Example of interaction coefficient interpretation](#39)
  
<br>

* [Inference](#40)
  
 
* * [Confidence Interval for $\beta_j$](#41)
* * [Confidence Interval for $\sigma^2$](#42)
* * * [Confidence Interval for  $\beta_j$  in `R`](#43)
* * * [Confidence Interval for  $\beta_j$  in `Python`](#44)
* * * [Confidence Interval for  $\sigma^2$  in `R`](#45)
* * * [Confidence Interval for  $\sigma^2$  in `Python`](#46)
  
  <br>

* * [t-test: Test for $\beta_j$](#47)
* * [Test of Significance for $\beta_j$](#48)
* * * [Test of Significance  in `R` ](#49)
* * * [Test of Significance  in `Python` ](#50)
* * [ANOVA test](#51)
* * * [ANOVA test in `R`](#52)
* * * [ANOVA test in `Python`](#53)





* * [Prediction Interval for $y_i$](#53.1)
* * * [Prediction Interval for $y_i$ in `Python`](#53.2)

<br>


* [Goodness of Fit: R-square](#54)
* * [Compute $R^2$ in `R`](#55)
* * [Compute $R^2$ in `Python`](#56)


* [Goodness of Fit: Adjusted R-square ](#57)
* * [Compute $\widehat{R^2}$ in `R`](#58)
* * [Compute $\widehat{R^2}$ in `Python`](#59)
  
  <br>

  
* [Model Problems](#60)
  




* * [Multicollinearity](#61)
* * * [Types of multicollinearity](#62)
* * * [Identification of multicollinearity](#63)
* * * * [Identification of multicollinearity with $VIF$](#64)
* * * * [Identification of multicollinearity with $R$](#65)
* * * * [Identification of multicollinearity with  condition number of $\hspace{0.05cm} R$](#66)
* * * * [Identification of multicollinearity with $GVIF$](#67)
  



  
* * [Checking Error Assumptions](#68)
* * * [Checking Error Constant Variance](#69)
* * * [Checking Null Error Mean](#70)
* * * [Checking Error Normality](#71)
* * * [Checking Null Error Correlation](#72)





* * [Checking Linear Assumption](#73)





 

* * [Finding Outliers](#74)

  





----------------------------



 ##     Data-set description <a class="anchor" id="1"></a>
 





We are going to describe the data-set we will use in this article.

The data are 1905 observation about 38 variables on housing features.

Here is the link where the data was loaded:
<https://www.kaggle.com/datasets/dataregress/dubai-properties-dataset?resource=download>



The variables of our interest are the following:

-   id : identificator

-   neighborhood: the name of the neighborhood

-   latitude: the latitude of the house

-   longitude: the longitude of the house

-   price: the market price of the house

-   size_in_sqft: the size of the house in square foot

    -   1 sqft = 0.092903 $m^2$

-   price_per_sqft: the market price of the house per square foot

-   no_of_bedrooms: number of bedrooms in the house

-   no_of_bathrooms: number of bathrooms in the house

-   quality: quality of the house. Based on the number of services. Her
    categories are Ultra, High, Medium and Low

-   maid_room: indicates if the house has maid room (cuarto de servicio)
    (true/false)

-   unfurnished: indicates if the house is unfurnished (sin amueblar)
    (true/false)

-   balcony: indicates if the house has balcony (true/false)

-   barbecue_area: indicates if the house has barbecue area (true/false)

-   central_ac: indicates if the house has central air conditioning
    (true/false)

-   childrens_play_area: indicatees if the house has childrens game area
    (true/false)

-   childrens_pool: indicates if the house has childrens pool
    (true/false)

-   concierge: indicates if the house has concierge (true/false)

-   covered_parking: indicates if the house has covered parking
    (true/false)

-   kitchen_appliances: indicates if the house has kitchen appliances
    (electrodomesticos de cocina) (true/false)

-   maid_service: indicates if the house has maid service (servicio de
    limpieza) (true/false)

-   pets_allowed: indicates if pets are allowed(true/false)

-   private_garden: indicates if the house has private garden
    (true/false)

-   private_gym: indicates if the house has private gym (true/false)

-   private_jacuzzi: indicates if the house has private jacuzzi
    (true/false)

-   private_pool: indicates if the house has private pool (true/false)

-   security: indicates if the house has private secutity (true/false)

-   shared_gym: indicates if the house has shared gym (true/false)

-   shared_pool: indicates if the house has shared pool (true/false)

-   shared_spa: indicates if the house has shared spa (true/false)

-   view_of_water: indicates if the house has view of the water
    (true/false)





Now we are going to do the following:

1. We are going to load an manipulate the data-set in R

2. We will repeat this task in Python





----------------------------



### Data Manipulation in `R` <a class="anchor" id="2"></a>


```python
import rpy2

%load_ext rpy2.ipython

import rpy2.robjects as robjects
```




We load the data-set with which we are going to work:



```r
%%R 

library(tidyverse)

url = 'https://raw.githubusercontent.com/FabioScielzoOrtiz/Estadistica4all-blog/main/Linear%20Regression%20in%20Python%20and%20R/properties_data.csv'

properties_data <- read_csv(url)
```



Now, we are going to tranformate the variables that are measured in square foot (sqft) to square meters $(m^2)$



size_in_m\_2 = 0.092903 \* size_in_sqft

price_per_m\_2 = price_per_sqft / 0.092903





Now, we are going to tranformate the variables that are measured in square foot (sqft) to square meters $(m^2)$

size_in_m\_2 = 0.092903 \* size_in_sqft

price_per_m\_2 = price_per_sqft / 0.092903




```r
%%R 

size_in_m_2 <-  0.092903*properties_data$size_in_sqft

properties_data$size_in_m_2 <- size_in_m_2

price_per_m_2 <- properties_data$price_per_sqft /  0.092903 

properties_data$price_per_m_2 <- price_per_m_2

```



The following step will be convert the categorical variables to factor in R and remove in the data-set the variables that we will not take into account:



```r
%%R
levels(properties_data$quality)
```


```r
%%R 

properties_data$quality = recode_factor(properties_data$quality , "Low" = 0 , "Medium" = 1 , "High" = 2  , "Ultra" = 3)

```


```r
%%R 

properties_data$quality = factor(properties_data$quality)
```


```r
%%R 

data_R <- properties_data %>% select("price", "size_in_m_2", "longitude", "latitude", "no_of_bedrooms", "no_of_bathrooms", "quality")

head(data_R,15)
```



----------------------------



### Data Manipulation in `Python` <a class="anchor" id="3"></a>


```python
import pandas as pd

from dfply import *

import warnings
warnings.filterwarnings('ignore')
```


```python
url = 'https://raw.githubusercontent.com/FabioScielzoOrtiz/Estadistica4all-blog/main/Linear%20Regression%20in%20Python%20and%20R/properties_data.csv'

data_Python = pd.read_csv(url)

data_Python
```


```python
data_Python['size_in_m_2'] = 0.092903*data_Python['size_in_sqft']
data_Python['price_per_m_2'] = data_Python['price_per_sqft']/0.092903
```


```python
data_Python = data_Python >> select(X.price , X.size_in_m_2, X.longitude, X.latitude, X.no_of_bedrooms, X.no_of_bathrooms, X.quality)
data_Python
```



Converting $quality$  to categorical:


```python
data_Python.dtypes
```



Recoding the categorical variable $quality$


```python
data_Python['quality'].unique()
```


```python
(data_Python['quality_recode']) = 0

for i in range(0 , len(data_Python)) :

    if (data_Python['quality'])[i] == 'Low' :

        (data_Python['quality_recode'])[i] = 0

    if (data_Python['quality'])[i] == 'Medium' :

        (data_Python['quality_recode'])[i] = 1

    if (data_Python['quality'])[i] == 'High' :

        (data_Python['quality_recode'])[i] = 2

    if (data_Python['quality'])[i] == 'Ultra' :

        (data_Python['quality_recode'])[i] = 3
```


```python
data_Python.head()
```


```python
data_Python = data_Python >> select( ~X.quality )
```


```python
data_Python = data_Python >> rename(quality = X.quality_recode)
```


```python
data_Python['quality'] = data_Python['quality'].astype('category')
```


```python
data_Python.dtypes
```



The final  data-set in Python would be:


```python
data_Python
```



We can write the last data-frame as csv as follows:


```python
data_Python.to_csv('data_Python.csv' , index=False)
```

**Important**: to use categorical variables in a linear regression model in Python they must be recoded (their values must be numbers that represents their categories), i.e, we cannot use the variable *quality* , insteaf of it we can use *quality_recode*

This is the reason we have recoded *quality* in Python but not in R, because in R is not strictly necessary.

Note we have obtained the same data-set that was obtained with R.

- The R data-set has been called *data_R*

- The Python data-set has been called *data_python*


We will use both of them throughout this article. 





----------------------------



## Introduction to the Linear Regression Model <a class="anchor" id="4"></a>




The principal propose of this article is carry out a theoretical and
also practical exposition of the linear regression model.

Without any doubt the this is the most know statistical model.

There is the idea that the linear regression model is outdated compared
with other modern statistical models. But I would like to defend his
validity nowadays, first of all as a statistical tool, and second as a
previous necessary step to learn other most modern and complex methods.

The linear regression model is the base of many modern regression
techniques, so that is highly recommended study it enough, before to go deeper in other statistical models.






### Usefulness of the Linear Regression Model <a class="anchor" id="5"></a>



The main usefulness of the linear regression model is to predict the
values of a **quantitative** variable, called **response variable**,  depending on the values of other, **quantitative** or **categorical** variables ,
called **predictors**.

The other important usefulness of the linear regression model is to do inference, in other words, analyze the relation between the response variable and the predictors.




----------------------------



### Formal Approach to the Linear Regression Model <a class="anchor" id="6"></a>



We have the following elements:



-   ***Response Variable:***  a **quantitative** variable
      $Y=(y_{1} , y_2,...,y_n)^t$



-   ***Predictors:*** a set of **quantitative** or **categorical**
    variables:




\begin{gather*}
X_1 = (x_{11}, x_{21}, ..., x_{n1})^t \\
X_2 = (x_{12}, x_{22}, ..., x_{n2})^t \\
... \\
X_p = (x_{1p}, x_{2p}, ..., x_{np})^t
\end{gather*}




-   ***Predictors Matrix:***

    
    \begin{gather*}
    X=(1, X_1, X_2,...,X_p) = 
    \begin{pmatrix}
    1 & x_{11}&x_{12}&...&x_{1p}\\
    1 & x_{21}&x_{22}&...&x_{2p}\\
    &...&\\
    1& x_{n1}&x_{n2}&...&x_{np}
    \end{pmatrix} = 
    \begin{pmatrix}
    x_{1}\\
    x_{2}\\
    ...\\
    x_{n}
    \end{pmatrix}
    \end{gather*}
    



-   ***Beta Coefficients vector:***


\begin{gather*}
\beta=(\beta_{1}, \beta_{2}, ..., \beta_{n})^t 
\end{gather*}



-   ***Errors (residuals) vector:***


\begin{gather*}
\varepsilon=(\varepsilon_{1}, \varepsilon_{2}, ..., \varepsilon_{n})^t 
\end{gather*}





----------------------------




### Basic Assumptions <a class="anchor" id="7"></a>



The basic assumptions of the model are the following:



- $\hspace{0.3cm} y_i \hspace{0.1cm} =  \hspace{0.1cm} x_i^t \cdot \beta  +  \varepsilon_i \hspace{0.1cm} =  \hspace{0.1cm}   \beta_0 + \sum_{j=1}^{p} \left( \beta_j \cdot x_{ij} \right) + \varepsilon_i \hspace{0.1cm} =  \hspace{0.1cm}  \beta_0 + \beta_1 \cdot x_{i1} + \beta_2 \cdot x_{i2} + \dots + \beta_p \cdot x_{ip} + \varepsilon_i $
 


 
-  $\hspace{0.3cm} \varepsilon_i$ is a random variable such that:


   - $\hspace{0.3cm} E[\varepsilon_i]=0$
   
   - $\hspace{0.3cm} Var(\varepsilon_i)=\sigma^2$
  
   - $\hspace{0.3cm} \varepsilon_i \sim N(0,\sigma)$ 
  
   - $\hspace{0.3cm} cov(\varepsilon_i , \varepsilon_j)=0  \hspace{0.15cm} ,\forall i\neq j$ 





- $\hspace{0.3cm}$ Additional assumptions:

  -  $\hspace{0.3cm} n > p+1 \hspace{0.3cm}$ ( nº observations $>$ nº of beta coefficients  )

  -  $\hspace{0.3cm} Rg(X)=p+1$


Why are these additional assumptions important ? $\hspace{0.1cm} \Rightarrow\hspace{0.1cm} $ Dimensionality problem (will be seen it in other article of the blog)



------------------------





### Assumptions Consequences <a class="anchor" id="8"></a>


   -  $\hspace{0.15cm} y_i$ is a random variable because  $\varepsilon_i$ is a random variable

   -  $\hspace{0.15cm} E[y_i]= x_i^t \cdot \beta$

   -  $\hspace{0.15cm} Var(y_i) = \sigma^2$

   -  $\hspace{0.15cm} y_i \sim N(\hspace{0.1cm} x_i^t  \cdot \beta \hspace{0.1cm} , \hspace{0.1cm} \sigma^2 \hspace{0.1cm} )$

   -  $\hspace{0.15cm} cov(y_i , y_j)=0  \hspace{0.15cm}, \forall i\neq j$





----------------






### Matrix representation of the basic assumption of the model <a class="anchor" id="9"></a>



- $ Y=X\cdot \beta + \varepsilon $

- $\varepsilon_i \sim N(0,\sigma) \hspace{0.4cm} \forall \hspace{0.1cm} i=1,...,n $
  
- $cov(\varepsilon_i , \varepsilon_j)=0 \hspace{0.4cm} \forall \hspace{0.1cm} i\neq j =1,...,n $



-----



## Estimation  <a class="anchor" id="10"></a>





###  Prediction of Response Variable <a class="anchor" id="11"></a>


The linear regression model predict the response variable value $y_i$  for the combination of predictors values  $x_i = (1,x_{i1}, x_{i2}, ..., x_{ip})^t$  as:

\begin{gather*}
\widehat{y}_i \hspace{0.1cm}=\hspace{0.1cm} x_i^t \cdot \widehat{\beta}  \hspace{0.1cm}=\hspace{0.1cm} \widehat{\beta}_0 + \sum_{j=1}^{p} \widehat{\beta}_j \cdot x_{ij} \hspace{0.1cm}=\hspace{0.1cm} \widehat{\beta}_0 + \widehat{\beta}_1 \cdot x_{i1} + \widehat{\beta}_2 \cdot x_{i2} + ... + \widehat{\beta}_p \cdot x_{ip} 
\end{gather*}





-----




### Estimation of model coefficients <a class="anchor" id="12"></a>


The estimation of $\beta$  in the classic linear regression model is done
using the ordinary least square (OLS) method.

$\widehat{\beta}$  is compute as the solution of the following optimitation
problem:



\begin{gather*}
  \underset{\beta}{Min} \hspace{0.2cm} RSS(\beta) \hspace{0.2cm} = \hspace{0.2cm}  \underset{\beta}{Min} \hspace{0.2cm}  \sum_{i=1}^{n} \hspace{0.1cm}(y_i - x_i^t \cdot \beta)\hspace{0.02cm}^2  \hspace{0.2cm} = \hspace{0.2cm}  \underset{\beta_0,\beta_1,...,\beta_p}{Min} \hspace{0.2cm}  \sum_{i=1}^{n} \hspace{0.1cm}(y_i - \beta_0 - \beta_1 \cdot x_{i1} - \dots - \beta_p \cdot x_{ip})\hspace{0.02cm}^2 
\end{gather*}

 



The problem solution is:

\begin{gather*}
\widehat{\beta}=(X^t \cdot X)^{-1} \cdot X^t \cdot Y
\end{gather*}

 


**Interpretation :**

$\hspace{0.2cm} \widehat{y} = x^t \cdot \widehat{\beta} \hspace{0.2cm} $ is the hyperplane that **minimize** the **euclidean distance** between the given values of the response variable $(Y)$ and the points of the hyperplane given by $\hspace{0.1cm} \hat{y}_i = x_i^t \cdot \widehat{\beta}$




```python
from IPython.display import Image
Image(filename='hyperplane.png') 
```




**Observation:**

We will not view here the mathematical details about the resolution of
this optimization problem. But is a classic convex optimization problem,
so it´s enough to take first derivatives of the objetive function with
respect to the coefficients  $\beta_0,\beta_1,...,\beta_p$ ,  set them equal to zero (0), and solve the resultant equation system with respect
to  $\beta$




---------




### Estimation of model errors (residuals) <a class="anchor" id="13"></a>




The model errors  $\varepsilon_i$  are estimated as:

$$
\widehat{\varepsilon}_i \hspace{0.1 cm} = \hspace{0.1 cm} y_i - \widehat{y}_i \hspace{0.1 cm} = \hspace{0.1 cm} y_i - x_i^t \cdot \widehat{\beta}  
$$

for $\hspace{0.1cm}$ $i=1,...,n$




**Observation:**

$\hat{\varepsilon}_i$  is the error done by the model when it
predicts  $y_i$  as  $\hat{y}_i=x_i^t \cdot \hat{\beta}$





----



### Residual sum of squares (RSS) <a class="anchor" id="13.1"></a>

The size of the errors is quantify as the estimated errors sum of squares :



$$ RSS \hspace{0.1 cm} = \hspace{0.1 cm} \sum_{i=1}^{n} \hat{\varepsilon}_i\hspace{0.02cm}^2 \hspace{0.1 cm} = \hspace{0.1 cm} \sum_{i=1}^{n} (y_i - \widehat{y}_i)\hspace{0.02cm}^2 \hspace{0.1 cm} = \hspace{0.1 cm} \sum_{i=1}^{n} (y_i - x_i^t \cdot \widehat{\beta})\hspace{0.02cm}^2 $$



-----




### Regression Hyperplane <a class="anchor" id="14"></a>

The regression hyperplane is the matrix expression of the predictions
that the model does of the response variable values: 

$$ \hat{Y} = X \cdot \hat{\beta}$$

Where:    $\hat{Y}=(\hat{y}_1,\hat{y}_2,...,\hat{y}_n)^t$





-----




### Hat-Matrix <a class="anchor" id="15"></a>




\begin{gather*}
\hat{Y} = X \cdot \hat{\beta} = X \cdot (X^t \cdot X)^{-1} \cdot X^t \cdot Y = H \cdot Y  
\end{gather*}



Where:  

 $$H= X \cdot (X^t \cdot X)^{-1} \cdot X^t$$

  is called **Hat-Matrix**




-----



### Estimation of the Linear Regression Model in `R` <a class="anchor" id="16"></a>






In this section we are going to show how estimate a linear regression
model in R, using for this purpose the data-set that was showed at the begining of the article.

The linear regression model that we propose is the following:

\begin{gather*}
price_i = \beta_0 +  \beta_1 \cdot size\_in\_m\_2_i + \beta_2 \cdot no\_of\_bedrooms_i +  \beta_3 \cdot no\_of\_bathrooms_i + \\ + \beta_4 \cdot quality_i + \beta_5\cdot  latitude_i +  \beta_6 \cdot longitude_i + \varepsilon_i
\end{gather*}




```r
%%R

model_R <- lm( price ~ size_in_m_2 + no_of_bedrooms + no_of_bathrooms + quality + latitude + longitude ,
data = data_R)

summary(model_R)
```



------



### Estimation of Linear Regression Model in `Python`   



### Estimation of Linear Regression Model in `Python` with `statsmodels` <a class="anchor" id="17"></a>



We can implement a linear regression model in Python with `statsmodels` in two ways.



***First way:*** $\hspace{0.1cm}$ `statsmodels.formula.api`


```python
# pip install statmodels
```


```python
import statsmodels.formula.api as smf
```


```python
model_Py_smf = smf.ols(formula = 'price ~ size_in_m_2 + no_of_bedrooms + no_of_bathrooms + quality + latitude + longitude', 
                       data =data_Python)

model_Py_smf = model_Py_smf.fit()
 
print(model_Py_smf.summary())
```





  ***Second way:***  $\hspace{0.1cm}$  `statsmodels.api`

One of the most important differences is that `statsmodels.api` does not fit the intercept, while `statsmodels.formula.api` does.

Another important difference is that `statsmodels.api` doesn't deal well with categorical predictors, while `statsmodels.formula.api` does.

To fit the intercept and properly treat categorical predictors with `statsmodels.api` we need to add the intercept and the dummy (binary) variables associated with the categorical predictors to the data matrix $X$ as new predictors, and this can be done using the function `varcharProcessing `.


```python
def varcharProcessing(X, varchar_process = "dummy_dropfirst"):
    
    dtypes = X.dtypes

    if varchar_process == "drop":   
        X = X.drop(columns = dtypes[dtypes == np.object].index.tolist())

    elif varchar_process == "dummy":
        X = pd.get_dummies(X,drop_first=False)

    elif varchar_process == "dummy_dropfirst":
        X = pd.get_dummies(X,drop_first=True)

    else: 
        X = pd.get_dummies(X,drop_first=True)
    
    X["intercept"] = 1
    cols = X.columns.tolist()
    cols = cols[-1:] + cols[:-1]
    X = X[cols]
    
    return X
```



Let's see how `varcharProcessing ` works:


```python
X = data_Python[['size_in_m_2', 'longitude', 'latitude', 'no_of_bedrooms', 'no_of_bathrooms', 'quality']]
```


```python
X.head()
```


```python
varcharProcessing(X, varchar_process = "dummy_dropfirst").head()
```




```python
import statsmodels.api as sm
```


```python
X = data_Python[['size_in_m_2', 'longitude', 'latitude', 'no_of_bedrooms', 'no_of_bathrooms', 'quality']]

X = varcharProcessing(X, varchar_process = "dummy_dropfirst")

y = data_Python['price']
```


```python
model_Py_sm = sm.OLS(y , X).fit()

print(model_Py_sm.summary())
```



The previous output gives us the estimation of the model coefficients
(betas), both outputs give similar results (but we will consider the python output):

<br>

$
\hat{\beta}_0 =  -6.207e+07  \\
\hat{\beta}_{quality1} =1.4e+05\\
\hat{\beta}_{quality2} = 3.406e+05 \\ 
\hat{\beta}_{quality3} = 2.788e+05 \\
\hat{\beta}_{size\_in\_m\_2} =3.566e+04 \\
\hat{\beta}_{no\_of\_bedrooms} = -8.367e+05 \\
\hat{\beta}_{no\_of\_bathrooms} = -5.712e+04 \\
\hat{\beta}_{latitude}=6.115e+06 \\
\hat{\beta}_{longitude}= -1.677e+06 \\
$

<br>

So, the estimated model is:


\begin{gather*}
\widehat{price}_i =  -6.207e+07 +  3.566e+04 \cdot size\_in\_m\_2_i -8.367e+05 \cdot no\_of\_bedrooms_i -5.712e+04 \cdot no\_of\_bathrooms_i +\\ 1.4e+05 \cdot quality1_i + 3.406e+05\cdot quality2_i + 2.788e+05  \cdot quality3_i  +6.115e+06\cdot  latitude_i -1.677e+06   \cdot longitude_i 
\end{gather*}

<br>

**Observation:**

The  categorical variable, *quality*, that has 4 categories (Low (0), Medium (1),
High (2), Ultra (3)), enter in the model with 3 variables (quality1 ,
quality2, quality3 ). The category. that is out of the model is Low (0) because is the firs category. 

This isn´t a particularity of this variable, but rather it´s a property of the categorical variables in the regression models.

Later it will be seen how this affects model coefficients interpretation.  




-----



### Estimation of Linear Regression Model in `Python` with `scikit-learn` <a class="anchor" id="18"></a>



```python
# pip install sklearn
```


```python
import sklearn

from sklearn.linear_model import LinearRegression

from sklearn.model_selection import train_test_split
```


We can use a training data-set to train the model in Python with the  `scikit-learn` module. 

This concepts will be seen with much more detail in a specific article about cross validation techniques.




```python
X = data_Python[['size_in_m_2', 'longitude', 'latitude', 'no_of_bedrooms', 'no_of_bathrooms', 'quality']]
y = data_Python['price']
```


```python
X = varcharProcessing(X, varchar_process = "dummy_dropfirst")
```


```python
X.head()
```



We can fit a linear regression model with `sk-learn` :


```python
from sklearn.linear_model import LinearRegression
```



We can fit the model with the full data-set:


```python
Model_Py_sklearn = LinearRegression().fit(X, y)
```



We can compute the coefficients of the model:


```python
Model_Py_sklearn.intercept_
```


```python
Model_Py_sklearn.coef_
```

Note that the order of the array values follows the order of $X$ columns.



-----



### Precision of the estimation of beta coefficients <a class="anchor" id="19"></a>



The precision of the estimations of model beta coefficients  is given by the
 variance of the beta coefficient estimators, that is, by $\hspace{0.02cm}$  $Var(\widehat{\beta}_j)$



It´s true that $\hspace{0.07cm}$ 
$\hat{\beta_j} \sim N(\beta_j , \sqrt{ \sigma^2 \cdot q_{jj} } )$ $\hspace{0.07cm}$ then we have:



 $$Var(\hat{\beta_j})=\sigma^2 \cdot q_{jj}$$





Therefore, the estimation of the variance of $\hspace{0.05cm}$  $\widehat{\beta}_j$  $\hspace{0.05cm}$  is : 



   $$\widehat{Var}(\widehat{\beta}_j) = \widehat{\sigma}\hspace{0.02cm}^2 \cdot q_{jj}$$
 





Where:



$\widehat{\sigma}\hspace{0.02cm}^2 \hspace{0.05cm}$  is the estimation of the  error variance  , i.e, $\hspace{0.06cm}$ $\widehat{\sigma}\hspace{0.02cm}^2 = \widehat{Var}(\varepsilon_i)$


$q_{jj}$ $\hspace{0.05cm}$  is the element  $j+1$  of the principal diagonal of the matrix $\hspace{0.05cm}$ $(X^t \cdot X)^{-1}$  $\hspace{0.05cm}$ , $\forall j=0,1,...,p$





 ***¿ Why are the variance of the coefficient estimators important ?***


The standard deviation of the coefficient estimators indicates how much
the estimations of the coefficients deviate/vary, in mean, when the model is re-trained using many different samples.



Suppose many samples are obtained, and with each of them a linear
regression model is trained. Then, we get many estimations of the model
coefficients, one with each sample.

Then  $\sqrt{\widehat{Var}(\hat{\beta_j})}$  indicates how much
$\hat{\beta_j}$ varies, in mean, from one sample to another.



If the standard deviation is **high**, this indicates that will be obtained
big differences when $\beta_j$ is estimate with $\hat{\beta_j}$
depending on the sample that is used for estimate it, that means
estimator $\hat{\beta_j}$ is **imprecise**, because it will be much
dispersion of the values of $\hat{\beta_j}$ respect to the mean.

On the contrary, if the standard deviation is **low**, this indicates that
will be obtained small differences when $\beta_j$ is estimate with
$\hat{\beta_j}$ depending on the sample that is used for estimate it,
that means estimator $\hat{\beta_j}$ is **precise**, because it will be little
dispersion of the values of $\hat{\beta_j}$ respect to the mean.



Also $\hspace{0.05cm}\widehat{Var}(\widehat{\beta}_j)\hspace{0.05cm}$ allow us to create a confidence interval for $\hspace{0.05cm}\widehat{\beta}_j$



---



#### Estimation of the standard deviation of the beta coefficient estimators in `R` <a class="anchor" id="20"></a>



```r
%%R 

summary(model_R)
```



---



### Estimation of the standard deviation of the coefficient estimators in `Python` <a class="anchor" id="21"></a>



```python
print(model_Py_sm.summary())
```




This output give us a lot of information about the model, some of this
information has been seen (estimates coefficients), an other information
will be seen later.

Now we will focus in the part of the output where are the estimation of   coefficients estimators standard error (`std err` in Python , `Std.Error` in R).

$
\sqrt{\widehat{Var}(\hat{\beta_0})}=2.995e+07 \\
 \sqrt{\widehat{Var}(\hat{\beta}_{quality1})}=8.358e+04 \\
\sqrt{\widehat{Var}(\hat{\beta}_{quality2})}=1.551e+05\\ 
\sqrt{\widehat{Var}(\hat{\beta}_{quality3})}= 1.976e+05 \\ 
\sqrt{\widehat{Var}(\hat{\beta}_{size\_in\_m\_2})}= 7.238e+02 \\
\sqrt{\widehat{Var}(\hat{\beta}_{no\_of\_bedrooms})}=8.282e+04 \\ 
\sqrt{\widehat{Var}(\hat{\beta}_{no\_of\_bathrooms})}=6.829e+04 \\  
\sqrt{\widehat{Var}(\hat{\beta}_{latitude})}=7.809e+05\\ 
\sqrt{\widehat{Var}(\hat{\beta}_{longitude})}=6.908e+05
$

The standard deviation estimates of the coefficients estimators are, in
general, so high. This implies if we train the model with another
samples, we will get estimates of the coefficients quite different than
the one obtained with our initial sample.

And this is a big problem, because from one sample to another are
obtained very different linear regression models, so that, very
different results with each sample.





----



### Model Predictions in `R` <a class="anchor" id="22"></a>


With the function `predict` we can get the predictions made by the model
for the response variable $(y)$ in R, for the data-set with which the model has been trained and also for a new data-set that the model hasn't seen.



**Predictions with the train data:**


```r
%%R

predict(model_R)[1:20]
```



**Predictions with new data:**


```r
%%R
size_in_m_2  <- c(100, 140,160,180,98,120,200)
longitude  <- c(55.1,55.3,55.2,55.1,55.2,55.1,55.1)
latitude <- c(25.1,25.2,25.1,25.1,25.3,25.1,25.2)
no_of_bedrooms <- c(1,3,0,2,3,1,4)
no_of_bathrooms <- c(1,3,2,2,1,2,2)
quality <- c(1,0,2,2,3,2,1)

new_data = cbind(size_in_m_2,longitude,latitude,no_of_bedrooms,no_of_bathrooms,quality)
new_data = as.data.frame(new_data)

new_data$quality = factor(new_data$quality)
```


```r
%%R

new_data
```


```r
%%R

predict(model_R, new_data)
```



---



### Model Predictions in `Python` with `Statsmodels` <a class="anchor" id="23"></a>


With `smf` :


```python
model_Py_smf = smf.ols(formula = 'price ~ size_in_m_2 + no_of_bedrooms + no_of_bathrooms + quality + latitude + longitude', 
                 data =data_Python).fit()
```



Using the training data:


```python
 model_Py_smf.predict(data_Python)
```



Using new data:


```python
size_in_m_2  = pd.Series([100, 140,160,180,98,120,200]) 
longitude  = pd.Series([55.1,55.3,55.2,55.1,55.2,55.1,55.1]) 
latitude = pd.Series([25.1,25.2,25.1,25.1,25.3,25.1,25.2])
no_of_bedrooms = pd.Series([1,3,0,2,3,1,4])
no_of_bathrooms = pd.Series([1,3,2,2,1,2,2])
quality = pd.Series([1,0,2,2,3,2,1])

new_data = pd.DataFrame({'size_in_m_2':size_in_m_2, 'longitude':longitude , 'latitude':latitude, 'no_of_bedrooms':no_of_bedrooms , 'no_of_bathrooms':no_of_bathrooms , 'quality':quality }) 

new_data['quality'] = new_data['quality'].astype('category')
```


```python
new_data.head()
```


```python
 model_Py_smf.predict(new_data)
```



With `sm` :


```python
model_Py_sm = sm.OLS(y , X).fit()
```

Using the training data:


```python
 model_Py_sm.predict(X)
```



Using new data : 


```python
intercept = 1
size_in_m_2  = pd.Series([100, 140,160,180,98,120,200]) 
longitude  = pd.Series([55.1,55.3,55.2,55.1,55.2,55.1,55.1]) 
latitude = pd.Series([25.1,25.2,25.1,25.1,25.3,25.1,25.2])
no_of_bedrooms = pd.Series([1,3,0,2,3,1,4])
no_of_bathrooms = pd.Series([1,3,2,2,1,2,2])
quality_1 = pd.Series([1,0,0,0,0,0,1])
quality_2 = pd.Series([0,0,1,1,0,1,0])
quality_3 = pd.Series([0,0,0,0,1,0,0])

new_data = pd.DataFrame({'intercept':intercept , 'size_in_m_2':size_in_m_2, 'longitude':longitude , 'latitude':latitude, 'no_of_bedrooms':no_of_bedrooms , 'no_of_bathrooms':no_of_bathrooms , 'quality_1':quality_1, 'quality_2':quality_2, 'quality_3':quality_3 }) 
```


```python
new_data.head()
```


```python
 model_Py_sm.predict(new_data)
```



---



### Model Predictions in Python with `Sk-learn` <a class="anchor" id="24"></a>



```python
 Model_Py_sklearn = LinearRegression().fit(X, y)
```



Using the training data:



```python
Model_Py_sklearn.predict(X)
```



Using new data:



```python
intercept = 1
size_in_m_2  = pd.Series([100, 140,160,180,98,120,200]) 
longitude  = pd.Series([55.1,55.3,55.2,55.1,55.2,55.1,55.1]) 
latitude = pd.Series([25.1,25.2,25.1,25.1,25.3,25.1,25.2])
no_of_bedrooms = pd.Series([1,3,0,2,3,1,4])
no_of_bathrooms = pd.Series([1,3,2,2,1,2,2])
quality_1 = pd.Series([1,0,0,0,0,0,1])
quality_2 = pd.Series([0,0,1,1,0,1,0])
quality_3 = pd.Series([0,0,0,0,1,0,0])

new_data = pd.DataFrame({'intercept':intercept , 'size_in_m_2':size_in_m_2, 'longitude':longitude , 'latitude':latitude, 'no_of_bedrooms':no_of_bedrooms , 'no_of_bathrooms':no_of_bathrooms , 'quality_1':quality_1, 'quality_2':quality_2, 'quality_3':quality_3 }) 
```


```python
new_data.head()
```


```python
Model_Py_sklearn.predict(new_data)
```



---



### Estimation of model errors in `R` <a class="anchor" id="25"></a>



We estimate the model errors as $\hspace{0.1cm}$ $\hat{\varepsilon}_i= y_i - \hat{y}_i$



```r
%%R 

y = data_R$price

( estimated_errors <- y - predict(model_R) )[1:30]
```


We put in a data frame the values of response variable observed in the
sample, the model predictions of the response, and the estimates of
model errors:



```r
%%R

(df_predictions <- tibble(y=y , 
                         y_predictions=predict(model_R), 
                         estimated_errors))[1:15, ]
```



---



### Estimation of model errors in `Python` <a class="anchor" id="26"></a>



```python
predictions = pd.DataFrame( {'predictions':  model_Py_sm.predict(X)} )
```


```python
df_predictions_Python = pd.concat([y, predictions], axis=1)
df_predictions_Python.head()
```


```python
estimated_errors = y - model_Py_sm.predict(X)
```


```python
df_predictions_Python['estimated_errors'] = estimated_errors 

df_predictions_Python.head()
```



----



### Estimation of the error variance (Residual  Variance) <a class="anchor" id="27"></a>




The estimator of the error variance $\hspace{0.1cm} Var(\varepsilon_i)=\sigma^2 \hspace{0.1cm}$ is
called **residual variance**, and is defined as:



$$
 \widehat{Var}(\varepsilon_i) = \widehat{\sigma}^2 = S_R^2 \hspace{0.1cm}=\hspace{0.1cm} \dfrac{1}{n-p-1} \cdot \sum_{i=1}^{n} \hat{\varepsilon}_i\hspace{0.02cm}^2 \hspace{0.1cm}=\hspace{0.1cm}  \dfrac{1}{n-p-1} \cdot (Y^t \cdot Y - \hat{\beta}^t \cdot X^t \cdot Y)
$$



The following is fulfilled:



$$
\dfrac{n-p-1}{\sigma^2} \cdot \widehat{\sigma}^2 \hspace{0.1cm} \sim \hspace{0.1cm} \chi_{n-p-1}^2
$$



$$
E[\widehat{\sigma}^2]=\sigma^2 
$$



$$
Var(\widehat{\sigma}^2)=\dfrac{2 \cdot \sigma^4}{n-p-1}
$$




---




### Estimation of the error variance in `R` <a class="anchor" id="28"></a>



```r
%%R

n<- length(estimated_errors)
p<-6

( estimated_variance_error <- sum(estimated_errors^2)/(n-p-1) )
```


```r
%%R

( estimated_standard_deviation_error <- sqrt(estimated_variance_error) )
```



---



### Estimation of the error variance in `Python` <a class="anchor" id="29"></a>



```python
n = len(data_Python)
p = 6
```


```python
estimated_variance_error = sum(df_predictions_Python['estimated_errors']**2)/(n-p-1) 

estimated_variance_error
```


```python
import math

estimated_standard_deviation_error = math.sqrt(estimated_variance_error)
estimated_standard_deviation_error
```



---



## Model Train Validation <a class="anchor" id="30"></a>


We can compute some metric in order to measure how much distant are the
predictions and observations of the response variable.

Two of the most common metrics are the mean absolute deviation (MAD) and the mean square error (MSE):



$$
MAD \hspace{0.1cm} = \hspace{0.1cm}   \dfrac{1}{n} \sum_{i=1}^{n} \mid \hat{\varepsilon}_i \mid \hspace{0.1cm} = \hspace{0.1cm} \dfrac{1}{n} \sum_{i=1}^{n} \hspace{0.1cm} \mid y_i - \hat{y}_i \mid \hspace{0.1cm} = \hspace{0.1cm} \dfrac{1}{n} \sum_{i=1}^{n} \hspace{0.1cm}\mid   y_i - x_i \cdot \widehat{\beta}  \mid 
$$



$$
MSE \hspace{0.1cm} = \hspace{0.1cm} \dfrac{1}{n} \sum_{i=1}^{n} \hat{\varepsilon}_i^2 \hspace{0.1cm} =\hspace{0.1cm} \dfrac{1}{n} \sum_{i=1}^{n} \hspace{0.1cm}(\hspace{0.1cm} y_i - \hat{y}_i \hspace{0.1cm})^2 = \dfrac{1}{n} \sum_{i=1}^{n} \hspace{0.1cm}(\hspace{0.1cm} y_i - x_i \cdot \widehat{\beta} \hspace{0.1cm})^2
$$ 


When these metrics are computing using the data for $y_i$ and $x_i$ that were used to train the model it is called  *model train validation*.



---




### Model Train Validation in `R` <a class="anchor" id="31"></a>



```r
%%R

( MAD <- mean(abs((estimated_errors))) ) 
```


```r
%%R

( MSE <- mean((estimated_errors)^2) ) 
```



---



### Model Train Validation in `Python`  <a class="anchor" id="32"></a>


```python
MAD_Py = ( (y - model_Py_sm.predict(X)).abs() ).mean()
MAD_Py
```


```python
MSE_Py = ( (y - model_Py_sm.predict(X))**2 ).mean()
MSE_Py
```




In mean, the predictions that the model made of the response variable
deviates from the observations, in absolute value, in 938065 units.

This is an estimation of model error, but training error, because we
have used the predictions of the response variables made by the model
using the observations with which it has been trained.

There is a more interesting model error, called test error, that is
computed with predictors observations which haven´t been used to train
the model.

In this article, we will not go deeper unto that, but this concepts will
be more developed in another article about validation techniques.






---



## Model Coefficients Interpretation <a class="anchor" id="33"></a>




### Null Coefficient <a class="anchor" id="34"></a>


We have the following estimated linear regression model 

  $$\hat{y}= \hat{\beta_0} + \hat{\beta_0}\cdot x_{i1} + ...+ \hat{\beta_p}\cdot x_{ip}$$



- $\hat{\beta}_0$ $\hspace{0.05cm}$ is the model estimated value for the response variable, i.e $\hspace{0.05cm}$  $\hat{y}_i$ $\hspace{0.05cm}$
, when $\hspace{0.05cm}$ $x_{ij}=0$ $\hspace{0.05cm}$ , $\forall j=1,2,...,p$








###  Quantitative Predictor Coefficient <a class="anchor" id="35"></a>



Let $X_k$ a **quantitative** variable, and $\hspace{0.05cm}$ $h>0$,

We have the following estimated linear regression model  

$$\hat{y}_i= \hat{\beta_0} + \hat{\beta_0}\cdot x_{i1} + .. + \hat{\beta_k}\cdot x_{ik} + ..+ \hat{\beta_p}\cdot x_{ip}$$




-   If $\hat{\beta}_k > 0$  , then

    -   If  $x_{ik}$  **increases** in $h$ units $\hspace{0.05cm}$  $\Rightarrow$  $\hspace{0.05cm}$ $\hat{y}_i$
        **increases** in $\hspace{0.05cm}$ $\hat{\beta}_k \cdot h$  $\hspace{0.05cm}$ units.
        
        And the opposite if it decreases.
        
   
-   If  $\hat{\beta}_k < 0$  , then

    -  If $x_{ik}$ **increases** in $h$ units $\hspace{0.05cm}$ $\Rightarrow$ $\hspace{0.05cm}$  $\hat{y}_i$
        **decreases** in $\hspace{0.05cm}$ $\hat{\beta}_k \cdot h$ $\hspace{0.05cm}$ units. 

        And the opposite if it decreases.


-   If  $\hat{\beta}_k = 0$  , then

    -   $\hat{y}_i$ $\hspace{0.05cm}$ doesn´t depend on $\hspace{0.05cm}$  $x_{ik}$


**Observation:**


The above affirmations are based in the following:

- $(\hat{y}_i \hspace{0.05cm} | \hspace{0.05cm} x_{ik}=c+h ) - (\hat{y}_i  \hspace{0.05cm} | \hspace{0.05cm}  x_{ik}=c ) =  \hat{\beta_k}\cdot h$






### Categorical Predictor Coefficient <a class="anchor" id="36"></a>




#### Categorical Predictors with 2 categories



Let $X_k$ a categorical variable with 2 categories 
$\lbrace 0 , 1 \rbrace$,

If the reference category is  $0$  , then  $X_k$ enter in the model as the binary (0,1) variable $X_{k1}$ defined as:

$$
x_{i k1}=1  \hspace{0.05cm} \Leftrightarrow \hspace{0.05cm}  x_{i k}=1 
 $$

<br>

In addition, we define the variable $X_{k0}$ as:

$$
x_{i k0}=1  \hspace{0.05cm} \Leftrightarrow \hspace{0.05cm}  x_{i k}=0 
$$

<br>

We have the following estimated linear regression model:

$$\hat{y}_i= \hat{\beta_0} + \hat{\beta_0}\cdot x_{i1} + .. + \hat{\beta}_{k1} \cdot x_{ik1} + ..+ \hat{\beta_p}\cdot x_{ip}$$

<br>

-   If $\hat{\beta}_{k1} > 0$ , then



    -   $\hat{y}_i$ $\hspace{0.05cm}$ is $\hspace{0.05cm}$ $\hat{\beta}_{k1}$ $\hspace{0.05cm}$ units greater if  $\hspace{0.05cm}$ $x_{ik}=1$ $\hspace{0.05cm}$ than if $\hspace{0.05cm}$ $x_{ik}= 0$

<br>

-   If $\hat{\beta}_{k1} < 0$ , then

    -   $\hat{y}_i$ $\hspace{0.05cm}$ is $\hspace{0.05cm}$ $\hat{\beta}_{k1}$ $\hspace{0.05cm}$ units less if $\hspace{0.05cm}$  $x_{ik}= 1$ $\hspace{0.05cm}$ than if $\hspace{0.05cm}$ $x_{ik}=0$



**Observation:**


The above affirmations are based in the following:

- $(\hat{y}_i \hspace{0.05cm} | \hspace{0.05cm} x_{ik1}=1 ) - (\hat{y}_i  \hspace{0.05cm} | \hspace{0.05cm}  x_{ik1}=0 ) =  \hat{\beta}_{k1}$






#### Categorical Predictors with 3 categories:



Let $X_k$ a categorical variable with 3 categories
$\lbrace 0 , 1, 2 \rbrace$,

If the reference category is $0$, then $X_k$ enter in the model with
two binary $\lbrace 0,1\rbrace$ variables $X_{k1}$ y $X_{k2}$ defined as:

\begin{gather*}
x_{i k1}=1   \Leftrightarrow   x_{i k}=1 \\
x_{i k2}=1  \Leftrightarrow     x_{i k}=2 
\end{gather*}

<br>

In addition, we define the variable $X_{k0}$ as:

$$
x_{i k0}=1  \hspace{0.05cm} \Leftrightarrow \hspace{0.05cm}  x_{i k}=0 
$$

<br>

We have the following estimated linear regression model:

$$\hat{y}= \hat{\beta_0} + \hat{\beta_0}\cdot x_{i1} + .. + \hat{\beta}_{k1} \cdot x_{ik1} + \hat{\beta}_{k2} \cdot x_{ik2} + ..+ \hat{\beta_p}\cdot x_{ip}$$

<br>

-   If  $\hat{\beta}_{k1} > 0$  , then

    -  $\hat{y}_i$ $\hspace{0.05cm}$  is $\hspace{0.05cm}$ $\hat{\beta}_{k1}$ $\hspace{0.05cm}$ units **greater** if $\hspace{0.05cm}$ $x_{ik}= 1$ $\hspace{0.05cm}$  than if  $\hspace{0.05cm}$ $x_{ik}= 0$

<br>

-   If  $\hat{\beta}_{k1} < 0$  , then

    -   $\hat{y}_i$ $\hspace{0.05cm}$ is $\hspace{0.05cm}$ $\hat{\beta}_{k1}$ $\hspace{0.05cm}$ units **less** if $\hspace{0.05cm}$  $x_{ik}= 1$ $\hspace{0.05cm}$ than if $\hspace{0.05cm}$ $x_{ik}= 0$

<br>

-   If $\hat{\beta}_{k2} > 0$ , then

    -   $\hat{y}_i$ $\hspace{0.05cm}$  is $\hspace{0.05cm}$ $\hat{\beta}_{k2}$ $\hspace{0.05cm}$ units **greater** if $\hspace{0.05cm}$  $x_{ik}= 1$  $\hspace{0.05cm}$ than if $\hspace{0.05cm}$ $x_{ik}= 0$

<br>

-   If $\hat{\beta}_{k2} < 0$  , then 

    -  $\hat{y}_i$ $\hspace{0.05cm}$ is $\hspace{0.05cm}$ $\hat{\beta}_{k2}$ $\hspace{0.05cm}$ units **less** if  $\hspace{0.05cm}$ $x_{ik}= 1$ $\hspace{0.05cm}$ than if $\hspace{0.05cm}$ $x_{ik}= 0$

<br>

-   If  $\hat{\beta}_{k2} - \hat{\beta}_{k1} > 0$ , then

    -   $\hat{y}_i$ $\hspace{0.05cm}$ is $\hspace{0.05cm}$ $\hat{\beta}_{k2} - \hat{\beta}_{k1}$  $\hspace{0.05cm}$ units  **greater** if $\hspace{0.05cm}$ $x_{ik}= 2$ $\hspace{0.05cm}$ than if $\hspace{0.05cm}$ $x_{ik}= 1$

<br>

-   If  $\hat{\beta}_{k2} - \hat{\beta}_{k1} < 0$  , then

    -   $\hat{y}_i$ $\hspace{0.05cm}$ is $\hspace{0.05cm}$ $\hat{\beta}_{k2} - \hat{\beta}_{k1}$ $\hspace{0.05cm}$ units
        **less** if $\hspace{0.05cm}$ $x_{ik}= 2$ $\hspace{0.05cm}$ than if $\hspace{0.05cm}$ $x_{ik}= 1$

<br>

Note that the above is easily extrapolated to the case in which we have a
categorical predictor with $r$ categories, for $r>3$.


**Observation:**


The above affirmations are based in the following:

- $(\hat{y}_i \hspace{0.05cm} | \hspace{0.05cm} x_{ik1}=1 ) - (\hat{y}_i  \hspace{0.05cm} | \hspace{0.05cm}  x_{ik0}=1 ) =  \hat{\beta}_{k1}$

- $(\hat{y}_i \hspace{0.05cm} | \hspace{0.05cm} x_{ik2}=1 ) - (\hat{y}_i  \hspace{0.05cm} | \hspace{0.05cm}  x_{ik0}=1 ) =  \hat{\beta}_{k2}$
  
- $(\hat{y}_i \hspace{0.05cm} | \hspace{0.05cm} x_{ik2}=1 ) - (\hat{y}_i  \hspace{0.05cm} | \hspace{0.05cm}  x_{ik1}=1 ) =  \hat{\beta}_{k2} - \hat{\beta}_{k1} $



Note that this can easily be extrapolated to the case of  an $r$-ary categorical variable  with $r > 3$



----




### Example of coefficient interpretation <a class="anchor" id="37"></a>

We had obtained the following estimated model:


\begin{gather*}
\widehat{price}_i =  -6.207e+07 +  3.566e+04 \cdot size\_in\_m\_2_i -8.367e+05 \cdot no\_of\_bedrooms_i -5.712e+04 \cdot no\_of\_bathrooms_i + \\ 1.4e+05 \cdot quality1_i + 3.406e+05\cdot quality2_i + 2.788e+05  \cdot quality3_i  +6.115e+06\cdot  latitude_i -1.677e+06   \cdot longitude_i 
\end{gather*}



The interpretation of the estimated model coefficients is the following:

<br>

-   $\hat{\beta}_0 = -6.207e+07$   is the estimated  $price$  by the model for the  houses with $size\_in\_m\_2_i =0$  ,  $no\_of\_bedrooms_i =0$  ,  $no\_of\_bathrooms_i =0$  ,   $qualityLow_i=0$ ,   $qualityMedium_i=0$  ,  $qualityUltra_i=0$  ,  $latitude_i=longitude_i=0$


-   $\hat{\beta}_{size\_in\_m\_2} =3.566e+04$   $\Rightarrow$   if
    $size\_in\_m\_2_i$ increases in $h$ units, the estimated housing
    $price$ **increases** in  $h\cdot 3.566e+04$  units.


-   $\hat{\beta}_{no\_of\_bedrooms} = -8.367e+05$   $\Rightarrow$   if
    $no\_of\_bedrooms_i$ increases in  $h$  units, the estimated housing
    $price$ **decreases** in  $-h\cdot 8.367e+05$  units.


-   $\hat{\beta}_{no\_of\_bathrooms} = -5.712e+04$   $\Rightarrow$   if
    $no\_of\_bathrooms_i$ increases in  $h$  units, the estimated housing
    $price$ **decreases** in  $-h\cdot 5.712e+04$  units.


-   $\hat{\beta}_{quality1} = 1.4e+05$   $\Rightarrow$    the estimated
    $price$ of houses with medium quality  $(quality1_i=1)$  is  $1.4e+05$   units **greater** than the estimated price of houses with low quality
    $(quality0_i=1)$ , because low quality is the reference category  of $quality$ variable.


-   $\hat{\beta}_{quality2} = 3.406e+05$  $\Rightarrow$    the
    estimated $price$ of houses with medium quality 
    $(quality2_i=1)$  is  $3.406e+05$ units **greater** than the estimated
    price of houses with high quality  $(quality0_i=1)$  


-   $\hat{\beta}_{quality3} = 2.788e+05$   $\Rightarrow$     the estimated
    $price$ of houses with ultra quality  $(quality1_i=1)$   is
  $2.788e+05$  units **greater** than the estimated price of houses with low quality  $(quality0_i=1)$ 


-   $\hat{\beta}_{quality2} - \hat{\beta}_{quality1} = 3.406e+05  - 1.4e+05 =2.006e+05$     $\Rightarrow$   the estimated price of houses  with high quality  $(quality2_i=1)$   is  $2.006e+05$ units **greater**   than the estimated price of houses with medium quality  $(quality1_i=1)$ 

-  $\hat{\beta}_{quality3} - \hat{\beta}_{quality2} = 2.788e+05   - 3.406e+05 =-61800$     $\Rightarrow$  the estimated price of houses  with ultra quality  $(quality3_i=1)$   is  $61800$ units **less**   than the estimated price of houses with high quality  $(quality2_i=1)$ 

<br>

Note that in all these cases it is assumed that the rest of the model variables don´t vary (have the same values) from one scenario to another.



----



### Interaction  Coefficient <a class="anchor" id="38"></a>



#### Interaction  between binary and quantitative variables

Let $X_k$ a quantitative variable, and $X_r$ a **binary** $\lbrace 0, 1\rbrace$ categorical variable.

If the reference category is  $0$  , then  $X_r$ enter in the model as the binary $\lbrace 0, 1\rbrace$ variable $X_{r1}$ defined as:

$$
x_{i r1}=1  \hspace{0.05cm} \Leftrightarrow \hspace{0.05cm}  x_{i r}=1
$$



In addition, we define the variable $X_{r0}$ as:

$$
x_{i r0}=1  \hspace{0.05cm} \Leftrightarrow \hspace{0.05cm}  x_{i r}=0 
$$

We have the following estimated linear regression model  

$$\hat{y}_i= \hat{\beta_0} + \hat{\beta_0}\cdot x_{i1} + ... + \hat{\beta_p}\cdot x_{ip} + \hat{\beta}_{r}\cdot x_{ir} + \hat{\beta}_{k}\cdot x_{ik} + \hat{\beta}_{rk}\cdot x_{ir}\cdot x_{ik}  $$

-   If  $\hspace{0.05cm} \hat{\beta}_{r1} + \hat{\beta}_{r1}\cdot x_{ki} \hspace{0.05cm} > \hspace{0.05cm} 0$  , then

    -  $\hat{y}_i$ $\hspace{0.05cm}$  is $\hspace{0.05cm}$ $\hspace{0.05cm} \hat{\beta}_{r1} + \hat{\beta}_{r1}\cdot x_{ki} \hspace{0.05cm}$ $\hspace{0.05cm}$ units **greater** if $\hspace{0.05cm}$ $x_{ir}= 1$ $\hspace{0.05cm}$  than if  $\hspace{0.05cm}$ $x_{ir}= 0$

<br>

-   If  $\hspace{0.05cm} \hat{\beta}_{r1} + \hat{\beta}_{r1}\cdot x_{ki} \hspace{0.05cm} < \hspace{0.05cm} 0$  , then

    -  $\hat{y}_i$ $\hspace{0.05cm}$  is $\hspace{0.05cm}$ $\hspace{0.05cm} \hat{\beta}_{r1} + \hat{\beta}_{r1}\cdot x_{ki} \hspace{0.05cm}$ $\hspace{0.05cm}$ units **less** if $\hspace{0.05cm}$ $x_{ir}= 1$ $\hspace{0.05cm}$  than if  $\hspace{0.05cm}$ $x_{ir}= 0$

Note these magnitudes depend on $x_{ik}$ value, because we have set an interaction between $X_k$ and $X_r$ in the model.

**Observation:**

The above affirmations are based in the following:

$(\hat{y}_i \hspace{0.05cm} | \hspace{0.05cm} x_{ir1}=1 ) - (\hat{y}_i  \hspace{0.05cm} | \hspace{0.05cm}  x_{ir0}=1 ) =  \hat{\beta}_{r1} + \hat{\beta}_{r1k}\cdot x_{ik}$





#### Interaction  between ternary and quantitative variables

Let $X_k$ a quantitative variable, and $X_r$ a **ternary** $\lbrace 0, 1, 2 \rbrace$ categorical variable.

<br>

If the reference category is  $0$  , then  $X_r$ enter in the model with
two binary $\lbrace 0,1\rbrace$ variables $X_{r1}$ y $X_{r2}$ defined as:

\begin{gather*}
x_{i r1}=1   \Leftrightarrow   x_{i r}=1 \\
x_{i r2}=1  \Leftrightarrow     x_{i r}=2 
\end{gather*}

<br>

In addition, we define the variable $X_{r0}$ as:

$$
x_{i r0}=1  \hspace{0.05cm} \Leftrightarrow \hspace{0.05cm}  x_{i r}=0 
$$

<br>
 
We have the following estimated linear regression model  

$$\hat{y}_i= \hat{\beta_0} + \hat{\beta_0}\cdot x_{i1} + ... + \hat{\beta_p}\cdot x_{ip}  + \hat{\beta}_{k}\cdot x_{ik} + \hat{\beta}_{r1}\cdot x_{ir1} + \hat{\beta}_{r2}\cdot x_{ir2} + \hat{\beta}_{r1k}\cdot x_{ir1}\cdot x_{ik} + \hat{\beta}_{r2 k}\cdot x_{ir2}\cdot x_{ik} $$

<br>

-   If  $\hspace{0.05cm} \hat{\beta}_{r1} + \hat{\beta}_{r1}\cdot x_{ki} \hspace{0.05cm} > \hspace{0.05cm} 0$  , then

    -  $\hat{y}_i$ $\hspace{0.05cm}$  is $\hspace{0.05cm}$ $\hspace{0.05cm} \hat{\beta}_{r1} + \hat{\beta}_{r1}\cdot x_{ki} \hspace{0.05cm}$ $\hspace{0.05cm}$ units **greater** if $\hspace{0.05cm}$ $x_{ir}= 1$ $\hspace{0.05cm}$  than if  $\hspace{0.05cm}$ $x_{ir}= 0$

<br>

-   If  $\hspace{0.05cm} \hat{\beta}_{r1} + \hat{\beta}_{r1}\cdot x_{ki} \hspace{0.05cm} < \hspace{0.05cm} 0$  , then

    -  $\hat{y}_i$ $\hspace{0.05cm}$  is $\hspace{0.05cm}$ $\hspace{0.05cm} \hat{\beta}_{r1} + \hat{\beta}_{r1}\cdot x_{ki} \hspace{0.05cm}$ $\hspace{0.05cm}$ units **less** if $\hspace{0.05cm}$ $x_{ir}= 1$ $\hspace{0.05cm}$  than if  $\hspace{0.05cm}$ $x_{ir}= 0$

<br>

-   If  $\hspace{0.05cm} \hat{\beta}_{r2} + \hat{\beta}_{r2}\cdot x_{ki} \hspace{0.05cm} > \hspace{0.05cm} 0$  , then

    -  $\hat{y}_i$ $\hspace{0.05cm}$  is $\hspace{0.05cm}$ $\hspace{0.05cm} \hat{\beta}_{r2} + \hat{\beta}_{r2}\cdot x_{ki} \hspace{0.05cm}$ $\hspace{0.05cm}$ units **greater** if $\hspace{0.05cm}$ $x_{ir}= 2$ $\hspace{0.05cm}$  than if  $\hspace{0.05cm}$ $x_{ir}= 0$

<br>

-   If  $\hspace{0.05cm} \hat{\beta}_{r2} + \hat{\beta}_{r2}\cdot x_{ki} \hspace{0.05cm} < \hspace{0.05cm} 0$  , then

    -  $\hat{y}_i$ $\hspace{0.05cm}$  is $\hspace{0.05cm}$ $\hspace{0.05cm} \hat{\beta}_{r2} + \hat{\beta}_{r2}\cdot x_{ki} \hspace{0.05cm}$ $\hspace{0.05cm}$ units **less** if $\hspace{0.05cm}$ $x_{ir}= 2$ $\hspace{0.05cm}$  than if  $\hspace{0.05cm}$ $x_{ir}= 0$

<br>


-   If  $\hspace{0.05cm} (\hat{\beta}_{r2} - \hat{\beta}_{r1} ) + (\hat{\beta}_{r2} - \hat{\beta}_{r1})\cdot x_{ki} \hspace{0.05cm} > \hspace{0.05cm} 0$  , then

    -  $\hat{y}_i$ $\hspace{0.05cm}$  is $\hspace{0.05cm}$ $\hspace{0.05cm} (\hat{\beta}_{r2} - \hat{\beta}_{r1} ) + (\hat{\beta}_{r2} - \hat{\beta}_{r1})\cdot x_{ki} \hspace{0.05cm}$ $\hspace{0.05cm}$ units **greater** if $\hspace{0.05cm}$ $x_{ir}= 2$ $\hspace{0.05cm}$  than if  $\hspace{0.05cm}$ $x_{ir}= 1$

<br>

-   If  $\hspace{0.05cm} (\hat{\beta}_{r2} - \hat{\beta}_{r1} ) + (\hat{\beta}_{r2} - \hat{\beta}_{r1})\cdot x_{ki} \hspace{0.05cm} < \hspace{0.05cm} 0$  , then

    -  $\hat{y}_i$ $\hspace{0.05cm}$  is $\hspace{0.05cm}$ $\hspace{0.05cm} (\hat{\beta}_{r2} - \hat{\beta}_{r1} ) + (\hat{\beta}_{r2} - \hat{\beta}_{r1})\cdot x_{ki} \hspace{0.05cm}$ $\hspace{0.05cm}$ units **less** if $\hspace{0.05cm}$ $x_{ir}= 2$ $\hspace{0.05cm}$  than if  $\hspace{0.05cm}$ $x_{ir}= 1$

<br>

Note these magnitudes depend on $x_{ik}$ value, because we have set an interaction between $X_k$ and $X_r$ in the model.





**Observation:**

The above affirmations are based in the following:

- $(\hat{y}_i \hspace{0.05cm} | \hspace{0.05cm} x_{ir1}=1 ) - (\hat{y}_i  \hspace{0.05cm} | \hspace{0.05cm}  x_{ir0}=1 ) =  \hat{\beta}_{r1} + \hat{\beta}_{r1k}\cdot x_{ik}$

- $(\hat{y}_i \hspace{0.05cm} | \hspace{0.05cm} x_{ir2}=1 ) - (\hat{y}_i  \hspace{0.05cm} | \hspace{0.05cm}  x_{ir0}=1 ) =  \hat{\beta}_{r2} + \hat{\beta}_{r2k}\cdot x_{ik}$

- $(\hat{y}_i \hspace{0.05cm} | \hspace{0.05cm} x_{ir2}=1 ) - (\hat{y}_i  \hspace{0.05cm} | \hspace{0.05cm}  x_{ir1}=1 ) =  (\hat{\beta}_{r2} - \hat{\beta}_{r1} ) + (\hat{\beta}_{r2k} - \hat{\beta}_{r1k})\cdot x_{ki}$





Note that this can easily be extrapolated to the case of interaction between an $r$-ary categorical variable and a quantitative variable, for $r>3$.



---



### Example of interaction coefficient interpretation <a class="anchor" id="39"></a>



```python
model_Python_2 = smf.ols(formula = 'price ~  quality*size_in_m_2 + no_of_bedrooms + no_of_bathrooms + latitude + longitude', 
                               data =data_Python)

model_Python_2 = model_Python_2.fit()
 
print(model_Python_2.summary())
```

We have got the following:

 $\left( \widehat{price}_i | quality1_i=1 \right) - \left(\widehat{price}_i | quality0_i=1 \right) = \hat{\beta}_{quality1} + \hat{\beta}_{quality1:size\_in\_m\_2} \cdot size\_in\_m\_2_i = -2.353\cdot 10^5 + 2908.2719  \cdot size\_in\_m\_2_i$  

This magnitude depends on the value of $size\_in\_m\_2_i$

For example if $size\_in\_m\_2_i = 100$ , then:

$\left( \widehat{price}_i | quality1_i=1 \right) - \left(\widehat{price}_i | quality0_i=1 \right) = 55527.19$

So the estimated price of a 100 $m^2$ house is $55527.19$ units greater if $quality1_i=1$ (it has medium quality) than $quality0_i=1$ (it has low quality)



$\left( \widehat{price}_i | quality2_i=1 \right) - \left(\widehat{price}_i | quality0_i=1 \right) = \hat{\beta}_{quality2} + \hat{\beta}_{quality2:size\_in\_m\_2} \cdot size\_in\_m\_2_i = -1.373\cdot 10^6 + 1.208\cdot 10^4  \cdot size\_in\_m\_2_i$  

This magnitude depends on the value of $size\_in\_m\_2_i$

For example if $size\_in\_m\_2_i = 100$ , then:

$\left( \widehat{price}_i | quality2_i=1 \right) - \left(\widehat{price}_i | quality0_i=1 \right) = 55527.19$

So the estimated price of a 100 $m^2$ house is $165000$ units less if $quality2_i=1$ (it has high quality) than $quality0_i=1$ (it has low quality)



$\left( \widehat{price}_i | quality3_i=1 \right) - \left(\widehat{price}_i | quality1_i=1 \right) = \left(\hat{\beta}_{quality3} - \hat{\beta}_{quality1}\right) + \left( \hat{\beta}_{quality3:size\_in\_m\_2} - \hat{\beta}_{quality1:size\_in\_m\_2}\right)  \cdot size\_in\_m\_2_i =  (1.318e+06 - (-2.353e+05 )) + (-1.145e+04 + 2908.2719 )\cdot size\_in\_m\_2_i $  

This magnitude depends on the value of $size\_in\_m\_2_i$

For example if $size\_in\_m\_2_i = 100$ , then:

$\left( \widehat{price}_i | quality3_i=1 \right) - \left(\widehat{price}_i | quality1_i=1 \right) = 699127.19$

So the estimated price of a 100 $m^2$ house is $699127.19$ units greater if $quality3_i=1$ (it has ultra quality) than $quality1_i=1$ (it has medium quality)



Note that in all these cases it is assumed that the rest of the model variables don´t vary (have the same values) from one scenario to another.



----



## Inference <a class="anchor" id="40"></a>




### Confidence Interval for $\beta_j$ <a class="anchor" id="41"></a>


$\hspace{0.05cm}\widehat{Var}(\widehat{\beta}_j)\hspace{0.05cm}$
 
\begin{gather*}
IC\left(\beta_j  \right)= \left[ \hspace{0.05cm} \hat{\beta}_j \ \hspace{0.1cm} \pm \hspace{0.1cm}  \ t_{\alpha/2}^{n-p-1} \cdot \sqrt{\widehat{Var}(\widehat{\beta}_j)} \hspace{0.05cm} \right] = \left[\hspace{0.05cm}  \hat{\beta}_j \ \hspace{0.1cm} \pm \hspace{0.1cm}  \ t_{\alpha/2}^{n-p-1} \cdot \sqrt{S_R^2 \cdot q_{jj}} \hspace{0.05cm} \right]
\end{gather*}
 
Where:

$q_{jj} \hspace{0.1cm}$ is the element $\hspace{0.1cm} j+1 \hspace{0.1cm}$ of the principal diagonal of the matrix
$\hspace{0.1cm} (X^t \cdot X)^{-1} \hspace{0.1cm}$ for $\hspace{0.1cm} j=0,1,...,p$

 




**Observation:**

The smaller $\hspace{0.1cm}\sqrt{\widehat{Var}(\widehat{\beta}_j)}\hspace{0.1cm}$  is, the smaller the confidence interval of $\hspace{0.1cm}\widehat{\beta}_j\hspace{0.1cm}$ will be.





### Confidence Interval for $\sigma^2$ <a class="anchor" id="42"></a>



 
\begin{gather*}
IC\left(\sigma^2  \right)= \left[ 0 \ , \ \dfrac{n-p-1}{\chi_{1-\alpha/2}^{n-p-1}}\cdot S_R^2  \right]
\end{gather*}
 




---




#### Confidence Interval for  $\beta_j$  in `R` <a class="anchor" id="43"></a>

 

We can compute de confidence interval of $\beta_j$ with a confidence
level of $95\%$ for $j=0,1,...,p$



```r
%%R

confint(model_R , conf.level=0.95)
```



---



#### Confidence Interval for  $\beta_j$  in `Python` <a class="anchor" id="44"></a>



```python
beta_intervals = model_Py_sm.conf_int(alpha=0.05)
beta_intervals.columns = ['2.5%', '97.5%']
beta_intervals
```




Then, for example, we have:

 
$$
IC(\beta_0)=\left[-1.208060e+08 \ , \ -3.336873e+06 \right] 
$$
$$
IC(\beta_{size\_in\_m\_2})=\left[ 3.424446e+04   \ , \ 3.708364e+04 \right] 
$$
 


We also have this information in the output obtained with `print(model_Python_1.summary())`



---




#### Confidence Interval for  $\sigma^2$  in `R` <a class="anchor" id="45"></a>

 

We can compute de confidence interval of $\sigma^2$ with a confidence
level of $95\%$ usingl the package "model".

We can load this package running the following code:



```r
%%R 

# install.packages("remotes")
# remotes::install_github("fhernanb/model")
```


```r
%%R
 
library(model)

confint_sigma2(object=model_R , level=0.95)
```


Then, we have:

 
\begin{gather*}
IC(\sigma^2)=\left[2.418577e+12   \ , \ 2.747045e+12 \right]
\end{gather*}
 
 




---



#### Confidence Interval for  $\sigma^2$  in `Python` <a class="anchor" id="46"></a>


In this case we will use the interval expression before defined:


```python
import scipy
```


```python
n=len(data_Python)
p=6
scipy.stats.chi2.ppf(0.95, n-p)
```


```python
b = ( n-p-1 / scipy.stats.chi2.ppf(0.95, n-p-1))*estimated_variance_error

interval_sigma2 = [0,b]
interval_sigma2
```



---




### Hypothesis Test for $\beta_j$ <a class="anchor" id="47"></a>

 



We can carry out the following three test:

|                               |                            |                            |
|:------------------------:|:---------------------:|:---------------------:|
|  $H_0: \beta_j = \beta_j^*$   | $H_0: \beta_j = \beta_j^*$ | $H_0: \beta_j = \beta_j^*$ |
| $H_1: \beta_j \neq \beta_j^*$ | $H_1: \beta_j > \beta_j^*$ | $H_1: \beta_j < \beta_j^*$ |

  





#### Test Statistic:

 

The test statistic for any of the previous test is:

 
\begin{gather*}
t_{exp | H_0}=\dfrac{\hat{\beta}_j - \beta_j^*}{\sqrt{S_R \cdot q_{jj}}} \sim t_{n-p}
\end{gather*}
 




 

#### Decision Rule

 

For a fixed signification level $\alpha$



-   Case   $H_0: \beta_j = \beta_j^*$  vs  $H_1: \beta_j \neq \beta_j^*$




-   - Based in the test statistic:      

 
\begin{gather*}
Reject \ H_0 \ \Leftrightarrow \ t_{exp|H_0} > t_{\alpha/2}^{n-p} \ ó \ t_{exp|H_0} < t_{1-\alpha/2}^{n-p}
\end{gather*}
 
 
-   - Based in p-value: 
         

 
\begin{gather*}
pvalue=2\cdot P( t_{n-p} \geqslant \mid t_{exp|H_0} \mid ) \\ \\
Reject \ H_0  \ \Leftrightarrow \ pvalue < \alpha
\end{gather*}
 
 





-   Case   $H_0: \beta_j = \beta_j^*$  vs  $H_1: \beta_j > \beta_j^*$



-   - Based in the test statistic: 


 
\begin{gather*}
Reject \ H_0 \ \Leftrightarrow \ t_{exp|H_0} > t_{\alpha/2}^{n-p}
\end{gather*}
 

-   - Based in p-value: 


 
\begin{gather*}
pvalue=2\cdot P( t_{n-p} \geqslant t_{exp|H_0} ) \\ \\
Reject \ H_0  \ \Leftrightarrow \ pvalue < \alpha
\end{gather*}
 




-   Case   $H_0: \beta_j = \beta_j^*$  vs  $H_1: \beta_j < \beta_j^*$



-   - Based in the test statistic: 

 
\begin{gather*}
Reject \ H_0 \ \Leftrightarrow \ t_{exp|H_0} < t_{1-\alpha/2}^{n-p}
\end{gather*}
 
 

-   - Based in p-value:

 
\begin{gather*}
pvalue=2\cdot P( t_{n-p} \leqslant t_{exp|H_0} ) \\ \\
Reject \ H_0  \ \Leftrightarrow \ pvalue < \alpha
\end{gather*}
 

 




----




### Test of Significance for $\beta_j$ <a class="anchor" id="48"></a>

 



The test of significance for the coefficient $\beta_j$ is the following
test:

 
\begin{gather*}
H_0: \beta_j=0 \\
H_1: \beta_j \neq 0
\end{gather*}
 
 



The test statistic is the previously exposed, taking into account that
now $\beta_j^*=0$

 
\begin{gather*}
t_{exp | H_0}=\dfrac{\hat{\beta}_j - 0}{\sqrt{S_R \cdot q_{jj}}} = \dfrac{\hat{\beta}_j}{\sqrt{\widehat{Var}(\widehat{\beta}_j) }} \sim t_{n-p}
\end{gather*}
 


 

The decision rules are the same too

 
\begin{gather*}
Reject \ H_0  \ \Leftrightarrow \ pvalue < \alpha
\end{gather*}
 




---




#### Test of Significance  in `R` <a class="anchor" id="49"></a>

The value of $\hspace{0.1cm} t_{exp|H_0} \hspace{0.1cm}$ and also the p-value of the test of significance for $\beta_j$ could be found in the output obtained with `summary(model_R_1)`


```r
%%R
summary(model_R)
```



---



#### Test of Significance  in `Python` <a class="anchor" id="50"></a>


The value of $\hspace{0.1cm} t_{exp|H_0} \hspace{0.1cm}$ and also the p-value of the test of significance for $\beta_j$ could be found in the output obtained with `print(model_Python_1.summary())`


```python
print(model_Py_sm.summary())
```



The p-values we have got are the following:


\begin{gather*}
H_0: \beta_{quality1}=0 \\
H_1: \beta_{quality1} \neq 0 \\ \\
pvalue = 0.094   
\end{gather*}



For $\hspace{0.05cm} \alpha = 0.05 < 0.094$ $\hspace{0.1cm} \Rightarrow \hspace{0.1cm}$ $Not \hspace{0.08cm} Reject  \hspace{0.08cm} H_0 : \hspace{0.05cm} \beta_{quality1}=0 \hspace{0.1cm} \Rightarrow \hspace{0.1cm}$ $quality1 \hspace{0.1cm}$ isn´t a significance variable




\begin{gather*}
H_0: \beta_{quality2}=0 \\
H_1: \beta_{quality2} \neq 0 \\ \\
pvalue = 0.028    
\end{gather*}


For $\hspace{0.05cm} \alpha = 0.05 > 0.028$ $\hspace{0.1cm} \Rightarrow \hspace{0.1cm}$ $Reject  \hspace{0.08cm} H_0 : \hspace{0.05cm} \beta_{quality2}=0 \hspace{0.1cm} \Rightarrow \hspace{0.1cm} Accept  \hspace{0.08cm} H_1 : \hspace{0.05cm} \beta_{quality2}\neq 0$ $\hspace{0.1cm} \Rightarrow \hspace{0.1cm}$  $quality2 \hspace{0.1cm}$ is a significance variable




\begin{gather*}
H_0: \beta_{quality3}=0 \\
H_1: \beta_{quality3} \neq 0 \\ \\
pvalue = 0.159 
\end{gather*}

For $\hspace{0.05cm} \alpha = 0.05 < 0.159$ $\hspace{0.1cm} \Rightarrow \hspace{0.1cm}$ $Not Reject  \hspace{0.08cm} H_0 : \hspace{0.05cm} \beta_{quality3}=0 \hspace{0.1cm} \Rightarrow \hspace{0.1cm}$ $quality3 \hspace{0.1cm}$ isn´t a significance variable






\begin{gather*}
H_0: \beta_{size\_in\_m\_2}=0 \\
H_1: \beta_{size\_in\_m\_2} \neq 0 \\ \\
pvalue \simeq 0
\end{gather*}

For $\hspace{0.05cm} \alpha = 0.05 < 0$ $\hspace{0.1cm} \Rightarrow \hspace{0.1cm}$ $Reject  \hspace{0.08cm} H_0 : \hspace{0.05cm} \beta_{size\_in\_m\_2}=0 \hspace{0.1cm} \Rightarrow \hspace{0.1cm}$ $size\_in\_m\_2  \hspace{0.1cm}$ is a significance variable





\begin{gather*}
H_0: \beta_{no\_of\_bedrooms}=0 \\
H_1: \beta_{no\_of\_bedrooms} \neq 0 \\ \\
pvalue \simeq 0
\end{gather*}

For $\hspace{0.05cm} \alpha = 0.05 < 0$ $\hspace{0.1cm} \Rightarrow \hspace{0.1cm}$ $Reject  \hspace{0.08cm} H_0 : \hspace{0.05cm} \beta_{no\_of\_bedrooms}=0 \hspace{0.1cm} \Rightarrow \hspace{0.1cm}$ $no\_of\_bedrooms  \hspace{0.1cm}$ is a significance variable






\begin{gather*}
H_0: \beta_{no\_of\_bathrooms}=0 \\
H_1: \beta_{no\_of\_bathrooms} \neq 0 \\ \\
pvalue =  0.403
\end{gather*}

For $\hspace{0.05cm} \alpha = 0.05 < 0.403$ $\hspace{0.1cm} \Rightarrow \hspace{0.1cm}$ $Not Reject  \hspace{0.08cm} H_0 : \hspace{0.05cm} \beta_{no\_of\_bathrooms}=0 \hspace{0.1cm} \Rightarrow \hspace{0.1cm}$ $no\_of\_bathrooms  \hspace{0.1cm}$ isn´t a significance variable





\begin{gather*}
H_0: \beta_{latitude}=0 \\
H_1: \beta_{latitude} \neq 0 \\ \\
pvalue \simeq 0
\end{gather*}

For $\hspace{0.05cm} \alpha = 0.05 > 0$ $\hspace{0.1cm} \Rightarrow \hspace{0.1cm}$ $Reject  \hspace{0.08cm} H_0 : \hspace{0.05cm} \beta_{latitude}=0 \hspace{0.1cm} \Rightarrow \hspace{0.1cm}$ $latitude  \hspace{0.1cm}$ is a significance variable



\begin{gather*}
H_0: \beta_{longitude}=0 \\
H_1: \beta_{longitude} \neq 0 \\ \\
pvalue = 0.015
\end{gather*}

For $\hspace{0.05cm} \alpha = 0.05 > 0.015$ $\hspace{0.1cm} \Rightarrow \hspace{0.1cm}$ $Reject  \hspace{0.08cm} H_0 : \hspace{0.05cm} \beta_{longitude}=0 \hspace{0.1cm} \Rightarrow \hspace{0.1cm}$ $longitude  \hspace{0.1cm}$ is a significance variable



---




### ANOVA Test  <a class="anchor" id="51"></a>



The ANOVA test is also called **test of model global significance** :
 
\begin{gather*}
\hspace{-0.7 cm} H_0: \hspace{0.15cm} \beta_1=\dots =\beta_p=0 \\
H_1: \hspace{0.15cm} \exists \ j=1,...,p , \hspace{0.2cm} \beta_j \neq 0
\end{gather*}
 
 



#### Statistic test

 

For define the test statistic , firt we have to define some elements:



-   Total Sum Squares $(TSS)$

 \begin{gather*}
TSS =  \sum_{i=1}^n ( y_i - \overline{y})\hspace{0.02cm}^2
\end{gather*}
 
-   Residual Sum Squares $(RSS)$

 \begin{gather*}
RSS=  \sum_{i=1}^n \widehat{\varepsilon}_i\hspace{0.01cm}^2 =  \sum_{i=1}^n ( y_i - \hat{y}_i)\hspace{0.02cm}^2
\end{gather*}
 
-   Regression Sum Squares $(RegSS)$

 
\begin{gather*}
RegSS =  \sum_{i=1}^n ( \hat{y}_i - \overline{y} )\hspace{0.02cm}^2
\end{gather*}
 



It can be proved that:

 
\begin{gather*}
TSS=RSS+RegSS
\end{gather*}
 
<br>

-   $TSS \hspace{0.1cm}$ is the total variance of the response variable $Y$

-   $RegSS \hspace{0.1cm}$ is the variance of the response variable $Y$ **explained** by the
    model using $X$

-   $RSS \hspace{0.1cm}$ is the variance of the response variable $Y$ **not explained** by the
    model using $X$





Now we can define the test statistic as:

 
\begin{gather*}
F_{exp|H_0}= \dfrac{(TSS-RSS)/p}{RSS/(n-p-1)} = \dfrac{(TSS-RSS)/p}{ \hat{\varepsilon}_i\hspace{0.02cm}^2  } \sim F_{\hspace{0.05cm}p,\hspace{0.05cm} n-p-1}
\end{gather*}
 
 <br>

Where:  $\hspace{0.1cm} p$ is the number of predictor variables $X_1,...,X_p$ of the
model

 



#### Decision Rule

 

-   Based on statistic test:

 
\begin{gather*}
Reject \ H_0 \ \Leftrightarrow \ F_{exp|H_0} > F_{\alpha}^{\hspace{0.1cm}p,\hspace{0.05cm} n-p-1}
\end{gather*}
 
-   Based on p-value:

 
\begin{gather*}
Reject \ H_0  \ \Leftrightarrow \ pvalue < \alpha
\end{gather*}
 




---



#### ANOVA test in `R` <a class="anchor" id="52"></a>

The value of $\hspace{0.1cm} F_{exp|H_0}$ and also the p-value of the ANOVA test could be found in the output obtained with `summary(model_R_1)`


```r
%%R
summary(model_R)
```



---



#### ANOVA test in `Python`  <a class="anchor" id="53"></a>

The value of $\hspace{0.1cm} F_{exp|H_0}$ and also the p-value of the ANOVA test could be found in the output obtained with `print(model_Python_1.summary())`


```python
print(model_Py_sm.summary())
```



We have got the following:

$\hspace{4cm} F_{exp|H_0} = 547.4$ $\hspace{0.3cm}$ (F-statistic) 

$\hspace{4cm} pvalue \simeq 0$ $\hspace{0.3cm}$  (Prob (F-statistic))



So for any $\alpha$ we can reject $\hspace{0.1cm}  H_0:   \hspace{0.05cm} \beta_1=\dots =\beta_p=0  \hspace{0.15cm}$, so we can affirm the model is globally significant 



----



### Prediction Interval for $\hspace{0.1cm} y_i$  <a class="anchor" id="53.1"></a>


We have that

 $$\hat{y}_i = x_i^t \cdot \hat{\beta} \hspace{0.1cm} \sim \hspace{0.1cm} N \left( \hspace{0.1cm} E[\hat{y}_i] \hspace{0.15cm},\hspace{0.15cm} \sigma^2 \cdot (1 + x_i^t \cdot (X^t \cdot X)^{-1} \cdot x_i ) \hspace{0.1cm} \right)$$



Using that we  can get the following probability interval for $y_i$

$$ IP(y_i)_{1-\alpha} = \left[\hspace{0.1cm} \hat{y}_i  \hspace{0.1cm}\pm\hspace{0.1cm} t_{\alpha/2}^{n-p-1} \sqrt{ \widehat{\sigma}^2 \cdot \left( 1 + x_i^t \cdot (X^t \cdot X)^{-1} \cdot x_i \right) } \hspace{0.1cm} \right] $$



----



### Prediction Interval for $\hspace{0.1cm} y_i$ in `Python` <a class="anchor" id="53.2"></a>


```python
Y = data_Python[['price']]

X = data_Python[['size_in_m_2', 'longitude', 'latitude', 'no_of_bedrooms', 'no_of_bathrooms', 'quality']]

X = varcharProcessing(X, varchar_process = "dummy_dropfirst")
```


```python
Probability_Intervals_Response = pd.DataFrame({ 'y': 0 , 'y_predict': 0 ,  'Prob_Interval_lower': 0, 'Prob_Interval_upper': 0}, index= range(0,len(data_Python)))
```


```python
Probability_Intervals_Response.head()
```


```python
n=len(data_Python)

p=model_Py_smf.df_model

t = scipy.stats.t.ppf(0.95, n-p-1)

XtX_inv = np.linalg.inv(X.T @ X)

Probability_Intervals_Response.iloc[:, 0] = Y
Probability_Intervals_Response.iloc[:, 1] = predictions


for i in range(0, len(data_Python)-1):

    x_i = X.to_numpy()[i, ]
    x_i = np.array([x_i]) # necessary step to transpose a 1D array

    hat_y_i = predictions.to_numpy()[i, ]
        
    a = hat_y_i - np.sqrt( estimated_variance_error * ( 1 + x_i @ XtX_inv @ x_i.T ) )
    b = hat_y_i + np.sqrt( estimated_variance_error * ( 1 + x_i @ XtX_inv @ x_i.T ) )

    a = float(a)
    b = float(b)

    Probability_Intervals_Response.iloc[i, 2] = a
    Probability_Intervals_Response.iloc[i, 3] = b
```


```python
 Probability_Intervals_Response
```



----



## Goodness of Fit: $\hspace{0.1cm}$ Determination Coefficient $(R^2)$ <a class="anchor" id="54"></a>

 





The determination coefficient, also called R-square, is defined as:

 
\begin{gather*}
R^2 = \dfrac{RegSS}{TSS} = \dfrac{TSS-RSS}{TSS} =1 - \dfrac{RSS}{TSS}
\end{gather*}
 



**Properties**

-   $ R^2$ is the proportion of total variance of the response
    variable $Y$ that is explained by the model using $X$

-   $R^2 \in \left[ 0 , 1 \right]$

For this reason $R^2$ is used as a measure of how well the model fits the
response variable .

 



**Interpretation**

The interpretation of $R^2$ is the following:

-   If $R^2$ is close to 1, indicates good fit of model to the response
    variable data

-   If $R^2$ is clode to 0, indicates bad fit of model to the response
    variable data




----




### Compute $R^2$ in `R` <a class="anchor" id="55"></a>

The value of $\hspace{0.1cm} R^2$  could be found in the output obtained with `summary(model_R)`


```r
%%R

summary(model_R)$r.squared 
```



---



### Compute $R^2$ in `Python` <a class="anchor" id="56"></a>


The value of $\hspace{0.1cm} R^2$  could be found in the output obtained with `print(model_Py_smf.summary())`


```python
model_Py_smf.rsquared
```

We can compute $R^2$ with `sk-learn` as follows:


```python
Model_Py_sklearn.score(X, y)
```



We have got the following:

$$ R^2 = 0.698$$



---




## Goodness of Fit: $\hspace{0.1cm}$ Adjusted $R^2$ <a class="anchor" id="57"></a>

$R^2$ has several problems.

1.  $R^2$ always increase when increase the number of predictors,
    although they are not significative.

2.  It´s possible estimate two models with the same prediction power but
    with different $R^2$





For avoid the disadvantages of $R^2$ was created the adjusted $R^2$ ,
denoted as $\widehat{R^2}$, and defined as:



\begin{gather*}
\widehat{R}^2 =  1 - \dfrac{RSS/(n-p-1)}{TSS/(n-1)} = 1 - \left( 1- R^2 \right) \cdot \dfrac{n-1}{n-p}
\end{gather*}




This metric doesn't grow when including irrelevant predictors since if $RSS$ is small as $p$ is large, $1/(n-p-1)$ will be large compensating the $RSS$ value



---



### Compute $\widehat{R^2}$ in `R` <a class="anchor" id="58"></a> 

The value of $\hspace{0.1cm} \widehat{R^2}$  could be found in the output obtained with `summary(model_R)`


```r
%%R

summary(model_R)$adj.r.squared 
```



----



### Compute $\widehat{R^2}$ in `Python` <a class="anchor" id="59"></a>


The value of $\hspace{0.1cm} \widehat{R^2}$  could be found in the output obtained with `print(model_Py_smf.summary())`


```python
model_Py_smf.rsquared_adj
```



We have got the following:

$$ \widehat{R^2} = 0.697$$



----



## Model Problems <a class="anchor" id="60"></a>



## Multicollinearity <a class="anchor" id="61"></a>

Multicollinearity problem happens when some of the predictors are lineary dependients.

Why multicollinearity is a problem ?

$1.\hspace{0.1cm}$ In the worst case it makes the estimation of the model impossible.

$2.\hspace{0.1cm}$ At best, it causes the beta estimators to have a lot of variance, which makes the model's predictions and inference very imprecise. And it also causes predictors that are relevant to come out as non-significant in the significance test.
 



### Types of multicollinearity  <a class="anchor" id="62"></a>

#### Perfect Multicollinearity

At least one of the predictors is a linear combination of the rest of the predictors, so $\hspace{0.1cm}Rg(X) < p+1 \hspace{0.1cm}$ (not full range)

By the null rank theorem, $\hspace{0.1cm}R(X^t \cdot X) < p+1\hspace{0.1cm}$ , therefore there is no $\hspace{0.1cm}(X^t \cdot X)^{-1}\hspace{0.1cm}$ , so it cannot be estimate $\hspace{0.1cm}\beta\hspace{0.1cm}$ with the ordinary least squares method .



#### High Multicollinearity

There are predictors with high linear correlation between them. 

In this case is still possible estimate $\beta$ because the multicolinearity isn´t perfect, but the variance of the $\beta$ estimators, $Var(\hat{\beta}_j)$, will be too high, therefore the model will be very imprecise, so the results will not be good.





---



### Identification of multicollinearity <a class="anchor" id="63"></a>

Identification of multicollinearity is carry out by several ways:



If the linear regression model has only **quantitative** predictors:

1. With the correlation matrix of the predictors $\hspace{0.05cm} R$
2. With  $VIF$ (variance increase factor )
3. With  condition number of $\hspace{0.05cm} R$



If the linear model has **quantitative and categorical** predictors:

1. With $GVIF$ (generalize variance increase factor) 



---



### Identification of multicollinearity with  $R$ <a class="anchor" id="64"></a>

The Pearson correlation matrix of a given data matrix $X=[X_1 ,..., X_p]$  is defined as:

<br>

$$
R= \begin{pmatrix}
    r_{11} & r_{12}&...&r_{1p}\\
    r_{21} & r_{22}&...&r_{2p}\\
    &...&\\
    r_{p1}& r_{p2}&...&r_{pp}
\end{pmatrix} = [r_{ij} ]\hspace{0.05cm}_{i,j=1,..,p}
$$ 



Where: $\hspace{0.2cm} r_{i j} \hspace{0.1cm}$ is the Pearson linear correlation between $X_i$ and $X_j$



**Criteria :**  Identification of multicollinearity with  $R$

If we have the following estimated linear regression model $\hspace{0.1cm} Y=X\cdot \widehat{\beta}   \hspace{0.1cm}$  where $\hspace{0.1cm}X=(1, X_1, ..., X_p)\hspace{0.1cm}$ are all **quantitative** predictors.

We compute the Pearson linear correlation matrix of the predictors $\hspace{0.1cm} [ X_1 ,..., X_p] \hspace{0.2cm} \Rightarrow \hspace{0.2cm} R = [r_{ij} ]\hspace{0.05cm}_{i,j=1,..,p}$




If there is any **high** $\hspace{0.1cm} r_{ij}\hspace{0.1cm} (\hspace{0.1cm} > 0.75 \hspace{0.1cm})$  $\hspace{0.1cm} \Rightarrow\hspace{0.1cm}$ possible multicollinearity problem



----



#### Identification of multicollinearity with $R$ in `R`

We will suposse our linear regression model only has **quatitative** predictors.

We need to compute the Pearson correlation matrix for these quantitative predictors.


```r
%%R

R <- cor(data_R %>% select(-price, -quality))
R
```



Now we will compute a heatmap with the correlation matrix:


```r
%%R

library(GGally)

ggcorr(data_R %>% select(-price, -quality), label=TRUE, digits=3)
```



----



#### Identification of multicollinearity with $R$ in `Python`


```python
X = data_Python.loc[: , ['size_in_m_2',	'longitude', 'latitude', 'no_of_bedrooms', 'no_of_bathrooms']]
```


```python
R = X.corr()

R
```




```python
# pip install seaborn
```


```python
import seaborn as sb

corr = R

sb.heatmap(corr, cmap="Blues", annot=True)
```



We can see there are several pairs of predictor with high correlation, such as  **(no\_of\_bathrooms ,  no\_of\_bedrooms )** , **(size\_in\_m\_2 , no\_of\_bedrooms)**  , **(size\_in\_m\_2 , no\_of\_bathrooms)** 

So following this criteria the linear regression model  **price ~ size\_in\_m\_2  + longitude + latitude + no\_of\_bedrooms + no\_of\_bathrooms**  could has multicollinearity problems.



---



### Identification of multicollinearity with $VIF$ <a class="anchor" id="64"></a>

If we have the following estimated linear regression model $\hspace{0.1cm} Y=X\cdot \widehat{\beta}   \hspace{0.1cm}$  where $\hspace{0.1cm}X=(1, X_1, ..., X_p)\hspace{0.1cm}$ are all **quantitative** predictors.

We compute the **inverse** of the Pearson correlation matrix of the predictors $\hspace{0.1cm} [ X_1 ,..., X_p] \hspace{0.2cm} \Rightarrow \hspace{0.2cm} R\hspace{0.07cm}^{-1} $ 




The variance increase factor $\left(VIF\right)$ of the quantitative predictor $X_j$ is:



$$VIF(X_j) \hspace{0.05cm}=\hspace{0.05cm} Diag(R\hspace{0.07cm}^{-1})[\hspace{0.1cm} j \hspace{0.1cm}] \hspace{0.05cm}=\hspace{0.05cm} j \text{ element of} \hspace{0.1cm} Diag(R\hspace{0.07cm}^{-1})$$



And it´s fullfield that:

$$ VIF(X_j) = \dfrac{1}{1- R^2_{X_j}} $$



Where:

$R^2_{X_j}\hspace{0.07cm} $ is the determination coefficient  $\hspace{0.07cm} (R^2)\hspace{0.07cm}$  of the linear regression model $\hspace{0.1cm} X_i = \beta_0 + \beta_1 \cdot  X_1 +...+ \beta_{j-1}\cdot X_{j-1} + \beta_{i+1}\cdot X_{i+1} + ... + \beta_p \cdot X_p$

So, $\hspace{0.07cm} R^2_{X_i} \hspace{0.07cm}$  is the proportion of variability of $\hspace{0.07cm}X_j\hspace{0.07cm}$ explained by $\hspace{0.07cm}X_1,..,X_{j-1},X_{j+1},..,X_p$






**Criteria:** Identification of multicollinearity with $VIF$ 



If $\hspace{0.15cm}VIF(X_j) > 10$ $\hspace{0.15cm}\left( R^2_{X_j} > 0.90 \right)$ $\hspace{0.15cm}\Rightarrow\hspace{0.15cm}$ **High** multicollinearity

If $\hspace{0.15cm}VIF(X_j)  \in [4, 10]$  $\hspace{0.15cm}\left(R^2_{X_j} \in [0.75 , 0.90]\right)$ $\hspace{0.15cm}\Rightarrow\hspace{0.15cm}$ **Medium** multicollinearity


If  $\hspace{0.15cm}VIF(X_j) < 4$ $\hspace{0.15cm}\left(R^2_{X_j} < 0.75 \right)$ $\hspace{0.15cm}\Rightarrow\hspace{0.15cm}$ **Low** multicollinearity




---



#### Identification of multicollinearity with $VIF$ in `R`


```r
%%R

R_inverse <- solve(R)

diag(R_inverse)
```


```r
%%R 

library(car)
library(carData)

vif(lm(price ~ size_in_m_2  + longitude + latitude + no_of_bedrooms + no_of_bathrooms , data=data_R))
```



---



#### Identification of multicollinearity with $VIF$ in `Python`


```python
X = data_Python.loc[: , ['size_in_m_2',	'longitude', 'latitude', 'no_of_bedrooms', 'no_of_bathrooms']]

R = X.corr()
```


```python
R_inv_diag = np.diagonal( np.linalg.inv( R ) )
```


```python
predictors_names = X.columns
```


```python
VIF_Python = pd.DataFrame({'predictor': predictors_names , 'VIF': R_inv_diag })
VIF_Python = VIF_Python.set_index('predictor')
VIF_Python
```

There is a quantitative predictor with $\hspace{0.1cm} VIF > 4 \hspace{0.1cm}$ , but none with $\hspace{0.1cm} VIF > 10 \hspace{0.1cm}$ , so following this criteria the linear regression model $\hspace{0.1cm}$  **price ~ size\_in\_m\_2  + longitude + latitude + no\_of\_bedrooms + no\_of\_bathrooms** $\hspace{0.1cm}$ has **medium** multicollinearity .



---



### Identification of multicollinearity with Condition Number of $\hspace{0.05cm} R$ <a class="anchor" id="66"></a>

If we have the following estimated linear regression model $\hspace{0.1cm} Y=X\cdot \widehat{\beta}   \hspace{0.1cm}$  where $\hspace{0.1cm}X=(1, X_1, ..., X_p)\hspace{0.1cm}$ are all **quantitative** predictors.

We compute the Pearson linear correlation matrix of the predictors $\hspace{0.1cm} [ X_1 ,..., X_p] \hspace{0.2cm} \Rightarrow \hspace{0.2cm} R = [r_{ij} ]\hspace{0.05cm}_{i,j=1,..,p}$



The **condition number** of $R$ is defined as:

$$cond(R) = \sqrt{\dfrac{max\lbrace eigenvalues(R)\rbrace}{min\lbrace eigenvalues(R)\rbrace}} $$



**Criteria :**  Identification of multicollinearity with Condition Number of $\hspace{0.05cm} R$



If $\hspace{0.1cm} cond(R) > 30$ $\hspace{0.1cm} \Rightarrow\hspace{0.1cm}$ **High** multicollinearity

If $\hspace{0.1cm}cond(R) \in (10 , 30)$ $\hspace{0.1cm} \Rightarrow\hspace{0.1cm}$ **Medium** multicollinearity

If $\hspace{0.1cm}cond(R) < 10$ $\hspace{0.1cm} \Rightarrow\hspace{0.1cm}$ **Low** multicollinearity



---



##### Identification of multicollinearity  with condition number of $\hspace{0.05cm} R$ in `R`


```r
%%R

cond_R = sqrt(max(eigen(R)$values)/min(eigen(R)$values))
cond_R
```



---



##### Identification of multicollinearity  with condition number of $\hspace{0.05cm} R$ in `Python`


```python
X = data_Python.loc[: , ['size_in_m_2',	'longitude', 'latitude', 'no_of_bedrooms', 'no_of_bathrooms']]

R = X.corr()
```


```python
from numpy import linalg as LA

eigenvalues , eigenvectors = LA.eig(R)
```


```python
cond_R = math.sqrt(max(eigenvalues)/min(eigenvalues))
cond_R
```

We have get $ \hspace{0.1cm} cond(R) = 4.33 < 10  \hspace{0.1cm}$ , so following this criterion, the linear regression model $\hspace{0.1cm}$ **price ~ size\_in\_m\_2  + longitude + latitude + no\_of\_bedrooms + no\_of\_bathrooms** $\hspace{0.1cm}$ has **low** multicollinearity



---



### Identification of multicollinearity with $GVIF$ <a class="anchor" id="67"></a>

$VIF$ is only a good multicollinearity measure when **all** the **predictors** of the model are **quantitative**.



$GVIF$ is the measure proposed by Fox and Monette (1992) to deal with linear regression models that have **categorical predictors**.




Suppose we have the following estimated linear regression model $\hspace{0.1cm} Y=X\cdot \widehat{\beta}   \hspace{0.1cm}$  where $\hspace{0.1cm}X=(1, X_1, ..., X_p)\hspace{0.1cm}$ are some **quantitative** and others **categorical** predictors.



--- 



 If $X_j$ is a **quantitative** predictor


We have to consider the following matrix:

- $\mathcal{X}_1 = [\hspace{0.1cm} X_j \hspace{0.1cm}]$

- $\mathcal{X}_2 = [\hspace{0.1cm} X_1 , .. , X_{j-1}, X_{j+1},.., X_p \hspace{0.1cm}]$

- $\mathcal{X}_3 = [\hspace{0.1cm} X_1,..,X_j,.., X_p \hspace{0.1cm}] $



 
And the following Pearson correlation matrix:

- $R_1$ is the Pearson correlation matrix of $\mathcal{X}_1$ 

- $R_2$ is the Pearson correlation matrix of $\mathcal{X}_2$

- $R_3$ is the Pearson correlation matrix of $\mathcal{X}_3$

 





Then,  $\hspace{0.1cm} GVIF \hspace{0.1cm}$ of $\hspace{0.1cm} X_j \hspace{0.1cm}$ is defined as:



$$ GVIF(X_j) = det(R_1) \cdot \dfrac{det(R_2)}{det(R_3)} $$ 

 



----



If $X_j$ is a **categorical** predictor with $r$ categories, $\hspace{0.1cm} Range(X_j) = \lbrace 0,1,..., r-1 \rbrace \hspace{0.1cm}$ , that enter in the model with the dummy variables $\hspace{0.1cm} X_{j1},X_{j2},...,X_{j(r-1)}$




We have to consider the following matrix:

- $\mathcal{X}_1 = [\hspace{0.1cm} X_{j1},X_{j2},..,X_{j(r-1)} \hspace{0.1cm}]$

- $\mathcal{X}_2 = [\hspace{0.1cm} X_1 , .. , X_{j-1}, X_{j+1},.., X_p \hspace{0.1cm}]$

- $\mathcal{X}_3 = [\hspace{0.1cm} X_1,..,X_{j-1},X_{j1},X_{j2},..,X_{j(r-1)}, X_{j+1},.., X_p \hspace{0.1cm}] $





And the following Pearson correlation matrix:

- $R_1$ is the Pearson correlation matrix of $\mathcal{X}_1$ 

- $R_2$ is the Pearson correlation matrix of $\mathcal{X}_2$

- $R_3$ is the Pearson correlation matrix of $\mathcal{X}_3$





Then, $\hspace{0.05cm} GVIF \hspace{0.05cm}$ of $\hspace{0.05cm} X_j \hspace{0.05cm}$ is defined as:



$$ GVIF(X_j) = det(R_1) \cdot \dfrac{det(R_2)}{det(R_3)} $$ 

 



----



**Criteria:** Identification of multicollinearity with $GVIF$


In this criteria the key quantity is $\hspace{0.15cm} GVIF(X_j)^{1/2 df}$

Where: $\hspace{0.15cm}df\hspace{0.1cm}$ is the number of parameters that enter in the linear regression model when $\hspace{0.1cm} X_j\hspace{0.1cm}$ is added as predictor




If $X_j$ is a **quantitative** predictor $\hspace{0.1cm} ( \Rightarrow df=1)$  :



If $\hspace{0.15cm} GVIF(X_j)^{1/2} > \sqrt{10} = 3.16$  $\hspace{0.1cm}\Rightarrow\hspace{0.1cm}$ **High** multicollinearity

If $\hspace{0.15cm} GVIF(X_j)^{1/2}  \in [\sqrt{4}, \sqrt{10}]= [2 \hspace{0.1cm},\hspace{0.1cm} 3.16]$    $\hspace{0.1cm}  \Rightarrow\hspace{0.1cm}$ **Medium** multicollinearity


If  $\hspace{0.15cm} GVIF(X_j)^{1/2} < \sqrt{4} = 2$  $\hspace{0.1cm}\Rightarrow\hspace{0.1cm}$ **Low** multicollinearity



If $X_j$ is a **categorical** predictor with $2$ categories $\hspace{0.1cm} ( \Rightarrow df=2-1=1)$ :



If $\hspace{0.15cm} GVIF(X_j)^{1/2} > 10^{1/2} = 3.16 $  $\hspace{0.1cm}\Rightarrow\hspace{0.1cm}$ **High** multicollinearity

If $\hspace{0.15cm} GVIF(X_j)^{1/2}  \in [4^{1/2}, 10^{1/2}] = [2 \hspace{0.1cm} , \hspace{0.1cm}  3.16]$    $\hspace{0.1cm}  \Rightarrow\hspace{0.1cm}$ **Medium** multicollinearity


If  $\hspace{0.15cm} GVIF(X_j)^{1/2} < 4^{1/2} = 2$  $\hspace{0.1cm}\Rightarrow\hspace{0.1cm}$ **Low** multicollinearity



If $X_j$ is a **categorical** predictor with $3$ categories $\hspace{0.1cm} ( \Rightarrow df=3-1=2 )$ :



If $\hspace{0.15cm} GVIF(X_j)^{1/4} > 10^{1/4} = 1.78$  $\hspace{0.1cm}\Rightarrow\hspace{0.1cm}$ **High** multicollinearity

If $\hspace{0.15cm} GVIF(X_j)^{1/4}  \in [4^{1/4}, 10^{1/4}] = [1.41 \hspace{0.1cm} , \hspace{0.1cm}  1.78]$    $\hspace{0.1cm}  \Rightarrow\hspace{0.1cm}$ **Medium** multicollinearity


If  $\hspace{0.15cm} GVIF(X_j)^{1/4} < 4^{1/4} = 1.41$  $\hspace{0.1cm}\Rightarrow\hspace{0.1cm}$ **Low** multicollinearity



If $X_j$ is a **categorical** predictor with $4$ categories $(\hspace{0.1cm} \Rightarrow df=4-1=3 )$ :



If $\hspace{0.15cm} GVIF(X_j)^{1/6} > 10^{1/6} = 1.47$  $\hspace{0.1cm}\Rightarrow\hspace{0.1cm}$ **High** multicollinearity

If $\hspace{0.15cm} GVIF(X_j)^{1/6}  \in [4^{1/6}, 10^{1/6}] = [1.26 \hspace{0.1cm} , \hspace{0.1cm}  1.47]$    $\hspace{0.1cm}  \Rightarrow\hspace{0.1cm}$ **Medium** multicollinearity


If  $\hspace{0.15cm} GVIF(X_j)^{1/6} < 4^{1/6} = 1.26$  $\hspace{0.1cm}\Rightarrow\hspace{0.1cm}$ **Low** multicollinearity



If $X_j$ is a **categorical** predictor with $r$ categories $(\hspace{0.1cm} \Rightarrow df=r-1 )$ :



If $\hspace{0.15cm} GVIF(X_j)^{1/(2(r-1))} > 10^{1/(2(r-1))} $  $\hspace{0.1cm}\Rightarrow\hspace{0.1cm}$ **High** multicollinearity

If $\hspace{0.15cm} GVIF(X_j)^{1/(2(r-1))}  \in [4^{1/(2(r-1))}, 10^{1/(2(r-1))}]$    $\hspace{0.1cm}  \Rightarrow\hspace{0.1cm}$ **Medium** multicollinearity


If  $\hspace{0.15cm} GVIF(X_j)^{1/(2(r-1))} < 4^{1/(2(r-1))}$  $\hspace{0.1cm}\Rightarrow\hspace{0.1cm}$ **Low** multicollinearity



---



##### Identification of multicollinearity with $GVIF$ in `R`


```r
%%R 

library(car)
library(carData)

vif(lm(price ~ size_in_m_2  + longitude + latitude + no_of_bedrooms + no_of_bathrooms + quality , data=data_R))
```



---



##### Identification of multicollinearity with $GVIF$ in `Python`



$GVIF$ for the **categorical** predictor $quality$


```python
X = data_Python.loc[: , ['size_in_m_2',	'longitude', 'latitude', 'no_of_bedrooms', 'no_of_bathrooms', 'quality']]
```


```python
X1 = varcharProcessing(X).loc[:, ['quality_1', 'quality_2', 'quality_3']]
X2 = X.drop({'quality'}, axis=1)
X3 = varcharProcessing(X).drop({'intercept'}, axis=1)

GVIF_quality = np.linalg.det(X1.corr()) * np.linalg.det(X2.corr()) / np.linalg.det(X3.corr())

df_quality = X1.shape[1]

GVIF_quality_scaled = GVIF_quality**(1/(2*df_quality))
```



$GVIF$ for the rest of **quantitative** predictors


```python
X = data_Python.loc[: , ['size_in_m_2',	'longitude', 'latitude', 'no_of_bedrooms', 'no_of_bathrooms', 'quality']]
```


```python
X1 = X[['size_in_m_2']]  
X2 = X.drop(['size_in_m_2'], axis=1) 
X3 = X
 
GVIF_size_in_m_2 = np.linalg.det(X1.corr()) * np.linalg.det(X2.corr()) / np.linalg.det( X3.corr() )

df_size_in_m_2 = X1.shape[1]

GVIF_size_in_m_2_scaled = GVIF_size_in_m_2**(1/(2*df_size_in_m_2))
```


```python
X1 = X[['longitude']]  
X2 = X.drop(['longitude'], axis=1) 
X3 = X

 
GVIF_longitude = np.linalg.det(X1.corr()) * np.linalg.det(X2.corr()) / np.linalg.det( X3.corr() )

df_longitude = X1.shape[1]

GVIF_longitude_scaled = GVIF_longitude**(1/(2*df_longitude))
```


```python
X1 = X[['latitude']]  
X2 = X.drop(['latitude'], axis=1) 
X3 = X
 
GVIF_latitude = np.linalg.det(X1.corr()) * np.linalg.det(X2.corr()) / np.linalg.det(  X3.corr() )

df_latitude = X1.shape[1]

GVIF_latitude_scaled = GVIF_latitude**(1/(2*df_latitude))
```


```python
X1 = X[['no_of_bedrooms']]  
X2 = X.drop(['no_of_bedrooms'], axis=1) 
X3 = X

GVIF_no_of_bedrooms = np.linalg.det(X1.corr()) * np.linalg.det(X2.corr()) / np.linalg.det( X3.corr() )

df_no_of_bedrooms = X1.shape[1]

GVIF_no_of_bedrooms_scaled = GVIF_no_of_bedrooms**(1/(2*df_no_of_bedrooms))
```


```python
X1 = X[['no_of_bathrooms']]  
X2 = X.drop(['no_of_bathrooms'], axis=1) 
X3 = X

GVIF_no_of_bathrooms = np.linalg.det(X1.corr()) * np.linalg.det(X2.corr()) / np.linalg.det( X3.corr())

df_no_of_bathrooms = X1.shape[1]

GVIF_no_of_bathrooms_scaled = GVIF_no_of_bathrooms**(1/(2*df_no_of_bathrooms))
```


```python
a = X.columns

b = [GVIF_size_in_m_2, GVIF_longitude, GVIF_latitude, GVIF_no_of_bedrooms, GVIF_no_of_bathrooms, GVIF_quality]

c = [GVIF_size_in_m_2_scaled, GVIF_longitude_scaled, GVIF_latitude_scaled, GVIF_no_of_bedrooms_scaled, GVIF_no_of_bathrooms_scaled, GVIF_quality_scaled]

d = [df_size_in_m_2, df_longitude, df_latitude, df_no_of_bedrooms, df_no_of_bathrooms, df_quality]

GVIF_Python_df = pd.DataFrame({'predictor': a , 'GVIF': b , 'GVIF^(1/(2*df))': c , 'df': d})

GVIF_Python_df
```

In this case all the quantitative predictors have $\hspace{0.1cm} GVIF^{1/2df} < 3.16 \hspace{0.1cm}$, but $\hspace{0.1cm} GVIF^{1/2df} \hspace{0.1cm}$ of $\hspace{0.1cm}$ **no\_of\_bathrooms** $\hspace{0.1cm}$ is $\hspace{0.1cm} 2.14 > 2$ $\hspace{0.1cm} \Rightarrow \hspace{0.1cm} $  **medium** multicollinearity

On the other hand the 4-ary categorical predictor **quality** has $\hspace{0.1cm} GVIF^{1/2df}\hspace{0.1cm} = 1.01 < 1.26$ $\hspace{0.1cm} \Rightarrow \hspace{0.1cm} $  **low** multicollinearity

So using the GVIF method, we can conclude that there is a **medium** multicollinearity between the predictors of the model  $\hspace{0.1cm}$ **price ~ size\_in\_m\_2  + longitude + latitude + no\_of\_bedrooms + no\_of\_bathrooms** $\hspace{0.1cm}$



---



## Checking Error Assumptions <a class="anchor" id="68"></a>

- $\varepsilon_i \sim N(0,\sigma) \hspace{0.4cm} \forall \hspace{0.1cm} i=1,...,n $
  
- $corr(\varepsilon_i , \varepsilon_j)=0 \hspace{0.4cm} \forall \hspace{0.1cm} i\neq j =1,...,n $



### Checking Error Constant Variance <a class="anchor" id="69"></a>

It is not possible to check the assumption of constant variance just by examining
the residuals alone, some will be large and some will be small, but this proves nothing. We need to check whether the variance in the residuals is related to some
other quantity.

The most useful diagnostic is a plot of $\hat{\varepsilon}$ vs $\hat{y}$

Interpretation of the graph $\hat{\varepsilon}$ vs $\hat{y}$:

- If the dispersion of the points is uniform random $\Rightarrow$ There is no problem (evidence of constant variance of the error).

- If we can see a cone shape at the points $\Rightarrow$ Problem (evidence of error not constant variance)

<br>

This plot can also provide evidence of nonlinearity between the response variable and the predictors:

- If we can see a non-linear shape at the points $\Rightarrow$ evidence of non-linearity between the response variable and the predictors



---



##### Checking Error Constant Variance in `R`


```r
%%R

ggplot() +
geom_point(mapping = aes(x=model_R$fitted.values , y = estimated_errors ), color="blue")+
geom_hline(yintercept =0 , color="red")
```



---



##### Checking Error Constant Variance in `Python`


```python
from plotnine import ggplot, aes, geom_line, geom_point, geom_smooth, geom_histogram, geom_bar, geom_boxplot, scale_y_continuous, scale_x_continuous, scale_x_discrete, scale_y_discrete, labs, after_stat,  geom_vline, scale_color_manual, theme_gray, theme_xkcd, scale_color_identity, geom_hline, facet_wrap, scale_fill_discrete, scale_fill_manual,  scale_fill_hue, guides, guide_legend, geom_hline, stat_function 
```


```python
(
ggplot()
+ geom_point(mapping = aes(x=predictions , y = df_predictions_Python['estimated_errors'] ), color="green")
+ geom_hline(yintercept =0 , color="red")
+ labs(x='response predictions' , y='estimated errors')
)
```

Since we can see a cone shape at the points, we cannot accept the constant error variance assumption $Var(\varepsilon)=\sigma^2$.



----



### Checking Null Error Mean <a class="anchor" id="70"></a>

We are going to use the typical t-test to verify this assumption.

First we compute the  estimated errors mean to get first idea:


```python
df_predictions_Python['estimated_errors'].mean()
```



---



##### Checking Null Error Mean in `R`


```r
%%R

t.test(x=estimated_errors , mu=0)
```



---



##### Checking Null Error Mean in `Python`


```python
# pip install --upgrade pingouin
```


```python
import pingouin as pg

pg.ttest(x= df_predictions_Python['estimated_errors'] , y=0)
```



For any significance level we can accept that the errors mean is zero (0)



---



### Checking Error Normality <a class="anchor" id="71"></a>

First we are going to check the error normality assumption using the **histogram method**:



#### Checking Error Normality in `R` with histogram method


```r
%%R

ggplot(data = as.data.frame(estimated_errors) ,
 mapping = aes(x = estimated_errors)) +
 geom_histogram(aes(y =..density..), color="black", fill="orange",
 position = 'identity') +
 stat_function( fun = dnorm , 
 args = list(mean = mean(estimated_errors), sd = sd(estimated_errors)),
 lwd = 1.2,  col = 'blue'
 )
```



---



#### Checking Error Normality in `Python` with histogram method


```python
import scipy.stats as stats
(
ggplot(data = df_predictions_Python ,
 mapping = aes(x = df_predictions_Python['estimated_errors'])) 
+ geom_histogram(aes(y = after_stat('density')), color="black", fill="pink", position = 'identity', bins=35) 
+ stat_function( fun = stats.norm.pdf , args = dict( loc=mean(df_predictions_Python['estimated_errors']), scale=sd(df_predictions_Python['estimated_errors'])) , color='blue', size=1 )
)
```



---



Now we are going to check the error normality assumption using the Shapiro statistical test:

#### Checking Error Normality in `R` with Shapiro test


```r
%%R

shapiro.test(estimated_errors)
```



----



#### Checking Error Normality in `Python`  with Shapiro test


```python
shapiro_test = stats.shapiro(df_predictions_Python['estimated_errors'])
shapiro_test
```



For any significance level we have to reject the errors normality hypothesis.



----



### Checking Null Error Correlation <a class="anchor" id="72"></a>

We are going to check the null error correlation assumption through  the **Durban-Watson test**.




##### Hypothesis:

$$H_0: \hspace{0.1cm} corr\left(\hat{\varepsilon}_{(1)},\hat{\varepsilon}_{(2)}\right) = 0 $$ 

$$H_1: \hspace{0.1cm} corr\left(\hat{\varepsilon}_{(1)},\hat{\varepsilon}_{(2)}\right) \neq 0$$


Where:

$$\hat{\varepsilon}_{(1)} = (\hat{\varepsilon}_1 , \hat{\varepsilon}_2 ,..., \hat{\varepsilon}_{n-1})$$

$$\hat{\varepsilon}_{(2)} = (\hat{\varepsilon}_2  ,...,\hat{\varepsilon}_{n-1}, \hat{\varepsilon}_{n})$$



##### Test Statistic :

\begin{gather*}
DW = \dfrac{\sum_{i=2}^n (\hat{\varepsilon}_i - \hat{\varepsilon}_{i-1})^2 }{\sum_{i=2}^n \hat{\varepsilon}_{i}^2 } = \dfrac{sum\left( \hspace{0.1cm}( \hat{\varepsilon}_{(2)} - \hat{\varepsilon}_{(1)})^2 \hspace{0.1cm} \right)}{sum\left( \hspace{0.1cm} (\hat{\varepsilon}_{(2)})^2 \hspace{0.1cm} \right)}
\end{gather*}




The test statistic is approximately equal to $\hspace{0.1cm} 2\cdot (1-r) \hspace{0.1cm}$ where $r$ is the sample autocorrelation of the residuals. Thus, the test statistic will always be between $0$ and $4$ with the following interpretation:

A test statistic of $2$ indicates **no serial correlation**.

The closer the test statistics is to $0$, the more evidence of **positive serial correlation**.

The closer the test statistics is to $4$, the more evidence of **negative serial correlation**.



---



##### Durban-Watson test in `R`


```r
%%R

estimated_errors_1 = estimated_errors[-1]
estimated_errors_2 = estimated_errors[-length(estimated_errors)]

ggplot() +
geom_point(mapping = aes(x=estimated_errors_1 , y = estimated_errors_2 ), color="blue")
```




```r
%%R
library(zoo)
library(lmtest)

dwtest(price ~ size_in_m_2  + longitude + latitude + no_of_bedrooms + no_of_bathrooms + quality , data=data_R, alternative = 'two.sided' )
```



-----



##### Durban-Watson test in `Python`


```python
train_errors_1 = pd.DataFrame({ 'train_errors_1': df_predictions_Python.iloc[range(1, len(df_predictions_Python)) , 2 ] } )
train_errors_2 = pd.DataFrame({ 'train_errors_1': df_predictions_Python.iloc[range(0, len(df_predictions_Python)-1) , 2 ] } )  

train_errors_2['index']=range(1,len(train_errors_2)+1)
train_errors_2 = train_errors_2.set_index('index')

(
ggplot() 
+ geom_point(mapping = aes(x=train_errors_1 , y = train_errors_2 ), color="green")
+ labs(x='estimated errors 1' , y='estimated errors 2')
)
```




```python
import statsmodels

statsmodels.stats.stattools.durbin_watson(df_predictions_Python['estimated_errors'], axis=0)
```



Another alternative in Python that gives us the p-value:


```python
# pip install dwtest
```

More information about this Python package here https://github.com/JackywithaWhiteDog/dwtest


```python
from dwtest import dwtest
```


```python
statistic, pvalue = dwtest( 'price ~ size_in_m_2  + longitude + latitude + no_of_bedrooms + no_of_bathrooms'  , data_Python)
```


```python
statistic, pvalue
```



For any $\alpha$ we reject the null  error correlation hypothesis.



----

## Checking Linear Assumption <a class="anchor" id="73"></a>

The linear regression model assumes that there is a linear relationship between the response and the predictors.

If the actually existing relationship is not linear, then all the conclusions we draw from the linear model are questionable.

How to identify nonlinearity?

Make a plot of the estimated errors (residuals) against the predictions of the response (all with the train data).

It is the same plot as the one used to diagnose heteroscedasticity of the residuals (non-constant variance of the residuals). If a non-linear relationship is observed in the graph, it indicates non-linearity between the predictors and the response.

They can also help detect nonlinearity in the relationship between response and predictors by plotting the response versus predictors (one-to-one).

Solutions:

A logarithmic transformation of the response variable could help. But the best option is to use a nonlinear (or nonparametric) regression method.



Scatter Plots: response vs predictors (one-to-one)


```python
(
ggplot(aes(x = 'size_in_m_2' , y = 'price') , data_Python) 

 + geom_point(fill="white", color = 'red') 
 + geom_smooth(method='lm', color = 'blue')
 + labs(x = "size_in_m_2", y = "price")
 + scale_x_continuous( breaks = range(int(data_Python['size_in_m_2'].min()) , int(data_Python['size_in_m_2'].max()) , 50) ) 
 + scale_y_continuous( breaks = range(int(data_Python['price'].min()) , int(data_Python['price'].max()) , 2000000) )
)
```


```python
(
ggplot(aes(x = 'longitude' , y = 'price') , data_Python) 

 + geom_point(fill="white", color = 'red') 
 + geom_smooth(method='lm', color = 'blue')
 + labs(x = "longitude", y = "price")
 + scale_x_continuous( breaks = np.arange (data_Python['longitude'].min() , data_Python['longitude'].max() , 0.05) )
 + scale_y_continuous( breaks = range(int(data_Python['price'].min()) , int(data_Python['price'].max()) , 2000000) )
)
```


```python
(
ggplot(aes(x = 'latitude' , y = 'price') , data_Python) 

 + geom_point(fill="white", color = 'red') 
 + geom_smooth(method='lm', color = 'blue')
 + labs(x = "latitude", y = "price")
 + scale_x_continuous( breaks =  np.arange (data_Python['latitude'].min() , data_Python['latitude'].max() , 0.05)  ) 
 + scale_y_continuous( breaks = range(int(data_Python['price'].min()) , int(data_Python['price'].max()) , 2000000) )
)
```


```python
(
ggplot(aes(x = 'no_of_bedrooms' , y = 'price') , data_Python) 

 + geom_point(fill="white", color = 'red') 
 + geom_smooth(method='lm', color = 'blue')
 + labs(x = "no_of_bedrooms", y = "price")
 + scale_x_continuous( breaks =  np.arange (data_Python['no_of_bedrooms'].min() , data_Python['no_of_bedrooms'].max()+1 , 1)  ) 
 + scale_y_continuous( breaks = range(int(data_Python['price'].min()) , int(data_Python['price'].max()) , 2000000) )
)
```


```python
(
ggplot(aes(x = 'no_of_bathrooms' , y = 'price') , data_Python) 

 + geom_point(fill="white", color = 'red') 
 + geom_smooth(method='lm', color = 'blue')
 + labs(x = "no_of_bathrooms", y = "price")
 + scale_x_continuous( breaks =  np.arange (data_Python['no_of_bathrooms'].min() , data_Python['no_of_bathrooms'].max()+1 , 1)  ) 
 + scale_y_continuous( breaks = range(int(data_Python['price'].min()) , int(data_Python['price'].max()) , 2000000) )
)
```


```python
data_Python['quality'] = data_Python['quality'].astype('int')
```


```python
(
ggplot(aes(x = 'quality' , y = 'price') , data_Python) 

 + geom_point(fill="white", color = 'red') 
 + geom_smooth(method='lm', color = 'blue')
 + labs(x = "quality", y = "price")
 + scale_x_continuous( breaks = np.arange (data_Python['quality'].min() , data_Python['quality'].max()+1 , 1) ) 
 + scale_y_continuous( breaks = range(int(data_Python['price'].min()) , int(data_Python['price'].max()) , 2000000) )
)
```





----



## Finding Outliers <a class="anchor" id="74"></a>

An outlier is a point that clearly deviates from the relationship between the response and the predictors.

Outliers can greatly affect the estimates of model parameters.

How to identify outliers?

A simple option is with the standardized  residuals, given by:



$$ \tilde{\varepsilon_i} = \dfrac{\hat{\varepsilon}_i}{\sqrt{\widehat{Var}(\hat{\varepsilon}_i)}} = \dfrac{\hat{\varepsilon}_i}{ \sqrt{ \widehat{\sigma}^2 \cdot (1-h_{ii})} }  $$



Where:

$\hspace{0.1cm} h_{ii} \hspace{0.1cm}$ is the $i$-th element of the principal diagonal of $\hspace{0.1cm} H=X \cdot (X^t \cdot X)^{-1} \cdot X^t \hspace{0.1cm}$

Note that:

$$\widehat{Var}(\hat{\varepsilon}_i) \neq \widehat{Var}(\varepsilon_i)  $$

Because  $\varepsilon_i$ is a random variable such that $\hspace{0.1cm}\varepsilon_i \sim N (0\hspace{
0.1cm},\hspace{0.1cm} \sigma^2) \hspace{0.1cm}$ (by initial hypothesis of the model)

And $\hspace{0.1cm} \hat{\varepsilon}_i = y_i - \hat{y}_i \hspace{0.1cm}$ is another random variable such that  $\hspace{0.1cm} \hat{\varepsilon}_i \sim N(0\hspace{0.1cm},\hspace{0.1cm}\sigma^2 \cdot (1-h_{ii})) \hspace{0.1cm}$  (can be proof) 


Criteria:

Observations whose studentized residuals are greater than 3 (in absolute value) will be considered outliers.

What to do with outliers:

If they are the result of an error in data collection, they can be deleted. If not, it shouldn't, since it is part of the reality reflected by the sample, and is therefore relevant information.




```python
H = np.dot(X @ np.linalg.inv( X.T @ X ) , X.T) 

standardized_estimated_errors = estimated_errors / np.sqrt(estimated_variance_error*(1-np.diag(H)) )
```


```python
Outliers_df = pd.DataFrame({'standardized_estimated_errors > 3' : standardized_estimated_errors > 3})
```


```python
Outliers_df.head()
```


```python
Outliers = Outliers_df.loc[ Outliers_df['standardized_estimated_errors > 3'] == True , : ].index
```


```python
Outliers
```





----



## Bibliography

Benitez Peña, S. (2021). *El modelo de regresión lineal múltiple* [Presentación de PowerPoint]. Aula Global UC3M.

Benitez Peña, S. (2021). *Inferencia en el modelo de regresión lineal múltiple* [Presentación de PowerPoint]. Aula Global UC3M.

Benitez Peña, S. (2021). *Diagnosis y validacion del modelo de regresión lineal múltiple* [Presentación de PowerPoint]. Aula Global UC3M.

Galeano, P. (2022). *Regresion Lineal Múltiple* [Presentación de PowerPoint]. Aula Global UC3M.

Fox, J. (2022). *Diagnosing Collinearity* [Presentación de PowerPoint]. McMaster University

Faraway, J (2015). *Linear Models with R* (second edition). CRC Press.
