---
title: 'Distancias Estadísticas'
author: 'Fabio Scielzo Ortiz'
date: '17/11/22'
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

<br>

El concepto de distancia entre observaciones de variables estadisticas tiene un papel relevante en muchas tecnicas y modelos estadistico tales como KNN, PCA, MDS, Clustering , Regresión  y Clasificacion (supervisada). Es por ello de especial relevancia para todo cientifico de datos saber que son las distancias estadisticas, que tipos hay y como implementarlas.



<br>

# Data-set de trabajo

```python
import pandas as pd
import numpy as np
```


```python
Data = pd.read_csv('House_Price_Regression.csv')

Data['type'] = np.random.uniform(low=0, high=3, size=len(Data)).round()

Data['rating'] = np.random.uniform(low=0, high=5, size=len(Data)).round()

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
      <th>private_jacuzzi_recode</th>
      <th>private_pool_recode</th>
      <th>security_recode</th>
      <th>shared_gym_recode</th>
      <th>shared_pool_recode</th>
      <th>shared_spa_recode</th>
      <th>view_of_water_recode</th>
      <th>size_in_m_2</th>
      <th>type</th>
      <th>rating</th>
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
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>100.242337</td>
      <td>0.0</td>
      <td>2.0</td>
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
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>146.972546</td>
      <td>2.0</td>
      <td>2.0</td>
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
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>181.253753</td>
      <td>0.0</td>
      <td>1.0</td>
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
      <td>187.664060</td>
      <td>1.0</td>
      <td>0.0</td>
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
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>47.101821</td>
      <td>1.0</td>
      <td>0.0</td>
    </tr>
  </tbody>
</table>
<p>5 rows × 31 columns</p>
</div>




```python
Data_quant = Data.loc[: , ['latitude', 'longitude', 'price', 'size_in_m_2', 'no_of_bedrooms', 'no_of_bathrooms']]
```


```python
Data_quant.head()
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
      <th>no_of_bedrooms</th>
      <th>no_of_bathrooms</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>25.113208</td>
      <td>55.138932</td>
      <td>2700000</td>
      <td>100.242337</td>
      <td>1</td>
      <td>2</td>
    </tr>
    <tr>
      <th>1</th>
      <td>25.106809</td>
      <td>55.151201</td>
      <td>2850000</td>
      <td>146.972546</td>
      <td>2</td>
      <td>2</td>
    </tr>
    <tr>
      <th>2</th>
      <td>25.063302</td>
      <td>55.137728</td>
      <td>1150000</td>
      <td>181.253753</td>
      <td>3</td>
      <td>5</td>
    </tr>
    <tr>
      <th>3</th>
      <td>25.227295</td>
      <td>55.341761</td>
      <td>2850000</td>
      <td>187.664060</td>
      <td>2</td>
      <td>3</td>
    </tr>
    <tr>
      <th>4</th>
      <td>25.114275</td>
      <td>55.139764</td>
      <td>1729200</td>
      <td>47.101821</td>
      <td>0</td>
      <td>1</td>
    </tr>
  </tbody>
</table>
</div>




```python
Data_binary = Data.loc[: , ['private_garden_recode', 'private_gym_recode', 'private_jacuzzi_recode', 'balcony_recode']]

Data_binary.head()
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
      <th>private_garden_recode</th>
      <th>private_gym_recode</th>
      <th>private_jacuzzi_recode</th>
      <th>balcony_recode</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
    </tr>
    <tr>
      <th>3</th>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
  </tbody>
</table>
</div>




```python
Data_multiclass = Data.loc[: , ['quality_recode', 'rating', 'type']]

Data_multiclass.head()
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
      <th>quality_recode</th>
      <th>rating</th>
      <th>type</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>2.0</td>
      <td>2.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2.0</td>
      <td>2.0</td>
      <td>2.0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>2.0</td>
      <td>1.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>3</th>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>2.0</td>
      <td>0.0</td>
      <td>1.0</td>
    </tr>
  </tbody>
</table>
</div>




```python
Data_mixed = Data.loc[: , ['latitude', 'longitude', 'price', 'size_in_m_2', 'no_of_bedrooms', 'no_of_bathrooms','private_garden_recode', 'private_gym_recode', 'private_jacuzzi_recode', 'balcony_recode','quality_recode', 'rating', 'type']]

Data_mixed.head()
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
      <th>no_of_bedrooms</th>
      <th>no_of_bathrooms</th>
      <th>private_garden_recode</th>
      <th>private_gym_recode</th>
      <th>private_jacuzzi_recode</th>
      <th>balcony_recode</th>
      <th>quality_recode</th>
      <th>rating</th>
      <th>type</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>25.113208</td>
      <td>55.138932</td>
      <td>2700000</td>
      <td>100.242337</td>
      <td>1</td>
      <td>2</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>2.0</td>
      <td>2.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>25.106809</td>
      <td>55.151201</td>
      <td>2850000</td>
      <td>146.972546</td>
      <td>2</td>
      <td>2</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>2.0</td>
      <td>2.0</td>
      <td>2.0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>25.063302</td>
      <td>55.137728</td>
      <td>1150000</td>
      <td>181.253753</td>
      <td>3</td>
      <td>5</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>2.0</td>
      <td>1.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>3</th>
      <td>25.227295</td>
      <td>55.341761</td>
      <td>2850000</td>
      <td>187.664060</td>
      <td>2</td>
      <td>3</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
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
      <td>0</td>
      <td>1</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>2.0</td>
      <td>0.0</td>
      <td>1.0</td>
    </tr>
  </tbody>
</table>
</div>



<br>

```python
Data_quant_numpy = Data_quant.to_numpy()
Data_binary_numpy = Data_binary.to_numpy()
Data_multiclass_numpy = Data_multiclass.to_numpy()
Data_mixed_numpy = Data_mixed.to_numpy()
```



<br>


# Distancias  <a class="anchor" id="3"></a>

Es un concepto que permite expresar una medida de distancia entre un par de elementos cualesquiera.


Dado un conjunto cualquiera $\hspace{0.1cm}A$


## Casi-métrica <a class="anchor" id="1"></a>

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>


$\hspace{0.25cm}$ Denominamos casi-metrica o disimilaridad a cualquier función $\hspace{0.1cm}\delta : A \hspace{0.05cm}x\hspace{0.05cm} A \rightarrow \mathbb{R}\hspace{0.1cm}$ que tiene las siguientes propiedades: $\\[0.5cm]$


$\hspace{0.35cm} 1)$ $\hspace{0.25cm}\delta (i,j) \geq 0 \hspace{0.25cm} , \hspace{0.25cm}   \forall i,j \in A \\$

$\hspace{0.35cm}  2)$ $\hspace{0.25cm}\delta (i,i) = 0 \hspace{0.25cm} , \hspace{0.25cm} \forall i \in  A \\$

$\hspace{0.35cm}  3)$ $\hspace{0.25cm}\delta (i,j) = \delta (j, i) \hspace{0.25cm} , \hspace{0.25cm} \forall i,j \in A$

</p>
 
</p></span>
</div>



<br>

## Semi-métrica <a class="anchor" id="6"></a>

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>


$\hspace{0.25cm}$ Es denominada **semi-métrica**  a toda disimilaridad (casi-métrica) que tiene la propiedad siguiente (desigualdad triangular):


$\hspace{0.35cm}  4)$ $\hspace{0.25cm} \delta (i,j) \hspace{0.1 cm}\leq \hspace{0.1 cm} \delta (i,k) + \delta (k,j) \hspace{0.25cm} , \hspace{0.25cm} \forall i,j,k \in A$

</p>
 
</p></span>
</div>


<br>


## Métrica <a class="anchor" id="7"></a>


<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>

$\hspace{0.25cm}$ Se denomina **metrica**  a toda semi-metrica que tiene la siguiente propiedad:

$\hspace{0.35cm} 5)$ $\hspace{0.25cm} \delta (i,j)=0 \hspace{0.15cm}\Leftrightarrow\hspace{0.15cm} i=j \hspace{0.25cm} , \hspace{0.25cm} \forall i,j \in A$

</p>
 
</p></span>
</div>

<br>



## Distancia <a class="anchor" id="9"></a>

- Una **distancia** es una metrica o semi-metrica
 

Expresandolo de otra manera:

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>

$\hspace{0.25cm}$ Sea $\hspace{0.1cm}\delta : A \hspace{0.05cm}x\hspace{0.05cm} A \rightarrow \mathbb{R}\hspace{0.1cm}$

$\hspace{0.35cm} \delta$ es una distancia si y solo si : 

$\hspace{0.25cm}$ Cumple las siguientes cuatro propiedades:

$\hspace{0.35cm} 1)$  $\hspace{0.25cm}\delta (i,j) \geq 0 \hspace{0.25cm} , \hspace{0.25cm} \forall i,j \in A \\$

$\hspace{0.35cm} 2)$  $\hspace{0.25cm}\delta (i,i) = 0 \hspace{0.25cm} , \hspace{0.25cm} \forall i \in  A \\$

$\hspace{0.35cm} 3)$  $\hspace{0.25cm}\delta (i,j) = \delta (j, i) \hspace{0.25cm} , \hspace{0.25cm} \forall i,j \in A \\$

$\hspace{0.35cm} 4)$  $\hspace{0.25cm} \delta (i,j) \hspace{0.1 cm}\leq \hspace{0.1 cm} \delta (i,k) + \delta (k,j) \hspace{0.25cm} , \hspace{0.25cm} \forall i,j,k \in A$


$\hspace{0.25cm}$ o bien, cumple las cuatro anteriores y además la siguiente propiedad:

$\hspace{0.35cm} 5)$ $\hspace{0.25cm} \delta (i,j)=0 \hspace{0.15cm}\Leftrightarrow\hspace{0.15cm} i=j \hspace{0.25cm} , \hspace{0.25cm} \forall i,j \in A \\$

</p>
 
</p></span>
</div>

<br>

## Matriz de distancias <a class="anchor" id="10"></a>



<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>

$\hspace{0.25cm}$ Dada una distanccia $\delta$ definida sobre el conjutno  $\hspace{0.1cm} A=\lbrace a_1,...,a_n\rbrace$ 

$\hspace{0.25cm}$ Se define la matriz de distancias $\delta$ sobre $A$ como: $\\[0.7cm]$


$$
D(\delta , A) = \begin{pmatrix}
0 & \delta_{12}&...&\delta_{1n}\\
\delta_{21} & 0&...&\delta_{2n}\\
...&...&...&...\\
\delta_{n1}& \delta_{n2}&...& 0\\
\end{pmatrix}
$$


$\hspace{0.25cm}$ Donde:
 
$\hspace{0.35cm} \delta_{ir} = \delta(a_i,a_r) \hspace{0.25cm} , \hspace{0.25cm} \forall i,r \in \lbrace 1,...,n \rbrace$

$\hspace{0.35cm} \delta_{ir}\hspace{0.1cm}$ puede interpretarse como la distancia $\hspace{0.1cm}\delta\hspace{0.1cm}$ entre el par de elementos $\hspace{0.1cm}(a_i,a_r)\hspace{0.1cm}$ de $\hspace{0.1cm}A$

</p>
 
</p></span>
</div>

<br>

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>

$\hspace{0.25cm}$ También es relevante en algunas técnicas estadisticas la matrid de cuadrados de las distancias: $\\[0.7cm]$



$$
D(\delta , A)^{(2)}= 
\begin{pmatrix}
0 & \delta^2_{12}&...&\delta^2_{1n}\\
\delta^2_{21} & 0&...&\delta^2_{2n}\\
...&...&...&...\\
\delta^2_{n1}& \delta^2_{n2}&...& 0\\
\end{pmatrix} \\[2cm]
$$



</p>
 
</p></span>
</div>

No debe confundirse con  $\hspace{0.1cm} D\hspace{0.05cm}^2=D\cdot D$





<br>



# Distancias con variables estadísticas cuantitativas <a class="anchor" id="11"></a>

El escenario inicial es el siguiente:

Tenemos una muestra de $n$  elementos/individuos $\hspace{0.1cm}\Omega = \lbrace e_1,e_2,...,e_n \rbrace$ 

Tenemos una serie de variables estadisticas **cuantitativas** $\hspace{0.1cm}\mathcal{X}_1,...,\mathcal{X}_p$

Para cada variable cuantitativa $\mathcal{X}_j$ tenemos una muestra de $n$ observaciones $X_j$  basada en la muestra de $n$ individuos $\hspace{0.1cm}\Omega$

 
Es decir, tenemos lo siguiente:

- $\hspace{0.1cm}X_j=(x_{j1},...,x_{jn})^t$ , para $j=1,...,p \\$

- $\hspace{0.1cm}x_{ji}\hspace{0.1cm}$ es la observación de la variable $\hspace{0.1cm}\mathcal{X}_j\hspace{0.1cm}$ para el individuo $\hspace{0.1cm}e_i\hspace{0.1cm}$ de la muestra $\hspace{0.1cm}\Omega$ , para $\hspace{0.1cm}j=1,...,p\hspace{0.15cm}$ y $\hspace{0.15cm}i=1,...,n \\$

Por tanto :

- $\hspace{0.1cm}X_j=(x_{j1},...,x_{jn})^t\hspace{0.1cm}$ es el vector con las observaciones de la variable $\hspace{0.1cm}\mathcal{X}_j\hspace{0.1cm}$ para los individuos de la muestra $\hspace{0.1cm}\Omega\hspace{0.1cm}$  , para $\hspace{0.1cm}j=1,...,p \\$

- $\hspace{0.1cm}x_i = (x_{1i} , x_{2i} ,..., x_{pi})^t\hspace{0.1cm}$ es el vector con las observaciones de las variables  $\hspace{0.1cm}\mathcal{X}_1,...,\mathcal{X}_p\hspace{0.1cm}$ para el individuo $\hspace{0.1cm}e_i\hspace{0.1cm}$ de $\hspace{0.1cm}\Omega$ , para $\hspace{0.1cm}i=1,...,n$



<br>


## Distancia Euclidea <a class="anchor" id="12"></a>


<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>

$\hspace{0.25cm}$ La distancia Euclidea entre el par de observaciones $\hspace{0.1cm}(x_i , x_r)\hspace{0.1cm}$ de las variables cuantitativas $\hspace{0.1cm}\mathcal{X}_1,...,\mathcal{X}_p\hspace{0.1cm}$ se define como: $\\[0.7cm]$


$$
\hspace{0.35cm} \delta(x_i,x_r)_{E} =\sqrt{\sum_{k=1}^{p} (x_{ik} - x_{rk})\hspace{0.05cm}^2 \hspace{0.1cm} }  \hspace{0.1cm}=\hspace{0.1cm} \sqrt{(x_i - x_r)\hspace{0.05cm}^t\cdot (x_i - x_r)\hspace{0.1cm}}  \\[0.6cm]
$$





$\hspace{0.35cm}$ para $\hspace{0.15cm} i,r \in \lbrace 1,...,n \rbrace$


</p>
 
</p></span>
</div>


<br>
 
**Observaciones:**


$\delta(x_i,x_r)_{E}$ puede interpretarse como la distancia Euclidea entre el par de individuos $(e_i , e_r)$ respecto de las variables estadisticas  $\mathcal{X}_1,...,\mathcal{X}_p$  

Nos da una medida de distancia entre individuos basada en datos de esos individuos sobre variables estadisticas.  




<br>


**Distancia Euclidea entre vectores**

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>

$\hspace{0.25cm}$ La distancia Euclidea no se circusncribe solamente al campo de la estadística, una definicion mas general que contiene a la anteriormente dada es la siguiente:

$\hspace{0.25cm}$ Dados dos vectores  $\hspace{0.1cm}v=(v_1,...,v_n)^t\hspace{0.1cm}$ y $\hspace{0.1cm}w=(w_1,...,w_n)^t\hspace{0.1cm}$ de $\hspace{0.1cm}\mathbb{R}^n$

$\hspace{0.25cm}$ La distancia Euclidea entre esos vectores es:

$$
\hspace{0.25cm} \delta(v,w)_{E} \hspace{0.07cm}=\hspace{0.07cm}  \sqrt{ \sum_{i=1}^{n} (v_{i} - w_{i})\hspace{0.05cm}}
$$

</p>
 
</p></span>
</div>

- Así que $\hspace{0.1cm} \delta(x_i,x_r)_{E}\hspace{0.1cm}$ es la distancia Euclidea entre los vectores (de observaciones) $\hspace{0.1cm} x_i=(x_{i1},x_{i2},...,x_{ip})\hspace{0.1cm}$ y $\hspace{0.1cm} x_r=(x_{r1},x_{r2},...,x_{rp})\hspace{0.1cm}$ de las variables estadisticas $\hspace{0.1cm} \mathcal{X}_1,...,\mathcal{X}_p$




<br>



**Desventajas de la distancia Euclidea** <a class="anchor" id="13"></a>


 
Aunque es una de las distancias mas usadas en la práctica, en muchos casos no es la más adecuada desde un punto de vista estadistico por las siguientes razones: 

-  Asume que las variables están incorreladas y tienen varianza uno. 

-  No es invariante ante cambios de escala de las variables.


 
Vamos a ver que significa esto último:

Si cambiamos la escala de las variables, es decir, aplicamos la siguiente transformación sobre las variables:

$$a\cdot \mathcal{X}_j + b$$ 

con $\hspace{0.1cm}a\neq 1\hspace{0.1cm}$ y $\hspace{0.1cm}b\neq 0$

Ahora las observaciones de los elementos $\hspace{0.1cm}i\hspace{0.1cm}$ y $\hspace{0.1cm}r\hspace{0.1cm}$ son $\hspace{0.1cm}\hat{x}_i = a\cdot x_i + b\hspace{0.2cm}$ y $\hspace{0.2cm}\hat{x}_r = a\cdot x_r + b$

Por lo que la distancia Euclidea entre el par de observaciones $\hat{x}_i$ y $\hat{x}_r$  es:

$$
\delta(\hat{x}_i , \hat{x}_r) \hspace{0.1cm}=\hspace{0.1cm} \delta(a\cdot x_i + b \hspace{0.1cm},\hspace{0.1cm} a\cdot x_r + b)_{E} \hspace{0.1cm}=\hspace{0.1cm} \sqrt{ a^2 \cdot (x_i - x_r)^t\cdot (x_i - x_r) }
$$

<br>

**Ventajas de la distancia Euclidea**

- Facilidad de cálculo

- Facilidad de interpretación geométrica. Dados dos puntos en un espacio de dos o tres dimensiones, la distancia Euclidea entre ese par de puntos es la longitud del segmento que los une. Es una distancia fácil de visualizar e intuitiva.


<br>




## Distancia Euclidea en `Python` <a class="anchor" id="14"></a>



```python
def Dist_Euclidea(x_i, x_r):

        Dist_Euclidea = ( ( x_i - x_r )**2 ).sum()

        Dist_Euclidea = np.sqrt(Dist_Euclidea)

        return Dist_Euclidea
