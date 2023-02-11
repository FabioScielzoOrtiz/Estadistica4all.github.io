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

`info()` method give us column names, number of non null values in each column and column type.

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


We can change the type of a column with `astype()` method.

First, we check type of *release_year* variable is `int64`.

```python
Netflix_Data.dtypes['release_year']
```

    dtype('int64')


Now, we can change that type to `float64` using the following function:

 
```python
def change_type(Data, Variable_name, New_type):

    Data[Variable_name] = Data[Variable_name].astype(New_type)
```
 
```python
change_type(Data=Netflix_Data, Variable_name='release_year', New_type='float64')
```
 
 

We can check if the changes have been done correctly:

```python
Netflix_Data.dtypes['release_year']
```

    dtype('float64')

<br>

## Unique values of a variable


We can get the uniques values of a variable with the `unique()` method.


We can get the uniques values of `type` as following :

```python
Netflix_Data['type'].unique()
```

    array(['SHOW', 'MOVIE'], dtype=object)


$\\$


We can get the uniques values of `age_certification` as following :

```python
Netflix_Data['age_certification'].unique()
```

    array(['TV-MA', 'R', 'PG', nan, 'TV-14', 'PG-13', 'TV-PG', 'TV-Y', 'TV-G', 'TV-Y7', 'G', 'NC-17'], dtype=object)


$\\$

We can get the uniques values of `production_countries` as following :

```python
Netflix_Data['production_countries'].unique()     
```

```
array(["['US']", "['GB']", "['GB', 'US']", "['EG']", "['DE']", "['IN']",
       "['SU', 'IN']", "['LB', 'CA', 'FR']", '[]', "['LB']",
       "['DZ', 'EG']", "['CA', 'FR', 'LB']", "['US', 'GB']",
       "['US', 'IT']", "['JP']", "['AR']", "['FR', 'EG']", "['FR', 'LB']",
       "['CA', 'US']", "['US', 'FR']", "['JP', 'US']", "['US', 'CA']",
       "['DE', 'US']", "['PE', 'US', 'BR']", "['IT', 'US', 'FR']",
       "['IE', 'GB', 'DE', 'FR']", "['HK', 'US']", "['AU']", "['FR']",
       "['DE', 'GH', 'GB', 'US', 'BF']", "['MX']", "['ES', 'AR']",
       "['CO']", "['PS', 'US', 'FR', 'DE']", "['FR', 'NO', 'LB', 'BE']",
       "['BE', 'FR', 'IT', 'LB']", "['TR']", "['IN', 'SU']", "['DK']",
       "['CA']", "['DE', 'GB', 'US', 'BS', 'CZ']", "['MT', 'GB', 'US']",
       "['AU', 'DE', 'GB', 'US']", "['US', 'JP']", "['BE', 'US']",
       "['HK']", "['IT']", "['US', 'FR', 'DE', 'GB']",
       "['GB', 'US', 'FR', 'DE']", "['IT', 'US']", "['US', 'ZA']",
       "['GB', 'ES']", "['GB', 'US', 'JP']", "['HK', 'CN']",
       "['GB', 'US', 'BG']", "['RU']", "['KR']", "['CA', 'US', 'IN']",
       "['CN']", "['JP', 'HK']", "['CA', 'GB', 'US']",
       "['FR', 'MX', 'ES']", "['IN', 'US']", "['AR', 'ES']", "['CL']",
       "['FR', 'MA', 'DE', 'PS']", "['AR', 'DE', 'UY', 'ES']",
       "['CL', 'AR']", "['CZ', 'GB', 'DK', 'NL', 'SE']", "['TW']",
       "['SG']", "['NG']", "['MY']", "['Lebanon']",
       "['BE', 'FR', 'ES', 'CH', 'PS']", "['ZA']", "['NG', 'US']",
       "['LB', 'FR']", "['CN', 'HK']", "['PH']", "['LB', 'GB', 'FR']",
       "['FR', 'DE', 'KW', 'PS']", "['PS']",
       "['GB', 'US', 'AT', 'FR', 'DE', 'NG']", "['XX']", "['AE', 'US']",
       "['DK', 'US']", "['FR', 'US', 'GB']", "['HU', 'US', 'CA']",
       "['NO']", "['GB', 'FR', 'DE']", "['US', 'HU', 'IT']",
       "['US', 'ZA', 'DE']", "['IN', 'DE']", "['SA']", "['ID']",
       "['US', 'LB', 'AE']", "['PS', 'NL', 'US', 'AE']",
       "['US', 'FR', 'GB']", "['US', 'DE', 'GB']", "['GB', 'ZA']",
       "['US', 'CA', 'CL']", "['US', 'GB', 'CN', 'CA']",
       "['AU', 'CH', 'GB']", "['ES']", "['FI']", "['IL']", "['FR', 'US']",
       "['AU', 'US']", "['CA', 'US', 'GB']", "['AT']", "['CD', 'GB']",
       "['US', 'BR']", "['CA', 'JP', 'US']", "['CA', 'KR']",
       "['US', 'EG', 'GB']", "['BR']", "['PL']", "['VE', 'AR']", "['RO']",
       "['IL', 'NO', 'ZA', 'AE', 'GB', 'IS', 'IE']",
       "['US', 'CN', 'DE', 'SG', 'UA']", "['DE', 'IT', 'PS', 'FR']",
       "['AE', 'LB']", "['LB', 'AE']", "['US', 'ES']", "['NZ']",
       "['GB', 'US', 'FR']", "['US', 'FR', 'LU', 'GB']", "['FR', 'BE']",
       "['IT', 'GB']", "['US', 'CA', 'GB']", "['CA', 'FR']",
       "['US', 'CN']", "['UA']", "['MX', 'ZA', 'US']",
       "['US', 'GB', 'ES']", "['BE', 'DK', 'DE', 'GB', 'US']",
       "['GB', 'IR', 'JO', 'QA']", "['CH', 'US']", "['CA', 'DE', 'GB']",
       "['GH', 'US']", "['IE', 'GB']", "['CN', 'US']",
       "['UA', 'GB', 'US']", "['IE', 'ZA']", "['US', 'FR', 'MT']",
       "['BG']", "['GB', 'FR']", "['BY']", "['IE']", "['IS']",
       "['AU', 'FR', 'DE']", "['CN', 'FR', 'CA']", "['FR', 'QA']",
       "['SE']", "['FR', 'ES']", "['NL']", "['HR']", "['FR', 'MA']",
       "['RU', 'US', 'FR']", "['SY', 'GB']", "['AT', 'US']", "['CD']",
       "['FR', 'CL']", "['AU', 'GB']", "['TN']", "['AE']", "['SE', 'NO']",
       "['GL', 'FR']", "['LB', 'DE']", "['PT', 'SE', 'DK', 'BR', 'FR']",
       "['QA', 'LB']", "['GB', 'AU', 'US']", "['ES', 'DK']",
       "['AE', 'FR', 'JO', 'LB', 'QA', 'PS']", "['US', 'CA', 'JP']",
       "['PK']", "['IN', 'GB']", "['PS', 'FR', 'DE']", "['CZ']",
       "['CA', 'NG']", "['VN']", "['NL', 'GB']",
       "['CA', 'HU', 'MX', 'ES', 'GB', 'US']", "['FR', 'GB', 'US']",
       "['FR', 'NL', 'GB', 'US']", "['CN', 'CA', 'US']", "['CA', 'GB']",
       "['KR', 'US']", "['FR', 'RO', 'GB', 'BE', 'DE']", "['US', 'MX']",
       "['HK', 'IS', 'US']", "['IN', 'CN', 'US', 'GB']", "['BE', 'FR']",
       "['PR', 'US', 'GB', 'CN']", "['GB', 'DE']", "['US', 'PR']",
       "['IT', 'CH', 'FR']", "['IT', 'ES', 'FR']", "['US', 'IS', 'NO']",
       "['IQ', 'GB']", "['HU']", "['US', 'AU', 'GB']",
       "['CZ', 'GB', 'US']", "['US', 'IE', 'CA']", "['TH']",
       "['IR', 'US', 'FR']", "['BE']",
       "['GB', 'ID', 'CA', 'CN', 'SG', 'US']", "['ES', 'FR']",
       "['SG', 'GB', 'US']", "['GE', 'DE', 'FR']", "['CA', 'US', 'DE']",
       "['CA', 'IE']", "['NL', 'BE']", "['US', 'KH']", "['FR', 'JP']",
       "['PR']", "['US', 'CA', 'CN']", "['CN', 'US', 'ES']",
       "['CU', 'US']", "['BG', 'US']", "['US', 'BG']",
       "['US', 'DK', 'GB']", "['ES', 'IT']", "['TR', 'US']",
       "['PE', 'DE', 'NO']", "['LU', 'US', 'FR']",
       "['IL', 'MA', 'US', 'BG', 'GB']", "['AR', 'CL']",
       "['AR', 'ES', 'UY']", "['JP', 'CN']", "['US', 'AU']",
       "['QA', 'TN', 'FR']", "['ES', 'MX']", "['PH', 'SG']",
       "['US', 'AE']", "['DE', 'DK', 'NL', 'GB']", "['NL', 'MX']",
       "['CA', 'CN']", "['NO', 'SE', 'DK', 'NL']", "['US', 'DE', 'ZA']",
       "['IS', 'SE', 'BE']", "['DE', 'ES']", "['CN', 'FR', 'TW', 'US']",
       "['KH']", "['BE', 'FR', 'IT']", "['DE', 'CH']",
       "['JP', 'KR', 'FR']", "['DE', 'NZ', 'GB']", "['PE']",
       "['MX', 'US']", "['US', 'DK']", "['PL', 'US']", "['KE']", "['GH']",
       "['IT', 'CH', 'VA', 'FR', 'DE']", "['PE', 'GB', 'US', 'IL', 'IT']",
       "['SA', 'SY', 'AE']", "['US', 'KR']", "['IN', 'FR']",
       "['RS', 'PL', 'RU']", "['CL', 'NL', 'FR']", "['IE', 'CA']",
       "['US', 'NL']", "['TZ']", "['IT', 'ES']", "['ID', 'MY', 'SG']",
       "['FR', 'LU', 'CA']", "['FR', 'QA', 'TN', 'BE']",
       "['PL', 'CH', 'AL', 'IT']", "['CZ', 'US']", "['AR', 'FR']",
       "['DE', 'IT']", "['IT', 'FR']", "['MX', 'FI']", "['CA', 'BR']",
       "['IN', 'MX']", "['BR', 'DK', 'FR', 'DE', 'PL', 'AR']",
       "['ZA', 'US', 'CA']", "['ES', 'BE']", "['PY']", "['US', 'NG']",
       "['US', 'BE', 'GB']", "['ZW']", "['IT', 'AR']",
       "['AT', 'IQ', 'US']", "['GE']", "['AR', 'IT']", "['NG', 'NO']",
       "['IS', 'GB']", "['MX', 'CO']", "['AR', 'US']", "['KW']",
       "['JP', 'GB']", "['TW', 'US']", "['NP', 'IN']",
       "['AU', 'US', 'CN']", "['FR', 'IN', 'SG']", "['LB', 'PS']",
       "['JP', 'US', 'CA']", "['CM']", "['BD', 'IN']", "['CA', 'ZA']",
       "['FR', 'PS', 'CH', 'QA']", "['NL', 'JO', 'DE']",
       "['GB', 'DK', 'GR']", "['MX', 'AR']", "['US', 'CL', 'MX']",
       "['KG']", "['CH']", "['BD']", "['LU']", "['ZA', 'GB']",
       "['BT', 'CN']", "['CA', 'HU', 'US']", "['BE', 'LT', 'NL']",
       "['IT', 'MC', 'US', 'CA']", "['CN', 'US', 'AU', 'CA']",
       "['BE', 'SE', 'GB']", "['GB', 'CZ', 'FR']", "['US', 'MW', 'GB']",
       "['US', 'CY']", "['BE', 'FR', 'SN']", "['BR', 'FR', 'ES', 'BE']",
       "['US', 'CH']", "['US', 'IL']", "['FR', 'LT', 'GB']",
       "['GB', 'IE']", "['GB', 'IT']", "['JO', 'TH', 'US', 'AL']",
       "['PT', 'US']", "['IL', 'US', 'FR', 'DE']", "['TW', 'MY']",
       "['US', 'CA', 'FR', 'ES']", "['FI', 'NO']", "['US', 'FR', 'JP']",
       "['GB', 'JP']", "['US', 'CN', 'GB']",
       "['US', 'FR', 'SE', 'GB', 'DE', 'DK', 'CA']", "['DE', 'AT']",
       "['US', 'TH']", "['PH', 'US']", "['BR', 'MX']", "['NO', 'CA']",
       "['CO', 'ES']", "['CN', 'DE', 'GB']", "['NO', 'DE']",
       "['ES', 'PT']", "['IL', 'US']", "['ES', 'BE', 'DE']",
       "['TH', 'US']", "['US', 'FR', 'ES']", "['ES', 'FR', 'AR']",
       "['NL', 'PL', 'UA', 'GB', 'US']", "['QA', 'PS']",
       "['RS', 'UY', 'AR']", "['FR', 'IT']", "['CA', 'LK']",
       "['US', 'AR']", "['EG', 'US']", "['US', 'IN']",
       "['FR', 'LU', 'BE', 'KH']", "['US', 'BE', 'ES']",
       "['CA', 'FR', 'JP', 'GB', 'US']", "['AT', 'DE']",
       "['US', 'GB', 'DE']", "['FR', 'MX', 'CO']", "['BR', 'FR']",
       "['JO']", "['FR', 'IN', 'QA']", "['AR', 'PE']", "['MU']",
       "['DE', 'DK', 'EG']", "['US', 'IE']", "['IO']", "['TW', 'CN']",
       "['FR', 'NL', 'SG']", "['SN']", "['UY']", "['DE', 'IN', 'AT']",
       "['MA', 'FR', 'QA']", "['PS', 'PH']", "['EG', 'SA']",
       "['ES', 'CN']", "['CL', 'AR', 'CA']", "['AR', 'CO']",
       "['GT', 'UY']", "['AF', 'DE', 'PS']", "['ZA', 'AO']",
       "['HK', 'PH']", "['SG', 'MY']", "['SE', 'US']",
       "['LB', 'US', 'NL', 'CA']", "['NL', 'PS', 'US', 'LB']",
       "['DK', 'LB', 'GB']", "['UY', 'MX', 'ES']", "['PH', 'JP']",
       "['CN', 'JP', 'US']", "['NA']", "['LB', 'QA', 'SY', 'FR']",
       "['PS', 'DK', 'LB']", "['US', 'CZ']",
       "['GB', 'AU', 'CA', 'GR', 'NZ']", "['GR', 'GB', 'US']",
       "['DE', 'FR']", "['NL', 'US']", "['AT', 'GB', 'US']",
       "['CH', 'DE']", "['GB', 'US', 'DE']", "['DK', 'IS']",
       "['FR', 'DE', 'US']", "['US', 'JP', 'TH']", "['FR', 'DE']",
       "['RO', 'US']", "['ES', 'KN']", "['SE', 'GB']",
       "['SG', 'US', 'IN']", "['DE', 'AU']", "['GB', 'CA']",
       "['IE', 'US', 'CA']", "['PT']", "['US', 'PL', 'KR']",
       "['LU', 'FR']", "['IT', 'BR']", "['GB', 'HU', 'NL', 'CH']",
       "['BR', 'DE', 'QA', 'MX', 'US', 'CH', 'AR']", "['ES', 'PE']",
       "['BE', 'GB', 'DE']", "['ZA', 'GB', 'US']", "['CL', 'PE']",
       "['CA', 'CN', 'US']", "['SG', 'US']", "['BR', 'US']",
       "['BE', 'NL']", "['RU', 'US']", "['ES', 'US']", "['CZ', 'DE']",
       "['NZ', 'HK']", "['MA', 'SA', 'TN', 'EG', 'LB']", "['CN', 'GB']",
       "['AF']", "['BE', 'LU']", "['BE', 'DE']", "['SE', 'RO']",
       "['ZA', 'US']", "['GB', 'IN']", "['HU', 'CA']", "['NG', 'CA']",
       "['TZ', 'GB']", "['PH', 'FO']"], dtype=object)

```



