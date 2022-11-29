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


$\hspace{0.35cm} 1)$ $\hspace{0.25cm}\delta (i,j) \geq 0 \hspace{0.45cm} \forall i,j \in A \\$

$\hspace{0.35cm}  2)$ $\hspace{0.25cm}\delta (i,i) = 0 \hspace{0.45cm} \forall i \in  A \\$

$\hspace{0.35cm}  3)$ $\hspace{0.25cm}\delta (i,j) = \delta (j, i) \hspace{0.45cm} \forall i,j \in A$

</p>
 
</p></span>
</div>



<br>

## Semi-métrica <a class="anchor" id="6"></a>

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>


$\hspace{0.25cm}$ Es denominada **semi-métrica**  a toda disimilaridad (casi-métrica) que tiene la propiedad siguiente (desigualdad triangular):


$\hspace{0.35cm}  4)$ $\hspace{0.25cm} \delta (i,j) \hspace{0.1 cm}\leq \hspace{0.1 cm} \delta (i,k) + \delta (k,j) \hspace{0.45cm} \forall i,j,k \in A$

</p>
 
</p></span>
</div>


<br>


## Métrica <a class="anchor" id="7"></a>


<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>

$\hspace{0.25cm}$ Se denomina **metrica**  a toda semi-metrica que tiene la siguiente propiedad:

$\hspace{0.35cm} 5)$ $\hspace{0.25cm} \delta (i,j)=0 \hspace{0.15cm}\Leftrightarrow\hspace{0.15cm} i=j \hspace{0.45cm} \forall i,j \in A$

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

$\hspace{0.35cm} 1)$  $\hspace{0.25cm}\delta (i,j) \geq 0 \hspace{0.45cm} \forall i,j \in A \\$

$\hspace{0.35cm} 2)$  $\hspace{0.25cm}\delta (i,i) = 0 \hspace{0.45cm} \forall i \in  A \\$

$\hspace{0.35cm} 3)$  $\hspace{0.25cm}\delta (i,j) = \delta (j, i) \hspace{0.45cm} \forall i,j \in A \\$

$\hspace{0.35cm} 4)$  $\hspace{0.25cm} \delta (i,j) \hspace{0.1 cm}\leq \hspace{0.1 cm} \delta (i,k) + \delta (k,j) \hspace{0.45cm} \forall i,j,k \in A$


$\hspace{0.25cm}$ o bien, cumple las cuatro anteriores y además la siguiente propiedad:

$\hspace{0.35cm} 5)$ $\hspace{0.25cm} \delta (i,j)=0 \hspace{0.15cm}\Leftrightarrow\hspace{0.15cm} i=j \hspace{0.45cm} \forall i,j \in A \\$

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
 
$\hspace{0.25cm} \delta_{ir} = \delta(a_i,a_r) \hspace{0.45cm} \forall i,r \in \lbrace 1,...,n \rbrace$

$\hspace{0.25cm} \delta_{ir}\hspace{0.1cm}$ puede interpretarse como la distancia $\hspace{0.1cm}\delta\hspace{0.1cm}$ entre el par de elementos $\hspace{0.1cm}(a_i,a_r)\hspace{0.1cm}$ de $\hspace{0.1cm}A$

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
\hspace{0.35cm} \delta(i,r)_{Euclidea} = \delta(x_i,x_r)_{Euclidea} =\sqrt{\sum_{k=1}^{p} (x_{ik} - x_{rk})\hspace{0.05cm}^2 \hspace{0.1cm} }  \hspace{0.1cm}=\hspace{0.1cm} \sqrt{(x_i - x_r)\hspace{0.05cm}^t\cdot (x_i - x_r)\hspace{0.1cm}} \hspace{0.1cm}=\hspace{0.1cm} \sqrt{ \text{sum} \left( \hspace{0.05cm} (x_i - x_r)^2  \hspace{0.05cm} \right) \hspace{0.1cm} } \\[0.6cm]
$$