```


```python
Dist_Euclidea(Data_quant.iloc[2,:] , Data_quant.iloc[5,:])
```




    1969900.0019225744




```python
def Matrix_Dist_Euclidea(Data):

    # Paso previo necesario si Data es pd.DataFrame  --> Data = Data.to_numpy()

    n = len(Data)

    M =  np.empty((n , n))

    
    for i in range(0, n):

         for r in range(0, n):

             if i >= r :
               
                 M[i,r] = 0

             else :

                 M[i,r] = Dist_Euclidea(Data[i,:] , Data[r,:])  # Seria bueno paralelizar esta parte

                      
    return M 
```


```python
M_Euclidean = Matrix_Dist_Euclidea(Data=Data_quant_numpy)
```


```python
M_Euclidean
```




    array([[      0.        ,  150000.00728238, 1550000.00212124, ...,
             200000.01565902, 2025000.00024491, 1939113.00017324],
           [      0.        ,       0.        , 1700000.00034859, ...,
              50000.01055292, 2175000.00140691, 2089113.00126347],
           [      0.        ,       0.        ,       0.        , ...,
            1750000.00000111,  475000.01333737,  389113.0147095 ],
           ...,
           [      0.        ,       0.        ,       0.        , ...,
                  0.        , 2225000.00274952, 2139113.00257909],
           [      0.        ,       0.        ,       0.        , ...,
                  0.        ,       0.        ,   85887.00018092],
           [      0.        ,       0.        ,       0.        , ...,
                  0.        ,       0.        ,       0.        ]])


<br>

```python
M_Euclidean = M_Euclidean + M_Euclidean.T

M_Euclidean
```




    array([[      0.        ,  150000.00728238, 1550000.00212124, ...,
             200000.01565902, 2025000.00024491, 1939113.00017324],
           [ 150000.00728238,       0.        , 1700000.00034859, ...,
              50000.01055292, 2175000.00140691, 2089113.00126347],
           [1550000.00212124, 1700000.00034859,       0.        , ...,
            1750000.00000111,  475000.01333737,  389113.0147095 ],
           ...,
           [ 200000.01565902,   50000.01055292, 1750000.00000111, ...,
                  0.        , 2225000.00274952, 2139113.00257909],
           [2025000.00024491, 2175000.00140691,  475000.01333737, ...,
            2225000.00274952,       0.        ,   85887.00018092],
           [1939113.00017324, 2089113.00126347,  389113.0147095 , ...,
            2139113.00257909,   85887.00018092,       0.        ]])



<br>

<br>

##  Distancia de Minkowski <a class="anchor" id="18"></a>

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>

$\hspace{0.25cm}$ La distancia de Minkowski de parametro $\hspace{0.1cm} q=1,2,3,... \hspace{0.1cm}$ entre el par de observaciones $\hspace{0.1cm}(x_i , x_r)\hspace{0.1cm}$ de las variables estadisticas $\hspace{0.1cm} \mathcal{X}_1,. ..,\mathcal{X}_k\hspace{0.1cm}$  se define como: $\\[0.5cm]$


$$
\hspace{0.25cm} \delta_q(x_i,x_r)_{Mink} \hspace{0.1cm} = \hspace{0.1cm}  \left( \sum_{k=1}^{p}  \mid x_{ik} - x_{jk} \mid  ^q  \right)^{(1/q)}     
$$

</p>
 
</p></span>
</div>

<br>




**Distancia Minkowski entre vectores**


<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>

$\hspace{0.25cm}$ La distancia de Minkowski puede definirse de un modo mas general no sujeto al contexto estadistico.

$\hspace{0.25cm}$ Dados dos vectores $\hspace{0.1cm} v=(v_1,...,v_n)^t\hspace{0.1cm}$ y $\hspace{0.1cm} w=(w_1,...,w_n)^t\hspace{0.1cm}$ de $\hspace{0.1cm}\mathbb{R}^2 \\$



$\hspace{0.25cm}$ La distancia de Minkowski entre  esos vectores se define como:

$$
\hspace{0.25cm} \delta_q(v,w)_{Mink}   \hspace{0.07cm}=\hspace{0.07cm}  \left( \sum_{i=1}^{n}  \mid v_{i } - w_{i} \mid  ^q  \right)^{(1/q)}
$$

</p>
 
</p></span>
</div>


- Asi que $\hspace{0.1cm} \delta_q(x_i,x_r)_{Minkowski}\hspace{0.1cm}$ es la distancia de Minkowski entre los vectores (de observaciones) $\hspace{0.1cm} x_i=(x_{i1},x_{i2},...,x_{ip})\hspace{0.1cm}$ y $\hspace{0.1cm} x_r=(x_{r1},x_{r2},...,x_{rp})\hspace{0.1cm}$ de las variables estadisticas $\hspace{0.1cm} \mathcal{X}_1,...,\mathcal{X}_p$


<br>


**Desventajas de la distancia de Minkowski**


1) Asume que las variables son incorreladas y tienen varianza uno.

2) No es invariante ante cambios de escala (cambios en las unidades de medida) de las variables.

3) Es dificilmente euclideanizable.




<br>



### Casos particulares de la distancia de Minkowski <a class="anchor" id="20"></a>


<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>

$\hspace{0.25cm}$  **Distancia Euclidea** 


\begin{gather*}
 \delta_2(i,j)_{Mink }=\delta (i,j)_{Euclidea }   \hspace{1cm} (q=2) \\
 \end{gather*}
 


<br>

$\hspace{0.25cm}$  **Distancia Manhattan**



\begin{gather*}
 \delta_1(i,j)_{Mink } \hspace{0.1cm}=\hspace{0.1cm} \sum_{k=1}^{p}  \mid x_{ik} - x_{jk}  \mid   \hspace{1cm} (q=1) \\
 \end{gather*}



<br>

$\hspace{0.25cm}$  **Distancia Dominante** <a class="anchor" id="23"></a>



\begin{gather*}
 \delta_{\infty}(i,j)_{Mink } \hspace{0.1cm}=\hspace{0.1cm} max \lbrace  \hspace{0.1cm} \mid x_{i1} - x_{j1} \mid \hspace{0.1cm},...,\hspace{0.1cm} \mid x_{ip} - x_{jp} \mid \hspace{0.1cm}  \rbrace \hspace{1cm} (q\rightarrow \infty) 
 \end{gather*}


</p>
 
</p></span>
</div>

<br>

<br>






## Distancia de Minkowski en `Python`

```python
def Dist_Minkowski(x_i, x_r, q):

    Dist_Minkowski = ( ( ( abs( x_i - x_r) )**q ).sum() )**(1/q)

    return Dist_Minkowski