<br>

## NaN identification   

A NaN is a not a number value. **NaN** is equivalent to **missing value**.

We are going to calculate, for each variable, the proportion of missing values over the total number of observations. We can do it using `isnull()` method :

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

Scaling a variable is applying a transformation, in order to obtain new properties for the transformed variable, properties that the original variable doesn't have.

In this article, we will focus on three scaling methods: standard scaling, normalization (0,1), and normalization (a,b).

In any case, there are more procedures that will not be explored here, so for a more extensive list, it is recommended to consult the `sklearn` documentation on this topic: https://scikit-learn.org/stable/modules/preprocessing.html


Some of the concepts that appear in this secction will be explained with more details in Statistical Description section, such as the concept of statistical variable, sample, mean and variance.


<br>


### Standard Scaling

Given a **quantitative** statistical variable $\hspace{0.05cm}\mathcal{X}_k\hspace{0.05cm}$, and a sample  $\hspace{0.05cm}X_k \hspace{0.05cm} = \hspace{0.05cm} \left( \hspace{0.01cm} x_{1k} \hspace{0.01cm} , \hspace{0.01cm}x_{2k}\hspace{0.01cm},\dots ,\hspace{0.01cm} x_{nk} \hspace{0.01cm}\right)^t\hspace{0.05cm}$ of that statistical variable.
 
 
<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>


$\hspace{0.25cm}$ The **standard scaling** version of   $\hspace{0.07cm} X_k\hspace{0.07cm}$ is defined as: $\\[0.25cm]$

$$X_k^{std} \hspace{0.1cm} =\hspace{0.1cm} \dfrac{X_k - \overline{X}_k}{\sigma(X_k)} \\$$


</p>
 
</p></span>
</div>



**Properties:**


- $\hspace{0.1cm}  \overline{\hspace{0.01cm}X\hspace{0.07cm}}_k^{\hspace{0.07cm}std}  \hspace{0.1cm} =\hspace{0.1cm} 0 \\[0.8cm]$


- $\hspace{0.2cm} \sigma\left(\hspace{0.07cm} X_k^{\hspace{0.07cm}std} \hspace{0.07cm}\right)^2 \hspace{0.1cm} =\hspace{0.1cm} 1 \\$



**Proof :** 

- $\overline{X}_k ^{\hspace{0.07cm}std}   \hspace{0.1cm} =\hspace{0.1cm} \overline{ \left( \dfrac{X_k - \overline{X_k}}{\sigma(X_j)} \right) } \hspace{0.1cm} = \hspace{0.1cm} \dfrac{1}{\sigma(X_j)} \cdot \left( \hspace{0.12cm} \overline{ \hspace{0.08cm} X_j - \overline{X_k} \hspace{0.08cm} } \hspace{0.12cm} \right) \hspace{0.1cm} = \hspace{0.1cm} \dfrac{1}{\sigma(X_j)} \cdot \left(  \hspace{0.12cm}  \overline{X_j} - \overline{  \hspace{0.08cm} \overline{X_j} \hspace{0.08cm} } \hspace{0.12cm} \right) \hspace{0.1cm} = \hspace{0.1cm} \dfrac{1}{\sigma(X_j)} \cdot \left( \hspace{0.08cm}  \overline{X_j} -  \overline{X_j}  \hspace{0.08cm} \right) \hspace{0.1cm} =\hspace{0.1cm} \dfrac{1}{\sigma(X_j)} \hspace{0.07cm}\cdot \hspace{0.07cm} 0 \hspace{0.1cm}=\hspace{0.1cm} 0 \\[0.8cm]$ $\\[0.6cm]$

