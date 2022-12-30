---
title: 'Model Selection in Linear Regression'
author: 'Fabio Scielzo Ortiz'
date: '10/1/23'
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

 

# Data-set <a class="anchor" id="1"></a>

The description of the data-set that we are going to use could be found in the following article:

https://fabioscielzoortiz.github.io/Estadistica4all.github.io/Articulos/Linear%20Regression%20in%20Python%20and%20R.html


<br>

## Loading the data-set in `Python` <a class="anchor" id="2"></a>


```python
import pandas as pd
import numpy as np

import warnings
warnings.filterwarnings('ignore')
```


```python
data_Python = pd.read_csv('data_Python_copy.csv')
```


```python
data_Python
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
      <th>price</th>
      <th>size_in_m_2</th>
      <th>longitude</th>
      <th>latitude</th>
      <th>no_of_bedrooms</th>
      <th>no_of_bathrooms</th>
      <th>quality</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>2700000</td>
      <td>100.242337</td>
      <td>55.138932</td>
      <td>25.113208</td>
      <td>1</td>
      <td>2</td>
      <td>1</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2850000</td>
      <td>146.972546</td>
      <td>55.151201</td>
      <td>25.106809</td>
      <td>2</td>
      <td>2</td>
      <td>1</td>
    </tr>
    <tr>
      <th>2</th>
      <td>1150000</td>
      <td>181.253753</td>
      <td>55.137728</td>
      <td>25.063302</td>
      <td>3</td>
      <td>5</td>
      <td>1</td>
    </tr>
    <tr>
      <th>3</th>
      <td>2850000</td>
      <td>187.664060</td>
      <td>55.341761</td>
      <td>25.227295</td>
      <td>2</td>
      <td>3</td>
      <td>0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>1729200</td>
      <td>47.101821</td>
      <td>55.139764</td>
      <td>25.114275</td>
      <td>0</td>
      <td>1</td>
      <td>1</td>
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
    </tr>
    <tr>
      <th>1900</th>
      <td>1500000</td>
      <td>100.985561</td>
      <td>55.310712</td>
      <td>25.176892</td>
      <td>2</td>
      <td>2</td>
      <td>3</td>
    </tr>
    <tr>
      <th>1901</th>
      <td>1230000</td>
      <td>70.606280</td>
      <td>55.276684</td>
      <td>25.166145</td>
      <td>1</td>
      <td>2</td>
      <td>1</td>
    </tr>
    <tr>
      <th>1902</th>
      <td>2900000</td>
      <td>179.302790</td>
      <td>55.345056</td>
      <td>25.206500</td>
      <td>3</td>
      <td>5</td>
      <td>1</td>
    </tr>
    <tr>
      <th>1903</th>
      <td>675000</td>
      <td>68.748220</td>
      <td>55.229844</td>
      <td>25.073858</td>
      <td>1</td>
      <td>2</td>
      <td>1</td>
    </tr>
    <tr>
      <th>1904</th>
      <td>760887</td>
      <td>74.322400</td>
      <td>55.154713</td>
      <td>25.079130</td>
      <td>1</td>
      <td>2</td>
      <td>2</td>
    </tr>
  </tbody>
</table>
<p>1905 rows × 7 columns</p>
</div>




```python
data_Python.dtypes
```




    price                int64
    size_in_m_2        float64
    longitude          float64
    latitude           float64
    no_of_bedrooms       int64
    no_of_bathrooms      int64
    quality              int64
    dtype: object






Converting $quality$ variable to categorical:


```python
data_Python['quality'] = data_Python['quality'].astype('category')
```



<br>

## Loading the data-set in `R` <a class="anchor" id="3"></a>


```python
import rpy2

%load_ext rpy2.ipython

import rpy2.robjects as robjects
```


```r
%%R 

library(tidyverse)

data_R = read_csv('data_Python_copy.csv')
```

    



Converting $quality$ variable to categorical:


```r
%%R
data_R$quality <- as.factor(data_R$quality)
```




```r
%%R

data_R[1:7, ]
```

    # A tibble: 7 x 7
        price size_in_m_2 longitude latitude no_of_bedrooms no_of_bathrooms quality
        <dbl>       <dbl>     <dbl>    <dbl>          <dbl>           <dbl> <fct>  
    1 2700000       100.       55.1     25.1              1               2 1      
    2 2850000       147.       55.2     25.1              2               2 1      
    3 1150000       181.       55.1     25.1              3               5 1      
    4 2850000       188.       55.3     25.2              2               3 0      
    5 1729200        47.1      55.1     25.1              0               1 1      
    6 3119900        94.3      55.1     25.1              1               2 1      
    7 8503600       192.       55.1     25.1              2               3 2      

    
<br>


# The Curse of Dimensionality

- If the true relationship between the response $Y$ and the predictors $X_1,...,X_p$ is approximately linear, the predictions obtained with the linear regression model (estimated by OLS) will have a small bias. But if the true relationship is not linear, the bias will be large.


Suppose we are in the best case and the true relationship between response and predictors is approximately linear:

- If $\hspace{0.15cm}n\hspace{0.15cm}$ is notably larger than $\hspace{0.15cm}p\hspace{0.15cm}$ $\hspace{0.15cm}(n >> p) \hspace{0.15cm}$ $\Rightarrow\hspace{0.15cm}$ the predictions obtained with the linear regression model will have little variance (in addition to little bias, due to the starting hypothesis), so the model will work well with the test sample, that is, it will have a good test error (comparatively low test error). $\\[0.5cm]$


- If $\hspace{0.15cm}n \approx p\hspace{0.15cm}$ $\Rightarrow\hspace{0.15cm}$ the predictions obtained with the linear regression model will have a lot of variance (although they have little bias), for that the model will perform poorly on the test sample, i.e. will have a bad test error (comparatively high test error). $\\[0.5cm]$

- If $\hspace{0.15cm} n < p$ $\hspace{0.15cm}\Rightarrow\hspace{0.15cm}$ the linear regression model (estimated by OLS) cannot even be estimated, there is no unique estimation of the beta coefficients. This fact is known as the **curse of dimensionality**.

 <br>



>We need methods that allow us to obtain linear regression models with a number of predictors **less** than $\hspace{0.15cm}p\hspace{0.15cm}$ but that are nevertheless equal to or better than the predictive level linear regression model with the $\hspace{0.15cm}p\hspace{0.15cm}$ predictors.


<br>

## Demonstration of the "Curse of Dimensionality"

Suppose $\hspace{0.12cm} p>n\hspace{0.12cm}$ , then it is obvious $\hspace{0.12cm} p +1 >n\hspace{0.12cm}$


We know that
$X=(1,X_1,...,X_p)\hspace{0.12cm}$ is of size $\hspace{0.12cm}n$x$(p+1)\hspace{0.12cm}$, so
$\hspace{0.12cm}X^t \cdot X\hspace{0.12cm}$ is of size $\hspace{0.12cm}(p+1)$x$(p+1)$

And since $\hspace{0.12cm}p+1 > n\hspace{0.12cm}$ , then $\hspace{0.12cm}Max\hspace{0.12cm}Rg(X) = n \\[0.5cm]$



Suppose $\hspace{0.12cm}Rg(X) = r \leq n \hspace{0.12cm}$,
then by the **nullity rank theorem** we have that $\hspace{0.12cm}Rg(X^t \cdot X)= r$

Since $\hspace{0.12cm}X^t \cdot X\hspace{0.12cm}$ is $\hspace{0.12cm}(p+1)x(p+1)\hspace{0.12cm}\hspace{0.12 cm}$
then $\hspace{0.12cm}Max\hspace{0.12cm}Rg(X^t \cdot X) = p+1$

And since $\hspace{0.12cm}Rg(X^t \cdot X)=r \leq n < p+1\hspace{0.12cm}$
so $\hspace{0.12cm}X^t \cdot X\hspace{0.12cm}$ **has no maximum range**

Therefore, the inverse of $\hspace{0.12cm}X^t \cdot X\hspace{0.12cm}$ does not exist, that is, there is no $\hspace{0.12cm}(X^t \cdot X )^{ -1}$

Therefore **does not exist** $\hspace{0.12cm}\widehat{\beta} = (X^t \cdot X)^{-1} \cdot X^t \cdot Y\hspace{0.12cm}$ since there is no $\hspace{0.12cm}(X^t \cdot X )^{-1}$


<br>


# F-test: test to compare models <a class="anchor" id="4"></a>


The ANOVA and significance test are a particular case of a more general test that is useful to compere linear regression models, but always under the assumptions of the model.




-   We have a linear regression model with $\hspace{0.1cm} k \hspace{0.1cm}$ coefficients (betas)  $\hspace{0.1cm} \Rightarrow \hspace{0.1cm} \Omega_k$

     -  $\Omega_k \ : \  \ y_i = \beta_0 + \beta_1\cdot x_{i1} +...+ \beta_{k-1}\cdot x_{i(k-1)} + \varepsilon_i \\[0.5cm]$



-   We have another linear regression model with only
    $\hspace{0.1cm} q<k \hspace{0.1cm}$ coefficients (betas) of $\Omega_p$ $\hspace{0.1cm} \Rightarrow \hspace{0.1cm}  \omega_q$

     -  $\omega_q \ : \  \ y_i = \beta_0 + \beta_1\cdot x_{i1} +...+ \beta_{q-1}\cdot x_{i(q-1)} + \varepsilon_i \\[0.2cm]$ 



-   $\omega_q$ is a sub-model of $\Omega_k$ , we can denote this as
    $\hspace{0.1cm} \omega_q \subset \Omega_k$
    

<br>


The hypothesis test we want to carry out is the following:

<br>

\begin{gather*}
H_0: \hspace{0.15cm} \omega_q  \\
H_1: \hspace{0.15cm} \Omega_k
\end{gather*}



Where :

- $\hspace{0.2cm} \omega_q \subset \Omega_p \\[0.2cm]$

- $\hspace{0.2cm}$ Reject $H_0$ means  $\hspace{0.1cm} \Omega_k\hspace{0.1cm}$ is a "better" model than $\hspace{0.1cm} \omega_q \\[0.2cm]$

- $\hspace{0.2cm}$ Not Reject $H_0$ means $\hspace{0.1cm} \Omega_k \hspace{0.1cm}$ isn't a "better" model than $\hspace{0.1cm} \omega_q$

<br>



Now we have to determinate a rule to reject $\hspace{0.1cm}H_0\hspace{0.1cm}$ in favor of $\hspace{0.1cm}H_1\hspace{0.1cm}$ or not

A first approach is the following:

Let :

$$
RSS_{\Omega_k} =  \sum_{i=1}^n ( \hat{\varepsilon}_{\Omega_k \hspace{0.05cm},\hspace{0.05cm} i} )^2 =  \sum_{i=1}^n \left( y_i - \hat{y}_{\hspace{0.01cm} \Omega_k \hspace{0.05cm},\hspace{0.02cm} i}\right)^2   \\[0.2cm]
$$

$$
RSS_{\omega_q} =  \sum_{i=1}^n ( \hat{\varepsilon}_{\omega_q \hspace{0.05cm},\hspace{0.05cm} i} )^2 =  \sum_{i=1}^n \left( y_i - \hat{y}_{\omega_q \hspace{0.05cm},\hspace{0.02cm} i}\right)^2
$$

<br>

-   If $\hspace{0.15cm} RSS_{\omega_q} - RSS_{\Omega_k} \hspace{0.15cm}$ is **small**, then the (train)
    predictions of the **smaller model** $(\omega_q)$ are almost as good as the **larger
    model** $(\Omega_k)$, so we would prefer the smaller model on the grounds of simplicity. $\\[0.8cm]$

 

-   If $\hspace{0.1cm} RSS_{\omega_q} - RSS_{\Omega_k} \hspace{0.1cm}$ is **large**, then the (train)
    predictions  of the **smaller model** $(\omega_q)$  are much worse than the **larger
    model** $(\Omega_k)$, so we would prefer the larger model.$\\[0.35cm]$

<br>

That suggest that something like

$$
\dfrac{RSS_{\omega_q} - RSS_{\Omega_k}}{RSS_{\Omega_k}}
$$

would be a potentially good test statistic, where the denominator is used for scaling purposes.







<br>

## Statistic Test

Finally we can get  an statistic test based on the previous
expression, called **F-statistic**:

<br>

$$
F=\dfrac{(RSS_{\omega_q} - RSS_{\Omega_k})/(k-q)}{RSS_{\Omega_k}/(n-k)} \sim F_{\hspace{0.05cm} k-q \hspace{0.05cm},\hspace{0.05cm} n-k}
$$


<br>


If $\hspace{0.15cm} df_{\Omega_k} = n-k \hspace{0.15cm}$ and $\hspace{0.15cm} df_{\omega_q} = n-q \hspace{0.15cm}$ , then :


<br>

$$
F=\dfrac{(RSS_{\omega_q} - RSS_{\Omega_k})/(df_{\omega_q} - df_{\Omega_k})}{RSS_{\Omega_k}/df_{\Omega_k}} \sim F_{\hspace{0.05cm} (df_{\omega_q} - df_{\Omega_k}) \hspace{0.05cm},\hspace{0.05cm} df_{\Omega_k}}
$$

<br>


Where:

$k\hspace{0.15cm}$ is the number of coefficients (betas) of the model $\hspace{0.15cm}\Omega_k$

$q\hspace{0.15cm}$ is the number of coefficients (betas) of the model $\hspace{0.15cm}\omega_q$


The beauty of this approach is you only need to know the general form.
In any particular case, you just need to figure out which model
represent the null and alternative hypothesis, fit them and compute the test statistic.






<br>

## F-test in `Python` <a class="anchor" id="5"></a>




```python
import statsmodels.formula.api as smf

from statsmodels.stats.anova import anova_lm

from statsmodels.formula.api import ols
```


```python
M1_py = smf.ols(formula = 'price ~ size_in_m_2*quality  + no_of_bedrooms + no_of_bathrooms + latitude + longitude', 
                 data =data_Python).fit()

M2_py = smf.ols(formula = 'price ~ size_in_m_2 + no_of_bedrooms + no_of_bathrooms + quality + latitude + longitude ', 
                 data =data_Python).fit()

M3_py = smf.ols(formula = 'price ~ size_in_m_2 + no_of_bedrooms + no_of_bathrooms + latitude + longitude', 
                 data =data_Python).fit()

M4_py = smf.ols(formula = 'price ~ size_in_m_2 + no_of_bedrooms + no_of_bathrooms', 
                 data =data_Python).fit()

M5_py = smf.ols(formula = 'price ~ size_in_m_2', 
                 data =data_Python).fit()
```

$M1$:$\hspace{0.15cm}$ price ~ size_in_m_2*quality  + no_of_bedrooms + no_of_bathrooms + latitude + longitude

$M2$:$\hspace{0.15cm}$  price ~ size_in_m_2 + no_of_bedrooms + no_of_bathrooms + quality + latitude + longitude 

$M3$:$\hspace{0.15cm}$  price ~ size_in_m_2 + no_of_bedrooms + no_of_bathrooms + latitude + longitude

$M4$:$\hspace{0.15cm}$  price ~ size_in_m_2 + no_of_bedrooms + no_of_bathrooms

$M5$:$\hspace{0.15cm}$  price ~ size_in_m_2



Note that:

$$
M5 \subset M4 \subset M3 \subset M2 \subset M1
$$


<br>

We are going to use the function `anova_lm` to carry out the F-test in `Python`

The usage of anova_lm is pretty simple:

> anova_lm(Model $H_0$ , Model $H_1$)

$\hspace{0.35cm}$ Where : $\hspace{0.25cm}$ Model $H_0$ $\subset$ Model $H_1$

<br>

Remember that the hypothesis test that we want to do is: 

$$
H_0: \hspace{0.15cm} \omega_q \hspace{0.2cm} (Model \hspace{0.1cm} H_0) \\ 
H_1: \hspace{0.15cm} \Omega_k \hspace{0.2cm} (Model \hspace{0.1cm} H_1)
$$


<br>

For example, to carry out the hypothesis test

$$
H_0: \hspace{0.15cm} M2\_py  \hspace{0.15cm} (\omega_q)  \\ 
H_1: \hspace{0.15cm} M1\_py  \hspace{0.15cm} (\Omega_q)
$$

where $\hspace{0.15cm}M2\_py\hspace{0.15cm}$ is the **smallest** model and $\hspace{0.15cm}M1\_py\hspace{0.15cm}$ the **largest**, we use the following code:

<br>

```python
anova_lm(M2_py, M1_py)
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
      <th>df_resid</th>
      <th>ssr</th>
      <th>df_diff</th>
      <th>ss_diff</th>
      <th>F</th>
      <th>Pr(&gt;F)</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1896.0</td>
      <td>4.882082e+15</td>
      <td>0.0</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>1</th>
      <td>1893.0</td>
      <td>4.694567e+15</td>
      <td>3.0</td>
      <td>1.875147e+14</td>
      <td>25.203983</td>
      <td>5.483226e-16</td>
    </tr>
  </tbody>
</table>
</div>



<br>

For example, this output gives to us the following information:

<br>

$$
F=\dfrac{(RSS_{M2\_{py}} - RSS_{M1\_py})/(df_{\omega_q} - df_{\Omega_k})}{RSS_{M1\_{py}}/ df_{\Omega_k}} = 25.203983
$$ 

<br>

And the p-value of the test is:

<br>

$$
P(F_{\hspace{0.05cm} (df_{\omega_q} - df_{\Omega_k}) \hspace{0.05cm},\hspace{0.05cm} df_{\Omega_k}} > 25.203983) = 5.483226e-16
$$

<br>

So, the conclusion for any $\hspace{0.15cm} \alpha > 5.483226e-16 \hspace{0.15cm}$ is **reject** $\hspace{0.15cm} H_0: M2\_py\hspace{0.15cm}$ in favor of $\hspace{0.15cm} H_1: M1\_py \hspace{0.15cm}$, so we can accept that $\hspace{0.1cm} M1\_py \hspace{0.1cm}$ is a **better** model than $\hspace{0.1cm} M2\_py \hspace{0.1cm}$

<br>

Let's to check that ;