```


```python
Dist_Minkowski(Data_quant.iloc[2,:], Data_quant.iloc[5,:], q=1)
```

    1969992.0102169998

```python
Dist_Minkowski(Data_quant.iloc[2,:], Data_quant.iloc[5,:], q=2)
```

    1969900.0019225744

```python
Dist_Minkowski(Data_quant.iloc[2,:], Data_quant.iloc[5,:], q=3)
```

    1969900.000000055


```python
Dist_Minkowski(Data_quant.iloc[2,:], Data_quant.iloc[5,:], q=10)
```

    1969900.0000000016


```python
def Matrix_Dist_Minkowski(Data, q):

    # Paso previo necesario si Data es pd.DataFrame  -->  Data = Data.to_numpy()

    n = len(Data)

    M =  np.empty((n , n))

    
    for i in range(0, n):

         for r in range(0, n):

             if i >= r :
               
                 M[i,r] = 0

             else :

                 M[i,r] = Dist_Minkowski(Data[i,:] , Data[r,:], q)   

                      
    return M 
```


```python
M_Minkowski = Matrix_Dist_Minkowski(Data=Data_quant_numpy , q=1)

M_Minkowski
```

```
array([[      0.      ,  150047.748877, 1550086.062526, ...,
         200084.359869, 2025031.624379, 1939138.969796],
       [      0.      ,       0.      , 1700038.338187, ...,
          50036.62379 , 2175079.33592 , 2089186.681337],
       [      0.      ,       0.      ,       0.      , ...,
        1750002.301489,  475117.608205,  389224.964166],
       ...,
       [      0.      ,       0.      ,       0.      , ...,
              0.      , 2225115.802424, 2139223.298103],
       [      0.      ,       0.      ,       0.      , ...,
              0.      ,       0.      ,   85892.654583],
       [      0.      ,       0.      ,       0.      , ...,
              0.      ,       0.      ,       0.      ]])
```              

<br>

```python
M_Minkowski = M_Minkowski + M_Minkowski.T

M_Minkowski
```

```

array([[      0.      ,  150047.748877, 1550086.062526, ...,
         200084.359869, 2025031.624379, 1939138.969796],
       [ 150047.748877,       0.      , 1700038.338187, ...,
          50036.62379 , 2175079.33592 , 2089186.681337],
       [1550086.062526, 1700038.338187,       0.      , ...,
        1750002.301489,  475117.608205,  389224.964166],
       ...,
       [ 200084.359869,   50036.62379 , 1750002.301489, ...,
              0.      , 2225115.802424, 2139223.298103],
       [2025031.624379, 2175079.33592 ,  475117.608205, ...,
        2225115.802424,       0.      ,   85892.654583],
       [1939138.969796, 2089186.681337,  389224.964166, ...,
        2139223.298103,   85892.654583,       0.      ]])
```


 
 
<br>



## Distancia de Canberra  <a class="anchor" id="32"></a>


<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>


$\hspace{0.25cm}$ La distancia de Canberra entre el par de observaciones $\hspace{0.1cm}(x_i , x_r)\hspace{0.1cm}$ de las variables estadisticas $\hspace{0.1cm} \mathcal{X}_1,. ..,\mathcal{X}_k\hspace{0.1cm}$  se define como: $\\[0.5cm]$



\begin{gather*}
\delta(x_i,x_r)_{C}\hspace{0.1cm}= \hspace{0.1cm} \sum_{k=1}^{p} \dfrac{\mid x_{ik} - x_{jk} \mid}{\mid x_{ik} \mid + \mid x_{jk} \mid}  
 \end{gather*}

</p>
 
</p></span>
</div>



<br>



**Distancia Canberra entre vectores**


<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>


$\hspace{0.25cm}$ La distancia de Canberra se puede definir de forma más general no sujeta a un contexto estadístico.

$\hspace{0.25cm}$ Dados dos vectores $\hspace{0.07cm}v=(v_1,...,v_n)^t\hspace{0.07cm}$ y $\hspace{0.07cm}w=(w_1,...,w_n)^t$ de $\hspace{0.07cm}\mathbb{R}^2$



$\hspace{0.25cm}$ La distancia Canberra entre esos dos vectores es: $\\[0.7cm]$

$$
\delta (v,w)_{C}  \hspace{0.07cm}=\hspace{0.07cm}   \sum_{i=1}^{n} \dfrac{ \mid v_i - w_i \mid }{\mid v_i \mid + \mid w_i \mid} \\
$$

</p>
 
</p></span>
</div>


- Asi que $\hspace{0.1cm} \delta_q(x_i,x_r)_{Mink}\hspace{0.1cm}$ es la distancia de Minkowski entre los vectores (de observaciones) $\hspace{0.1cm} x_i=(x_{i1},x_{i2},...,x_{ip})\hspace{0.1cm}$ y $\hspace{0.1cm} x_r=(x_{r1},x_{r2},...,x_{rp})\hspace{0.1cm}$ de las variables estadisticas $\hspace{0.1cm} \mathcal{X}_1,...,\mathcal{X}_p$



<br>

**Desventajas de la distancia de Canberra**

1) Asumen que las variables son incorreladas y tienen varianza uno.



**Ventajas de la distancia de Canberra**

1) Es invariante ante cambios de escala (cambios en las unidades de medida) de las variables.



<br>



## Distancia de Canberra en `Python` <a class="anchor" id="33"></a>

```python
def Dist_Canberra(x_i, x_r):

    numerator =  abs( x_i - x_r )

    denominator =  ( abs(x_i) + abs(x_r) )
       
    numerator=np.array([numerator], dtype=float)

    denominator=np.array([denominator], dtype=float)

    # The following code is to eliminate zero division problems

    Dist_Canberra = ( np.divide( numerator , denominator , out=np.zeros_like(numerator), where=denominator!=0) ).sum() 

    return Dist_Canberra
```


```python
Dist_Canberra(Data.iloc[2,:] , Data.iloc[5,:])
```

    9.161812529108834


```python
def Matrix_Dist_Canberra(Data):

    # Paso previo necesario si Data es pd.DataFrame  -->  Data = Data.to_numpy()

    n = len(Data)

    M =  np.empty((n , n))

    
    for i in range(0, n):

         for r in range(0, n):

             if i >= r :
               
                 M[i,r] = 0

             else :

                 M[i,r] = Dist_Canberra(Data[i,:] , Data[r,:])   

                      
    return M 
```




```python
M_Canberra = Matrix_Dist_Canberra(Data=Data_quant_numpy)

M_Canberra
```
```
array([[0.        , 0.5496257 , 1.61996314, ..., 1.25082356, 0.78797391,
        0.70959891],
       [0.        , 0.        , 1.15900459, ..., 0.74009173, 1.31434216,
        1.24077176],
       [0.        , 0.        , 0.        , ..., 0.44223489, 1.63990915,
        1.55106392],
       ...,
       [0.        , 0.        , 0.        , ..., 0.        , 2.00032192,
        1.93106183],
       [0.        , 0.        , 0.        , ..., 0.        , 0.        ,
        0.09956138],
       [0.        , 0.        , 0.        , ..., 0.        , 0.        ,
        0.        ]])
```

<br>

```python
M_Canberra = M_Canberra + M_Canberra.T

M_Canberra
```


```
array([[0.        , 0.5496257 , 1.61996314, ..., 1.25082356, 0.78797391,
        0.70959891],
       [0.5496257 , 0.        , 1.15900459, ..., 0.74009173, 1.31434216,
        1.24077176],
       [1.61996314, 1.15900459, 0.        , ..., 0.44223489, 1.63990915,
        1.55106392],
       ...,
       [1.25082356, 0.74009173, 0.44223489, ..., 0.        , 2.00032192,
        1.93106183],
       [0.78797391, 1.31434216, 1.63990915, ..., 2.00032192, 0.        ,
        0.09956138],
       [0.70959891, 1.24077176, 1.55106392, ..., 1.93106183, 0.09956138,
        0.        ]])
```

<br>



## Distancia de Pearson  <a class="anchor" id="37"></a>


<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>

Dada una serie de muestras $X_1,...,X_p$ de las variables estadisticas  $\mathcal{X}_1,...,\mathcal{X}_p$

La distancia de Karl Pearson entre el par de observaciones $(x_i,x_r)$ de las variables estadisticas $\mathcal{X}_1,...,\mathcal{X}_p$ se define como: $\\[0.5cm]$

$$
\delta(x_i,x_r)_{P} \hspace{0.1cm}=\hspace{0.1cm} \sqrt{ \sum_{k=1}^{p} \hspace{0.08cm} \dfrac{1}{s\hspace{0.03cm}^2_k} \cdot ( x_{ik} - x_{rk} )\hspace{0.03cm}^2 } \hspace{0.1cm} =\hspace{0.1cm} \sqrt{(x_i - x_r)\hspace{0.03cm}^t \cdot S_0^{-1} \cdot (x_i - x_r )}  \hspace{0.1cm} = \hspace{0.1cm} \sqrt{  sum \left( \hspace{0.07cm} \left(  \dfrac{ x_i - x_r  }{ \overrightarrow{s}   }\right)^2 \hspace{0.07cm} \right)} \\[0.8cm]
$$
  

</p>
 
</p></span>
</div>





Donde:
 
- $S_0 = \text{diag}(s_1 ^2 ,..., s_p ^2)$
 
- $s_k ^2\hspace{0.08cm}$ es la varianza de la muestra $\hspace{0.08cm}X_k\hspace{0.08cm}$ , es decir, $\hspace{0.08cm} s_k ^2 = \dfrac{1}{n}\cdot \sum_{i=1}^n ( x_{ik} - \overline{X}_k )^2$

- $\overrightarrow{s} = ( s_1 ,..., s_p )$






<br>



**Observación:**

Con la distancia de Karl Pearson, el peso que se le da a la diferencia entre las observaciones de una variable para un par de  individuos decrece cuanto mayor es la varianza de la variable, y aumenta cuanto menor es la varianza.

Es decir, si la variable $\hspace{0.08cm}\mathcal{X}_k\hspace{0.08cm}$ tiene mucha varianza muestral, es decir, mucha $\hspace{0.08cm}s_k ^2\hspace{0.08cm}$ , entonces $\hspace{0.08cm}(x_{ik} - x_{rk})\hspace{0.08cm}$ tiene muy poco peso en la distancia de Pearson. Cuanto menor sea la varianza, mas peso tendrá, y a la inversa.



<br>


**Desventajas**
 
1) Asume que las variables estan incorreladas y tienen varianza uno.




**Ventajas**

1) La distancia de Pearson es invariante ante cambios de escala (cambios en las unidades de medida).




<br>




## Distancia de Pearson en `Python` <a class="anchor" id="38"></a>



```python
def Dist_Pearson(x_i, x_r, Data) :

    # Si Data  es un pd.DataFrame --> hay que convertilos antes a numpy con Data.to_numpy()

    Dist_Pearson = ( ( x_i - x_r )**2 / np.var(Data , axis=0, ddof=1) ).sum()

    # np.var(Data , axis=0, ddof=1)  calcula la cuasi-varianza (ddof=1) por columnas (axis=0)

    Dist_Pearson = np.sqrt(Dist_Pearson)

    return Dist_Pearson
```

```python
Dist_Pearson(x_i=Data_quant_numpy[2,:], x_r=Data_quant_numpy[5,:], Data=Data_quant_numpy)
```

    3.8239347754243425

```python
def Matrix_Dist_Pearson(Data):

    # Paso previo necesario si Data es pd.DataFrame  -->  Data = Data.to_numpy()

    n = len(Data)

    M =  np.empty((n , n))

    
    for i in range(0, n):

         for r in range(0, n):

             if i >= r :
               
                 M[i,r] = 0

             else :

                 M[i,r] = Dist_Pearson(Data[i,:] , Data[r,:], Data=Data)   

                      
    return M 
```

```python
M_Pearson = Matrix_Dist_Pearson(Data=Data_quant_numpy)

M_Pearson
```

```
array([[0.        , 1.21345279, 3.77819153, ..., 4.95085256, 1.66393723,
        0.94314867],
       [0.        , 0.        , 3.17880538, ..., 4.43821303, 2.03523139,
        1.60958264],
       [0.        , 0.        , 0.        , ..., 3.82999056, 4.01162596,
        3.76955491],
       ...,
       [0.        , 0.        , 0.        , ..., 0.        , 4.69603617,
        5.13174853],
       [0.        , 0.        , 0.        , ..., 0.        , 0.        ,
        1.09780835],
       [0.        , 0.        , 0.        , ..., 0.        , 0.        ,
        0.        ]])