- $\sigma\left( X_k^{\hspace{0.07cm}std} \right)^2 \hspace{0.1cm} =\hspace{0.1cm}  \sigma\left( \dfrac{X_k - \overline{X_k}
}{\sigma(X_k)} \right)^2 \hspace{0.1cm} =\hspace{0.1cm} \dfrac{1}{\sigma(X_k)^2} \cdot \sigma\left( \hspace{0.08cm} X_k - \overline{X_k}   \hspace{0.08cm} \right)^2 \hspace{0.1cm} =\hspace{0.1cm}  \dfrac{1}{\sigma(X_k)^2} \cdot \sigma( \hspace{0.08cm} X_j   \hspace{0.08cm} )^2  \hspace{0.1cm}=\hspace{0.1cm} 1$


<br>


#### Standard Scaling in `Python`

```python
from sklearn import preprocessing
```

```python
scaler = preprocessing.StandardScaler().fit(Netflix_Data[['release_year']])
```

```python
Netflix_Data['release_year_std_scaling'] = scaler.transform(Netflix_Data[['release_year']])
```

```python
Netflix_Data['release_year_std_scaling']
```

```
0      -10.294901
1       -5.826196
2       -6.402803
3       -5.970348
4       -7.123562
          ...    
5845     0.660634
5846     0.660634
5847     0.660634
5848     0.660634
5849     0.660634
Name: release_year_std_scaling, Length: 5850, dtype: float64
```


```python
Netflix_Data['release_year_std_scaling'].mean()
```

     -1.010549668636587e-14


```python
Netflix_Data['release_year_std_scaling'].std()
```

     1.0000854810447344


<br>


### Standardization (0,1)

Given a **quantitative** statistical variable $\hspace{0.05cm}\mathcal{X}_k\hspace{0.05cm}$, and a sample  $\hspace{0.05cm}X_k \hspace{0.05cm} = \hspace{0.05cm} \left( \hspace{0.01cm} x_{1k} \hspace{0.01cm} , \hspace{0.01cm}x_{2k}\hspace{0.01cm},\dots ,\hspace{0.01cm} x_{nk} \hspace{0.01cm}\right)^t\hspace{0.05cm}$ of that statistical variable.
 
 
<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>

 
$\hspace{0.25cm}$ The standardization a $\hspace{0.05cm}(0,1)\hspace{0.05cm}$ version of $\hspace{0.07cm}X_k\hspace{0.07cm}$ is defined as: $\\[0.5cm]$

$$X_k^{std(0,1)} \hspace{0.07cm}=\hspace{0.07cm} \dfrac{\hspace{0.07cm} X_k - Min(X_k) \hspace{0.07cm}}{Max(X_k) - Min(X_k)} \\$$

</p>
 
</p></span>
</div>

 
**Properties :**

- $\hspace{0.1cm} Max \left(X_j^{std(0,1)} \right) \hspace{0.1cm}=\hspace{0.1cm} 1 \\[0.8cm]$

- $\hspace{0.1cm} Min \left( X_j^{std(0,1)} \right) \hspace{0.1cm}=\hspace{0.1cm} 0 \\$



**Proof :**

- $\hspace{0.1cm} Max \left( X_k^{std(0,1)} \right) \hspace{0.1cm} = \hspace{0.1cm} \dfrac{\hspace{0.07cm} Max(X_k) - Min(X_k) \hspace{0.07cm}}{Max(X_k) - Min(X_k)} \hspace{0.1cm}=\hspace{0.1cm} 1 \\[0.8cm]$

- $\hspace{0.1cm} Min \left( X_k^{std(0,1)} \right) \hspace{0.1cm}=\hspace{0.1cm} \dfrac{\hspace{0.07cm} Min(X_k) - Min(X_k) \hspace{0.07cm}}{Max(X_k) - Min(X_k)} \hspace{0.1cm}=\hspace{0.1cm} 0$


<br>

#### Standardization (0,1) in `Python`


```python
min_max_scaler = preprocessing.MinMaxScaler(feature_range=(0,1))
```

```python
Netflix_Data['release_year_norm_0_1'] = min_max_scaler.fit_transform(Netflix_Data[['release_year']])
```

```python
Netflix_Data['release_year_norm_0_1']
```

```
0       0.000000
1       0.402597
2       0.350649
3       0.389610
4       0.285714
          ...   
5845    0.987013
5846    0.987013
5847    0.987013
5848    0.987013
5849    0.987013
Name: release_year_norm_0_1, Length: 5850, dtype: float64
```

```python
Netflix_Data['release_year_norm_0_1'].min()
```

    0.0

```python
Netflix_Data['release_year_norm_0_1'].max()
```

    1.0





<br>


### Standardization (a,b)


Given a **quantitative** statistical variable $\hspace{0.05cm}\mathcal{X}_k\hspace{0.05cm}$, and a sample  $\hspace{0.05cm}X_k \hspace{0.05cm} = \hspace{0.05cm} \left( \hspace{0.01cm} x_{1k} \hspace{0.01cm} , \hspace{0.01cm}x_{2k}\hspace{0.01cm},\dots ,\hspace{0.01cm} x_{nk} \hspace{0.01cm}\right)^t\hspace{0.05cm}$ of that statistical variable.
 
 
<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>

 
$\hspace{0.25cm}$ The standardization a $\hspace{0.05cm}(a,b)\hspace{0.05cm}$ version of $\hspace{0.07cm}X_k\hspace{0.07cm}$ is defined as: $\\[0.5cm]$

 

$$X_k^{std(a,b)} \hspace{0.07cm}=\hspace{0.07cm} X_k^{std(0,1)} \cdot (b - a) + a \\$$


$\hspace{0.25cm}$ where: $a, b \in \mathbb{R} \\$

</p>
 
</p></span>
</div>



**Properties :**

- $\hspace{0.1cm} Max \left(X_k^{std(a,b)} \right) = b \\[0.8cm]$

- $\hspace{0.1cm} Min \left( X_k^{std(a,b)} \right) = a \\$



**Proof :**

- $\hspace{0.1cm} Max \left(X_k^{std(a,b)} \right) \hspace{0.07cm}=\hspace{0.07cm} Max \left(X_k^{std(0,1)} \right)\cdot (a-b)+b \hspace{0.07cm}=\hspace{0.07cm} 1\cdot (b-a)+a \hspace{0.07cm}=\hspace{0.07cm} b \\[0.8cm]$

- $\hspace{0.1cm} Min \left(X_k^{std(a,b)} \right) \hspace{0.07cm}=\hspace{0.07cm} Min \left(X_k^{std(0,1)} \right)\cdot (a-b)+b \hspace{0.07cm}=\hspace{0.07cm} 0\cdot (b-a)+a \hspace{0.07cm}=\hspace{0.07cm} a$


<br>


### Standardization (a,b) in `Python`

```python
min_max_scaler = preprocessing.MinMaxScaler(feature_range=(2,7))
```

```python
Netflix_Data['release_year_norm_2_7'] = min_max_scaler.fit_transform(Netflix_Data[['release_year']])
```


```python
Netflix_Data['release_year_norm_2_7']
```

``` 
0       2.000000
1       4.012987
2       3.753247
3       3.948052
4       3.428571
          ...   
5845    6.935065
5846    6.935065
5847    6.935065
5848    6.935065
5849    6.935065
Name: release_year_norm_2_7, Length: 5850, dtype: float64
```

```python
Netflix_Data['release_year_norm_2_7'].min()
```

    2.0 


```python
Netflix_Data['release_year_norm_2_7'].max()
```
 
    6.999999999999986
 



<br>

## Standard Recoding of Categorical Variables

Given a **categorical** statistical variable $\hspace{0.05cm}\mathcal{X}_k\hspace{0.05cm}$ with range $\hspace{0.07cm}R( X_k) = \lbrace g_1, g_2 , ..., g_h \rbrace\hspace{0.07cm}$, and a sample  $\hspace{0.05cm}X_k \hspace{0.05cm} = \hspace{0.05cm} \left( \hspace{0.01cm} x_{1k} \hspace{0.01cm} , \hspace{0.01cm}x_{2k}\hspace{0.01cm},\dots ,\hspace{0.01cm} x_{nk} \hspace{0.01cm}\right)^t\hspace{0.05cm}$ of that statistical variable.
 
 
<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>


$\hspace{0.25cm}$ The standard recode of $\hspace{0.07cm}X_k\hspace{0.07cm}$ consists of obtaining a new sample  $\hspace{0.1cm}X_k^{cod}\hspace{0.1cm}$ defined as :

$$x_{ik}^{\hspace{0.07cm}cod} =  \left\lbrace\begin{array}{l} 0 \hspace{0.2cm} ,  \hspace{0.2cm} \text{ if} \hspace{0.3cm} x_{ik} = g_1 \\ 
1 \hspace{0.2cm} ,  \hspace{0.2cm} \text{ if}  \hspace{0.3cm} x_{ik} = g_2 \\
... \\ 
h-1  \hspace{0.2cm} ,  \hspace{0.2cm} \text{ if}  \hspace{0.3cm} x_{ik} = g_h \end{array}\right. \\
$$

</p>
 
</p></span>
</div>


**Properties :**

- $\hspace{0.1cm}R( X_k^{cod}) = \lbrace 0,1,..., h-1 \rbrace$ 


<br>

### Standard Recoding of Categorical Variables in `Python`



```python
from sklearn.preprocessing import OrdinalEncoder

ord_enc = OrdinalEncoder()
```


```python
Netflix_Data['type_recode'] = ord_enc.fit_transform(Netflix_Data[['type']])
```


```python
Netflix_Data.loc[ : , ['type','type_recode']].head()
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
      <th>type</th>
      <th>type_recode</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>SHOW</td>
      <td>1.0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>MOVIE</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>MOVIE</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>3</th>
      <td>MOVIE</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>MOVIE</td>
      <td>0.0</td>
    </tr>
  </tbody>
</table>
</div>




```python
Netflix_Data['age_certification_recode'] = ord_enc.fit_transform(Netflix_Data[['age_certification']])
```





```python
Netflix_Data['age_certification_recode'].unique()
```




    array([ 7.,  4.,  2., nan,  5.,  3.,  8.,  9.,  6., 10.,  0.,  1.])




```python
Netflix_Data['age_certification'].unique()
```




    array(['TV-MA', 'R', 'PG', nan, 'TV-14', 'PG-13', 'TV-PG', 'TV-Y', 'TV-G',
           'TV-Y7', 'G', 'NC-17'], dtype=object)




```python
df1 = pd.DataFrame()