First of all, note that the number of betas of model $\hspace{0.15cm}M1\_py\hspace{0.15cm}$ is $\hspace{0.15cm}k=12\hspace{0.15cm}$ (because *quality* has four categories and there are an interaction between *quality* and *size\_in\_m\_2* , and for $\hspace{0.15cm}M2\_py\hspace{0.15cm}$ is $\hspace{0.15cm}q=9$

This can be easily seen in the following outputs given by `print(M1_py.summary())` and `print(M2_py.summary())`

<br>

In the other hand: 

$df_{M1\_py} = n - k = 1905 - 12 = 1893 =\hspace{0.15cm}$ `anova_lm(M2_py, M1_py).df_resid[1]`

$df_{M2\_py} = n - q = 1905 - 9 = 1896 =\hspace{0.15cm}$ `anova_lm(M2_py, M1_py).df_resid[0]`

$RSS_{M1\_py} =\hspace{0.15cm}$ `anova_lm(M2_py, M1_py).ssr[1]` $\hspace{0.15cm}= 4.694567e+15$	 

$RSS_{M2\_py} =\hspace{0.15cm}$ `anova_lm(M2_py, M1_py).ssr[0]` $\hspace{0.15cm}= 4.882082e+15$	



<br>

The following step is to compute the F-statistic  using the above information :


```python
numerator = ( anova_lm(M2_py, M1_py).ssr[0] - anova_lm(M2_py, M1_py).ssr[1] ) / ( anova_lm(M2_py, M1_py).df_resid[0] - anova_lm(M2_py, M1_py).df_resid[1] )

denominator = anova_lm(M2_py, M1_py).ssr[1] / anova_lm(M2_py, M1_py).df_resid[1]

F = numerator / denominator
```


```python
F
```

    25.203983015834208


<br>

Other way to compute it using `scipy`

```python
import scipy
```


```python
from scipy.stats import f, norm
```


```python
pvalor = 1 - scipy.stats.f.cdf(F, anova_lm(M2_py, M1_py).df_resid[0] - anova_lm(M2_py, M1_py).df_resid[1] , anova_lm(M2_py, M1_py).df_resid[1]  )
```


```python
pvalor
```

    5.551115123125783e-16




<br>


```python
anova_lm(M3_py, M2_py)
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
      <th>df_resid</th>
      <th>ssr</th>
      <th>df_diff</th>
      <th>ss_diff</th>
      <th>F</th>
      <th>Pr(&gt;F)</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1899.0</td>
      <td>4.898667e+15</td>
      <td>0.0</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>1</th>
      <td>1896.0</td>
      <td>4.882082e+15</td>
      <td>3.0</td>
      <td>1.658498e+13</td>
      <td>2.146975</td>
      <td>0.092395</td>
    </tr>
  </tbody>
</table>
</div>


<br>

This output gives to us the following information:

<br>

$$
F=\dfrac{(RSS_{M2\_{py}} - RSS_{M1\_py})/(df_{\omega_q} - df_{\Omega_k})}{RSS_{M1\_{py}}/ df_{\Omega_k}} = 2.146975
$$ 

<br>

And the p-value of the test is:

<br>

$$
P(F_{\hspace{0.05cm} (df_{\omega_q} - df_{\Omega_k}) \hspace{0.05cm},\hspace{0.05cm} df_{\Omega_k}} > 25.203983) = 0.092395
$$

<br>

So, the conclusion for the habitual $\hspace{0.1cm}\alpha = 0.01 \hspace{0.1cm}or\hspace{0.1cm} 0.05\hspace{0.1cm}$
 , is **not reject** $\hspace{0.1cm} H_0: M3\_py\hspace{0.1cm}$ in favor of $\hspace{0.1cm}H_1: M2\_py\hspace{0.1cm}$, so we can accept that $\hspace{0.1cm} M3\_py \hspace{0.1cm}$ is a **better** model than $\hspace{0.1cm} M2\_py \hspace{0.1cm}$


<br>


```python
anova_lm(M4_py, M3_py)
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
      <th>df_resid</th>
      <th>ssr</th>
      <th>df_diff</th>
      <th>ss_diff</th>
      <th>F</th>
      <th>Pr(&gt;F)</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1901.0</td>
      <td>5.080302e+15</td>
      <td>0.0</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>1</th>
      <td>1899.0</td>
      <td>4.898667e+15</td>
      <td>2.0</td>
      <td>1.816345e+14</td>
      <td>35.205892</td>
      <td>9.703235e-16</td>
    </tr>
  </tbody>
</table>
</div>

<br>

This output gives to us the following information:

<br>

$$
F=\dfrac{(RSS_{M2\_{py}} - RSS_{M1\_py})/(df_{\omega_q} - df_{\Omega_k})}{RSS_{M1\_{py}}/ df_{\Omega_k}} = 35.205892
$$ 

<br>

And the p-value of the test is:

$$
P(F_{\hspace{0.05cm} (df_{\omega_q} - df_{\Omega_k}) \hspace{0.05cm},\hspace{0.05cm} df_{\Omega_k}} > 25.203983) = 9.703235e-16
$$

<br>

So, the conclusion for any $\hspace{0.1cm} \alpha > 9.703235e-16 \hspace{0.1cm}$ is **reject** $\hspace{0.1cm} H_0: M4\_py\hspace{0.1cm}$ in favor of $\hspace{0.1cm}H_1: M3\_py\hspace{0.1cm}$, so we can accept that $\hspace{0.1cm} M3\_py \hspace{0.1cm}$ is a **better** model than $\hspace{0.1cm} M4\_py \hspace{0.1cm}$



<br>


```python
anova_lm(M5_py, M1_py)
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
      <th>df_resid</th>
      <th>ssr</th>
      <th>df_diff</th>
      <th>ss_diff</th>
      <th>F</th>
      <th>Pr(&gt;F)</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1903.0</td>
      <td>5.593743e+15</td>
      <td>0.0</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>1</th>
      <td>1893.0</td>
      <td>4.694567e+15</td>
      <td>10.0</td>
      <td>8.991756e+14</td>
      <td>36.257642</td>
      <td>2.127326e-65</td>
    </tr>
  </tbody>
</table>
</div>

<br>

This output gives to us the following information:

<br>

$$
F=\dfrac{(RSS_{M2\_{py}} - RSS_{M1\_py})/(df_{\omega_q} - df_{\Omega_k})}{RSS_{M1\_{py}}/ df_{\Omega_k}} = 36.257642
$$ 

<br>

And the p-value of the test is:

<br>

$$
P(F_{\hspace{0.05cm} (df_{\omega_q} - df_{\Omega_k}) \hspace{0.05cm},\hspace{0.05cm} df_{\Omega_k}} > 25.203983) = 2.127326e-65
$$

<br>

So, the conclusion for any $\hspace{0.1cm} \alpha > 2.127326e-65 \hspace{0.1cm}$ is **reject** $\hspace{0.1cm} H_0: M5\_py\hspace{0.1cm}$ in favor of $\hspace{0.1cm}H_1: M1\_py\hspace{0.1cm}$, so we can accept that $\hspace{0.1cm} M1\_py \hspace{0.1cm}$ is a **better** model than $\hspace{0.1cm} M5\_py \hspace{0.1cm}$


<br>


## F-test in `R` <a class="anchor" id="6"></a>


```r
%%R

M1_R <- lm( price ~ size_in_m_2*quality  + no_of_bedrooms + no_of_bathrooms + latitude + longitude , data = data_R)

M2_R <- lm( price ~ size_in_m_2 + no_of_bedrooms + no_of_bathrooms + quality + latitude + longitude , data = data_R)

M3_R <- lm( price ~ size_in_m_2 + no_of_bedrooms + no_of_bathrooms + latitude + longitude , data = data_R)

M4_R <- lm( price ~ size_in_m_2 + no_of_bedrooms + no_of_bathrooms , data = data_R)

M5_R <- lm( price ~ size_in_m_2 , data = data_R)
```




```r
%%R

anova(M2_R, M1_R)
```

    Analysis of Variance Table
    
    Model 1: price ~ size_in_m_2 + no_of_bedrooms + no_of_bathrooms + quality + 
        latitude + longitude
    Model 2: price ~ size_in_m_2 * quality + no_of_bedrooms + no_of_bathrooms + 
        latitude + longitude
      Res.Df        RSS Df  Sum of Sq      F    Pr(>F)    
    1   1896 4.8821e+15                                   
    2   1893 4.6946e+15  3 1.8751e+14 25.204 5.483e-16 ***
    ---
    Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    




```r
%%R

anova(M3_R, M2_R)
```

    Analysis of Variance Table
    
    Model 1: price ~ size_in_m_2 + no_of_bedrooms + no_of_bathrooms + latitude + 
        longitude
    Model 2: price ~ size_in_m_2 + no_of_bedrooms + no_of_bathrooms + quality + 
        latitude + longitude
      Res.Df        RSS Df  Sum of Sq     F Pr(>F)  
    1   1899 4.8987e+15                             
    2   1896 4.8821e+15  3 1.6585e+13 2.147 0.0924 .
    ---
    Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    




```r
%%R

anova(M4_R, M3_R)
```

    Analysis of Variance Table
    
    Model 1: price ~ size_in_m_2 + no_of_bedrooms + no_of_bathrooms
    Model 2: price ~ size_in_m_2 + no_of_bedrooms + no_of_bathrooms + latitude + 
        longitude
      Res.Df        RSS Df  Sum of Sq      F    Pr(>F)    
    1   1901 5.0803e+15                                   
    2   1899 4.8987e+15  2 1.8163e+14 35.206 9.703e-16 ***
    ---
    Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    




```r
%%R

anova(M5_R, M1_R)
```

    Analysis of Variance Table
    
    Model 1: price ~ size_in_m_2
    Model 2: price ~ size_in_m_2 * quality + no_of_bedrooms + no_of_bathrooms + 
        latitude + longitude
      Res.Df        RSS Df  Sum of Sq      F    Pr(>F)    
    1   1903 5.5937e+15                                   
    2   1893 4.6946e+15 10 8.9918e+14 36.258 < 2.2e-16 ***
    ---
    Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    



<br>



## ANOVA test as a F-test <a class="anchor" id="7"></a>





Remember that the hypothesis of the ANOVA test are these:

<br>

\begin{gather*}
\hspace{-1cm} H_0: \hspace{0.15cm} \beta_1=...=\beta_p=0 \\
H_1: \hspace{0.25cm} \beta_j \neq 0  \hspace{0.5cm}  \exists \ j=1,...,p
\end{gather*}


<br>

Let us consider the following models:

<br>
  
-    $\hspace{0.2cm} \Omega_k \ : \  \ y_i = \beta_0 + \beta_1\cdot x_{i1} +...+ \beta_{k-1}\cdot x_{i(k-1)} + \varepsilon_i \\[0.3cm]$

-   $\hspace{0.2cm} \omega_{q} \ : \ \ y_i = \beta_0 + \varepsilon_i \hspace{0.15cm}$ $\hspace{0.2cm}(\hspace{0.05cm} \text{Null Model}\hspace{0.05cm})$

<br>

Then, the ANOVA test is equivalent to the following:

<br>

\begin{gather*}
H_0: \hspace{0.15cm}  \ \hat{y}_i = \beta_0 + \beta_1\cdot x_{i1} +...+ \beta_{p}\cdot x_{ip} + \varepsilon_i  \ \hspace{0.2cm} ( \Omega_k ) \\[0.25cm]
\hspace{-5.7cm} H_1: \hspace{0.15cm} \hat{y}_i = \beta_0 + \varepsilon_i  \ \hspace{0.2cm} ( \omega_{q} )
\end{gather*}




Where:

- $k=p+1 \\[0.3cm]$

- $q=1 \\[0.3cm]$


-   $RSS_{\Omega_{k=p+1}} = \sum_{i=1}^n ( y_i - \widehat{y}_{\hspace{0.01cm} \Omega_{k=p+1} \hspace{0.02cm},\hspace{0.02cm} i})^2 = \sum_{i=1}^n \left( y_i - ( \widehat{\beta}_0 + \widehat{\beta}_1\cdot x_{i1} +...+ \widehat{\beta}_{p}\cdot x_{ip} ) \right)^2 \\[0.5cm]$


-   $RSS_{\omega_{q=1}} = \sum_{i=1}^n ( y_i - \widehat{y}_{\hspace{0.01cm} \omega_{q=1} \hspace{0.02cm},\hspace{0.02cm} i})^2 = \sum_{i=1}^n ( y_i - \widehat{\beta}_0 )^2 \\[0.5cm]$

 
-   Note that in the null model $\hspace{0.1cm} \widehat{\beta}_0=\overline{y} \hspace{0.1cm}$, therefore we have: $\\[0.35cm]$

    - $\hspace{0.1cm} RSS_{\omega_{q=1}}=\sum_{i=1}^n ( y_i - \overline{y} )^2= TSS_{\omega_{q=1}}= TSS_{\Omega_{k=p+1}}=TSS$


<br>


More details about the ANOVA  terms (RSS, TSS, RegSS)  can be seen in the following article https://fabioscielzoortiz.github.io/Estadistica4all.github.io/Articulos/Linear-Regression-in-Python-and-R-new.html

<br>


Using the above facts and the F-statistic we get the statistic test of the ANOVA test:

<br>

\begin{gather*}
F=\dfrac{(RSS_{\omega_{q=1}} - RSS_{\Omega_{k=p+1}})/(k-q)}{RSS_{\Omega_{k=p+1}}/(n-k)} = \dfrac{(TSS-RSS)/(p+1-1)}{RSS/(n-(p+1))} \\[0.6 cm]
= \dfrac{(TSS-RSS)/p}{RSS/(n-p-1))} \sim F_{p+1-1 \hspace{0.03cm},\hspace{0.03cm} n-(p+1)} = F_{p \hspace{0.03cm},\hspace{0.03cm} n-p-1}
\end{gather*}





Where:

$\hspace{0.3cm} TSS= RSS_{\omega_q}$

$\hspace{0.3cm} RSS= RSS_{\Omega_k}$


<br>

And this is the test statistic of the ANOVA test.

<br>

### Anova test as an F-test in `Python`



```python
full_model_py = smf.ols(formula = 'price ~ size_in_m_2 + no_of_bedrooms + no_of_bathrooms + quality + latitude + longitude', 
                        data =data_Python).fit()

null_model_py = smf.ols(formula = 'price ~ 1', data =data_Python).fit()
```


```python
anova_lm(null_model_py , full_model_py)
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
      <th>df_resid</th>
      <th>ssr</th>
      <th>df_diff</th>
      <th>ss_diff</th>
      <th>F</th>
      <th>Pr(&gt;F)</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1904.0</td>
      <td>1.615874e+16</td>
      <td>0.0</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>1</th>
      <td>1896.0</td>
      <td>4.882082e+15</td>
      <td>8.0</td>
      <td>1.127666e+16</td>
      <td>547.423881</td>
      <td>0.0</td>
    </tr>
  </tbody>
</table>
</div>





<br>

### Anova test as an F-test in `R`



```r
%%R

full_model_R <- lm( price ~ size_in_m_2 + no_of_bedrooms + no_of_bathrooms + quality + latitude + longitude , data = data_R)
null_model_R <- lm( price ~ 1 , data = data_R)
```


```r
%%R

anova(null_model_R, full_model_R)
```

    Analysis of Variance Table
    
    Model 1: price ~ 1
    Model 2: price ~ size_in_m_2 + no_of_bedrooms + no_of_bathrooms + quality + 
        latitude + longitude
      Res.Df        RSS Df  Sum of Sq      F    Pr(>F)    
    1   1904 1.6159e+16                                   
    2   1896 4.8821e+15  8 1.1277e+16 547.42 < 2.2e-16 ***
    ---
    Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    



<br>



## Significance test as an F-test  






Remember that the hypothesis of the significance test of $\beta_j$ are these:

<br>

\begin{gather*}
H_0: \beta_j=0 \\
H_1: \beta_j \neq 0
\end{gather*}

<br>

Let us consider the following models:

-   $\omega_q  : \  \ y_i = \beta_0 + \beta_1\cdot x_{i1} +..+\beta_{j-1} \cdot x_{i,j-1}+\beta_{j+1} \cdot x_{i,j+1}+..+ \beta_{p}\cdot x_{ip} + \varepsilon_i \\[0.5cm]$


-   $\Omega_k : \ \ y_i = \beta_0 + \beta_1\cdot x_{i1} +..+\beta_j \cdot x_{ij}+..+ \beta_{p}\cdot x_{ip} + \varepsilon_i$
    

<br>


Then, the significance test of $\beta_j$ is equivalent to the following:

<br>

\begin{gather*}
H_0: \hspace{0.2cm} y_i = \beta_0 + \beta_1\cdot x_{i1} +..+\beta_{j-1} \cdot x_{i,j-1}+\beta_{j+1} \cdot x_{i,j+1}+..+ \beta_{p}\cdot x_{ip} + \varepsilon_i \ \hspace{0.2cm} (\omega_q) \\[0.2cm]
\hspace{-3.7cm} H_1: \hspace{0.2cm}  y_i = \beta_0 + \beta_1\cdot x_{i1} +...+\beta_j \cdot x_{ij}+...+ \beta_{p}\cdot x_{ip} + \varepsilon_i  \ \hspace{0.2cm} ( \Omega_k )
\end{gather*}

<br>


Where:

- $k=p+1 \\[0.2cm]$

- $q=k-1=p \\[0.2cm]$
 

-   $RSS_{\Omega_{k=p+1}} = \sum_{i=1}^n ( y_i - \widehat{y}_{\hspace{0.01cm} \Omega_k \hspace{0.02cm},\hspace{0.02cm} i})^2  = \sum_{i=1}^n\left( y_i -  ( \widehat{\beta}_0 + \widehat{\beta}_1\cdot x_{i1}  +... +  \widehat{\beta}_{j} \cdot x_{i,j}+...+ \widehat{\beta}_{p}\cdot x_{ip} )  \right)^2 \\[0.5cm]$



-   $RSS_{\omega_{q=p}} = \sum_{i=1}^n ( y_i - \widehat{y}_{\hspace{0.01cm} \omega_k \hspace{0.02cm},\hspace{0.02cm} i})^2  = \sum_{i=1}^n \left( y_i - ( \widehat{\beta}_0 + \widehat{\beta}_1\cdot x_{i1}  +..+ \widehat{\beta}_{j-1} \cdot x_{i,j-1} +  \widehat{\beta}_{j+1} \cdot x_{i,j+1}+..+ \widehat{\beta}_{p}\cdot x_{ip} ) \right)^2$




<br>

So, the statistic test is obtained applying the F-statistic formula:

<br>

\begin{gather*}
F=\dfrac{(RSS_{\omega_q} - RSS_{\Omega_k})/(k-q)}{RSS_{\Omega_k}/(n-k)} =\dfrac{(RSS_{\omega_{k-1}} - RSS_{\Omega_k})/(k-(k-1))}{RSS_{\Omega_k}/(n-k)} \\[0.55cm]  = \dfrac{(RSS_{\omega_{k-1}} - RSS_{\Omega_k})/1)}{RSS_{\Omega_k}/(n-p-1)}  \sim F_{k-q, n-k} = F_{1, n-p-1} \\[0.5cm]
\end{gather*}

<br>

The results of the test using the F-test is approximately equal to the result obtained with the other alternative (t-test).

<br>

**Important**: $\hspace{0.1cm}$ this is the way to test the significance of categorical variables (compare the model without the categorical variable vs the model with it), and also to test the significance of two or more variables at the same time.



<br>

### Significance test as an F-test in `Python`

<br>

$$
H_0: \beta_{quality} = 0 \\
H_1: \beta_{quality} \neq 0
$$

<br>

```python
Model_with_quality_py =  smf.ols(formula = 'price ~ size_in_m_2 + no_of_bedrooms + no_of_bathrooms + quality + latitude + longitude', data =data_Python).fit()
Model_without_quality_py =  smf.ols(formula = 'price ~ size_in_m_2 + no_of_bedrooms + no_of_bathrooms + latitude + longitude', data =data_Python).fit()
```