$$
\hspace{0.35cm} \delta^2(i,r)_{Euclidea} = \delta^2(x_i,x_r)_{Euclidea} \hspace{0.1cm}=\hspace{0.1cm} \sum_{k=1}^{p} (x_{ik} - x_{jk})\hspace{0.05cm}^2 \hspace{0.1cm}=\hspace{0.1cm} (x_i - x_j)\hspace{0.05cm}^t\cdot (x_i - x_j) \hspace{0.1cm}=\hspace{0.1cm} \text{sum} \left( \hspace{0.05cm} (x_i - x_j)^2 \hspace{0.05cm} \right) \\
$$




$\hspace{0.25cm}$ para $\hspace{0.15cm} i,r = 1,...,n$


</p>
 
</p></span>
</div>


<br>
 
**Observaciones:**


$\delta(i,r)_{Euclidea}$ puede interpretarse como la distancia Euclidea entre el par de individuos $(e_i , e_r)$ respecto de las variables estadisticas  $\mathcal{X}_1,...,\mathcal{X}_p$  

Nos da una medida de distancia entre individuos basada en datos de esos individuos sobre variables estadisticas.  




<br>


**Distancia Euclidea entre vectores**

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>

$\hspace{0.25cm}$ La distancia Euclidea no se circusncribe solamente al campo de la estadística, una definicion mas general que contiene a la anteriormente dada es la siguiente:

$\hspace{0.25cm}$ Dados dos vectores  $v=(v_1,...,v_n)^t$ y $w=(w_1,...,w_n)^t$ de $\mathbb{R}^n$

$\hspace{0.25cm}$ La distancia Euclidea entre esos vectores es:

$$
\hspace{0.25cm} \delta^2(v,w)_{Euclidean} \hspace{0.07cm}=\hspace{0.07cm}  sum( (v-w)^2)  \hspace{0.07cm}=\hspace{0.07cm}  \sum_{i=1}^{n} (v_{i} - w_{i})\hspace{0.05cm}^2   
$$

</p>
 
</p></span>
</div>

- Así que $\hspace{0.1cm} \delta(x_i,x_r)_{Euclidea}\hspace{0.1cm}$ es la distancia Euclidea entre los vectores (de observaciones) $\hspace{0.1cm} x_i=(x_{i1},x_{i2},...,x_{ip})\hspace{0.1cm}$ y $\hspace{0.1cm} x_r=(x_{r1},x_{r2},...,x_{rp})\hspace{0.1cm}$ de las variables estadisticas $\hspace{0.1cm} \mathcal{X}_1,...,\mathcal{X}_p$




<br>



**Desventajas de la distancia Euclidea** <a class="anchor" id="13"></a>


 
Aunque es una de las distancias mas usadas en la práctica, en muchos casos no es la más adecuada desde un punto de vista estadistico por las siguientes razones: 

-  Asume que las variables están incorreladas y tienen varianza uno. 

-  No es invariante ante cambios de escala de las variables.


 
Vamos a ver que significa esto último:

Si cambiamos la escala de las variables, es decir, aplicamos la siguiente transformación sobre las variables:

$$a\cdot \mathcal{X}_j + b$$ 

con $a\neq 1$ y $b\neq 0$

Ahora las observaciones de los elementos $i$ y $r$ son $a\cdot x_i + b$ y $a\cdot x_r + b$

Por lo que la distancia Euclidea entre el par de observaciones de los elementos $i$ y $r$ es:

$$
\delta^2(i, r) = \delta^2(a\cdot x_i + b, a\cdot x_r + b)_{Euclidea} = a^2 \cdot (x_i - x_r)^t\cdot (x_i - x_r)
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

$\hspace{0.25cm}$ La distancia de Minkowski de parametro $\hspace{0.1cm} q=1,2,3,... \hspace{0.1cm}$ entre el par de observaciones (x_i , x_r) de las variables estadisticas $\hspace{0.1cm} \mathcal{X}_1,. ..,\mathcal{X}_k\hspace{0.1cm}$  se define como: $\\[0.5cm]$