for i in range(0,11):

    df2 = Netflix_Data.loc[ Netflix_Data.age_certification_recode == i , ['age_certification','age_certification_recode']  ].head(1)

    df1 = pd.concat([df1 , df2], axis=0)
```


```python
df1
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
      <th>age_certification</th>
      <th>age_certification_recode</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>162</th>
      <td>G</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>198</th>
      <td>NC-17</td>
      <td>1.0</td>
    </tr>
    <tr>
      <th>3</th>
      <td>PG</td>
      <td>2.0</td>
    </tr>
    <tr>
      <th>11</th>
      <td>PG-13</td>
      <td>3.0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>R</td>
      <td>4.0</td>
    </tr>
    <tr>
      <th>5</th>
      <td>TV-14</td>
      <td>5.0</td>
    </tr>
    <tr>
      <th>46</th>
      <td>TV-G</td>
      <td>6.0</td>
    </tr>
    <tr>
      <th>0</th>
      <td>TV-MA</td>
      <td>7.0</td>
    </tr>
    <tr>
      <th>35</th>
      <td>TV-PG</td>
      <td>8.0</td>
    </tr>
    <tr>
      <th>45</th>
      <td>TV-Y</td>
      <td>9.0</td>
    </tr>
    <tr>
      <th>95</th>
      <td>TV-Y7</td>
      <td>10.0</td>
    </tr>
  </tbody>
</table>
</div>




<br>


## Categorization of Quantitative Variables 

Given a **quantitative** statistical variable $\hspace{0.05cm}\mathcal{X}_k\hspace{0.05cm}$, and a sample  $\hspace{0.05cm}X_k \hspace{0.05cm} = \hspace{0.05cm} \left( \hspace{0.01cm} x_{1k} \hspace{0.01cm} , \hspace{0.01cm}x_{2k}\hspace{0.01cm},\dots ,\hspace{0.01cm} x_{nk} \hspace{0.01cm}\right)^t\hspace{0.05cm}$ of that statistical variable.
 

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>


$\hspace{0.25cm}$ Categorization of $\hspace{0.1cm}X_k\hspace{0.1cm}$ consist of obtaining a new sample  $\hspace{0.1cm}X_k^{cat}\hspace{0.1cm}$ defined as: $\\[0.3cm]$


$$x_{ik}^{cat} =  \left\lbrace\begin{array}{l} 0 \hspace{0.3cm} , \hspace{0.3cm} \text{ if} \hspace{0.3cm} x_{ik} \in [L_0 , L_1) \\ 
1 \hspace{0.3cm} , \hspace{0.3cm} \text{if}  \hspace{0.3cm} x_{ik} \in [L_1 , L_2)  \\
... \\ 
h-1  \hspace{0.3cm} , \hspace{0.3cm} \text{ if} \hspace{0.3cm} x_{ik} \in [L_{h-1} , L_h) \end{array}\right. \\[1.3cm]
$$




$\hspace{0.25cm}$ Another way of expressing it is: $\\[0.3cm]$

$$x_{ik}^{cat} = r \hspace{0.3cm}  \Leftrightarrow \hspace{0.3cm}  x_{ik} \in [L_r , L_{r+1}) \\$$




$\hspace{0.25cm}$ where:

 

$\hspace{0.25cm}$ $[L_0 , L_1) \hspace{0.03cm} , \hspace{0.03cm} [L_1 , L_2) \hspace{0.03cm}, \dots ,\hspace{0.03cm} [L_{h-1} , L_h] \hspace{0.12cm}$ are called the categorization intervals of $\hspace { 0.07cm}X_k\hspace{0.07cm}$ , and are intervals with the following properties:

- They are disjoint two by two, that is, they do not share elements. $\\[0.3cm]$

- Every observation in the sample $\hspace{0.1cm}X_k\hspace{0.1cm}$ belongs to some interval.



$\hspace{0.25cm}$ As a consequence:

- Each element of $\hspace{0.1cm}X_k\hspace{0.1cm}$ belongs to a single interval. $\\[0.15cm]$



</p>
 
</p></span>
</div>


<br>

- **¿How to define the categorization intervals?**


    There are different procedures to define the categorization intervals. Some of the most common are quantile-based rules.

    Next, we are going to expose some procedures based on quantiles and another alternative, Scott's rule.


<br>


### Mean Rule

Following the mean rule, the categorization intervals of a quantitative variable  $\hspace{0.1cm} X_k\hspace{0.1cm}$ would be the following: $\\[0.2cm]$



$$
\left(\hspace{0.1cm} Min(X_k) \hspace{0.07cm}-\hspace{0.07cm} c \hspace{0.1cm} ,\hspace{0.1cm} \overline{X}_k \hspace{0.1cm}\right] \hspace{0.1cm},\hspace{0.1cm} \left(\hspace{0.1cm} \overline{X}_k \hspace{0.1cm},\hspace{0.1cm} Max(X_k) \hspace{0.1cm}\right] \\[0.6cm]
$$


<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>

$\hspace{0.25cm}$ With the mean rule, the categorical version of  $\hspace{0.07cm}X_k\hspace{0.07cm}$  is defined as: $\\[0.3cm]$

$$x_{ik}^{\hspace{0.07cm}cat} \hspace{0.07cm}= \hspace{0.07cm} \left\lbrace\begin{array}{l} 0 \hspace{0.3cm} , \hspace{0.3cm} \text{ if} \hspace{0.3cm} x_{ij} \in \left[\hspace{0.1cm}Min(X_k)\hspace{0.1cm},\hspace{0.1cm} \overline{X}_k \hspace{0.1cm}\right)  \\
1  \hspace{0.3cm}  , \hspace{0.3cm} \text{ if} \hspace{0.3cm} x_{ik} \in \left[\hspace{0.1cm}\overline{X}_k \hspace{0.1cm},\hspace{0.1cm} Max(X_j)\hspace{0.1cm}\right] \end{array}\right. \\[1cm]
$$

</p>
 
</p></span>
</div>


<br>


### Median Rule

Following the median rule, the categorization intervals of a quantitative variable  $\hspace{0.1cm} X_k\hspace{0.1cm}$ would be the following: $\\[0.2cm]$



$$
\Bigl(\hspace{0.1cm} Min(X_k) \hspace{0.07cm}-\hspace{0.07cm} c \hspace{0.1cm} ,\hspace{0.1cm} Me({X}_k) \hspace{0.1cm}\Bigr] \hspace{0.1cm},\hspace{0.1cm} \Bigl(\hspace{0.1cm} Me({X}_k) \hspace{0.1cm},\hspace{0.1cm} Max(X_k) \hspace{0.1cm}\Bigr] \\[0.6cm]
$$


<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>

$\hspace{0.25cm}$ With the mean rule, the categorical version of  $\hspace{0.07cm}X_k\hspace{0.07cm}$  is defined as: $\\[0.3cm]$

$$x_{ik}^{\hspace{0.07cm}cat} \hspace{0.07cm}= \hspace{0.07cm} \left\lbrace\begin{array}{l} 0 \hspace{0.3cm} , \hspace{0.3cm} \text{ if} \hspace{0.3cm} x_{ij} \in \Bigl[\hspace{0.1cm}Min(X_k)\hspace{0.1cm},\hspace{0.1cm} Me({X}_k) \hspace{0.1cm}\Bigr]  \\
1  \hspace{0.3cm}  , \hspace{0.3cm} \text{ if} \hspace{0.3cm} x_{ik} \in \Bigl(\hspace{0.1cm} Me({X}_k) \hspace{0.1cm},\hspace{0.1cm} Max(X_j)\hspace{0.1cm}\Bigr] \end{array}\right. \\[1cm]
$$

</p>
 
</p></span>
</div>


<br>



### Quartile's Rule

Following the quartile rule, the categorization intervals of a quantitative variable  $\hspace{0.1cm} X_k\hspace{0.1cm}$ would be the following: $\\[0.2cm]$



$$
\Bigl(\hspace{0.1cm} Q(\hspace{0.03cm}0 \hspace{0.03cm},\hspace{0.03cm} {X}_k \hspace{0.03cm}) \hspace{0.07cm}-\hspace{0.07cm} c \hspace{0.1cm} ,\hspace{0.1cm} Q(\hspace{0.03cm}0.25 \hspace{0.03cm},\hspace{0.03cm} {X}_k \hspace{0.03cm}) \hspace{0.1cm}\Bigr] \hspace{0.1cm},\hspace{0.1cm} \Bigl(\hspace{0.1cm} Q(\hspace{0.03cm}0.25 \hspace{0.03cm},\hspace{0.03cm} {X}_k \hspace{0.03cm}) \hspace{0.1cm},\hspace{0.1cm} Q(\hspace{0.03cm}0.50 \hspace{0.03cm},\hspace{0.03cm} {X}_k \hspace{0.03cm}) \hspace{0.1cm}\Bigr] \hspace{0.1cm},\hspace{0.1cm} \Bigl(\hspace{0.1cm} Q(\hspace{0.03cm}0.50 \hspace{0.03cm},\hspace{0.03cm} {X}_k \hspace{0.03cm}) \hspace{0.1cm},\hspace{0.1cm} Q(\hspace{0.03cm}0.75 \hspace{0.03cm},\hspace{0.03cm} {X}_k \hspace{0.03cm}) \hspace{0.1cm}\Bigr] \hspace{0.1cm},\hspace{0.1cm} \Bigl(\hspace{0.1cm} Q(\hspace{0.03cm}0.75 \hspace{0.03cm},\hspace{0.03cm} {X}_k \hspace{0.03cm}) \hspace{0.1cm},\hspace{0.1cm} Max(X_k) \hspace{0.1cm}\Bigr] \\[0.6cm]
$$