```

<br>


```python
M_Pearson = M_Pearson + M_Pearson.T

M_Pearson
```

```
array([[0.        , 1.21345279, 3.77819153, ..., 4.95085256, 1.66393723,
        0.94314867],
       [1.21345279, 0.        , 3.17880538, ..., 4.43821303, 2.03523139,
        1.60958264],
       [3.77819153, 3.17880538, 0.        , ..., 3.82999056, 4.01162596,
        3.76955491],
       ...,
       [4.95085256, 4.43821303, 3.82999056, ..., 0.        , 4.69603617,
        5.13174853],
       [1.66393723, 2.03523139, 4.01162596, ..., 4.69603617, 0.        ,
        1.09780835],
       [0.94314867, 1.60958264, 3.76955491, ..., 5.13174853, 1.09780835,
        0.        ]])
```

<br>





## Distancia de Mahalanobis  <a class="anchor" id="42"></a>


<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>

$\hspace{0.25cm}$ Dada una matriz de datos $\hspace{0.1cm} X=(X_1,...,X_p)\hspace{0.1cm}$ de las variables estadisticas  $\hspace{0.1cm}\mathcal{X}_1,...,\mathcal{X}_p$


$\hspace{0.25cm}$ La distancia de Mahalanobis entre el par de observaciones $\hspace{0.1cm}(x_i,x_r)\hspace{0.1cm}$ de las variables estadisticas $\hspace{0.1cm}\mathcal{X}_1,...,\mathcal{X}_p$ se define como: $\\[0.5cm]$

 
$$
 \delta(x_i,x_r)_{Maha} \hspace{0.08cm}= \hspace{0.08cm}\sqrt{(x_i - x_r)\hspace{0.03cm}^t \cdot S^{-1} \cdot (x_i - x_r ) }   \\[0.6cm]
$$


$\hspace{0.25cm}$ Donde:

$\hspace{0.35cm} S \hspace{0.08cm}$ es la matriz de covarianzas de la matriz de datos $\hspace{0.08cm}X=(X_1,...,X_p)$

</p>
 
</p></span>
</div>



<br>


**Ventajas**

La distancia de Mahalanobis es adecuada como distancia estadística por las siguientes razones: 

- Es invariante ante cambios de escala (cambios en las unidades de medida) de las variables.

- Tiene en cuenta la correlación entre las variables. No aumenta al incrementar el número de variables observadas. Solo aumenta cuando estas nuevas variables no estan correladas con las anteriores. Asi que solo cuando las nuevas variables no son redundantes con respecto a la infromacion provista por las anteriores, la distancia de Mahalanobis aumentará.

<br>

***Observaciones***

- La distancia Euclidea es igual a la de Mahalanobis cuando $\hspace{0.1cm} S=I \\$

- La distancia de Pearson es igual a la de Mahalanobis cuando $\hspace{0.1cm} S=\text{diag}(s_1^2 ,..., s_p^2)$



<br>




## Distancia de Mahalanobis en `Python` <a class="anchor" id="43"></a>



```python
def Dist_Mahalanobis_1(x_i, x_r, Data):

    # All the columns of Data must be type = 'float' or 'int' (specially not 'object'), in other case we will find 
    # dimensional problems when Python compute   x @ S_inv @ x.T

    x = (x_i - x_r)

    x = np.array([x]) # necessary step to transpose a 1D array

    S_inv = np.linalg.inv( np.cov(Data , rowvar=False) ) # inverse of covariance matrix

    Dist_Maha = np.sqrt( x @ S_inv @ x.T )  # x @ S_inv @ x.T = np.matmul( np.matmul(x , S_inv) , x.T )

    Dist_Maha = float(Dist_Maha)

    return Dist_Maha
```


```python
Dist_Mahalanobis_1(Data_quant_numpy[2,:] , Data_quant_numpy[5,:] , Data=Data_quant_numpy )
```

    3.931396144771864


<br>

```python
def Dist_Mahalanobis_2(x_i, x_r, S_inv):  # Más eficiente que la anterior

    # All the columns of Data must be type = 'float' or 'int' (specially not 'object'), in other case we will find 
    # dimensional problems when Python compute   x @ S_inv @ x.T

    x = (x_i - x_r)

    x = np.array([x]) # necessary step to transpose a 1D array

    Dist_Maha = np.sqrt( x @ S_inv @ x.T )  # x @ S_inv @ x.T = np.matmul( np.matmul(x , S_inv) , x.T )

    Dist_Maha = float(Dist_Maha)

    return Dist_Maha
```


```python
Dist_Mahalanobis_2(x_i = Data_quant_numpy[2,:] , x_r = Data_quant_numpy[5,:] , S_inv = np.linalg.inv( np.cov(Data_quant_numpy , rowvar=False) ) )
```

    3.931396144771864


<br>


```python
def Dist_Mahalanobis_3(x, S_inv):  # Más eficiente que la anterior

    # All the columns of Data must be type = 'float' or 'int' (specially not 'object'), in other case we will find 
    # dimensional problems when Python compute   x @ S_inv @ x.T

    # x = (x_i - x_r)

    # x = np.array([x]) # necessary step to transpose a 1D array

    Dist_Maha = np.sqrt( x @ S_inv @ x.T )  # x @ S_inv @ x.T = np.matmul( np.matmul(x , S_inv) , x.T )

    Dist_Maha = float(Dist_Maha)

    return Dist_Maha
```



```python
Dist_Mahalanobis_3(x = np.array([Data_quant_numpy[2,:] - Data_quant_numpy[5,:]]) , S_inv=np.linalg.inv( np.cov(Data_quant_numpy , rowvar=False) ))
```
    
    3.931396144771864


<br>

```python
def Matrix_Dist_Mahalanobis_1(Data):

    # Paso previo necesario si Data es pd.DataFrame  -->  Data = Data.to_numpy()

    n = len(Data)

    M =  np.empty((n , n))

   
    for i in range(0, n):

         for r in range(0, n):

             if i >= r :
               
                 M[i,r] = 0

             else :

                 M[i,r] = Dist_Mahalanobis_1(x_i = Data[i,:] , x_r = Data[r,:] , Data=Data )

                      
    return M 
```

<br>

```python
Matrix_Dist_Mahalanobis_1(Data=Data_quant_numpy[0:1000 , 0:1000]) # 2.25 mins
```

```
array([[0.        , 2.16321817, 3.81131086, ..., 2.74083537, 3.84799958,
        1.06041471],
       [0.        , 0.        , 4.29953104, ..., 2.76698155, 2.78100414,
        2.20791581],
       [0.        , 0.        , 0.        , ..., 2.63546884, 4.34269664,
        3.32469143],
       ...,
       [0.        , 0.        , 0.        , ..., 0.        , 2.18534065,
        1.8408748 ],
       [0.        , 0.        , 0.        , ..., 0.        , 0.        ,
        3.09496075],
       [0.        , 0.        , 0.        , ..., 0.        , 0.        ,
        0.        ]])
```

<br>

```python
Matrix_Dist_Mahalanobis_1(Data=Data_quant_numpy) # 8.52 mins
```
```
array([[0.        , 2.11289055, 3.7975463 , ..., 4.51559865, 2.31688444,
        1.10588047],
       [0.        , 0.        , 4.35615967, ..., 4.93340427, 2.74011739,
        2.12938584],
       [0.        , 0.        , 0.        , ..., 3.17779509, 3.49432487,
        3.23723317],
       ...,
       [0.        , 0.        , 0.        , ..., 0.        , 3.58695453,
        4.11275247],
       [0.        , 0.        , 0.        , ..., 0.        , 0.        ,
        1.46894947],
       [0.        , 0.        , 0.        , ..., 0.        , 0.        ,
        0.        ]])
```
<br>

```python
def Matrix_Dist_Mahalanobis_2(Data):

    # Paso previo necesario si Data es pd.DataFrame  -->  Data = Data.to_numpy()

    n = len(Data)

    M =  np.empty((n , n))

    S_inv = np.linalg.inv( np.cov(Data , rowvar=False) )

   
    for i in range(0, n):

         for r in range(0, n):

             if i >= r :
               
                 M[i,r] = 0

             else :

                 M[i,r] = Dist_Mahalanobis_2(x_i = Data[i,:] , x_r = Data[r,:] , S_inv = S_inv  )

                      
    return M 
```

<br>

```python
Matrix_Dist_Mahalanobis_2(Data=Data_quant_numpy[0:1000 , 0:1000]) # 6.8 seg
```
```
array([[0.        , 2.16321817, 3.81131086, ..., 2.74083537, 3.84799958,
        1.06041471],
       [0.        , 0.        , 4.29953104, ..., 2.76698155, 2.78100414,
        2.20791581],
       [0.        , 0.        , 0.        , ..., 2.63546884, 4.34269664,
        3.32469143],
       ...,
       [0.        , 0.        , 0.        , ..., 0.        , 2.18534065,
        1.8408748 ],
       [0.        , 0.        , 0.        , ..., 0.        , 0.        ,
        3.09496075],
       [0.        , 0.        , 0.        , ..., 0.        , 0.        ,
        0.        ]])
```

<br>

```python
Matrix_Dist_Mahalanobis_2(Data=Data_quant_numpy) # 22.5 seg
```

```
array([[0.        , 2.11289055, 3.7975463 , ..., 4.51559865, 2.31688444,
        1.10588047],
       [0.        , 0.        , 4.35615967, ..., 4.93340427, 2.74011739,
        2.12938584],
       [0.        , 0.        , 0.        , ..., 3.17779509, 3.49432487,
        3.23723317],
       ...,
       [0.        , 0.        , 0.        , ..., 0.        , 3.58695453,
        4.11275247],
       [0.        , 0.        , 0.        , ..., 0.        , 0.        ,
        1.46894947],
       [0.        , 0.        , 0.        , ..., 0.        , 0.        ,
        0.        ]])
```

<br>


```python
def Matrix_Dist_Mahalanobis_3(Data):

    # Paso previo necesario si Data es pd.DataFrame  -->  Data = Data.to_numpy()

    n = len(Data)

    M =  np.empty((n , n))

    S_inv=np.linalg.inv( np.cov(Data , rowvar=False) )

   
    for i in range(0, n):

         for r in range(0, n):

             if i >= r :
               
                 M[i,r] = 0

             else :

                 M[i,r] = Dist_Mahalanobis_3(x = np.array([Data[i,:] - Data[r,:]]) , S_inv=S_inv ) 

                      
    return M 
```

<br>

```python
Matrix_Dist_Mahalanobis_3(Data=Data_quant_numpy[0:1000 , 0:1000]) # 4.8 seg
```

```
array([[0.        , 2.16321817, 3.81131086, ..., 2.74083537, 3.84799958,
        1.06041471],
       [0.        , 0.        , 4.29953104, ..., 2.76698155, 2.78100414,
        2.20791581],
       [0.        , 0.        , 0.        , ..., 2.63546884, 4.34269664,
        3.32469143],
       ...,
       [0.        , 0.        , 0.        , ..., 0.        , 2.18534065,
        1.8408748 ],
       [0.        , 0.        , 0.        , ..., 0.        , 0.        ,
        3.09496075],
       [0.        , 0.        , 0.        , ..., 0.        , 0.        ,
        0.        ]])
```

<br>


```python
M_Mahalanobis = Matrix_Dist_Mahalanobis_3(Data=Data_quant_numpy) # 19.7 seg

M_Mahalanobis
```


```
array([[0.        , 2.11289055, 3.7975463 , ..., 4.51559865, 2.31688444,
        1.10588047],
       [0.        , 0.        , 4.35615967, ..., 4.93340427, 2.74011739,
        2.12938584],
       [0.        , 0.        , 0.        , ..., 3.17779509, 3.49432487,
        3.23723317],
       ...,
       [0.        , 0.        , 0.        , ..., 0.        , 3.58695453,
        4.11275247],
       [0.        , 0.        , 0.        , ..., 0.        , 0.        ,
        1.46894947],
       [0.        , 0.        , 0.        , ..., 0.        , 0.        ,
        0.        ]])
```

<br>

```python
M_Mahalanobis = M_Mahalanobis + M_Mahalanobis.T

