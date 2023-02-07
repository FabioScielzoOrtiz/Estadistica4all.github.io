---
title: 'Exploratory Data Analysis'
author: 'Fabio Scielzo Ortiz'
date: '25/02/23'
output: 
   rmdformats::readthedown:
      use_bookdown: true
      self_contained: true
      thumbnails: true
      lightbox: true
      gallery: true
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


$\hspace{0.3cm}$ **More articles:    $\hspace{0.1cm}$ [Estadistica4all](https://fabioscielzoortiz.github.io/Estadistica4all.github.io/)**

$\hspace{0.3cm}$ **Author:** $\hspace{0.1cm}$ [Fabio Scielzo Ortiz](http://estadistica4all.com/autores/autores.html)

$\hspace{0.3cm}$ **If you use this article, please, reference it:** 

$\hspace{0.5cm}$ Scielzo Ortiz, Fabio. (2023). Exploratory Data Analysis. http://estadistica4all.com/Articulos/EDA.html


</p>
 
</p></span>
</div>


***It's recommended to open the article on a computer or tablet.***
 
 
 
 
 <br>
 
 

# Exploratory Data Analysis (EDA) <a class="anchor" id="1"></a>

Exploratory data analysis (EDA) refers to the descriptive statistical analysis of a data-set. 

Next we are going to propose a methodology to carry out an EDA, using Python as programming lenguage.



# Data Pre-processing

## Import data-set

First of all, we import the data-set with which we will work.

```python
import pandas as pd

Netflix_Data = pd.read_csv('titles.csv')
```


```python
Netflix_Data
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
      <th>id</th>
      <th>title</th>
      <th>type</th>
      <th>description</th>
      <th>release_year</th>
      <th>age_certification</th>
      <th>runtime</th>
      <th>genres</th>
      <th>production_countries</th>
      <th>seasons</th>
      <th>imdb_id</th>
      <th>imdb_score</th>
      <th>imdb_votes</th>
      <th>tmdb_popularity</th>
      <th>tmdb_score</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>ts300399</td>
      <td>Five Came Back: The Reference Films</td>
      <td>SHOW</td>
      <td>This collection includes 12 World War II-era p...</td>
      <td>1945.0</td>
      <td>TV-MA</td>
      <td>51</td>
      <td>['documentation']</td>
      <td>['US']</td>
      <td>1.0</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>0.600</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>1</th>
      <td>tm84618</td>
      <td>Taxi Driver</td>
      <td>MOVIE</td>
      <td>A mentally unstable Vietnam War veteran works ...</td>
      <td>1976.0</td>
      <td>R</td>
      <td>114</td>
      <td>['drama', 'crime']</td>
      <td>['US']</td>
      <td>NaN</td>
      <td>tt0075314</td>
      <td>8.2</td>
      <td>808582.0</td>
      <td>40.965</td>
      <td>8.179</td>
    </tr>
    <tr>
      <th>2</th>
      <td>tm154986</td>
      <td>Deliverance</td>
      <td>MOVIE</td>
      <td>Intent on seeing the Cahulawassee River before...</td>
      <td>1972.0</td>
      <td>R</td>
      <td>109</td>
      <td>['drama', 'action', 'thriller', 'european']</td>
      <td>['US']</td>
      <td>NaN</td>
      <td>tt0068473</td>
      <td>7.7</td>
      <td>107673.0</td>
      <td>10.010</td>
      <td>7.300</td>
    </tr>
    <tr>
      <th>3</th>
      <td>tm127384</td>
      <td>Monty Python and the Holy Grail</td>
      <td>MOVIE</td>
      <td>King Arthur, accompanied by his squire, recrui...</td>
      <td>1975.0</td>
      <td>PG</td>
      <td>91</td>
      <td>['fantasy', 'action', 'comedy']</td>
      <td>['GB']</td>
      <td>NaN</td>
      <td>tt0071853</td>
      <td>8.2</td>
      <td>534486.0</td>
      <td>15.461</td>
      <td>7.811</td>
    </tr>
    <tr>
      <th>4</th>
      <td>tm120801</td>
      <td>The Dirty Dozen</td>
      <td>MOVIE</td>
      <td>12 American military prisoners in World War II...</td>
      <td>1967.0</td>
      <td>NaN</td>
      <td>150</td>
      <td>['war', 'action']</td>
      <td>['GB', 'US']</td>
      <td>NaN</td>
      <td>tt0061578</td>
      <td>7.7</td>
      <td>72662.0</td>
      <td>20.398</td>
      <td>7.600</td>
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
    </tr>
    <tr>
      <th>5845</th>
      <td>tm1014599</td>
      <td>Fine Wine</td>
      <td>MOVIE</td>
      <td>A beautiful love story that can happen between...</td>
      <td>2021.0</td>
      <td>NaN</td>
      <td>100</td>
      <td>['romance', 'drama']</td>
      <td>['NG']</td>
      <td>NaN</td>
      <td>tt13857480</td>
      <td>6.8</td>
      <td>45.0</td>
      <td>1.466</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>5846</th>
      <td>tm898842</td>
      <td>C/O Kaadhal</td>
      <td>MOVIE</td>
      <td>A heart warming film that explores the concept...</td>
      <td>2021.0</td>
      <td>NaN</td>
      <td>134</td>
      <td>['drama']</td>
      <td>[]</td>
      <td>NaN</td>
      <td>tt11803618</td>
      <td>7.7</td>
      <td>348.0</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>5847</th>
      <td>tm1059008</td>
      <td>Lokillo</td>
      <td>MOVIE</td>
      <td>A controversial TV host and comedian who has b...</td>
      <td>2021.0</td>
      <td>NaN</td>
      <td>90</td>
      <td>['comedy']</td>
      <td>['CO']</td>
      <td>NaN</td>
      <td>tt14585902</td>
      <td>3.8</td>
      <td>68.0</td>
      <td>26.005</td>
      <td>6.300</td>
    </tr>
    <tr>
      <th>5848</th>
      <td>tm1035612</td>
      <td>Dad Stop Embarrassing Me - The Afterparty</td>
      <td>MOVIE</td>
      <td>Jamie Foxx, David Alan Grier and more from the...</td>
      <td>2021.0</td>
      <td>PG-13</td>
      <td>37</td>
      <td>[]</td>
      <td>['US']</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>1.296</td>
      <td>10.000</td>
    </tr>
    <tr>
      <th>5849</th>
      <td>ts271048</td>
      <td>Mighty Little Bheem: Kite Festival</td>
      <td>SHOW</td>
      <td>With winter behind them, Bheem and his townspe...</td>
      <td>2021.0</td>
      <td>NaN</td>
      <td>7</td>
      <td>['family', 'animation', 'comedy']</td>
      <td>[]</td>
      <td>1.0</td>
      <td>tt13711094</td>
      <td>7.8</td>
      <td>18.0</td>
      <td>2.289</td>
      <td>10.000</td>
    </tr>
  </tbody>
</table>
<p>5850 rows × 15 columns</p>
</div>


<br>

## Data-set conceptual description

This data-set has information about 15 variables on 5850 Netflix titles.
 
Next table has a brief conceptual description about data-set variables:



|      Variable           |          Descripción   |  Tipo  |
|:------------------------:|:---------------------:|:---------------------:|
| id   |The title ID on JustWatch | Identifier  |
| title | The name of the title | Text |
| type    |TV show or movie  | Categorical |
|  description |A brief description | Text |
|  release_year   | release year | Quantitative |
| age_certification  |  age rating   | Categorical |
|  runtime   |  the number of episodes (show), the duration time in minutes (movie)   | Quantitative |
|  genres | A list of genres    |Categorical |
| production_countries    |   A list of countries that produced the title     | Categorical |
|  seasons |     Number of seasons if it's a SHOW   | Quantitative |
| imdb_id    |   The title ID on IMDB      | Identifier |
|  imdb_score |   Rating on IMDB   | Quantitative |
|  imdb_votes   |     number of votes on IMDB    | Quantitative |
| tmdb_popularity  |   Popularity on TMDB | Quantitative |
| tmdb_score  |   Rating on TMDB    | Quantitative |

 
<br>

## Data-set size

We can get the data-set size as the number of rows and columns of the data-set.

```python
Netflix_Data.shape
```

    (5850, 15)


As discussed above, the data-set has 5850 rows and 15 columns.


<br>


## info() method


```python
Netflix_Data.info()
```

    <class 'pandas.core.frame.DataFrame'>
    RangeIndex: 5850 entries, 0 to 5849
    Data columns (total 15 columns):
     #   Column                Non-Null Count  Dtype  
    ---  ------                --------------  -----  
     0   id                    5850 non-null   object 
     1   title                 5849 non-null   object 
     2   type                  5850 non-null   object 
     3   description           5832 non-null   object 
     4   release_year          5850 non-null   int64  
     5   age_certification     3231 non-null   object 
     6   runtime               5850 non-null   int64  
     7   genres                5850 non-null   object 
     8   production_countries  5850 non-null   object 
     9   seasons               2106 non-null   float64
     10  imdb_id               5447 non-null   object 
     11  imdb_score            5368 non-null   float64
     12  imdb_votes            5352 non-null   float64
     13  tmdb_popularity       5759 non-null   float64
     14  tmdb_score            5539 non-null   float64
    dtypes: float64(5), int64(2), object(8)
    memory usage: 685.7+ KB
    

info() method give us column names, number of non null values in each column and column type.


<br>

## Column types

There is another way to get column types.


```python
Netflix_Data.dtypes
```




    id                       object
    title                    object
    type                     object
    description              object
    release_year              int64
    age_certification        object
    runtime                   int64
    genres                   object
    production_countries     object
    seasons                 float64
    imdb_id                  object
    imdb_score              float64
    imdb_votes              float64
    tmdb_popularity         float64
    tmdb_score              float64
    dtype: object




 
`Object` is the typical type of categorical variables, identifier or text. 

`Float64` and `int64` is the typical type of quantitative variables, `float64` for continuous one, and `int64` for discrete one.


<br>


## Change column types

We can change the type of a column with `astype()` method:

```python
Netflix_Data['release_year'] = Netflix_Data['release_year'].astype('float')
```

We can check if the changes have been done correctly:
```python
Netflix_Data.dtypes
```




    id                       object
    title                    object
    type                     object
    description              object
    release_year            float64
    age_certification        object
    runtime                   int64
    genres                   object
    production_countries     object
    seasons                 float64
    imdb_id                  object
    imdb_score              float64
    imdb_votes              float64
    tmdb_popularity         float64
    tmdb_score              float64
    dtype: object





<br>

## Unique values of a variable








<br>

## NaN identification   

A NaN is a not a number value. NaN is equivalent to missing value.

We are going to calculate, for each variable, the proportion of missing values over the total number of observations:

```python
Prop_NA = Netflix_Data.isnull().sum() / len(Netflix_Data)

Prop_NA
```


    id                      0.000000
    title                   0.000171
    type                    0.000000
    description             0.003077
    release_year            0.000000
    age_certification       0.447692
    runtime                 0.000000
    genres                  0.000000
    production_countries    0.000000
    seasons                 0.640000
    imdb_id                 0.068889
    imdb_score              0.082393
    imdb_votes              0.085128
    tmdb_popularity         0.015556
    tmdb_score              0.053162
    dtype: float64




We can see that there are variables with a high proportion of missing values, as `age_certification` (44.77%).


`season` would be the variable with higher proportion of missing values, but it is because of `season` only is defined for `type=SHOW`.


<br>

## Variable Scaling

Scale a variable is apply a transformation to it, in order to get new propierties for the transformed variable, propierties that the origial variable doesn't have.


In this article we are going to be focus on three scale kinds: standard scaled, (0,1) normalization and (a,b) normalization.


En cualquier caso, hay mas procedimientos que aquí no será explorados, por lo que para ver una lista más amplia se recomienda, por ejemplo, ver la documentación sobre este tema de la libreria   [`sklearn`](https://scikit-learn.org/stable/modules/preprocessing.html)


<br>

### Escalado estandar


 
Dada la muestra de una  variable estadística $\hspace{0.1cm} X_j=(x_{1j},...,x_{nj})^t$

La versión escalada estandar de $\hspace{0.1cm} X_j\hspace{0.1cm}$ es la siguiente variable: $\\[1cm]$

$$X_j^{std} \hspace{0.1cm} =\hspace{0.1cm} \dfrac{X_j - \mu(X_j)}{\sigma(X_j)} \\$$

donde:

$\hspace{0.1cm}\mu(X_j) \hspace{0.1cm} =\hspace{0.1cm} \dfrac{1}{n} \cdot \sum_{i=1}^n x_{ij}$

$\hspace{0.1cm}\sigma(X_j) \hspace{0.1cm} =\hspace{0.1cm} \dfrac{1}{n} \cdot \sum_{i=1}^n (x_{ij} - \overline{x}_j )^2 \\[1cm]$



**Propiedades :**


- $\hspace{0.2cm} \mu( X_j^{\hspace{0.07cm}std} ) \hspace{0.1cm} =\hspace{0.1cm} 0 \\[0.8cm]$


- $\hspace{0.2cm} \sigma^2( X_j^{\hspace{0.07cm}std} ) \hspace{0.1cm} =\hspace{0.1cm} 1 \\$



**Demostraciones :** 

- $\hspace{0.1cm} \mu(X_j ^{\hspace{0.07cm}std} ) \hspace{0.1cm} =\hspace{0.1cm} \mu \left( \dfrac{X_j - \mu(X_j)}{\sigma(X_j)} \right) \hspace{0.1cm} =\hspace{0.1cm} \dfrac{1}{\sigma(X_j)} \cdot \mu( \hspace{0.08cm} X_j - \mu(X_j) \hspace{0.08cm} ) \hspace{0.1cm} =\hspace{0.1cm} \dfrac{1}{\sigma(X_j)} \cdot [ \hspace{0.08cm}  \mu(X_j) - \mu \left( \hspace{0.08cm} \mu(X_j) \hspace{0.08cm} \right) \hspace{0.08cm} ] = \dfrac{1}{\sigma(X_j)} \cdot [ \hspace{0.08cm}  \mu(X_j) -  \mu(X_j)  \hspace{0.08cm} ] \hspace{0.1cm} =\hspace{0.1cm} \dfrac{1}{\sigma(X_j)} \cdot  0 = 0 \\[0.8cm]$

- $\hspace{0.1cm} \sigma^2( X_j^{\hspace{0.07cm}std} ) \hspace{0.1cm} =\hspace{0.1cm}  \sigma^2\left( \dfrac{X_j - \mu(X_j)}{\sigma(X_j)} \right) \hspace{0.1cm} =\hspace{0.1cm} \dfrac{1}{\sigma(X_j)^2} \cdot \sigma^2( \hspace{0.08cm} X_j - \mu(X_j)   \hspace{0.08cm} ) \hspace{0.1cm} =\hspace{0.1cm}  \dfrac{1}{\sigma^2(X_j)} \cdot \sigma^2( \hspace{0.08cm} X_j   \hspace{0.08cm} ) = 1$


<br>


### Normalización (0,1)

Dada la muestra de una  variable estadística $\hspace{0.1cm} X_j=(x_{1j},...,x_{nj})^t$

La versión normalizada $\hspace{0.1cm}(0,1)\hspace{0.1cm}$ de $\hspace{0.1cm}X_j\hspace{0.1cm}$ es la siguiente variable: $\\[1cm]$

$$X_j^{norm(0,1)} = \dfrac{X_j - Min(X_j)}{Max(X_j) - Min(X_j)} \\$$



**Propiedades :**

- $\hspace{0.2cm} Max \left(X_j^{norm(a,b)} \right) \hspace{0.1cm}=\hspace{0.1cm} 1 \\[0.8cm]$

- $\hspace{0.2cm} Min \left( X_j^{norm(a,b)} \right) \hspace{0.1cm}=\hspace{0.1cm} 0 \\$


**Demostraciones :**

- $\hspace{0.1cm} Max \left( X_j^{norm(0,1)} \right) \hspace{0.1cm} = \hspace{0.1cm} \dfrac{ Max(X_j) - Min(X_j)}{Max(X_j) - Min(X_j)} \hspace{0.1cm}=\hspace{0.1cm} 1 \\[0.8cm]$

- $\hspace{0.1cm} Min \left( X_j^{norm(0,1)} \right) \hspace{0.1cm}=\hspace{0.1cm} \dfrac{ Min(X_j) - Min(X_j)}{Max(X_j) - Min(X_j)} \hspace{0.1cm}=\hspace{0.1cm} 0$


<br>


### Normalización (a,b)


Dada la muestra de una variable estadística $\hspace{0.1cm}X_j=(x_{1j},...,x_{nj})^t$

La versión normalizada $\hspace{0.1cm}(a,b)\hspace{0.1cm}$ de $\hspace{0.1cm}X_j\hspace{0.1cm}$ es la siguiente variable:

$$X_j^{norm(a,b)} = X_j^{norm(0,1)} \cdot (b - a) + a \\$$


**Propiedades :**

- $\hspace{0.2cm} Max \left(X_j^{norm(a,b)} \right) = b \\[0.8cm]$

- $\hspace{0.2cm} Min \left( X_j^{norm(a,b)} \right) = a \\$



**Demostraciones :**

- $\hspace{0.1cm} Max \left(X_j^{norm(a,b)} \right) = Max \left(X_j^{norm(0,1)} \right)\cdot (a-b)+b= 1\cdot (b-a)+a = b \\[0.8cm]$

- $\hspace{0.1cm} Min \left(X_j^{norm(a,b)} \right) = Min \left(X_j^{norm(0,1)} \right)\cdot (a-b)+b= 0\cdot (b-a)+a = a$



 
 



<br>

## Recodificación estandar de variables categoricas

Dada la muestra de una variable estadística categórica $\hspace{0.1cm}X_j=(x_{1j},...,x_{nj})^t\hspace{0.1cm}$ con $\hspace{0.1cm}k\hspace{0.1cm}$ categorias tal que su recorrido (campo de variación) es $\hspace{0.1cm}\Gamma( X_j) = \lbrace g_1, g_2 , ..., g_k \rbrace$ ;


La recodficación a formato estándar de  $\hspace{0.1cm}X_j\hspace{0.1cm}$ consiste en obtener una nueva variable $\hspace{0.1cm}X_j^{recod}\hspace{0.1cm}$ definida como :

$$x_{ij}^{recod} =  \left\lbrace\begin{array}{l} 0 \hspace{0.3cm} ,  \text{ si} \hspace{0.2cm} x_{ij} = g_1 \\ 
1 \hspace{0.3cm} , \hspace{0.15cm} \text{si} \hspace{0.2cm} x_{ij} = g_2 \\
... \\ 
k-1  \hspace{0.3cm}  ,\text{ si} \hspace{0.2cm} x_{ij} = g_1 \end{array}\right.
$$


**Observación :**

$\hspace{0.1cm}\Gamma( X_j^{recod}) = \lbrace 0,1,..., k-1 \rbrace$ 





<br>


## Categorización de variables cuantitativas

Dada una muestra de una variable estadistica cuantitativa $\hspace{0.1cm} X_j=(x_{1j},...,x_{nj})^t\hspace{0.1cm}$ ;


La categorización de $\hspace{0.1cm}X_j\hspace{0.1cm}$ consisiste en obtener una nueva variable $\hspace{0.1cm}X_j^{cat}\hspace{0.1cm}$ definida como:


$$x_{ij}^{cat} =  \left\lbrace\begin{array}{l} 0 \hspace{0.3cm} ,  \text{ si} \hspace{0.2cm} x_{ij} \in [L_0 , L_1) \\ 
1 \hspace{0.3cm} , \hspace{0.15cm} \text{si} \hspace{0.2cm} x_{ij} \in [L_1 , L_2)  \\
... \\ 
k-1  \hspace{0.3cm}  ,\text{ si} \hspace{0.2cm} x_{ij} \in [L_{k-1} , L_k) \end{array}\right. \\[1cm]
$$

Otra forma de expresarlo:

$$x_{ij}^{cat} = r  \Leftrightarrow x_{ij} \in [L_r , L_{r+1}) \\$$


donde:

$[L_0 , L_1), [L_1 , L_2), \dots , [L_{k-1} , L_k)\hspace{0.1cm}$ son denominados intervalos de categorizacioón de $\hspace{0.1cm}X_j\hspace{0.1cm}$ , y son una serie de intervalos con las siguientes propiedades:

- Son disjuntos dos a dos, es decir, no comparten elementos.

- Cada observación de la muestra $\hspace{0.1cm}X_j\hspace{0.1cm}$ pertenece a un intervalo.

- Tienen la misma amplitud.


Como consecuencia:

- Cada elemento de $\hspace{0.1cm}X_j\hspace{0.1cm}$ pertenece a un único intervalo. $\\[1cm]$


 

**Observaciones :**

$X^{cat}_j\hspace{0.1cm}$ es una versión categorizada de la variable $\hspace{0.1cm}X_j$ $\\[1cm]$



**¿Cómo definir los intervalos de categorización?**


Existen diferentes procedimientos para definir los intervalos de categorización, los más habituales son reglas basadas en los cuantiles de la variable considerada. 

A continuación vamos a exponer algunos procedimientos básados en cuantiles y otro alternativo, la regla de Scott.


<br>


### Regla de la media

Siguiendo la regla de la media, los intervalos de categorizacion de una variable cuantitativa $\hspace{0.1cm} X_j\hspace{0.1cm}$ serían los siguientes:$\\[0.8cm]$



$$
\left[\hspace{0.1cm} Min(X_j) \hspace{0.1cm} ,\hspace{0.1cm} \overline{X}_j \hspace{0.1cm}\right] \hspace{0.1cm},\hspace{0.1cm} \left(\hspace{0.1cm} \overline{X}_j \hspace{0.1cm},\hspace{0.1cm} Max(X_j) \hspace{0.1cm}\right]
$$




<br>

Con la regla de la media, la versión categorica $\hspace{0.1cm}X_j^{cat}\hspace{0.1cm}$ de la variable cuantitativa $\hspace{0.1cm}X_j\hspace{0.1cm}$ se define como: $\\[0.8cm]$

$$x_{ij}^{cat} =  \left\lbrace\begin{array}{l} 0 \hspace{0.3cm} ,  \text{ si} \hspace{0.2cm} x_{ij} \in \left[\hspace{0.1cm}Min(X_j)\hspace{0.1cm},\hspace{0.1cm} \overline{X}_j\hspace{0.1cm}\right)  \\ 
1  \hspace{0.3cm}  ,\text{ si} \hspace{0.2cm} x_{ij} \in \left[\hspace{0.1cm}\overline{X}_j \hspace{0.1cm},\hspace{0.1cm} Max(X_j)\hspace{0.1cm}\right) \end{array}\right. \\[1cm]
$$


<br>


### Regla de la mediana




<br>


### Regla de los cuartiles






<br>


### Regla de Scott





<br>

## Dummificación de variables categoricas








## Dealing with NaN <a class="anchor" id="1"></a>


<br>



# Statistical Description 

## Statistical variable

A statistical variable $\hspace{0.05cm}\mathcal{X}_k\hspace{0.05cm}$ can be modeled as a **random variable**.

Under this approach, we can apply all probability theory on random variables to statistical variables. $\\[0.4cm]$


 

 

## Range of a statistical variable

The range of a statistical variable $\hspace{0.05cm}\mathcal{X}_k\hspace{0.05cm}$ is denoted by $\hspace{0.05cm}Range(\mathcal{X}_k)\hspace{0.05cm}$, and is defined as the set of possible values of $\hspace{0.05cm}\mathcal{X}_k$. $\\[0.4cm]$



### Statistical variable types: quantitative and categorical

- The variable $\mathcal{X}_k$ is **quantitative** if the elements of it´s range are
conceptually numbers. $\\[0.5cm]$

- The variable $\mathcal{X}_k$ is **categorical** if the elements of it´s range aree labels or categories (they can be numbers at a symbolic level but not at a conceptual level). $\\[0.4cm]$



### Quantitative variable types: continuous and discrete

We can distinguish at least two types of quantitative variables: continuous and discrete.

 

- $\mathcal{X}_k\hspace{0.05cm}$ is continuous if $\hspace{0.05cm}Range(\mathcal{X}_k)\hspace{0.05cm}$ is a not countable set. $\\[0.5cm]$
 
- $\mathcal{X}_k\hspace{0.05cm}$ is discrete if $\hspace{0.05cm}Range(\mathcal{X}_k)\hspace{0.05cm}$ is countable set. $\\[0.2cm]$
 

**Note:**

In particular, variables whose  **range** is a **finite** set
will be **discrete**.

Variables whose  **range** isn´t a **finite** set
will be **continuous**. $\\[0.4cm]$



### Categorical variable types: r-ary   

Let  $\mathcal{X}_k$ a **categorical** variable ,

- $\mathcal{X}_k$ is **r-aria** if it´s range has **r** elements that are categories or labels.


In Statistics **binary** (2-aria) categorical variables are particularly important. $\\[0.4cm]$
 

### Categorical variable types: nominal and ordinal

Let  $\mathcal{X}_k$ a $r$-ary **categorical** variable.

- $\mathcal{X}_k$ is **nominal** if **there is no ordering** between the $r$ categories of it's range. $\\[0.4cm]$

- $\mathcal{X}_k$ is **ordinal** if **there is ordering** between the $r$ categories of it's range. $\\[0.4cm]$

 









## Sample of a statistical variable

Given a statistical variable $\hspace{0.05cm}\mathcal{X}_k$.

A sample of $\hspace{0.05cm}\mathcal{X}_k\hspace{0.05cm}$ is a vector of values of $\hspace{0.05cm}\mathcal{X}_k$, called observations.

Therefore:

$$
X_k \hspace{0.05cm} = \hspace{0.05cm} \begin{pmatrix}
x_{1k} \\
x_{2k}\\
... \\
x_{nk} 
\end{pmatrix} \hspace{0.05cm} = \hspace{0.05cm} \left( \hspace{0.01cm} x_{1k} \hspace{0.01cm} , \hspace{0.01cm}x_{2k}\hspace{0.01cm},\dots ,\hspace{0.01cm} x_{nk} \hspace{0.01cm}\right)^t \\
$$

is a sample of a **statistical variable** because is a vector with the values or observations of the variable $\hspace{0.05cm} \mathcal{X}_k \hspace{0.05cm}$ for $\hspace{0.05cm} n \hspace{0.05cm}$ elements or individuals of a sample.  


Where: $\hspace{0.1cm} x_{ik}\hspace{0.05cm}$  is the value $\hspace{0.05cm} i$-th observation of the variable $\hspace{0.05cm} \mathcal{X}_k$. $\\[0.4cm]$





## Arithmetic Mean 

Given a **quantitative** statistical variable $\hspace{0.05cm}\mathcal{X}_k\hspace{0.05cm}$, and a sample  $\hspace{0.05cm}X_k \hspace{0.05cm} = \hspace{0.05cm} \left( \hspace{0.01cm} x_{1k} \hspace{0.01cm} , \hspace{0.01cm}x_{2k}\hspace{0.01cm},\dots ,\hspace{0.01cm} x_{nk} \hspace{0.01cm}\right)^t\hspace{0.05cm}$ of that statistical variable.

The **arithmetic mean** of $\hspace{0.05cm}X_k \hspace{0.05cm}$ is defined as: $\\[0.3cm]$


$$\overline{\hspace{0.05cm} X_k \hspace{0.05cm} } \hspace{0.1cm}=\hspace{0.1cm} \dfrac{1}{n} \cdot \sum_{i=1}^n \hspace{0.05cm} x_{ik}$$ $\\[0.4cm]$




## Weighted Mean 


Given a **quantitative** statistical variable $\hspace{0.05cm}\mathcal{X}_k\hspace{0.05cm}$, and a sample  $\hspace{0.05cm}X_k \hspace{0.05cm} = \hspace{0.05cm} \left( \hspace{0.01cm} x_{1k} \hspace{0.01cm} , \hspace{0.01cm}x_{2k}\hspace{0.01cm},\dots ,\hspace{0.01cm} x_{nk} \hspace{0.01cm}\right)^t\hspace{0.05cm}$ of that statistical variable.


And given a weights for each observation of the variable $\hspace{0.05cm} \mathcal{X}_k \hspace{0.2cm} \Rightarrow \hspace{0.2cm}$ $w \hspace{0.05cm} = \hspace{0.05cm} (w_1,w_2,...,w_n)^t$

 
The **weighted mean** of $\hspace{0.05cm} X_k \hspace{0.05cm}$ with the weights vector $\hspace{0.05cm} w \hspace{0.05cm}$ is defined as:

$$
\overline{X_k} (w) \hspace{0.1cm} =  \hspace{0.1cm}  \dfrac{1}{\hspace{0.1cm}\sum_{i=1}^{n}  \hspace{0.05cm} w_{i} \hspace{0.1cm}} \hspace{0.05cm}\cdot\hspace{0.05cm} \sum_{i=1}^{n}  \hspace{0.1cm} x_{ik} \cdot w_i   
$$ $\\[0.4cm]$




## Geometric Mean   



Given the variable $\hspace{0.05cm} X_k=(x_{1k}, x_{2k},...,x_{nk})^t$.


The **geometric mean** of the variable $\hspace{0.05cm}X_k\hspace{0.05cm}$ is defined as: $\\[0.3cm]$

$$
\overline{X_k}_{geo} \hspace{0.05cm} = \hspace{0.05cm}  \sqrt{\Pi_{i=1}^{n}  x_{ik}} \hspace{0.05cm} =  \hspace{0.05cm} \sqrt{x_{1k}\cdot x_{2k}\cdot...\cdot x_{nk}} 
$$ $\\[0.4cm]$


## Median

Given a statistical variable $\hspace{0.05cm}\mathcal{X}_k\hspace{0.05cm}$, and a sample  $\hspace{0.05cm}X_k \hspace{0.05cm} = \hspace{0.05cm} \left( \hspace{0.01cm} x_{1k} \hspace{0.01cm} , \hspace{0.01cm}x_{2k}\hspace{0.01cm},\dots ,\hspace{0.01cm} x_{nk} \hspace{0.01cm}\right)^t\hspace{0.05cm}$ of that statistical variable.

The **median** of $\hspace{0.05cm}X_k \hspace{0.05cm}$ is defined as a value $Me(X_k)$ such that: $\\[0.3cm]$


$$\dfrac{1}{n} \cdot \sum_{i=1}^n \hspace{0.1cm} \mathbb{I} \hspace{0.05cm} \bigl[ \hspace{0.1cm} x_{ik} \hspace{0.05cm} \leq \hspace{0.05cm} Me(X_k) \hspace{0.1cm} \bigr] \hspace{0.1cm} = \hspace{0.1cm} 0.50$$ 


 
where: $\hspace{0.15cm}\mathbb{I}\hspace{0.1cm}$ is the indicator function. $\\[0.4cm]$



## Mode


Given a **categorical** variable $\hspace{0.05cm}\mathcal{X}_k\hspace{0.05cm}$, and a sample  $\hspace{0.05cm}X_k \hspace{0.05cm} = \hspace{0.05cm} \left( \hspace{0.01cm} x_{1k} \hspace{0.01cm} , \hspace{0.01cm}x_{2k}\hspace{0.01cm},\dots ,\hspace{0.01cm} x_{nk} \hspace{0.01cm}\right)^t\hspace{0.05cm}$ of that statistical variable.

The **mode** of $\hspace{0.05cm} X_k \hspace{0.05cm}$ is the most repeated value in $\hspace{0.05cm}X_k \hspace{0.05cm} = \hspace{0.05cm} \left( \hspace{0.01cm} x_{1k} \hspace{0.01cm} , \hspace{0.01cm}x_{2k}\hspace{0.01cm},\dots ,\hspace{0.01cm} x_{nk} \hspace{0.01cm}\right)^t\hspace{0.05cm}$, so, the **mode** of $\hspace{0.05cm} X_k \hspace{0.05cm}$ is the most frequent value of $\hspace{0.05cm} X_k \hspace{0.05cm} = \hspace{0.05cm} \left( \hspace{0.01cm} x_{1k} \hspace{0.01cm} , \hspace{0.01cm}x_{2k}\hspace{0.01cm},\dots ,\hspace{0.01cm} x_{nk} \hspace{0.01cm}\right)^t\hspace{0.05cm}$  $\\[0.4cm]$


## Variance

Given a **quantitative** variable $\hspace{0.05cm}\mathcal{X}_k\hspace{0.05cm}$, and a sample  $\hspace{0.05cm}X_k \hspace{0.05cm} = \hspace{0.05cm} \left( \hspace{0.01cm} x_{1k} \hspace{0.01cm} , \hspace{0.01cm}x_{2k}\hspace{0.01cm},\dots ,\hspace{0.01cm} x_{nk} \hspace{0.01cm}\right)^t\hspace{0.05cm}$ of that statistical variable.


The **variance** of  $\hspace{0.05cm} X_k \hspace{0.05cm}$ is defined as:

$$\sigma(X_k)^2 \hspace{0.1cm} = \hspace{0.1cm} \dfrac{1}{n} \cdot \sum_{i=1}^n  \hspace{0.05cm} \left(\hspace{0.05cm} x_{ik} - \overline{X_k} \hspace{0.05cm}\right)^2$$


The **standard deviation** or standard error of  $\hspace{0.05cm} X_k \hspace{0.05cm}$ is defined as:

$$\sqrt{ \sigma(X_k)^2 } \hspace{0.1cm} = \hspace{0.1cm} \dfrac{1}{n} \cdot \sum_{i=1}^n  \left( \hspace{0.05cm} x_{ik} - \overline{X_k} \hspace{0.05cm} \right)$$ $\\[0.4cm]$



## Median Absolute Deviation

Given a statistical variable $\hspace{0.05cm}\mathcal{X}_k\hspace{0.05cm}$, and a sample  $\hspace{0.05cm}X_k \hspace{0.05cm} = \hspace{0.05cm} \left( \hspace{0.01cm} x_{1k} \hspace{0.01cm} , \hspace{0.01cm}x_{2k}\hspace{0.01cm},\dots ,\hspace{0.01cm} x_{nk} \hspace{0.01cm}\right)^t\hspace{0.05cm}$ of that statistical variable.


The median absolute deviation (MAD) of  $\hspace{0.05cm} X_k \hspace{0.05cm}$ is defined as:

$$MAD(X_k) \hspace{0.1cm} = \hspace{0.1cm} Me \bigl( \hspace{0.1cm} \left| \hspace{0.05cm} X_k - Me(X_k) \hspace{0.05cm} \right| \hspace{0.1cm} \bigr)  \hspace{0.1cm} = \hspace{0.1cm} Me \hspace{0.1cm} \Bigr[ \hspace{0.1cm} \left( \hspace{0.2cm} \left| \hspace{0.1cm} x_{ik} - Me(X_k) \hspace{0.1cm} \right|  \hspace{0.15cm} : \hspace{0.15cm}  i =  1,\dots,n  \hspace{0.2cm} \right) \hspace{0.1cm} \Bigr]$$ $\\[0.4cm]$




## Quantiles


Given a statistical variable $\hspace{0.05cm}\mathcal{X}_k\hspace{0.05cm}$, and a sample  $\hspace{0.05cm}X_k \hspace{0.05cm} = \hspace{0.05cm} \left( \hspace{0.01cm} x_{1k} \hspace{0.01cm} , \hspace{0.01cm}x_{2k}\hspace{0.01cm},\dots ,\hspace{0.01cm} x_{nk} \hspace{0.01cm}\right)^t\hspace{0.05cm}$ of that statistical variable.


The $\hspace{0.05cm}q$-order quantile of $\hspace{0.05cm} X_k \hspace{0.05cm}$ is defined as a value $Q(X_k , q)$ such that:  



$$\dfrac{1}{n} \cdot \sum_{i=1}^n \hspace{0.1cm} \mathbb{I} \hspace{0.05cm} \bigl[ \hspace{0.1cm} x_{ik} \hspace{0.05cm} \leq \hspace{0.05cm} Q(\hspace{0.05cm} X_k \hspace{0.05cm},\hspace{0.05cm} q \hspace{0.05cm}) \hspace{0.1cm} \bigr] \hspace{0.1cm} = \hspace{0.1cm} q$$ 


 
where: $\hspace{0.15cm}\mathbb{I}\hspace{0.1cm}$ is the indicator function. $\\[0.3cm]$


**Observation:**

The median is the 0.5-order quantile. $\\[0.4cm]$




## Kurtosis

Given a **quantitative** variable $\hspace{0.05cm}\mathcal{X}_k\hspace{0.05cm}$, and a sample  $\hspace{0.05cm}X_k \hspace{0.05cm} = \hspace{0.05cm} \left( \hspace{0.01cm} x_{1k} \hspace{0.01cm} , \hspace{0.01cm}x_{2k}\hspace{0.01cm},\dots ,\hspace{0.01cm} x_{nk} \hspace{0.01cm}\right)^t\hspace{0.05cm}$ of that statistical variable.



The kurtosis coefficient of $\hspace{0.05cm} X_k \hspace{0.05cm}$ is defined as: $\\[0.35cm]$

 
$$
\Psi(X_k) = \dfrac{\mu_{4}}{\sigma(X_k)^{4}}
$$

where:

$$
\mu_{4}\hspace{0.1cm} =\hspace{0.1cm} \frac{1}{n} \cdot \sum_{i=1}^{n} \hspace{0.05cm} x_{ik}^4 \\[0.3cm]
$$



**Propierties:**

- If $\hspace{0.12cm}\Psi(X_k) \hspace{0.05cm} > \hspace{0.05cm} 3\hspace{0.08cm}$ $\hspace{0.2cm}\Rightarrow\hspace{0.2cm}$ the distribution of $\hspace{0.05cm} X_k \hspace{0.05cm}$ is more pointed and with longer tails than the normal distribution. $\\[0.5cm]$

- If $\hspace{0.12cm}\Psi(X_k) \hspace{0.05cm} < \hspace{0.05cm} 3\hspace{0.08cm}$ $\hspace{0.2cm}\Rightarrow\hspace{0.2cm}$ the distribution of $\hspace{0.05cm} X_k \hspace{0.05cm}$ is less pointed and with shorter tails than the normal distribution. $\\[0.4cm]$




## Skewness

Given a **quantitative** variable $\hspace{0.05cm}\mathcal{X}_k\hspace{0.05cm}$, and a sample  $\hspace{0.05cm}X_k \hspace{0.05cm} = \hspace{0.05cm} \left( \hspace{0.01cm} x_{1k} \hspace{0.01cm} , \hspace{0.01cm}x_{2k}\hspace{0.01cm},\dots ,\hspace{0.01cm} x_{nk} \hspace{0.01cm}\right)^t\hspace{0.05cm}$ of that statistical variable.



The skewness coefficient of $\hspace{0.05cm} X_k \hspace{0.05cm}$ is defined as: $\\[0.25cm]$

 
$$
\Gamma(X_k) = \dfrac{\mu_{3}}{\sigma(X_k)^{3}}
$$

where:

$$
\mu_{3}\hspace{0.1cm} =\hspace{0.1cm} \frac{1}{n} \cdot \sum_{i=1}^{n} \hspace{0.05cm} x_{ik}^3 \\[0.3cm]
$$

 
 
**Propierties:**

Fisher's skewness coefficient measures the degree of skewness in the distribution of a given statistical variable.



- If $\hspace{0.12cm} \Gamma(X_k) > 0$ $\hspace{0.2cm} \Rightarrow \hspace{0.2cm}$ the distribution of $X_k$ has skewness to the right. $\\[0.6cm]$

- If $\hspace{0.12cm} \Gamma(X_k) < 0$ $\hspace{0.2cm} \Rightarrow \hspace{0.2cm}$ the distribution of $X_k$ has skewness to the left. $\\[0.4cm]$

 


## Outliers

There are several definitions of outlier, but here we are going to consider the classic one.

Given a statistical variable $\hspace{0.05cm}\mathcal{X}_k\hspace{0.05cm}$, and a sample  $\hspace{0.05cm}X_k \hspace{0.05cm} = \hspace{0.05cm} \left( \hspace{0.01cm} x_{1k} \hspace{0.01cm} , \hspace{0.01cm}x_{2k}\hspace{0.01cm},\dots ,\hspace{0.01cm} x_{nk} \hspace{0.01cm}\right)^t\hspace{0.05cm}$ of that statistical variable.


For any $\hspace{0.05cm} i\in \lbrace 1,...,n \rbrace$ , 

The observation $\hspace{0.05cm} x_{ik}\hspace{0.05cm}$ of $\hspace{0.05cm} \mathcal{X}_k\hspace{0.05cm}$ is an outlier if and only if:

$$x_{ik} \hspace{0.05cm} >\hspace{0.05cm}  Q(X_k \hspace{0.05cm} , \hspace{0.05cm} 0.75) + 1.5\cdot IQR(X_k) \hspace{0.5cm}\text{or}\hspace{0.5cm} x_{ik} \hspace{0.05cm} <\hspace{0.05cm}  Q(X_k \hspace{0.05cm} , \hspace{0.05cm} 0.25) - 1.5\cdot IQR(X_k) \\$$


where: $\hspace{0.25cm} IQR(X_k) \hspace{0.12cm} = \hspace{0.12cm} Q(X_k \hspace{0.05cm} , \hspace{0.05cm} 0.75) \hspace{0.08cm} - \hspace{0.08cm} Q(X_k \hspace{0.05cm} , \hspace{0.05cm} 0.25) \hspace{0.25cm}$
is the interquartile range of $\hspace{0.05cm} X_k \hspace{0.05cm}$.

 
 
<br>
 
 


## Data Matrix

Given $\hspace{0.05cm} p \hspace{0.05cm}$ statistical variables $\hspace{0.05cm}\mathcal{X}_1, \mathcal{X}_2, \dots \mathcal{X}_p\hspace{0.05cm}$, and given a sample $\hspace{0.05cm}X_k = (x_{1k},...,x_{nk})^t\hspace{0.05cm}$ of $\hspace{0.05cm}\mathcal{X}_k\hspace{0.05cm}$ for each $\hspace{0.05cm}k \in \lbrace 1,...,p \rbrace$.


A data matrix of the variables $\hspace{0.05cm}\mathcal{X}_1,...,\mathcal{X}_1\hspace{0.05cm}$ would be: $\\[0.35cm]$

$$
X \hspace{0.05cm}=\hspace{0.05cm} \left( X_1 , X_2,\dots , X_p  \right) \hspace{0.05cm}=\hspace{0.05cm} \begin{pmatrix}
x_{1}^{t} \\
x_{2} ^t \\
... \\
x_{n} ^t 
\end{pmatrix} \hspace{0.05cm}=\hspace{0.05cm} \begin{pmatrix}
x_{11} & x_{12}&...&x_{1p}\\
x_{21} & x_{22}&...&x_{2p}\\
...&...&...&...\\
x_{n1}& x_{n2}&...&x_{np}
\end{pmatrix} \\
$$

where:

$x_i ^t \hspace{0.05cm}=\hspace{0.05cm} \left( x_{i1}, x_{i2}, \dots , x_{ip} \right)\hspace{0.1cm}$ is the vector with the values of the $\hspace{0.05cm} p \hspace{0.05cm}$ statistical variables $\hspace{0.05cm}\mathcal{X}_1,\dots ,\mathcal{X}_p\hspace{0.05cm}$ for the $\hspace{0.05cm}i$-th element of the sample, for $\hspace{0.05cm} i \in \lbrace 1,...,n \rbrace$ $\\[0.4cm]$


**Observations:**

$X \hspace{0.1cm}$ is a matrix with $\hspace{0.05cm}p\hspace{0.05cm}$ columns and $\hspace{0.05cm}n\hspace{0.05cm}$ rows, so, is a matrix of size $\hspace{0.05cm} p\hspace{0.05cm} \text{x}\hspace{0.05cm}n$. $\\[0.4cm]$



 
 
## Covariance

Given the statistical variables $\hspace{0.05cm}\mathcal{X}_1, \mathcal{X}_2, \dots \mathcal{X}_p\hspace{0.05cm}$, and given a sample $\hspace{0.05cm}X_k = (x_{1k},...,x_{nk})^t\hspace{0.05cm}$ of $\hspace{0.05cm}\mathcal{X}_k\hspace{0.05cm}$ for each $\hspace{0.05cm}k \in \lbrace 1,...,p \rbrace$.


The covariance between  $\hspace{0.05cm}X_j\hspace{0.05cm}$ and $\hspace{0.05cm}X_r\hspace{0.05cm}$ is defined as:

$$
S(X_k, X_r) \hspace{0.1cm}=\hspace{0.1cm} \frac{1}{n} \cdot \sum_{i=1}^{n} \left(\hspace{0.05cm} x_{ik} - \overline{X_k} \hspace{0.05cm}\right)\cdot \left(\hspace{0.05cm} x_{ir} - \overline{X_r} \hspace{0.05cm}\right)
$$ $\\[0.4cm]$




### Properties of covariance  




-   $S(X_k,X_r) \in (-\infty, \infty)$ $\\[0.5cm]$

-   $S(X_k,X_r) \hspace{0.1cm} = \hspace{0.1cm} \dfrac{1}{n}\cdot \sum_{i=1}^{n} (x_{ik} \cdot x_{ir}) \hspace{0.05cm} - \hspace{0.05cm} \overline{X_k} \cdot \overline{X_r} \hspace{0.1cm} = \hspace{0.1cm} \overline{X_k\cdot X_r} \hspace{0.05cm} - \hspace{0.05cm} \overline{x_k} \cdot \overline{x_r}$ $\\[0.5cm]$

-   $S(X_k, a + b\cdot X_r) \hspace{0.1cm} = \hspace{0.1cm}  b\cdot S(X_k,X_r)$ $\\[0.5cm]$

-   $S(X_k,X_r) \hspace{0.1cm} = \hspace{0.1cm}  S(X_r,X_k)$ $\\[0.5cm]$

-   $S(X_k,X_r)\hspace{0.05cm} >\hspace{0.05cm} 0 \hspace{0.2cm} \Rightarrow \hspace{0.2cm}$ **Positive Relationship** between  $\hspace{0.05cm}X_k\hspace{0.05cm}$ and $\hspace{0.05cm}X_r\hspace{0.05cm}$. $\\[0.5cm]$

-   $S(X_k,X_r)\hspace{0.05cm} <\hspace{0.05cm} 0 \hspace{0.2cm} \Rightarrow \hspace{0.2cm}$ **Negative Relationship** between  $\hspace{0.05cm}X_k\hspace{0.05cm}$ and $\hspace{0.05cm}X_r\hspace{0.05cm}$.  $\\[0.5cm]$

-   $S(X_k,X_r) \hspace{0.05cm}=\hspace{0.05cm} 0 \hspace{0.2cm} \Rightarrow \hspace{0.2cm}$ **There is not relationship** between $\hspace{0.05cm}X_k\hspace{0.05cm}$ and $\hspace{0.05cm}X_r\hspace{0.05cm}$. $\\[0.5cm]$



## Covariance Matrix  



The **covariance matrix** of a given data matrix $\hspace{0.05cm}X \hspace{0.05cm}=\hspace{0.05cm} (X_1,...,X_p)\hspace{0.05cm}$ is: $\\[0.2cm]$

$$
S_X = \bigl( \hspace{0.2cm} s_{k,r} \hspace{0.05cm} : \hspace{0.05cm} k,r \in \lbrace 1,...,p \rbrace \hspace{0.2cm} \bigr)
$$ 

where: $\hspace{0.15cm} s_{k,r} = S(X_k , X_r)$ $\\[0.25cm]$


**Matrix expression of the covariance matrix :**

$$
S_X \hspace{0.1cm} = \hspace{0.1cm} \dfrac{1}{n} \cdot  X\hspace{0.1cm}^t \cdot H \cdot X
$$

where: $\hspace{0.15cm} H \hspace{0.1cm}=\hspace{0.1cm} I_n \hspace{0.05cm} - \hspace{0.05cm} \dfrac{1}{n} \cdot  1_{nx1} \cdot 1^t_{nx1}  \hspace{0.15cm}$ is the centered matrix







## Correlation


Given the statistical variables $\hspace{0.05cm}\mathcal{X}_1, \mathcal{X}_2, \dots \mathcal{X}_p\hspace{0.05cm}$, and given a sample $\hspace{0.05cm}X_k = (x_{1k},...,x_{nk})^t\hspace{0.05cm}$ of $\hspace{0.05cm}\mathcal{X}_k\hspace{0.05cm}$ for each $\hspace{0.05cm}k \in \lbrace 1,...,p \rbrace$.


 

The **Pearson linear correlation** between the variables $X_k$ and $X_r$ is defined as:

$$
r(X_k,X_r) = \frac{S(X_k,X_r)}{S(X_k) \cdot S(X_r)} 
$$ $\\[0.25cm]$





### Properties of Pearson linear correlation <a class="anchor" id="47"></a>


-   $r(X_k,X_r) \in [-1,1]$ $\\[0.5cm]$

 

-   $r_{X_k,a + b\cdot X_r} = r(X_k,X_r)$ $\\[0.5cm]$

 

-  The sign of $r(X,X)$ is equal to the sign of $S(X_k,Xr)$ $\\[0.5cm]$

-   $r(X_k,X_r) = \pm 1 \hspace{0.1cm} \Rightarrow \hspace{0.1cm} $ perfecto linear relationship between
    $X_k$ and $X_r$. $\\[0.5cm]$

-   $r(X_k,X_r) = 0 \hspace{0.1cm} \Rightarrow \hspace{0.1cm}$ There is not linear relationship between  $X_k$ and  $X_r$. $\\[0.5cm]$

 

-   $r(X_k,X_r) \rightarrow \pm 1 \hspace{0.1cm} \Rightarrow \hspace{0.1cm}$ hard linear relationship between $X_k$ and $X_r$. $\\[0.5cm]$

 

-   $r(X_k,X_r) \rightarrow 0 \hspace{0.1cm} \Rightarrow \hspace{0.1cm}$ weak linear relationship between
    $X_k$ and $X_r$. $\\[0.5cm]$

 

-   $r(X_k,X_r) >0 \hspace{0.1cm} \Rightarrow \hspace{0.1cm}$ positive relationship between $X_k$ and $X_r$. $\\[0.5cm]$



-   $r(X_k,X_r) <0 \hspace{0.1cm} \Rightarrow \hspace{0.1cm}$ negative relationship between  $X_k$ and $X_r$. $\\[0.5cm]$


## Pearson Correlation Matrix 

The Pearson correlation matrix of the data matrix $X=(X_1 ,..., X_p)$ is : $\\[0.25cm]$

 

$$
R_X  
 =\bigl( \hspace{0.12cm} r_{k,r} \hspace{0.12cm} : \hspace{0.12cm} k,r\in \lbrace 1,...,p \rbrace \hspace{0.12cm} \bigr)
$$ $\\[0.25cm]$

 

where: $\hspace{0.2cm} r_{i j} = r(X_i , X_j) \hspace{0.1cm}$ , for $\hspace{0.12cm} i,j=1,...,p$ $\\[0.35cm]$





**Matrix expression of the correlation matrix**



$$
R_X= D_s^{-1} \cdot S_X \cdot D_s^{-1}
$$

where:
$$
D_s \hspace{0.05cm} = \hspace{0.05cm}  \text{diag} \left( \hspace{0.05cm} \sigma(X_1)  ,..., \sigma(X_p) \hspace{0.05cm}  \right)  
$$ $\\[0.5cm]$

 
 

## Absolute Frequency

Given the statistical variables $\hspace{0.07cm}\mathcal{X}_k\hspace{0.05cm}$,  given a sample $\hspace{0.05cm}X_k = (x_{1k},...,x_{nk})^t\hspace{0.07cm}$ of $\hspace{0.07cm}\mathcal{X}_k\hspace{0.03cm}$.



### Absolute Frequency of an element

Given $\hspace{0.07cm} b \in Range(\mathcal{X}_k)$.
 
The **absolute frequency** of the **element** $\hspace{0.07cm}b\hspace{0.07cm}$ in $\hspace{0.07cm}X_k\hspace{0.07cm}$ is defined as :

$$
F_A(b ,X_k) \hspace{0.1cm}=\hspace{0.1cm} \# \hspace{0.05cm} \Bigl\{  \hspace{0.1cm} i \in \lbrace 1,... , n \rbrace \hspace{0.1cm} : \hspace{0.1cm} x_{ik}=b \hspace{0.1cm} \Bigl\} 
$$





**Observation:**

If $\hspace{0.05cm}$ $\mathcal{X}_k$ $\hspace{0.05cm}$ is continuous, usually $\hspace{0.05cm}$ $F_A(b , X_k) = 0$ $\hspace{0.05cm}$ for many values $\hspace{0.05cm}$ $b$ $\\[0.4cm]$




### Absolute frequency of a set  


 Given $\hspace{0.05cm}B \subset Range(\mathcal{X}_k)$

 

The absolute frequency of the set $\hspace{0.05cm}B\hspace{0.05cm}$ in $\hspace{0.05cm}X_k\hspace{0.05cm}$ is defined as:

$$
F_A(B, X_k) = \sum_{b \in B} F_A(b , X_k ) = 
$$



**Observation:**

$F_A([c_1,c_2], X_k)$ $\hspace{0.08cm}$ is a particular case of $\hspace{0.08cm}$ $F_A(B, X_k)$ $\hspace{0.08cm}$ with $\hspace{0.08cm}$ $A=[c_1,c_2]$ $\\[0.4cm]$


 
 
 
## Relative Frequency

Given the statistical variables $\hspace{0.07cm}\mathcal{X}_k\hspace{0.05cm}$,  given a sample $\hspace{0.05cm}X_k = (x_{1k},...,x_{nk})^t\hspace{0.07cm}$ of $\hspace{0.07cm}\mathcal{X}_k\hspace{0.03cm}$.


### Relative frequency of an element  



Given $\hspace{0.07cm}b \in Range(\mathcal{X}_k)$

 
The **relative frequency** of the **element**  $\hspace{0.07cm}b\hspace{0.07cm}$ in $\hspace{0.07cm}X_k\hspace{0.07cm}$ is defined as :


$$
F_{Re}(b,X_k) \hspace{0.07cm}=\hspace{0.07cm}  \dfrac{F_A(b,X_k) }{n} 
$$ $\\[0.4cm]$
 
 
 


### Relative frequency of a set  



Given $\hspace{0.07cm}A \subset Range(\mathcal{X}_k)$.

 

The **relative frequency** of the **set** $\hspace{0.07cm}B\hspace{0.07cm}$ in $\hspace{0.07cm}X_k\hspace{0.07cm}$ is defined as:

$$
F_{Re}(A,X_k) \hspace{0.07cm}=\hspace{0.07cm}  \dfrac{F_A(B ,X_k) }{n}
$$ $\\[0.4cm]$

 



## Cumulative Absolute Frequency


The **cumulative absolute frequency** of the element $b$ in $X_k$ is defined as:

$$
F_{CumA}(b ,X_k) \hspace{0.07cm}= \hspace{0.07cm} F_A \left( \lbrace   i=1,...,n  \hspace{0.07cm} : \hspace{0.07cm} x_{ik} \leq b  \rbrace , X_k \right)   
$$ $\\[0.4cm]$
 

## Cumulative Relative Frequency
 
The **cumulative relative frequency** of the element $b$ in $X_k$ is defined as:

$$
F_{CumRe}(b,X_k)= \dfrac{F_{CumA}(b,X_k)}{n}   
$$  $\\[0.4cm]$




## Frequency Table 



A frequency table is a table that contains the absolut, relative and also cumulative frequencies of a statistical variable.



$\\[0.4cm]$





# Statistical Description Protocol for Quantitative Variables 

mean, median, variance, cuantiles, kurtosis, skewness, outliers


frequency tables --> https://www.statology.org/frequency-tables-python/


# Statistical Description Protocol for Categorical Variables   

mode, quantiles

frequency tables 


# Statistical Description Protocol for Variable Crossings   (cruces de variables cuantis-categoricas, categroicas-categoricas, cuantis-cuantis) <a class="anchor" id="1"></a>

quantitative-categorical --> mean, median, vaariance, quantiles etc BY GROUPS.  Joint and conditional frequency tables.

categorical-categorical --> Joint and conditional frequency tables.

quantitative-quantitative --> transform to categorical-categorical case.





# Statistical visualization  


## Visualization Protocol for Quantitative Variables   

## Visualization Protocol for Categorical Variables   

## Visualization Protocol for Quantitative-Categorical  

## Visualization Protocol for Categorical-Categorical   








<br>




<br>



<br>


 

# Descripción Estadistica Básica 



A continuación vamos a realizar una descripción estadistica básica de las variables, a traves de dicersos estadisticos básicos.


## Estadisticos básicos para las variables cuantitativas

Para las variables cuantitativas:

```python
Netflix_Data.describe()
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
      <th>release_year</th>
      <th>runtime</th>
      <th>seasons</th>
      <th>imdb_score</th>
      <th>imdb_votes</th>
      <th>tmdb_popularity</th>
      <th>tmdb_score</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>count</th>
      <td>5850.000000</td>
      <td>5850.000000</td>
      <td>2106.000000</td>
      <td>5368.000000</td>
      <td>5.352000e+03</td>
      <td>5759.000000</td>
      <td>5539.000000</td>
    </tr>
    <tr>
      <th>mean</th>
      <td>2016.417094</td>
      <td>76.888889</td>
      <td>2.162868</td>
      <td>6.510861</td>
      <td>2.343938e+04</td>
      <td>22.637925</td>
      <td>6.829175</td>
    </tr>
    <tr>
      <th>std</th>
      <td>6.937726</td>
      <td>39.002509</td>
      <td>2.689041</td>
      <td>1.163826</td>
      <td>9.582047e+04</td>
      <td>81.680263</td>
      <td>1.170391</td>
    </tr>
    <tr>
      <th>min</th>
      <td>1945.000000</td>
      <td>0.000000</td>
      <td>1.000000</td>
      <td>1.500000</td>
      <td>5.000000e+00</td>
      <td>0.009442</td>
      <td>0.500000</td>
    </tr>
    <tr>
      <th>25%</th>
      <td>2016.000000</td>
      <td>44.000000</td>
      <td>1.000000</td>
      <td>5.800000</td>
      <td>5.167500e+02</td>
      <td>2.728500</td>
      <td>6.100000</td>
    </tr>
    <tr>
      <th>50%</th>
      <td>2018.000000</td>
      <td>83.000000</td>
      <td>1.000000</td>
      <td>6.600000</td>
      <td>2.233500e+03</td>
      <td>6.821000</td>
      <td>6.900000</td>
    </tr>
    <tr>
      <th>75%</th>
      <td>2020.000000</td>
      <td>104.000000</td>
      <td>2.000000</td>
      <td>7.300000</td>
      <td>9.494000e+03</td>
      <td>16.590000</td>
      <td>7.537500</td>
    </tr>
    <tr>
      <th>max</th>
      <td>2022.000000</td>
      <td>240.000000</td>
      <td>42.000000</td>
      <td>9.600000</td>
      <td>2.294231e+06</td>
      <td>2274.044000</td>
      <td>10.000000</td>
    </tr>
  </tbody>
</table>
</div>


<br>

## Estadisticos básicos para las variables categóricas

Para las variables categóricas (no cuantitativas, en general) : 

```python
Netflix_Data.loc[: , ['title', 'description', 'age_certification', 'genres', 'production_countries' ]].describe()
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
      <th>title</th>
      <th>description</th>
      <th>age_certification</th>
      <th>genres</th>
      <th>production_countries</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>count</th>
      <td>5849</td>
      <td>5832</td>
      <td>3231</td>
      <td>5850</td>
      <td>5850</td>
    </tr>
    <tr>
      <th>unique</th>
      <td>5798</td>
      <td>5829</td>
      <td>11</td>
      <td>1726</td>
      <td>452</td>
    </tr>
    <tr>
      <th>top</th>
      <td>The Gift</td>
      <td>Five families struggle with the ups and downs ...</td>
      <td>TV-MA</td>
      <td>['comedy']</td>
      <td>['US']</td>
    </tr>
    <tr>
      <th>freq</th>
      <td>3</td>
      <td>2</td>
      <td>883</td>
      <td>484</td>
      <td>1959</td>
    </tr>
  </tbody>
</table>
</div>


<br>




 

## Gráficos conjuntos  para las variables cuantitativas

En esta seccion vamos a hacer un analisis gráfico básico de las variables cuantitativas, consideradas de manera conjunta.

Cargamos las librerias necesarias para los gráficos:
```python
import numpy as np

import seaborn as sns
import matplotlib as mpl
import matplotlib.pyplot as plt
```

### Histograma conjunto de las variables cuantitativas

Vamos a generar un grafico con un histograma para cada una de las variables cuantitativas:

```python
fig, axs = plt.subplots(3, 3, figsize=(11, 11))

p1 = sns.histplot(data=Netflix_Data, x="release_year", stat="proportion", bins=15, color="skyblue", ax=axs[0, 0])
 

p2 = sns.histplot(data=Netflix_Data, x="runtime", stat="proportion", bins=15, color="olive", ax=axs[0, 1])
p2.axes.set(xlabel='runtime', ylabel=' ')
 

p3 = sns.histplot(data=Netflix_Data, x="seasons", stat="proportion", bins=15, color="blue", ax=axs[0, 2])
p3.axes.set(xlabel='seasons', ylabel=' ')
 

p4 = sns.histplot(data=Netflix_Data, x="imdb_score", stat="proportion", bins=15, color="teal", ax=axs[1, 0])
p4.axes.set(xlabel='imdb_score', ylabel=' ')
 

p5 = sns.histplot(data=Netflix_Data, x="imdb_votes", stat="proportion", bins=15, color="purple", ax=axs[1, 1])
p5.axes.set(xlabel='imdb_votes', ylabel=' ')
 

p6 = sns.histplot(data=Netflix_Data, x="tmdb_popularity", stat="proportion", bins=15, color="pink", ax=axs[1, 2])
p6.axes.set(xlabel='tmdb_popularity', ylabel=' ')
 
 
p7 = sns.histplot(data=Netflix_Data, x="tmdb_score", stat="proportion", bins=15, color="red", ax=axs[2, 0])
p7.axes.set(xlabel='tmdb_score', ylabel=' ')
 
fig.savefig('p1.png', format='png', dpi=1200)

plt.show()
```

<br>

<center>

![Histograma conjunto de las variables cuantitativas](p1.png){width="80%"}

</center>

<br>
    
    


### Box-Plot conjunto de las variables cuantitativas

Vamos a generar un grafico con un box-plot para cada una de las variables cuantitativas:

```python
fig, axs = plt.subplots(3, 3, figsize=(11, 11))

p1 = sns.boxplot(data=Netflix_Data, x="release_year", color="skyblue", ax=axs[0, 0])
 

p2 = sns.boxplot(data=Netflix_Data, x="runtime",  color="olive", ax=axs[0, 1])
p2.axes.set(xlabel='runtime', ylabel=' ')
p2.set_xticks( range(int(Netflix_Data['runtime'].min()) , int(Netflix_Data['runtime'].max()) , 100) )
p2.set_yticks( np.arange(0, 1, 0.1)  )

p3 = sns.boxplot(data=Netflix_Data, x="seasons", color="blue", ax=axs[0, 2])
p3.axes.set(xlabel='seasons', ylabel=' ')
 

p4 = sns.boxplot(data=Netflix_Data, x="imdb_score", color="teal", ax=axs[1, 0])
p4.axes.set(xlabel='imdb_score', ylabel=' ')
p4.set_xticks( range(int(Netflix_Data['imdb_score'].min()) , int(Netflix_Data['imdb_score'].max()) , 300) )
p4.set_yticks( np.arange(0, 1, 0.1)  )

p5 = sns.boxplot(data=Netflix_Data, x="imdb_votes", color="purple", ax=axs[1, 1])
p5.axes.set(xlabel='imdb_votes', ylabel=' ')
p5.set_xticks( range(int(Netflix_Data['imdb_votes'].min()) , int(Netflix_Data['imdb_votes'].max()/2) , 500000) )
p5.set_yticks( np.arange(0, 1, 0.1)  )

p6 = sns.boxplot(data=Netflix_Data, x="tmdb_popularity", color="pink", ax=axs[1, 2])
p6.axes.set(xlabel='tmdb_popularity', ylabel=' ')
p6.set_xticks( range(int(Netflix_Data['tmdb_popularity'].min()) , int(Netflix_Data['tmdb_popularity'].max()+1) , 1000) )
p6.set_yticks( np.arange(0, 1, 0.1)  )
 
p7 = sns.boxplot(data=Netflix_Data, x="tmdb_score", color="red", ax=axs[2, 0])
p7.axes.set(xlabel='tmdb_score', ylabel=' ')
p7.set_xticks( range(int(Netflix_Data['tmdb_score'].min()) , int(Netflix_Data['tmdb_score'].max()+1) , 2) )
p7.set_yticks( np.arange(0, 1, 0.1)  )

plt.show()
```


<br>

<center>

![Box-Plot conjunto de las variables cuantitativas](p2.png){width="80%"}

</center>

<br>
    

### Empirical-Cumulative-Distribution-Function-Plot conjunto de las variables cuantitativas

Vamos a generar un grafico con un ECDF-plot para cada una de las variables cuantitativas:

```python
fig, axs = plt.subplots(3, 3, figsize=(11, 11))

p1 = sns.ecdfplot(data=Netflix_Data, x="release_year", color="skyblue", ax=axs[0, 0])
p1.set_xticks( range(int(Netflix_Data['release_year'].min()) , int(Netflix_Data['release_year'].max()+20) , 20) )
p1.set_yticks( np.arange(0, 1, 0.1)  )

p2 = sns.ecdfplot(data=Netflix_Data, x="runtime",  color="olive", ax=axs[0, 1])
p2.axes.set(xlabel='runtime', ylabel=' ')
p2.set_xticks( range(int(Netflix_Data['runtime'].min()) , int(Netflix_Data['runtime'].max()) , 100) )
p2.set_yticks( np.arange(0, 1, 0.1)  )

p3 = sns.ecdfplot(data=Netflix_Data, x="seasons", color="blue", ax=axs[0, 2])
p3.axes.set(xlabel='seasons', ylabel=' ')
p3.set_xticks( range(int(Netflix_Data['seasons'].min()) , int(Netflix_Data['seasons'].max()) , 4) )
p3.set_yticks( np.arange(0, 1, 0.1)  )

p4 = sns.ecdfplot(data=Netflix_Data, x="imdb_score", color="teal", ax=axs[1, 0])
p4.axes.set(xlabel='imdb_score', ylabel=' ')
p4.set_xticks( range(int(Netflix_Data['imdb_score'].min()) , int(Netflix_Data['imdb_score'].max()) , 300) )
p4.set_yticks( np.arange(0, 1, 0.1)  )

p5 = sns.ecdfplot(data=Netflix_Data, x="imdb_votes", color="purple", ax=axs[1, 1])
p5.axes.set(xlabel='imdb_votes', ylabel=' ')
p5.set_xticks( range(int(Netflix_Data['imdb_votes'].min()) , int(Netflix_Data['imdb_votes'].max()/2) , 500000) )
p5.set_yticks( np.arange(0, 1, 0.1)  )

p6 = sns.ecdfplot(data=Netflix_Data, x="tmdb_popularity", color="pink", ax=axs[1, 2])
p6.axes.set(xlabel='tmdb_popularity', ylabel=' ')
p6.set_xticks( range(int(Netflix_Data['tmdb_popularity'].min()) , int(Netflix_Data['tmdb_popularity'].max()+1) , 1000) )
p6.set_yticks( np.arange(0, 1, 0.1)  )
 
p7 = sns.ecdfplot(data=Netflix_Data, x="tmdb_score", color="red", ax=axs[2, 0])
p7.axes.set(xlabel='tmdb_score', ylabel=' ')
p7.set_xticks( range(int(Netflix_Data['tmdb_score'].min()) , int(Netflix_Data['tmdb_score'].max()+1) , 50) )
p7.set_yticks( np.arange(0, 1, 0.1)  )

plt.show()
```


    
<br>

<center>

![ECDF-Plot conjunto de las variables cuantitativas](p3.png){width="80%"}

</center>

<br>
    








## Gráficos conjuntos  para las variables categoricas


### Bar-plot conjunto de las variables categóricas

Vamos a generar un grafico con un  bar-plot para cada una de las variables categóricas, excepto para aquellas cuyo nº de categorias es excesivo, y por tanto no es práctico el gráfico:

```python
fig, axs = plt.subplots(1, 2, figsize=(13, 6))

p1 = sns.countplot(x='type', data=Netflix_Data, ax=axs[0]) 
p1.set_xticklabels(['Movie', 'Show'])
p1.axes.set(xlabel='type', ylabel='count')

p2 = sns.countplot(x='age_certification', data=Netflix_Data, ax=axs[1]) 

plt.show()
```

<br>

<center>

![Bar-Plot conjunto de variables categoricas](p4.png){width="75%"}

</center>

<br>

# Análisis Estadístico

En la sección anterior se hizo una descripción estadistica básica de las variables del data-set con el que estamos trabajando, pero no se ha hecho ningun analisis de los resultados obtenidos. 

En esta seccion además de ampliar la descripción estadistica de los datos, se llevará a cabo un analisis de los resultados obtenidos.

 