$$
\hspace{0.25cm} \delta_q(i,r)_{Minkow} = \delta_q(x_i,x_r)_{Minkow} \hspace{0.1cm} = \hspace{0.1cm}  \left( \sum_{k=1}^{p}  \mid x_{ik} - x_{jk} \mid  ^q  \right)^{(1/q)} \hspace{0.1cm} = \hspace{0.1cm} \text{sum} \left( \hspace{0.1cm} \mid x_i - x_j \mid  ^q \hspace{0.1cm}\right)^{(1/q)}    
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
\hspace{0.25cm} \delta_q(v,w)_{Minkowski} \hspace{0.07cm}=\hspace{0.07cm}  sum \left( \hspace{0.1cm} \mid v - w \mid  ^q \hspace{0.1cm}\right)^{(1/q)}  \hspace{0.07cm}=\hspace{0.07cm}  \left( \sum_{i=1}^{n}  \mid v_{i } - w_{i} \mid  ^q  \right)^{(1/q)} $$

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
 \delta_2(i,j)_{Minkowski }=\delta (i,j)_{Euclidea }   \hspace{1cm} (q=2) \\
 \end{gather*}
 


<br>

$\hspace{0.25cm}$  **Distancia Manhattan**



\begin{gather*}
 \delta_1(i,j)_{Minkowski } \hspace{0.1cm}=\hspace{0.1cm} \sum_{k=1}^{p}  \mid x_{ik} - x_{jk}  \mid  \hspace{0.1cm}=\hspace{0.1cm}  sum \left( \hspace{0.1cm} \mid x_i - x_j \mid \hspace{0.1cm} \right) \hspace{1cm} (q=1) \\
 \end{gather*}



<br>

$\hspace{0.25cm}$  **Distancia Dominante** <a class="anchor" id="23"></a>



\begin{gather*}
 \delta_{\infty}(i,j)_{Minkowski } \hspace{0.1cm}=\hspace{0.1cm} max \lbrace  \hspace{0.1cm} \mid x_{i1} - x_{j1} \mid \hspace{0.1cm},...,\hspace{0.1cm} \mid x_{ip} - x_{jp} \mid \hspace{0.1cm}  \rbrace \hspace{0.1cm}=\hspace{0.1cm} max \left( \mid x_i - x_j \mid \right) \hspace{1cm} (q\rightarrow \infty) 
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
\delta(i,r)_{Canberra} = \delta(x_i,x_r)_{Canberra}\hspace{0.1cm}= \hspace{0.1cm} \sum_{k=1}^{p} \dfrac{\mid x_{ik} - x_{jk} \mid}{\mid x_{ik} \mid + \mid x_{jk} \mid}  \hspace{0.1cm}= \hspace{0.1cm} sum \left( \dfrac{\mid x_i - x_r \mid }{ \mid x_i \mid + \mid x_r \mid} \right)
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
\delta (v,w)_{Canberra}  \hspace{0.07cm}=\hspace{0.07cm}  sum \left( \dfrac{ \mid v-w \mid }{\mid v \mid + \mid w \mid} \right)  \hspace{0.07cm}=\hspace{0.07cm}  \sum_{i=1}^{n} \dfrac{ \mid v_i - w_i \mid }{\mid v_i \mid + \mid w_i \mid} \\
$$

</p>
 
</p></span>
</div>


- Asi que $\hspace{0.1cm} \delta_q(x_i,x_r)_{Minkowski}\hspace{0.1cm}$ es la distancia de Minkowski entre los vectores (de observaciones) $\hspace{0.1cm} x_i=(x_{i1},x_{i2},...,x_{ip})\hspace{0.1cm}$ y $\hspace{0.1cm} x_r=(x_{r1},x_{r2},...,x_{rp})\hspace{0.1cm}$ de las variables estadisticas $\hspace{0.1cm} \mathcal{X}_1,...,\mathcal{X}_p$



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