<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>

$\hspace{0.25cm}$ With the mean rule, the categorical version of  $\hspace{0.07cm}X_k\hspace{0.07cm}$  is defined as: $\\[0.3cm]$

$$x_{ik}^{\hspace{0.07cm}cat} \hspace{0.07cm}= \hspace{0.07cm} \left\lbrace\begin{array}{l} 0 \hspace{0.3cm} , \hspace{0.3cm} \text{ if} \hspace{0.3cm} x_{ij} \in \Bigl[\hspace{0.1cm} Min(X_k) \hspace{0.1cm} ,\hspace{0.1cm} Q(\hspace{0.03cm}0.25 \hspace{0.03cm},\hspace{0.03cm} {X}_k \hspace{0.03cm}) \hspace{0.1cm}\Bigr)  \\[0.15cm]
1  \hspace{0.3cm}  , \hspace{0.3cm} \text{ if} \hspace{0.3cm} x_{ik} \in \Bigl[\hspace{0.1cm} Q(\hspace{0.03cm}0.25 \hspace{0.03cm},\hspace{0.03cm} {X}_k \hspace{0.03cm}) \hspace{0.1cm},\hspace{0.1cm} Q(\hspace{0.03cm}0.50 \hspace{0.03cm},\hspace{0.03cm} {X}_k \hspace{0.03cm}) \hspace{0.1cm}\Bigr) \\[0.15cm]
2  \hspace{0.3cm}  , \hspace{0.3cm} \text{ if} \hspace{0.3cm} x_{ik} \in \Bigl[\hspace{0.1cm} Q(\hspace{0.03cm}0.50 \hspace{0.03cm},\hspace{0.03cm} {X}_k \hspace{0.03cm}) \hspace{0.1cm},\hspace{0.1cm} Q(\hspace{0.03cm}0.75 \hspace{0.03cm},\hspace{0.03cm} {X}_k \hspace{0.03cm}) \hspace{0.1cm}\Bigr) \\[0.15cm]
3  \hspace{0.3cm}  , \hspace{0.3cm} \text{ if} \hspace{0.3cm} x_{ik} \in \Bigl[\hspace{0.1cm} Q(\hspace{0.03cm}0.75 \hspace{0.03cm},\hspace{0.03cm} {X}_k \hspace{0.03cm}) \hspace{0.1cm},\hspace{0.1cm} Max(X_k) \hspace{0.1cm}\Bigr]
\end{array}\right. \\[0.5cm]
$$

</p>
 
</p></span>
</div>


<br>

### Decile's Rule


Following the quartile rule, the categorization intervals of a quantitative variable  $\hspace{0.1cm} X_k\hspace{0.1cm}$ would be the following: $\\[0.2cm]$



$$
\Bigl(\hspace{0.1cm} Q(\hspace{0.03cm}0 \hspace{0.03cm},\hspace{0.03cm} {X}_k \hspace{0.03cm}) \hspace{0.07cm}-\hspace{0.07cm} c \hspace{0.1cm} ,\hspace{0.1cm} Q(\hspace{0.03cm}0.1 \hspace{0.03cm},\hspace{0.03cm} {X}_k \hspace{0.03cm}) \hspace{0.1cm}\Bigr] \hspace{0.1cm},\hspace{0.1cm} \Bigl(\hspace{0.1cm} Q(\hspace{0.03cm}0.1 \hspace{0.03cm},\hspace{0.03cm} {X}_k \hspace{0.03cm}) \hspace{0.1cm},\hspace{0.1cm} Q(\hspace{0.03cm}0.2 \hspace{0.03cm},\hspace{0.03cm} {X}_k \hspace{0.03cm}) \hspace{0.1cm}\Bigr] \hspace{0.1cm},\hspace{0.1cm} \Bigl(\hspace{0.1cm} Q(\hspace{0.03cm}0.2 \hspace{0.03cm},\hspace{0.03cm} {X}_k \hspace{0.03cm}) \hspace{0.1cm},\hspace{0.1cm} Q(\hspace{0.03cm}0.3 \hspace{0.03cm},\hspace{0.03cm} {X}_k \hspace{0.03cm}) \hspace{0.1cm}\Bigr] \hspace{0.1cm}, \dots ,\hspace{0.1cm} \Bigl(\hspace{0.1cm} Q(\hspace{0.03cm}0.9 \hspace{0.03cm},\hspace{0.03cm} {X}_k \hspace{0.03cm}) \hspace{0.1cm},\hspace{0.1cm} Q(\hspace{0.03cm}1 \hspace{0.03cm},\hspace{0.03cm} {X}_k \hspace{0.03cm}) \hspace{0.1cm}\Bigr] \\[0.6cm]
$$


<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>

$\hspace{0.25cm}$ With the mean rule, the categorical version of  $\hspace{0.07cm}X_k\hspace{0.07cm}$  is defined as: $\\[0.3cm]$

$$x_{ik}^{\hspace{0.07cm}cat} \hspace{0.07cm}= \hspace{0.07cm} \left\lbrace\begin{array}{l} 0 \hspace{0.3cm} , \hspace{0.3cm} \text{ if} \hspace{0.3cm} x_{ij} \in \Bigl[\hspace{0.1cm} Q(\hspace{0.03cm}0 \hspace{0.03cm},\hspace{0.03cm} {X}_k \hspace{0.03cm}) \hspace{0.1cm} ,\hspace{0.1cm} Q(\hspace{0.03cm}0.1 \hspace{0.03cm},\hspace{0.03cm} {X}_k \hspace{0.03cm}) \hspace{0.1cm}\Bigr)  \\[0.15cm]
1  \hspace{0.3cm}  , \hspace{0.3cm} \text{ if} \hspace{0.3cm} x_{ik} \in \Bigl[\hspace{0.1cm} Q(\hspace{0.03cm}0.1 \hspace{0.03cm},\hspace{0.03cm} {X}_k \hspace{0.03cm}) \hspace{0.1cm},\hspace{0.1cm} Q(\hspace{0.03cm}0.2 \hspace{0.03cm},\hspace{0.03cm} {X}_k \hspace{0.03cm}) \hspace{0.1cm}\Bigr) \\[0.15cm]
2  \hspace{0.3cm}  , \hspace{0.3cm} \text{ if} \hspace{0.3cm} x_{ik} \in \Bigl[\hspace{0.1cm} Q(\hspace{0.03cm}0.2 \hspace{0.03cm},\hspace{0.03cm} {X}_k \hspace{0.03cm}) \hspace{0.1cm},\hspace{0.1cm} Q(\hspace{0.03cm}0.3 \hspace{0.03cm},\hspace{0.03cm} {X}_k \hspace{0.03cm}) \hspace{0.1cm}\Bigr) \\
\dots \\
9  \hspace{0.3cm}  , \hspace{0.3cm} \text{ if} \hspace{0.3cm} x_{ik} \in \Bigl[\hspace{0.1cm} Q(\hspace{0.03cm}0.9 \hspace{0.03cm},\hspace{0.03cm} {X}_k \hspace{0.03cm}) \hspace{0.1cm},\hspace{0.1cm} Q(\hspace{0.03cm} 1 \hspace{0.03cm},\hspace{0.03cm} {X}_k \hspace{0.03cm}) \hspace{0.1cm}\Bigr]
\end{array}\right. \\[0.5cm]
$$

</p>
 
</p></span>
</div>

<br>

### Quantile's Rule

This rule is a generalization of the last two.

Following quantile rule we have the following series of categorization intervals of $\hspace{0.07cm}X_k\hspace{0.07cm}$ : $\\[0.25cm]$

$$\begin{align}
& \biggl\{ \hspace{0.1cm} \Bigl(   \hspace{0.07cm} Q(  \hspace{0.07cm} q_{\hspace{0.07cm}i}  \hspace{0.07cm} , X_k  \hspace{0.07cm} )  \hspace{0.07cm} - \hspace{0.07cm} c_i  \hspace{0.12cm}, \hspace{0.12cm} Q( \hspace{0.07cm}q_{\hspace{0.07cm}i+1} \hspace{0.07cm}, \hspace{0.07cm} X_k \hspace{0.07cm})  \hspace{0.07cm} \Bigr] \hspace{0.2cm} : \hspace{0.2cm} i \in \lbrace 1,2,...,h \rbrace  \hspace{0.1cm} \biggr\} \hspace{0.2cm} = \\[0.5cm]  = \hspace{0.2cm} &\biggl\{ \hspace{0.1cm} \Bigl(   \hspace{0.07cm} Q(  \hspace{0.07cm} q_1  \hspace{0.07cm} , X_k  \hspace{0.07cm} ) \hspace{0.07cm}+ \hspace{0.07cm} c      \hspace{0.12cm}, \hspace{0.12cm} Q( \hspace{0.07cm}q_{2} \hspace{0.07cm}, \hspace{0.07cm} X_k \hspace{0.07cm})  \hspace{0.07cm} \Bigr] \hspace{0.1cm} , \hspace{0.1cm}  \Bigl(   \hspace{0.07cm} Q(  \hspace{0.07cm} q_2  \hspace{0.07cm} , X_k  \hspace{0.07cm} )     \hspace{0.12cm}, \hspace{0.12cm} Q( \hspace{0.07cm}q_{3} \hspace{0.07cm}, \hspace{0.07cm} X_k \hspace{0.07cm})  \hspace{0.07cm} \Bigr]         
 \hspace{0.1cm} , \hspace{0.1cm}  \dots  \hspace{0.1cm} , \hspace{0.1cm} 
 \Bigl(   \hspace{0.07cm} Q(  \hspace{0.07cm} q_h  \hspace{0.07cm} , X_k  \hspace{0.07cm} )     \hspace{0.12cm}, \hspace{0.12cm} Q( \hspace{0.07cm}q_{h+1} \hspace{0.07cm}, \hspace{0.07cm} X_k \hspace{0.07cm})  \hspace{0.07cm} \Bigr] 
\hspace{0.1cm} \biggr\}
\end{align}$$ $\\[0.25cm]$

 

 where:
 
 - $t \in (0 , 1)\hspace{0.07cm}$ is a parameter chosen by the analyst. $\\[0.5cm]$
 
 
 - $q_{\hspace{0.07cm}i}\hspace{0.07cm}$ is defined as follows:
 