M_Mahalanobis
```

```
array([[0.        , 4.2257811 , 7.5950926 , ..., 9.03119731, 4.63376888,
        2.21176094],
       [4.2257811 , 0.        , 8.71231935, ..., 9.86680854, 5.48023478,
        4.25877168],
       [7.5950926 , 8.71231935, 0.        , ..., 6.35559018, 6.98864973,
        6.47446634],
       ...,
       [9.03119731, 9.86680854, 6.35559018, ..., 0.        , 7.17390906,
        8.22550494],
       [4.63376888, 5.48023478, 6.98864973, ..., 7.17390906, 0.        ,
        2.93789894],
       [2.21176094, 4.25877168, 6.47446634, ..., 8.22550494, 2.93789894,
        0.        ]])
```


<br>


<br>

# Similaridades

## Similaridad <a class="anchor" id="48"></a>

Es un concepto que expresa la proximidad o similaridad entre un par de elementos cualesquiera.


<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>

$\hspace{0.25cm}$ Dado un conjunto cualquiera $\hspace{0.1cm}A$



$\hspace{0.25cm}$ Se denomina similaridad a toda función $\hspace{0.1cm} \phi : A \text{x} A \rightarrow \mathbb{R}\hspace{0.1cm}$   tal que:

$\hspace{0.35cm} 1)$ $\hspace{0.2cm} \phi(i , r) \in [0,1] \hspace{0.45cm}  \forall i,r \in A \\$

$\hspace{0.35cm} 2)$ $\hspace{0.2cm} \phi(i, i) = 1  \hspace{0.45cm}  \forall i,r \in A \\$

$\hspace{0.35cm} 3)$  $\hspace{0.2cm} \phi(i , r) = \phi(r, i)  \hspace{0.45cm}  \forall i,r \in A$

</p>
 
</p></span>
</div>

<br>

## Pasar de similaridad a distancia  <a class="anchor" id="50"></a>

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>

$\hspace{0.25cm}$ Las siguientes transformaciones nos permiten pasar de una similaridad a una distancia:

$\hspace{0.35cm} 1)$  $\hspace{0.25cm} \delta(i,r)=1- \phi(i,r) \\$


$\hspace{0.35cm} 2)$  $\hspace{0.25cm} \delta(i,r)=\sqrt{1-\phi(i,r)} \\$

$\hspace{0.35cm} 3)$ $\hspace{0.25cm} \delta(i,r) \hspace{0.07cm}=\hspace{0.07cm} \sqrt{ \phi(i,i) + \phi(r,r) - 2\cdot \phi(i,r) }$

</p>
 
</p></span>
</div>


 

<br>


## Matriz de Similaridades  <a class="anchor" id="49"></a>

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>

$\hspace{0.25cm}$ Dada una similaridad $s$ definida sobre el conjunto $A=\lbrace a_1 ,..., a_n \rbrace$

$\hspace{0.25cm}$ Se define la matriz de similaridades $\phi$ sobre $A$ como:
 

$$
\mathcal{S}= \begin{pmatrix}
\phi_{11} &\phi_{12}&...&\phi_{1n}\\
\phi_{21} & \phi_{22}&...&\phi_{2n}\\
...&...&...&...\\
\phi_{n1}& \phi_{n2}&...& \phi_{nn}\\
\end{pmatrix} \\
$$



$\hspace{0.25cm}$ Donde:

$\hspace{0.35cm} \phi_{ir} = \phi(a_i , a_r) \hspace{0.45cm}  \forall i, j \in \lbrace 1,...,n\rbrace$


</p>
 
</p></span>
</div>


<br>






# Similaridades con variables categoricas binarias <a class="anchor" id="51"></a>


El escenario es el siguiente:

Tenemos una muestra de $n$  elementos/individuos $\hspace{0.1cm}\Omega = \lbrace e_1,e_2,...,e_n \rbrace$ 

Tenemos una serie de variables estadisticas **categóricas binarias** $\hspace{0.1cm}\mathcal{X}_1,...,\mathcal{X}_p$

Para cada variable binaria $\mathcal{X}_j$ tenemos una muestra de $n$ observaciones $X_j$  basada en la muestra de $n$ individuos $\hspace{0.1cm}\Omega$

 
Es decir, tenemos lo siguiente:

- $\hspace{0.1cm}X_j=(x_{j1},...,x_{jn})^t$ , para $j=1,...,p \\$

- $\hspace{0.1cm}x_{ji}\hspace{0.1cm}$ es la observación de la variable $\hspace{0.1cm}\mathcal{X}_j\hspace{0.1cm}$ para el individuo $\hspace{0.1cm}e_i\hspace{0.1cm}$ de la muestra $\hspace{0.1cm}\Omega$ , para $\hspace{0.1cm}j=1,...,p\hspace{0.1cm}$ y $\hspace{0.1cm}i=1,...,n \\$



Por tanto:

- $\hspace{0.1cm}X_j=(x_{j1},...,x_{jn})^t\hspace{0.1cm}$ es el vector con las observaciones de la variable para los individuos de la muestra $\Omega$  , para $j=1,...,p \\$

- $\hspace{0.1cm}x_i = (x_{1i} , x_{2i} ,..., x_{pi})^t\hspace{0.1cm}$ es el vector con las observaciones de las variables  $\hspace{0.1cm}\mathcal{X}_1,...,\mathcal{X}_p\hspace{0.1cm}$ para el individuo $\hspace{0.1cm}e_i\hspace{0.1cm}$ de $\hspace{0.1cm}\Omega$ , para $\hspace{0.1cm}i=1,...,n$



<br>

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>

$\hspace{0.25cm}$ Los principales coeficientes de similaridad involucran algunos de los siguientes parametros:

 - $\hspace{0.2cm} a(x_i, x_r) \hspace{0.1cm}=\hspace{0.1cm}$ nº de variables binarias $\hspace{0.1cm}\mathcal{X}_j\hspace{0.1cm}$ tales que $\hspace{0.1cm} x_{ij} = x_{rj}=1 \\$ 
 
  
 $$\hspace{0.2cm} a(x_i, x_r) \hspace{0.15cm} = \hspace{0.15cm} \#\hspace{0.1cm} \lbrace \hspace{0.1cm}  j= 1,..,p \hspace{0.15cm}/\hspace{0.15cm} x_{ij}=x_{rj}=1  \hspace{0.1cm}  \rbrace \\[0.5cm]$$

 - $\hspace{0.2cm} b(x_i, x_r)\hspace{0.1cm}=\hspace{0.1cm}$ nº de variables binarias  $\hspace{0.1cm}\mathcal{X}_j\hspace{0.1cm}$ tales que $\hspace{0.1cm}x_{ij} =0\hspace{0.15cm}$ y $\hspace{0.15cm}x_{rj}=1 \\$ 


 $$\hspace{0.2cm} b(x_i, x_r) \hspace{0.15cm} = \hspace{0.15cm} \#\hspace{0.1cm} \lbrace \hspace{0.1cm}  j= 1,..,p \hspace{0.15cm}/\hspace{0.15cm} x_{ij}=0 \hspace{0.2cm}\text{y}\hspace{0.2cm} x_{rj}=1  \hspace{0.1cm}  \rbrace \\[0.5cm]$$


 - $\hspace{0.2cm} c(x_i, x_r)\hspace{0.1cm}=\hspace{0.1cm}$ nº  de variables binarias $\hspace{0.1cm}\mathcal{X}_j\hspace{0.1cm}$ tales que $\hspace{0.1cm}x_{ij} =1\hspace{0.15cm}$ y $\hspace{0.15cm}x_{rj}=0 \\$


 $$\hspace{0.2cm} c(x_i, x_r) \hspace{0.15cm} = \hspace{0.15cm} \#\hspace{0.1cm} \lbrace \hspace{0.1cm}  j= 1,..,p \hspace{0.15cm}/\hspace{0.15cm} x_{ij}=1 \hspace{0.2cm}\text{y}\hspace{0.2cm} x_{rj}=0  \hspace{0.1cm}  \rbrace \\[0.5cm]$$



 - $\hspace{0.2cm} d(x_i, x_r)\hspace{0.1cm}=\hspace{0.1cm}$ nº  de variables binarias $\hspace{0.1cm}\mathcal{X}_j\hspace{0.1cm}$ tales que $\hspace{0.1cm}x_{ij} =0 \hspace{0.15cm}$ y $\hspace{0.15cm}x_{rj}=0 \\$
 
 $$\hspace{0.2cm} d(x_i, x_r) \hspace{0.15cm} = \hspace{0.15cm} \#\hspace{0.1cm} \lbrace \hspace{0.1cm}  j= 1,..,p \hspace{0.15cm}/\hspace{0.15cm} x_{ij}=0 \hspace{0.2cm}\text{y}\hspace{0.2cm} x_{rj}=0  \hspace{0.1cm}  \rbrace \\[0.5cm]$$
 
 

$\hspace{0.25cm}$ **Observación:**

$$a(x_i, x_r) + b(x_i, x_r) + c(x_i, x_r) +d(x_i, x_r) =p$$


</p>
 
</p></span>
</div>

<br>




## Matrices con los parametros a, b, c y d <a class="anchor" id="52"></a>




Dada una matriz de datos $\hspace{0.05cm}X=(X_1,...,X_p)\hspace{0.05cm}$  de  variables  **categoricas binarias**

Dadas las matrices $\hspace{0.1cm} a=(a(x_i, x_r))_{i,r=1:n}\hspace{0.1cm}$ ,  $\hspace{0.1cm}b=(b(x_i, x_r))_{i,r=1:n}\hspace{0.1cm}$,  $\hspace{0.1cm}c=(c(x_i, x_r))_{i,r=1:n}\hspace{0.15cm}$ y  $\hspace{0.15cm}d=(d(x_i, x_r))_{i,r=1:n} \\$ 


<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>

Estas matrices pueden expresarse del siguiente modo: $\\[0.4cm]$


- $a \hspace{0.05cm}=\hspace{0.05cm} X\cdot X^t \\$

- $b\hspace{0.05cm}=\hspace{0.05cm}(\overrightarrow{1}_{nxp} - X)\cdot X\hspace{0.03cm}^t\\$

- $c\hspace{0.05cm}=\hspace{0.05cm}b\hspace{0.03cm}^t \\$

- $d\hspace{0.05cm}=\hspace{0.05cm}(\overrightarrow{1}_{nxp} - X)\cdot(\overrightarrow{1}_{nxp} - X)\hspace{0.03cm}^t \\$

</p>
 
</p></span>
</div>


  


<br>




## Cálculo de las matrices a, b , c y d en `Python`   <a class="anchor" id="53"></a>


```python
def a_b_c_d_Matrix(Data):

    X = Data

    a = X @ X.T

    n = X.shape[0]

    p = X.shape[1]

    ones_matrix = np.ones((n, p)) 

    b = (ones_matrix - X) @ X.T

    c = b.T

    d = (ones_matrix - X) @ (ones_matrix - X).T

    return a , b , c , d , p
```

```python
a, b, c, d, p = a_b_c_d_Matrix(Data_binary_numpy)
```

```python
a
```
```
array([[1., 1., 1., ..., 1., 1., 1.],
       [1., 1., 1., ..., 1., 1., 1.],
       [1., 1., 2., ..., 1., 1., 1.],
       ...,
       [1., 1., 1., ..., 1., 1., 1.],
       [1., 1., 1., ..., 1., 2., 1.],
       [1., 1., 1., ..., 1., 1., 1.]])
```

```python
Data_binary_numpy[[30,1903], :]
```

```
array([[0., 1., 0., 1.],
       [1., 0., 0., 1.]])
```


```python
a[30 , 1903]
```

    1.0

```python
Data_binary_numpy[[40,1903], :]
```

```
array([[0., 0., 0., 1.],
       [1., 0., 0., 1.]])
```


```python
a[40 , 1903]
```

    1.0

```python
b
```

```
array([[0., 0., 1., ..., 0., 1., 0.],
       [0., 0., 1., ..., 0., 1., 0.],
       [0., 0., 0., ..., 0., 1., 0.],
       ...,
       [0., 0., 1., ..., 0., 1., 0.],
       [0., 0., 1., ..., 0., 0., 0.],
       [0., 0., 1., ..., 0., 1., 0.]])
```

```python
Data_binary_numpy[[30,1903], :]
```
```
array([[0., 1., 0., 1.],
       [1., 0., 0., 1.]])
```

```python
b[30 , 1903]
```

    1.0


```python
Data_binary_numpy[[40,1903], :]
```

```
array([[0., 0., 0., 1.],
       [1., 0., 0., 1.]])
```

```python
b[40,1903]
```

    1.0
    
    
```python
c
```

```
array([[0., 0., 0., ..., 0., 0., 0.],
       [0., 0., 0., ..., 0., 0., 0.],
       [1., 1., 0., ..., 1., 1., 1.],
       ...,
       [0., 0., 0., ..., 0., 0., 0.],
       [1., 1., 1., ..., 1., 0., 1.],
       [0., 0., 0., ..., 0., 0., 0.]])