## Distancia de Karl Pearson  <a class="anchor" id="37"></a>


<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>

Dada una serie de muestras $X_1,...,X_p$ de las variables estadisticas  $\mathcal{X}_1,...,\mathcal{X}_p$

La distancia de Karl Pearson entre el par de observaciones $(x_i,x_r)$ de las variables estadisticas $\mathcal{X}_1,...,\mathcal{X}_p$ se define como: $\\[0.5cm]$

$$
\delta(i,r)_{Pearson} \hspace{0.05cm} =\hspace{0.05cm} \delta(x_i,x_r)_{KP} \hspace{0.1cm}=\hspace{0.1cm} \sqrt{ \sum_{k=1}^{p} \hspace{0.08cm} \dfrac{1}{s\hspace{0.03cm}^2_k} \cdot ( x_{ik} - x_{rk} )\hspace{0.03cm}^2 } \hspace{0.1cm} =\hspace{0.1cm} \sqrt{(x_i - x_r)\hspace{0.03cm}^t \cdot S_0^{-1} \cdot (x_i - x_r )}  \hspace{0.1cm} = \hspace{0.1cm} \sqrt{  sum \left( \hspace{0.07cm} \left(  \dfrac{ x_i - x_r  }{ \overrightarrow{s}   }\right)^2 \hspace{0.07cm} \right)} \\[0.8cm]
$$
  

</p>
 
</p></span>
</div>




Donde:
 
 $S_0 = \text{diag}(s_1 ^2 ,..., s_p ^2)$
 
 $s_k ^2\hspace{0.08cm}$ es la varianza de la muestra $\hspace{0.08cm}X_k\hspace{0.08cm}$ , es decir, $\hspace{0.08cm} s_k ^2 = \dfrac{1}{n}\cdot \sum_{i=1}^n ( x_{ik} - \overline{X}_k )^2$

 $\overrightarrow{s} = ( s_1 ,..., s_p )$






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


Dada una matriz de datos $X=(X_1,...,X_p)$ de las variables estadisticas  $\mathcal{X}_1,...,\mathcal{X}_p$


La distancia de Mahalanobis entre el par de observaciones $(x_i,x_r)$ de las variables estadisticas $\mathcal{X}_1,...,\mathcal{X}_p$ se define como: $\\[0.5cm]$

 
$$
\delta^2(i,j)_{Maha} \hspace{0.08cm}= \hspace{0.08cm} (x_i - x_j)\hspace{0.03cm}^t \cdot S^{-1} \cdot (x_i - x_j ) \\[0.6cm]
$$

 $$
 \delta(i,j)_{Maha} \hspace{0.08cm}= \hspace{0.08cm}\sqrt{(x_i - x_j)\hspace{0.03cm}^t \cdot S^{-1} \cdot (x_i - x_j ) }   \\[0.6cm]
$$


Donde:

$S \hspace{0.08cm}$ es la matriz de covarianzas de la matriz de datos $\hspace{0.08cm}X=(X_1,...,X_p)$


<br>


**Ventajas**

La distancia de Mahalanobis es adecuada como distancia estadística por las siguientes razones: 

1) Es invariante ante cambios de escala (cambios en las unidades de medida) de las variables.

2) Tiene en cuenta la correlación entre las variables. No aumenta al incrementar el número de variables observadas. Solo aumenta cuando estas nuevas variables no estan correladas con las anteriores. Asi que solo cuando las nuevas variables no son redundantes con respecto a la infromacion provista por las anteriores, la distancia de Mahalanobis aumentará.

<br>

***Observaciones***

1) The Euclidean distance is equal to the Mahalanobis distance when $\hspace{0.1cm} S=I$

2) The Karl Pearson distance is equal to the Mahalanobis distance when $\hspace{0.1cm} S=\text{diag}(s_1^2 ,..., s_p^2)$



<br>




#### Mahalanobis Distance in `R` <a class="anchor" id="43"></a>

