$$q_{\hspace{0.07cm}i} \hspace{0.07cm} = \hspace{0.07cm} \left\lbrace\begin{array}{l} 0 \hspace{0.3cm} , \hspace{0.3cm} \text{ if} \hspace{0.4cm} i=1  \\[0.15cm]
 1 \hspace{0.3cm} , \hspace{0.3cm} \text{ if} \hspace{0.4cm} i\hspace{0.07cm}=\hspace{0.07cm}h+1  \\[0.15cm]
  q_{\hspace{0.07cm} i-1} \hspace{0.07cm}+\hspace{0.07cm} t \hspace{0.3cm} , \hspace{0.3cm} \text{ if} \hspace{0.4cm} i \in \lbrace 2,3,...,h \rbrace  
\end{array}\right. $$ $\\[0.5cm]$

  
 
- $h\hspace{0.07cm}$ is defined as follows:

$$h \hspace{0.07cm} = \hspace{0.07cm} \left\lceil \dfrac{1}{t}\right\rceil$$ $\\[0.5cm]$
 
 
- $c_{\hspace{0.07cm}i} \hspace{0.07cm}$ is defined as follows:

$$c_{\hspace{0.07cm}i} \hspace{0.07cm} = \hspace{0.07cm} \left\lbrace\begin{array}{l} 0 \hspace{0.3cm} , \hspace{0.3cm} \text{ if} \hspace{0.4cm} i\neq 1  \\[0.15cm]
 c > 0 \hspace{0.3cm} , \hspace{0.3cm} \text{ if} \hspace{0.4cm} i\hspace{0.07cm}=\hspace{0.07cm}1
\end{array}\right. $$ $\\[0.5cm]$
 
 
 - $\lbrace \hspace{0.07cm}q_ i \hspace{0.07cm}:\hspace{0.07cm} i=1,...,h \hspace{0.07cm}\rbrace \hspace{0.07cm} = \hspace{0.07cm} \lbrace \hspace{0.07cm}q_1\hspace{0.07cm},\hspace{0.07cm} q_2\hspace{0.07cm}, \dots ,\hspace{0.07cm} q_h \hspace{0.07cm}\rbrace \hspace{0.2cm}$ is an ordered set containing numbers between $\hspace{0.07cm}0\hspace{0.07cm}$ and $\hspace{0.07cm}1\hspace{0.07cm}$, starting at $\hspace{0.07cm}0\hspace{0.07cm}$ and with a space of degree $\hspace{0.07cm}t\hspace{0.07cm}$ between them. That is, it is an ordered set with numbers between $\hspace{0.07cm}0\hspace{0.07cm}$ and $\hspace{0.07cm}1\hspace{0.07cm}$, that starts at zero and its numbers are equispaced in degree $\hspace{0.07cm}t\hspace{0.07cm}$. 
 
     
     Formally, It's an ordered set that starts at zero and it's also a subset of $\hspace{0.07cm}[0,1]\hspace{0.07cm}$  because $\hspace{0.12cm} q_1 = 0 \hspace{0.07cm}\leq\hspace{0.07cm} q_2 \hspace{0.07cm}\leq \dots \leq\hspace{0.07cm} q_h \hspace{0.07cm}\leq\hspace{0.07cm} 1\hspace{0.12cm}$. In the other hand, It's equispaced in degree $\hspace{0.07cm}t\hspace{0.07cm}$ because  $\hspace{0.12cm}q_i - q_{i-1} = t\hspace{0.12cm}$ , for $\hspace{0.12cm}i = 2,...,h$.
 
       
    For example, if $\hspace{0.12cm}t=0.15\hspace{0.12cm}$, then  $\lbrace\hspace{0.1cm} q_ i \hspace{0.1cm}:\hspace{0.1cm} i=1,...,h \hspace{0.07cm}\rbrace \hspace{0.07cm}=\hspace{0.07cm}  \lbrace\hspace{0.07cm} 0\hspace{0.07cm},\hspace{0.07cm} 0.15\hspace{0.07cm},\hspace{0.07cm} 0.3\hspace{0.07cm},\hspace{0.07cm} 0.45\hspace{0.07cm},\hspace{0.07cm} 0.6\hspace{0.07cm},\hspace{0.07cm} 0.75\hspace{0.07cm},\hspace{0.07cm} 0.9 \hspace{0.07cm}\rbrace$ $\\[0.4cm]$
 
 
In order to understand in a better way this rule, we are going to derive manually the categorization intervals for two examples of $\hspace{0.07cm}t\hspace{0.07cm}$. $\\[0.35cm]$


**Example one: $\hspace{0.2cm}t=0.15$** $\\[0.45cm]$

- $h =  \left\lceil \dfrac{1}{0.15}\right\rceil = 7$ $\\[1cm]$

- $q_1 = 0$ $\\[0.45cm]$

- $q_2 = q_0 + t = 0 + 0.15 = 0.15$ $\\[0.45cm]$

- $q_3 = q_1 + t = 0.15 + 0.15 = 0.3$  $\\[0.45cm]$

- $q_4 = q_2 + t = 0.3 + 0.15 = 0.45$ $\\[0.45cm]$

- $q_5 = q_3 + t = 0.45 + 0.15 = 0.6$ $\\[0.45cm]$

- $q_6 = q_4 + t = 0.6 + 0.15 = 0.75$ $\\[0.45cm]$

- $q_h = q_7 = q_7 + t = 0.75 + 0.15 = 0.9$ $\\[0.45cm]$

- $q_{h+1} = q_8 = 1$ $\\[1cm]$


- Therefore, the categorization intervals would be the following:

$$\Bigl( \hspace{0.07cm} Q(  \hspace{0.07cm} 0  \hspace{0.07cm} , X_k  \hspace{0.07cm} )  \hspace{0.07cm}- \hspace{0.07cm} c \hspace{0.12cm}, \hspace{0.12cm} Q( \hspace{0.07cm} 0.15 \hspace{0.07cm}, \hspace{0.07cm} X_k \hspace{0.07cm})  \hspace{0.07cm} \Bigr]    \hspace{0.1cm} , \hspace{0.1cm} 
\Bigl( \hspace{0.07cm} Q(  \hspace{0.07cm} 0.15  \hspace{0.07cm} , X_k  \hspace{0.07cm} )     \hspace{0.12cm}, \hspace{0.12cm} Q( \hspace{0.07cm}0.3 \hspace{0.07cm}, \hspace{0.07cm} X_k \hspace{0.07cm})  \hspace{0.07cm} \Bigr]  \hspace{0.1cm} , \hspace{0.1cm} 
\Bigl( \hspace{0.07cm} Q(  \hspace{0.07cm} 0.3  \hspace{0.07cm} , X_k  \hspace{0.07cm} )     \hspace{0.12cm}, \hspace{0.12cm} Q( \hspace{0.07cm}0.45 \hspace{0.07cm}, \hspace{0.07cm} X_k \hspace{0.07cm})  \hspace{0.07cm} \Bigr]      \hspace{0.07cm} , \hspace{0.07cm} \dots \hspace{0.07cm} , \hspace{0.07cm} \Bigl( \hspace{0.07cm} Q(  \hspace{0.07cm} 0.9  \hspace{0.07cm} , X_k  \hspace{0.07cm} )     \hspace{0.12cm}, \hspace{0.12cm} Q( \hspace{0.07cm}1 \hspace{0.07cm}, \hspace{0.07cm} X_k \hspace{0.07cm})  \hspace{0.07cm} \Bigr]    
$$


<br>

**Example two: $\hspace{0.1cm}t=0.25$**
 
We are going to see that in this case we will obtain the same categorization intervals as with the quartile rule. 
 

- $h =  \left\lceil \dfrac{1}{0.25}\right\rceil = 4$ $\\[1cm]$

- $q_1 = 0$ $\\[0.45cm]$

- $q_2 = q_0 + t = 0 + 0.25 = 0.25$ $\\[0.45cm]$

- $q_3 = q_1 + t = 0.25 + 0.25 = 0.5$  $\\[0.45cm]$

- $q_h = q_4 = q_2 + t = 0.5 + 0.25 = 0.75$ $\\[0.45cm]$

- $q_{h+1} = q_5 = 1$ $\\[0.45cm]$

 


- Therefore, the categorization intervals would be the following:

$$\Bigl( \hspace{0.07cm} Q(  \hspace{0.07cm} 0  \hspace{0.07cm} , X_k  \hspace{0.07cm} )  \hspace{0.07cm}- \hspace{0.07cm} c \hspace{0.12cm}, \hspace{0.12cm} Q( \hspace{0.07cm} 0.25 \hspace{0.07cm}, \hspace{0.07cm} X_k \hspace{0.07cm})  \hspace{0.07cm} \Bigr]    \hspace{0.1cm} , \hspace{0.1cm} 
\Bigl( \hspace{0.07cm} Q(  \hspace{0.07cm} 0.25  \hspace{0.07cm} , X_k  \hspace{0.07cm} )     \hspace{0.12cm}, \hspace{0.12cm} Q( \hspace{0.07cm}0.5 \hspace{0.07cm}, \hspace{0.07cm} X_k \hspace{0.07cm})  \hspace{0.07cm} \Bigr]  \hspace{0.1cm} , \hspace{0.1cm} 
\Bigl( \hspace{0.07cm} Q(  \hspace{0.07cm} 0.5  \hspace{0.07cm} , X_k  \hspace{0.07cm} )     \hspace{0.12cm}, \hspace{0.12cm} Q( \hspace{0.07cm}0.75 \hspace{0.07cm}, \hspace{0.07cm} X_k \hspace{0.07cm})  \hspace{0.07cm} \Bigr]    \hspace{0.07cm} , \hspace{0.07cm} \Bigl( \hspace{0.07cm} Q(  \hspace{0.07cm} 0.75  \hspace{0.07cm} , X_k  \hspace{0.07cm} )    \hspace{0.12cm}, \hspace{0.12cm} Q( \hspace{0.07cm}1 \hspace{0.07cm}, \hspace{0.07cm} X_k \hspace{0.07cm})  \hspace{0.07cm} \Bigr]    
$$ $\\[0.5cm]$
 
 
 
 
 