```

```python
Data_binary_numpy[[30,1903], :]
```
```
array([[0., 1., 0., 1.],
       [1., 0., 0., 1.]])
```

```python
c[30, 1903]
```

    1.0
    
    
```python
Data_binary_numpy[[40,1903], :] 
```
```
array([[0., 0., 0., 1.],
       [1., 0., 0., 1.]])
```
    
```python
c[40, 1903]
```

    0.0
    
    
```python
d
```    
    
```
array([[3., 3., 2., ..., 3., 2., 3.],
       [3., 3., 2., ..., 3., 2., 3.],
       [2., 2., 2., ..., 2., 1., 2.],
       ...,
       [3., 3., 2., ..., 3., 2., 3.],
       [2., 2., 1., ..., 2., 2., 2.],
       [3., 3., 2., ..., 3., 2., 3.]])
```

```python
Data_binary_numpy[[30,1903], :]
```
```
array([[0., 1., 0., 1.],
       [1., 0., 0., 1.]])
```



```python
Data_binary_numpy[[40,1903], :]
```
```
array([[0., 0., 0., 1.],
       [1., 0., 0., 1.]])
```

```python
d[40,1903]
```

    2.0


 

<br>


## Similaridad de Sokal <a class="anchor" id="55"></a>


<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>


$\hspace{0.25cm}$ El coeficiente de similaridad de Sokal (o simplemente la similaridad de Sokal) entre el par de observaciones $\hspace{0.1cm}(x_i , x_r)\hspace{0.1cm}$ de las variables binarias $\hspace{0.1cm}\mathcal{X}_1,..., \mathcal{X}_p\hspace{0.1cm}$ se define como: $\\[0.4cm]$



\begin{gather*}
\phi (x_i,x_r)_{Sokal}  =\dfrac{a(x_i,x_r) + d(x_i,x_r) }{ a(x_i,x_r) + b(x_i,x_r) + c(x_i,x_r) + d(x_i,x_r) } = \dfrac{a(x_i,x_r) + d(x_i,x_r) }{p} 
\end{gather*}

</p>
 
</p></span>
</div>





<br>


## Distancia de Sokal   <a class="anchor" id="56"></a>


<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>


$\hspace{0.25cm}$ Podemos obtener la distancia de Sokal entre el par de observaciones $\hspace{0.1cm}(x_i , x_r)\hspace{0.1cm}$ de las variables binarias $\hspace{0.1cm}\mathcal{X}_1,..., \mathcal{X}_p\hspace{0.1cm}$ como sigue:  $\\[0.4cm]$



\begin{gather*}
\delta(x_i,x_r)_{Sokal} \hspace{0.05cm}=\hspace{0.05cm} \sqrt{\phi(x_i,x_i)_{Sokal} + \phi(x_r,x_r)_{Sokal} - 2\cdot \phi(x_i,x_r)_{Sokal} }
\end{gather*}

</p>
 
</p></span>
</div>




<br>


##  Similaridad de Sokal en `Python` <a class="anchor" id="57"></a>


```python
def Sokal_Similarity_1(i , r, Data):

    a, b, c, d, p = a_b_c_d_Matrix(Data)

    if a[i,r] + d[i,r] == 0 :

        Sokal_Similarity = 0

        
    else :

        Sokal_Similarity = (a[i,r] + d[i,r]) / p
        

    return Sokal_Similarity
```


```python
Sokal_Similarity_1(i=2 , r=5, Data=Data_binary_numpy)
```

    0.5

```python
def Sokal_Similarity_2(i , r, a , d, p):


    if a[i,r] + d[i,r] == 0 :

        Sokal_Similarity = 0

        
    else :

        Sokal_Similarity = (a[i,r] + d[i,r]) / p
        

    return Sokal_Similarity
```

```python
a, b, c, d, p = a_b_c_d_Matrix(Data_binary_numpy)

Sokal_Similarity_2(i=2, r=5, a=a, d=d, p=p)
```

    0.5

```python
def Matrix_Dist_Sokal_1(Data):

    # Paso previo necesario si Data es pd.DataFrame  -->  Data = Data.to_numpy()

    n = len(Data)

    M =  np.empty((n , n))

   
    for i in range(0, n):

         for r in range(0, n):

            if i > r :
               
                 M[i,r] = 0
            
            elif i == r :
               
                 M[i,r] = 1

            else :

                 M[i,r] = Sokal_Similarity_1(i, r, Data)
                      
    return M 
```


```python
Matrix_Sim_Sokal_1(Data=Data_binary_numpy[0:300 , 0:300]) # 1.29 mins
```
```
array([[1.  , 1.  , 0.75, ..., 0.75, 0.75, 1.  ],
       [0.  , 1.  , 0.75, ..., 0.75, 0.75, 1.  ],
       [0.  , 0.  , 1.  , ..., 0.5 , 0.5 , 0.75],
       ...,
       [0.  , 0.  , 0.  , ..., 1.  , 1.  , 0.75],
       [0.  , 0.  , 0.  , ..., 0.  , 1.  , 0.75],
       [0.  , 0.  , 0.  , ..., 0.  , 0.  , 1.  ]])
```

```python
def Matrix_Dist_Sokal_2(Data):

    # Paso previo necesario si Data es pd.DataFrame  -->  Data = Data.to_numpy()

    n = len(Data)

    M =  np.empty((n , n))

    a, b, c, d, p = a_b_c_d_Matrix(Data)

   
    for i in range(0, n):

         for r in range(0, n):

            if i > r :
               
                 M[i,r] = 0
            
            elif i == r :
               
                 M[i,r] = 1

            else :

                 M[i,r] = Sokal_Similarity_2(i=2, r=5, a=a, d=d, p=p)
                      
    return M 
```


```python
Matrix_Dist_Sokal_2(Data=Data_binary_numpy[0:500 , 0:500]) # 0.2 seg
```
```
array([[1.  , 1.  , 0.75, ..., 1.  , 1.  , 0.75],
       [0.  , 1.  , 0.75, ..., 1.  , 1.  , 0.75],
       [0.  , 0.  , 1.  , ..., 0.75, 0.75, 0.5 ],
       ...,
       [0.  , 0.  , 0.  , ..., 1.  , 1.  , 0.75],
       [0.  , 0.  , 0.  , ..., 0.  , 1.  , 0.75],
       [0.  , 0.  , 0.  , ..., 0.  , 0.  , 1.  ]])
```

```python
M_Sim_Sokal = Matrix_Dist_Sokal_2(Data=Data_binary_numpy) # 3.4 seg

M_Sim_Sokal
```
```
array([[1.  , 1.  , 0.75, ..., 1.  , 0.75, 1.  ],
       [0.  , 1.  , 0.75, ..., 1.  , 0.75, 1.  ],
       [0.  , 0.  , 1.  , ..., 0.75, 0.5 , 0.75],
       ...,
       [0.  , 0.  , 0.  , ..., 1.  , 0.75, 1.  ],
       [0.  , 0.  , 0.  , ..., 0.  , 1.  , 0.75],
       [0.  , 0.  , 0.  , ..., 0.  , 0.  , 1.  ]])
```

```python
M_Sim_Sokal = M_Sim_Sokal + M_Sim_Sokal.T - np.diag(np.repeat(1 , len(M_Sim_Sokal)), k=0)

M_Sim_Sokal
```
```
array([[1.  , 1.  , 0.75, ..., 1.  , 0.75, 1.  ],
       [1.  , 1.  , 0.75, ..., 1.  , 0.75, 1.  ],
       [0.75, 0.75, 1.  , ..., 0.75, 0.5 , 0.75],
       ...,
       [1.  , 1.  , 0.75, ..., 1.  , 0.75, 1.  ],
       [0.75, 0.75, 0.5 , ..., 0.75, 1.  , 0.75],
       [1.  , 1.  , 0.75, ..., 1.  , 0.75, 1.  ]])
```
 




##  Distancia de Sokal en `Python` <a class="anchor" id="57"></a>


```python
def Dist_Sokal(i, r, a, d, p):

    dist_Sokal = np.sqrt( Sokal_Similarity_2(i , i, a , d, p) + Sokal_Similarity_2(r , r, a , d, p) - 2*Sokal_Similarity_2(i , r, a , d, p) )

    return dist_Sokal
```


```python
a, b, c, d, p = a_b_c_d_Matrix(Data_binary_numpy)

Dist_Sokal(i=2, r=5, a=a, d=d, p=p)
```


```python
def Matrix_Dist_Sokal(Data):

    # Paso previo necesario si Data es pd.DataFrame  -->  Data = Data.to_numpy()

    n = len(Data)

    M =  np.empty((n , n))

    a, b, c, d, p = a_b_c_d_Matrix(Data)

   
    for i in range(0, n):

         for r in range(0, n):

             if i >= r :
               
                 M[i,r] = 0

             else :

                 M[i,r] = Dist_Sokal(i=i, r=r, a=a, d=d, p=p)
                      
    return M 
```

```python
M_Dist_Sokal = Matrix_Dist_Sokal(Data=Data_binary_numpy)

M_Dist_Sokal
```
```
array([[0.        , 0.        , 0.70710678, ..., 0.        , 0.70710678,
        0.        ],
       [0.        , 0.        , 0.70710678, ..., 0.        , 0.70710678,
        0.        ],
       [0.        , 0.        , 0.        , ..., 0.70710678, 1.        ,
        0.70710678],
       ...,
       [0.        , 0.        , 0.        , ..., 0.        , 0.70710678,
        0.        ],
       [0.        , 0.        , 0.        , ..., 0.        , 0.        ,
        0.70710678],
       [0.        , 0.        , 0.        , ..., 0.        , 0.        ,
        0.        ]])
```



```python
M_Dist_Sokal = M_Dist_Sokal + M_Dist_Sokal.T

M_Dist_Sokal
```
```
array([[0.        , 0.        , 0.70710678, ..., 0.        , 0.70710678,
        0.        ],
       [0.        , 0.        , 0.70710678, ..., 0.        , 0.70710678,
        0.        ],
       [0.70710678, 0.70710678, 0.        , ..., 0.70710678, 1.        ,
        0.70710678],
       ...,
       [0.        , 0.        , 0.70710678, ..., 0.        , 0.70710678,
        0.        ],
       [0.70710678, 0.70710678, 1.        , ..., 0.70710678, 0.        ,
        0.70710678],
       [0.        , 0.        , 0.70710678, ..., 0.        , 0.70710678,
        0.        ]])
```

 

<br>


## Similaridad de Jaccard  <a class="anchor" id="65"></a>


<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>

$\hspace{0.25cm}$ El coeficiente de similaridad de Jaccard (o simplemente la similaridad de Sokal) entre el par de observaciones $\hspace{0.1cm}(x_i , x_r)\hspace{0.1cm}$ de las variables binarias $\hspace{0.1cm}\mathcal{X}_1,..., \mathcal{X}_p\hspace{0.1cm}$ se define como: $\\[0.4cm]$


\begin{gather*}
\phi(i,r)_{Jaccard}  = \dfrac{a_{ir} }{a_{ir} + b_{ir}+ c_{ir}} 
\end{gather*}


</p>
 
</p></span>
</div>


<br>


## Distancia de Jaccard    <a class="anchor" id="66"></a>

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>


$\hspace{0.25cm}$ Podemos obtener la distancia de Jaccard entre el par de observaciones $\hspace{0.1cm}(x_i , x_r)\hspace{0.1cm}$ de las variables binarias $\hspace{0.1cm}\mathcal{X}_1,..., \mathcal{X}_p\hspace{0.1cm}$ como sigue:  $\\[0.4cm]$

\begin{gather*}
\delta(i,r)_{Jaccard} = \sqrt{\phi(i,i)_{Jaccard} + \phi(r,r)_{Jaccard} - 2\cdot \phi(i,r)_{Jaccard} }
\end{gather*}


</p>
 
</p></span>
</div>

<br>



## Similaridad de Jaccard en `Python` <a class="anchor" id="67"></a>



```python
def Jaccard_Similarity_1(i, r, Data):

    a, b, c, d, p = a_b_c_d_Matrix(Data)

    if a[i,r] == 0 :

        Jaccard_Similarity = 0

    else :

        Jaccard_Similarity = a[i,r] / (a[i,r] + b[i,r] + c[i,r])


    return Jaccard_Similarity
```


```python
Jaccard_Similarity_1(i=2, r=5, Data=Data_binary_numpy)
```

    0

```python
def Jaccard_Similarity_2(i , r, a , b, c):


    if a[i,r] == 0 :

        Jaccard_Similarity = 0

        
    else :

        Jaccard_Similarity = a[i,r] / (a[i,r] + b[i,r] + c[i,r])
        

    return Jaccard_Similarity
