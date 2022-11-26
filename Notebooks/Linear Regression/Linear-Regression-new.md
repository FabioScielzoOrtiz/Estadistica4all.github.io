---
title: 'Regresión Lineal'
author: 'Fabio Scielzo Ortiz'
date: '26/11/22'
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

 

>More articles in my blog:   $\hspace{0.1cm}$   [Estadistica4all](https://fabioscielzoortiz.github.io/Estadistica4all.github.io/)

 
 
<br> 


El principal proposito de este articulo es llevar a cabo una exposicion teorico-práctica sobre el modelo de regresión lineal. Sin dudad, el modelo estadístico más popular.
 

Existe la idea de que el modelo de regresión lineal esta anticuado comparado con otros modelos estadísticos más modernos, pero me gustaría defender su validez hoy en dia, primero de todo como técnica estadistica, y segundo como paso previo necesario para aprender otros modelos más complejos.

El modelo de regresión lineal es la base de muchas técnicas modernas de regresión, asi que es recomendable estudiarlo bien antes de profundizar en esas otras técnicas.
 




<br>

#  Data-set  <a class="anchor" id="1"></a>
 

Vamos a describir el data-set que usaremos en este articulo, el cual contiene 1905 observaciones sobre 38 variables de caracteristicas de viviendas.

Usando este [link](https://www.kaggle.com/datasets/dataregress/dubai-properties-dataset?resource=download) pueden descargarse los datos.


<br>

Las variables de nuestro interes son las siguientes:

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






<br>


Vamos a preprocesar el data-set para obtener el que finalmente usaremos a lo largo de este artículo.

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
      <th>neighborhood</th>
      <th>latitude</th>
      <th>longitude</th>
      <th>price</th>
      <th>size_in_sqft</th>
      <th>price_per_sqft</th>
      <th>no_of_bedrooms</th>
      <th>no_of_bathrooms</th>
      <th>quality</th>
      <th>...</th>
      <th>private_pool</th>
      <th>security</th>
      <th>shared_gym</th>
      <th>shared_pool</th>
      <th>shared_spa</th>
      <th>study</th>
      <th>vastu_compliant</th>
      <th>view_of_landmark</th>
      <th>view_of_water</th>
      <th>walk_in_closet</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>5528049</td>
      <td>Palm Jumeirah</td>
      <td>25.113208</td>
      <td>55.138932</td>
      <td>2700000</td>
      <td>1079</td>
      <td>2502.32</td>
      <td>1</td>
      <td>2</td>
      <td>Medium</td>
      <td>...</td>
      <td>False</td>
      <td>False</td>
      <td>True</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>True</td>
      <td>False</td>
    </tr>
    <tr>
      <th>1</th>
      <td>6008529</td>
      <td>Palm Jumeirah</td>
      <td>25.106809</td>
      <td>55.151201</td>
      <td>2850000</td>
      <td>1582</td>
      <td>1801.52</td>
      <td>2</td>
      <td>2</td>
      <td>Medium</td>
      <td>...</td>
      <td>False</td>
      <td>False</td>
      <td>True</td>
      <td>True</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>True</td>
      <td>False</td>
    </tr>
    <tr>
      <th>2</th>
      <td>6034542</td>
      <td>Jumeirah Lake Towers</td>
      <td>25.063302</td>
      <td>55.137728</td>
      <td>1150000</td>
      <td>1951</td>
      <td>589.44</td>
      <td>3</td>
      <td>5</td>
      <td>Medium</td>
      <td>...</td>
      <td>False</td>
      <td>True</td>
      <td>True</td>
      <td>True</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>True</td>
      <td>True</td>
      <td>True</td>
    </tr>
    <tr>
      <th>3</th>
      <td>6326063</td>
      <td>Culture Village</td>
      <td>25.227295</td>
      <td>55.341761</td>
      <td>2850000</td>
      <td>2020</td>
      <td>1410.89</td>
      <td>2</td>
      <td>3</td>
      <td>Low</td>
      <td>...</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
    </tr>
    <tr>
      <th>4</th>
      <td>6356778</td>
      <td>Palm Jumeirah</td>
      <td>25.114275</td>
      <td>55.139764</td>
      <td>1729200</td>
      <td>507</td>
      <td>3410.65</td>
      <td>0</td>
      <td>1</td>
      <td>Medium</td>
      <td>...</td>
      <td>False</td>
      <td>True</td>
      <td>True</td>
      <td>True</td>
      <td>True</td>
      <td>False</td>
      <td>False</td>
      <td>True</td>
      <td>True</td>
      <td>False</td>
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
      <th>1900</th>
      <td>7705450</td>
      <td>Mohammed Bin Rashid City</td>
      <td>25.176892</td>
      <td>55.310712</td>
      <td>1500000</td>
      <td>1087</td>
      <td>1379.94</td>
      <td>2</td>
      <td>2</td>
      <td>Ultra</td>
      <td>...</td>
      <td>False</td>
      <td>True</td>
      <td>True</td>
      <td>True</td>
      <td>True</td>
      <td>True</td>
      <td>True</td>
      <td>True</td>
      <td>True</td>
      <td>True</td>
    </tr>
    <tr>
      <th>1901</th>
      <td>7706287</td>
      <td>Mohammed Bin Rashid City</td>
      <td>25.166145</td>
      <td>55.276684</td>
      <td>1230000</td>
      <td>760</td>
      <td>1618.42</td>
      <td>1</td>
      <td>2</td>
      <td>Medium</td>
      <td>...</td>
      <td>False</td>
      <td>False</td>
      <td>True</td>
      <td>True</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>True</td>
      <td>True</td>
    </tr>
    <tr>
      <th>1902</th>
      <td>7706389</td>
      <td>Dubai Creek Harbour (The Lagoons)</td>
      <td>25.206500</td>
      <td>55.345056</td>
      <td>2900000</td>
      <td>1930</td>
      <td>1502.59</td>
      <td>3</td>
      <td>5</td>
      <td>Medium</td>
      <td>...</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>True</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
    </tr>
    <tr>
      <th>1903</th>
      <td>7706591</td>
      <td>Jumeirah Village Circle</td>
      <td>25.073858</td>
      <td>55.229844</td>
      <td>675000</td>
      <td>740</td>
      <td>912.16</td>
      <td>1</td>
      <td>2</td>
      <td>Medium</td>
      <td>...</td>
      <td>False</td>
      <td>True</td>
      <td>True</td>
      <td>True</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>True</td>
      <td>True</td>
    </tr>
    <tr>
      <th>1904</th>
      <td>7706643</td>
      <td>Jumeirah Lake Towers</td>
      <td>25.079130</td>
      <td>55.154713</td>
      <td>760887</td>
      <td>800</td>
      <td>951.11</td>
      <td>1</td>
      <td>2</td>
      <td>High</td>
      <td>...</td>
      <td>False</td>
      <td>True</td>
      <td>True</td>
      <td>True</td>
      <td>True</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>True</td>
      <td>False</td>
    </tr>
  </tbody>
</table>
<p>1905 rows × 38 columns</p>
</div>

<br>

Transformamos las variables en pies cuadrados a metros cuadrados:
```python
data_Python['size_in_m_2'] = 0.092903*data_Python['size_in_sqft']
data_Python['price_per_m_2'] = data_Python['price_per_sqft']/0.092903
```

Seleccionamos las variables (columnas) con las que vamos a trabajar:

```python
data_Python = data_Python >> select(X.price , X.size_in_m_2, X.longitude, X.latitude, X.no_of_bedrooms, X.no_of_bathrooms, X.quality)
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
<table border="1" class="dataframe" align="center">
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
      <td>Medium</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2850000</td>
      <td>146.972546</td>
      <td>55.151201</td>
      <td>25.106809</td>
      <td>2</td>
      <td>2</td>
      <td>Medium</td>
    </tr>
    <tr>
      <th>2</th>
      <td>1150000</td>
      <td>181.253753</td>
      <td>55.137728</td>
      <td>25.063302</td>
      <td>3</td>
      <td>5</td>
      <td>Medium</td>
    </tr>
    <tr>
      <th>3</th>
      <td>2850000</td>
      <td>187.664060</td>
      <td>55.341761</td>
      <td>25.227295</td>
      <td>2</td>
      <td>3</td>
      <td>Low</td>
    </tr>
    <tr>
      <th>4</th>
      <td>1729200</td>
      <td>47.101821</td>
      <td>55.139764</td>
      <td>25.114275</td>
      <td>0</td>
      <td>1</td>
      <td>Medium</td>
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
      <td>Ultra</td>
    </tr>
    <tr>
      <th>1901</th>
      <td>1230000</td>
      <td>70.606280</td>
      <td>55.276684</td>
      <td>25.166145</td>
      <td>1</td>
      <td>2</td>
      <td>Medium</td>
    </tr>
    <tr>
      <th>1902</th>
      <td>2900000</td>
      <td>179.302790</td>
      <td>55.345056</td>
      <td>25.206500</td>
      <td>3</td>
      <td>5</td>
      <td>Medium</td>
    </tr>
    <tr>
      <th>1903</th>
      <td>675000</td>
      <td>68.748220</td>
      <td>55.229844</td>
      <td>25.073858</td>
      <td>1</td>
      <td>2</td>
      <td>Medium</td>
    </tr>
    <tr>
      <th>1904</th>
      <td>760887</td>
      <td>74.322400</td>
      <td>55.154713</td>
      <td>25.079130</td>
      <td>1</td>
      <td>2</td>
      <td>High</td>
    </tr>
  </tbody>
</table>
<p>1905 rows × 7 columns</p>
</div>


<br>

Recodificamos la variable categorica **quality** al formato estandar:

```python
data_Python['quality'].unique()
```

    array(['Medium', 'Low', 'High', 'Ultra'], dtype=object)




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

 
Eliminamos la variable **quality** y renombramos la nueva **quality_recode** como **quality**

```python
data_Python = data_Python >> select( ~X.quality )
```


```python
data_Python = data_Python >> rename(quality = X.quality_recode)
```

Convertimos **quality** a tipo categorico:

```python
data_Python['quality'] = data_Python['quality'].astype('category')
```


```python
data_Python.dtypes
```
 
    price                 int64
    size_in_m_2         float64
    longitude           float64
    latitude            float64
    no_of_bedrooms        int64
    no_of_bathrooms       int64
    quality            category
    dtype: object


<br>


El data-set final, con el que vamos a trabajar, es el siguiente:

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


<br>

Podemos grabar como un csv el anterior data-frame como sigue:


```python
data_Python.to_csv('data_Python.csv' , index=False)
```




&nbsp;




# Utilidad del modelo de regresión lineal <a class="anchor" id="5"></a>


La principal utilidad del modelo de regresión lineal es predecir valores de una variable cuantitativa, llamada respuesta, usando una muestra de valores de otras variables, llamadas predictores, y también de la propia respuesta. 

La otra utilidad importante del modelo de regresión lineal es hacer inferencia. En otras palabras, analizar la relacion entre la respuesta y los predictores.

Algunas preguntas relacionadas con hacer inferencia son las siguientes:
 
- ¿Cuáles son los predictores más importantes para explicar la respuesta?

- ¿Cuál es la relacion entre la respuesta y cada predictor? ¿Es positiva, negativa o no depende de los predictores?

- ¿Puede la relación entre respuesta y predictores ser resumida con una ecuación lineal, o es una relación más compleja?


<br>



# El modelo de regresión lineal: aproximación formal <a class="anchor" id="6"></a>


## Elementos básicos

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>

$\hspace{0.25 cm}$ Tenemos los siguientes elementos básicos:

<br>

-   ***Variable Respuesta :***  

    - Una variable  **cuantitativa** denominada variable respuesta $\hspace{0.2cm}\Rightarrow \hspace{0.2cm} \mathcal{Y} \\$


    - Una muestra de la variable respuesta $\hspace{0.2cm}\Rightarrow \hspace{0.2cm} Y\hspace{0.1cm}=\hspace{0.1cm}(y_{1} \hspace{0.1cm},\hspace{0.1cm} y_2\hspace{0.1cm},...,\hspace{0.1cm}y_n)^t$


 

<br>

-   ***Predictores :*** 

    - Un conjunto de variables cuantitativas o categoricas denominadas predictores  $\hspace{0.2cm}\Rightarrow \hspace{0.2cm} \mathcal{X}_1,..., \mathcal{X_p} \\$


    - Una muestra de cada predictor  $\mathcal{X_r}$ $\hspace{0.2cm}\Rightarrow \hspace{0.2cm} X_r \hspace{0.1cm}=\hspace{0.1cm} (x_{1r}\hspace{0.1cm},\hspace{0.1cm} x_{2r}\hspace{0.1cm}, ..., \hspace{0.1cm}x_{nr})^t$




<br>

-   ***Matriz de predictores :***


    - Una matriz con un vector de unos y las muestras de los predictores:
    
    \begin{gather*}
    X=(1, X_1, X_2,...,X_p) \hspace{0.1cm}=\hspace{0.1cm} 
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
    

&nbsp;


-   ***Vector de coeficientes beta :***


    - Un vector con los coeficientes del modelo $\hspace{0.2cm}\Rightarrow \hspace{0.2cm} \beta\hspace{0.1cm}=\hspace{0.1cm}(\beta_{1}\hspace{0.1cm},\hspace{0.1cm} \beta_{2}\hspace{0.1cm}, ...,\hspace{0.1cm} \beta_{n})^t$

&nbsp;

-   ***Vector de residuos :***


     - Un vector con los resuduos (o errores) del modelo $\hspace{0.2cm}\Rightarrow \hspace{0.2cm} \varepsilon\hspace{0.1cm}=\hspace{0.1cm}(\varepsilon_{1}\hspace{0.1cm},\hspace{0.1cm} \varepsilon_{2}\hspace{0.1cm}, ...,\hspace{0.1cm} \varepsilon_{n})^t$





</p>
 
</p></span>
</div>



&nbsp;





## Supuestos básicos del modelo <a class="anchor" id="7"></a>


<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>

$\hspace{0.25cm}$ Los supuestos básicos del modelo son los siguientes:

<br>

- $\hspace{0.15cm} y_i \hspace{0.1cm} =  \hspace{0.1cm} x_i^t \cdot \beta  +  \varepsilon_i \hspace{0.15cm} =  \hspace{0.15cm}   \beta_0 + \sum_{j=1}^{p} \left( \beta_j \cdot x_{ij} \right) + \varepsilon_i \hspace{0.15cm} =  \hspace{0.15cm}  \beta_0 + \beta_1 \cdot x_{i1} + \beta_2 \cdot x_{i2} + \dots + \beta_p \cdot x_{ip} + \varepsilon_i$
 

&nbsp;

 
-  $\hspace{0.15cm} \varepsilon_i \hspace{0.2cm}$ es una variable aleatoria con las siguientes propiedades:


   - $\hspace{0.15cm} E[\varepsilon_i]=0 \\$
   
   
   
   - $\hspace{0.15cm} Var(\varepsilon_i)=\sigma^2 \\$
  
   - $\hspace{0.15cm} \varepsilon_i \sim N(0,\sigma^2) \\$ 
  
   - $\hspace{0.15cm} cov(\varepsilon_i , \varepsilon_j)=0  \hspace{0.35cm} ,\forall i\neq j$ 


&nbsp;



- $\hspace{0.15cm}$ Supuestos adicionales:

  -  $\hspace{0.15cm} n > p+1 \\$  

  -  $\hspace{0.15cm} Rg(X)=p+1$

</p>
 
</p></span>
</div>

¿ Por qué son importantes estos supuestos adicionales ?
 $\hspace{0.1cm} \Rightarrow\hspace{0.1cm}$ **Problemas de dimensionalidad** (serán comentados con detalle en posteriores artículos)







&nbsp;






## Consecuencias de los supuestos <a class="anchor" id="8"></a>


<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>


   -  $\hspace{0.15cm} y_i\hspace{0.1cm}$ es una variable aleatoria con las siguientes propiedades:
   

      -  $\hspace{0.15cm} E[y_i]= x_i^t \cdot \beta \\$

      -  $\hspace{0.15cm} Var(y_i) = \sigma^2 \\$

      -  $\hspace{0.15cm} y_i \sim N(\hspace{0.1cm} x_i^t  \cdot \beta \hspace{0.1cm} , \hspace{0.1cm} \sigma^2 \hspace{0.1cm} ) \\$

      -  $\hspace{0.15cm} cov(y_i , y_j)=0  \hspace{0.25cm}, \forall i\neq j$

</p>
 
</p></span>
</div>



&nbsp;





## Representación matricial del modelo   <a class="anchor" id="9"></a>


<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

$\hspace{0.25cm}$  La representación matricial del modelo viene dada como:

$$Y=X\cdot \beta + \varepsilon \\$$

$\hspace{0.25cm}$  Donde:

 - $\hspace{0.2cm} \varepsilon_i \sim N(0,\sigma) \hspace{0.4cm} \forall \hspace{0.1cm} i=1,...,n \\$
  
- $\hspace{0.2cm} cov(\varepsilon_i , \varepsilon_j)=0 \hspace{0.4cm} \forall \hspace{0.1cm} i\neq j =1,...,n$


</p>
 
</p></span>
</div>


&nbsp;




# Predicción de la variable respuesta  <a class="anchor" id="10"></a>


<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

$\hspace{0.25cm}$ El modelo de regresión lineal predice la variable respuesta del siguiente modo:


$$
\widehat{y}_i \hspace{0.15cm}=\hspace{0.15cm} x_i^t \cdot \widehat{\beta}  \hspace{0.15cm}=\hspace{0.15cm} \widehat{\beta}_0 + \sum_{j=1}^{p} \widehat{\beta}_j \cdot x_{ij} \hspace{0.15cm}=\hspace{0.15cm} \widehat{\beta}_0 + \widehat{\beta}_1 \cdot x_{i1} + \widehat{\beta}_2 \cdot x_{i2} + ... + \widehat{\beta}_p \cdot x_{ip}  \\
$$


$\hspace{0.25cm}$ Donde:



- $\hspace{0.2cm}\hat{y}_i\hspace{0.1cm}$  es la estimación de la respuesta para la observación  $\hspace{0.15cm} x_i = (1,x_{i1}, x_{i2}, ..., x_{ip})^t \hspace{0.15cm}$ de los predictores. $\\[0.4cm]$



- $\hspace{0.2cm}\widehat{\beta} = (\widehat{\beta}_1 ,..., \widehat{\beta}_p) \hspace{0.2cm}$ es una estimación del vector de coeficientes betas.

</p>
 
</p></span>
</div>


<br>




# Estimación de los coeficientes del modelo <a class="anchor" id="12"></a>


<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

$\hspace{0.25cm}$ La estimación de $\hspace{0.1cm} \beta \hspace{0.1cm}$  en el modelo de regresión lineal ordinario se lleva a cabo mediante el método de mínimos cuadrados ordinarios (MCO). 



$\hspace{0.25cm}$ Formalmente:


$$\hspace{0.15cm} \widehat{\beta}\hspace{0.15cm} =\hspace{0.15cm} arg \hspace{0.15cm} \hspace{0.15cm} \underset{\beta}{Min} \hspace{0.15cm}  RSS(\beta) \hspace{0.15cm}  =  \hspace{0.15cm}  arg \hspace{0.15cm} \underset{\beta}{Min} \hspace{0.2cm}  \sum_{i=1}^{n} \hspace{0.1cm}(y_i - x_i^t \cdot \beta)\hspace{0.02cm}^2  \hspace{0.2cm} = \hspace{0.15cm}  arg \hspace{0.15cm}  \underset{\beta_0,\beta_1,..,\beta_p}{Min} \hspace{0.2cm}  \sum_{i=1}^{n} \hspace{0.1cm}(y_i - \beta_0 - \beta_1 \cdot x_{i1} - \dots - \beta_p \cdot x_{ip})\hspace{0.02cm}^2$$


<br>


$\hspace{0.25cm}$ Existe una solución exacta del problema, que es la siguiente:

$$
\widehat{\beta}\hspace{0.1cm}=\hspace{0.1cm}(X^t \cdot X)^{-1} \cdot X^t \cdot Y
$$

$\hspace{0.25cm}$ Donde:

$$\widehat{\beta}\hspace{0.1cm}=\hspace{0.1cm}(\widehat{\beta}_0\hspace{0.1cm},\hspace{0.1cm} \widehat{\beta}_1 \hspace{0.1cm},...,\hspace{0.1cm}\widehat{\beta}_p)$$

 
</p>
 
</p></span>
</div>
 
 

<br>

**Interpretación :**

$\hspace{0.2cm} \widehat{y} = x^t \cdot \widehat{\beta} \hspace{0.2cm}$ con $\hspace{0.2cm} x\in \mathbb{R}^p \hspace{0.2cm}$ es el hiperplano de dimensión $\hspace{0.1cm}p+1\hspace{0.1cm}$ que **minimiza** la **distancia Euclidea** entre los puntos $\hspace{0.1cm}\lbrace \hspace{0.1cm}(y_i , x_i)\hspace{0.15cm} / \hspace{0.15cm}i\in \lbrace 1,...,n \rbrace \hspace{0.1cm} \rbrace\hspace{0.1cm}$ y los puntos del hiperplano cuya segunda coordenada es $\hspace{0.1cm}x_i\hspace{0.1cm}$ para $\hspace{0.1cm}i\in \lbrace 1,...,n\rbrace\hspace{0.1cm}$ , es decir, los puntos $\hspace{0.1cm}\left\lbrace \hspace{0.1cm}(y_i , x_i)\hspace{0.15cm} / \hspace{0.15cm}  \hat{y}_i = x_i^t \cdot \widehat{\beta}  \hspace{0.2cm} , \hspace{0.2cm} i\in \lbrace 1,...,n \rbrace  \hspace{0.1cm} \right\rbrace\hspace{0.1cm}$ 



<br>

<center>

![](hyperplane.png){width="45%"}

</center>

<br>


**Observación:**

En este artículo no se va a mostrar los detalles matemáticos sobre cómo se deriva la solución al problema de mínimos cuadrados ordinarios.




&nbsp;





# Estimación de los residuos del modelo <a class="anchor" id="13"></a>


<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

$\hspace{0.25cm}$ Los errores del modelo $\varepsilon$ son estimados como sigue:

<br>

$$
\widehat{\varepsilon}_i \hspace{0.1 cm} = \hspace{0.1 cm} y_i - \widehat{y}_i \hspace{0.1 cm} = \hspace{0.1 cm} y_i - x_i^t \cdot \widehat{\beta}  
$$

$\hspace{0.25cm}$ para $\hspace{0.1cm}$ $i=1,...,n$

</p>
 
</p></span>
</div>

<br>


**Observación:**

$\hat{\varepsilon}_i\hspace{0.1cm}$ es el error que comete el modelo cuando predice    $y_i$  como  $\widehat{y}_i=x_i^t \cdot \widehat{\beta}$






&nbsp;




# Suma de cuadrados de los residuos (RSS) <a class="anchor" id="13.1"></a>


<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

$\hspace{0.25cm}$ El tamaño de los errores cometidos por el modelo suele cuantificarse como la suma de los errores al cuadrado:



$$RSS(\beta) \hspace{0.1 cm} = \hspace{0.1 cm} \sum_{i=1}^{n} \varepsilon_i\hspace{0.02cm}^2 \hspace{0.1 cm} = \hspace{0.1 cm} \sum_{i=1}^{n} (y_i - x_i^t \cdot \beta)\hspace{0.02cm}^2 $$

</p>
 
</p></span>
</div>

<br>


**Observation:**

Esta expresión juega un rol central en los modelos de regresión. 

Notese que $RSS(\beta)$ es la función objetivo del problema de mínimos cuadrados.


 


&nbsp;





#  Hiperplano de regresión <a class="anchor" id="14"></a>

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

$\hspace{0.25cm}$ El hiperplano de regresión se define como: 



$$\widehat{\hspace{0.1cm} Y} \hspace{0.1cm}=\hspace{0.1cm} X \cdot \widehat{\beta}$$


$\hspace{0.25cm}$ Donde:    $\hspace{0.2cm} \widehat{\hspace{0.1cm} Y}\hspace{0.1cm}=\hspace{0.1cm}(\widehat{y}_1,\widehat{y}_2,...,\widehat{y}_n)^t$


</p>
 
</p></span>
</div>


&nbsp;





## Hat-Matrix <a class="anchor" id="15"></a>


<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

$\hspace{0.25cm}$ El hiperplano de regresión puede expresarse alternativamente como sigue:

\begin{gather*}
\widehat{\hspace{0.1cm}Y} = X \cdot \widehat{\beta} = X \cdot (X^t \cdot X)^{-1} \cdot X^t \cdot Y = H \cdot Y  
\end{gather*}

 
$\hspace{0.25cm}$ Donde:  

$$H= X \cdot (X^t \cdot X)^{-1} \cdot X^t$$

$\hspace{0.25cm}$ es llamada **Hat-Matrix**

</p>
 
</p></span>
</div>


&nbsp;




 




<br>



# Estimación del modelo de regresión lineal en `Python`   

<br>

## Usando la libreria `statsmodels` <a class="anchor" id="17"></a>



We can implement a linear regression model in Python with the package `statsmodels` following two ways.

<br>

***Primera forma:*** $\hspace{0.1cm}$ usando `statsmodels.formula.api`


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

                                OLS Regression Results                            
    ==============================================================================
    Dep. Variable:                  price   R-squared:                       0.698
    Model:                            OLS   Adj. R-squared:                  0.697
    Method:                 Least Squares   F-statistic:                     547.4
    Date:               sá., 22 oct. 2022   Prob (F-statistic):               0.00
    Time:                        19:25:11   Log-Likelihood:                -29918.
    No. Observations:                1905   AIC:                         5.985e+04
    Df Residuals:                    1896   BIC:                         5.990e+04
    Df Model:                           8                                         
    Covariance Type:            nonrobust                                         
    ===================================================================================
                          coef    std err          t      P>|t|      [0.025      0.975]
    -----------------------------------------------------------------------------------
    Intercept       -6.207e+07   2.99e+07     -2.073      0.038   -1.21e+08   -3.34e+06
    quality[T.1]       1.4e+05   8.36e+04      1.675      0.094   -2.39e+04    3.04e+05
    quality[T.2]     3.406e+05   1.55e+05      2.196      0.028    3.63e+04    6.45e+05
    quality[T.3]     2.788e+05   1.98e+05      1.410      0.159   -1.09e+05    6.66e+05
    size_in_m_2      3.566e+04    723.831     49.271      0.000    3.42e+04    3.71e+04
    no_of_bedrooms  -8.367e+05   8.28e+04    -10.102      0.000   -9.99e+05   -6.74e+05
    no_of_bathrooms -5.712e+04   6.83e+04     -0.836      0.403   -1.91e+05    7.68e+04
    latitude         6.115e+06   7.81e+05      7.830      0.000    4.58e+06    7.65e+06
    longitude       -1.677e+06   6.91e+05     -2.428      0.015   -3.03e+06   -3.22e+05
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
    


<br>


***Segunda forma:***  $\hspace{0.1cm}$ usando  `statsmodels.api`

Una de las diferencias más importantes entre la primera y la segunda forma de usar `statmodels` para estimar un modelo de regresión lineal es que `statsmodels.api` no estima el intercepto $(\beta_0)$ , mientras que `statsmodels.formula.api` si.

Otra importante diferencia es que `statsmodels.api` no entiende si un predictor es categorico, mientras que`statsmodels.formula.api` si.

Para estimar el intercepto e incluir predictores categoricos usando `statsmodels.api` necesitamos añadir tanto el intercepto como un vector de unos, como las variables dummies asociadas a los predictores categoricos, a la  matriz de predictores $X$ como nuevas columnas (y dejar de considerar las columnas asociadas a los predictores categoricos), y esto puede hacerse facilmente usando la función `varcharProcessing` , la cual expondremos a continuación.

**Observación :**

Las variables dummies asociadas a los predictores categoricos son las variables que se obtienen al *dummificar* una variable categorica. Este procedimiento será visto con más detalle en otro artículo.


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

<br>

Vamos a ver como funciona `varcharProcessing` :


```python
X = data_Python[['size_in_m_2', 'longitude', 'latitude', 'no_of_bedrooms', 'no_of_bathrooms', 'quality']]
```


```python
X.head()
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
  </tbody>
</table>
</div>

```python
varcharProcessing(X, varchar_process = "dummy_dropfirst").head()
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
  </tbody>
</table>
</div>


<br>


Importamos ahora `statsmodels.api`

```python
import statsmodels.api as sm
```

Creamos la matriz $X$ y el vector $Y$

```python
X = data_Python[['size_in_m_2', 'longitude', 'latitude', 'no_of_bedrooms', 'no_of_bathrooms', 'quality']]

Y = data_Python['price']
```

Ahora aplicamos la funcion `varcharProcessing` sobre $X$ para hacer las transformaciones necesarias para poder estimar el intercepto e incluir predictores categoricos en la regresión, como antes se mencionó.

```python
X = varcharProcessing(X, varchar_process = "dummy_dropfirst")
```


Ajustamos el modelo:

```python
model_Py_sm = sm.OLS(y , X).fit()
```

Imprimimos una tabla resumen sobre el modelo ajustado:
```python
print(model_Py_sm.summary())
```


                                OLS Regression Results                            
    ==============================================================================
    Dep. Variable:                  price   R-squared:                       0.698
    Model:                            OLS   Adj. R-squared:                  0.697
    Method:                 Least Squares   F-statistic:                     547.4
    Date:               sá., 22 oct. 2022   Prob (F-statistic):               0.00
    Time:                        19:25:20   Log-Likelihood:                -29918.
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
    

<br>

Esta salida nos da, entre otras cosas, la estimación de los coeficientes (betas) del modelo:


- $\hspace{0.1cm} \widehat{\beta}_0 \hspace{0.1cm} =\hspace{0.1cm} -6.207\cdot 10^7 \\$


- $\widehat{\beta}_{size\_in\_m\_2} =3.566e+04 \\$

- $\widehat{\beta}_{longitude}= -1.677e+06 \\$

- $\widehat{\beta}_{latitude}=6.115e+06 \\$

- $\widehat{\beta}_{no\_of\_bedrooms} = -8.367e+05 \\$

- $\widehat{\beta}_{no\_of\_bathrooms} = -5.712e+04 \\$

- $\widehat{\beta}_{quality1} =1.4e+05 \\$

- $\widehat{\beta}_{quality2} = 3.406e+05 \\$

- $\widehat{\beta}_{quality3} = 2.788e+05 \\$


 


<br>

Así que el modelo estimado es el siguiente:

\begin{gather*}
\widehat{price}_i =  -6.207e+07 +  3.566e+04 \cdot size\_in\_m\_2_i -8.367e+05 \cdot no\_of\_bedrooms_i -5.712e+04 \cdot no\_of\_bathrooms_i +\\ 1.4e+05 \cdot quality1_i + 3.406e+05\cdot quality2_i + 2.788e+05  \cdot quality3_i  +6.115e+06\cdot  latitude_i -1.677e+06   \cdot longitude_i 
\end{gather*}

<br>

**Observation:**

The  categorical variable, *quality*, that has 4 categories (Low (0), Medium (1),
High (2), Ultra (3)), enter in the model with 3 variables (quality1 ,
quality2, quality3 ). The category that is out of the model is Low (0) because is the firs category (also called reference category). 

This isn´t a particularity of this variable, but rather it´s a property of the categorical variables in the linear regression model.

Later it will be seen how this affects model coefficients interpretation.  




<br>



## Usando la libreria  `scikit-learn` <a class="anchor" id="18"></a>



```python
# pip install sklearn
```


```python
import sklearn

from sklearn.linear_model import LinearRegression

from sklearn.model_selection import train_test_split
```

<br>

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
  </tbody>
</table>
</div>



<br>

We can fit a linear regression model with `sk-learn` :


```python
from sklearn.linear_model import LinearRegression
```

<br>

We can fit the model with the full data-set:


```python
Model_Py_sklearn = LinearRegression().fit(X, y)
```

<br>

We can compute the coefficients of the model:


```python
Model_Py_sklearn.intercept_
```


    -62071412.530511364


```python
Model_Py_sklearn.coef_
```


    array([       0.        ,    35664.04832657, -1677160.95037418,
            6114932.04602611,  -836682.98365871,   -57120.8092927 ,
             140018.66529665,   340613.10347113,   278761.44732511])


Note that the order of the array values follows the order of $X$ columns.



<br>


<br>

## Precision of beta coefficients estimation <a class="anchor" id="19"></a>



The precision of the estimations of model beta coefficients  is given by the
 variance of the beta coefficient estimators, that is, by $\hspace{0.02cm}$  $Var(\widehat{\beta}_j)$

<br>

It´s true that $\hspace{0.1cm}$ 
$\widehat{\beta}_j \sim N \left( \beta_j \hspace{0.1cm},\hspace{0.1cm} \sqrt{ \sigma^2 \cdot q_{jj} } \right)$ $\hspace{0.1cm}$ then we have:

<br>

 $$Var(\widehat{\beta}_j)\hspace{0.1cm}= \hspace{0.1cm}\sigma^2 \cdot q_{jj}$$

<br>



Therefore, the estimation of the variance of $\hspace{0.05cm}$  $\widehat{\beta}_j$  $\hspace{0.05cm}$  is : 

<br>

   $$\widehat{Var}(\widehat{\beta}_j) \hspace{0.1cm} = \hspace{0.1cm} \widehat{\sigma}\hspace{0.02cm}^2 \cdot q_{jj}$$
 



<br>

Where:



$\widehat{\sigma}\hspace{0.02cm}^2 \hspace{0.1cm}$  is the estimation of the  error variance  , i.e, $\hspace{0.1cm}$ $\widehat{\sigma}\hspace{0.02cm}^2 = \widehat{Var}(\varepsilon_i)$


$q_{jj}$ $\hspace{0.05cm}$  is the element  $\hspace{0.1cm}j+1\hspace{0.1cm}$  of the principal diagonal of the matrix $\hspace{0.1cm}$ $(X^t \cdot X)^{-1}$  $\hspace{0.1cm}$ , $\forall j=0,1,...,p$



<br>

 ***¿ Why are the variance of the coefficient estimators important ?***


The standard deviation of beta coefficient estimators indicates how much
the estimations of the coefficients deviate/vary, in mean, when the model is re-trained using many different samples of the predictors and response variable.



Suppose many samples of the predictors and response are obtained, and with each of them a linear
regression model is trained. Then, we get many estimations of the model beta
coefficients, one with each sample.

Then  $\hspace{0.1cm}\sqrt{\widehat{Var}(\widehat{\beta}_j)}\hspace{0.1cm}$  indicates how much
$\hspace{0.1cm}\widehat{\beta_j}\hspace{0.1cm}$ varies, in mean, from one sample to another.



If the standard deviation is **high**, this indicates that will be obtained
big differences when $\hspace{0.1cm}\beta_j\hspace{0.1cm}$ is estimate with $\hspace{0.1cm}\widehat{\beta}_j\hspace{0.1cm}$
depending on the sample that is used for estimate it, that means
estimator $\hspace{0.1cm}\widehat{\beta}_j\hspace{0.1cm}$ is **imprecise**, because it will be much
dispersion of the values of $\hspace{0.1cm}\widehat{\beta}_j\hspace{0.1cm}$ respect to the mean.

On the contrary, if the standard deviation is **low**, this indicates that
will be obtained small differences when $\hspace{0.1cm}\beta_j\hspace{0.1cm}$ is estimate with
$\hspace{0.1cm}\widehat{\beta}_j\hspace{0.1cm}$ depending on the sample that is used for estimate it,
that means estimator $\hspace{0.1cm}\widehat{\beta}_j\hspace{0.1cm}$ is **precise**, because it will be little
dispersion of the values of $\hspace{0.1cm}\widehat{\beta}_j\hspace{0.1cm}$ respect to the mean.



$\widehat{Var}(\widehat{\beta}_j)\hspace{0.05cm}$ allow us to create a confidence interval for $\hspace{0.05cm}\widehat{\beta}_j \hspace{0.05cm}$ too



&nbsp;



 


### Estimation of beta estimators standard deviation  in `Python` <a class="anchor" id="21"></a>



```python
print(model_Py_sm.summary())
```

                                OLS Regression Results                            
    ==============================================================================
    Dep. Variable:                  price   R-squared:                       0.698
    Model:                            OLS   Adj. R-squared:                  0.697
    Method:                 Least Squares   F-statistic:                     547.4
    Date:               sá., 22 oct. 2022   Prob (F-statistic):               0.00
    Time:                        19:25:32   Log-Likelihood:                -29918.
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
    



This output give us a lot of information about the model, some of this
information has been seen (estimates coefficients), an other information
will be seen later.

Now we will focus in the part of the output where are the estimation of   coefficients estimators standard error (`std err` in Python , `Std.Error` in R).

<br>

- $\sqrt{\widehat{Var}(\widehat{\beta_0})}=2.995e+07 \\$

- $\sqrt{\widehat{Var}(\widehat{\beta}_{quality1})}=8.358e+04 \\$ 

- $\sqrt{\widehat{Var}(\widehat{\beta}_{quality2})}=1.551e+05 \\$

- $\sqrt{\widehat{Var}(\widehat{\beta}_{quality3})}= 1.976e+05 \\$

- $\sqrt{\widehat{Var}(\widehat{\beta}_{size\_in\_m\_2})}= 7.238e+02 \\$

- $\sqrt{\widehat{Var}(\widehat{\beta}_{no\_of\_bedrooms})}=8.282e+04 \\$

- $\sqrt{\widehat{Var}(\widehat{\beta}_{no\_of\_bathrooms})}=6.829e+04 \\$

- $\sqrt{\widehat{Var}(\widehat{\beta}_{latitude})}=7.809e+05 \\$

- $\sqrt{\widehat{Var}(\widehat{\beta}_{longitude})}=6.908e+05 \\$
 
  
  
   
  
<br>

The estimations of the estimators standard of the beta coefficients estimators  are, in
general, so high. This implies if we train the model with another
samples, we will get estimations of beta coefficients quite different than
the one obtained with our initial sample.

And this is a big problem, because from one sample to another are
obtained very different linear regression models, so that, very
different results with each sample.





<br>


 

## Model Predictions in `Python`

<br>

### Model Predictions in `Python` with `Statsmodels` <a class="anchor" id="23"></a>


**Option one: `smf`**


```python
model_Py_smf = smf.ols(formula = 'price ~ size_in_m_2 + no_of_bedrooms + no_of_bathrooms + quality + latitude + longitude', 
                 data =data_Python).fit()
```



**Using train data:**


```python
 model_Py_smf.predict(data_Python)
```


    0       1.781426e+06
    1       2.551625e+06
    2       2.522740e+06
    3       4.222873e+06
    4       7.851530e+05
                ...     
    1900    1.211313e+06
    1901    8.171580e+05
    1902    2.981084e+06
    1903    2.651215e+05
    1904    8.227585e+05
    Length: 1905, dtype: float64

<br>


**Using new data:**


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
      <td>100</td>
      <td>55.1</td>
      <td>25.1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
    </tr>
    <tr>
      <th>1</th>
      <td>140</td>
      <td>55.3</td>
      <td>25.2</td>
      <td>3</td>
      <td>3</td>
      <td>0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>160</td>
      <td>55.2</td>
      <td>25.1</td>
      <td>0</td>
      <td>2</td>
      <td>2</td>
    </tr>
    <tr>
      <th>3</th>
      <td>180</td>
      <td>55.1</td>
      <td>25.1</td>
      <td>2</td>
      <td>2</td>
      <td>2</td>
    </tr>
    <tr>
      <th>4</th>
      <td>98</td>
      <td>55.2</td>
      <td>25.3</td>
      <td>3</td>
      <td>1</td>
      <td>3</td>
    </tr>
  </tbody>
</table>
</div>

```python
 model_Py_smf.predict(new_data)
```

    0    1.814433e+06
    1    1.589430e+06
    2    4.766717e+06
    3    3.974348e+06
    4    1.263752e+06
    5    2.671188e+06
    6    3.425161e+06
    dtype: float64



<br>


**Option two: `sm`**


```python
model_Py_sm = sm.OLS(y , X).fit()
```

 

**Using train data:**


```python
 model_Py_sm.predict(X)
```

    0       1.781426e+06
    1       2.551625e+06
    2       2.522740e+06
    3       4.222873e+06
    4       7.851530e+05
                ...     
    1900    1.211313e+06
    1901    8.171580e+05
    1902    2.981084e+06
    1903    2.651215e+05
    1904    8.227585e+05
    Length: 1905, dtype: float64
    

**Using new data:** 


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
      <td>100</td>
      <td>55.1</td>
      <td>25.1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>1</td>
      <td>140</td>
      <td>55.3</td>
      <td>25.2</td>
      <td>3</td>
      <td>3</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>1</td>
      <td>160</td>
      <td>55.2</td>
      <td>25.1</td>
      <td>0</td>
      <td>2</td>
      <td>0</td>
      <td>1</td>
      <td>0</td>
    </tr>
    <tr>
      <th>3</th>
      <td>1</td>
      <td>180</td>
      <td>55.1</td>
      <td>25.1</td>
      <td>2</td>
      <td>2</td>
      <td>0</td>
      <td>1</td>
      <td>0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>1</td>
      <td>98</td>
      <td>55.2</td>
      <td>25.3</td>
      <td>3</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
      <td>1</td>
    </tr>
  </tbody>
</table>
</div>



```python
 model_Py_sm.predict(new_data)
```


    0    1.814433e+06
    1    1.589430e+06
    2    4.766717e+06
    3    3.974348e+06
    4    1.263752e+06
    5    2.671188e+06
    6    3.425161e+06
    dtype: float64

&nbsp;




### Model Predictions in Python with `sklearn` <a class="anchor" id="24"></a>



```python
 Model_Py_sklearn = LinearRegression().fit(X, y)
```




**Using the training data:**



```python
Model_Py_sklearn.predict(X)
```

    array([1781425.86565974, 2551624.77622508, 2522740.02878734, ...,
           2981084.40367965,  265121.52263755,  822758.48682222])



**Using new data:**



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
      <td>100</td>
      <td>55.1</td>
      <td>25.1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>1</td>
      <td>140</td>
      <td>55.3</td>
      <td>25.2</td>
      <td>3</td>
      <td>3</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>1</td>
      <td>160</td>
      <td>55.2</td>
      <td>25.1</td>
      <td>0</td>
      <td>2</td>
      <td>0</td>
      <td>1</td>
      <td>0</td>
    </tr>
    <tr>
      <th>3</th>
      <td>1</td>
      <td>180</td>
      <td>55.1</td>
      <td>25.1</td>
      <td>2</td>
      <td>2</td>
      <td>0</td>
      <td>1</td>
      <td>0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>1</td>
      <td>98</td>
      <td>55.2</td>
      <td>25.3</td>
      <td>3</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
      <td>1</td>
    </tr>
  </tbody>
</table>
</div>



```python
Model_Py_sklearn.predict(new_data)
```


    array([1814433.16412918, 1589429.86052027, 4766716.58122643,
           3974347.67547783, 1263752.19635488, 2671187.75954236,
           3425161.44111995])

<br>



 
## Estimation of model errors (residuals) in `Python` <a class="anchor" id="26"></a>



```python
predictions = pd.DataFrame( {'predictions':  model_Py_sm.predict(X)} )
```


```python
df_predictions_Python = pd.concat([y, predictions], axis=1)
df_predictions_Python.head()
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
      <th>predictions</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>2700000</td>
      <td>1.781426e+06</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2850000</td>
      <td>2.551625e+06</td>
    </tr>
    <tr>
      <th>2</th>
      <td>1150000</td>
      <td>2.522740e+06</td>
    </tr>
    <tr>
      <th>3</th>
      <td>2850000</td>
      <td>4.222873e+06</td>
    </tr>
    <tr>
      <th>4</th>
      <td>1729200</td>
      <td>7.851530e+05</td>
    </tr>
  </tbody>
</table>
</div>


```python
estimated_errors = y - model_Py_sm.predict(X)
```


```python
df_predictions_Python['estimated_errors'] = estimated_errors 

df_predictions_Python.head()
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
      <th>predictions</th>
      <th>estimated_errors</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>2700000</td>
      <td>1.781426e+06</td>
      <td>9.185741e+05</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2850000</td>
      <td>2.551625e+06</td>
      <td>2.983752e+05</td>
    </tr>
    <tr>
      <th>2</th>
      <td>1150000</td>
      <td>2.522740e+06</td>
      <td>-1.372740e+06</td>
    </tr>
    <tr>
      <th>3</th>
      <td>2850000</td>
      <td>4.222873e+06</td>
      <td>-1.372873e+06</td>
    </tr>
    <tr>
      <th>4</th>
      <td>1729200</td>
      <td>7.851530e+05</td>
      <td>9.440470e+05</td>
    </tr>
  </tbody>
</table>
</div>



<br>



## Estimation of the error variance (residual  variance) <a class="anchor" id="27"></a>




The estimator of the error variance $\hspace{0.1cm} Var(\varepsilon_i)=\sigma^2 \hspace{0.1cm}$ is
called **residual variance**, and is defined as:

<br>

$$
 \widehat{Var}(\varepsilon_i) \hspace{0.1cm} =\hspace{0.1cm} \widehat{\sigma}^2 \hspace{0.1cm}=\hspace{0.1cm} S_R^2 \hspace{0.1cm}=\hspace{0.1cm} \dfrac{1}{n-p-1} \cdot \sum_{i=1}^{n} \hat{\varepsilon}_i\hspace{0.02cm}^2 \hspace{0.1cm}=\hspace{0.1cm}  \dfrac{1}{n-p-1} \cdot (Y^t \cdot Y - \hat{\beta}^t \cdot X^t \cdot Y)
$$


<br>

The following is fulfilled:

<br>

- $\hspace{0.3cm} \dfrac{n-p-1}{\sigma^2} \cdot \widehat{\sigma}^2 \hspace{0.1cm} \sim \hspace{0.1cm} \chi_{n-p-1}^2 \\[0.3cm]$

- $\hspace{0.3cm} E[\widehat{\sigma}^2]=\sigma^2 \\[0.3cm]$


- $\hspace{0.3cm} Var(\widehat{\sigma}^2)=\dfrac{2 \cdot \sigma^4}{n-p-1}$




&nbsp;





### Estimation of the error variance in `R` <a class="anchor" id="28"></a>



```r
%%R

n<- length(estimated_errors)
p<-6

( estimated_variance_error <- sum(estimated_errors^2)/(n-p-1) )
```
     
     [1] 2.572224e+12

```r
%%R

( estimated_standard_deviation_error <- sqrt(estimated_variance_error) )
```

    [1] 1603816

&nbsp;




### Estimation of the error variance in `Python` <a class="anchor" id="29"></a>



```python
n = len(data_Python)
p = 6
```


```python
estimated_variance_error = sum(df_predictions_Python['estimated_errors']**2)/(n-p-1) 

estimated_variance_error
```


    2572224474734.977

```python
import math

estimated_standard_deviation_error = math.sqrt(estimated_variance_error)
estimated_standard_deviation_error
```

    1603815.598731655



&nbsp;




# Model Train Validation <a class="anchor" id="30"></a>


We can compute some metric in order to measure how much distant are the
predictions and observations of the response variable.

Two of the most common metrics are the mean absolute deviation (MAD) and the mean square error (MSE):

<br>

$$
MAD \hspace{0.1cm} = \hspace{0.1cm}   \dfrac{1}{n} \sum_{i=1}^{n} \mid \hat{\varepsilon}_i \mid \hspace{0.1cm} = \hspace{0.1cm} \dfrac{1}{n} \sum_{i=1}^{n} \hspace{0.1cm} \mid y_i - \hat{y}_i \mid \hspace{0.1cm} = \hspace{0.1cm} \dfrac{1}{n} \sum_{i=1}^{n} \hspace{0.1cm}\mid   y_i - x_i \cdot \widehat{\beta}  \mid 
$$

<br>

$$
MSE \hspace{0.1cm} = \hspace{0.1cm} \dfrac{1}{n} \sum_{i=1}^{n} \hat{\varepsilon}_i^2 \hspace{0.1cm} =\hspace{0.1cm} \dfrac{1}{n} \sum_{i=1}^{n} \hspace{0.1cm}(\hspace{0.1cm} y_i - \hat{y}_i \hspace{0.1cm})^2 = \dfrac{1}{n} \sum_{i=1}^{n} \hspace{0.1cm}(\hspace{0.1cm} y_i - x_i \cdot \widehat{\beta} \hspace{0.1cm})^2
$$ 

<br>

When these metrics are computing using the data for $y_i$ and $x_i$ that were used to train the model it is called  *model train validation*.



&nbsp;



 

## Model Train Validation in `Python`  <a class="anchor" id="32"></a>


```python
MAD_Py = ( (y - model_Py_sm.predict(X)).abs() ).mean()
MAD_Py
```

    938065.2280944855
    

```python
MSE_Py = ( (y - model_Py_sm.predict(X))**2 ).mean()
MSE_Py
```

    2562772731258.2646



In mean, the predictions that the model made of the response variable
deviates from the observations, in absolute value, in 938065 units.

This is an estimation of model error, but training error, because we
have used the predictions of the response variables made by the model
using the observations with which it has been trained.

There is a more interesting model error, called test error, that is
computed with predictors observations which haven´t been used to train
the model.

In this article, we will not go deeper into that, but this concepts will
be more developed in another article about validation techniques.






&nbsp;




# Model Coefficients Interpretation <a class="anchor" id="33"></a>


<br>

## Null Coefficient <a class="anchor" id="34"></a>


We have the following estimated linear regression model: 

  $$\widehat{y}_i= \widehat{\beta}_0 + \widehat{\beta}_0\cdot x_{i1} + ...+ \widehat{\beta}_p\cdot x_{ip}$$


<br>

- $\widehat{\beta}_0$ $\hspace{0.05cm}$ is the model estimated value for the response variable, i.e $\hspace{0.05cm}$  $\widehat{y}_i$ $\hspace{0.05cm}$
, when $\hspace{0.05cm}$ $x_{ij}=0$ $\hspace{0.05cm}$ , $\forall j=1,2,...,p$




<br>



##  Quantitative Predictor Coefficient <a class="anchor" id="35"></a>



Let $\hspace{0.05cm} X_k \hspace{0.05cm}$ a **quantitative** variable and $\hspace{0.05cm}$ $h>0$

We have the following estimated linear regression model  

<br>

$$\widehat{y}_i= \widehat{\beta}_0 + \widehat{\beta}_1\cdot x_{i1} + .. + \widehat{\beta}_k\cdot x_{ik} + ..+ \widehat{\beta}_p\cdot x_{ip}$$

<br>


-   If $\hspace{0.1cm} \widehat{\beta}_k > 0 \hspace{0.1cm}$  , then

    -   If  $\hspace{0.1cm} x_{ik} \hspace{0.1cm}$  **increases** in $\hspace{0.1cm}h\hspace{0.15cm}$ $x_k$-units $\hspace{0.05cm}$  $\Rightarrow$  $\hspace{0.05cm}$ $\widehat{y}_i\hspace{0.1cm}$
        **increases** in $\hspace{0.05cm}$ $\widehat{\beta}_k \cdot h$  $\hspace{0.15cm}$ $y$-units.
        
        And the opposite if it decreases.
        

<br>

-   If  $\hspace{0.1cm} \widehat{\beta}_k < 0 \hspace{0.1cm}$  , then

    -  If $\hspace{0.1cm}x_{ik}\hspace{0.1cm}$ **increases** in $\hspace{0.1cm}h\hspace{0.15cm}$ $x_k$-units $\hspace{0.05cm}$ $\Rightarrow$ $\hspace{0.05cm}$  $\widehat{y}_i$
        **decreases** in $\hspace{0.05cm}$ $\widehat{\beta}_k \cdot h$ $\hspace{0.15cm}$ $y$-units. 

        And the opposite if it decreases.

<br>


-   If  $\hspace{0.1cm} \widehat{\beta}_k = 0 \hspace{0.1cm}$  , then

    -   $\widehat{y}_i$ $\hspace{0.05cm}$ doesn't depend on $\hspace{0.05cm}$  $x_{ik}$


<br>

**Observation:**


The above affirmations are based in the following:

- $(\hat{y}_i \hspace{0.05cm} | \hspace{0.05cm} x_{ik}=c+h ) - (\hat{y}_i  \hspace{0.05cm} | \hspace{0.05cm}  x_{ik}=c ) \hspace{0.15cm}=\hspace{0.15cm}  \widehat{\beta}_k\cdot h$


<br>

### Interpretation of coefficients and units of measurement

In the previous section $\hspace{0.15cm} y$-units refers to the unit of measure of the response variable $Y$, and $\hspace{0.15cm} x_k$-units refers to the unit of measure of the predictor $X_k$


Let's show why
 $\hspace{0.15cm}\widehat{\beta}_k\cdot h\hspace{0.15cm}$ is measured in $\hspace{0.15cm} y$-units . Which is a fundamental property for the interpretation of the beta coefficients in the linear regression model.

<br>

Suppose we have the following estimated model:

$$\widehat{y}_i = \widehat{\beta}_0 + \widehat{\beta}_1\cdot x_{i1} + .. + \widehat{\beta}_k\cdot x_{ik} + .. + \widehat{\beta}_p\cdot x_{ip}$$

<br>

Now consider the following:

$\hspace{0.5cm}\widehat{y}_i \hspace{0.15cm}$ is measured in $\hspace{0.15cm}y$-units

$\hspace{0.5cm}x_{ik} \hspace{0.15cm}$ is measured in $\hspace{0.15cm}x_k$-units

<br>

Then you have to:

$\hspace{0.5cm}\widehat{\beta}_k \hspace{0.15cm}$ is measured in $\hspace{0.15cm}\dfrac{y\text{-units}}{x_k\text{-units} }\hspace{0.25cm}$ (fundamental property)

<br>

Therefore you will have to:

$\hspace{0.5cm}\widehat{\beta}_k \cdot x_{ik}\hspace{0.15cm}$ is measured in $\hspace{0.15cm}\dfrac{y\text{-units}}{x_k \text{-units}} \cdot x_k\text{-units} \hspace{0.15cm}= \hspace{0.15cm} y\text{-units}$

<br>

Which implies that if $h$ is measured in $\hspace{0.15cm}x_k$-units then:

$\hspace{0.5cm}\widehat{\beta}_k \cdot h\hspace{0.15cm}$ is measured in $\hspace{0.15cm} and\text{-units}$

And this is what allows us to interpret 
$\hspace{0.15cm}(\hat{y}_i \hspace{0.05cm} | \hspace{0.05cm} x_{ik}=c+h ) - (\hat{y} _i \hspace{0.05cm} | \hspace{0.05cm} x_{ik}=c ) \hspace{0.15cm}=\hspace{0.15cm} \widehat{\beta}_k\cdot h\hspace{0.15cm}$   as the number of $\hspace{0.15cm}y$-units by which the estimated response increases or decreases $\hspace{0.15cm}\hat{y}_i\hspace{0.15cm}$ when the value of the predictor $\hspace{0.15cm}x_k\hspace{0.15cm}$ increases by $h$ $\hspace{0.15cm}x_k$-units.





<br>



## Categorical Predictor Coefficient <a class="anchor" id="36"></a>




### Categorical Predictors with 2 categories



Let $\hspace{0.1cm} X_k \hspace{0.1cm}$ a categorical variable with 2 categories 
$\hspace{0.1cm} \lbrace 0 , 1 \rbrace$,

If the reference category is  $\hspace{0.1cm} 0 \hspace{0.1cm}$  , then  $\hspace{0.1cm} X_k \hspace{0.1cm}$ enter in the model as the binary  variable $\hspace{0.1cm} X_{k1} \hspace{0.1cm}$ defined as:

$$
x_{i k1}=1  \hspace{0.05cm} \Leftrightarrow \hspace{0.05cm}  x_{i k}=1 
$$

<br>

In addition, we define the variable $X_{k0}$ as:

$$
x_{i k0}=1  \hspace{0.05cm} \Leftrightarrow \hspace{0.05cm}  x_{i k}=0 
$$

<br>

----

We have the following estimated linear regression model:

$$\hat{y}_i= \widehat{\beta_0} + \widehat{\beta_0}\cdot x_{i1} + .. + \widehat{\beta}_{k1} \cdot x_{ik1} + ..+ \widehat{\beta_p}\cdot x_{ip}$$

<br>

-   If $\widehat{\beta}_{k1} > 0$ , then



    -   $\widehat{y}_i$ $\hspace{0.05cm}$ is $\hspace{0.05cm}$ $\widehat{\beta}_{k1}$ $\hspace{0.05cm}$ units **greater** if  $\hspace{0.05cm}$ $x_{ik}=1$ $\hspace{0.05cm}$ than if $\hspace{0.05cm}$ $x_{ik}= 0$

<br>

-   If $\widehat{\beta}_{k1} < 0$ , then

    -   $\hat{y}_i$ $\hspace{0.05cm}$ is $\hspace{0.05cm}$ $\widehat{\beta}_{k1}$ $\hspace{0.05cm}$ units **less** if $\hspace{0.05cm}$  $x_{ik}= 1$ $\hspace{0.05cm}$ than if $\hspace{0.05cm}$ $x_{ik}=0$

<br>

**Observation:**


The above affirmations are based in the following:

- $(\hat{y}_i \hspace{0.05cm} | \hspace{0.05cm} x_{ik1}=1 ) - (\hat{y}_i  \hspace{0.05cm} | \hspace{0.05cm}  x_{ik1}=0 ) =  \widehat{\beta}_{k1}$




&nbsp;


### Categorical Predictors with 3 categories:



Let $\hspace{0.1cm} X_k \hspace{0.1cm}$ a categorical variable with 3 categories
$\hspace{0.1cm} \lbrace 0 , 1, 2 \rbrace$,

If the reference category is $\hspace{0.1cm}0\hspace{0.1cm}$, then $\hspace{0.1cm}X_k\hspace{0.1cm}$ enter in the model with
two binary $\hspace{0.1cm}\lbrace 0,1\rbrace\hspace{0.1cm}$ variables $\hspace{0.1cm}X_{k1}\hspace{0.1cm}$ and $\hspace{0.1cm}X_{k2}\hspace{0.1cm}$ defined as:

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

----

We have the following estimated linear regression model:

$$\widehat{y}_i= \widehat{\beta}_0 + \widehat{\beta}_0\cdot x_{i1} + .. + \widehat{\beta}_{k1} \cdot x_{ik1} + \widehat{\beta}_{k2} \cdot x_{ik2} + ..+ \widehat{\beta}_p\cdot x_{ip}$$

<br>

-   If  $\hspace{0.1cm}\widehat{\beta}_{k1} > 0\hspace{0.1cm}$  , then

    -  $\hspace{0.1cm} \hat{y}_i$ $\hspace{0.05cm}$  is $\hspace{0.05cm}$ $\widehat{\beta}_{k1}$ $\hspace{0.05cm}$ units **greater** if $\hspace{0.05cm}$ $x_{ik}= 1$ $\hspace{0.05cm}$  than if  $\hspace{0.05cm}$ $x_{ik}= 0$

<br>

-   If  $\hspace{0.1cm}\widehat{\beta}_{k1} < 0\hspace{0.1cm}$  , then

    -   $\hspace{0.1cm} \hat{y}_i$ $\hspace{0.05cm}$ is $\hspace{0.05cm}$ $\widehat{\beta}_{k1}$ $\hspace{0.05cm}$ units **less** if $\hspace{0.05cm}$  $x_{ik}= 1$ $\hspace{0.05cm}$ than if $\hspace{0.05cm}$ $x_{ik}= 0$

<br>

-   If $\hspace{0.1cm}\widehat{\beta}_{k2} > 0\hspace{0.1cm}$ , then

    -   $\hspace{0.1cm} \hat{y}_i$ $\hspace{0.05cm}$  is $\hspace{0.05cm}$ $\widehat{\beta}_{k2}$ $\hspace{0.05cm}$ units **greater** if $\hspace{0.05cm}$  $x_{ik}= 1$  $\hspace{0.05cm}$ than if $\hspace{0.05cm}$ $x_{ik}= 0$

<br>

-   If $\hspace{0.1cm}\widehat{\beta}_{k2} < 0\hspace{0.1cm}$  , then 

    -  $\hspace{0.1cm} \hat{y}_i$ $\hspace{0.05cm}$ is $\hspace{0.05cm}$ $\widehat{\beta}_{k2}$ $\hspace{0.05cm}$ units **less** if  $\hspace{0.05cm}$ $x_{ik}= 1$ $\hspace{0.05cm}$ than if $\hspace{0.05cm}$ $x_{ik}= 0$

<br>

-   If  $\hspace{0.1cm}\widehat{\beta}_{k2} - \widehat{\beta}_{k1} > 0\hspace{0.1cm}$ , then

    -   $\hspace{0.1cm} \hat{y}_i$ $\hspace{0.05cm}$ is $\hspace{0.05cm}$ $\widehat{\beta}_{k2} - \widehat{\beta}_{k1}$  $\hspace{0.05cm}$ units  **greater** if $\hspace{0.05cm}$ $x_{ik}= 2$ $\hspace{0.05cm}$ than if $\hspace{0.05cm}$ $x_{ik}= 1$

<br>

-   If  $\hspace{0.1cm}\hat{\beta}_{k2} - \widehat{\beta}_{k1} < 0\hspace{0.1cm}$  , then

    -   $\hspace{0.1cm} \hat{y}_i$ $\hspace{0.05cm}$ is $\hspace{0.1cm}$ $\widehat{\beta}_{k2} - \widehat{\beta}_{k1}$ $\hspace{0.1cm}$ units
        **less** if $\hspace{0.05cm}$ $x_{ik}= 2$ $\hspace{0.05cm}$ than if $\hspace{0.05cm}$ $x_{ik}= 1$

<br>

Note that the above is easily extrapolated to the case in which we have a
categorical predictor with $r$ categories, for $r>3$.

<br>

**Observation:**


The above affirmations are based in the following:

- $(\hat{y}_i \hspace{0.05cm} | \hspace{0.05cm} x_{ik1}=1 ) - (\hat{y}_i  \hspace{0.05cm} | \hspace{0.05cm}  x_{ik0}=1 ) =  \widehat{\beta}_{k1}$

- $(\hat{y}_i \hspace{0.05cm} | \hspace{0.05cm} x_{ik2}=1 ) - (\hat{y}_i  \hspace{0.05cm} | \hspace{0.05cm}  x_{ik0}=1 ) =  \widehat{\beta}_{k2}$
  
- $(\hat{y}_i \hspace{0.05cm} | \hspace{0.05cm} x_{ik2}=1 ) - (\hat{y}_i  \hspace{0.05cm} | \hspace{0.05cm}  x_{ik1}=1 ) =  \widehat{\beta}_{k2} - \widehat{\beta}_{k1}$



Note that this can easily be extrapolated to the case of  an $r$-ary categorical variable  with $r > 3$



&nbsp;





## Example of coefficient interpretation <a class="anchor" id="37"></a>

We had obtained the following estimated model:


\begin{gather*}
\widehat{price}_i =  -6.207e+07 +  3.566e+04 \cdot size\_in\_m\_2_i -8.367e+05 \cdot no\_of\_bedrooms_i -5.712e+04 \cdot no\_of\_bathrooms_i + \\ 1.4e+05 \cdot quality1_i + 3.406e+05\cdot quality2_i + 2.788e+05  \cdot quality3_i  +6.115e+06\cdot  latitude_i -1.677e+06   \cdot longitude_i 
\end{gather*}



The interpretation of the estimated model coefficients is the following:

<br>

-   $\widehat{\beta}_0 = -6.207e+07 \hspace{0.1cm}$   is the estimated  $\hspace{0.1cm}price\hspace{0.1cm}$  by the model for the  houses with $\hspace{0.1cm}size\_in\_m\_2_i =0\hspace{0.1cm}$  ,  $\hspace{0.1cm}no\_of\_bedrooms_i =0\hspace{0.1cm}$  ,  $\hspace{0.1cm}no\_of\_bathrooms_i =0\hspace{0.1cm}$  ,   $qualityLow_i=0$ ,   $\hspace{0.1cm}qualityMedium_i=0\hspace{0.1cm}$  ,  $\hspace{0.1cm}qualityUltra_i=0\hspace{0.1cm}$  ,  $\hspace{0.1cm}latitude_i=longitude_i=0$

<br>

-   $\widehat{\beta}_{size\_in\_m\_2} =3.566e+04\hspace{0.15cm}$   $\Rightarrow\hspace{0.15cm}$   if
    $\hspace{0.1cm}size\_in\_m\_2_i\hspace{0.1cm}$ increases in $\hspace{0.1cm}h\hspace{0.1cm}$ units, the estimated housing
    $\hspace{0.1cm}price\hspace{0.1cm}$ **increases** in  $\hspace{0.1cm}h\cdot 3.566e+04\hspace{0.15cm}$  units.

<br>

-   $\widehat{\beta}_{no\_of\_bedrooms} = -8.367e+05$   $\hspace{0.15cm}\Rightarrow\hspace{0.15cm}$   if
    $\hspace{0.15cm}no\_of\_bedrooms_i\hspace{0.15cm}$ increases in  $\hspace{0.15cm}h\hspace{0.15cm}$  units, the estimated housing
    $\hspace{0.15cm}price\hspace{0.15cm}$ **decreases** in  $\hspace{0.15cm}-h\cdot 8.367e+05\hspace{0.15cm}$  units.

<br>

-   $\widehat{\beta}_{no\_of\_bathrooms} = -5.712e+04$   $\hspace{0.15cm}\Rightarrow\hspace{0.15cm}$   if
    $\hspace{0.15cm}no\_of\_bathrooms_i\hspace{0.15cm}$ increases in  $h$  units, the estimated housing
    $price$ **decreases** in  $\hspace{0.15cm}-h\cdot 5.712e+04\hspace{0.15cm}$  units.

<br>

-   $\widehat{\beta}_{quality1} = 1.4e+05$   $\hspace{0.15cm}\Rightarrow\hspace{0.15cm}$    the estimated
    $price$ of houses with medium quality  $(quality1_i=1)$  is  $1.4e+05$   units **greater** than the estimated price of houses with low quality
    $\hspace{0.15cm}(quality0_i=1)\hspace{0.15cm}$ , because low quality is the reference category  of $\hspace{0.15cm}quality\hspace{0.15cm}$ 

<br>

-   $\widehat{\beta}_{quality2} = 3.406e+05$  $\hspace{0.15cm}\Rightarrow\hspace{0.15cm}$    the
    estimated $price$ of houses with medium quality 
    $\hspace{0.15cm}(quality2_i=1)\hspace{0.15cm}$  is  $\hspace{0.15cm}3.406e+05\hspace{0.15cm}$ units **greater** than the estimated
    price of houses with high quality  $\hspace{0.15cm}(quality0_i=1)$  

<br>

-   $\widehat{\beta}_{quality3} = 2.788e+05$   $\hspace{0.15cm}\Rightarrow\hspace{0.15cm}$     the estimated
    $\hspace{0.15cm}price\hspace{0.15cm}$ of houses with ultra quality  $\hspace{0.15cm}(quality1_i=1)\hspace{0.15cm}$   is
  $\hspace{0.15cm}2.788e+05\hspace{0.15cm}$  units **greater** than the estimated price of houses with low quality  $\hspace{0.15cm}(quality0_i=1)$ 

<br>

-    $\widehat{\beta}_{quality2} - \widehat{\beta}_{quality1} = 3.406e+05  - 1.4e+05    =2.006e+05$     $\hspace{0.15cm}\Rightarrow\hspace{0.15cm}$   the estimated price of houses  with high    quality  $\hspace{0.15cm}(quality2_i=1)\hspace{0.15cm}$   is  $\hspace{0.15cm}2.006e+05\hspace{0.15cm}$ units **greater**   than the estimated price of houses with medium quality  $\hspace{0.15cm}(quality1_i=1)$ 

<br>

-  $\widehat{\beta}_{quality3} - \widehat{\beta}_{quality2} = 2.788e+05   - 3.406e+05 =-61800$     $\hspace{0.15cm}\Rightarrow\hspace{0.15cm}$  the estimated price of houses  with ultra quality  $\hspace{0.15cm}(quality3_i=1)\hspace{0.15cm}$   is  $\hspace{0.15cm}61800\hspace{0.15cm}$ units **less**   than the estimated price of houses with high quality  $\hspace{0.15cm}(quality2_i=1)$ 

<br>

Note that in all these cases it's assumed that the rest of the model variables don't vary (have the same values) from one scenario to another.





<br>

## Interaction  Coefficient <a class="anchor" id="38"></a>



### Interaction  between binary and quantitative variables

Let $X_k$ a **quantitative** variable, and $X_r$ a **binary** $\lbrace 0, 1\rbrace$ categorical variable.

If the reference category is  $0$  , then  $X_r$ enter in the model as the binary $\lbrace 0, 1\rbrace$ variable $X_{r1}$ defined as:

$$
x_{i r1}=1  \hspace{0.05cm} \Leftrightarrow \hspace{0.05cm}  x_{i r}=1
$$

<br>

In addition, we define the variable $X_{r0}$ as:

$$
x_{i r0}=1  \hspace{0.05cm} \Leftrightarrow \hspace{0.05cm}  x_{i r}=0 
$$

<br>

We have the following estimated linear regression model:


$$\widehat{y}_i= \widehat{\beta_0} + \widehat{\beta}_0\cdot x_{i1} + ... + \widehat{\beta}_p\cdot x_{ip} + \widehat{\beta}_{r1}\cdot x_{ir1} + \widehat{\beta}_{k}\cdot x_{ik} + \widehat{\beta}_{r1k}\cdot x_{ir1}\cdot x_{ik}  $$


<br> 


-   If  $\hspace{0.05cm} \widehat{\beta}_{r1} + \widehat{\beta}_{r1k}\cdot x_{ki} \hspace{0.05cm} > \hspace{0.05cm} 0$  , then

    -  $\widehat{y}_i$ $\hspace{0.05cm}$  is $\hspace{0.05cm}$ $\hspace{0.05cm} \widehat{\beta}_{r1} + \widehat{\beta}_{r1k}\cdot x_{ki} \hspace{0.05cm}$ $\hspace{0.05cm}$ units **greater** if $\hspace{0.05cm}$ $x_{ir}= 1$ $\hspace{0.05cm}$  than if  $\hspace{0.05cm}$ $x_{ir}= 0$

<br>

-   If  $\hspace{0.05cm} \widehat{\beta}_{r1} + \widehat{\beta}_{r1k}\cdot x_{ki} \hspace{0.05cm} < \hspace{0.05cm} 0$  , then

    -  $\widehat{y}_i$ $\hspace{0.05cm}$  is $\hspace{0.05cm}$ $\hspace{0.05cm} \widehat{\beta}_{r1} + \widehat{\beta}_{r1k}\cdot x_{ki} \hspace{0.05cm}$ $\hspace{0.05cm}$ units **less** if $\hspace{0.05cm}$ $x_{ir}= 1$ $\hspace{0.05cm}$  than if  $\hspace{0.05cm}$ $x_{ir}= 0$
    
<br>

Note these magnitudes depend on $x_{ik}$ value, because we have set an interaction between $X_k$ and $X_r$ in the model.

<br> 

**Observation:**

The above affirmations are based in the following:

$(\hat{y}_i \hspace{0.05cm} | \hspace{0.05cm} x_{ir1}=1 ) - (\widehat{y}_i  \hspace{0.05cm} | \hspace{0.05cm}  x_{ir0}=1 ) =  \widehat{\beta}_{r1} + \widehat{\beta}_{r1k}\cdot x_{ik}$




<br>


### Interaction  between ternary and quantitative variables

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

$$\widehat{y}_i= \widehat{\beta_0} + \widehat{\beta_0}\cdot x_{i1} + ... + \widehat{\beta_p}\cdot x_{ip}  + \widehat{\beta}_{k}\cdot x_{ik} + \widehat{\beta}_{r1}\cdot x_{ir1} + \widehat{\beta}_{r2}\cdot x_{ir2} + \widehat{\beta}_{r1k}\cdot x_{ir1}\cdot x_{ik} + \widehat{\beta}_{r2 k}\cdot x_{ir2}\cdot x_{ik} $$

<br>

-   If  $\hspace{0.05cm} \widehat{\beta}_{r1} + \widehat{\beta}_{r1k}\cdot x_{ki} \hspace{0.05cm} > \hspace{0.05cm} 0$  , then

    -  $\widehat{y}_i$ $\hspace{0.05cm}$  is $\hspace{0.05cm}$ $\hspace{0.05cm} \widehat{\beta}_{r1} + \widehat{\beta}_{r1k}\cdot x_{ki} \hspace{0.05cm}$ $\hspace{0.05cm}$ units **greater** if $\hspace{0.05cm}$ $x_{ir}= 1$ $\hspace{0.05cm}$  than if  $\hspace{0.05cm}$ $x_{ir}= 0$

<br>

-   If  $\hspace{0.05cm} \widehat{\beta}_{r1} + \widehat{\beta}_{r1k}\cdot x_{ki} \hspace{0.05cm} < \hspace{0.05cm} 0$  , then

    -  $\widehat{y}_i$ $\hspace{0.05cm}$  is $\hspace{0.05cm}$ $\hspace{0.05cm} \widehat{\beta}_{r1} + \widehat{\beta}_{r1k}\cdot x_{ki} \hspace{0.05cm}$ $\hspace{0.05cm}$ units **less** if $\hspace{0.05cm}$ $x_{ir}= 1$ $\hspace{0.05cm}$  than if  $\hspace{0.05cm}$ $x_{ir}= 0$

<br>

-   If  $\hspace{0.05cm} \widehat{\beta}_{r2} + \widehat{\beta}_{r2k}\cdot x_{ki} \hspace{0.05cm} > \hspace{0.05cm} 0$  , then

    -  $\widehat{y}_i$ $\hspace{0.05cm}$  is $\hspace{0.05cm}$ $\hspace{0.05cm} \widehat{\beta}_{r2} + \widehat{\beta}_{r2k}\cdot x_{ki} \hspace{0.05cm}$ $\hspace{0.05cm}$ units **greater** if $\hspace{0.05cm}$ $x_{ir}= 2$ $\hspace{0.05cm}$  than if  $\hspace{0.05cm}$ $x_{ir}= 0$

<br>

-   If  $\hspace{0.05cm} \widehat{\beta}_{r2} + \widehat{\beta}_{r2k}\cdot x_{ki} \hspace{0.05cm} < \hspace{0.05cm} 0$  , then

    -  $\widehat{y}_i$ $\hspace{0.05cm}$  is $\hspace{0.05cm}$ $\hspace{0.05cm} \widehat{\beta}_{r2} + \widehat{\beta}_{r2k}\cdot x_{ki} \hspace{0.05cm}$ $\hspace{0.05cm}$ units **less** if $\hspace{0.05cm}$ $x_{ir}= 2$ $\hspace{0.05cm}$  than if  $\hspace{0.05cm}$ $x_{ir}= 0$

<br>


-   If  $\hspace{0.05cm} (\widehat{\beta}_{r2} - \widehat{\beta}_{r1} ) + (\widehat{\beta}_{r2k} - \widehat{\beta}_{r1k})\cdot x_{ki} \hspace{0.05cm} > \hspace{0.05cm} 0$  , then

    -  $\widehat{y}_i$ $\hspace{0.05cm}$  is $\hspace{0.05cm}$ $\hspace{0.05cm} (\widehat{\beta}_{r2} - \widehat{\beta}_{r1} ) + (\widehat{\beta}_{r2k} - \widehat{\beta}_{r1k})\cdot x_{ki} \hspace{0.05cm}$ $\hspace{0.05cm}$ units **greater** if $\hspace{0.05cm}$ $x_{ir}= 2$ $\hspace{0.05cm}$  than if  $\hspace{0.05cm}$ $x_{ir}= 1$

<br>

-   If  $\hspace{0.05cm} (\widehat{\beta}_{r2} - \widehat{\beta}_{r1} ) + (\widehat{\beta}_{r2k} - \widehat{\beta}_{r1k})\cdot x_{ki} \hspace{0.05cm} < \hspace{0.05cm} 0$  , then

    -  $\widehat{y}_i$ $\hspace{0.05cm}$  is $\hspace{0.05cm}$ $\hspace{0.05cm} (\widehat{\beta}_{r2} - \widehat{\beta}_{r1} ) + (\widehat{\beta}_{r2k} - \widehat{\beta}_{r1k})\cdot x_{ki} \hspace{0.05cm}$ $\hspace{0.05cm}$ units **less** if $\hspace{0.05cm}$ $x_{ir}= 2$ $\hspace{0.05cm}$  than if  $\hspace{0.05cm}$ $x_{ir}= 1$

<br>

Note these magnitudes depend on $x_{ik}$ value, because we have set an interaction between $X_k$ and $X_r$ in the model.





**Observation:**

The above affirmations are based in the following:

- $(\widehat{y}_i \hspace{0.05cm} | \hspace{0.05cm} x_{ir1}=1 ) - (\widehat{y}_i  \hspace{0.05cm} | \hspace{0.05cm}  x_{ir0}=1 ) =  \widehat{\beta}_{r1} + \widehat{\beta}_{r1k}\cdot x_{ik}$

- $(\widehat{y}_i \hspace{0.05cm} | \hspace{0.05cm} x_{ir2}=1 ) - (\widehat{y}_i  \hspace{0.05cm} | \hspace{0.05cm}  x_{ir0}=1 ) =  \widehat{\beta}_{r2} + \widehat{\beta}_{r2k}\cdot x_{ik}$

- $(\widehat{y}_i \hspace{0.05cm} | \hspace{0.05cm} x_{ir2}=1 ) - (\widehat{y}_i  \hspace{0.05cm} | \hspace{0.05cm}  x_{ir1}=1 ) =  (\widehat{\beta}_{r2} - \widehat{\beta}_{r1} ) + (\widehat{\beta}_{r2k} - \widehat{\beta}_{r1k})\cdot x_{ki}$





Note that this can easily be extrapolated to the case of interaction between an $r$-ary categorical variable and a quantitative variable, for $r>3$.



<br>



## Example of interaction coefficient interpretation <a class="anchor" id="39"></a>



```python
model_Python_2 = smf.ols(formula = 'price ~  quality*size_in_m_2 + no_of_bedrooms + no_of_bathrooms + latitude + longitude', 
                               data =data_Python)

model_Python_2 = model_Python_2.fit()
 
print(model_Python_2.summary())
```


                                OLS Regression Results                            
    ==============================================================================
    Dep. Variable:                  price   R-squared:                       0.709
    Model:                            OLS   Adj. R-squared:                  0.708
    Method:                 Least Squares   F-statistic:                     420.2
    Date:               sá., 22 oct. 2022   Prob (F-statistic):               0.00
    Time:                        19:26:11   Log-Likelihood:                -29881.
    No. Observations:                1905   AIC:                         5.979e+04
    Df Residuals:                    1893   BIC:                         5.985e+04
    Df Model:                          11                                         
    Covariance Type:            nonrobust                                         
    ============================================================================================
                                   coef    std err          t      P>|t|      [0.025      0.975]
    --------------------------------------------------------------------------------------------
    Intercept                -5.446e+07   2.94e+07     -1.852      0.064   -1.12e+08    3.21e+06
    quality[T.1]             -2.353e+05   1.66e+05     -1.418      0.156   -5.61e+05    9.02e+04
    quality[T.2]             -1.373e+06   2.64e+05     -5.211      0.000   -1.89e+06   -8.56e+05
    quality[T.3]              1.318e+06   5.24e+05      2.518      0.012    2.91e+05    2.34e+06
    size_in_m_2               3.163e+04   1150.872     27.479      0.000    2.94e+04    3.39e+04
    quality[T.1]:size_in_m_2  2908.2719   1105.752      2.630      0.009     739.652    5076.892
    quality[T.2]:size_in_m_2  1.208e+04   1534.808      7.868      0.000    9065.709    1.51e+04
    quality[T.3]:size_in_m_2 -1.145e+04   4817.305     -2.377      0.018   -2.09e+04   -2004.309
    no_of_bedrooms           -7.859e+05   8.16e+04     -9.636      0.000   -9.46e+05   -6.26e+05
    no_of_bathrooms          -4.202e+04   6.71e+04     -0.626      0.531   -1.74e+05    8.96e+04
    latitude                  6.219e+06   7.67e+05      8.105      0.000    4.71e+06    7.72e+06
    longitude                -1.855e+06   6.79e+05     -2.734      0.006   -3.19e+06   -5.24e+05
    ==============================================================================
    Omnibus:                      880.561   Durbin-Watson:                   1.694
    Prob(Omnibus):                  0.000   Jarque-Bera (JB):            31738.629
    Skew:                           1.504   Prob(JB):                         0.00
    Kurtosis:                      22.769   Cond. No.                     1.59e+05
    ==============================================================================
    
    Notes:
    [1] Standard Errors assume that the covariance matrix of the errors is correctly specified.
    [2] The condition number is large, 1.59e+05. This might indicate that there are
    strong multicollinearity or other numerical problems.
    



<br>

We have got the following:

<br>

 - $\left( \widehat{price}_i | quality1_i=1 \right) - \left(\widehat{price}_i | quality0_i=1 \right) = \hat{\beta}_{quality1} + \hat{\beta}_{quality1:size\_in\_m\_2} \cdot size\_in\_m\_2_i = -2.353\cdot 10^5 + 2908.2719  \cdot size\_in\_m\_2_i$  

This magnitude depends on the value of $\hspace{0.1cm} size\_in\_m\_2_i$

<br>

For example if $size\_in\_m\_2_i = 100$ , then:

$\left( \widehat{price}_i | quality1_i=1 \right) - \left(\widehat{price}_i | quality0_i=1 \right) = 55527.19$

So the estimated price of a 100 $m^2$ house is 55527.19 units greater if $\hspace{0.1cm} quality1_i=1 \hspace{0.1cm}$ (it has medium quality) than $quality0_i=1$ (it has low quality)



<br>


- $\left( \widehat{price}_i | quality2_i=1 \right) - \left(\widehat{price}_i | quality0_i=1 \right) = \hat{\beta}_{quality2} + \hat{\beta}_{quality2:size\_in\_m\_2} \cdot size\_in\_m\_2_i  = -1.373\cdot 10^6 + 1.208\cdot 10^4  \cdot size\_in\_m\_2_i$  

This magnitude depends on the value of $\hspace{0.1cm} size\_in\_m\_2_i$

<br>

For example if $\hspace{0.1cm}size\_in\_m\_2_i = 100\hspace{0.1cm}$ , then:

$\left( \widehat{price}_i | quality2_i=1 \right) - \left(\widehat{price}_i | quality0_i=1 \right) = 55527.19$

So the estimated price of a 100 $\hspace{0.1cm}m^2\hspace{0.1cm}$ house is 165000 units less if $\hspace{0.1cm}quality2_i=1\hspace{0.1cm}$ (it has high quality) than $\hspace{0.1cm}quality0_i=1\hspace{0.1cm}$ (it has low quality)


<br>



- $\left( \widehat{price}_i | quality3_i=1 \right) - \left(\widehat{price}_i | quality1_i=1 \right) = \left(\hat{\beta}_{quality3} - \hat{\beta}_{quality1}\right) + \left( \hat{\beta}_{quality3:size\_in\_m\_2} - \hat{\beta}_{quality1:size\_in\_m\_2}\right)  \cdot size\_in\_m\_2_i = \\ \\ = (1.318e+06 - (-2.353e+05 )) + (-1.145e+04 + 2908.2719 )\cdot size\_in\_m\_2_i$  

This magnitude depends on the value of $\hspace{0.1cm}size\_in\_m\_2_i$

<br> 

For example if $\hspace{0.1cm}size\_in\_m\_2_i = 100\hspace{0.1cm}$ , then:

$\left( \widehat{price}_i | quality3_i=1 \right) - \left(\widehat{price}_i | quality1_i=1 \right) = 699127.19$

So the estimated price of a 100 $\hspace{0.1cm}m^2\hspace{0.1cm}$ house is 699127.19 units greater if $\hspace{0.1cm}quality3_i=1\hspace{0.1cm}$ (it has ultra quality) than $\hspace{0.1cm}quality1_i=1\hspace{0.1cm}$ (it has medium quality)



Note that in all these cases it is assumed that the rest of the model variables don´t vary (have the same values) from one scenario to another.



<br>



# Inference <a class="anchor" id="40"></a>




## Confidence Interval for beta coefficients  <a class="anchor" id="41"></a>


We have the following confidence interval for $\hspace{0.1cm}\beta_j$

<br>

\begin{gather*}
CI\left(\beta_j  \right)= \left[ \hspace{0.05cm} \widehat{\beta}_j \ \hspace{0.1cm} \pm \hspace{0.1cm}  \ t_{\alpha/2}^{n-p-1} \cdot \sqrt{\widehat{Var}(\widehat{\beta}_j)} \hspace{0.05cm} \right] = \left[\hspace{0.05cm}  \widehat{\beta}_j \ \hspace{0.1cm} \pm \hspace{0.1cm}  \ t_{\alpha/2}^{n-p-1} \cdot \sqrt{\widehat{\sigma}^2 \cdot q_{jj}} \hspace{0.05cm} \right]
\end{gather*}
 
<br>

Where:

- $q_{jj} \hspace{0.1cm}$ is the element $\hspace{0.1cm} j+1 \hspace{0.1cm}$ of the principal diagonal of the matrix
$\hspace{0.1cm} (X^t \cdot X)^{-1} \hspace{0.1cm}$ for $\hspace{0.1cm} j=0,1,...,p$

 

<br>


**Observation:**

The smaller $\hspace{0.1cm}\sqrt{\widehat{Var}(\widehat{\beta}_j)}\hspace{0.13cm}$  is, the smaller the confidence interval of $\hspace{0.1cm}\widehat{\beta}_j\hspace{0.1cm}$ will be.



&nbsp;





## Confidence Interval for error variance 


We have the following confidence interval for $\hspace{0.1cm}\sigma^2$

<br>
 
\begin{gather*}
CI\left(\sigma^2  \right)= \left[ 0 \hspace{0.15cm} , \hspace{0.15cm}  \dfrac{n-p-1}{\chi_{1-\alpha/2}^{n-p-1}}\cdot \widehat{\sigma}^2  \right]
\end{gather*}
 


<br>






### Confidence Interval for  $\beta_j$  in `Python` <a class="anchor" id="44"></a>



```python
beta_intervals = model_Py_sm.conf_int(alpha=0.05)
beta_intervals.columns = ['2.5%', '97.5%']
beta_intervals
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
      <th>2.5%</th>
      <th>97.5%</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>intercept</th>
      <td>-1.208060e+08</td>
      <td>-3.336873e+06</td>
    </tr>
    <tr>
      <th>size_in_m_2</th>
      <td>3.424446e+04</td>
      <td>3.708364e+04</td>
    </tr>
    <tr>
      <th>longitude</th>
      <td>-3.031978e+06</td>
      <td>-3.223444e+05</td>
    </tr>
    <tr>
      <th>latitude</th>
      <td>4.583358e+06</td>
      <td>7.646506e+06</td>
    </tr>
    <tr>
      <th>no_of_bedrooms</th>
      <td>-9.991120e+05</td>
      <td>-6.742539e+05</td>
    </tr>
    <tr>
      <th>no_of_bathrooms</th>
      <td>-1.910590e+05</td>
      <td>7.681737e+04</td>
    </tr>
    <tr>
      <th>quality_1</th>
      <td>-2.389075e+04</td>
      <td>3.039281e+05</td>
    </tr>
    <tr>
      <th>quality_2</th>
      <td>3.634981e+04</td>
      <td>6.448764e+05</td>
    </tr>
    <tr>
      <th>quality_3</th>
      <td>-1.088489e+05</td>
      <td>6.663718e+05</td>
    </tr>
  </tbody>
</table>
</div>


<br>


Then, for example, we have:

 
\begin{gather*}
CI(\beta_0)=\left[-1.208060e+08 \ , \ -3.336873e+06 \right] \\[0.35cm]
CI(\beta_{size\_in\_m\_2})=\left[ 3.424446e+04   \ , \ 3.708364e+04 \right] 
\end{gather*}

 


We also have this information in the output obtained with `print(model_Python_1.summary())`





<br>




### Confidence Interval for  $\sigma^2$  in `Python` <a class="anchor" id="46"></a>


In this case we will use the interval expression before defined:


```python
import scipy
```


```python
n=len(data_Python)
p=6
scipy.stats.chi2.ppf(0.95, n-p)
```

    2001.4931303978055


```python
b = ( n-p-1 / scipy.stats.chi2.ppf(0.95, n-p-1))*estimated_variance_error

interval_sigma2 = [0,b]
interval_sigma2
```

    [0, 4884652991709357.0]


&nbsp;





## Hypothesis Test for beta coefficients <a class="anchor" id="47"></a>

 



We can carry out the following three test:

|                               |                            |                            |
|:------------------------:|:---------------------:|:---------------------:|
|  $H_0: \beta_j = \beta_j^*$   | $H_0: \beta_j = \beta_j^*$ | $H_0: \beta_j = \beta_j^*$ |
| $H_1: \beta_j \neq \beta_j^*$ | $H_1: \beta_j > \beta_j^*$ | $H_1: \beta_j < \beta_j^*$ |

  

&nbsp;




### Test Statistic:

 

The test statistic for any of the previous test is:

<br>
 
\begin{gather*}
t_{exp | H_0}=\dfrac{\widehat{\beta}_j - \beta_j^*}{\sqrt{S_R \cdot q_{jj}}} \sim t_{n-p}
\end{gather*}
 



&nbsp;

 

### Decision Rule

 

For a fixed signification level $\hspace{0.1cm}\alpha$

<br>

-   Case   $H_0: \beta_j = \beta_j^* \hspace{0.1cm}$  vs  $\hspace{0.1cm} H_1: \beta_j \neq \beta_j^*$




*Based in the test statistic:*      

 
\begin{gather*}
Reject \ H_0 \hspace{0.1cm} \Leftrightarrow \hspace{0.1cm} t_{exp|H_0} > t_{\alpha/2}^{n-p} \hspace{0.2cm} or \hspace{0.2cm} t_{exp|H_0} < t_{1-\alpha/2}^{n-p}
\end{gather*}
 
 
*Based in p-value:*

\begin{gather*}
pvalue=2\cdot P( t_{n-p} \hspace{0.2cm} \geqslant \hspace{0.2cm} \mid t_{exp|H_0} \mid ) \\ \\
Reject \ H_0  \ \Leftrightarrow \ pvalue < \alpha
\end{gather*}
 
 


<br>


-   Case   $H_0: \beta_j = \beta_j^*$ \hspace{0.2cm} vs \hspace{0.2cm} $H_1: \beta_j > \beta_j^*$



*Based in the test statistic:* 


 
\begin{gather*}
Reject \ H_0 \ \Leftrightarrow \ t_{exp|H_0} > t_{\alpha/2}^{n-p}
\end{gather*}
 

*Based in p-value:* 

 
\begin{gather*}
pvalue= P( t_{n-p} \hspace{0.2cm} \geqslant\hspace{0.2cm} t_{exp|H_0} ) \\ \\
Reject \ H_0  \ \Leftrightarrow \ pvalue < \alpha
\end{gather*}
 

<br>


-   Case   $H_0: \beta_j = \beta_j^*$  vs  $H_1: \beta_j < \beta_j^*$



*Based in the test statistic:*

 
\begin{gather*}
Reject \ H_0 \ \Leftrightarrow \ t_{exp|H_0} < t_{1-\alpha/2}^{n-p}
\end{gather*}
 
 
*Based in p-value:*

 
\begin{gather*}
pvalue= P( t_{n-p} \hspace{0.2cm} \leqslant \hspace{0.2cm} t_{exp|H_0} ) \\ \\
Reject \ H_0  \ \Leftrightarrow \ pvalue < \alpha
\end{gather*}
 

 




<br>




## Test of Significance for beta coefficients <a class="anchor" id="48"></a>

 



The test of significance for the coefficient $\beta_j$ is the following
test:

<br>

\begin{gather*}
H_0: \beta_j=0 \\
H_1: \beta_j \neq 0
\end{gather*}
 
 
<br>


The test statistic is the previously exposed, taking into account that
now $\beta_j^*=0$

<br>

\begin{gather*}
t_{exp | H_0}=\dfrac{\hat{\beta}_j - 0}{\sqrt{S_R \cdot q_{jj}}} = \dfrac{\hat{\beta}_j}{\sqrt{\widehat{Var}(\widehat{\beta}_j) }} \sim t_{n-p}
\end{gather*}
 

<br>
 

The decision rules are the same too:

 
\begin{gather*}
Reject \ H_0  \ \Leftrightarrow \ pvalue < \alpha
\end{gather*}
 




&nbsp;








### Test of Significance  in `Python` <a class="anchor" id="50"></a>


The value of $\hspace{0.1cm} t_{exp|H_0} \hspace{0.1cm}$ and also the p-value of the test of significance for $\beta_j$ could be found in the output obtained with `print(model_Python_1.summary())`


```python
print(model_Py_sm.summary())
```


                                OLS Regression Results                            
    ==============================================================================
    Dep. Variable:                  price   R-squared:                       0.698
    Model:                            OLS   Adj. R-squared:                  0.697
    Method:                 Least Squares   F-statistic:                     547.4
    Date:               sá., 22 oct. 2022   Prob (F-statistic):               0.00
    Time:                        19:26:23   Log-Likelihood:                -29918.
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
    

<br>

The p-values we have got are the following:

<br>

\begin{gather*}
H_0: \beta_{quality1}=0 \\
H_1: \beta_{quality1} \neq 0 \\ \\
pvalue = 0.094   
\end{gather*}


- For $\hspace{0.05cm} \alpha = 0.05 < 0.094$ $\hspace{0.1cm} \Rightarrow \hspace{0.1cm}$ $Not \hspace{0.08cm} Reject  \hspace{0.08cm} H_0 : \hspace{0.05cm} \beta_{quality1}=0 \hspace{0.1cm} \Rightarrow \hspace{0.1cm}$ $quality1 \hspace{0.1cm}$ isn´t a significance variable



<br>

\begin{gather*}
H_0: \beta_{quality2}=0 \\
H_1: \beta_{quality2} \neq 0 \\ \\
pvalue = 0.028    
\end{gather*}




- For $\hspace{0.05cm} \alpha = 0.05 > 0.028$ $\hspace{0.1cm} \Rightarrow \hspace{0.1cm}$ $Reject  \hspace{0.08cm} H_0 : \hspace{0.05cm} \beta_{quality2}=0 \hspace{0.1cm} \Rightarrow \hspace{0.1cm} Accept  \hspace{0.08cm} H_1 : \hspace{0.05cm} \beta_{quality2}\neq 0$ $\hspace{0.1cm} \Rightarrow \hspace{0.1cm}$  $quality2 \hspace{0.1cm}$ is a significance variable


<br>

\begin{gather*}
H_0: \beta_{quality3}=0 \\
H_1: \beta_{quality3} \neq 0 \\ \\
pvalue = 0.159 
\end{gather*}



- For $\hspace{0.05cm} \alpha = 0.05 < 0.159$ $\hspace{0.1cm} \Rightarrow \hspace{0.1cm}$ $Not Reject  \hspace{0.08cm} H_0 : \hspace{0.05cm} \beta_{quality3}=0 \hspace{0.1cm} \Rightarrow \hspace{0.1cm}$ $quality3 \hspace{0.1cm}$ isn´t a significance variable

<br>


\begin{gather*}
H_0: \beta_{size\_in\_m\_2}=0 \\
H_1: \beta_{size\_in\_m\_2} \neq 0 \\ \\
pvalue \simeq 0
\end{gather*}




- For $\hspace{0.05cm} \alpha = 0.05 < 0$ $\hspace{0.1cm} \Rightarrow \hspace{0.1cm}$ $Reject  \hspace{0.08cm} H_0 : \hspace{0.05cm} \beta_{size\_in\_m\_2}=0 \hspace{0.1cm} \Rightarrow \hspace{0.1cm}$ $size\_in\_m\_2  \hspace{0.1cm}$ is a significance variable


<br>


\begin{gather*}
H_0: \beta_{no\_of\_bedrooms}=0 \\
H_1: \beta_{no\_of\_bedrooms} \neq 0 \\ \\
pvalue \simeq 0
\end{gather*}




- For $\hspace{0.05cm} \alpha = 0.05 < 0$ $\hspace{0.1cm} \Rightarrow \hspace{0.1cm}$ $Reject  \hspace{0.08cm} H_0 : \hspace{0.05cm} \beta_{no\_of\_bedrooms}=0 \hspace{0.1cm} \Rightarrow \hspace{0.1cm}$ $no\_of\_bedrooms  \hspace{0.1cm}$ is a significance variable

<br>

\begin{gather*}
H_0: \beta_{no\_of\_bathrooms}=0 \\
H_1: \beta_{no\_of\_bathrooms} \neq 0 \\ \\
pvalue =  0.403
\end{gather*}




- For $\hspace{0.05cm} \alpha = 0.05 < 0.403$ $\hspace{0.1cm} \Rightarrow \hspace{0.1cm}$ $Not Reject  \hspace{0.08cm} H_0 : \hspace{0.05cm} \beta_{no\_of\_bathrooms}=0 \hspace{0.1cm} \Rightarrow \hspace{0.1cm}$ $no\_of\_bathrooms  \hspace{0.1cm}$ isn´t a significance variable

<br>

\begin{gather*}
H_0: \beta_{latitude}=0 \\
H_1: \beta_{latitude} \neq 0 \\ \\
pvalue \simeq 0
\end{gather*}




- For $\hspace{0.05cm} \alpha = 0.05 > 0$ $\hspace{0.1cm} \Rightarrow \hspace{0.1cm}$ $Reject  \hspace{0.08cm} H_0 : \hspace{0.05cm} \beta_{latitude}=0 \hspace{0.1cm} \Rightarrow \hspace{0.1cm}$ $latitude  \hspace{0.1cm}$ is a significance variable

<br>

\begin{gather*}
H_0: \beta_{longitude}=0 \\
H_1: \beta_{longitude} \neq 0 \\ \\
pvalue = 0.015
\end{gather*}

- For $\hspace{0.05cm} \alpha = 0.05 > 0.015$ $\hspace{0.1cm} \Rightarrow \hspace{0.1cm}$ $Reject  \hspace{0.08cm} H_0 : \hspace{0.05cm} \beta_{longitude}=0 \hspace{0.1cm} \Rightarrow \hspace{0.1cm}$ $longitude  \hspace{0.1cm}$ is a significance variable



&nbsp;





## ANOVA Test  <a class="anchor" id="51"></a>



The ANOVA test is also called **test of model global significance** :

<br>
 
\begin{gather*}
\hspace{-0.7 cm} H_0: \hspace{0.15cm} \beta_1=\dots =\beta_p=0 \\
H_1: \hspace{0.15cm} \exists \ j=1,...,p , \hspace{0.2cm} \beta_j \neq 0
\end{gather*}
 
 


&nbsp;


### Statistic test

 

For define the test statistic , firt we have to define some elements:


<br>

-   Total Sum Squares $(TSS)$

 \begin{gather*}
TSS =  \sum_{i=1}^n ( y_i - \overline{y} \hspace{0.03cm})\hspace{0.02cm}^2
\end{gather*}
 
 <br>
 
-   Residual Sum Squares $(RSS)$

 \begin{gather*}
RSS=  \sum_{i=1}^n \widehat{\varepsilon}_i\hspace{0.01cm}^2 =  \sum_{i=1}^n ( y_i - \hat{y}_i)\hspace{0.02cm}^2
\end{gather*}
 
 
 <br>
 
-   Regression Sum Squares $(RegSS)$

 
\begin{gather*}
RegSS =  \sum_{i=1}^n ( \hat{y}_i - \overline{y} \hspace{0.03cm} )\hspace{0.02cm}^2
\end{gather*}
 

<br>

It can be proved that:

 
\begin{gather*}
TSS\hspace{0.1cm}=\hspace{0.1cm}RSS\hspace{0.1cm}+\hspace{0.1cm}RegSS
\end{gather*}
 
<br>

-   $TSS \hspace{0.1cm}$ is the total variance of the response variable $Y \\$

-   $RegSS \hspace{0.1cm}$ is the variance of the response variable $Y$ **explained** by the
    model using $X \\$

-   $RSS \hspace{0.1cm}$ is the variance of the response variable $Y$ **not explained** by the
    model using $X$

<br>

<center>

![](TSS.jpg){width="60%"}

</center>

<br>

The image gives us relevant information:



Case A of the image is enough to prove that the following statement is false:

$$(y_i - \overline{y})^2 \hspace{0.1cm}= \hspace{0.1cm} (y_i - \widehat{y}_i)^2 + (\widehat{y}_i - \overline{ y})^2 \hspace{0.2cm} , \forall i=1,..,n$$

Although it is true that:

$$\sum_{i=1}^{n} (y_i - \overline{y})^2 \hspace{0.1cm}= \hspace{0.1cm} \sum_{i=1}^{n} (y_i - \widehat{y}_i)^2 + \sum_{i=1}^{n} (\widehat{y}_i - \overline{y})^2$$

 
----

<br>

Now we can define the test statistic as:

<br>
 
\begin{gather*}
F_{exp|H_0} \hspace{0.1cm}=\hspace{0.1cm} \dfrac{(TSS-RSS)/p}{RSS/(n-p-1)} \hspace{0.1cm}=\hspace{0.1cm} \dfrac{(RegSS)/p}{RSS/(n-p-1) } \sim F_{\hspace{0.05cm}p,\hspace{0.05cm} n-p-1}
\end{gather*}
 
 <br>

Where:  $\hspace{0.1cm} p \hspace{0.1cm}$ is the number of predictor variables $X_1,...,X_p$ of the
model

<br>

**Observation:**

If $\hspace{0.1cm}RegSS\hspace{0.1cm}$ is large compared to $\hspace{0.1cm}RSS\hspace{0.1cm}$ then the variance of $\hspace{0.1cm}Y\hspace{0.1cm}$ explained by the model using $\hspace{0.1cm}X\hspace{0.1cm}$ will be large compared to the unexplained variance and $\hspace{0.1cm}F_{exp|H_0}\hspace{0.1cm}$ will be large

So large values of $\hspace{0.1cm}F_{exp|H_0}\hspace{0.1cm}$ indicate large values of $\hspace{0.1cm}RegSS\hspace{0.1cm}$ compared to $\hspace{0.1cm}RSS\hspace{0.1cm}$ , which is an indication that the model explains $\hspace{0.1cm}Y\hspace{0.1cm}$ well, so it would be reasonable to reject $\hspace{0.1cm}H_0\hspace{0.1cm}$ in favor of $\hspace{0.1cm}H_1\hspace{0.1cm}$, that is, reject that all the predictors are jointly insignificant in explaining the response, and accept that some of them are significant.

The decision rule that we will see next is based on this reasoning. The larger $\hspace{0.1cm}F_{exp|H_0}\hspace{0.1cm}$ is, the easier it is to reject $\hspace{0.1cm}H_0\hspace{0.1cm}$ in favor of $\hspace{0.1cm}H_1\hspace{0.1cm}$


$H_0\hspace{0.1cm}$ is rejected when $\hspace{0.1cm}F_{exp|H_0}\hspace{0.1cm}$ is large enough, that is, when $\hspace{0.1cm}RegSS\hspace{0.1cm}$ is large enough compared to $\hspace{0.1cm}RSS$


&nbsp;


### Decision Rule

 

-   Based on statistic test:

 
\begin{gather*}
Reject \ H_0 \ \Leftrightarrow \ F_{exp|H_0} > F_{\alpha}^{\hspace{0.1cm}p,\hspace{0.05cm} n-p-1}
\end{gather*}
 
-   Based on p-value:

 
\begin{gather*}
Reject \ H_0  \ \Leftrightarrow \ pvalue < \alpha
\end{gather*}
 




&nbsp;


### ANOVA test in `Python`  <a class="anchor" id="53"></a>

The value of $\hspace{0.1cm} F_{exp|H_0}$ and also the p-value of the ANOVA test could be found in the output obtained with `print(model_Python_1.summary())`


```python
print(model_Py_sm.summary())
```

                                OLS Regression Results                            
    ==============================================================================
    Dep. Variable:                  price   R-squared:                       0.698
    Model:                            OLS   Adj. R-squared:                  0.697
    Method:                 Least Squares   F-statistic:                     547.4
    Date:               sá., 22 oct. 2022   Prob (F-statistic):               0.00
    Time:                        19:26:26   Log-Likelihood:                -29918.
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
    

<br>

We have got the following:

<br>

$$F_{exp|H_0} = 547.4 \hspace{0.5cm} \text{(F-statistic)}$$ 

$$pvalue \simeq 0 \hspace{0.5cm} \text{(Prob (F-statistic))}$$


<br> 

So for any $\hspace{0.1cm} \alpha > 0 \hspace{0.1cm}$ we can reject $\hspace{0.1cm}  H_0:   \hspace{0.05cm} \beta_1=\dots =\beta_p=0  \hspace{0.15cm}$, so we can affirm the model is globally significant 



&nbsp;




## Prediction Interval for response variable <a class="anchor" id="53.1"></a>


We have that

<br>

 $$\hat{y}_i \hspace{0.1cm}=\hspace{0.1cm} x_i^t \cdot \widehat{\beta} \hspace{0.1cm} \sim \hspace{0.1cm} N \left( \hspace{0.1cm} E[\hspace{0.1cm} \hat{y}_i \hspace{0.1cm}] \hspace{0.25cm},\hspace{0.25cm} \sigma^2 \cdot (1 + x_i^t \cdot (X^t \cdot X)^{-1} \cdot x_i ) \hspace{0.1cm} \right)$$

<br>

Using that we  can get the following probability interval for $y_i$

<br>

$$ PI(y_i)_{1-\alpha}\hspace{0.1cm} =\hspace{0.1cm} \left[\hspace{0.15cm} \hat{y}_i  \hspace{0.15cm}\pm\hspace{0.15cm} t_{\alpha/2}^{n-p-1} \cdot \sqrt{ \widehat{\sigma}^2 \cdot \left( 1 + x_i^t \cdot (X^t \cdot X)^{-1} \cdot x_i \right) } \hspace{0.15cm} \right] $$



<br>



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
      <th>y</th>
      <th>y_predict</th>
      <th>Prob_Interval_lower</th>
      <th>Prob_Interval_upper</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>2700000</td>
      <td>1.781426e+06</td>
      <td>1.756811e+05</td>
      <td>3.387171e+06</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2850000</td>
      <td>2.551625e+06</td>
      <td>9.459896e+05</td>
      <td>4.157260e+06</td>
    </tr>
    <tr>
      <th>2</th>
      <td>1150000</td>
      <td>2.522740e+06</td>
      <td>9.137789e+05</td>
      <td>4.131701e+06</td>
    </tr>
    <tr>
      <th>3</th>
      <td>2850000</td>
      <td>4.222873e+06</td>
      <td>2.615568e+06</td>
      <td>5.830179e+06</td>
    </tr>
    <tr>
      <th>4</th>
      <td>1729200</td>
      <td>7.851530e+05</td>
      <td>-8.220643e+05</td>
      <td>2.392370e+06</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>1900</th>
      <td>1500000</td>
      <td>1.211313e+06</td>
      <td>-4.053818e+05</td>
      <td>2.828007e+06</td>
    </tr>
    <tr>
      <th>1901</th>
      <td>1230000</td>
      <td>8.171580e+05</td>
      <td>-7.881622e+05</td>
      <td>2.422478e+06</td>
    </tr>
    <tr>
      <th>1902</th>
      <td>2900000</td>
      <td>2.981084e+06</td>
      <td>1.371368e+06</td>
      <td>4.590800e+06</td>
    </tr>
    <tr>
      <th>1903</th>
      <td>675000</td>
      <td>2.651215e+05</td>
      <td>-1.340281e+06</td>
      <td>1.870524e+06</td>
    </tr>
    <tr>
      <th>1904</th>
      <td>760887</td>
      <td>8.227585e+05</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
    </tr>
  </tbody>
</table>
<p>1905 rows × 4 columns</p>
</div>



&nbsp;




# Goodness of Fit: $\hspace{0.1cm}$ Determination Coefficient  <a class="anchor" id="54"></a>

 
## Determination Coefficient  




The determination coefficient, also called R-square, is defined as:

 
\begin{gather*}
R^2 \hspace{0.1cm}=\hspace{0.1cm} \dfrac{RegSS}{TSS} \hspace{0.1cm}=\hspace{0.1cm} \dfrac{TSS-RSS}{TSS} \hspace{0.1cm}=\hspace{0.1cm} 1 - \dfrac{RSS}{TSS}
\end{gather*}
 

<br>

**Properties**

-   $R^2$ is the proportion of total variance of the response
    variable $Y$ that is explained by the model using $X \\$

-   $R^2 \in \left[ 0 , 1 \right]$

For this reason $\hspace{0.1cm}R^2\hspace{0.1cm}$ is used as a measure of how well the model fits the
response variable .

 

<br>

**Interpretation**

The interpretation of $\hspace{0.1cm}R^2\hspace{0.1cm}$ is the following:

-   If $\hspace{0.1cm}R^2\hspace{0.1cm}$ is close to $1$, indicates good fit of model to the response
variable data  $\\[0.5cm]$




-   If $\hspace{0.1cm}R^2\hspace{0.1cm}$ is clode to $0$, indicates bad fit of model to the response
    variable data




&nbsp;







### Computing $R^2$ in `Python` <a class="anchor" id="56"></a>


The value of $\hspace{0.1cm} R^2$  could be found in the output obtained with `print(model_Py_smf.summary())`


```python
model_Py_smf.rsquared
```

    0.6978674339747218


We can compute $R^2$ with `sk-learn` as follows:


```python
Model_Py_sklearn.score(X, y)
```

    0.6978674339747218



We have got the following:

$$ R^2 = 0.698$$



&nbsp;




## Adjusted Determination Coefficient  


$R^2$ has several problems.

$1.$  $\hspace{0.2cm} R^2$ always increase when increase the number of predictors,
    although they are not significative.

$2.\hspace{0.2cm}$  It´s possible estimate two models with the same prediction power but
    with different $\hspace{0.1cm}R^2$


<br>


For avoid the disadvantages of $\hspace{0.1cm}R^2\hspace{0.1cm}$ was created the adjusted $\hspace{0.1cm}R^2\hspace{0.1cm}$ ,
denoted as $\widehat{R^2}$, and defined as: 

<br>



\begin{gather*}
\widehat{R}^2 =  1 - \dfrac{RSS/(n-p-1)}{TSS/(n-1)} = 1 - \left( 1- R^2 \right) \cdot \dfrac{n-1}{n-p}
\end{gather*}

<br>


This metric doesn't grow when including irrelevant predictors, because if $\hspace{0.1cm} RSS\hspace{0.1cm}$ is small because of $\hspace{0.1cm}p\hspace{0.1cm}$ is large, then  $\hspace{0.1cm}1/(n-p-1)\hspace{0.1cm}$ will be large compensating the $\hspace{0.1cm}RSS\hspace{0.1cm}$ value



&nbsp;





### Computing $\widehat{R}^2$ in `Python` <a class="anchor" id="59"></a>


The value of $\hspace{0.1cm} \widehat{R^2}$  could be found in the output obtained with `print(model_Py_smf.summary())`


```python
model_Py_smf.rsquared_adj
```

    0.6965926130210287



We have got the following:

$$ \widehat{R^2} = 0.697$$



&nbsp;

<br>



# Model Problems <a class="anchor" id="60"></a>



## Multicollinearity <a class="anchor" id="61"></a>

Multicollinearity problem happens when some of the predictors are lineary dependients.

**Why multicollinearity is a problem ?**

1. In the worst case it makes the estimation of the model impossible.

2. At best, it makes the beta estimators have a lot of variance, which makes model predictions and inference very imprecise. And it also makes the predictors that are relevant turn out to be non-significant following the significance test.
 
<br>


### Types of multicollinearity  <a class="anchor" id="62"></a>

<br>

#### Perfect Multicollinearity

At least one of the predictors is a linear combination of the rest, so $\hspace{0.1cm}Rg(X) < p+1 \hspace{0.1cm}$ (not full range)

By the null rank theorem, $\hspace{0.1cm}R(X^t \cdot X) < p+1\hspace{0.1cm}$ , therefore $\hspace{0.1cm}X^t \cdot X\hspace{0.1cm}$ hasn't full range, so there is no $\hspace{0.1cm}(X^t \cdot X)^{-1}\hspace{0.1cm}$ , so it cannot be estimate $\hspace{0.1cm}\beta\hspace{0.1cm}$ with the ordinary least squares method .

<br>

#### High Multicollinearity

There are predictors with high linear correlation between them. 

In this case is still possible estimate $\hspace{0.1cm}\beta\hspace{0.1cm}$ because the multicolinearity isn´t perfect, but the variance of the $\hspace{0.1cm}\beta_j\hspace{0.1cm}$ estimators, $\hspace{0.1cm}Var(\widehat{\beta}_j)\hspace{0.1cm}$, will be too high, therefore the model will be very imprecise, so the results will not be good.





&nbsp;




### Identification of multicollinearity 

Identification of multicollinearity is carry out by several ways:



If the linear regression model has only **quantitative** predictors:

1. $\hspace{0.2cm}$ With the correlation matrix of the predictors $\hspace{0.05cm} R$
2. $\hspace{0.2cm}$ With  $\hspace{0.1cm}VIF\hspace{0.1cm}$ (variance increase factor )
3. $\hspace{0.2cm}$ With  condition number of $\hspace{0.05cm} R$



If the linear model has **quantitative** and **categorical** predictors:

1. $\hspace{0.2cm}$  With $\hspace{0.1cm}GVIF\hspace{0.1cm}$ (generalize variance increase factor) 



<br>




#### Identification of multicollinearity with  $R$ <a class="anchor" id="64"></a>

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

<br>

Where: $\hspace{0.2cm} r_{i j} \hspace{0.1cm}$ is the Pearson linear correlation between $X_i$ and $X_j$

<br>

**Criteria :  Identification of multicollinearity with  $R$**

If we have the following estimated linear regression model $\hspace{0.2cm} Y=X\cdot \widehat{\beta}   \hspace{0.2cm}$  where $\hspace{0.2cm}X=(1, X_1, ..., X_p)\hspace{0.2cm}$ are all **quantitative** predictors.

We compute the Pearson linear correlation matrix of the predictors $\hspace{0.2cm} [ X_1 ,..., X_p] \hspace{0.2cm} \Rightarrow \hspace{0.2cm} R = [r_{ij} ]\hspace{0.05cm}_{i,j=1,..,p}$

<br>


- If there is any **high** $\hspace{0.2cm} r_{ij}\hspace{0.2cm} (\hspace{0.1cm} > 0.75 \hspace{0.1cm})$  $\hspace{0.2cm} \Rightarrow\hspace{0.2cm}$ possible multicollinearity problem



&nbsp;







##### Identification of multicollinearity with $R$ in `Python`


```python
X = data_Python.loc[: , ['size_in_m_2',	'longitude', 'latitude', 'no_of_bedrooms', 'no_of_bathrooms']]
```


```python
R = X.corr()

R
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
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>size_in_m_2</th>
      <td>1.000000</td>
      <td>-0.066657</td>
      <td>0.137518</td>
      <td>0.775113</td>
      <td>0.725397</td>
    </tr>
    <tr>
      <th>longitude</th>
      <td>-0.066657</td>
      <td>1.000000</td>
      <td>0.605875</td>
      <td>-0.045668</td>
      <td>-0.025000</td>
    </tr>
    <tr>
      <th>latitude</th>
      <td>0.137518</td>
      <td>0.605875</td>
      <td>1.000000</td>
      <td>0.124162</td>
      <td>0.141160</td>
    </tr>
    <tr>
      <th>no_of_bedrooms</th>
      <td>0.775113</td>
      <td>-0.045668</td>
      <td>0.124162</td>
      <td>1.000000</td>
      <td>0.854384</td>
    </tr>
    <tr>
      <th>no_of_bathrooms</th>
      <td>0.725397</td>
      <td>-0.025000</td>
      <td>0.141160</td>
      <td>0.854384</td>
      <td>1.000000</td>
    </tr>
  </tbody>
</table>
</div>


```python
# pip install seaborn
```


```python
import seaborn as sb

corr = R

sb.heatmap(corr, cmap="Blues", annot=True)
```

<center>

![ ](output_647_1.png)

</center>

<br>




We can see there are several pairs of predictor with high correlation, such as  **(no\_of\_bathrooms ,  no\_of\_bedrooms )** , **(size\_in\_m\_2 , no\_of\_bedrooms)**  , **(size\_in\_m\_2 , no\_of\_bathrooms)** 

So following this criteria the linear regression model  **price ~ size\_in\_m\_2  + longitude + latitude + no\_of\_bedrooms + no\_of\_bathrooms**  could has multicollinearity problems.



&nbsp;




### Identification of multicollinearity with $VIF$ <a class="anchor" id="64"></a>

If we have the following estimated linear regression model $\hspace{0.2cm} Y=X\cdot \widehat{\beta}   \hspace{0.2cm}$  where $\hspace{0.2cm}X=(1, X_1, ..., X_p)\hspace{0.2cm}$ are all **quantitative** predictors.

We compute the **inverse** of the Pearson correlation matrix of the predictors $\hspace{0.1cm} [ X_1 ,..., X_p] \hspace{0.2cm} \Rightarrow \hspace{0.2cm} R\hspace{0.07cm}^{-1}$ 




The variance increase factor $\hspace{0.1cm}\left(VIF\right)\hspace{0.1cm}$ of the quantitative predictor $\hspace{0.1cm}X_j\hspace{0.1cm}$ is:

<br>

$$VIF(X_j) \hspace{0.05cm}=\hspace{0.05cm} Diag(R\hspace{0.07cm}^{-1})[\hspace{0.1cm} j \hspace{0.1cm}] \hspace{0.05cm}=\hspace{0.05cm} j \text{ element of} \hspace{0.1cm} Diag(R\hspace{0.07cm}^{-1})$$

<br>

And also it´s fullfield that:

<br>

$$ VIF(X_j) = \dfrac{1}{1- R^2_{X_j}} $$

<br>

Where:

$R^2_{X_j}\hspace{0.1cm}$ is the determination coefficient  $\hspace{0.1cm} (R^2)\hspace{0.1cm}$  of the linear regression model $\hspace{0.1cm} X_i = \beta_0 + \beta_1 \cdot  X_1 +...+ \beta_{j-1}\cdot X_{j-1} + \beta_{i+1}\cdot X_{i+1} + ... + \beta_p \cdot X_p + \varepsilon$

So, $\hspace{0.07cm} R^2_{X_i} \hspace{0.07cm}$  is the proportion of variability of the predictor $\hspace{0.07cm}X_j\hspace{0.07cm}$ explained by the rest $\hspace{0.07cm}X_1,..,X_{j-1},X_{j+1},..,X_p$



<br>


**Criteria: Identification of multicollinearity with $VIF$** 



- If $\hspace{0.2cm}VIF(X_j) > 10$ $\hspace{0.25cm}\left( R^2_{X_j} > 0.90 \right)$ $\hspace{0.25cm}\Rightarrow\hspace{0.25cm}$ **High** multicollinearity $\\[0.5cm]$

- If $\hspace{0.2cm}VIF(X_j)  \in [4, 10]$  $\hspace{0.25cm}\left(R^2_{X_j} \in [0.75 , 0.90]\right)$ $\hspace{0.25cm}\Rightarrow\hspace{0.25cm}$ **Medium** multicollinearity $\\[0.5cm]$


- If  $\hspace{0.2cm}VIF(X_j) < 4$ $\hspace{0.15cm}\left(R^2_{X_j} < 0.75 \right)$ $\hspace{0.25cm}\Rightarrow\hspace{0.25cm}$ **Low** multicollinearity




&nbsp;







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
      <th>VIF</th>
    </tr>
    <tr>
      <th>predictor</th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>size_in_m_2</th>
      <td>2.642728</td>
    </tr>
    <tr>
      <th>longitude</th>
      <td>1.639554</td>
    </tr>
    <tr>
      <th>latitude</th>
      <td>1.667913</td>
    </tr>
    <tr>
      <th>no_of_bedrooms</th>
      <td>4.565980</td>
    </tr>
    <tr>
      <th>no_of_bathrooms</th>
      <td>3.857961</td>
    </tr>
  </tbody>
</table>
</div>

There is a quantitative predictor with $\hspace{0.1cm} VIF > 4 \hspace{0.1cm}$ , but none with $\hspace{0.1cm} VIF > 10 \hspace{0.1cm}$ , so following this criteria the linear regression model $\hspace{0.1cm}$  **price ~ size\_in\_m\_2  + longitude + latitude + no\_of\_bedrooms + no\_of\_bathrooms** $\hspace{0.1cm}$ has **medium** multicollinearity .



&nbsp;




### Identification of multicollinearity with Condition Number of $\hspace{0.05cm} R$ <a class="anchor" id="66"></a>

If we have the following estimated linear regression model $\hspace{0.2cm} Y=X\cdot \widehat{\beta}   \hspace{0.2cm}$  where $\hspace{0.2cm}X=(1, X_1, ..., X_p)\hspace{0.2cm}$ are all **quantitative** predictors.

We compute the Pearson linear correlation matrix of the predictors $\hspace{0.2cm} [ X_1 ,..., X_p] \hspace{0.2cm} \Rightarrow \hspace{0.2cm} R = [r_{ij} ]\hspace{0.05cm}_{i,j=1,..,p}$

<br>

The **condition number** of $R$ is defined as:

<br>

$$cond(R) = \sqrt{\dfrac{max\lbrace eigenvalues(R)\rbrace}{min\lbrace eigenvalues(R)\rbrace}} $$

<br>

**Criteria :  Identification of multicollinearity with Condition Number of $\hspace{0.05cm} R$**



- If $\hspace{0.1cm} cond(R) > 30$ $\hspace{0.1cm} \Rightarrow\hspace{0.1cm}$ **High** multicollinearity $\\[0.5cm]$

- If $\hspace{0.1cm}cond(R) \in (10 , 30)$ $\hspace{0.1cm} \Rightarrow\hspace{0.1cm}$ **Medium** multicollinearity $\\[0.5cm]$

- If $\hspace{0.1cm}cond(R) < 10$ $\hspace{0.1cm} \Rightarrow\hspace{0.1cm}$ **Low** multicollinearity $\\[0.5cm]$



&nbsp;





#### Identification of multicollinearity  with condition number of $\hspace{0.05cm} R$ in `Python`


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

    4.325045221905223
    

We have get $\hspace{0.1cm} cond(R) = 4.33 < 10  \hspace{0.1cm}$ , so following this criterion, the linear regression model $\hspace{0.1cm}$ **price ~ size\_in\_m\_2  + longitude + latitude + no\_of\_bedrooms + no\_of\_bathrooms** $\hspace{0.1cm}$ has **low** multicollinearity



&nbsp;




### Identification of multicollinearity with $GVIF$ <a class="anchor" id="67"></a>

$VIF\hspace{0.2cm}$ is only a good multicollinearity measure when **all** the **predictors** of the model are **quantitative**.



$GVIF\hspace{0.2cm}$ is the measure proposed by Fox and Monette (1992) to deal with linear regression models that have **categorical predictors**.




Suppose we have the following estimated linear regression model $\hspace{0.2cm} Y=X\cdot \widehat{\beta}   \hspace{0.2cm}$  where $\hspace{0.2cm}X=(1, X_1, ..., X_p)\hspace{0.2cm}$ are some **quantitative** and others **categorical** predictors.



&nbsp;




 If $X_j$ is a **quantitative** predictor


We have to consider the following matrix:

- $\hspace{0.2cm}\mathcal{X}_1 = [\hspace{0.1cm} X_j \hspace{0.1cm}]\\[0.45cm]$

- $\hspace{0.2cm}\mathcal{X}_2 = [\hspace{0.1cm} X_1 , .. , X_{j-1}, X_{j+1},.., X_p \hspace{0.1cm}]\\[0.45cm]$

- $\hspace{0.2cm}\mathcal{X}_3 = [\hspace{0.1cm} X_1,..,X_j,.., X_p \hspace{0.1cm}]$



 
And the following Pearson correlation matrix:

- $\hspace{0.2cm}R_1$ is the Pearson correlation matrix of $\hspace{0.2cm}\mathcal{X}_1 \\[0.45cm]$

- $\hspace{0.2cm}R_2$ is the Pearson correlation matrix of $\hspace{0.2cm}\mathcal{X}_2\\[0.45cm]$

- $\hspace{0.2cm}R_3$ is the Pearson correlation matrix of $\hspace{0.2cm}\mathcal{X}_3$

 

<br>



Then,  $\hspace{0.1cm} GVIF \hspace{0.1cm}$ of $\hspace{0.1cm} X_j \hspace{0.1cm}$ is defined as:

<br>

$$ GVIF(X_j) = det(R_1) \cdot \dfrac{det(R_2)}{det(R_3)} $$ 

 



&nbsp;




If $X_j$ is a **categorical** predictor with $r$ categories, $\hspace{0.2cm} Range(X_j) = \lbrace 0,1,..., r-1 \rbrace \hspace{0.2cm}$ , that enter in the model with the dummy variables $\hspace{0.2cm} X_{j1},X_{j2},...,X_{j(r-1)}$




We have to consider the following matrix:

- $\mathcal{X}_1 = [\hspace{0.1cm} X_{j1},X_{j2},..,X_{j(r-1)} \hspace{0.1cm}]\\[0.45cm]$

- $\mathcal{X}_2 = [\hspace{0.1cm} X_1 , .. , X_{j-1}, X_{j+1},.., X_p \hspace{0.1cm}]\\[0.45cm]$

- $\mathcal{X}_3 = [\hspace{0.1cm} X_1,..,X_{j-1},X_{j1},X_{j2},..,X_{j(r-1)}, X_{j+1},.., X_p \hspace{0.1cm}]$





And the following Pearson correlation matrix:

- $R_1$ is the Pearson correlation matrix of $\mathcal{X}_1\\[0.45cm]$ 

- $R_2$ is the Pearson correlation matrix of $\mathcal{X}_2\\[0.45cm]$

- $R_3$ is the Pearson correlation matrix of $\mathcal{X}_3$


<br>


Then, $\hspace{0.05cm} GVIF \hspace{0.05cm}$ of $\hspace{0.05cm} X_j \hspace{0.05cm}$ is defined as:



$$ GVIF(X_j) = det(R_1) \cdot \dfrac{det(R_2)}{det(R_3)} $$ 

 



&nbsp;




**Criteria: Identification of multicollinearity with $GVIF$**


In this criteria the key quantity is $\hspace{0.2cm} GVIF(X_j)^{1/2 df}$

Where: $\hspace{0.2cm}df\hspace{0.2cm}$ is the number of parameters that enter in the linear regression model when $\hspace{0.2cm} X_j\hspace{0.2cm}$ is added as predictor


<br>

- If $\hspace{0.2cm}X_j\hspace{0.2cm}$ is a **quantitative** predictor $\hspace{0.2cm} ( \Rightarrow df=1)$  :



    - If $\hspace{0.2cm} GVIF(X_j)^{1/2} > \sqrt{10} = 3.16$  $\hspace{0.2cm}\Rightarrow\hspace{0.2cm}$ **High** multicollinearity $\\[0.45cm]$

    - If $\hspace{0.2cm} GVIF(X_j)^{1/2}  \in [\sqrt{4}, \sqrt{10}]= [2 \hspace{0.1cm},\hspace{0.1cm} 3.16]$    $\hspace{0.2cm}  \Rightarrow\hspace{0.2cm}$ **Medium** multicollinearity $\\[0.45cm]$


    - If  $\hspace{0.2cm} GVIF(X_j)^{1/2} < \sqrt{4} = 2$  $\hspace{0.2cm}\Rightarrow\hspace{0.2cm}$ **Low** multicollinearity



<br>

- If $\hspace{0.2cm}X_j$ is a **categorical** predictor with $2$ categories $\hspace{0.2cm} ( \Rightarrow df=2-1=1)$ 



    - If $\hspace{0.2cm} GVIF(X_j)^{1/2} > 10^{1/2} = 3.16$  $\hspace{0.2cm}\Rightarrow\hspace{0.2cm}$ **High** multicollinearity  $\\[0.45cm]$

    - If $\hspace{0.2cm} GVIF(X_j)^{1/2}  \in [4^{1/2}, 10^{1/2}] = [2 \hspace{0.1cm} , \hspace{0.1cm}  3.16]$    $\hspace{0.2cm}  \Rightarrow\hspace{0.2cm}$ **Medium** multicollinearity  $\\[0.45cm]$


    - If  $\hspace{0.2cm} GVIF(X_j)^{1/2} < 4^{1/2} = 2$  $\hspace{0.2cm}\Rightarrow\hspace{0.2cm}$ **Low** multicollinearity

<br>

- If $X_j$ is a **categorical** predictor with $3$ categories $\hspace{0.2cm} ( \Rightarrow df=3-1=2 )$ :



    - If $\hspace{0.2cm} GVIF(X_j)^{1/4} > 10^{1/4} = 1.78$  $\hspace{0.2cm}\Rightarrow\hspace{0.2cm}$ **High** multicollinearity $\\[0.45cm]$

    - If $\hspace{0.2 cm} GVIF(X_j)^{1/4}  \in [4^{1/4}, 10^{1/4}] = [1.41 \hspace{0.1cm} , \hspace{0.1cm}  1.78]$    $\hspace{0.2cm}  \Rightarrow\hspace{0.2cm}$ **Medium** multicollinearity $\\[0.45cm]$


    - If  $\hspace{0.2cm} GVIF(X_j)^{1/4} < 4^{1/4} = 1.41$  $\hspace{0.2cm}\Rightarrow\hspace{0.2cm}$ **Low** multicollinearity

<br>

- If $\hspace{0.2cm}X_j\hspace{0.2cm}$ is a **categorical** predictor with $4$ categories $(\hspace{0.2cm} \Rightarrow df=4-1=3 )$ 



    - If $\hspace{0.2cm} GVIF(X_j)^{1/6} > 10^{1/6} = 1.47$  $\hspace{0.2cm}\Rightarrow\hspace{0.2cm}$ **High** multicollinearity $\\[0.45cm]$

    - If $\hspace{0.2cm} GVIF(X_j)^{1/6}  \in [4^{1/6}, 10^{1/6}] = [1.26 \hspace{0.1cm} , \hspace{0.1cm}  1.47]$    $\hspace{0.2cm}  \Rightarrow\hspace{0.2cm}$ **Medium** multicollinearity $\\[0.45cm]$


    - If  $\hspace{0.2cm} GVIF(X_j)^{1/6} < 4^{1/6} = 1.26$  $\hspace{0.2cm}\Rightarrow\hspace{0.2cm}$ **Low** multicollinearity



<br>

- If $\hspace{0.2cm}X_j\hspace{0.2cm}$ is a **categorical** predictor with $r$ categories $(\hspace{0.2cm} \Rightarrow df=r-1 )$ :



    - If $\hspace{0.2cm} GVIF(X_j)^{1/(2(r-1))} > 10^{1/(2(r-1))}$  $\hspace{0.2cm}\Rightarrow\hspace{0.2cm}$ **High** multicollinearity $\\[0.45cm]$

    - If $\hspace{0.2cm} GVIF(X_j)^{1/(2(r-1))}  \in [4^{1/(2(r-1))}, 10^{1/(2(r-1))}]$    $\hspace{0.2cm}  \Rightarrow\hspace{0.2cm}$ **Medium** multicollinearity $\\[0.45cm]$


    - If  $\hspace{0.2cm} GVIF(X_j)^{1/(2(r-1))} < 4^{1/(2(r-1))}$  $\hspace{0.2cm}\Rightarrow\hspace{0.2cm}$ **Low** multicollinearity



&nbsp;








#### Identification of multicollinearity with $GVIF$ in `Python`



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
      <th>predictor</th>
      <th>GVIF</th>
      <th>GVIF^(1/(2*df))</th>
      <th>df</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>size_in_m_2</td>
      <td>2.642728</td>
      <td>1.625647</td>
      <td>1</td>
    </tr>
    <tr>
      <th>1</th>
      <td>longitude</td>
      <td>1.639554</td>
      <td>1.280451</td>
      <td>1</td>
    </tr>
    <tr>
      <th>2</th>
      <td>latitude</td>
      <td>1.667913</td>
      <td>1.291477</td>
      <td>1</td>
    </tr>
    <tr>
      <th>3</th>
      <td>no_of_bedrooms</td>
      <td>4.565980</td>
      <td>2.136815</td>
      <td>1</td>
    </tr>
    <tr>
      <th>4</th>
      <td>no_of_bathrooms</td>
      <td>3.857961</td>
      <td>1.964169</td>
      <td>1</td>
    </tr>
    <tr>
      <th>5</th>
      <td>quality</td>
      <td>1.080988</td>
      <td>1.013064</td>
      <td>3</td>
    </tr>
  </tbody>
</table>
</div>


<br>


In this case all the quantitative predictors have $\hspace{0.1cm} GVIF^{1/2df} < 3.16 \hspace{0.1cm}$, but $\hspace{0.1cm} GVIF^{1/2df} \hspace{0.1cm}$ of $\hspace{0.1cm}$ **no\_of\_bathrooms** $\hspace{0.1cm}$ is $\hspace{0.1cm} 2.14 > 2$ $\hspace{0.1cm} \Rightarrow \hspace{0.1cm} $  **medium** multicollinearity

On the other hand the 4-ary categorical predictor **quality** has $\hspace{0.1cm} GVIF^{1/2df}\hspace{0.1cm} = 1.01 < 1.26$ $\hspace{0.1cm} \Rightarrow \hspace{0.1cm} $  **low** multicollinearity

So using the GVIF method, we can conclude that there is a **medium** multicollinearity between the predictors of the model  $\hspace{0.1cm}$ **price ~ size\_in\_m\_2  + longitude + latitude + no\_of\_bedrooms + no\_of\_bathrooms** $\hspace{0.1cm}$



&nbsp;




## Checking Error Assumptions <a class="anchor" id="68"></a>

- $\hspace{0.2cm} \varepsilon_i \sim N(0,\sigma) \hspace{0.5cm} \forall \hspace{0.1cm} i=1,...,n \\[0.35cm]$
  
- $\hspace{0.2cm} corr(\varepsilon_i , \varepsilon_j)=0 \hspace{0.5cm} \forall \hspace{0.1cm} i\neq j =1,...,n$


<br>

### Checking Error Constant Variance <a class="anchor" id="69"></a>

It is not possible to check the assumption of constant variance just by examining
the residuals alone, some will be large and some will be small, but this proves nothing. We need to check whether the variance in the residuals is related to some
other quantity.

<br>

- The most useful diagnostic is a plot of $\hat{\varepsilon}$ vs $\hat{Y}$



- Interpretation of the graph $\hat{\varepsilon}$ vs $\hat{y}$:

    - If the dispersion of the points is uniform random $\Rightarrow$ There is no problem (evidence of constant variance of the error).

    - If we can see a cone shape at the points $\Rightarrow$ Problem (evidence of error not constant variance)

<br>

This plot can also provide evidence of nonlinearity between the response variable and the predictors:

- If we can see a non-linear shape at the points $\Rightarrow$ evidence of non-linearity between the response variable and the predictors



&nbsp;







#### Checking Error Constant Variance in `Python`


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

 

<center>

![ ](output_791_0.png){width="45%"}

</center>

Since we can see a cone shape at the points, we cannot accept the constant error variance assumption $Var(\varepsilon)=\sigma^2$.



&nbsp;




### Checking Null Error Mean <a class="anchor" id="70"></a>

We are going to use the typical t-test to verify this assumption.

First we compute the  estimated errors mean to get first idea:


```python
df_predictions_Python['estimated_errors'].mean()
```

    -1.5501118707531706e-07

&nbsp;





#### Checking Null Error Mean in `Python`


```python
# pip install --upgrade pingouin
```


```python
import pingouin as pg

pg.ttest(x= df_predictions_Python['estimated_errors'] , y=0)
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
      <th>T</th>
      <th>dof</th>
      <th>alternative</th>
      <th>p-val</th>
      <th>CI95%</th>
      <th>cohen-d</th>
      <th>BF10</th>
      <th>power</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>T-test</th>
      <td>-4.225144e-12</td>
      <td>1904</td>
      <td>two-sided</td>
      <td>1.0</td>
      <td>[-71952.49, 71952.49]</td>
      <td>9.680415e-14</td>
      <td>0.026</td>
      <td>0.05</td>
    </tr>
  </tbody>
</table>
</div>


For any significance level we can accept that the errors mean is zero (0)



&nbsp;




### Checking Error Normality <a class="anchor" id="71"></a>

First we are going to check the error normality assumption using the **histogram method**

&nbsp;

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



<center>

![ ](output_825_0.png){width="45%"}

</center>

&nbsp;




Now we are going to check the error normality assumption using the Shapiro statistical test.

&nbsp;




#### Checking Error Normality in `Python`  with Shapiro test


```python
shapiro_test = stats.shapiro(df_predictions_Python['estimated_errors'])
shapiro_test
```

    ShapiroResult(statistic=0.7914911508560181, pvalue=4.203895392974451e-44)


For any significance level we have to reject the errors normality hypothesis.



&nbsp;




### Checking Null Error Correlation <a class="anchor" id="72"></a>

We are going to check the null error correlation assumption through  the **Durban-Watson test**.


&nbsp;

**Hypothesis:**

$$H_0: \hspace{0.1cm} corr\left(\hat{\varepsilon}_{(1)},\hat{\varepsilon}_{(2)}\right) = 0 $$ 

$$H_1: \hspace{0.1cm} corr\left(\hat{\varepsilon}_{(1)},\hat{\varepsilon}_{(2)}\right) \neq 0$$


Where:

$$\hat{\varepsilon}_{(1)} = (\hat{\varepsilon}_1 , \hat{\varepsilon}_2 ,..., \hat{\varepsilon}_{n-1})$$

$$\hat{\varepsilon}_{(2)} = (\hat{\varepsilon}_2  ,...,\hat{\varepsilon}_{n-1}, \hat{\varepsilon}_{n})$$



**Test Statistic :**

\begin{gather*}
DW = \dfrac{\sum_{i=2}^n (\hat{\varepsilon}_i - \hat{\varepsilon}_{i-1})^2 }{\sum_{i=2}^n \hat{\varepsilon}_{i}^2 } = \dfrac{sum\left( \hspace{0.1cm}( \hat{\varepsilon}_{(2)} - \hat{\varepsilon}_{(1)})^2 \hspace{0.1cm} \right)}{sum\left( \hspace{0.1cm} (\hat{\varepsilon}_{(2)})^2 \hspace{0.1cm} \right)}
\end{gather*}


<br>

The test statistic is approximately equal to $\hspace{0.1cm} 2\cdot (1-r) \hspace{0.1cm}$ where $r$ is the sample autocorrelation of the residuals. Thus, the test statistic will always be between $0$ and $4$ with the following interpretation:

A test statistic of $2$ indicates **no serial correlation**.

The closer the test statistics is to $0$, the more evidence of **positive serial correlation**.

The closer the test statistics is to $4$, the more evidence of **negative serial correlation**.



&nbsp;






#### Durban-Watson test in `Python`


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

 
<center>

![ ](output_863_0.png){width="45%"}

</center>

```python
import statsmodels

statsmodels.stats.stattools.durbin_watson(df_predictions_Python['estimated_errors'], axis=0)
```

    1.7158064595327671


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

    (1.720186802122348, 5.373510268400102e-10)


For any $\alpha$ we reject the null  error correlation hypothesis.



&nbsp;


## Checking Linear Assumption <a class="anchor" id="73"></a>

The linear regression model assumes that there is a **linear** relationship between the response and the predictors.

If the actual relationship is not linear, then all the conclusions we draw from the linear model are questionable.

<br>

**How to identify non-linearity?**



- Make a plot of the estimated errors (residuals) against the predictions of the response (all with the train data) $\hspace{0.2cm}\Rightarrow\hspace{0.2cm} \widehat{\varepsilon}\hspace{0.2cm} vs \hspace{0.2cm}\widehat{Y}$

    - It is the same plot as the one used to diagnose heteroscedasticity of the residuals (non-constant variance of the residuals). 

    - If a non-linear relationship is observed in the graph, it indicates non-linearity between the predictors and the response.
    
   
   <br>

- Non-linearity  can also be detectedby plotting the response versus predictors (one-to-one) $\hspace{0.2cm}\Rightarrow\hspace{0.2cm} Y \hspace{0.2cm} vs \hspace{0.2cm} X_j$


<br>

**Solutions:**

A logarithmic transformation of the response variable could help. But the best option is to use a nonlinear (or nonparametric) regression method.

<br>

**Identification non-linearity with scatter plots: response vs predictors (one-to-one)**


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
 

<center>

![ ](output_883_0.png){width="45%"}

</center>

<br>

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

<center>

![ ](output_884_0.png){width="45%"}

</center>

 
<br>

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
 

<center>

![ ](output_885_0.png){width="45%"}

</center>


<br>

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
 
<center>

![ ](output_886_0.png){width="45%"}

</center>


<br>


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
 
<center>

![ ](output_887_0.png){width="45%"}

</center>


<br>

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

 

<center>

![ ](output_889_0.png){width="45%"}

</center>

&nbsp;


<br>

## Finding Outliers <a class="anchor" id="74"></a>

An outlier is a point that clearly deviates from the relationship between the response and the predictors.

Outliers can greatly affect the estimates of model parameters.

How to identify outliers?

A simple option is with the standardized  residuals, given by:

<br>

$$ \tilde{\varepsilon_i} = \dfrac{\hat{\varepsilon}_i}{\sqrt{\widehat{Var}(\hat{\varepsilon}_i)}} = \dfrac{\hat{\varepsilon}_i}{ \sqrt{ \widehat{\sigma}^2 \cdot (1-h_{ii})} }  $$

<br>


Where:

$\hspace{0.1cm} h_{ii} \hspace{0.1cm}$ is the $i$-th element of the principal diagonal of $\hspace{0.1cm} H=X \cdot (X^t \cdot X)^{-1} \cdot X^t \hspace{0.1cm}$


<br>

Note that:

$$\widehat{Var}(\hat{\varepsilon}_i) \neq \widehat{Var}(\varepsilon_i)  $$

Because  $\varepsilon_i$ is a random variable such that $\hspace{0.1cm}\varepsilon_i \sim N (0\hspace{
0.1cm},\hspace{0.1cm} \sigma^2) \hspace{0.1cm}$ (by initial hypothesis of the model)

And $\hspace{0.1cm} \hat{\varepsilon}_i = y_i - \hat{y}_i \hspace{0.1cm}$ is another random variable such that  $\hspace{0.1cm} \hat{\varepsilon}_i \sim N(0\hspace{0.1cm},\hspace{0.1cm}\sigma^2 \cdot (1-h_{ii})) \hspace{0.1cm}$  (can be proof) 

<br>

**Criteria: Outliers Identification **

**Observations** whose **studentized residuals** are **greater than 3** (in absolute value) will be considered outliers.

What to do with outliers:

If they are the result of an error in data collection, they can be deleted. If not, it shouldn't, since it is part of the reality reflected by the sample, and is therefore relevant information.


<br>

### Outliers Identification in `Python`

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
      <th>standardized_estimated_errors &gt; 3</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>False</td>
    </tr>
    <tr>
      <th>1</th>
      <td>False</td>
    </tr>
    <tr>
      <th>2</th>
      <td>False</td>
    </tr>
    <tr>
      <th>3</th>
      <td>False</td>
    </tr>
    <tr>
      <th>4</th>
      <td>False</td>
    </tr>
  </tbody>
</table>
</div>



```python
Outliers = Outliers_df.loc[ Outliers_df['standardized_estimated_errors > 3'] == True , : ].index
```


```python
Outliers
```

    Int64Index([  60,  216,  235,  336,  343,  427,  456,  460,  461,  462, 463, 464,  465,  475,  476,  517,  576,  790,  836,  970,  989, 1189, 1259, 1487, 1515, 1690, 1697, 1869, 1885], dtype='int64')



<br>

<br>


# Bibliography

Benitez Peña, S. (2021). *El modelo de regresión lineal múltiple* [Presentación de PowerPoint]. Aula Global UC3M.

Benitez Peña, S. (2021). *Inferencia en el modelo de regresión lineal múltiple* [Presentación de PowerPoint]. Aula Global UC3M.

Benitez Peña, S. (2021). *Diagnosis y validacion del modelo de regresión lineal múltiple* [Presentación de PowerPoint]. Aula Global UC3M.

Galeano, P. (2022). *Regresion Lineal Múltiple* [Presentación de PowerPoint]. Aula Global UC3M.

Fox, J. (2022). *Diagnosing Collinearity* [Presentación de PowerPoint]. McMaster University

Faraway, J (2015). *Linear Models with R* (second edition). CRC Press.























 