Also It's easy to see that if we had used $t=0.1$ we would have obtained the same categorization intervals as with the decile rule.

<br>


### Categorization of Quantitative Variables in `Python`


```python
pd.cut(x=Netflix_Data['release_year'] , bins=5 )
```




    0       (1944.923, 1960.4]
    1         (1975.8, 1991.2]
    2         (1960.4, 1975.8]
    3         (1960.4, 1975.8]
    4         (1960.4, 1975.8]
                   ...        
    5845      (2006.6, 2022.0]
    5846      (2006.6, 2022.0]
    5847      (2006.6, 2022.0]
    5848      (2006.6, 2022.0]
    5849      (2006.6, 2022.0]
    Name: release_year, Length: 5850, dtype: category
    Categories (5, interval[float64, right]): [(1944.923, 1960.4] < (1960.4, 1975.8] < (1975.8, 1991.2] < (1991.2, 2006.6] < (2006.6, 2022.0]]




```python
pd.cut(x=Netflix_Data['release_year'] , bins=5 , labels=False)
```




    0       0
    1       2
    2       1
    3       1
    4       1
           ..
    5845    4
    5846    4
    5847    4
    5848    4
    5849    4
    Name: release_year, Length: 5850, dtype: int64





### Using the median rule in `Python`



```python
intervals = [Netflix_Data['release_year'].min() - 0.5 , Netflix_Data['release_year'].median(), Netflix_Data['release_year'].max() ]
intervals
```




    [1944.5, 2018.0, 2022.0]




```python
pd.cut(x=Netflix_Data['release_year'], bins=intervals )

```




    0       (1944.5, 2018.0]
    1       (1944.5, 2018.0]
    2       (1944.5, 2018.0]
    3       (1944.5, 2018.0]
    4       (1944.5, 2018.0]
                  ...       
    5845    (2018.0, 2022.0]
    5846    (2018.0, 2022.0]
    5847    (2018.0, 2022.0]
    5848    (2018.0, 2022.0]
    5849    (2018.0, 2022.0]
    Name: release_year, Length: 5850, dtype: category
    Categories (2, interval[float64, right]): [(1944.5, 2018.0] < (2018.0, 2022.0]]




```python
pd.cut(x=Netflix_Data['release_year'], bins=intervals, labels=False )
```




    0       0
    1       0
    2       0
    3       0
    4       0
           ..
    5845    1
    5846    1
    5847    1
    5848    1
    5849    1
    Name: release_year, Length: 5850, dtype: int64





### Using quartile's rule


```python
intervals = [Netflix_Data['release_year'].min() - 1 , Netflix_Data['release_year'].quantile(0.25), Netflix_Data['release_year'].quantile(0.5), Netflix_Data['release_year'].quantile(0.75), Netflix_Data['release_year'].max()]
intervals
```




    [1944.0, 2016.0, 2018.0, 2020.0, 2022.0]




```python
Netflix_Data['release_year_cat_int_1'] = pd.cut(x=Netflix_Data['release_year'], bins=intervals )
```


```python
Netflix_Data['release_year_cat_1'] = pd.cut(x=Netflix_Data['release_year'], bins=intervals, labels=False )
```


```python
Netflix_Data.loc[: , ['release_year','release_year_cat_int_1','release_year_cat_1']]
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
      <th>release_year_cat_int</th>
      <th>release_year_cat</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1945.0</td>
      <td>(1944.0, 2016.0]</td>
      <td>0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>1976.0</td>
      <td>(1944.0, 2016.0]</td>
      <td>0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>1972.0</td>
      <td>(1944.0, 2016.0]</td>
      <td>0</td>
    </tr>
    <tr>
      <th>3</th>
      <td>1975.0</td>
      <td>(1944.0, 2016.0]</td>
      <td>0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>1967.0</td>
      <td>(1944.0, 2016.0]</td>
      <td>0</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>5845</th>
      <td>2021.0</td>
      <td>(2020.0, 2022.0]</td>
      <td>3</td>
    </tr>
    <tr>
      <th>5846</th>
      <td>2021.0</td>
      <td>(2020.0, 2022.0]</td>
      <td>3</td>
    </tr>
    <tr>
      <th>5847</th>
      <td>2021.0</td>
      <td>(2020.0, 2022.0]</td>
      <td>3</td>
    </tr>
    <tr>
      <th>5848</th>
      <td>2021.0</td>
      <td>(2020.0, 2022.0]</td>
      <td>3</td>
    </tr>
    <tr>
      <th>5849</th>
      <td>2021.0</td>
      <td>(2020.0, 2022.0]</td>
      <td>3</td>
    </tr>
  </tbody>
</table>
<p>5850 rows × 3 columns</p>
</div>





### Using deciles rule


```python
import numpy as np
```


```python
intervals = []

for q in np.arange(0, 1, step=0.1) :

    intervals.append( Netflix_Data['imdb_score'].quantile(q))
```


```python
np.arange(0, 1, step=0.1)
```




    array([0. , 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9])




```python
intervals
```




    [1.5, 5.0, 5.6, 6.0, 6.3, 6.6, 6.9, 7.2, 7.5, 7.9]




```python
intervals[0] = intervals[0] - 0.5 # El primer extremo debe ser Q(0) - c
```


```python
intervals.append(Netflix_Data['imdb_score'].quantile(1)) # El ultimo extremo debe ser Q(1)
```


```python
intervals
```




    [1.0, 5.0, 5.6, 6.0, 6.3, 6.6, 6.9, 7.2, 7.5, 7.9, 9.6]




```python
Netflix_Data['imdb_score_cat_int_1'] = pd.cut(x=Netflix_Data['imdb_score'], bins=intervals )
```


```python
Netflix_Data['imdb_score_cat_1'] = pd.cut(x=Netflix_Data['imdb_score'], bins=intervals, labels=False )
```


```python
Netflix_Data.loc[: , ['imdb_score','imdb_score_cat_int_1','imdb_score_cat_1']]
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
      <th>imdb_score</th>
      <th>imdb_score_cat_int_1</th>
      <th>imdb_score_cat_1</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>1</th>
      <td>8.2</td>
      <td>(7.9, 9.6]</td>
      <td>9.0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>7.7</td>
      <td>(7.5, 7.9]</td>
      <td>8.0</td>
    </tr>
    <tr>
      <th>3</th>
      <td>8.2</td>
      <td>(7.9, 9.6]</td>
      <td>9.0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>7.7</td>
      <td>(7.5, 7.9]</td>
      <td>8.0</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>5845</th>
      <td>6.8</td>
      <td>(6.6, 6.9]</td>
      <td>5.0</td>
    </tr>
    <tr>
      <th>5846</th>
      <td>7.7</td>
      <td>(7.5, 7.9]</td>
      <td>8.0</td>
    </tr>
    <tr>
      <th>5847</th>
      <td>3.8</td>
      <td>(1.0, 5.0]</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>5848</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>5849</th>
      <td>7.8</td>
      <td>(7.5, 7.9]</td>
      <td>8.0</td>
    </tr>
  </tbody>
</table>
<p>5850 rows × 3 columns</p>
</div>




```python
df1 = pd.DataFrame()

for i in range(0,len(Netflix_Data['imdb_score_cat_1'].unique())):

    df2 = Netflix_Data.loc[ Netflix_Data.imdb_score_cat_1 == i , ['imdb_score_cat_int_1','imdb_score_cat_1']  ].head(1)

    df1 = pd.concat([df1 , df2], axis=0)
```


```python
df1
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
      <th>imdb_score_cat_int_1</th>
      <th>imdb_score_cat_1</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>19</th>
      <td>(1.0, 5.0]</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>29</th>
      <td>(5.0, 5.6]</td>
      <td>1.0</td>
    </tr>
    <tr>
      <th>9</th>
      <td>(5.6, 6.0]</td>
      <td>2.0</td>
    </tr>
    <tr>
      <th>16</th>
      <td>(6.0, 6.3]</td>
      <td>3.0</td>
    </tr>
    <tr>
      <th>25</th>
      <td>(6.3, 6.6]</td>
      <td>4.0</td>
    </tr>
    <tr>
      <th>23</th>
      <td>(6.6, 6.9]</td>
      <td>5.0</td>
    </tr>
    <tr>
      <th>17</th>
      <td>(6.9, 7.2]</td>
      <td>6.0</td>
    </tr>
    <tr>
      <th>10</th>
      <td>(7.2, 7.5]</td>
      <td>7.0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>(7.5, 7.9]</td>
      <td>8.0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>(7.9, 9.6]</td>
      <td>9.0</td>
    </tr>
  </tbody>
</table>
</div>





### Using quantiles rule with t=0.05


```python
np.arange(0, 1, step=0.05)
```




    array([0.  , 0.05, 0.1 , 0.15, 0.2 , 0.25, 0.3 , 0.35, 0.4 , 0.45, 0.5 ,
           0.55, 0.6 , 0.65, 0.7 , 0.75, 0.8 , 0.85, 0.9 , 0.95])




```python
intervals = []

for q in np.arange(0, 1, step=0.05) :

    intervals.append( Netflix_Data['imdb_score'].quantile(q))