```




```python
a, b, c, d, p = a_b_c_d_Matrix(Data=Data_binary_numpy)

Jaccard_Similarity_2(i=2, r=5, a=a , b=b, c=c)
```

    0

```python
def Matrix_Sim_Jaccard_1(Data):

    # Paso previo necesario si Data es pd.DataFrame  -->  Data = Data.to_numpy()

    n = len(Data)

    M =  np.empty((n , n))

   
    for i in range(0, n):

         for r in range(0, n):

            if i > r :
               
                 M[i,r] = 0
            
            elif i == r :
               
                 M[i,r] = 1
            
            else :

                 M[i,r] = Jaccard_Similarity_1(i, r, Data)
                      
    return M 
```

```python
Matrix_Sim_Jaccard_1(Data=Data_binary_numpy[0:300,0:300])  # 1.52 min
```

```
array([[1. , 1. , 0.5, ..., 0. , 0. , 1. ],
       [0. , 1. , 0.5, ..., 0. , 0. , 1. ],
       [0. , 0. , 1. , ..., 0. , 0. , 0.5],
       ...,
       [0. , 0. , 0. , ..., 1. , 0. , 0. ],
       [0. , 0. , 0. , ..., 0. , 1. , 0. ],
       [0. , 0. , 0. , ..., 0. , 0. , 1. ]])
```


```python
def Matrix_Sim_Jaccard_2(Data):

    # Paso previo necesario si Data es pd.DataFrame  -->  Data = Data.to_numpy()

    n = len(Data)

    M =  np.empty((n , n))

    a, b, c, d, p = a_b_c_d_Matrix(Data=Data_binary_numpy)

   
    for i in range(0, n):

         for r in range(0, n):

            if i > r :
               
                 M[i,r] = 0
            
            elif i == r :
               
                 M[i,r] = 1
            
            else :

                 M[i,r] = Jaccard_Similarity_2(i , r , a , b , c)
                      
    return M 
```


```python
Matrix_Sim_Jaccard_2(Data=Data_binary_numpy[0:300,0:300]) # 0.1 seg
```
```
array([[1. , 1. , 0.5, ..., 0. , 0. , 1. ],
       [0. , 1. , 0.5, ..., 0. , 0. , 1. ],
       [0. , 0. , 1. , ..., 0. , 0. , 0.5],
       ...,
       [0. , 0. , 0. , ..., 1. , 0. , 0. ],
       [0. , 0. , 0. , ..., 0. , 1. , 0. ],
       [0. , 0. , 0. , ..., 0. , 0. , 1. ]])
```

```python
M_Jaccard = Matrix_Sim_Jaccard_2(Data=Data_binary_numpy)

M_Jaccard 
```
```
array([[1.        , 1.        , 0.5       , ..., 1.        , 0.5       ,
        1.        ],
       [0.        , 1.        , 0.5       , ..., 1.        , 0.5       ,
        1.        ],
       [0.        , 0.        , 1.        , ..., 0.5       , 0.33333333,
        0.5       ],
       ...,
       [0.        , 0.        , 0.        , ..., 1.        , 0.5       ,
        1.        ],
       [0.        , 0.        , 0.        , ..., 0.        , 1.        ,
        0.5       ],
       [0.        , 0.        , 0.        , ..., 0.        , 0.        ,
        1.        ]])
```




```python
M_Jaccard = M_Jaccard + M_Jaccard.T - np.diag(np.repeat(1 , len(M_Jaccard)), k=0)

M_Jaccard 
```

```
array([[1.        , 1.        , 0.5       , ..., 1.        , 0.5       ,
        1.        ],
       [1.        , 1.        , 0.5       , ..., 1.        , 0.5       ,
        1.        ],
       [0.5       , 0.5       , 1.        , ..., 0.5       , 0.33333333,
        0.5       ],
       ...,
       [1.        , 1.        , 0.5       , ..., 1.        , 0.5       ,
        1.        ],
       [0.5       , 0.5       , 0.33333333, ..., 0.5       , 1.        ,
        0.5       ],
       [1.        , 1.        , 0.5       , ..., 1.        , 0.5       ,
        1.        ]])
```


```python
def Dist_Jaccard(i , r, a , b, c):

    Dist_Jaccard = np.sqrt( Jaccard_Similarity_2(i , i, a , b, c) + Jaccard_Similarity_2(r , r, a , b, c) - 2*Jaccard_Similarity_2(i , r, a , b, c) )

    return Dist_Jaccard  
```


```python
a, b, c, d, p = a_b_c_d_Matrix(Data_binary_numpy)

Dist_Jaccard(i=2 , r=5, a=a , b=b, c=c)
```

    0.0

```python
def Matrix_Dist_Jaccard(Data):

    # Paso previo necesario si Data es pd.DataFrame  -->  Data = Data.to_numpy()

    n = len(Data)

    M =  np.empty((n , n))

    a, b, c, d, p = a_b_c_d_Matrix(Data)

   
    for i in range(0, n):

         for r in range(0, n):

             if i >= r :
               
                 M[i,r] = 0

             else :

                 M[i,r] = Dist_Jaccard(i=i, r=r, a=a, b=b, c=c)
                      
    return M 
```

```python
M_Dist_Jaccard = Matrix_Dist_Jaccard(Data=Data_binary_numpy)

M_Dist_Jaccard
```
```
array([[0.        , 0.        , 1.        , ..., 0.        , 1.        ,
        0.        ],
       [0.        , 0.        , 1.        , ..., 0.        , 1.        ,
        0.        ],
       [0.        , 0.        , 0.        , ..., 1.        , 1.15470054,
        1.        ],
       ...,
       [0.        , 0.        , 0.        , ..., 0.        , 1.        ,
        0.        ],
       [0.        , 0.        , 0.        , ..., 0.        , 0.        ,
        1.        ],
       [0.        , 0.        , 0.        , ..., 0.        , 0.        ,
        0.        ]])
```


```python
M_Dist_Jaccard = M_Dist_Jaccard + M_Dist_Jaccard.T 

M_Dist_Jaccard
```

```
array([[0.        , 0.        , 1.        , ..., 0.        , 1.        ,
        0.        ],
       [0.        , 0.        , 1.        , ..., 0.        , 1.        ,
        0.        ],
       [1.        , 1.        , 0.        , ..., 1.        , 1.15470054,
        1.        ],
       ...,
       [0.        , 0.        , 1.        , ..., 0.        , 1.        ,
        0.        ],
       [1.        , 1.        , 1.15470054, ..., 1.        , 0.        ,
        1.        ],
       [0.        , 0.        , 1.        , ..., 0.        , 1.        ,
        0.        ]])
```




<br>

<br>



# Similaridades con variables categoricas multiclase   <a class="anchor" id="76"></a>

El escenario de trabajo es el siguiente:

Tenemos una muestra de $n$  elementos/individuos $\hspace{0.1cm}\Omega = \lbrace e_1,e_2,...,e_n \rbrace$ 

Tenemos una serie de variables estadisticas **categóricas multiclase** con no necesariamente igual número de categorias $\hspace{0.1cm}\mathcal{X}_1,...,\mathcal{X}_p$

Para cada variable categórica multiclase $\hspace{0.1cm}\mathcal{X}_j\hspace{0.1cm}$ tenemos una muestra de $n$ observaciones $\hspace{0.1cm}X_j\hspace{0.1cm}$  basada en la muestra de $n$ individuos $\hspace{0.1cm}\Omega$

 
Es decir, tenemos lo siguiente:

- $\hspace{0.1cm}X_j=(x_{j1},...,x_{jn})^t$ , para $j=1,...,p \\$

- $\hspace{0.1cm}x_{ji}\hspace{0.1cm}$ es la observación de la variable $\hspace{0.1cm}\mathcal{X}_j\hspace{0.1cm}$ para el individuo $\hspace{0.1cm}e_i\hspace{0.1cm}$ de la muestra $\hspace{0.1cm}\Omega$ , para $\hspace{0.1cm}j=1,...,p\hspace{0.1cm}$ y $\hspace{0.1cm}i=1,...,n \\$



Por tanto:

- $\hspace{0.1cm}X_j=(x_{j1},...,x_{jn})^t\hspace{0.1cm}$ es el vector con las observaciones de la variable para los individuos de la muestra $\hspace{0.1cm}\Omega$  , para $\hspace{0.1cm}j=1,...,p \\$

- $\hspace{0.1cm}x_i = (x_{1i} , x_{2i} ,..., x_{pi})^t\hspace{0.1cm}$ es el vector con las observaciones de las variables  $\hspace{0.1cm}\mathcal{X}_1,...,\mathcal{X}_p\hspace{0.1cm}$ para el individuo $\hspace{0.1cm}e_i\hspace{0.1cm}$ de $\hspace{0.1cm}\Omega$ , para $\hspace{0.1cm}i=1,...,n$




<br>

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>


$\hspace{0.25cm}$ Los parametros que habitualmente se usan para construir las similaridades con variables multiclase son:


$\hspace{0.35cm}$ $\alpha_{ir} \hspace{0.05cm} =\hspace{0.05cm}$ número de variables multiclase $\hspace{0.1cm}\mathcal {X}_j\hspace{0.1cm}$ tales que  $\hspace{0.1cm}x_{ij} \hspace{0.05cm}=\hspace{0.05cm} x_{rj}\\$

$$\alpha_{ir} \hspace{0.07cm}=\hspace{0.07cm} \# \lbrace\hspace{0.1cm} j\in \lbrace 1,...,p\rbrace \hspace{0.15cm}/\hspace{0.15cm} x_{ij} = x_{rj}  \hspace{0.1cm}\rbrace\\$$

$\hspace{0.35cm}$ $p-\alpha_{ir} \hspace{0.05cm}=\hspace{0.05cm}$  número de variables multiclase $\hspace{0.1cm}\mathcal {X}_j\hspace{0.1cm}$ tales que  $\hspace{0.1cm}x_{ij} \neq x_{rj} \\$ 

$$p - \alpha_{ir} \hspace{0.07cm}=\hspace{0.07cm} \# \lbrace\hspace{0.1cm} j\in \lbrace 1,...,p\rbrace \hspace{0.15cm}/\hspace{0.15cm} x_{ij} \neq x_{rj}  \hspace{0.1cm}\rbrace\\$$




$\hspace{0.25cm}$ **Observación:**

$$\alpha_{ij}\hspace{0.05cm}=\hspace{0.05cm}a_{ij}+b_{ij}$$


</p>
 
</p></span>
</div>



<br>

## Similaridad por coincidencias  <a class="anchor" id="77"></a>

La medida de similaridad mas común con variables categoricas multiclase es la similaridad por coincidencias

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>

$\hspace{0.25cm}$La similaridad por coincidencias entre el par de observaciones $\hspace{0.1cm}(x_i , x_r)\hspace{0.1cm}$ de las variables categoricas multiclase $\hspace{0.1cm}\mathcal{X}_1,..., \mathcal{X}_p\hspace{0.1cm}$ se define como: $\\[0.4cm]$


 
\begin{gather*}
\phi(x_i,x_r)_{Coin}\hspace{0.05cm}=\hspace{0.05cm} \dfrac{\alpha_{ir}}{p}
\end{gather*}

</p>
 
</p></span>
</div>


**Observación:**

Cuando las variables son binarias, el la similaridad por coincidencias es igual a la similaridad de Sokal, ya que $\hspace{0.1cm} \alpha_{ij}=a_{ij}+b_{ij}$



<br>

## Distancia por coincidencias   <a class="anchor" id="78"></a>


<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>

La distancia por coincidencias entre el par de observaciones $\hspace{0.1cm}(x_i , x_r)\hspace{0.1cm}$ de las variables categoricas multiclase $\hspace{0.1cm}\mathcal{X}_1,..., \mathcal{X}_p\hspace{0.1cm}$ se obtiene como: $\\[0.4cm]$

\begin{gather*}
\delta(x_i,x_r)_{Coin} = \sqrt{\phi(x_i,x_i)_{Coin} + \phi(x_r,x_r)_{Coin} - 2\cdot \phi(x_i,x_r)_{Coin} }
\end{gather*}

</p>
 
</p></span>
</div>



<br>



## Similaridad por coincidencias en `Python`   <a class="anchor" id="79"></a>



```python
def alpha(x_i, x_r, Data):

    # Es necesario que Data sea un numpy array

    X = Data

    alpha = np.repeat(0, X.shape[1])

    ifelse  =  lambda k :  1  if x_i[k] == x_r[k]   else  0   # Es más eficiente que un bucle condicional.

    for k in range(0, X.shape[1]-1) :

        alpha[k] = ifelse(k)

    alpha = alpha.sum()

    return(alpha)   