```python
anova_lm(Model_without_quality_py, Model_with_quality_py)
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
      <th>df_resid</th>
      <th>ssr</th>
      <th>df_diff</th>
      <th>ss_diff</th>
      <th>F</th>
      <th>Pr(&gt;F)</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1899.0</td>
      <td>4.898667e+15</td>
      <td>0.0</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>1</th>
      <td>1896.0</td>
      <td>4.882082e+15</td>
      <td>3.0</td>
      <td>1.658498e+13</td>
      <td>2.146975</td>
      <td>0.092395</td>
    </tr>
  </tbody>
</table>
</div>



<br>

$pvalor = 0.092395 \hspace{0.25cm}  \Rightarrow \hspace{0.25cm}$  if $\hspace{0.1cm} \alpha = 0.01 \hspace{0.15cm}$ or $\hspace{0.15cm}  0.05 \hspace{0.15cm}$ we reject $\hspace{0.15cm} H_0: \beta_{quality} = 0 \hspace{0.15cm}$  , so we can accept $\hspace{0.15cm} H_1: \beta_{quality} \neq 0 \hspace{0.15cm}$ , so *quality* is significant.


<br>

----

$$
\hspace{-1.4cm} H_0: \beta_{longitude}= \beta_{latitude} = 0 \\
H_1: \hspace{0.3cm} \beta_{longitude}\neq 0 \hspace{0.2cm} or \hspace{0.2cm} \beta_{latitude}\neq 0
$$


```python
M1_py = smf.ols(formula = 'price ~ size_in_m_2 + no_of_bedrooms + no_of_bathrooms + quality', data=data_Python).fit()
M2_py = smf.ols(formula = 'price ~ size_in_m_2 + no_of_bedrooms + no_of_bathrooms + quality + latitude + longitude', data =data_Python).fit()
```


```python
anova_lm(M1_py, M2_py)
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
      <th>df_resid</th>
      <th>ssr</th>
      <th>df_diff</th>
      <th>ss_diff</th>
      <th>F</th>
      <th>Pr(&gt;F)</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1898.0</td>
      <td>5.066797e+15</td>
      <td>0.0</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>1</th>
      <td>1896.0</td>
      <td>4.882082e+15</td>
      <td>2.0</td>
      <td>1.847150e+14</td>
      <td>35.867848</td>
      <td>5.131535e-16</td>
    </tr>
  </tbody>
</table>
</div>

<br>

$pvalor = 5.131535e-16 \hspace{0.15cm}  \Rightarrow \hspace{0.15cm}$   $\hspace{0.1cm} \forall \alpha  \hspace{0.15cm}$ we reject $\hspace{0.15cm} H_0: \beta_{longitude}= \beta_{latitude} = 0 \hspace{0.15cm}$  , so we can accept $\hspace{0.15cm} H_1: \beta_{longitude}\neq 0 \hspace{0.2cm} or \hspace{0.2cm} \beta_{latitude}\neq 0 \hspace{0.15cm}$ , so $\hspace{0.1cm} longitude \hspace{0.1cm}$ or $\hspace{0.1cm} latitude \hspace{0.1cm}$ is significant.



<br>

### Significance test as an F-test in `R`

<br>

$$
H_0: \beta_{quality} = 0 \\
H_1: \beta_{quality} \neq 0
$$


```r
%%R

Model_with_quality_R <- lm(price ~ size_in_m_2 + no_of_bedrooms + no_of_bathrooms + quality + latitude + longitude , data = data_R)
Model_without_quality_R <- lm(price ~ size_in_m_2 + no_of_bedrooms + no_of_bathrooms  + latitude + longitude , data = data_R)
```


```r
%%R

anova(Model_without_quality_R, Model_with_quality_R)
```

    Analysis of Variance Table
    
    Model 1: price ~ size_in_m_2 + no_of_bedrooms + no_of_bathrooms + latitude + 
        longitude
    Model 2: price ~ size_in_m_2 + no_of_bedrooms + no_of_bathrooms + quality + 
        latitude + longitude
      Res.Df        RSS Df  Sum of Sq     F Pr(>F)  
    1   1899 4.8987e+15                             
    2   1896 4.8821e+15  3 1.6585e+13 2.147 0.0924 .
    ---
    Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    


<br>

--- 

$$
\hspace{-1.7cm} H_0: \beta_{longitude}= \beta_{latitude} = 0 \\
H_1: \hspace{0.3cm} \beta_{longitude}\neq 0 \hspace{0.2cm} or \hspace{0.2cm} \beta_{longitude}\neq 0
$$


```r
%%R

M1_R <- lm('price ~ size_in_m_2 + no_of_bedrooms + no_of_bathrooms + quality', data=data_R)
M2_R <- lm('price ~ size_in_m_2 + no_of_bedrooms + no_of_bathrooms + quality + latitude + longitude', data =data_R)
```


```r
%%R

anova(M1_R , M2_R)
```

    Analysis of Variance Table
    
    Model 1: price ~ size_in_m_2 + no_of_bedrooms + no_of_bathrooms + quality
    Model 2: price ~ size_in_m_2 + no_of_bedrooms + no_of_bathrooms + quality + 
        latitude + longitude
      Res.Df        RSS Df  Sum of Sq      F    Pr(>F)    
    1   1898 5.0668e+15                                   
    2   1896 4.8821e+15  2 1.8471e+14 35.868 5.132e-16 ***
    ---
    Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    





<br>



# Iterative Algorithms <a class="anchor" id="9"></a>

Now we are going to see several algorithms aimed at choosing a linear regression model over many or all possible ones, under certain criteria based in some metrics.



## Metrics <a class="anchor" id="10"></a>

These metrics are one of the most important concepts in modern statistics and machine learning. These metrics are used to select the "best" model under some criteria.

Some of them are:

- **Test error** computed by simple or cross validation
- $\widehat{R}^2 \hspace{0.3cm}$  (Adjusted Determination Coefficient)
- $AIC \hspace{0.3cm}$ (Akaike Information Criteria)
- $BIC \hspace{0.3cm}$ (Bayesian Information Criteria)
- $Cp \hspace{0.3cm}$ (Mallow's Cp)



A detailed review of simple and cross validation methods will be done in a future article on my blog. The test error computed by cross validation will not be used as a criteria in our practical implementation of the following iterative algorithms, because in the iterative selection of linear regression models the most common criteria is to use $AIC$, $BIC$ or $\widehat{R}^2$, so we will do a review of these last.

But in model selection in general, cross-validation plays a very prominent role.



<br>



### Adjusted Determination Coefficient $\hspace{0.2cm} \widehat{R}^2$   

This metric is explained with more details in the following article about linear regression :  

https://fabioscielzoortiz.github.io/Estadistica4all.github.io/Articulos/Linear-Regression-in-Python-and-R-new.html

<br>

Here we will just show the formula that characterizes the adjusted $R^2$:


Given a linear regression model $\hspace{0.1cm} M \hspace{0.1cm}$  with $\hspace{0.1cm} p_M \hspace{0.1cm}$ predictors and $n$ observations:

<br>

\begin{gather*}
\widehat{R}^2 = 1 - \left( 1- R^2 \right) \cdot \dfrac{n-1}{n-p_M}
\end{gather*}

Where:

\begin{gather*}
R^2 = \dfrac{RegSS}{TSS}
\end{gather*}

<br>

This metric is usually used as a criteria to select linear regression models.

<br>

**$\widehat{R}\hspace{0.1cm}^2$ criteria:** 

Given $\hspace{0.1cm} h \hspace{0.1cm}$ linear regression models $\hspace{0.1cm}M_1 , M_2, \dots, M_h$

<br>

$$
\text{If} \hspace{0.4cm}  \widehat{R}^2 (M_j) > \widehat{R}^2 (M_r) \hspace{0.35cm} , \hspace{0.1cm} \forall r \in \lbrace 1,...,h\rbrace - \lbrace j \rbrace \hspace{0.3cm} \Rightarrow \\[0.7cm]  \Rightarrow \hspace{0.3cm} M_j \hspace{0.2cm} \text{is selected instead of} \hspace{0.2cm} M_1, ..., M_{j-1},M_{j+1},...,M_h
$$

<br>

> That is, the model with the **highest** $\hspace{0.15cm} \widehat{R}^2 \hspace{0.15cm}$ is selected over the rest.


<br>

#### $\widehat{R}^2$ in `Python`


```python
X = data_Python[['size_in_m_2', 'longitude', 'latitude', 'no_of_bedrooms', 'no_of_bathrooms', 'quality']]
y = data_Python['price']
```


```python
model = smf.ols(formula = 'price ~ size_in_m_2 + no_of_bedrooms + no_of_bathrooms + quality', data=data_Python).fit()
```


```python
model.rsquared_adj
```




    0.6854449178693436



<br>

#### $\widehat{R}^2$ in `R`


```r
%%R

model <- lm( price ~ size_in_m_2 + no_of_bedrooms + no_of_bathrooms + quality , data = data_R)
```


```r
%%R 

summary(model)$adj.r.squared
```

    [1] 0.6854449
    



<br>



### Akaike Information Criteria $\hspace{0.2cm} AIC$ 

Given a linear regression model $\hspace{0.1cm} M \hspace{0.1cm}$  with $\hspace{0.1cm} p_M \hspace{0.1cm}$ predictors and $\hspace{0.1cm} n \hspace{0.1cm}$ observations:

<br>

$$ AIC(M) = -2 \cdot ln\left(\widehat{L}(M)\right) \hspace{0.1cm}+\hspace{0.1cm} 2 \cdot  \left(\hspace{0.1cm} p_M +1 \hspace{0.1cm}\right)  $$




Where:

$\widehat{L}(M)$ is the value of the **likelihood function** of the model $M$ evaluated at the MLE (Maximum Likelihood Estimation) of model parameters.


This metric is usually used as a criteria to select linear regression models.


<br>

#### **$AIC$ criteria**:

Given $\hspace{0.1cm}h\hspace{0.1cm}$ linear regression models $\hspace{0.1cm}M_1 , M_2, \dots, M_h$

<br>

$$
\text{If} \hspace{0.35cm}  AIC (M_j) < AIC(M_r) \hspace{0.35cm} , \forall r \in \lbrace 1,...,h\rbrace - \lbrace j \rbrace \hspace{0.35cm} \Rightarrow \\[0.7cm]
 \Rightarrow \hspace{0.35cm} M_j \hspace{0.2cm}\text{is selected instead of}\hspace{0.2cm} M_r   \hspace{0.2cm} , \forall r \in \lbrace 1,...,h\rbrace - \lbrace j \rbrace
$$

<br>

> That is, the model with the **less** $\hspace{0.1cm}AIC\hspace{0.1cm}$ is selected over the rest.




<br>



### $BIC$  <a class="anchor" id="13"></a>

Given a linear regression model $\hspace{0.05cm} M \hspace{0.05cm}$  with $\hspace{0.05cm} p_M \hspace{0.051cm}$ predictors and $n$ observations:

<br>

$$BIC(M) = -2 \cdot ln\left(\widehat{L}(M)\right) + ln(n) \cdot  \left(\hspace{0.1cm} p_M +1 \hspace{0.1cm}\right)$$



Where:

$\widehat{L}(M)$ is the value of the likelihood function of the model $M$ evaluated at the MLE (Maximum Likelihood Estimation) of model parameters.



This metric is usually used as a criteria to select linear regression models.


<br>


$BIC$ **criteria**:


Given $\hspace{0.1cm}h\hspace{0.1cm}$ linear regression models $\hspace{0.1cm}M_1 , M_2, \dots, M_h$

$$
\text{If} \hspace{0.35cm}  BIC (M_j) < BIC(M_r) \hspace{0.2cm} , \forall r \in \lbrace 1,...,h\rbrace - \lbrace j \rbrace \hspace{0.35cm} \Rightarrow \\[0.7cm]
\Rightarrow \hspace{0.35cm}   M_j \hspace{0.2cm}\text{is selected instead of}\hspace{0.2cm} M_r   \hspace{0.1cm} , \forall r \in \lbrace 1,...,h\rbrace - \lbrace j \rbrace
$$

<br>

>That is, the model with the **less** $BIC$ is selected over the rest.



<br>



## Maximum Likelihood Estimation in the Linear Regression Model <a class="anchor" id="14"></a>


Given a linear regression model $\hspace{0.1cm} M \hspace{0.1cm}$  with $\hspace{0.1cm} p_M \hspace{0.1cm}$ predictors and $n$ observations, the probability distribution of a random sample of response variable $\hspace{0.1cm}Y_1,...,Y_n\hspace{0.1cm}$ , is the following:

<br>

\begin{gather*}
Y_i \sim N(\hspace{0.1cm} x_i^t  \cdot \beta \hspace{0.15cm} , \hspace{0.15cm} \sigma^2 \hspace{0.1cm} ) \\[0.7cm]
 f_{Y_i}(z) = \dfrac{1}{\sqrt{2\pi \sigma^2}} \cdot exp\lbrace \hspace{0.1cm} - \dfrac{1}{2\sigma^2} \cdot (z - x^t_i\cdot \beta)^2 \hspace{0.1cm} \rbrace 
\end{gather*}
 
For $\hspace{0.2cm} i=1,...,n$
 
<br>

Given a sample of  realizations $\hspace{0.1cm}y_1,...,y_n\hspace{0.1cm}$ of the random sample $\hspace{0.1cm}Y_1,...,Y_n\hspace{0.1cm}$ of the response variable.

The likelihood function of the model $\hspace{0.1cm}M\hspace{0.1cm}$ is:


$$L( M )=L(\beta, \sigma \hspace{0.1cm}|\hspace{0.1cm} x_i, y_i) \hspace{0.2cm}=\hspace{0.2cm} f_{Y_1,...,Y_n}(y_1,...,y_n) \hspace{0.2cm}=\hspace{0.2cm} \prod_{i=1}^{n} f_{Y_i}(y_i) \hspace{0.2cm}=\hspace{0.2cm} (2\pi \sigma^2)^{-n/2} \cdot exp\lbrace \hspace{0.1cm} - \dfrac{1}{2\sigma^2}\cdot \sum_{i=1}^{n} (y_i - x^t_i\cdot \beta)^2 \hspace{0.1cm} \rbrace \\[0.3cm]$$


**Observation:** 

$f_{Y_1,...,Y_n}(y_1,...,y_n)\hspace{0.1cm}$ is the value of the joint density function of the random variables $\hspace{0.1cm}Y_1,...,Y_n\hspace{0.1cm}$ evaluated in $\hspace{0.1cm}y_1,...,y_n$

$f_{Y_i}(y_i)\hspace{0.1cm}$ is the value of the density function of the random variable $\hspace{0.1cm}Y_i\hspace{0.1cm}$ evaluated in $\hspace{0.1cm}y_i$

<br>

Taking natural logarithm we have:

$$ln\left(\hspace{0.1cm}L(M)\hspace{0.1cm}\right)\hspace{0.1cm}=\hspace{0.1cm}ln(\hspace{0.1cm} L(\beta, \sigma \hspace{0.1cm}|\hspace{0.1cm} x_i, y_i)\hspace{0.1cm}) \hspace{0.1cm}=\hspace{0.1cm} - \dfrac{n}{2} \left(ln(2\pi) + ln(\sigma^2) \right) - \dfrac{1}{2\sigma^2} \sum_{i=1}^{n} \left( y_i - x^t_i\cdot \beta \right) ^2   $$


<br>


The maximum likelihood estimation (MLE)  of the parameters $\hspace{0.1cm} \beta$ , $\sigma \hspace{0.1cm}$ of the linear regression model $M$ are calculated as the solution of the following optimization problem:

<br>

$$
\underset{\beta \hspace{0.05cm},\hspace{0.05cm} \sigma}{Max} \hspace{0.2cm} \lbrace \hspace{0.1cm} ln(\hspace{0.1cm}L(M)\hspace{0.1cm}) \hspace{0.1cm}\rbrace\\[0.3cm] 
$$

So, in other words:

$$\widehat{\beta}_{MLE} \hspace{0.1cm},\hspace{0.1cm} \widehat{\sigma}^2_{MLE} \hspace{0.2cm}=\hspace{0.2cm} arg \hspace{0.1cm} \underset{\beta \hspace{0.05cm},\hspace{0.05cm} \sigma}{Max} \hspace{0.2cm} \lbrace\hspace{0.1cm} ln(\hspace{0.1cm}L(M)\hspace{0.1cm}) \hspace{0.1cm}\rbrace
$$

  


<br>

**Solutions:**

\begin{gather*}
\widehat{\beta}_{MLE}\hspace{0.1cm}=\hspace{0.1cm}(X^t \cdot X)^{-1} \cdot X^t \cdot Y  \hspace{0.1cm}=\hspace{0.1cm} \widehat{\beta}_{OLS} \\[0.5cm]
\widehat{\sigma}^2_{MLE} \hspace{0.1cm}=\hspace{0.1cm} \dfrac{RSS(M)}{n}
\end{gather*}



<br>

Note that:

$$
arg \hspace{0.1cm} \underset{\beta \hspace{0.05cm},\hspace{0.05cm} \sigma}{Max} \hspace{0.2cm} L(M) \hspace{0.1cm}=\hspace{0.1cm} arg \hspace{0.1cm} \underset{\beta \hspace{0.05cm},\hspace{0.05cm} \sigma}{Max} \hspace{0.2cm} ln(\hspace{0.1cm}L(M)\hspace{0.1cm}) 
$$

<br>

So, the function $\hspace{0.1cm} ln \left( \hspace{0.1cm}L(M)\hspace{0.1cm} \right) \hspace{0.1cm}$ evaluated in $\hspace{0.1cm} \beta=\widehat{\beta}_{MLE} \hspace{0.1cm}, \hspace{0.1cm}\sigma^2 = \widehat{\sigma}^2_{MLE} \hspace{0.1cm}$ is :

<br>

$$ ln \left( \hspace{0.1cm}\widehat{L}(M)\hspace{0.1cm} \right) =  - \dfrac{n}{2} \left( ln(2\pi) + ln\left(\dfrac{RSS(M)}{n}\right) - ln(n) + 1 \right) $$





<br>

<br>



### $AIC$ and $BIC$ in the Linear Regression Model <a class="anchor" id="14.1"></a> 


Then, in the linear regression model $\hspace{0.1cm}M\hspace{0.1cm}$ with $\hspace{0.1cm}p_M\hspace{0.1cm}$ predictors and $\hspace{0.1cm}n\hspace{0.1cm}$ observations:

<br>

\begin{gather*}
AIC(M) = n \cdot \left( \hspace{0.1cm}  ln(2\pi) + ln(RSS(M)) - ln(n) \hspace{0.1cm} \right) + n + 2\cdot (\hspace{0.1cm}p_M + 1\hspace{0.1cm}) \\[0.6cm]
BIC(M) =  n \cdot \left(  \hspace{0.1cm} ln(2\pi) + ln(RSS(M)) - ln(n) \hspace{0.1cm} \right) + n + ln(n)\cdot(\hspace{0.1cm} p_M + 1\hspace{0.1cm}) 
\end{gather*}


<br>

Where:

$$
RSS(M) \hspace{0.1cm}=\hspace{0.1cm}  \sum_{i=1}^n \hat{\varepsilon}_i^2 \hspace{0.1cm}=\hspace{0.1cm}  \sum_{i=1}^n ( y_i - \hat{y}_i)^2
$$



<br>

### $AIC$ in `Python` <a class="anchor" id="14"></a>

Using `smf.ols` :


```python
model = smf.ols(formula = 'price ~ size_in_m_2 + no_of_bedrooms + no_of_bathrooms+ longitude + latitude + quality', data=data_Python).fit()
```


```python
model.aic
```




    59854.027050178316


<br>


Using the $AIC$ formula: 


```python
def AIC_lm(data, model):

    import math

    n = data.shape[0]

    p = model.df_model

    pi = math.pi

    RSS = anova_lm(model).sum_sq.Residual

    # Other way to compute RSS:
    
    # y = data['response_variable']
    # RSS = ( ( y - model.predict(X) )**2 ).sum()

    AIC = n*(math.log(2*pi) + math.log(RSS) -  math.log(n)) + n + 2*(p+1)

    return AIC
```




```python
model = smf.ols(formula = 'price ~ size_in_m_2 + no_of_bedrooms + no_of_bathrooms+ longitude + latitude + quality', data=data_Python).fit()
```


```python
AIC_lm(data_Python, model)
```




    59854.02705017832





Note:

`math.log(x , base)` , by default $\hspace{0.1cm} base=e$

$ln(x) =$ `math.log(x)` $=$ `math.log(x , math.e)`   



<br>

### $AIC$ in `R` <a class="anchor" id="14"></a>




```r
%%R

model <- lm( price ~ size_in_m_2 + no_of_bedrooms + no_of_bathrooms + quality , data = data_R)
```


```r
%%R

AIC(model)
```

    [1] 59922.77
    



<br>


#### $BIC$ in `Python` <a class="anchor" id="15"></a>

Using `smf.ols` :


```python
model = smf.ols(formula = 'price ~ size_in_m_2 + no_of_bedrooms + no_of_bathrooms + quality', data=data_Python).fit()
```


```python
model.bic
```




    59959.63885835402


<br>


Using the $BIC$ formula: 


```python
def BIC_lm(data, model):

    import math

    n = data.shape[0]

    p = model.df_model

    pi = math.pi

    RSS = anova_lm(model).sum_sq.Residual

    # Other way to compute RSS:
    
    # y = data['response_variable']
    # RSS = ( ( y - model.predict(X) )**2 ).sum()

    BIC = n*(math.log(2*pi) + math.log(RSS) -  math.log(n)) + n + math.log(n)*(p+1)

    return BIC
```




```python
model = smf.ols(formula = 'price ~ size_in_m_2 + no_of_bedrooms + no_of_bathrooms + quality', data=data_Python).fit()
```


```python
BIC_lm(data_Python, model)
```




    59959.638858354025





<br>

#### $BIC$ in `R` <a class="anchor" id="15"></a>


```r
%%R

model <- lm( price ~ size_in_m_2 + no_of_bedrooms + no_of_bathrooms + quality , data = data_R)
```


```r
%%R

BIC(model)
```

    [1] 59967.19
    



<br>



### Mallow's $C_p$ <a class="anchor" id="18"></a>

Given a full linear regression model  with $\hspace{0.1cm} p\hspace{0.1cm}$ predictors $\hspace{0.1cm} M_{Full}:\hspace{0.15cm} y_i \hspace{0.1cm}=\hspace{0.1cm} \beta_0 + \sum_{j=1}^{p} \hspace{0.02cm} \beta_j \cdot x_{ij}$

Given a linear regression model $\hspace{0.1cm} M \subseteq M_{Full}\hspace{0.1cm}$  with $\hspace{0.1cm} p_M \leq p\hspace{0.1cm}$ predictors and $\hspace{0.1cm}n\hspace{0.1cm}$ observations:

<br>

$$C_p(M) \hspace{0.15cm}=\hspace{0.15cm} \dfrac{RSS(M)}{\widehat{\sigma}_{M_{Full}}^2} - n \hspace{0.1cm}+\hspace{0.1cm} 2\cdot \left(\hspace{0.1cm} p_M +1 \hspace{0.1cm}\right)$$



Where:

$\hat{\sigma}_{M_{Full}}^2 \hspace{0.1cm}=\hspace{0.1cm}  \dfrac{RSS(M_{Full})}{n-p-1}  \hspace{0.35cm}$ is the residual variance of the full model.$\\$

$RSS(M_{Full}) \hspace{0.1cm}=\hspace{0.1cm}  \sum_{i=1}^{n} (y_i - \widehat{y}_{M_{Full}\hspace{0.02cm},\hspace{0.02cm} i})^2$


<br>
<br>

### $C_p$ in `Python` <a class="anchor" id="14"></a>


```python
def Cp_lm(data, full_model, model):

    # full_model and model have to be a  smf.ols, because `anova_lm` doesn´t work with sm.OLS

    n = data.shape[0]

    p_full_model =  full_model.df_model

    p_model =  model.df_model

    RSS_full_model = anova_lm(full_model).sum_sq.Residual

    RSS_model = anova_lm(model).sum_sq.Residual

    residual_variance_full_model = RSS_full_model/(n-p_full_model-1)

    # Other way to compute RSS:
    
    # y = data['response_variable']
    # RSS = ( ( y - model.predict(X) )**2 ).sum()

    Cp = RSS_model/residual_variance_full_model - n + 2*(p_model + 1)

    return Cp
```




```python
full_model = smf.ols(formula = 'price ~ size_in_m_2 + no_of_bedrooms + no_of_bathrooms + quality + latitude + longitude', data =data_Python).fit()

model = smf.ols(formula = 'price ~ size_in_m_2 + no_of_bedrooms + no_of_bathrooms', data =data_Python).fit()
```


```python
Cp_lm(data_Python, full_model, model)
```




    75.98029458609994





<br>

### $C_p$ in `R` <a class="anchor" id="14"></a>


```r
%%R

# install.packages("olsrr")
```

  
    


```r
%%R

full_model <- lm( price ~ size_in_m_2 + no_of_bedrooms + no_of_bathrooms + quality + latitude + longitude  , data = data_R)

model <- lm( price ~ size_in_m_2 + no_of_bedrooms + no_of_bathrooms  , data = data_R)
```


```r
%%R

library(olsrr)

ols_mallows_cp(model, full_model)
```

    [1] 75.98029
    


<br>

<br>

## Classic Best Subset Selection <a class="anchor" id="20"></a>

Classic best subset selection  consist in the following algorithm :

We have $p$ predictors: $\hspace{0.1cm} X_1,...,X_p$

- We train the null linear model $(M_0)\\[0.25cm]$
   
- We train all possible linear models with $\hspace{0.1cm}1\hspace{0.1cm}$ predictor and select the one with the smallest train error $(M^*_1)\\[0.25cm]$  

- We train all the possible linear models with $\hspace{0.1cm}2\hspace{0.1cm}$ predictors and select the one with the smallest train error $(M^*_2)$ 
  
   $\dots \\[0.3cm]$ 

- We train all the possible linear models with $\hspace{0.1cm}p-1\hspace{0.1cm}$ predictors and select the one with the smallest train error $(M^*_{p-1})\\[0.25cm]$ 

- We train the full linear model $(M_p)\\[0.25cm]$


- We select one of those models under some criteria, for example the one with **less**    $\hspace{0.05cm}AIC\hspace{0.05cm}$, $\hspace{0.05cm}BIC\hspace{0.05cm}$ or $\hspace{0.05cm}Cp\hspace{0.05cm}$, or **greater**  $\hspace{0.05cm}\widehat{R}^2\hspace{0.05cm}$. That model will be consider "the best model".



<br>

**Scheme of the algorithm:**

- Train $\hspace{0.08cm}M_0 =  \text{null linear model}  \\[0.35cm]$

- Train $\hspace{0.08cm}M_1=\lbrace \text{linear models with 1 predictor} \rbrace \hspace{0.12cm}\underset{\text{train error}}{\Rightarrow}\hspace{0.12cm} M_1^*\\[0.35cm]$ 

- Train $\hspace{0.08cm}M_2=\lbrace \text{linear models with 2 predictors} \rbrace \hspace{0.12cm}\underset{\text{train error}}{\Rightarrow}\hspace{0.12cm} M_2^*$

$\dots$

- Train $\hspace{0.08cm}M_{p-1}=\lbrace \text{linear models with p-1 predictors} \rbrace \hspace{0.12cm}\underset{\text{train error}}{\Rightarrow}\hspace{0.12cm} M_{p-1}^*\\[0.35cm]$

- Train $\hspace{0.08cm}M_{p}= \text{full linear model} \\[0.35cm]$



- $M_0 ,  M_1^* , ..., M_{p-1}^*, M_p  \underset{ \hspace{0.15cm} AIC\hspace{0.08cm},\hspace{0.08cm} BIC, \hspace{0.08cm}C_p \hspace{0.08cm},\hspace{0.08cm} \widehat{R}^2 \hspace{0.15cm}}{\Rightarrow} \hspace{0.1cm} M\hspace{0.05cm}^* \hspace{0.2cm}(Best \hspace{0.1cm} Model)$

<br>

**Observation:**

Due to the characteristics of the Backward algorithm, it **doesn't have to be true** that:

$M_0 \subset M_1^* \subset M_2^* \subset M_3^* ,..., M_{p-1}^* \subset M_p$


<br>

**Why don't we select the final model using the training error?**

The train error of a linear regression model is defined as:

$$\text{Train Error} (M_j) = ECM_{train}(M_j) =
\dfrac{1}{n} \cdot RSS_{train}(M_j)$$

And it is fulfilled that:

$$RSS_{train}(M_0) > RSS_{train}(M_1^*) > RSS_{train}(M_2^*) > ... > RSS_{train}(M_{p-1}^*) > RSS_ {train}(M_p^*)$$

So:

$$\text{Train Error} (M_0) > \text{Train Error} (M_1^*) >\text{Train Error} (M_2^*)>...>\text{Train Error} (M_{p -1}^*)>\text{Train Error} (M_p)$$


So if the train error were used as a metric to select the final model, the largest model (the one with the most parameters, that is, the complete model $M_p$) would always be selected.

For this reason we don't select the final model using the training error.

Although this isn't true with the test error, for this reason the test error    could be used to select the final model.

<br>

**Problems:**

- **Large computational requirements:** compute $2^p$ models is required, which is impossible with more than $\hspace{0.05cm} p=40 \hspace{0.05cm}$ predictors, because $\hspace{0.05cm} 2^{40}=1099511627776$.
  
  The growth of the computational requirements is exponential, for example, with $\hspace{0.05cm} p=10$ predictors we need to calculate $\hspace{0.05cm} 2^{10}=1024 \hspace{0.05cm}$ models, but with $\hspace{0.05cm} p=15\hspace{0.05cm}$ the models to be calculated are too many, $\hspace{0.05cm} 2^{15}=32768$



<br>

## Alternative Best Subset Selection <a class="anchor" id="20"></a>

Alternative best subset selection  consist in the following algorithm :

We have $p$ predictors: $\hspace{0.1cm} X_1,...,X_p \\[0.25cm]$

- We train the null linear model $\\[0.25cm]$
   
- We train all the possible linear models with  $\hspace{0.1cm}1\hspace{0.1cm}$ predictor $\\[0.25cm]$

- We train all the possible linear models with $\hspace{0.1cm}2\hspace{0.1cm}$ predictors 
  
   $\dots \\[0.3cm]$ 

- We train all the possible linear models with $\hspace{0.1cm}p-1\hspace{0.1cm}$ predictors $\\[0.25cm]$

- We train the full linear model $\\[0.25cm]$


- We select one of those models under some criteria, for example the one with **less**  $\hspace{0.05cm}AIC\hspace{0.05cm}$, $\hspace{0.05cm}BIC\hspace{0.05cm}$ or $\hspace{0.05cm}Cp\hspace{0.05cm}$, or **greater**  $\hspace{0.05cm}\widehat{R}^2\hspace{0.05cm}$. That model will be consider "the best model".



<br>

**Scheme of the algorithm:**

- Train $\hspace{0.08cm}M_0 = \lbrace \text{null linear model} \rbrace$

- Train $\hspace{0.08cm}M_1=\lbrace \text{linear models with 1 predictor} \rbrace$

- Train $\hspace{0.08cm}M_2=\lbrace \text{linear models with 2 predictors} \rbrace$

$\dots$

- Train $\hspace{0.08cm}M_{p-1}=\lbrace \text{linear models with p-1 predictors} \rbrace$

- Train $\hspace{0.08cm}M_{p}=\lbrace \text{full linear model} \rbrace \\[0.25cm]$



- $M_0 \cup M_1 \cup ...\cup M_p  \underset{ \hspace{0.15cm}  AIC\hspace{0.08cm},\hspace{0.08cm} BIC, \hspace{0.08cm}C_p \hspace{0.08cm},\hspace{0.08cm} \widehat{R}^2 \hspace{0.15cm}}{\Rightarrow} \hspace{0.1cm} M\hspace{0.05cm}^* \hspace{0.2cm}(Best \hspace{0.1cm} Model)$

<br>

**Problems:**

- **Large computational requirements:** compute $2^p$ models is required, which is impossible with more than $\hspace{0.05cm} p=40 \hspace{0.05cm}$ predictors, because $\hspace{0.05cm} 2^{40}=1099511627776$.
  
  The growth of the computational requirements is exponential, for example, with $\hspace{0.05cm} p=10$ predictors we need to calculate $\hspace{0.05cm} 2^{10}=1024 \hspace{0.05cm}$ models, but with $\hspace{0.05cm} p=15\hspace{0.05cm}$ the models to be calculated are too many, $\hspace{0.05cm} 2^{15}=32768$







<br>

### Best Subset Selection in `Python` <a class="anchor" id="21"></a>


We are going to program the **alternative best subset selection** in `Python`

<br>

#### varcharProcessing function <a class="anchor" id="21.1"></a>

We are going to define a function to process categorical variables:


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



Let's see how the function `varcharProcessing` works:


```python
X = data_Python[['size_in_m_2', 'longitude', 'latitude', 'no_of_bedrooms', 'no_of_bathrooms', 'quality']]
y = data_Python['price']
```


```python
X
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
      <th>size_in_m_2</th>
      <th>longitude</th>
      <th>latitude</th>
      <th>no_of_bedrooms</th>
      <th>no_of_bathrooms</th>
      <th>quality</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>100.242337</td>
      <td>55.138932</td>
      <td>25.113208</td>
      <td>1</td>
      <td>2</td>
      <td>1</td>
    </tr>
    <tr>
      <th>1</th>
      <td>146.972546</td>
      <td>55.151201</td>
      <td>25.106809</td>
      <td>2</td>
      <td>2</td>
      <td>1</td>
    </tr>
    <tr>
      <th>2</th>
      <td>181.253753</td>
      <td>55.137728</td>
      <td>25.063302</td>
      <td>3</td>
      <td>5</td>
      <td>1</td>
    </tr>
    <tr>
      <th>3</th>
      <td>187.664060</td>
      <td>55.341761</td>
      <td>25.227295</td>
      <td>2</td>
      <td>3</td>
      <td>0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>47.101821</td>
      <td>55.139764</td>
      <td>25.114275</td>
      <td>0</td>
      <td>1</td>
      <td>1</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>1900</th>
      <td>100.985561</td>
      <td>55.310712</td>
      <td>25.176892</td>
      <td>2</td>
      <td>2</td>
      <td>3</td>
    </tr>
    <tr>
      <th>1901</th>
      <td>70.606280</td>
      <td>55.276684</td>
      <td>25.166145</td>
      <td>1</td>
      <td>2</td>
      <td>1</td>
    </tr>
    <tr>
      <th>1902</th>
      <td>179.302790</td>
      <td>55.345056</td>
      <td>25.206500</td>
      <td>3</td>
      <td>5</td>
      <td>1</td>
    </tr>
    <tr>
      <th>1903</th>
      <td>68.748220</td>
      <td>55.229844</td>
      <td>25.073858</td>
      <td>1</td>
      <td>2</td>
      <td>1</td>
    </tr>
    <tr>
      <th>1904</th>
      <td>74.322400</td>
      <td>55.154713</td>
      <td>25.079130</td>
      <td>1</td>
      <td>2</td>
      <td>2</td>
    </tr>
  </tbody>
</table>
<p>1905 rows × 6 columns</p>
</div>



The function `varcharProcessing` has two inputs, first a data-set, and second three options (**drop**, **dummy**, **dummy_dropfirst**).



- If the second input is **drop**, the function drops all the variables object type.



- If the second input is **dummy**, the function drops the original categorical variables, and generate the dummy variables associated to their categories 

For example: $quality$ would be dropped, and because of $quality$ has 4 categories (0,1,2,3) the dummies variables $quality\_0$ , $quality\_1$, $quality\_2$, $quality\_3$ would be added to the date-set.



- If the second input is **dummy_dropfirst**, 
the function drops the original categorical variable, and generate the dummy variables associated to their categories , but dropping the dummy associated with the first category.

For example: $quality$ would be dropped, and because of $quality$ has 4 categories (0,1,2,3) and  first dummy must be dropped,  the dummies variables $quality\_1$, $quality\_2$, $quality\_3$ would be added to the date-set.

- In all the cases the function add the intercept column to the data-set

<br>


**Dummy variables associated to a categorical variable:*

$D(X_j , i)$ is the dummy variable associated to the category $i$ of the categorical variable $X_j$ $\Leftrightarrow$

$$
\Leftrightarrow D(X_j , i) = \left\lbrace\begin{array}{l} 1 \hspace{0.3cm},\text{ if $\hspace{0.1cm} X_j = i$ } \\ 0 \hspace{0.3cm},\text{   if $\hspace{0.1cm} X_j \neq i$  }  \end{array}\right.
$$


<br>

Let´s see the above :


```python
varcharProcessing(X, varchar_process = "dummy_dropfirst")
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
      <th>intercept</th>
      <th>size_in_m_2</th>
      <th>longitude</th>
      <th>latitude</th>
      <th>no_of_bedrooms</th>
      <th>no_of_bathrooms</th>
      <th>quality_1</th>
      <th>quality_2</th>
      <th>quality_3</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>100.242337</td>
      <td>55.138932</td>
      <td>25.113208</td>
      <td>1</td>
      <td>2</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>1</td>
      <td>146.972546</td>
      <td>55.151201</td>
      <td>25.106809</td>
      <td>2</td>
      <td>2</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>1</td>
      <td>181.253753</td>
      <td>55.137728</td>
      <td>25.063302</td>
      <td>3</td>
      <td>5</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>3</th>
      <td>1</td>
      <td>187.664060</td>
      <td>55.341761</td>
      <td>25.227295</td>
      <td>2</td>
      <td>3</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>1</td>
      <td>47.101821</td>
      <td>55.139764</td>
      <td>25.114275</td>
      <td>0</td>
      <td>1</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
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
    </tr>
    <tr>
      <th>1900</th>
      <td>1</td>
      <td>100.985561</td>
      <td>55.310712</td>
      <td>25.176892</td>
      <td>2</td>
      <td>2</td>
      <td>0</td>
      <td>0</td>
      <td>1</td>
    </tr>
    <tr>
      <th>1901</th>
      <td>1</td>
      <td>70.606280</td>
      <td>55.276684</td>
      <td>25.166145</td>
      <td>1</td>
      <td>2</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>1902</th>
      <td>1</td>
      <td>179.302790</td>
      <td>55.345056</td>
      <td>25.206500</td>
      <td>3</td>
      <td>5</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>1903</th>
      <td>1</td>
      <td>68.748220</td>
      <td>55.229844</td>
      <td>25.073858</td>
      <td>1</td>
      <td>2</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>1904</th>
      <td>1</td>
      <td>74.322400</td>
      <td>55.154713</td>
      <td>25.079130</td>
      <td>1</td>
      <td>2</td>
      <td>0</td>
      <td>1</td>
      <td>0</td>
    </tr>
  </tbody>
</table>
<p>1905 rows × 9 columns</p>
</div>






```python
varcharProcessing(X, varchar_process = "dummy")
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
      <th>intercept</th>
      <th>size_in_m_2</th>
      <th>longitude</th>
      <th>latitude</th>
      <th>no_of_bedrooms</th>
      <th>no_of_bathrooms</th>
      <th>quality_0</th>
      <th>quality_1</th>
      <th>quality_2</th>
      <th>quality_3</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>100.242337</td>
      <td>55.138932</td>
      <td>25.113208</td>
      <td>1</td>
      <td>2</td>
      <td>0</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>1</td>
      <td>146.972546</td>
      <td>55.151201</td>
      <td>25.106809</td>
      <td>2</td>
      <td>2</td>
      <td>0</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>1</td>
      <td>181.253753</td>
      <td>55.137728</td>
      <td>25.063302</td>
      <td>3</td>
      <td>5</td>
      <td>0</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>3</th>
      <td>1</td>
      <td>187.664060</td>
      <td>55.341761</td>
      <td>25.227295</td>
      <td>2</td>
      <td>3</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>1</td>
      <td>47.101821</td>
      <td>55.139764</td>
      <td>25.114275</td>
      <td>0</td>
      <td>1</td>
      <td>0</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
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
    </tr>
    <tr>
      <th>1900</th>
      <td>1</td>
      <td>100.985561</td>
      <td>55.310712</td>
      <td>25.176892</td>
      <td>2</td>
      <td>2</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>1</td>
    </tr>
    <tr>
      <th>1901</th>
      <td>1</td>
      <td>70.606280</td>
      <td>55.276684</td>
      <td>25.166145</td>
      <td>1</td>
      <td>2</td>
      <td>0</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>1902</th>
      <td>1</td>
      <td>179.302790</td>
      <td>55.345056</td>
      <td>25.206500</td>
      <td>3</td>
      <td>5</td>
      <td>0</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>1903</th>
      <td>1</td>
      <td>68.748220</td>
      <td>55.229844</td>
      <td>25.073858</td>
      <td>1</td>
      <td>2</td>
      <td>0</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>1904</th>
      <td>1</td>
      <td>74.322400</td>
      <td>55.154713</td>
      <td>25.079130</td>
      <td>1</td>
      <td>2</td>
      <td>0</td>
      <td>0</td>
      <td>1</td>
      <td>0</td>
    </tr>
  </tbody>
</table>
<p>1905 rows × 10 columns</p>
</div>






```python
varcharProcessing(X, varchar_process = "drop")
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
      <th>intercept</th>
      <th>size_in_m_2</th>
      <th>longitude</th>
      <th>latitude</th>
      <th>no_of_bedrooms</th>
      <th>no_of_bathrooms</th>
      <th>quality</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>100.242337</td>
      <td>55.138932</td>
      <td>25.113208</td>
      <td>1</td>
      <td>2</td>
      <td>1</td>
    </tr>
    <tr>
      <th>1</th>
      <td>1</td>
      <td>146.972546</td>
      <td>55.151201</td>
      <td>25.106809</td>
      <td>2</td>
      <td>2</td>
      <td>1</td>
    </tr>
    <tr>
      <th>2</th>
      <td>1</td>
      <td>181.253753</td>
      <td>55.137728</td>
      <td>25.063302</td>
      <td>3</td>
      <td>5</td>
      <td>1</td>
    </tr>
    <tr>
      <th>3</th>
      <td>1</td>
      <td>187.664060</td>
      <td>55.341761</td>
      <td>25.227295</td>
      <td>2</td>
      <td>3</td>
      <td>0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>1</td>
      <td>47.101821</td>
      <td>55.139764</td>
      <td>25.114275</td>
      <td>0</td>
      <td>1</td>
      <td>1</td>
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
    </tr>
    <tr>
      <th>1900</th>
      <td>1</td>
      <td>100.985561</td>
      <td>55.310712</td>
      <td>25.176892</td>
      <td>2</td>
      <td>2</td>
      <td>3</td>
    </tr>
    <tr>
      <th>1901</th>
      <td>1</td>
      <td>70.606280</td>
      <td>55.276684</td>
      <td>25.166145</td>
      <td>1</td>
      <td>2</td>
      <td>1</td>
    </tr>
    <tr>
      <th>1902</th>
      <td>1</td>
      <td>179.302790</td>
      <td>55.345056</td>
      <td>25.206500</td>
      <td>3</td>
      <td>5</td>
      <td>1</td>
    </tr>
    <tr>
      <th>1903</th>
      <td>1</td>
      <td>68.748220</td>
      <td>55.229844</td>
      <td>25.073858</td>
      <td>1</td>
      <td>2</td>
      <td>1</td>
    </tr>
    <tr>
      <th>1904</th>
      <td>1</td>
      <td>74.322400</td>
      <td>55.154713</td>
      <td>25.079130</td>
      <td>1</td>
      <td>2</td>
      <td>2</td>
    </tr>
  </tbody>
</table>
<p>1905 rows × 7 columns</p>
</div>



In last one, if quality would be object type, it would be drop. But in this case it has category type, so it hasn't been dropped.


```python
X.dtypes

```




    size_in_m_2         float64
    longitude           float64
    latitude            float64
    no_of_bedrooms        int64
    no_of_bathrooms       int64
    quality            category
    dtype: object





What happened if we have a categorical variable with a not standard range ?

No problem, `varcharProcessing` keeps working well, following the same philosophy.

Let's see that:


```python
X['quality'] = X['quality'].astype(float) 

X['quality'] = X['quality'] + 2

X['quality'] = X['quality'].astype('category') 
```


```python
varcharProcessing(X , varchar_process = "dummy")
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
      <th>intercept</th>
      <th>size_in_m_2</th>
      <th>longitude</th>
      <th>latitude</th>
      <th>no_of_bedrooms</th>
      <th>no_of_bathrooms</th>
      <th>quality_2.0</th>
      <th>quality_3.0</th>
      <th>quality_4.0</th>
      <th>quality_5.0</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>100.242337</td>
      <td>55.138932</td>
      <td>25.113208</td>
      <td>1</td>
      <td>2</td>
      <td>0</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>1</td>
      <td>146.972546</td>
      <td>55.151201</td>
      <td>25.106809</td>
      <td>2</td>
      <td>2</td>
      <td>0</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>1</td>
      <td>181.253753</td>
      <td>55.137728</td>
      <td>25.063302</td>
      <td>3</td>
      <td>5</td>
      <td>0</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>3</th>
      <td>1</td>
      <td>187.664060</td>
      <td>55.341761</td>
      <td>25.227295</td>
      <td>2</td>
      <td>3</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>1</td>
      <td>47.101821</td>
      <td>55.139764</td>
      <td>25.114275</td>
      <td>0</td>
      <td>1</td>
      <td>0</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
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
    </tr>
    <tr>
      <th>1900</th>
      <td>1</td>
      <td>100.985561</td>
      <td>55.310712</td>
      <td>25.176892</td>
      <td>2</td>
      <td>2</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>1</td>
    </tr>
    <tr>
      <th>1901</th>
      <td>1</td>
      <td>70.606280</td>
      <td>55.276684</td>
      <td>25.166145</td>
      <td>1</td>
      <td>2</td>
      <td>0</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>1902</th>
      <td>1</td>
      <td>179.302790</td>
      <td>55.345056</td>
      <td>25.206500</td>
      <td>3</td>
      <td>5</td>
      <td>0</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>1903</th>
      <td>1</td>
      <td>68.748220</td>
      <td>55.229844</td>
      <td>25.073858</td>
      <td>1</td>
      <td>2</td>
      <td>0</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>1904</th>
      <td>1</td>
      <td>74.322400</td>
      <td>55.154713</td>
      <td>25.079130</td>
      <td>1</td>
      <td>2</td>
      <td>0</td>
      <td>0</td>
      <td>1</td>
      <td>0</td>
    </tr>
  </tbody>
</table>
<p>1905 rows × 10 columns</p>
</div>





Now we can undo the previous changes:


```python
X['quality'] = X['quality'].astype(float) 

X['quality'] = X['quality'] - 2

X['quality'] = X['quality'].astype('category') 
```





In the following algorithms we are going to use `statsmodels.api` instead of `statsmodels.formula.api` to implement the linear regression. So we have to take into account some particularities of  `statsmodels.api`

One of the most important differences is that `statsmodels.api` doesn´t fit the intercept, while `statsmodels.formula.api` does.

Another important difference is that `statsmodels.api` doesn't deal well with categorical predictors, while `statsmodels.formula.api` does.


```python
import statsmodels.api as sm
```

For example, the following model doesn't fit the intercept neither deal well the categorical predictor $quality$


```python
X = data_Python[['size_in_m_2', 'longitude', 'latitude', 'no_of_bedrooms', 'no_of_bathrooms', 'quality']]
y = data_Python['price']
```


```python
model = sm.OLS( y , X ).fit()

print(model.summary())
```

                                     OLS Regression Results                                
    =======================================================================================
    Dep. Variable:                  price   R-squared (uncentered):                   0.800
    Model:                            OLS   Adj. R-squared (uncentered):              0.799
    Method:                 Least Squares   F-statistic:                              1264.
    Date:               vi., 07 oct. 2022   Prob (F-statistic):                        0.00
    Time:                        02:06:20   Log-Likelihood:                         -29920.
    No. Observations:                1905   AIC:                                  5.985e+04
    Df Residuals:                    1899   BIC:                                  5.989e+04
    Df Model:                           6                                                  
    Covariance Type:            nonrobust                                                  
    ===================================================================================
                          coef    std err          t      P>|t|      [0.025      0.975]
    -----------------------------------------------------------------------------------
    size_in_m_2       3.56e+04    720.490     49.411      0.000    3.42e+04     3.7e+04
    longitude       -2.947e+06   3.46e+05     -8.508      0.000   -3.63e+06   -2.27e+06
    latitude         6.436e+06   7.62e+05      8.448      0.000    4.94e+06    7.93e+06
    no_of_bedrooms  -8.376e+05   8.28e+04    -10.114      0.000      -1e+06   -6.75e+05
    no_of_bathrooms -5.698e+04   6.81e+04     -0.837      0.403   -1.91e+05    7.66e+04
    quality          1.252e+05   5.25e+04      2.385      0.017    2.23e+04    2.28e+05
    ==============================================================================
    Omnibus:                      781.264   Durbin-Watson:                   1.718
    Prob(Omnibus):                  0.000   Jarque-Bera (JB):            25505.131
    Skew:                           1.280   Prob(JB):                         0.00
    Kurtosis:                      20.742   Cond. No.                     3.73e+03
    ==============================================================================
    
    Notes:
    [1] R² is computed without centering (uncentered) since the model does not contain a constant.
    [2] Standard Errors assume that the covariance matrix of the errors is correctly specified.
    [3] The condition number is large, 3.73e+03. This might indicate that there are
    strong multicollinearity or other numerical problems.
    



To fit the intercept and properly treat  categorical predictors with `statsmodels.api` we need to add the intercept and the dummy (binary) variables associated with the categorical predictors to $X$ as new predictors, and this can be done using `varcharProcessing `


You can get more information about how categorical predictors must be deal in linear regression models in the following article: 

https://fabioscielzoortiz.github.io/Estadistica4all.github.io/Articulos/Linear%20Regression%20in%20Python%20and%20R.html





```python
X_new = varcharProcessing(X, varchar_process = "dummy_dropfirst")
```


```python
X_new
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
      <th>intercept</th>
      <th>size_in_m_2</th>
      <th>longitude</th>
      <th>latitude</th>
      <th>no_of_bedrooms</th>
      <th>no_of_bathrooms</th>
      <th>quality_1</th>
      <th>quality_2</th>
      <th>quality_3</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>100.242337</td>
      <td>55.138932</td>
      <td>25.113208</td>
      <td>1</td>
      <td>2</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>1</td>
      <td>146.972546</td>
      <td>55.151201</td>
      <td>25.106809</td>
      <td>2</td>
      <td>2</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>1</td>
      <td>181.253753</td>
      <td>55.137728</td>
      <td>25.063302</td>
      <td>3</td>
      <td>5</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>3</th>
      <td>1</td>
      <td>187.664060</td>
      <td>55.341761</td>
      <td>25.227295</td>
      <td>2</td>
      <td>3</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>1</td>
      <td>47.101821</td>
      <td>55.139764</td>
      <td>25.114275</td>
      <td>0</td>
      <td>1</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
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
    </tr>
    <tr>
      <th>1900</th>
      <td>1</td>
      <td>100.985561</td>
      <td>55.310712</td>
      <td>25.176892</td>
      <td>2</td>
      <td>2</td>
      <td>0</td>
      <td>0</td>
      <td>1</td>
    </tr>
    <tr>
      <th>1901</th>
      <td>1</td>
      <td>70.606280</td>
      <td>55.276684</td>
      <td>25.166145</td>
      <td>1</td>
      <td>2</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>1902</th>
      <td>1</td>
      <td>179.302790</td>
      <td>55.345056</td>
      <td>25.206500</td>
      <td>3</td>
      <td>5</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>1903</th>
      <td>1</td>
      <td>68.748220</td>
      <td>55.229844</td>
      <td>25.073858</td>
      <td>1</td>
      <td>2</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>1904</th>
      <td>1</td>
      <td>74.322400</td>
      <td>55.154713</td>
      <td>25.079130</td>
      <td>1</td>
      <td>2</td>
      <td>0</td>
      <td>1</td>
      <td>0</td>
    </tr>
  </tbody>
</table>
<p>1905 rows × 9 columns</p>
</div>






```python
model = sm.OLS(y , X_new ).fit()

print(model.summary())
```

                                OLS Regression Results                            
    ==============================================================================
    Dep. Variable:                  price   R-squared:                       0.698
    Model:                            OLS   Adj. R-squared:                  0.697
    Method:                 Least Squares   F-statistic:                     547.4
    Date:               vi., 07 oct. 2022   Prob (F-statistic):               0.00
    Time:                        02:06:20   Log-Likelihood:                -29918.
    No. Observations:                1905   AIC:                         5.985e+04
    Df Residuals:                    1896   BIC:                         5.990e+04
    Df Model:                           8                                         
    Covariance Type:            nonrobust                                         
    ===================================================================================
                          coef    std err          t      P>|t|      [0.025      0.975]
    -----------------------------------------------------------------------------------
    intercept       -6.207e+07   2.99e+07     -2.073      0.038   -1.21e+08   -3.34e+06
    size_in_m_2      3.566e+04    723.831     49.271      0.000    3.42e+04    3.71e+04
    longitude       -1.677e+06   6.91e+05     -2.428      0.015   -3.03e+06   -3.22e+05
    latitude         6.115e+06   7.81e+05      7.830      0.000    4.58e+06    7.65e+06
    no_of_bedrooms  -8.367e+05   8.28e+04    -10.102      0.000   -9.99e+05   -6.74e+05
    no_of_bathrooms -5.712e+04   6.83e+04     -0.836      0.403   -1.91e+05    7.68e+04
    quality_1          1.4e+05   8.36e+04      1.675      0.094   -2.39e+04    3.04e+05
    quality_2        3.406e+05   1.55e+05      2.196      0.028    3.63e+04    6.45e+05
    quality_3        2.788e+05   1.98e+05      1.410      0.159   -1.09e+05    6.66e+05
    ==============================================================================
    Omnibus:                      779.851   Durbin-Watson:                   1.716
    Prob(Omnibus):                  0.000   Jarque-Bera (JB):            25742.187
    Skew:                           1.273   Prob(JB):                         0.00
    Kurtosis:                      20.828   Cond. No.                     1.34e+05
    ==============================================================================
    
    Notes:
    [1] Standard Errors assume that the covariance matrix of the errors is correctly specified.
    [2] The condition number is large, 1.34e+05. This might indicate that there are
    strong multicollinearity or other numerical problems.
    



To build the best subset selection algorithm, we have to explore all possible combinations of predictors, for $1,2,3,...,p \hspace{0.1cm}$ predictors .

This task is very complex, but luckily in Python we have the `itertools` package which has iteration tools to help us.


```python
# pip install tqdm
```


```python
import itertools

from tqdm import tnrange
```

Let's see how `itertools.combinations` works:


```python
# pip install ipywidgets
```


```python
for k in tnrange( 1, len(X.columns) + 1, desc = 'Loop...'):

    for combo in itertools.combinations(X.columns , k): 

        print(combo)

# itertools.combinations(X.columns , k) generate all the possible combinations with k columns of X (predictors)
```



    ('size_in_m_2',)
    ('longitude',)
    ('latitude',)
    ('no_of_bedrooms',)
    ('no_of_bathrooms',)
    ('quality',)
    ('size_in_m_2', 'longitude')
    ('size_in_m_2', 'latitude')
    ('size_in_m_2', 'no_of_bedrooms')
    ('size_in_m_2', 'no_of_bathrooms')
    ('size_in_m_2', 'quality')
    ('longitude', 'latitude')
    ('longitude', 'no_of_bedrooms')
    ('longitude', 'no_of_bathrooms')
    ('longitude', 'quality')
    ('latitude', 'no_of_bedrooms')
    ('latitude', 'no_of_bathrooms')
    ('latitude', 'quality')
    ('no_of_bedrooms', 'no_of_bathrooms')
    ('no_of_bedrooms', 'quality')
    ('no_of_bathrooms', 'quality')
    ('size_in_m_2', 'longitude', 'latitude')
    ('size_in_m_2', 'longitude', 'no_of_bedrooms')
    ('size_in_m_2', 'longitude', 'no_of_bathrooms')
    ('size_in_m_2', 'longitude', 'quality')
    ('size_in_m_2', 'latitude', 'no_of_bedrooms')
    ('size_in_m_2', 'latitude', 'no_of_bathrooms')
    ('size_in_m_2', 'latitude', 'quality')
    ('size_in_m_2', 'no_of_bedrooms', 'no_of_bathrooms')
    ('size_in_m_2', 'no_of_bedrooms', 'quality')
    ('size_in_m_2', 'no_of_bathrooms', 'quality')
    ('longitude', 'latitude', 'no_of_bedrooms')
    ('longitude', 'latitude', 'no_of_bathrooms')
    ('longitude', 'latitude', 'quality')
    ('longitude', 'no_of_bedrooms', 'no_of_bathrooms')
    ('longitude', 'no_of_bedrooms', 'quality')
    ('longitude', 'no_of_bathrooms', 'quality')
    ('latitude', 'no_of_bedrooms', 'no_of_bathrooms')
    ('latitude', 'no_of_bedrooms', 'quality')
    ('latitude', 'no_of_bathrooms', 'quality')
    ('no_of_bedrooms', 'no_of_bathrooms', 'quality')
    ('size_in_m_2', 'longitude', 'latitude', 'no_of_bedrooms')
    ('size_in_m_2', 'longitude', 'latitude', 'no_of_bathrooms')
    ('size_in_m_2', 'longitude', 'latitude', 'quality')
    ('size_in_m_2', 'longitude', 'no_of_bedrooms', 'no_of_bathrooms')
    ('size_in_m_2', 'longitude', 'no_of_bedrooms', 'quality')
    ('size_in_m_2', 'longitude', 'no_of_bathrooms', 'quality')
    ('size_in_m_2', 'latitude', 'no_of_bedrooms', 'no_of_bathrooms')
    ('size_in_m_2', 'latitude', 'no_of_bedrooms', 'quality')
    ('size_in_m_2', 'latitude', 'no_of_bathrooms', 'quality')
    ('size_in_m_2', 'no_of_bedrooms', 'no_of_bathrooms', 'quality')
    ('longitude', 'latitude', 'no_of_bedrooms', 'no_of_bathrooms')
    ('longitude', 'latitude', 'no_of_bedrooms', 'quality')
    ('longitude', 'latitude', 'no_of_bathrooms', 'quality')
    ('longitude', 'no_of_bedrooms', 'no_of_bathrooms', 'quality')
    ('latitude', 'no_of_bedrooms', 'no_of_bathrooms', 'quality')
    ('size_in_m_2', 'longitude', 'latitude', 'no_of_bedrooms', 'no_of_bathrooms')
    ('size_in_m_2', 'longitude', 'latitude', 'no_of_bedrooms', 'quality')
    ('size_in_m_2', 'longitude', 'latitude', 'no_of_bathrooms', 'quality')
    ('size_in_m_2', 'longitude', 'no_of_bedrooms', 'no_of_bathrooms', 'quality')
    ('size_in_m_2', 'latitude', 'no_of_bedrooms', 'no_of_bathrooms', 'quality')
    ('longitude', 'latitude', 'no_of_bedrooms', 'no_of_bathrooms', 'quality')
    ('size_in_m_2', 'longitude', 'latitude', 'no_of_bedrooms', 'no_of_bathrooms', 'quality')
    



`itertools.combinations(X.columns , k)` generate all the possible combinations with $k$ columns of $X$ (`X.columns`), and $k$ goes from $1$ to the number of columns of $X$



<br>



### Best Subset Selection Algorithm in `Python`

We are going to develop the Best Subset Selection algorithm in `Python` :


```python
def BestSubset (X , y,  varchar_process="dummy_dropfirst", criteria="AIC"):

    X =  varcharProcessing(X, varchar_process = varchar_process)
 

    AIC, BIC , ADJ_R2 , TRAIN_ERROR_MSE = [],[],[],[]
    
    predictor_list = []
    num_predictor = []

    cols = X.columns[1:len(X.columns)] # We are not selecting the intercept


############################################################################################################################################

   # Null Model:

    model = sm.OLS(y, X[ ['intercept'] ] ).fit()

    TRAIN_ERROR_MSE.append( ( (y - model.predict( X['intercept'] ))**2 ).mean()  )
    AIC.append(model.aic)
    BIC.append(model.bic)
    ADJ_R2.append(model.rsquared_adj)

    predictor_list.append(['intercept'] )
    num_predictor.append(len(['intercept'] )) 

######################################################################################################################################################

  # All possible models:

    #Looping over  1 to p predictors in X
    for k in tnrange(1, len(cols) + 1, desc = 'Loop...'):

        #Looping over all possible combinations: from p choose k
        for combo in itertools.combinations(cols , k):

            model = sm.OLS(y, X[ ['intercept'] + list(combo) ] ).fit()

            TRAIN_ERROR_MSE.append( ( (y - model.predict(X[  ['intercept'] + list(combo) ]))**2 ).mean()  )
            AIC.append(model.aic)
            BIC.append(model.bic)
            ADJ_R2.append(model.rsquared_adj)

            predictor_list.append(['intercept'] + list(combo))
            num_predictor.append(len(['intercept'] + list(combo)))   

######################################################################################################################################################

  #Store in DataFrame:

    Models = pd.DataFrame({"num_predictors": num_predictor, "model":predictor_list, 
                           "train_errors_MSE":TRAIN_ERROR_MSE, "AIC": AIC, "BIC":BIC,  "ADJ_R2":ADJ_R2})

    if (criteria == "AIC"):

        Models = Models.sort_values(by=["AIC"]).reset_index(drop=False)

        Final_Model = sm.OLS(y, X[ Models["model"][0] ]).fit() 
        
    elif (criteria == "BIC"):

        Models = Models.sort_values(by=["BIC"]).reset_index(drop=False)

        Final_Model = sm.OLS(y, X[ Models["model"][0] ]).fit() 

    elif (criteria == "ADJ_R2"):

        Models = Models.sort_values(by=["ADJ_R2"], ascending=False).reset_index(drop=False)
                  
        Final_Model = sm.OLS(y, X[ Models["model"][0] ]).fit() 

    elif (criteria == "train_errors_MSE"):

        Models = Models.sort_values(by=["train_errors_MSE"]).reset_index(drop=False)
                  
        Final_Model = sm.OLS(y, X[ Models["model"][0] ]).fit()
    
    elif ( criteria == "none"):

        Final_Model = "not compute, use some criteria (AIC, BIC, Adj.R2 or train_error_MSE)"
    

    return Models , Final_Model
```



<br>

Let's check how the function `BestSubset` works :


```python
Models , Final_Model = BestSubset (X , y, varchar_process="dummy_dropfirst", criteria="AIC")
```


 


```python
Models
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
      <th>num_predictors</th>
      <th>model</th>
      <th>train_errors_MSE</th>
      <th>AIC</th>
      <th>BIC</th>
      <th>ADJ_R2</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>165</td>
      <td>6</td>
      <td>[intercept, size_in_m_2, longitude, latitude, ...</td>
      <td>2.568593e+12</td>
      <td>59852.348316</td>
      <td>59885.661739</td>
      <td>6.963840e-01</td>
    </tr>
    <tr>
      <th>1</th>
      <td>222</td>
      <td>7</td>
      <td>[intercept, size_in_m_2, longitude, latitude, ...</td>
      <td>2.566132e+12</td>
      <td>59852.522224</td>
      <td>59891.387885</td>
      <td>6.965151e-01</td>
    </tr>
    <tr>
      <th>2</th>
      <td>250</td>
      <td>8</td>
      <td>[intercept, size_in_m_2, longitude, latitude, ...</td>
      <td>2.563718e+12</td>
      <td>59852.729811</td>
      <td>59897.147709</td>
      <td>6.966407e-01</td>
    </tr>
    <tr>
      <th>3</th>
      <td>93</td>
      <td>5</td>
      <td>[intercept, size_in_m_2, longitude, latitude, ...</td>
      <td>2.572226e+12</td>
      <td>59853.041370</td>
      <td>59880.802556</td>
      <td>6.961145e-01</td>
    </tr>
    <tr>
      <th>4</th>
      <td>224</td>
      <td>7</td>
      <td>[intercept, size_in_m_2, longitude, latitude, ...</td>
      <td>2.567521e+12</td>
      <td>59853.553086</td>
      <td>59892.418747</td>
      <td>6.963508e-01</td>
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
    </tr>
    <tr>
      <th>251</th>
      <td>20</td>
      <td>3</td>
      <td>[intercept, longitude, quality_2]</td>
      <td>8.452975e+12</td>
      <td>62115.508593</td>
      <td>62132.165305</td>
      <td>2.406893e-03</td>
    </tr>
    <tr>
      <th>252</th>
      <td>6</td>
      <td>2</td>
      <td>[intercept, quality_1]</td>
      <td>8.472054e+12</td>
      <td>62117.803515</td>
      <td>62128.907990</td>
      <td>6.806342e-04</td>
    </tr>
    <tr>
      <th>253</th>
      <td>0</td>
      <td>1</td>
      <td>[intercept]</td>
      <td>8.482279e+12</td>
      <td>62118.101353</td>
      <td>62123.653590</td>
      <td>-2.220446e-16</td>
    </tr>
    <tr>
      <th>254</th>
      <td>19</td>
      <td>3</td>
      <td>[intercept, longitude, quality_1]</td>
      <td>8.470115e+12</td>
      <td>62119.367625</td>
      <td>62136.024336</td>
      <td>3.839818e-04</td>
    </tr>
    <tr>
      <th>255</th>
      <td>2</td>
      <td>2</td>
      <td>[intercept, longitude]</td>
      <td>8.480269e+12</td>
      <td>62119.649822</td>
      <td>62130.754297</td>
      <td>-2.883659e-04</td>
    </tr>
  </tbody>
</table>
<p>256 rows × 7 columns</p>
</div>




```python
from IPython.display import HTML 

HTML(Models[0:7].to_html(classes='table table-striped'))
```




<table border="1" class="dataframe table table-striped">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>index</th>
      <th>num_predictors</th>
      <th>model</th>
      <th>train_errors_MSE</th>
      <th>AIC</th>
      <th>BIC</th>
      <th>ADJ_R2</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>165</td>
      <td>6</td>
      <td>[intercept, size_in_m_2, longitude, latitude, no_of_bedrooms, quality_2]</td>
      <td>2.568593e+12</td>
      <td>59852.348316</td>
      <td>59885.661739</td>
      <td>0.696384</td>
    </tr>
    <tr>
      <th>1</th>
      <td>222</td>
      <td>7</td>
      <td>[intercept, size_in_m_2, longitude, latitude, no_of_bedrooms, quality_1, quality_2]</td>
      <td>2.566132e+12</td>
      <td>59852.522224</td>
      <td>59891.387885</td>
      <td>0.696515</td>
    </tr>
    <tr>
      <th>2</th>
      <td>250</td>
      <td>8</td>
      <td>[intercept, size_in_m_2, longitude, latitude, no_of_bedrooms, quality_1, quality_2, quality_3]</td>
      <td>2.563718e+12</td>
      <td>59852.729811</td>
      <td>59897.147709</td>
      <td>0.696641</td>
    </tr>
    <tr>
      <th>3</th>
      <td>93</td>
      <td>5</td>
      <td>[intercept, size_in_m_2, longitude, latitude, no_of_bedrooms]</td>
      <td>2.572226e+12</td>
      <td>59853.041370</td>
      <td>59880.802556</td>
      <td>0.696114</td>
    </tr>
    <tr>
      <th>4</th>
      <td>224</td>
      <td>7</td>
      <td>[intercept, size_in_m_2, longitude, latitude, no_of_bedrooms, quality_2, quality_3]</td>
      <td>2.567521e+12</td>
      <td>59853.553086</td>
      <td>59892.418747</td>
      <td>0.696351</td>
    </tr>
    <tr>
      <th>5</th>
      <td>220</td>
      <td>7</td>
      <td>[intercept, size_in_m_2, longitude, latitude, no_of_bedrooms, no_of_bathrooms, quality_2]</td>
      <td>2.567841e+12</td>
      <td>59853.790633</td>
      <td>59892.656294</td>
      <td>0.696313</td>
    </tr>
    <tr>
      <th>6</th>
      <td>247</td>
      <td>8</td>
      <td>[intercept, size_in_m_2, longitude, latitude, no_of_bedrooms, no_of_bathrooms, quality_1, quality_2]</td>
      <td>2.565462e+12</td>
      <td>59854.024862</td>
      <td>59898.442760</td>
      <td>0.696434</td>
    </tr>
  </tbody>
</table>


<br>


So, the linear regression model selected with ***best subset*** algorithm and the $AIC$ criteria is saved in  `Final_Model`, and it is:

$price = intercept + size\_in\_m\_2 + longitude + latitude + no\_of\_bedrooms + quality\_2$


```python
print(Final_Model.summary())
```

                                OLS Regression Results                            
    ==============================================================================
    Dep. Variable:                  price   R-squared:                       0.697
    Model:                            OLS   Adj. R-squared:                  0.696
    Method:                 Least Squares   F-statistic:                     874.4
    Date:               vi., 07 oct. 2022   Prob (F-statistic):               0.00
    Time:                        02:06:23   Log-Likelihood:                -29920.
    No. Observations:                1905   AIC:                         5.985e+04
    Df Residuals:                    1899   BIC:                         5.989e+04
    Df Model:                           5                                         
    Covariance Type:            nonrobust                                         
    ==================================================================================
                         coef    std err          t      P>|t|      [0.025      0.975]
    ----------------------------------------------------------------------------------
    intercept      -6.098e+07   2.99e+07     -2.037      0.042    -1.2e+08   -2.26e+06
    size_in_m_2     3.553e+04    709.611     50.072      0.000    3.41e+04    3.69e+04
    longitude        -1.6e+06   6.85e+05     -2.336      0.020   -2.94e+06   -2.57e+05
    latitude        5.904e+06   7.58e+05      7.787      0.000    4.42e+06    7.39e+06
    no_of_bedrooms -8.811e+05   6.13e+04    -14.362      0.000      -1e+06   -7.61e+05
    quality_2       2.362e+05   1.44e+05      1.639      0.101   -4.64e+04    5.19e+05
    ==============================================================================
    Omnibus:                      777.615   Durbin-Watson:                   1.716
    Prob(Omnibus):                  0.000   Jarque-Bera (JB):            25332.769
    Skew:                           1.271   Prob(JB):                         0.00
    Kurtosis:                      20.683   Cond. No.                     1.34e+05
    ==============================================================================
    
    Notes:
    [1] Standard Errors assume that the covariance matrix of the errors is correctly specified.
    [2] The condition number is large, 1.34e+05. This might indicate that there are
    strong multicollinearity or other numerical problems.
    



<br>

Let us now try another criteria, for example $\widehat{R}^2$


```python
Models , Final_Model = BestSubset (X , y, varchar_process="dummy_dropfirst", criteria="ADJ_R2")
```




```python
from IPython.display import HTML 

HTML(Models[0:7].to_html(classes='table table-striped'))
```




<table border="1" class="dataframe table table-striped">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>index</th>
      <th>num_predictors</th>
      <th>model</th>
      <th>train_errors_MSE</th>
      <th>AIC</th>
      <th>BIC</th>
      <th>ADJ_R2</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>250</td>
      <td>8</td>
      <td>[intercept, size_in_m_2, longitude, latitude, no_of_bedrooms, quality_1, quality_2, quality_3]</td>
      <td>2.563718e+12</td>
      <td>59852.729811</td>
      <td>59897.147709</td>
      <td>0.696641</td>
    </tr>
    <tr>
      <th>1</th>
      <td>255</td>
      <td>9</td>
      <td>[intercept, size_in_m_2, longitude, latitude, no_of_bedrooms, no_of_bathrooms, quality_1, quality_2, quality_3]</td>
      <td>2.562773e+12</td>
      <td>59854.027050</td>
      <td>59903.997186</td>
      <td>0.696593</td>
    </tr>
    <tr>
      <th>2</th>
      <td>222</td>
      <td>7</td>
      <td>[intercept, size_in_m_2, longitude, latitude, no_of_bedrooms, quality_1, quality_2]</td>
      <td>2.566132e+12</td>
      <td>59852.522224</td>
      <td>59891.387885</td>
      <td>0.696515</td>
    </tr>
    <tr>
      <th>3</th>
      <td>247</td>
      <td>8</td>
      <td>[intercept, size_in_m_2, longitude, latitude, no_of_bedrooms, no_of_bathrooms, quality_1, quality_2]</td>
      <td>2.565462e+12</td>
      <td>59854.024862</td>
      <td>59898.442760</td>
      <td>0.696434</td>
    </tr>
    <tr>
      <th>4</th>
      <td>165</td>
      <td>6</td>
      <td>[intercept, size_in_m_2, longitude, latitude, no_of_bedrooms, quality_2]</td>
      <td>2.568593e+12</td>
      <td>59852.348316</td>
      <td>59885.661739</td>
      <td>0.696384</td>
    </tr>
    <tr>
      <th>5</th>
      <td>224</td>
      <td>7</td>
      <td>[intercept, size_in_m_2, longitude, latitude, no_of_bedrooms, quality_2, quality_3]</td>
      <td>2.567521e+12</td>
      <td>59853.553086</td>
      <td>59892.418747</td>
      <td>0.696351</td>
    </tr>
    <tr>
      <th>6</th>
      <td>220</td>
      <td>7</td>
      <td>[intercept, size_in_m_2, longitude, latitude, no_of_bedrooms, no_of_bathrooms, quality_2]</td>
      <td>2.567841e+12</td>
      <td>59853.790633</td>
      <td>59892.656294</td>
      <td>0.696313</td>
    </tr>
  </tbody>
</table>











<br>

### Best Subset Selection in `R` <a class="anchor" id="22"></a>


```r
%%R

# install.packages("olsrr")
```

    NULL
    


```r
%%R

model <- lm(price  ~ size_in_m_2  + longitude  + latitude + no_of_bedrooms  + no_of_bathrooms + quality , data = data_R)

ols_step_best_subset(model)
```

                                  Best Subsets Regression                               
    ------------------------------------------------------------------------------------
    Model Index    Predictors
    ------------------------------------------------------------------------------------
         1         size_in_m_2                                                           
         2         size_in_m_2 no_of_bedrooms                                            
         3         size_in_m_2 latitude no_of_bedrooms                                   
         4         size_in_m_2 latitude no_of_bedrooms quality                           
         5         size_in_m_2 longitude latitude no_of_bedrooms quality                 
         6         size_in_m_2 longitude latitude no_of_bedrooms no_of_bathrooms quality 
    ------------------------------------------------------------------------------------
    
                                                                     Subsets Regression Summary                                                                 
    ------------------------------------------------------------------------------------------------------------------------------------------------------------
                           Adj.        Pred                                                                                                                      
    Model    R-Square    R-Square    R-Square      C(p)         AIC           SBIC          SBC            MSEP            FPE               HSP           APC  
    ------------------------------------------------------------------------------------------------------------------------------------------------------------
      1        0.6538      0.6536      0.6477    271.3798    60101.2535    54694.5750    60117.9102    5.599622e+15     2.94252e+12    1545443750.0473    0.3469 
      2        0.6856      0.6853      0.6786     74.0667    59919.9272    54513.5621    59942.1362    5.088539e+15    2.675355e+12    1405127949.6494    0.3154 
      3        0.6959      0.6954      0.6885     11.3666    59858.4120    54452.2421    59886.1732    4.924268e+15    2.590344e+12    1360482104.0087    0.3054 
      4        0.6968      0.6959      0.6886      7.5502    59858.5970    54448.4541    59903.0149    4.911844e+15    2.587885e+12    1359194773.7428    0.3048 
      5        0.6978      0.6966      0.6892      3.6996    59854.7298    54444.6265    59904.6999     4.89932e+15    2.582639e+12    1356443622.2660    0.3042 
      6        0.6979      0.6966      0.6889      5.0000    59856.0271    54445.9376    59911.5494    4.900094e+15      2.5844e+12    1357373638.2137    0.3044 
    ------------------------------------------------------------------------------------------------------------------------------------------------------------
    AIC: Akaike Information Criteria 
     SBIC: Sawa's Bayesian Information Criteria 
     SBC: Schwarz Bayesian Criteria 
     MSEP: Estimated error of prediction, assuming multivariate normality 
     FPE: Final Prediction Error 
     HSP: Hocking's Sp 
     APC: Amemiya Prediction Criteria 
    
    



<br>



## Forward Selection <a class="anchor" id="23"></a>

Forward selection  consist in the following algorithm :

We have $p$ predictors: $X_1,...,X_p$ and a response variable $Y$

- We train the null linear model $(M_0)\\[0.25cm]$ 
  
- We train all the  linear models that are the result of *adding one predictor* to the model $M_0$ , and we select the one with **less** train error $(M_1^*)\\[0.25cm]$ 

- We train all the  linear models that are the result of *adding one predictor* to the model $M_1^*$ , and we select the one with **less** train error $(M_2^*) \\[0.25cm]$ 

 
  
  $\dots$ 

- We train all the linear models that are the result of *adding one predictor* to the model $M_{p-2}^*$ , and we select  the one with **less** train error   $(M_{p-1}^*)\\[0.25cm]$  

- We train the full linear model $(M_p)\\[0.25cm]$


- We select one of the models $\hspace{0.15cm} \lbrace M_0, M_1^*,M_2^*,...,M_{p-1}^*,M_p \rbrace \hspace{0.15cm}$ under some criteria, for example, the one with **less**  $AIC$, $BIC$ or $Cp \hspace{0.1cm}$, or **greater**  $\hspace{0.1cm} \widehat{R}^2$ 


<br>

**Scheme of the algorithm:**

- Train $M_0$

\vspace{1cm}

- Train $\lbrace  M_0 \hspace{0.1cm} \text{+ 1 predictor} \rbrace \underset{ \text{train  error} }{\Rightarrow}M_1^*$

\vspace{1cm}

- Train $\lbrace  M_1^* \hspace{0.1cm} \text{+ 1 predictor} \rbrace \underset{ \text{train  error} }{\Rightarrow}M_2^*$

 
$\hspace{0.8cm} \dots$

 
- Train $\lbrace  M_{p-2}^* \hspace{0.1cm} \text{+ 1 predictor} \rbrace \underset{ \text{train  error} }{\Rightarrow}M_{p-1}^*$

\vspace{1cm}

- Train $M_p$

\vspace{1cm}

- $\lbrace M_0, M_1^*, M_2^*, ..., M_{p-1}^*, M_p \rbrace \underset{ AIC, BIC, C_p, \widehat{R}^2 }{\Rightarrow} \hspace{0.1cm} M\hspace{0.05cm}^* \hspace{0.2cm} (Best \hspace{0.1cm} Model)$


<br>

Where:

$\lbrace  M_j \hspace{0.1cm} \text{+ 1 predictor} \rbrace \hspace{0.1cm}$ is the set of the linear regression models that are the result of adding one predictor to the model $M_j$





<br>

**Observation:**

Due to the characteristics of the Backward algorithm, it is true that:

$M_0 \subset M_1^* \subset M_2^* \subset M_3^* ,..., M_{p-1}^* \subset M_p$






<br>

 

**Why don't we select the final model using the train error?**

The train error of a linear regression model is defined as:

$$\text{Train Error} (M_j) = ECM_{train}(M_j) =
\dfrac{1}{n} \cdot RSS_{train}(M_j)$$

And it is fulfilled that:

$$RSS_{train}(M_0) > RSS_{train}(M_1^*) > RSS_{train}(M_2^*) > ... > RSS_{train}(M_{p-1}^*) > RSS_ {train}(M_p^*)$$

So:

$$\text{Train Error} (M_0) > \text{Train Error} (M_1^*) >\text{Train Error} (M_2^*)>...>\text{Train Error} (M_{p -1}^*)>\text{Train Error} (M_p)$$


So if the train error were used as a metric to select the final model, the largest model (the one with the most parameters, that is, the complete model $M_p$) would always be selected.

For this reason we don't select the final model using the training error.

Although this isn't true with the test error, for this reason the test error    could be used to select the final model.

<br>


<br>



### Forward Selection in `Python` <a class="anchor" id="24"></a>

We are going to develop the Forward algorithm in `Python` :


```python
def forward ( X, y, varchar_process="dummy_dropfirst", criteria="AIC" ):

        X = varcharProcessing(X , varchar_process = varchar_process)

        cols = X.columns.tolist()

        regressor = sm.OLS(y, X).fit()

        selected_cols = ["intercept"]

        other_cols = cols.copy()
        other_cols.remove("intercept")

        
        model = sm.OLS(y, X[selected_cols]).fit() 

        train_errors_MSE = [ ( (y - model.predict(X[ selected_cols ]))**2 ).mean()  ]

        Models = pd.DataFrame( [[ selected_cols[0], round(train_errors_MSE[0]), model.aic, model.bic, round(model.rsquared_adj, 4) ]] ,
                                 columns = ["model","train_error_MSE","AIC","BIC","Adj.R2"] )
        
  
############################################################################################################################################################################ 
     
        for i in range(X.shape[1] - 1):

                train_errors = pd.DataFrame(columns = ["Cols", "train_error_MSE"])

                for j in other_cols:

                        model = sm.OLS(y, X[ selected_cols + [j] ] ).fit()

                        train_error_MSE = ( (y - model.predict(X[ selected_cols + [j] ]))**2 ).mean()
                                              
                        train_errors = pd.concat( [train_errors, pd.DataFrame([[ j , train_error_MSE ]], columns = ["Cols","train_error_MSE"] ) ] )

                train_errors = train_errors.sort_values(by=["train_error_MSE"]).reset_index(drop=True)
                
                model = sm.OLS(y, X[ selected_cols + [train_errors["Cols"][0]] ]).fit()  

                train_error_MSE = ( (y - model.predict(X[ selected_cols + [train_errors["Cols"][0]] ]))**2 ).mean()

                train_errors_MSE.append( train_error_MSE )
                              
                selected_cols.append( train_errors["Cols"][0] )
                other_cols.remove( train_errors["Cols"][0] )

                Models = pd.concat([Models, pd.DataFrame([[ selected_cols[0:(i+2)] , round(train_errors_MSE[i+1]), model.aic, model.bic, round(model.rsquared_adj,5) ]], 
                                                            columns = ["model", "train_error_MSE", "AIC","BIC", "Adj.R2"]) ])        
                

 ############################################################################################################################################################################
              
        Models.index = range(0, len(Models))

        if (criteria == "AIC"):

                Models = Models.sort_values(by=["AIC"]).reset_index(drop=False)

                Final_Model = sm.OLS(y, X[ Models["model"][0] ]).fit() 
        
        elif (criteria == "BIC"):

                Models = Models.sort_values(by=["BIC"]).reset_index(drop=False)

                Final_Model = sm.OLS(y, X[ Models["model"][0] ]).fit() 

        elif (criteria == "Cp"):

                 Models = Models.sort_values(by=["Cp"]).reset_index(drop=False)

                 Final_Model = sm.OLS(y, X[ Models["model"][0] ]).fit() 

        elif (criteria == "Adj.R2"):

                  Models = Models.sort_values(by=["Adj.R2"], ascending=False).reset_index(drop=False)
                  
                  Final_Model = sm.OLS(y, X[ Models["model"][0] ]).fit() 

        elif (criteria == "train_error_MSE"):

                  Models = Models.sort_values(by=["train_error_MSE"]).reset_index(drop=False)
                  
                  Final_Model = sm.OLS(y, X[ Models["model"][0] ]).fit() 
        
        elif ( criteria == "none"):

                  Final_Model = "not compute, use some criteria (AIC, BIC, Adj.R2 or train_error_MSE)"


               
        return Models , Final_Model
```




```python
Models , Final_Model = forward(X, y, criteria="AIC")
```


```python
Models
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
      <th>model</th>
      <th>train_error_MSE</th>
      <th>AIC</th>
      <th>BIC</th>
      <th>Adj.R2</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>5</td>
      <td>[intercept, size_in_m_2, no_of_bedrooms, latit...</td>
      <td>2568592674038</td>
      <td>59852.348316</td>
      <td>59885.661739</td>
      <td>0.69638</td>
    </tr>
    <tr>
      <th>1</th>
      <td>6</td>
      <td>[intercept, size_in_m_2, no_of_bedrooms, latit...</td>
      <td>2566131657360</td>
      <td>59852.522224</td>
      <td>59891.387885</td>
      <td>0.69652</td>
    </tr>
    <tr>
      <th>2</th>
      <td>7</td>
      <td>[intercept, size_in_m_2, no_of_bedrooms, latit...</td>
      <td>2563718320541</td>
      <td>59852.729811</td>
      <td>59897.147709</td>
      <td>0.69664</td>
    </tr>
    <tr>
      <th>3</th>
      <td>4</td>
      <td>[intercept, size_in_m_2, no_of_bedrooms, latit...</td>
      <td>2572226401931</td>
      <td>59853.041370</td>
      <td>59880.802556</td>
      <td>0.69611</td>
    </tr>
    <tr>
      <th>4</th>
      <td>8</td>
      <td>[intercept, size_in_m_2, no_of_bedrooms, latit...</td>
      <td>2562772731258</td>
      <td>59854.027050</td>
      <td>59903.997186</td>
      <td>0.69659</td>
    </tr>
    <tr>
      <th>5</th>
      <td>3</td>
      <td>[intercept, size_in_m_2, no_of_bedrooms, latit...</td>
      <td>2579488352477</td>
      <td>59856.412019</td>
      <td>59878.620968</td>
      <td>0.69542</td>
    </tr>
    <tr>
      <th>6</th>
      <td>2</td>
      <td>[intercept, size_in_m_2, no_of_bedrooms]</td>
      <td>2666941699634</td>
      <td>59917.927231</td>
      <td>59934.583943</td>
      <td>0.68526</td>
    </tr>
    <tr>
      <th>7</th>
      <td>1</td>
      <td>[intercept, size_in_m_2]</td>
      <td>2936347992629</td>
      <td>60099.253467</td>
      <td>60110.357942</td>
      <td>0.65364</td>
    </tr>
    <tr>
      <th>8</th>
      <td>0</td>
      <td>intercept</td>
      <td>8482279037222</td>
      <td>62118.101353</td>
      <td>62123.653590</td>
      <td>-0.00000</td>
    </tr>
  </tbody>
</table>
</div>




```python
from IPython.display import HTML 

HTML(Models.to_html(classes='table table-striped'))
```




<table border="1" class="dataframe table table-striped">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>index</th>
      <th>model</th>
      <th>train_error_MSE</th>
      <th>AIC</th>
      <th>BIC</th>
      <th>Adj.R2</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>5</td>
      <td>[intercept, size_in_m_2, no_of_bedrooms, latitude, longitude, quality_2]</td>
      <td>2568592674038</td>
      <td>59852.348316</td>
      <td>59885.661739</td>
      <td>0.69638</td>
    </tr>
    <tr>
      <th>1</th>
      <td>6</td>
      <td>[intercept, size_in_m_2, no_of_bedrooms, latitude, longitude, quality_2, quality_1]</td>
      <td>2566131657360</td>
      <td>59852.522224</td>
      <td>59891.387885</td>
      <td>0.69652</td>
    </tr>
    <tr>
      <th>2</th>
      <td>7</td>
      <td>[intercept, size_in_m_2, no_of_bedrooms, latitude, longitude, quality_2, quality_1, quality_3]</td>
      <td>2563718320541</td>
      <td>59852.729811</td>
      <td>59897.147709</td>
      <td>0.69664</td>
    </tr>
    <tr>
      <th>3</th>
      <td>4</td>
      <td>[intercept, size_in_m_2, no_of_bedrooms, latitude, longitude]</td>
      <td>2572226401931</td>
      <td>59853.041370</td>
      <td>59880.802556</td>
      <td>0.69611</td>
    </tr>
    <tr>
      <th>4</th>
      <td>8</td>
      <td>[intercept, size_in_m_2, no_of_bedrooms, latitude, longitude, quality_2, quality_1, quality_3, no_of_bathrooms]</td>
      <td>2562772731258</td>
      <td>59854.027050</td>
      <td>59903.997186</td>
      <td>0.69659</td>
    </tr>
    <tr>
      <th>5</th>
      <td>3</td>
      <td>[intercept, size_in_m_2, no_of_bedrooms, latitude]</td>
      <td>2579488352477</td>
      <td>59856.412019</td>
      <td>59878.620968</td>
      <td>0.69542</td>
    </tr>
    <tr>
      <th>6</th>
      <td>2</td>
      <td>[intercept, size_in_m_2, no_of_bedrooms]</td>
      <td>2666941699634</td>
      <td>59917.927231</td>
      <td>59934.583943</td>
      <td>0.68526</td>
    </tr>
    <tr>
      <th>7</th>
      <td>1</td>
      <td>[intercept, size_in_m_2]</td>
      <td>2936347992629</td>
      <td>60099.253467</td>
      <td>60110.357942</td>
      <td>0.65364</td>
    </tr>
    <tr>
      <th>8</th>
      <td>0</td>
      <td>intercept</td>
      <td>8482279037222</td>
      <td>62118.101353</td>
      <td>62123.653590</td>
      <td>-0.00000</td>
    </tr>
  </tbody>
</table>


<br>


So, the linear regression model selected with ***forward*** algorithm and the $AIC$ criteria is saved in  `Final_Model`, and it is the same model that is selected with ***best subset*** algorithm  :

$$ price = intercept + size\_in\_m\_2 + longitude + latitude + no\_of\_bedrooms + quality\_2 $$



<br>



### Forward Selection in `R` <a class="anchor" id="25"></a>

We are going to use the `step` function, with which we can do a forward selection based on $AIC$ criteria in `R`


```r
%%R

model <- step( object = lm(price  ~ size_in_m_2  + longitude  + latitude + no_of_bedrooms  + no_of_bathrooms + quality , data = data_R), direction = "forward")

summary(model)
```

    Start:  AIC=54447.87
    price ~ size_in_m_2 + longitude + latitude + no_of_bedrooms + 
        no_of_bathrooms + quality
    
    
    Call:
    lm(formula = price ~ size_in_m_2 + longitude + latitude + no_of_bedrooms + 
        no_of_bathrooms + quality, data = data_R)
    
    Residuals:
          Min        1Q    Median        3Q       Max 
    -13398393   -562302     68143    562733  15384235 
    
    Coefficients:
                      Estimate Std. Error t value Pr(>|t|)    
    (Intercept)     -6.207e+07  2.995e+07  -2.073   0.0383 *  
    size_in_m_2      3.566e+04  7.238e+02  49.271  < 2e-16 ***
    longitude       -1.677e+06  6.908e+05  -2.428   0.0153 *  
    latitude         6.115e+06  7.809e+05   7.830 8.03e-15 ***
    no_of_bedrooms  -8.367e+05  8.282e+04 -10.102  < 2e-16 ***
    no_of_bathrooms -5.712e+04  6.829e+04  -0.836   0.4030    
    quality1         1.400e+05  8.358e+04   1.675   0.0940 .  
    quality2         3.406e+05  1.551e+05   2.196   0.0282 *  
    quality3         2.788e+05  1.976e+05   1.410   0.1586    
    ---
    Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    
    Residual standard error: 1605000 on 1896 degrees of freedom
    Multiple R-squared:  0.6979,	Adjusted R-squared:  0.6966 
    F-statistic: 547.4 on 8 and 1896 DF,  p-value: < 2.2e-16
    
    



 
We get different results in R and Python, this could be because the `step` function is using another version of the direct selection algorithm, or something similar. Also, our Python algorithms allow to consider models like price ~ size_in_m_2 + quality_2, while in R this is not possible, in R you have to include all the dummies associated to a categorical variable, so in that case, in R, just you could set price ~ size_in_m_2 + quality ( = price ~ size_in_m_2 + quality_1 + quality_2 + quality_3 in Python)

In this article I have focused mainly on Python, so I recommend use Python algorithms , since they have been developed from zero, taking all the care, and all the procedures have been exposed here, so that everyone can check it out.




Using  `olsrr` package :



```r
%%R 

model <- step( object = lm(price  ~ size_in_m_2  + longitude  + latitude + no_of_bedrooms  + no_of_bathrooms + quality , data = data_R), direction = "forward")

ols_step_forward_p(model)
```

    Start:  AIC=54447.87
    price ~ size_in_m_2 + longitude + latitude + no_of_bedrooms + 
        no_of_bathrooms + quality
    
    
                                       Selection Summary                                     
    ----------------------------------------------------------------------------------------
            Variable                        Adj.                                                
    Step       Entered        R-Square    R-Square      C(p)         AIC            RMSE        
    ----------------------------------------------------------------------------------------
       1    size_in_m_2         0.6538      0.6536    271.3798    60101.2535    1714477.7667    
       2    no_of_bedrooms      0.6856      0.6853     74.0667    59919.9272    1634364.7794    
       3    latitude            0.6959      0.6954     11.3666    59858.4120    1607767.3954    
       4    longitude           0.6968      0.6961      7.9940    59855.0414    1605925.0975    
       5    quality             0.6978      0.6966      3.6996    59854.7298    1604534.1988    
    ----------------------------------------------------------------------------------------
    



<br>



## Backward Selection <a class="anchor" id="26"></a>

Backward selection consist in the following algorithm :

We have $p$ predictors: $X_1,...,X_p$

- We train the full linear regression model $(M_p)$ 
  
- We train all the  linear models that are the result of removing one predictor to the model $M_p$ , and we select the one with **less** train error $(M_{p-1}^*)$ 


- We train all the linear models that are the result of removing one predictor to the model $M_{p-1}^*$ , and we select the one with **less** train error $(M_{p-2}^*)$ 
  
   $\dots$ 

- We train all the linear models that are the result of removing one predictor to the model $M_{2}^*$ , and we select the   one with **less** train error    $(M_{1}^*)$  

- We train the null linear model $(M_0)$


- We select one of the models $\hspace{0.1cm}\lbrace M_0,M_1,...,M_{p-1},M_p \rbrace\hspace{0.1cm}$ under some criteria, for example, the one with **less** $AIC$, $BIC$ or $Cp \hspace{0.1cm}$, or **greater**  $\hspace{0.1cm} \widehat{R}^2$  


<br>

**Scheme of the algorithm:**

- Train  $M_p$

\vspace{1cm}

- Train $\lbrace  M_p \hspace{0.1cm} - \text{1 predictor} \rbrace \underset{ \text{train  error} }{\Rightarrow}M_{p-1}^*$

\vspace{1cm}

- Train $\lbrace  M_{p-1}^* \hspace{0.1cm} - \text{1 predictor} \rbrace \underset{ \text{train  error} }{\Rightarrow}M_{p-2}^*$


$\hspace{0.8cm} \dots$

\vspace{1cm}

- Train $\lbrace  M_{2}^* \hspace{0.1cm} - \text{1 predictor} \rbrace \underset{ \text{train  error} }{\Rightarrow}M_{1}^*$

\vspace{1cm}

- $M_0$

\vspace{1cm}

- $\lbrace M_0, M_1^* ,M_2^*, ...,M_{p-1}^*, M_p \rbrace \underset{\hspace{0.15cm} AIC, BIC, C_p, \widehat{R}^2 \hspace{0.15cm}}{\Rightarrow} \hspace{0.1cm} M\hspace{0.05cm}^* \hspace{0.2cm} (Best \hspace{0.1cm} Model)$


<br>

**Observation:**

Due to the characteristics of the Backward algorithm, it is true that:

$M_0 \subset M_1^* \subset M_2^* \subset M_3^* ,..., M_{p-1}^* \subset M_p$


<br>

**Why don't we select the final model using the training error?**

The train error of a linear regression model is defined as:

$$\text{Train Error} (M_j) = ECM_{train}(M_j) =
\dfrac{1}{n} \cdot RSS_{train}(M_j)$$

And it is fulfilled that:

$$RSS_{train}(M_0) > RSS_{train}(M_1^*) > RSS_{train}(M_2^*) > ... > RSS_{train}(M_{p-1}^*) > RSS_ {train}(M_p^*)$$

So:

$$\text{Train Error} (M_0) > \text{Train Error} (M_1^*) >\text{Train Error} (M_2^*)>...>\text{Train Error} (M_{p -1}^*)>\text{Train Error} (M_p)$$


So if the train error were used as a metric to select the final model, the largest model (the one with the most parameters, that is, the complete model $M_p$) would always be selected.

For this reason we don't select the final model using the training error.

Although this isn't true with the test error, for this reason the test error    could be used to select the final model.

<br>


<br>



### Backward Selection in `Python` <a class="anchor" id="27"></a>

We are going to develop the Backward algorithm in `Python` :


```python
from multiprocessing.resource_sharer import stop


def backward ( X,y, varchar_process="dummy_dropfirst", criteria="AIC"):

        X = varcharProcessing(X , varchar_process = varchar_process)

        cols = X.columns.tolist()

        regressor = sm.OLS(y, X).fit()

        selected_cols = cols.copy()

        other_cols = cols.copy()
        other_cols.remove("intercept")

        predictor_out = [ ]

        predictor_out_reversed = []

        
        model = sm.OLS(y, X[selected_cols]).fit() 

        train_errors_MSE = [ ( (y - model.predict(X[ selected_cols ]))**2 ).mean()  ]

        Models = pd.DataFrame([[ round(train_errors_MSE[0]) , model.aic, model.bic, round(model.rsquared_adj, 4) ]], 
                                 columns = ["train_error_MSE","AIC","BIC", "Adj.R2"])
        
  
 ######################################################################################  
       
        for i in range(X.shape[1]-1):

                train_errors = pd.DataFrame(columns = ["Cols", "train_error_MSE"])

                for j in other_cols:

                        selected_cols.remove(j)

                        model = sm.OLS(y, X[ selected_cols ] ).fit()

                        train_error_MSE = ( (y - model.predict(X[ selected_cols ]))**2 ).mean()
                                             
                        train_errors = pd.concat( [train_errors, pd.DataFrame([[ j , train_error_MSE ]], columns = ["Cols", "train_error_MSE"] ) ] )

                        selected_cols.append(j)

                train_errors = train_errors.sort_values(by=["train_error_MSE"]).reset_index(drop=True)
                
                selected_cols.remove(train_errors["Cols"][0])

                predictor_out.append(train_errors["Cols"][0])

                model = sm.OLS(y, X[ selected_cols ]).fit()  

                train_error_MSE = ( (y - model.predict(X[ selected_cols ]))**2 ).mean()

                train_errors_MSE.append( train_error_MSE )
                              
                other_cols.remove( train_errors["Cols"][0] )


                Models = pd.concat([Models, pd.DataFrame([[ round(train_errors_MSE[i+1]), model.aic, model.bic, round(model.rsquared_adj,5) ]], 
                                                            columns = ["train_error_MSE", "AIC","BIC", "Adj.R2"]) ])        

##################################################################################################

        Models.index = range(0,X.shape[1])


        idx = len(predictor_out + ['intercept']) - 1
        newList = []
        
        while (idx >= 0):
                predictor_out_reversed.append((predictor_out + ['intercept'])[idx])
                idx = idx - 1


        a = pd.Series([])
        
        for i in range(X.shape[1]):

                a[i] =  predictor_out_reversed[0:(len(cols)-i)] 


        Models = pd.concat([pd.DataFrame({'model': a}) , Models],  axis=1)

################################################################################################


        if (criteria == "AIC"):

                Models = Models.sort_values(by=["AIC"]).reset_index(drop=False)

                Final_Model = sm.OLS(y, X[ Models["model"][0] ]).fit() 
        
        elif (criteria == "BIC"):

                Models = Models.sort_values(by=["BIC"]).reset_index(drop=False)

                Final_Model = sm.OLS(y, X[ Models["model"][0] ]).fit() 

        elif (criteria == "Adj.R2"):

                  Models = Models.sort_values(by=["Adj.R2"], ascending=False).reset_index(drop=False)
                  
                  Final_Model = sm.OLS(y, X[ Models["model"][0] ]).fit() 

        elif (criteria == "train_error_MSE"):

                  Models = Models.sort_values(by=["train_error_MSE"]).reset_index(drop=False)
                  
                  Final_Model = sm.OLS(y, X[ Models["model"][0] ]).fit() 
        
        elif ( criteria == "none"):

                Final_Model = "not compute, use some criteria (AIC, BIC, Adj.R2 or train_error_MSE)"


        return Models , Final_Model
```




```python
Models , Final_Model = backward ( X , y, varchar_process="dummy_dropfirst", criteria="AIC")
```


```python
Models
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
      <th>model</th>
      <th>train_error_MSE</th>
      <th>AIC</th>
      <th>BIC</th>
      <th>Adj.R2</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>3</td>
      <td>[intercept, size_in_m_2, no_of_bedrooms, latit...</td>
      <td>2568592674038</td>
      <td>59852.348316</td>
      <td>59885.661739</td>
      <td>0.69638</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>[intercept, size_in_m_2, no_of_bedrooms, latit...</td>
      <td>2566131657360</td>
      <td>59852.522224</td>
      <td>59891.387885</td>
      <td>0.69652</td>
    </tr>
    <tr>
      <th>2</th>
      <td>1</td>
      <td>[intercept, size_in_m_2, no_of_bedrooms, latit...</td>
      <td>2563718320541</td>
      <td>59852.729811</td>
      <td>59897.147709</td>
      <td>0.69664</td>
    </tr>
    <tr>
      <th>3</th>
      <td>4</td>
      <td>[intercept, size_in_m_2, no_of_bedrooms, latit...</td>
      <td>2572226401931</td>
      <td>59853.041370</td>
      <td>59880.802556</td>
      <td>0.69611</td>
    </tr>
    <tr>
      <th>4</th>
      <td>0</td>
      <td>[intercept, size_in_m_2, no_of_bedrooms, latit...</td>
      <td>2562772731258</td>
      <td>59854.027050</td>
      <td>59903.997186</td>
      <td>0.69660</td>
    </tr>
    <tr>
      <th>5</th>
      <td>5</td>
      <td>[intercept, size_in_m_2, no_of_bedrooms, latit...</td>
      <td>2579488352477</td>
      <td>59856.412019</td>
      <td>59878.620968</td>
      <td>0.69542</td>
    </tr>
    <tr>
      <th>6</th>
      <td>6</td>
      <td>[intercept, size_in_m_2, no_of_bedrooms]</td>
      <td>2666941699634</td>
      <td>59917.927231</td>
      <td>59934.583943</td>
      <td>0.68526</td>
    </tr>
    <tr>
      <th>7</th>
      <td>7</td>
      <td>[intercept, size_in_m_2]</td>
      <td>2936347992629</td>
      <td>60099.253467</td>
      <td>60110.357942</td>
      <td>0.65364</td>
    </tr>
    <tr>
      <th>8</th>
      <td>8</td>
      <td>[intercept]</td>
      <td>8482279037222</td>
      <td>62118.101353</td>
      <td>62123.653590</td>
      <td>-0.00000</td>
    </tr>
  </tbody>
</table>
</div>




```python
from IPython.display import HTML 

HTML(Models.to_html(classes='table table-striped'))
```




<table border="1" class="dataframe table table-striped">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>index</th>
      <th>model</th>
      <th>train_error_MSE</th>
      <th>AIC</th>
      <th>BIC</th>
      <th>Adj.R2</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>3</td>
      <td>[intercept, size_in_m_2, no_of_bedrooms, latitude, longitude, quality_2]</td>
      <td>2568592674038</td>
      <td>59852.348316</td>
      <td>59885.661739</td>
      <td>0.69638</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>[intercept, size_in_m_2, no_of_bedrooms, latitude, longitude, quality_2, quality_1]</td>
      <td>2566131657360</td>
      <td>59852.522224</td>
      <td>59891.387885</td>
      <td>0.69652</td>
    </tr>
    <tr>
      <th>2</th>
      <td>1</td>
      <td>[intercept, size_in_m_2, no_of_bedrooms, latitude, longitude, quality_2, quality_1, quality_3]</td>
      <td>2563718320541</td>
      <td>59852.729811</td>
      <td>59897.147709</td>
      <td>0.69664</td>
    </tr>
    <tr>
      <th>3</th>
      <td>4</td>
      <td>[intercept, size_in_m_2, no_of_bedrooms, latitude, longitude]</td>
      <td>2572226401931</td>
      <td>59853.041370</td>
      <td>59880.802556</td>
      <td>0.69611</td>
    </tr>
    <tr>
      <th>4</th>
      <td>0</td>
      <td>[intercept, size_in_m_2, no_of_bedrooms, latitude, longitude, quality_2, quality_1, quality_3, no_of_bathrooms]</td>
      <td>2562772731258</td>
      <td>59854.027050</td>
      <td>59903.997186</td>
      <td>0.69660</td>
    </tr>
    <tr>
      <th>5</th>
      <td>5</td>
      <td>[intercept, size_in_m_2, no_of_bedrooms, latitude]</td>
      <td>2579488352477</td>
      <td>59856.412019</td>
      <td>59878.620968</td>
      <td>0.69542</td>
    </tr>
    <tr>
      <th>6</th>
      <td>6</td>
      <td>[intercept, size_in_m_2, no_of_bedrooms]</td>
      <td>2666941699634</td>
      <td>59917.927231</td>
      <td>59934.583943</td>
      <td>0.68526</td>
    </tr>
    <tr>
      <th>7</th>
      <td>7</td>
      <td>[intercept, size_in_m_2]</td>
      <td>2936347992629</td>
      <td>60099.253467</td>
      <td>60110.357942</td>
      <td>0.65364</td>
    </tr>
    <tr>
      <th>8</th>
      <td>8</td>
      <td>[intercept]</td>
      <td>8482279037222</td>
      <td>62118.101353</td>
      <td>62123.653590</td>
      <td>-0.00000</td>
    </tr>
  </tbody>
</table>


<br>


So, the linear regression model selected with ***backward*** algorithm and the $AIC$ criteria is saved in  `Final_Model`, and it is the same model that is selected with ***best subset*** and ***forward*** algorithms  :

$$ price = intercept + size\_in\_m\_2 + longitude + latitude + no\_of\_bedrooms + quality\_2 $$




<br>

```python
Models , Final_Model = backward ( X , y, varchar_process="dummy_dropfirst", criteria="none")
```


```python
HTML(Models.to_html(classes='table table-striped'))
```




<table border="1" class="dataframe table table-striped">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>model</th>
      <th>train_error_MSE</th>
      <th>AIC</th>
      <th>BIC</th>
      <th>Adj.R2</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>[intercept, size_in_m_2, no_of_bedrooms, latitude, longitude, quality_2, quality_1, quality_3, no_of_bathrooms]</td>
      <td>2562772731258</td>
      <td>59854.027050</td>
      <td>59903.997186</td>
      <td>0.69660</td>
    </tr>
    <tr>
      <th>1</th>
      <td>[intercept, size_in_m_2, no_of_bedrooms, latitude, longitude, quality_2, quality_1, quality_3]</td>
      <td>2563718320541</td>
      <td>59852.729811</td>
      <td>59897.147709</td>
      <td>0.69664</td>
    </tr>
    <tr>
      <th>2</th>
      <td>[intercept, size_in_m_2, no_of_bedrooms, latitude, longitude, quality_2, quality_1]</td>
      <td>2566131657360</td>
      <td>59852.522224</td>
      <td>59891.387885</td>
      <td>0.69652</td>
    </tr>
    <tr>
      <th>3</th>
      <td>[intercept, size_in_m_2, no_of_bedrooms, latitude, longitude, quality_2]</td>
      <td>2568592674038</td>
      <td>59852.348316</td>
      <td>59885.661739</td>
      <td>0.69638</td>
    </tr>
    <tr>
      <th>4</th>
      <td>[intercept, size_in_m_2, no_of_bedrooms, latitude, longitude]</td>
      <td>2572226401931</td>
      <td>59853.041370</td>
      <td>59880.802556</td>
      <td>0.69611</td>
    </tr>
    <tr>
      <th>5</th>
      <td>[intercept, size_in_m_2, no_of_bedrooms, latitude]</td>
      <td>2579488352477</td>
      <td>59856.412019</td>
      <td>59878.620968</td>
      <td>0.69542</td>
    </tr>
    <tr>
      <th>6</th>
      <td>[intercept, size_in_m_2, no_of_bedrooms]</td>
      <td>2666941699634</td>
      <td>59917.927231</td>
      <td>59934.583943</td>
      <td>0.68526</td>
    </tr>
    <tr>
      <th>7</th>
      <td>[intercept, size_in_m_2]</td>
      <td>2936347992629</td>
      <td>60099.253467</td>
      <td>60110.357942</td>
      <td>0.65364</td>
    </tr>
    <tr>
      <th>8</th>
      <td>[intercept]</td>
      <td>8482279037222</td>
      <td>62118.101353</td>
      <td>62123.653590</td>
      <td>-0.00000</td>
    </tr>
  </tbody>
</table>




```python
Final_Model
```




    'not compute, use some criteria (AIC, BIC, Adj.R2 or train_error_MSE)'





<br>



### Backward Selection in `R` <a class="anchor" id="28"></a>

We are going to use the `step` function, with which we can do a backward selection based on $AIC$ criteria in `R`


```r
%%R

Modelo_Backward <- step( object = lm(price  ~ size_in_m_2  + longitude  + latitude + no_of_bedrooms  + no_of_bathrooms + quality , data = data_R), direction = "backward")

summary(Modelo_Backward)
```

    Start:  AIC=54447.87
    price ~ size_in_m_2 + longitude + latitude + no_of_bedrooms + 
        no_of_bathrooms + quality
    
                      Df  Sum of Sq        RSS   AIC
    - no_of_bathrooms  1 1.8013e+12 4.8839e+15 54447
    <none>                          4.8821e+15 54448
    - quality          3 1.6585e+13 4.8987e+15 54448
    - longitude        1 1.5178e+13 4.8973e+15 54452
    - latitude         1 1.5788e+14 5.0400e+15 54507
    - no_of_bedrooms   1 2.6279e+14 5.1449e+15 54546
    - size_in_m_2      1 6.2511e+15 1.1133e+16 56016
    
    Step:  AIC=54446.57
    price ~ size_in_m_2 + longitude + latitude + no_of_bedrooms + 
        quality
    
                     Df  Sum of Sq        RSS   AIC
    <none>                         4.8839e+15 54447
    - quality         3 1.6208e+13 4.9001e+15 54447
    - longitude       1 1.5065e+13 4.8989e+15 54450
    - latitude        1 1.5635e+14 5.0402e+15 54505
    - no_of_bedrooms  1 5.3313e+14 5.4170e+15 54642
    - size_in_m_2     1 6.4504e+15 1.1334e+16 56048
    
    Call:
    lm(formula = price ~ size_in_m_2 + longitude + latitude + no_of_bedrooms + 
        quality, data = data_R)
    
    Residuals:
          Min        1Q    Median        3Q       Max 
    -13418383   -574312     64228    566609  15408236 
    
    Coefficients:
                     Estimate Std. Error t value Pr(>|t|)    
    (Intercept)    -6.140e+07  2.993e+07  -2.051   0.0404 *  
    size_in_m_2     3.555e+04  7.102e+02  50.055  < 2e-16 ***
    longitude      -1.671e+06  6.907e+05  -2.419   0.0157 *  
    latitude        6.072e+06  7.792e+05   7.793 1.07e-14 ***
    no_of_bedrooms -8.832e+05  6.137e+04 -14.390  < 2e-16 ***
    quality1        1.402e+05  8.357e+04   1.677   0.0936 .  
    quality2        3.398e+05  1.551e+05   2.190   0.0286 *  
    quality3        2.629e+05  1.967e+05   1.336   0.1816    
    ---
    Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    
    Residual standard error: 1605000 on 1897 degrees of freedom
    Multiple R-squared:  0.6978,	Adjusted R-squared:  0.6966 
    F-statistic: 625.6 on 7 and 1897 DF,  p-value: < 2.2e-16
    
    



Using  `olsrr` package :



```r
%%R 

model <- step( object = lm(price  ~ size_in_m_2  + longitude  + latitude + no_of_bedrooms  + no_of_bathrooms + quality , data = data_R), direction = "forward")

ols_step_backward_p(model)
```

    Start:  AIC=54447.87
    price ~ size_in_m_2 + longitude + latitude + no_of_bedrooms + 
        no_of_bathrooms + quality
    
    
    
                                      Elimination Summary                                   
    ---------------------------------------------------------------------------------------
            Variable                         Adj.                                              
    Step        Removed        R-Square    R-Square     C(p)        AIC            RMSE        
    ---------------------------------------------------------------------------------------
       1    no_of_bathrooms      0.6978      0.6966    3.6996    59854.7298    1604534.1988    
    ---------------------------------------------------------------------------------------
    





<br>



# Bibliography

 

Carter, N.   *How to Data*.  https://nathancarter.github.io/how2data/site/
 
Talha Hascelik, S. python_stepwiseSelection. *GitHub repository*.  https://github.com/talhahascelik/python_stepwiseSelection/blob/master/stepwiseSelection.py


Crouser , J. (2016). Model Selection.    http://www.science.smith.edu/~jcrouser/SDS293/labs/lab8-py.html

Taylor , J.  *Model Selection: General Techniques* [Presentación de PowerPoint]. Stanford University. https://statweb.stanford.edu/~jtaylo/courses/stats203/notes/selection.pdf


Bourret Sicotte, X. (11 June 2018). Choosing the optimal model: Subset selection. *xavierbourretsicotte*.  https://xavierbourretsicotte.github.io/subset_selection.html#Comparing-models:-AIC,-BIC,-Mallows'CP

 
Faraway, J (2015). *Linear Models with R* (second edition). CRC Press.

Benitez Peña, S. (2021). *El Modelo de Regresión Lineal Simple* [Presentación de PowerPoint]. Aula Global UC3M.