```


```python
intervals
```




    [1.5,
     4.4,
     5.0,
     5.3,
     5.6,
     5.8,
     6.0,
     6.2,
     6.3,
     6.5,
     6.6,
     6.8,
     6.9,
     7.1,
     7.2,
     7.3,
     7.5,
     7.7,
     7.9,
     8.2]




```python
intervals[0] = intervals[0] - 0.5
```


```python
intervals.append(Netflix_Data['imdb_score'].quantile(1))
```


```python
intervals
```




    [1.0,
     4.4,
     5.0,
     5.3,
     5.6,
     5.8,
     6.0,
     6.2,
     6.3,
     6.5,
     6.6,
     6.8,
     6.9,
     7.1,
     7.2,
     7.3,
     7.5,
     7.7,
     7.9,
     8.2,
     9.6]




```python
Netflix_Data['imdb_score_cat_int_2'] = pd.cut(x=Netflix_Data['imdb_score'], bins=intervals )
```


```python
Netflix_Data['imdb_score_cat_2'] = pd.cut(x=Netflix_Data['imdb_score'], bins=intervals, labels=False )
```


```python
Netflix_Data.loc[: , ['imdb_score','imdb_score_cat_int_2','imdb_score_cat_2']]
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
      <th>imdb_score</th>
      <th>imdb_score_cat_int_2</th>
      <th>imdb_score_cat_2</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>1</th>
      <td>8.2</td>
      <td>(7.9, 8.2]</td>
      <td>18.0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>7.7</td>
      <td>(7.5, 7.7]</td>
      <td>16.0</td>
    </tr>
    <tr>
      <th>3</th>
      <td>8.2</td>
      <td>(7.9, 8.2]</td>
      <td>18.0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>7.7</td>
      <td>(7.5, 7.7]</td>
      <td>16.0</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>5845</th>
      <td>6.8</td>
      <td>(6.6, 6.8]</td>
      <td>10.0</td>
    </tr>
    <tr>
      <th>5846</th>
      <td>7.7</td>
      <td>(7.5, 7.7]</td>
      <td>16.0</td>
    </tr>
    <tr>
      <th>5847</th>
      <td>3.8</td>
      <td>(1.0, 4.4]</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>5848</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>5849</th>
      <td>7.8</td>
      <td>(7.7, 7.9]</td>
      <td>17.0</td>
    </tr>
  </tbody>
</table>
<p>5850 rows × 3 columns</p>
</div>




```python
df1 = pd.DataFrame()

for i in range(0,len(Netflix_Data['imdb_score_cat_2'].unique())):

    df2 = Netflix_Data.loc[ Netflix_Data.imdb_score_cat_2 == i , ['imdb_score_cat_int_2','imdb_score_cat_2']  ].head(1)

    df1 = pd.concat([df1 , df2], axis=0)
```


```python
df1 
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
      <th>imdb_score_cat_int_2</th>
      <th>imdb_score_cat_2</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>19</th>
      <td>(1.0, 4.4]</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>33</th>
      <td>(4.4, 5.0]</td>
      <td>1.0</td>
    </tr>
    <tr>
      <th>29</th>
      <td>(5.0, 5.3]</td>
      <td>2.0</td>
    </tr>
    <tr>
      <th>74</th>
      <td>(5.3, 5.6]</td>
      <td>3.0</td>
    </tr>
    <tr>
      <th>9</th>
      <td>(5.6, 5.8]</td>
      <td>4.0</td>
    </tr>
    <tr>
      <th>69</th>
      <td>(5.8, 6.0]</td>
      <td>5.0</td>
    </tr>
    <tr>
      <th>16</th>
      <td>(6.0, 6.2]</td>
      <td>6.0</td>
    </tr>
    <tr>
      <th>79</th>
      <td>(6.2, 6.3]</td>
      <td>7.0</td>
    </tr>
    <tr>
      <th>25</th>
      <td>(6.3, 6.5]</td>
      <td>8.0</td>
    </tr>
    <tr>
      <th>31</th>
      <td>(6.5, 6.6]</td>
      <td>9.0</td>
    </tr>
    <tr>
      <th>23</th>
      <td>(6.6, 6.8]</td>
      <td>10.0</td>
    </tr>
    <tr>
      <th>44</th>
      <td>(6.8, 6.9]</td>
      <td>11.0</td>
    </tr>
    <tr>
      <th>46</th>
      <td>(6.9, 7.1]</td>
      <td>12.0</td>
    </tr>
    <tr>
      <th>17</th>
      <td>(7.1, 7.2]</td>
      <td>13.0</td>
    </tr>
    <tr>
      <th>11</th>
      <td>(7.2, 7.3]</td>
      <td>14.0</td>
    </tr>
    <tr>
      <th>10</th>
      <td>(7.3, 7.5]</td>
      <td>15.0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>(7.5, 7.7]</td>
      <td>16.0</td>
    </tr>
    <tr>
      <th>32</th>
      <td>(7.7, 7.9]</td>
      <td>17.0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>(7.9, 8.2]</td>
      <td>18.0</td>
    </tr>
    <tr>
      <th>5</th>
      <td>(8.2, 9.6]</td>
      <td>19.0</td>
    </tr>
  </tbody>
</table>
</div>

 
 
<br>


## Dummification of Categorical Variables

Given a **categorical** statistical variable $\hspace{0.06cm}\mathcal{X}_k\hspace{0.05cm}$ with range $\hspace{0.06cm}R(\mathcal{X}_k)=\lbrace g_1 ,..., g_h \rbrace\hspace{0.06cm}$ , and a sample  $\hspace{0.05cm}X_k \hspace{0.05cm} = \hspace{0.05cm} \left( \hspace{0.01cm} x_{1k} \hspace{0.01cm} , \hspace{0.01cm}x_{2k}\hspace{0.01cm},\dots ,\hspace{0.01cm} x_{nk} \hspace{0.01cm}\right)^t\hspace{0.05cm}$ of that statistical variable.
 


Dummify $\hspace{0.06cm}X_k\hspace{0.06cm}$ consist of obtaining the new dummy samples $\hspace{0.06cm}X_{k\hspace{0.06cm}0}\hspace{0.06cm},\hspace{0.06cm}X_{k\hspace{0.06cm}1}\hspace{0.06cm},...,\hspace{0.06cm}X_{k \hspace{0.06cm}h-1}\hspace{0.06cm}$, where $\hspace{0.06cm}X_{kj}\hspace{0.06cm}$ is defined as:

$$x_{i,kj} = \left\lbrace\begin{array}{l} 1 \hspace{0.3cm} , \hspace{0.3cm} \text{ if} \hspace{0.3cm} x_{ik} = j \\[0.1cm] 0 \hspace{0.25cm}, \hspace{0.3cm} \text{ if} \hspace{0.3cm} x_{ik} \neq j  \end{array}\right.$$

for $\hspace{0.06cm}j\in \lbrace 0\hspace{0.06cm},\hspace{0.06cm}1\hspace{0.06cm},\dots ,\hspace{0.06cm}h-1 \rbrace$

<br>




### Dummification of Categorical Variables in `Python`


```python
pd.get_dummies(Netflix_Data.loc[:, 'type'])
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
      <th>MOVIE</th>
      <th>SHOW</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>0</td>
      <td>1</td>
    </tr>
    <tr>
      <th>1</th>
      <td>1</td>
      <td>0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>1</td>
      <td>0</td>
    </tr>
    <tr>
      <th>3</th>
      <td>1</td>
      <td>0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>1</td>
      <td>0</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>5845</th>
      <td>1</td>
      <td>0</td>
    </tr>
    <tr>
      <th>5846</th>
      <td>1</td>
      <td>0</td>
    </tr>
    <tr>
      <th>5847</th>
      <td>1</td>
      <td>0</td>
    </tr>
    <tr>
      <th>5848</th>
      <td>1</td>
      <td>0</td>
    </tr>
    <tr>
      <th>5849</th>
      <td>0</td>
      <td>1</td>
    </tr>
  </tbody>
</table>
<p>5850 rows × 2 columns</p>
</div>




```python
pd.get_dummies(Netflix_Data.loc[:, 'age_certification'])
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
      <th>G</th>
      <th>NC-17</th>
      <th>PG</th>
      <th>PG-13</th>
      <th>R</th>
      <th>TV-14</th>
      <th>TV-G</th>
      <th>TV-MA</th>
      <th>TV-PG</th>
      <th>TV-Y</th>
      <th>TV-Y7</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>3</th>
      <td>0</td>
      <td>0</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
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
      <td>...</td>
    </tr>
    <tr>
      <th>5845</th>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>5846</th>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>5847</th>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>5848</th>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>5849</th>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
    </tr>
  </tbody>
</table>
<p>5850 rows × 11 columns</p>
</div>




```python
pd.get_dummies(Netflix_Data.loc[:, 'age_certification'], drop_first=True)
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
      <th>NC-17</th>
      <th>PG</th>
      <th>PG-13</th>
      <th>R</th>
      <th>TV-14</th>
      <th>TV-G</th>
      <th>TV-MA</th>
      <th>TV-PG</th>
      <th>TV-Y</th>
      <th>TV-Y7</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>3</th>
      <td>0</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
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
      <th>5845</th>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>5846</th>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>5847</th>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>5848</th>
      <td>0</td>
      <td>0</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>5849</th>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
    </tr>
  </tbody>
</table>
<p>5850 rows × 10 columns</p>
</div>












<br>

## Dealing with NaN <a class="anchor" id="1"></a>



### Deleting Rows with NaN


### Deleting  Columns with NaN





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


**Properties:**

 
- Existence: the arithmetic mean of a sample $X_k$  of a statisitcal variable $\mathcal{X}_k$ always exist, for any $X_{k}$.

- Commutatividad: arithmetic mean isn't affected by the order of the elements of the sample $X_k$ .


- $\overline{X_k} + \overline{X_j} = \overline{X_k + X_j}$


- $\overline{ a\cdot X_k + b} = a \cdot \overline{X_k} + b$ , for any $a,b \in \mathbb{R}$ 


<br>



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


**Properties:**

Existencia: La mediana siempre existe para cualquier conjunto de números.

Invariante a permutaciones: El orden de los números no afecta a la mediana.

 

No linealidad: La mediana de una suma de números no es igual a la suma de las medianas de cada conjunto de números.

Invarianza a la escala: Multiplicar todos los números por una constante no afecta la mediana.

Si se cumple $median(cX_j) = c\cdot median(X_j)$ pero no es cierto en general que $median(cX_j + b) = c\cdot median(X_j) + b$

<br>


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




### Frequency Table in `Python`











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

 