```

```python
Data_multiclass_numpy[2,:] 
```

    array([2., 4., 1.])

```python
Data_multiclass_numpy[5,:] 
```
     
    array([2., 1., 2.])


```python
alpha(x_i=Data_multiclass_numpy[2,:] , x_r=Data_multiclass_numpy[5,:], Data=Data_multiclass_numpy)
```

    1


```python
Data_multiclass_numpy[15,:] 
```

    array([2., 4., 0.])



```python
Data_multiclass_numpy[14,:]
```

    array([2., 4., 2.])



```python
alpha(x_i=Data_multiclass_numpy[14,:] , x_r=Data_multiclass_numpy[15,:], Data=Data_multiclass_numpy)
```

    2


```python
def matches_similarity(x_i, x_r, Data):

    # Es necesario que Data sea un numpy array

    X = Data

    p = X.shape[1]

    matches_similarity = alpha(x_i, x_r, X) / p

    return(matches_similarity)
```

```python
matches_similarity(x_i=Data_multiclass_numpy[2,:] , x_r=Data_multiclass_numpy[5,:], Data=Data_multiclass_numpy)
```

    0.3333333333333333


```python
matches_similarity(x_i=Data_multiclass_numpy[14,:] , x_r=Data_multiclass_numpy[15,:], Data=Data_multiclass_numpy)
```

    0.6666666666666666


```python
def Matrix_Sim_Matches(Data):

    # Paso previo necesario si Data es pd.DataFrame  -->  Data = Data.to_numpy()

    n = len(Data)

    M =  np.empty((n , n))

   
    for i in range(0, n):

         for r in range(0, n):

            if i > r :
               
                 M[i,r] = 0
            
            elif i == r :
               
                 M[i,r] = 1
            
            else :

                 M[i,r] = matches_similarity(x_i=Data[i,:], x_r=Data[r,:], Data=Data)
                      
    return M 
```



```python
M_matches = Matrix_Sim_Matches(Data=Data_multiclass_numpy)

M_matches 
```
```
array([[1.        , 0.33333333, 0.33333333, ..., 0.33333333, 0.33333333,
        0.        ],
       [0.        , 1.        , 0.66666667, ..., 0.33333333, 0.33333333,
        0.33333333],
       [0.        , 0.        , 1.        , ..., 0.33333333, 0.33333333,
        0.33333333],
       ...,
       [0.        , 0.        , 0.        , ..., 1.        , 0.33333333,
        0.        ],
       [0.        , 0.        , 0.        , ..., 0.        , 1.        ,
        0.        ],
       [0.        , 0.        , 0.        , ..., 0.        , 0.        ,
        1.        ]])
```



```python
M_matches = M_matches + M_matches.T - np.diag(np.repeat(1 , len(M_matches)), k=0)

M_matches
```
```
array([[1.        , 0.33333333, 0.33333333, ..., 0.33333333, 0.33333333,
        0.        ],
       [0.33333333, 1.        , 0.66666667, ..., 0.33333333, 0.33333333,
        0.33333333],
       [0.33333333, 0.66666667, 1.        , ..., 0.33333333, 0.33333333,
        0.33333333],
       ...,
       [0.33333333, 0.33333333, 0.33333333, ..., 1.        , 0.33333333,
        0.        ],
       [0.33333333, 0.33333333, 0.33333333, ..., 0.33333333, 1.        ,
        0.        ],
       [0.        , 0.33333333, 0.33333333, ..., 0.        , 0.        ,
        1.        ]])
```


```python
def Dist_Matches(x_i, x_r, Data):

    Dist_Matches = np.sqrt(matches_similarity(x_i, x_i, Data) +  matches_similarity(x_r, x_r, Data) - 2*matches_similarity(x_i, x_r, Data) )

    return( Dist_Matches )
```


```python
matches_similarity(x_i=Data_multiclass_numpy[2,:] , x_r=Data_multiclass_numpy[5,:], Data=Data_multiclass_numpy)
```

    0.3333333333333333
    
    
```python
def Matrix_Dist_Matches(Data):

    # Paso previo necesario si Data es pd.DataFrame  -->  Data = Data.to_numpy()

    n = len(Data)

    M =  np.empty((n , n))
   
    for i in range(0, n):

         for r in range(0, n):

             if i >= r :
               
                M[i,r] = 0

             else :

                M[i,r] = Dist_Matches(x_i=Data[i,:], x_r=Data[r,:], Data=Data)
                      
    return M 
```

```python
M_Dist_Matches = Matrix_Dist_Matches(Data=Data_multiclass_numpy)

M_Dist_Matches
```
```
array([[0.        , 0.81649658, 0.81649658, ..., 0.81649658, 0.81649658,
        1.15470054],
       [0.        , 0.        , 0.        , ..., 0.81649658, 0.81649658,
        0.81649658],
       [0.        , 0.        , 0.        , ..., 0.81649658, 0.81649658,
        0.81649658],
       ...,
       [0.        , 0.        , 0.        , ..., 0.        , 0.81649658,
        1.15470054],
       [0.        , 0.        , 0.        , ..., 0.        , 0.        ,
        1.15470054],
       [0.        , 0.        , 0.        , ..., 0.        , 0.        ,
        0.        ]])
```



```python
M_Dist_Matches = M_Dist_Matches + M_Dist_Matches.T

M_Dist_Matches
```
```
array([[0.        , 0.81649658, 0.81649658, ..., 0.81649658, 0.81649658,
        1.15470054],
       [0.81649658, 0.        , 0.        , ..., 0.81649658, 0.81649658,
        0.81649658],
       [0.81649658, 0.        , 0.        , ..., 0.81649658, 0.81649658,
        0.81649658],
       ...,
       [0.81649658, 0.81649658, 0.81649658, ..., 0.        , 0.81649658,
        1.15470054],
       [0.81649658, 0.81649658, 0.81649658, ..., 0.81649658, 0.        ,
        1.15470054],
       [1.15470054, 0.81649658, 0.81649658, ..., 1.15470054, 1.15470054,
        0.        ]])
```




<br>

<br>




# Conjuntos de variables estadisticas de tipo mixto  <a class="anchor" id="76"></a>


Un conjunto de variables estadisticas $\hspace{0.1cm} (\mathcal{X}_1,...,\mathcal{X}_p)\hspace{0.1cm}$ es de tipo mixto si hay al menos un par de variables de tipo (cuantitativo, binario, multiclase) distinto. 


Distnguimos cuatro cuatro tipos de conjuntos de variables mixtos:

- Conunto de variables de tipo cuantitativo-binario-multiclase: en el conjunto hay alguna variable cuantitativa, alguna binaria y tambien alguna multiclase. $\\[0.5cm]$

- Conjunto de variables de tipo cuantitativo-binario: en el conjunto hay alguna variable cuantitativa, y también alguna binaria, pero no hay multiclase. $\\[0.5cm]$

- Conjunto de variables de tipo cuantitativo-multiclase:  en el conjunto hay alguna variable cuantitativa, y también alguna multiclase, pero no hay binarias. $\\[0.5cm]$

- Conjunto de variables de tipo binario-multiclase:  en el conjunto hay alguna variable binaria, y también alguna multiclase, pero no hay cuantitativas.


<br>





# Distancias con conjuntos de variables de tipo cuantitativo-binario-multiclase 



Tenemos un conjunto de variables estadisticas $\hspace{0.1cm}(\mathcal{X}_1,...,\mathcal{X}_p)\hspace{0.1cm}$ tales que:


- $X_1,...,X_{p_1} \hspace{0.1cm}$ son **cuantitativas**. $\\[0.5cm]$

- $X_{p_1 + 1},...,X_{p_1 + p_2} \hspace{0.1cm}$ son **binarias**.$\\[0.5cm]$

- $X_{p_1 + p_2 + 1},...,X_{p_1 + p_2 + p_3} \hspace{0.1cm}$ son **multiclase** (no binarias).$\\[0.5cm]$

Donde: $\hspace{0.2cm} p=p_1 + p_2 + p_3 \\$



**Observación:**

$\hspace{0.1cm}(\mathcal{X}_1,...,\mathcal{X}_p)\hspace{0.1cm}$ forman un conjunto de variables de tipo cuantitativo-binario-multiclase




<br>

## Similaridad de Gower  <a class="anchor" id="86"></a>


La similaridad de Gower entre el par de observaciones $\hspace{0.1cm} (x_i , X_r)\hspace{0.1cm}$ de las variables $\hspace{0.1cm}(\mathcal{X}_1,...,\mathcal{X}_p)\hspace{0.1cm}$ (que forman un conjunto de variables de tipo cuantitativo-binario-multiclase )  se define como : $\\[0.7cm]$



\begin{gather*}
\phi(i,r)_{Gower}=\dfrac{\sum_{j=1}^{p_1} \left(1- \dfrac{\mid x_{ij} - x_{rj} \mid}{G_j} \right) + a_{ir} + \alpha_{ir} }{p_1 + (p_2 - d_{ir}) + p_3} \\
\end{gather*}



Donde:

- $p_1 \hspace{0.05cm}$ es el número de variables cuantitativas. $\\[0.5cm]$

- $p_2 \hspace{0.05cm}$ es el número de variables categoricas binarias.
$\\[0.5cm]$

- $p_3 \hspace{0.05cm}$ es el número de variables categoricas múltiples (no binarias).$\\[0.5cm]$

- $p_1+p_2+p_3=p \\$

- $G_j \hspace{0.1cm}=\hspace{0.1cm} Max(X_j) - Min(X_j) \\$ es el rango de $X_j$


 - $\hspace{0.2cm} a_{ir}\hspace{0.1cm}$ es el número de variables binarias $\hspace{0.1cm}\mathcal{X}_j\hspace{0.1cm}$ tales que $\hspace{0.1cm} x_{ij} = x_{rj}=1 \\$ 


 - $\hspace{0.2cm} d_{ij}\hspace{0.1cm}$ es el número  de variables binarias $\hspace{0.1cm}\mathcal{X}_j\hspace{0.1cm}$ tales que $\hspace{0.1cm}x_{ij} =0 \hspace{0.15cm}$ y $\hspace{0.15cm}x_{rj}=0 \\$
 

- $\alpha_{ir} =$ número de variables multiclase $\hspace{0.1cm}\mathcal {X}_j\hspace{0.1cm}$ tales que  $\hspace{0.1cm}x_{ij} = x_{rj}\\$

 
<br>



## Distancia de Gower    <a class="anchor" id="87"></a>


La distancia de Gower entre el par de observaciones $\hspace{0.1cm}(x_i , X_r)\hspace{0.1cm}$ de las variables $\hspace{0.1cm}(\mathcal{X}_1,...,\mathcal{X}_p)\hspace{0.1cm}$ (que forman un conjunto de variables de tipo cuantitativo-binario-multiclase )  entre el par de observaciones (x_i , X_r) de las variables $\hspace{0.1cm}(\mathcal{X}_1,...,\mathcal{X}_p)\hspace{0.1cm}$ (que forman un conjunto de variables de tipo cuantitativo-binario-multiclase )   es obtenida como:


$$
\delta(i,j)_{Gower} = \sqrt{1 - \phi(i,j)_{Gower}}
$$



<br>

**Propiedades:**  

- La similaridad de Gower es la suma de diferentes similaridades apropiadas para cada tipo de variable (cuantitativas, binarias y multiclase).

- Si consideramos un conjunto de variables cuantitativas, la similaridad de Gower es la transformación a similaridad de la distancia Manhattan (Minkowski con $q=2$)
normalizada por el rango, para que tome valores en $[0,1]$ :
 
$$
\dfrac{1}{p} \sum_{k=1}^{p} \left(1- \dfrac{\mid x_{ik} - x_{jk} \mid}{G_k} \right)
$$

- Si consideramos un conjunto de variables binarias, la similaridad de Gower coincide con la de Jaccard.

-  Si consideramos un conjunto de variables multiclase (no binarias), la similaridad de Gower coincide con la similaridad por coincidencias.




<br>



Siguiendo esta idea pueden crearse otras similaridades para conjuntos de variables de tipo mixto. Algunas recomendaciones para ello son las siguientes:

- Si queremos que la similaridad resultante tenga la propiedad Euclidea, todos las similaridades que se han combinado deben tenerla.

- Para variables cuantitativas, se debe usar una distancia normalizada, para que así esté contenida en $[0,1]$ y pueda convertirse en similaridad usando la transformacion $1 - \delta$

- Para variables categoricas es preferible usar similaridades contenidas en $[0,1]$ para evitar tener que normalizarlas.



<br>



## Similaridad de Gower en `Python`   <a class="anchor" id="88"></a>


























