---
title: 'Introduction to Pandas'
author: 'Fabio Scielzo Ortiz'
date: '25/1/23'
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




# Data-frame as matrix

We are going to consider data-frames as data matrix:

<br>

$$D = \begin{pmatrix}
x_1^t \\
x_2^t \\
... \\
x_n^t
\end{pmatrix} = \begin{pmatrix}
x_{11} & x_{11} & ... & x_{11}\\
x_{11} & x_{11} & ... & x_{11}\\
... &  ... & ... & ... \\
x_{11} & x_{11} & ... & x_{11}
\end{pmatrix} = \left( X_1 X_2 ... X_p \right)$$

<br>

$D\hspace{0.05cm}$ is a data-frame with $\hspace{0.05cm} n\hspace{0.05cm}$ rows and $\hspace{0.05cm}p\hspace{0.05cm}$ columns. Where $\hspace{0.05cm}x_i=(x_{i1},..., x_{ip})^t\hspace{0.05cm}$ represent the $\hspace{0.05cm}i$-th row  and $\hspace{0.05cm}X_j\hspace{0.05cm}$ the $\hspace{0.05cm}j$-th column of the data-frame.


<br>

# Create a new data-frame: 

We can create a new data-frame using `Pandas` as follows:


```python
import pandas as pd
```

```python
ClienteID = pd.Series(['C1', 'C2', 'C3', 'C4', 'C5', 'C6', 'C7', 'C8', 'C9', 'C10','C11','C12'])
Nombre = pd.Series(['Orlando', 'Keith', 'Donna', 'Janet', 'Fabio', 'Juan', 'Lucia', 'Pedro', 'Sergio', 'Grecia', 'Ismael', 'Luis'])
Pais = pd.Series(['Australia', 'India', 'Germany', 'United States', 'España', 'España', 'España', 'Italia', 'United States', 'Peru','España','España'])
Ciudad = pd.Series(['','','Berlin','California','Madrid', 'Sevilla', '', 'Roma', 'New York', 'Lima', 'Madrid', 'Murcia'])
Email = pd.Series(['','keith0@adventure-works.com','donna0@adventure-works.com','janet1@adventure-works.com','fabio10@gmail.com', '', 'LuciaPerez@hotmail.com', 'Pedro99@gmail.com', 'sergio_as@gmail.com', 'Grecia89@gmail.com', 'Isma98@gmail.com', 'Luismiguel123@gmail.com'])
Telefono = pd.Series(['917755028', '', '915547890', '', '', '915869028', '', '910007890', '', '', '912234543', ''])
```


```python
Clientes = pd.DataFrame({'ClienteID': ClienteID ,  'Nombre': Nombre, 'Pais':Pais , 
                         'Ciudad':Ciudad, 'Email':Email, 'Telefono':Telefono})
```


```python
Clientes
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
      <th>ClienteID</th>
      <th>Nombre</th>
      <th>Pais</th>
      <th>Ciudad</th>
      <th>Email</th>
      <th>Telefono</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>C1</td>
      <td>Orlando</td>
      <td>Australia</td>
      <td></td>
      <td></td>
      <td>917755028</td>
    </tr>
    <tr>
      <th>1</th>
      <td>C2</td>
      <td>Keith</td>
      <td>India</td>
      <td></td>
      <td>keith0@adventure-works.com</td>
      <td></td>
    </tr>
    <tr>
      <th>2</th>
      <td>C3</td>
      <td>Donna</td>
      <td>Germany</td>
      <td>Berlin</td>
      <td>donna0@adventure-works.com</td>
      <td>915547890</td>
    </tr>
    <tr>
      <th>3</th>
      <td>C4</td>
      <td>Janet</td>
      <td>United States</td>
      <td>California</td>
      <td>janet1@adventure-works.com</td>
      <td></td>
    </tr>
    <tr>
      <th>4</th>
      <td>C5</td>
      <td>Fabio</td>
      <td>España</td>
      <td>Madrid</td>
      <td>fabio10@gmail.com</td>
      <td></td>
    </tr>
    <tr>
      <th>5</th>
      <td>C6</td>
      <td>Juan</td>
      <td>España</td>
      <td>Sevilla</td>
      <td></td>
      <td>915869028</td>
    </tr>
    <tr>
      <th>6</th>
      <td>C7</td>
      <td>Lucia</td>
      <td>España</td>
      <td></td>
      <td>LuciaPerez@hotmail.com</td>
      <td></td>
    </tr>
    <tr>
      <th>7</th>
      <td>C8</td>
      <td>Pedro</td>
      <td>Italia</td>
      <td>Roma</td>
      <td>Pedro99@gmail.com</td>
      <td>910007890</td>
    </tr>
    <tr>
      <th>8</th>
      <td>C9</td>
      <td>Sergio</td>
      <td>United States</td>
      <td>New York</td>
      <td>sergio_as@gmail.com</td>
      <td></td>
    </tr>
    <tr>
      <th>9</th>
      <td>C10</td>
      <td>Grecia</td>
      <td>Peru</td>
      <td>Lima</td>
      <td>Grecia89@gmail.com</td>
      <td></td>
    </tr>
    <tr>
      <th>10</th>
      <td>C11</td>
      <td>Ismael</td>
      <td>España</td>
      <td>Madrid</td>
      <td>Isma98@gmail.com</td>
      <td>912234543</td>
    </tr>
    <tr>
      <th>11</th>
      <td>C12</td>
      <td>Luis</td>
      <td>España</td>
      <td>Murcia</td>
      <td>Luismiguel123@gmail.com</td>
      <td></td>
    </tr>
  </tbody>
</table>
</div>





Now we are going to create two additional data-frames:


```python
VentasId = pd.Series(['V1', 'V2', 'V3', 'V4', 'V5', 'V6', 'V7', 'V8', 'V9', 'V10', 'V11', 'V12', 'V13', 'V14', 'V15'])

Producto = pd.Series(['Alfombra', 'Killim', 'Killim', 'Alfombra', 'Killim', 'Killim', 'Alfombra', 'Killim', 'Killim', 'Alfombra', 'Killim', 'Killim'])

Precio = pd.Series([1500, 699.50, 475, 5000, 499.50, 55, 2500, 299.5, 600, 1200, 500, 650, 3500, 1000, 350])

ClienteID = pd.Series(['C1','C3','C9','C4','C8', 'C5', 'C2', 'C10', 'C2', 'C7', 'C8', 'C9', 'C7', 'C6', 'C10'])

Proveedor = pd.Series(['P1', 'P1', 'P3', 'P1', 'P1', 'P3', 'P1', 'P1', 'P3', 'P1', 'P1', 'P3', 'P1', 'P1', 'P3'])
```


```python
Ventas = pd.DataFrame({'VentasId': VentasId, 'Producto': Producto, 'Precio':Precio , 
                         'ClienteID':Cliente, 'Proveedor':Proveedor})
```


```python
Ventas
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
      <th>VentasId</th>
      <th>Producto</th>
      <th>Precio</th>
      <th>Cliente</th>
      <th>Proveedor</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>V1</td>
      <td>Alfombra</td>
      <td>1500.0</td>
      <td>C1</td>
      <td>P1</td>
    </tr>
    <tr>
      <th>1</th>
      <td>V2</td>
      <td>Killim</td>
      <td>699.5</td>
      <td>C3</td>
      <td>P1</td>
    </tr>
    <tr>
      <th>2</th>
      <td>V3</td>
      <td>Killim</td>
      <td>475.0</td>
      <td>C9</td>
      <td>P3</td>
    </tr>
    <tr>
      <th>3</th>
      <td>V4</td>
      <td>Alfombra</td>
      <td>5000.0</td>
      <td>C4</td>
      <td>P1</td>
    </tr>
    <tr>
      <th>4</th>
      <td>V5</td>
      <td>Killim</td>
      <td>499.5</td>
      <td>C8</td>
      <td>P1</td>
    </tr>
    <tr>
      <th>5</th>
      <td>V6</td>
      <td>Killim</td>
      <td>55.0</td>
      <td>C5</td>
      <td>P3</td>
    </tr>
    <tr>
      <th>6</th>
      <td>V7</td>
      <td>Alfombra</td>
      <td>2500.0</td>
      <td>C2</td>
      <td>P1</td>
    </tr>
    <tr>
      <th>7</th>
      <td>V8</td>
      <td>Killim</td>
      <td>299.5</td>
      <td>C10</td>
      <td>P1</td>
    </tr>
    <tr>
      <th>8</th>
      <td>V9</td>
      <td>Killim</td>
      <td>600.0</td>
      <td>C2</td>
      <td>P3</td>
    </tr>
    <tr>
      <th>9</th>
      <td>V10</td>
      <td>Alfombra</td>
      <td>1200.0</td>
      <td>C7</td>
      <td>P1</td>
    </tr>
    <tr>
      <th>10</th>
      <td>V11</td>
      <td>Killim</td>
      <td>500.0</td>
      <td>C8</td>
      <td>P1</td>
    </tr>
    <tr>
      <th>11</th>
      <td>V12</td>
      <td>Killim</td>
      <td>650.0</td>
      <td>C9</td>
      <td>P3</td>
    </tr>
    <tr>
      <th>12</th>
      <td>V13</td>
      <td>NaN</td>
      <td>3500.0</td>
      <td>C7</td>
      <td>P1</td>
    </tr>
    <tr>
      <th>13</th>
      <td>V14</td>
      <td>NaN</td>
      <td>1000.0</td>
      <td>C6</td>
      <td>P1</td>
    </tr>
    <tr>
      <th>14</th>
      <td>V15</td>
      <td>NaN</td>
      <td>350.0</td>
      <td>C10</td>
      <td>P3</td>
    </tr>
  </tbody>
</table>
</div>



<br>


```python
ProveedorID = pd.Series(['P1', 'P2', 'P3'])

Nombre = pd.Series(['Intertrade', 'SaidKarpet', 'OrientKillim' ])

Email = pd.Series(['Intertrade@gmail.com', 'SaidKarpet@gmail.com', 'OrientKillim@gmail.com'])

Telefono = pd.Series(['912223344', '912783794', '9100155475'])
```


```python
Proveedores = pd.DataFrame({'ProveedorID': ProveedorID, 'Nombre': Nombre, 'Email':Email, 'Telefono':Telefono})
```


```python
Proveedores
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
      <th>ProveedorID</th>
      <th>Nombre</th>
      <th>Email</th>
      <th>Telefono</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>P1</td>
      <td>Intertrade</td>
      <td>Intertrade@gmail.com</td>
      <td>912223344</td>
    </tr>
    <tr>
      <th>1</th>
      <td>P2</td>
      <td>SaidKarpet</td>
      <td>SaidKarpet@gmail.com</td>
      <td>912783794</td>
    </tr>
    <tr>
      <th>2</th>
      <td>P3</td>
      <td>OrientKillim</td>
      <td>OrientKillim@gmail.com</td>
      <td>9100155475</td>
    </tr>
  </tbody>
</table>
</div>


<br>


# Import a CSV as a data-frame

The most common way to work is not to manually create a data frame, as we saw in the previous section. Instead, we often import CSV as data frames.


```python
House_Price_Data = pd.read_csv('House_Price_Regression.csv')
```


```python
House_Price_Data
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
      <th>private_garden_recode</th>
      <th>private_gym_recode</th>
      <th>private_jacuzzi_recode</th>
      <th>private_pool_recode</th>
      <th>security_recode</th>
      <th>shared_gym_recode</th>
      <th>shared_pool_recode</th>
      <th>shared_spa_recode</th>
      <th>view_of_water_recode</th>
      <th>size_in_m_2</th>
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
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>100.242337</td>
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
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>146.972546</td>
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
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>181.253753</td>
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
      <td>0.0</td>
      <td>0.0</td>
      <td>187.664060</td>
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
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>47.101821</td>
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
      <td>42.0</td>
      <td>25.176892</td>
      <td>55.310712</td>
      <td>1500000</td>
      <td>2</td>
      <td>2</td>
      <td>3.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>100.985561</td>
    </tr>
    <tr>
      <th>1901</th>
      <td>42.0</td>
      <td>25.166145</td>
      <td>55.276684</td>
      <td>1230000</td>
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
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>70.606280</td>
    </tr>
    <tr>
      <th>1902</th>
      <td>16.0</td>
      <td>25.206500</td>
      <td>55.345056</td>
      <td>2900000</td>
      <td>3</td>
      <td>5</td>
      <td>2.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>179.302790</td>
    </tr>
    <tr>
      <th>1903</th>
      <td>37.0</td>
      <td>25.073858</td>
      <td>55.229844</td>
      <td>675000</td>
      <td>1</td>
      <td>2</td>
      <td>2.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>68.748220</td>
    </tr>
    <tr>
      <th>1904</th>
      <td>36.0</td>
      <td>25.079130</td>
      <td>55.154713</td>
      <td>760887</td>
      <td>1</td>
      <td>2</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>74.322400</td>
    </tr>
  </tbody>
</table>
<p>1905 rows × 29 columns</p>
</div>


<br>


# Export a CSV

We can also export a data-frame as CSV as follows:


```python
data_frame.to_csv('filename.csv', index=False)  
```


<br>

# Number of rows and columns

We can get the number of rows and columns of a data-frame:


```ruby
House_Price_Data.shape
```




    (1905, 29)


<br>

The number of rows:

```ruby
House_Price_Data.shape[0]
```




    1905

<br>

Another way to get the number of rows:

```ruby
len(House_Price_Data)
```




    1905
    

<br>

The number of columns:

```ruby
House_Price_Data.shape[1]
```




    29








<br>

# Head y Tail

We  can also view the first rows of a data-frame using `head()` method:


```ruby
House_Price_Data.head()
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
      <th>private_garden_recode</th>
      <th>private_gym_recode</th>
      <th>private_jacuzzi_recode</th>
      <th>private_pool_recode</th>
      <th>security_recode</th>
      <th>shared_gym_recode</th>
      <th>shared_pool_recode</th>
      <th>shared_spa_recode</th>
      <th>view_of_water_recode</th>
      <th>size_in_m_2</th>
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
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>100.242337</td>
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
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>146.972546</td>
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
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>181.253753</td>
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
      <td>0.0</td>
      <td>0.0</td>
      <td>187.664060</td>
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
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>47.101821</td>
    </tr>
  </tbody>
</table>
<p>5 rows × 29 columns</p>
</div>




```ruby
House_Price_Data.head(10)
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
      <th>private_garden_recode</th>
      <th>private_gym_recode</th>
      <th>private_jacuzzi_recode</th>
      <th>private_pool_recode</th>
      <th>security_recode</th>
      <th>shared_gym_recode</th>
      <th>shared_pool_recode</th>
      <th>shared_spa_recode</th>
      <th>view_of_water_recode</th>
      <th>size_in_m_2</th>
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
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>100.242337</td>
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
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>146.972546</td>
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
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>181.253753</td>
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
      <td>0.0</td>
      <td>0.0</td>
      <td>187.664060</td>
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
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>47.101821</td>
    </tr>
    <tr>
      <th>5</th>
      <td>46.0</td>
      <td>25.114275</td>
      <td>55.139764</td>
      <td>3119900</td>
      <td>1</td>
      <td>2</td>
      <td>2.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>94.296545</td>
    </tr>
    <tr>
      <th>6</th>
      <td>46.0</td>
      <td>25.114275</td>
      <td>55.139764</td>
      <td>8503600</td>
      <td>2</td>
      <td>3</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>191.565986</td>
    </tr>
    <tr>
      <th>7</th>
      <td>46.0</td>
      <td>25.114275</td>
      <td>55.139764</td>
      <td>3119900</td>
      <td>1</td>
      <td>2</td>
      <td>2.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>94.296545</td>
    </tr>
    <tr>
      <th>8</th>
      <td>46.0</td>
      <td>25.106668</td>
      <td>55.149275</td>
      <td>2100000</td>
      <td>3</td>
      <td>3</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>203.085958</td>
    </tr>
    <tr>
      <th>9</th>
      <td>15.0</td>
      <td>25.194935</td>
      <td>55.282665</td>
      <td>2690000</td>
      <td>2</td>
      <td>3</td>
      <td>2.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>141.305463</td>
    </tr>
  </tbody>
</table>
<p>10 rows × 29 columns</p>
</div>

<br>

Mathematically the operation $head()$ could be defined as:

Let $\hspace{0.1cm} D= \begin{pmatrix}
x_1^t \\
x_2^t \\
... \\
x_n^t
\end{pmatrix}\hspace{0.1cm}$ be the data matrix that represent the data-frame $\hspace{0.1cm}df\hspace{0.1cm}$, then:



$$df.head(k) \hspace{0.1cm}=\hspace{0.1cm} D[\hspace{0.1cm}1:k \hspace{0.1cm},\hspace{0.1cm} : \hspace{0.1cm}] \hspace{0.1cm} = \hspace{0.1cm} \begin{pmatrix}
x_1^t \\
x_2^t \\
... \\
x_k^t
\end{pmatrix}$$



<br>

We can also  view the last rows of a data-frame using `tail()` method:


```python
House_Price_Data.tail()
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
      <th>private_garden_recode</th>
      <th>private_gym_recode</th>
      <th>private_jacuzzi_recode</th>
      <th>private_pool_recode</th>
      <th>security_recode</th>
      <th>shared_gym_recode</th>
      <th>shared_pool_recode</th>
      <th>shared_spa_recode</th>
      <th>view_of_water_recode</th>
      <th>size_in_m_2</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>1900</th>
      <td>42.0</td>
      <td>25.176892</td>
      <td>55.310712</td>
      <td>1500000</td>
      <td>2</td>
      <td>2</td>
      <td>3.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>100.985561</td>
    </tr>
    <tr>
      <th>1901</th>
      <td>42.0</td>
      <td>25.166145</td>
      <td>55.276684</td>
      <td>1230000</td>
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
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>70.606280</td>
    </tr>
    <tr>
      <th>1902</th>
      <td>16.0</td>
      <td>25.206500</td>
      <td>55.345056</td>
      <td>2900000</td>
      <td>3</td>
      <td>5</td>
      <td>2.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>179.302790</td>
    </tr>
    <tr>
      <th>1903</th>
      <td>37.0</td>
      <td>25.073858</td>
      <td>55.229844</td>
      <td>675000</td>
      <td>1</td>
      <td>2</td>
      <td>2.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>68.748220</td>
    </tr>
    <tr>
      <th>1904</th>
      <td>36.0</td>
      <td>25.079130</td>
      <td>55.154713</td>
      <td>760887</td>
      <td>1</td>
      <td>2</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>74.322400</td>
    </tr>
  </tbody>
</table>
<p>5 rows × 29 columns</p>
</div>




```python
House_Price_Data.tail(7)
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
      <th>private_garden_recode</th>
      <th>private_gym_recode</th>
      <th>private_jacuzzi_recode</th>
      <th>private_pool_recode</th>
      <th>security_recode</th>
      <th>shared_gym_recode</th>
      <th>shared_pool_recode</th>
      <th>shared_spa_recode</th>
      <th>view_of_water_recode</th>
      <th>size_in_m_2</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>1898</th>
      <td>46.0</td>
      <td>25.104330</td>
      <td>55.148769</td>
      <td>2700000</td>
      <td>1</td>
      <td>2</td>
      <td>2.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>99.963628</td>
    </tr>
    <tr>
      <th>1899</th>
      <td>27.0</td>
      <td>25.037477</td>
      <td>55.221942</td>
      <td>550000</td>
      <td>1</td>
      <td>2</td>
      <td>2.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>78.688841</td>
    </tr>
    <tr>
      <th>1900</th>
      <td>42.0</td>
      <td>25.176892</td>
      <td>55.310712</td>
      <td>1500000</td>
      <td>2</td>
      <td>2</td>
      <td>3.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>100.985561</td>
    </tr>
    <tr>
      <th>1901</th>
      <td>42.0</td>
      <td>25.166145</td>
      <td>55.276684</td>
      <td>1230000</td>
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
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>70.606280</td>
    </tr>
    <tr>
      <th>1902</th>
      <td>16.0</td>
      <td>25.206500</td>
      <td>55.345056</td>
      <td>2900000</td>
      <td>3</td>
      <td>5</td>
      <td>2.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>179.302790</td>
    </tr>
    <tr>
      <th>1903</th>
      <td>37.0</td>
      <td>25.073858</td>
      <td>55.229844</td>
      <td>675000</td>
      <td>1</td>
      <td>2</td>
      <td>2.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>68.748220</td>
    </tr>
    <tr>
      <th>1904</th>
      <td>36.0</td>
      <td>25.079130</td>
      <td>55.154713</td>
      <td>760887</td>
      <td>1</td>
      <td>2</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>74.322400</td>
    </tr>
  </tbody>
</table>
<p>7 rows × 29 columns</p>
</div>



<br>

Mathematically the operation $tail()$ could be defined as:

Let $\hspace{0.1cm} D= \begin{pmatrix}
x_1^t \\
x_2^t \\
... \\
x_n^t
\end{pmatrix}\hspace{0.1cm}$ be the data matrix that represent the data-frame $\hspace{0.1cm}df\hspace{0.1cm}$, then:



$$df.tail(k) \hspace{0.1cm}=\hspace{0.1cm} D[\hspace{0.1cm}(n-k+1):n \hspace{0.1cm},\hspace{0.1cm} : \hspace{0.1cm}] \hspace{0.1cm} = \hspace{0.1cm} \begin{pmatrix}
x_{n-k+1}^t \\
x_{n-k+2}^t \\
... \\
x_n^t
\end{pmatrix}$$





<br>


# Columns Names

We can get the column names of a data-frame:


```python
House_Price_Data.columns
```




    Index(['neighborhood_recode', 'latitude', 'longitude', 'price',
           'no_of_bedrooms', 'no_of_bathrooms', 'quality_recode',
           'maid_room_recode', 'unfurnished_recode', 'balcony_recode',
           'barbecue_area_recode', 'central_ac_recode',
           'childrens_play_area_recode', 'childrens_pool_recode',
           'concierge_recode', 'covered_parking_recode',
           'kitchen_appliances_recode', 'maid_service_recode',
           'pets_allowed_recode', 'private_garden_recode', 'private_gym_recode',
           'private_jacuzzi_recode', 'private_pool_recode', 'security_recode',
           'shared_gym_recode', 'shared_pool_recode', 'shared_spa_recode',
           'view_of_water_recode', 'size_in_m_2'],
          dtype='object')



<br>

We will denote the $\hspace{0.1cm} X_j\hspace{0.1cm}$ column name as $\hspace{0.1cm}name(X_j)$.


<br>

# Selecting columns from a data-frame

## loc method

With `loc` method we can select rows from a data-frame using the column names:

```python
House_Price_Data.loc[ : , ['latitude', 'price', 'no_of_bathrooms', 'quality_recode', 'balcony_recode']]
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
      <th>price</th>
      <th>no_of_bathrooms</th>
      <th>quality_recode</th>
      <th>balcony_recode</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>25.113208</td>
      <td>2700000</td>
      <td>2</td>
      <td>2.0</td>
      <td>1.0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>25.106809</td>
      <td>2850000</td>
      <td>2</td>
      <td>2.0</td>
      <td>1.0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>25.063302</td>
      <td>1150000</td>
      <td>5</td>
      <td>2.0</td>
      <td>1.0</td>
    </tr>
    <tr>
      <th>3</th>
      <td>25.227295</td>
      <td>2850000</td>
      <td>3</td>
      <td>1.0</td>
      <td>1.0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>25.114275</td>
      <td>1729200</td>
      <td>1</td>
      <td>2.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>1900</th>
      <td>25.176892</td>
      <td>1500000</td>
      <td>2</td>
      <td>3.0</td>
      <td>1.0</td>
    </tr>
    <tr>
      <th>1901</th>
      <td>25.166145</td>
      <td>1230000</td>
      <td>2</td>
      <td>2.0</td>
      <td>1.0</td>
    </tr>
    <tr>
      <th>1902</th>
      <td>25.206500</td>
      <td>2900000</td>
      <td>5</td>
      <td>2.0</td>
      <td>1.0</td>
    </tr>
    <tr>
      <th>1903</th>
      <td>25.073858</td>
      <td>675000</td>
      <td>2</td>
      <td>2.0</td>
      <td>1.0</td>
    </tr>
    <tr>
      <th>1904</th>
      <td>25.079130</td>
      <td>760887</td>
      <td>2</td>
      <td>0.0</td>
      <td>1.0</td>
    </tr>
  </tbody>
</table>
<p>1905 rows × 5 columns</p>
</div>


<br>

Mathematically `loc[]`select operation could be define as:

$$df.loc[\hspace{0.1cm} : \hspace{0.1cm} , \hspace{0.1cm} [\hspace{0.1cm}name(X_1), name(X_3), name(X_6) \hspace{0.1cm}]\hspace{0.1cm}] \hspace{0.1cm}=\hspace{0.1cm} D[\hspace{0.1cm} : \hspace{0.1cm}, \hspace{0.1cm} [\hspace{0.1cm} name(X_1),name(X_3),name(X_6) \hspace{0.1cm}] \hspace{0.1cm}] \hspace{0.1cm}=\hspace{0.1cm} \left( X_1 , X_3 , X_6 \right) \hspace{0.1cm}=\hspace{0.1cm} \left( \hspace{0.1cm} (x_{i1} , x_{i3}, x_{i6}) \hspace{0.1cm}:\hspace{0.1cm} i = 1,...,n \hspace{0.1cm}\right) \hspace{0.1cm}= \hspace{0.1cm}\left(\hspace{0.1cm} x_{i}[1,3,6] \hspace{0.1cm}:\hspace{0.1cm} i = 1,...,n \hspace{0.1cm}\right)$$


where: $\hspace{0.1cm}x_{i}[1,3,6] \hspace{0.1cm}=\hspace{0.1cm} (x_{i1} , x_{i3}, x_{i6})$

<br>



## iloc method

With `iloc` method we can select columns from a data-frame using the index of the columns:

```python
House_Price_Data.iloc[ : , 0:6]
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
    </tr>
    <tr>
      <th>1</th>
      <td>46.0</td>
      <td>25.106809</td>
      <td>55.151201</td>
      <td>2850000</td>
      <td>2</td>
      <td>2</td>
    </tr>
    <tr>
      <th>2</th>
      <td>36.0</td>
      <td>25.063302</td>
      <td>55.137728</td>
      <td>1150000</td>
      <td>3</td>
      <td>5</td>
    </tr>
    <tr>
      <th>3</th>
      <td>11.0</td>
      <td>25.227295</td>
      <td>55.341761</td>
      <td>2850000</td>
      <td>2</td>
      <td>3</td>
    </tr>
    <tr>
      <th>4</th>
      <td>46.0</td>
      <td>25.114275</td>
      <td>55.139764</td>
      <td>1729200</td>
      <td>0</td>
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
      <td>42.0</td>
      <td>25.176892</td>
      <td>55.310712</td>
      <td>1500000</td>
      <td>2</td>
      <td>2</td>
    </tr>
    <tr>
      <th>1901</th>
      <td>42.0</td>
      <td>25.166145</td>
      <td>55.276684</td>
      <td>1230000</td>
      <td>1</td>
      <td>2</td>
    </tr>
    <tr>
      <th>1902</th>
      <td>16.0</td>
      <td>25.206500</td>
      <td>55.345056</td>
      <td>2900000</td>
      <td>3</td>
      <td>5</td>
    </tr>
    <tr>
      <th>1903</th>
      <td>37.0</td>
      <td>25.073858</td>
      <td>55.229844</td>
      <td>675000</td>
      <td>1</td>
      <td>2</td>
    </tr>
    <tr>
      <th>1904</th>
      <td>36.0</td>
      <td>25.079130</td>
      <td>55.154713</td>
      <td>760887</td>
      <td>1</td>
      <td>2</td>
    </tr>
  </tbody>
</table>
<p>1905 rows × 6 columns</p>
</div>


<br>

```python
House_Price_Data.iloc[ : , [0,3,5]]
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
      <th>price</th>
      <th>no_of_bathrooms</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>46.0</td>
      <td>2700000</td>
      <td>2</td>
    </tr>
    <tr>
      <th>1</th>
      <td>46.0</td>
      <td>2850000</td>
      <td>2</td>
    </tr>
    <tr>
      <th>2</th>
      <td>36.0</td>
      <td>1150000</td>
      <td>5</td>
    </tr>
    <tr>
      <th>3</th>
      <td>11.0</td>
      <td>2850000</td>
      <td>3</td>
    </tr>
    <tr>
      <th>4</th>
      <td>46.0</td>
      <td>1729200</td>
      <td>1</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>1900</th>
      <td>42.0</td>
      <td>1500000</td>
      <td>2</td>
    </tr>
    <tr>
      <th>1901</th>
      <td>42.0</td>
      <td>1230000</td>
      <td>2</td>
    </tr>
    <tr>
      <th>1902</th>
      <td>16.0</td>
      <td>2900000</td>
      <td>5</td>
    </tr>
    <tr>
      <th>1903</th>
      <td>37.0</td>
      <td>675000</td>
      <td>2</td>
    </tr>
    <tr>
      <th>1904</th>
      <td>36.0</td>
      <td>760887</td>
      <td>2</td>
    </tr>
  </tbody>
</table>
<p>1905 rows × 3 columns</p>
</div>


<br>

Mathematically `iloc[]`select operation could be define as:

$$df.iloc[\hspace{0.1cm} : \hspace{0.1cm} , \hspace{0.1cm}   2:5  \hspace{0.1cm}] \hspace{0.1cm}=\hspace{0.1cm} D[\hspace{0.1cm} : \hspace{0.1cm}, \hspace{0.1cm} 2:5 \hspace{0.1cm}] \hspace{0.1cm}=\hspace{0.1cm} \left( X_2 , X_3 , X_4, X_5 \right) \hspace{0.1cm}=\hspace{0.1cm} \left( \hspace{0.1cm} X_j \hspace{0.1cm}:\hspace{0.1cm} j = 1,...,5 \hspace{0.1cm}\right)$$


$$df.iloc[\hspace{0.1cm} : \hspace{0.1cm} , \hspace{0.1cm}   [1,3,6]  \hspace{0.1cm}] \hspace{0.1cm}=\hspace{0.1cm} D[\hspace{0.1cm} : \hspace{0.1cm} , [1,3,6]  [1,3,6]  \hspace{0.1cm}] \hspace{0.1cm}=\hspace{0.1cm} \left( X_1 , X_3 , X_6 \right) \hspace{0.1cm}=\hspace{0.1cm} \left( \hspace{0.1cm} X_j \hspace{0.1cm}:\hspace{0.1cm} j =1,3,6 \hspace{0.1cm}\right)$$




<br>


# Filter rows of a data-frame

## `loc` method 

With the `loc` method we can filter rows that meet a condition related to their values for some columns:

```python
House_Price_Data.loc[ House_Price_Data.price < 500000 , : ]
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
      <th>private_garden_recode</th>
      <th>private_gym_recode</th>
      <th>private_jacuzzi_recode</th>
      <th>private_pool_recode</th>
      <th>security_recode</th>
      <th>shared_gym_recode</th>
      <th>shared_pool_recode</th>
      <th>shared_spa_recode</th>
      <th>view_of_water_recode</th>
      <th>size_in_m_2</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>49</th>
      <td>12.0</td>
      <td>25.016736</td>
      <td>55.251010</td>
      <td>365000</td>
      <td>0</td>
      <td>1</td>
      <td>2.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>41.899253</td>
    </tr>
    <tr>
      <th>55</th>
      <td>36.0</td>
      <td>25.065736</td>
      <td>55.137452</td>
      <td>375000</td>
      <td>0</td>
      <td>1</td>
      <td>2.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>41.806350</td>
    </tr>
    <tr>
      <th>146</th>
      <td>27.0</td>
      <td>25.044572</td>
      <td>55.218948</td>
      <td>390000</td>
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
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>78.874647</td>
    </tr>
    <tr>
      <th>160</th>
      <td>27.0</td>
      <td>25.042264</td>
      <td>55.217360</td>
      <td>410000</td>
      <td>1</td>
      <td>2</td>
      <td>2.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>90.023007</td>
    </tr>
    <tr>
      <th>194</th>
      <td>38.0</td>
      <td>25.043352</td>
      <td>55.193510</td>
      <td>310000</td>
      <td>0</td>
      <td>1</td>
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
      <td>0.0</td>
      <td>0.0</td>
      <td>39.483775</td>
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
      <th>1848</th>
      <td>24.0</td>
      <td>25.091311</td>
      <td>55.378277</td>
      <td>270000</td>
      <td>0</td>
      <td>1</td>
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
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>42.735380</td>
    </tr>
    <tr>
      <th>1849</th>
      <td>36.0</td>
      <td>25.071246</td>
      <td>55.140806</td>
      <td>499000</td>
      <td>1</td>
      <td>1</td>
      <td>2.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>62.430816</td>
    </tr>
    <tr>
      <th>1857</th>
      <td>36.0</td>
      <td>25.078148</td>
      <td>55.148277</td>
      <td>400888</td>
      <td>0</td>
      <td>1</td>
      <td>2.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>37.439909</td>
    </tr>
    <tr>
      <th>1874</th>
      <td>50.0</td>
      <td>25.003730</td>
      <td>55.297034</td>
      <td>488888</td>
      <td>1</td>
      <td>2</td>
      <td>2.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>64.846294</td>
    </tr>
    <tr>
      <th>1897</th>
      <td>4.0</td>
      <td>25.153080</td>
      <td>55.254242</td>
      <td>360000</td>
      <td>0</td>
      <td>1</td>
      <td>2.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>55.741800</td>
    </tr>
  </tbody>
</table>
<p>114 rows × 29 columns</p>
</div>


<br>

```python
House_Price_Data.loc[ House_Price_Data.price <= 1000000 , : ]
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
      <th>private_garden_recode</th>
      <th>private_gym_recode</th>
      <th>private_jacuzzi_recode</th>
      <th>private_pool_recode</th>
      <th>security_recode</th>
      <th>shared_gym_recode</th>
      <th>shared_pool_recode</th>
      <th>shared_spa_recode</th>
      <th>view_of_water_recode</th>
      <th>size_in_m_2</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>19</th>
      <td>9.0</td>
      <td>25.180301</td>
      <td>55.263892</td>
      <td>950000</td>
      <td>1</td>
      <td>2</td>
      <td>2.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>83.055282</td>
    </tr>
    <tr>
      <th>34</th>
      <td>6.0</td>
      <td>25.060310</td>
      <td>55.241403</td>
      <td>750000</td>
      <td>1</td>
      <td>1</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>73.950788</td>
    </tr>
    <tr>
      <th>35</th>
      <td>6.0</td>
      <td>25.060310</td>
      <td>55.241403</td>
      <td>991000</td>
      <td>2</td>
      <td>2</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>107.953286</td>
    </tr>
    <tr>
      <th>49</th>
      <td>12.0</td>
      <td>25.016736</td>
      <td>55.251010</td>
      <td>365000</td>
      <td>0</td>
      <td>1</td>
      <td>2.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>41.899253</td>
    </tr>
    <tr>
      <th>55</th>
      <td>36.0</td>
      <td>25.065736</td>
      <td>55.137452</td>
      <td>375000</td>
      <td>0</td>
      <td>1</td>
      <td>2.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>41.806350</td>
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
      <th>1894</th>
      <td>15.0</td>
      <td>25.191107</td>
      <td>55.269910</td>
      <td>980888</td>
      <td>1</td>
      <td>1</td>
      <td>2.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>101.078464</td>
    </tr>
    <tr>
      <th>1897</th>
      <td>4.0</td>
      <td>25.153080</td>
      <td>55.254242</td>
      <td>360000</td>
      <td>0</td>
      <td>1</td>
      <td>2.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>55.741800</td>
    </tr>
    <tr>
      <th>1899</th>
      <td>27.0</td>
      <td>25.037477</td>
      <td>55.221942</td>
      <td>550000</td>
      <td>1</td>
      <td>2</td>
      <td>2.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>78.688841</td>
    </tr>
    <tr>
      <th>1903</th>
      <td>37.0</td>
      <td>25.073858</td>
      <td>55.229844</td>
      <td>675000</td>
      <td>1</td>
      <td>2</td>
      <td>2.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>68.748220</td>
    </tr>
    <tr>
      <th>1904</th>
      <td>36.0</td>
      <td>25.079130</td>
      <td>55.154713</td>
      <td>760887</td>
      <td>1</td>
      <td>2</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>74.322400</td>
    </tr>
  </tbody>
</table>
<p>591 rows × 29 columns</p>
</div>


<br>

```python
House_Price_Data.loc[ House_Price_Data.price > 1000000 , : ]
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
      <th>private_garden_recode</th>
      <th>private_gym_recode</th>
      <th>private_jacuzzi_recode</th>
      <th>private_pool_recode</th>
      <th>security_recode</th>
      <th>shared_gym_recode</th>
      <th>shared_pool_recode</th>
      <th>shared_spa_recode</th>
      <th>view_of_water_recode</th>
      <th>size_in_m_2</th>
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
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>100.242337</td>
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
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>146.972546</td>
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
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>181.253753</td>
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
      <td>0.0</td>
      <td>0.0</td>
      <td>187.664060</td>
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
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>47.101821</td>
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
      <th>1896</th>
      <td>15.0</td>
      <td>25.196489</td>
      <td>55.272126</td>
      <td>18040888</td>
      <td>4</td>
      <td>4</td>
      <td>2.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>488.019459</td>
    </tr>
    <tr>
      <th>1898</th>
      <td>46.0</td>
      <td>25.104330</td>
      <td>55.148769</td>
      <td>2700000</td>
      <td>1</td>
      <td>2</td>
      <td>2.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>99.963628</td>
    </tr>
    <tr>
      <th>1900</th>
      <td>42.0</td>
      <td>25.176892</td>
      <td>55.310712</td>
      <td>1500000</td>
      <td>2</td>
      <td>2</td>
      <td>3.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>100.985561</td>
    </tr>
    <tr>
      <th>1901</th>
      <td>42.0</td>
      <td>25.166145</td>
      <td>55.276684</td>
      <td>1230000</td>
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
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>70.606280</td>
    </tr>
    <tr>
      <th>1902</th>
      <td>16.0</td>
      <td>25.206500</td>
      <td>55.345056</td>
      <td>2900000</td>
      <td>3</td>
      <td>5</td>
      <td>2.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>179.302790</td>
    </tr>
  </tbody>
</table>
<p>1314 rows × 29 columns</p>
</div>


<br>

```python
House_Price_Data.loc[ House_Price_Data.no_of_bedrooms == 2 , : ]
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
      <th>private_garden_recode</th>
      <th>private_gym_recode</th>
      <th>private_jacuzzi_recode</th>
      <th>private_pool_recode</th>
      <th>security_recode</th>
      <th>shared_gym_recode</th>
      <th>shared_pool_recode</th>
      <th>shared_spa_recode</th>
      <th>view_of_water_recode</th>
      <th>size_in_m_2</th>
    </tr>
  </thead>
  <tbody>
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
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>146.972546</td>
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
      <td>0.0</td>
      <td>0.0</td>
      <td>187.664060</td>
    </tr>
    <tr>
      <th>6</th>
      <td>46.0</td>
      <td>25.114275</td>
      <td>55.139764</td>
      <td>8503600</td>
      <td>2</td>
      <td>3</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>191.565986</td>
    </tr>
    <tr>
      <th>9</th>
      <td>15.0</td>
      <td>25.194935</td>
      <td>55.282665</td>
      <td>2690000</td>
      <td>2</td>
      <td>3</td>
      <td>2.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>141.305463</td>
    </tr>
    <tr>
      <th>11</th>
      <td>22.0</td>
      <td>25.075017</td>
      <td>55.137997</td>
      <td>2094999</td>
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
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>98.291374</td>
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
      <th>1881</th>
      <td>49.0</td>
      <td>25.088903</td>
      <td>55.171065</td>
      <td>1850000</td>
      <td>2</td>
      <td>2</td>
      <td>2.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>130.064200</td>
    </tr>
    <tr>
      <th>1882</th>
      <td>22.0</td>
      <td>25.080542</td>
      <td>55.140343</td>
      <td>2090000</td>
      <td>2</td>
      <td>2</td>
      <td>2.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>98.570083</td>
    </tr>
    <tr>
      <th>1884</th>
      <td>34.0</td>
      <td>25.072569</td>
      <td>55.126527</td>
      <td>3300000</td>
      <td>2</td>
      <td>3</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>109.625540</td>
    </tr>
    <tr>
      <th>1895</th>
      <td>22.0</td>
      <td>25.081243</td>
      <td>55.145120</td>
      <td>1350000</td>
      <td>2</td>
      <td>4</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>146.600934</td>
    </tr>
    <tr>
      <th>1900</th>
      <td>42.0</td>
      <td>25.176892</td>
      <td>55.310712</td>
      <td>1500000</td>
      <td>2</td>
      <td>2</td>
      <td>3.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>100.985561</td>
    </tr>
  </tbody>
</table>
<p>729 rows × 29 columns</p>
</div>



<br>

```python
House_Price_Data.loc[ House_Price_Data.no_of_bedrooms != 2 , : ]
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
      <th>private_garden_recode</th>
      <th>private_gym_recode</th>
      <th>private_jacuzzi_recode</th>
      <th>private_pool_recode</th>
      <th>security_recode</th>
      <th>shared_gym_recode</th>
      <th>shared_pool_recode</th>
      <th>shared_spa_recode</th>
      <th>view_of_water_recode</th>
      <th>size_in_m_2</th>
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
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>100.242337</td>
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
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>181.253753</td>
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
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>47.101821</td>
    </tr>
    <tr>
      <th>5</th>
      <td>46.0</td>
      <td>25.114275</td>
      <td>55.139764</td>
      <td>3119900</td>
      <td>1</td>
      <td>2</td>
      <td>2.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>94.296545</td>
    </tr>
    <tr>
      <th>7</th>
      <td>46.0</td>
      <td>25.114275</td>
      <td>55.139764</td>
      <td>3119900</td>
      <td>1</td>
      <td>2</td>
      <td>2.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>94.296545</td>
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
      <th>1899</th>
      <td>27.0</td>
      <td>25.037477</td>
      <td>55.221942</td>
      <td>550000</td>
      <td>1</td>
      <td>2</td>
      <td>2.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>78.688841</td>
    </tr>
    <tr>
      <th>1901</th>
      <td>42.0</td>
      <td>25.166145</td>
      <td>55.276684</td>
      <td>1230000</td>
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
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>70.606280</td>
    </tr>
    <tr>
      <th>1902</th>
      <td>16.0</td>
      <td>25.206500</td>
      <td>55.345056</td>
      <td>2900000</td>
      <td>3</td>
      <td>5</td>
      <td>2.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>179.302790</td>
    </tr>
    <tr>
      <th>1903</th>
      <td>37.0</td>
      <td>25.073858</td>
      <td>55.229844</td>
      <td>675000</td>
      <td>1</td>
      <td>2</td>
      <td>2.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>68.748220</td>
    </tr>
    <tr>
      <th>1904</th>
      <td>36.0</td>
      <td>25.079130</td>
      <td>55.154713</td>
      <td>760887</td>
      <td>1</td>
      <td>2</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>74.322400</td>
    </tr>
  </tbody>
</table>
<p>1176 rows × 29 columns</p>
</div>


<br>

```python
House_Price_Data.loc[ House_Price_Data['no_of_bedrooms'] != 2 , : ]
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
      <th>private_garden_recode</th>
      <th>private_gym_recode</th>
      <th>private_jacuzzi_recode</th>
      <th>private_pool_recode</th>
      <th>security_recode</th>
      <th>shared_gym_recode</th>
      <th>shared_pool_recode</th>
      <th>shared_spa_recode</th>
      <th>view_of_water_recode</th>
      <th>size_in_m_2</th>
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
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>100.242337</td>
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
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>181.253753</td>
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
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>47.101821</td>
    </tr>
    <tr>
      <th>5</th>
      <td>46.0</td>
      <td>25.114275</td>
      <td>55.139764</td>
      <td>3119900</td>
      <td>1</td>
      <td>2</td>
      <td>2.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>94.296545</td>
    </tr>
    <tr>
      <th>7</th>
      <td>46.0</td>
      <td>25.114275</td>
      <td>55.139764</td>
      <td>3119900</td>
      <td>1</td>
      <td>2</td>
      <td>2.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>94.296545</td>
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
      <th>1899</th>
      <td>27.0</td>
      <td>25.037477</td>
      <td>55.221942</td>
      <td>550000</td>
      <td>1</td>
      <td>2</td>
      <td>2.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>78.688841</td>
    </tr>
    <tr>
      <th>1901</th>
      <td>42.0</td>
      <td>25.166145</td>
      <td>55.276684</td>
      <td>1230000</td>
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
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>70.606280</td>
    </tr>
    <tr>
      <th>1902</th>
      <td>16.0</td>
      <td>25.206500</td>
      <td>55.345056</td>
      <td>2900000</td>
      <td>3</td>
      <td>5</td>
      <td>2.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>179.302790</td>
    </tr>
    <tr>
      <th>1903</th>
      <td>37.0</td>
      <td>25.073858</td>
      <td>55.229844</td>
      <td>675000</td>
      <td>1</td>
      <td>2</td>
      <td>2.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>68.748220</td>
    </tr>
    <tr>
      <th>1904</th>
      <td>36.0</td>
      <td>25.079130</td>
      <td>55.154713</td>
      <td>760887</td>
      <td>1</td>
      <td>2</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>74.322400</td>
    </tr>
  </tbody>
</table>
<p>1176 rows × 29 columns</p>
</div>


<br>

We can use `isin()` method to filter rows that have a value for some column that belongs to a specific set of  values.

```python
House_Price_Data.loc[ House_Price_Data['no_of_bedrooms'].isin([2,4]) , : ]
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
      <th>private_garden_recode</th>
      <th>private_gym_recode</th>
      <th>private_jacuzzi_recode</th>
      <th>private_pool_recode</th>
      <th>security_recode</th>
      <th>shared_gym_recode</th>
      <th>shared_pool_recode</th>
      <th>shared_spa_recode</th>
      <th>view_of_water_recode</th>
      <th>size_in_m_2</th>
    </tr>
  </thead>
  <tbody>
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
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>146.972546</td>
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
      <td>0.0</td>
      <td>0.0</td>
      <td>187.664060</td>
    </tr>
    <tr>
      <th>6</th>
      <td>46.0</td>
      <td>25.114275</td>
      <td>55.139764</td>
      <td>8503600</td>
      <td>2</td>
      <td>3</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>191.565986</td>
    </tr>
    <tr>
      <th>9</th>
      <td>15.0</td>
      <td>25.194935</td>
      <td>55.282665</td>
      <td>2690000</td>
      <td>2</td>
      <td>3</td>
      <td>2.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>141.305463</td>
    </tr>
    <tr>
      <th>11</th>
      <td>22.0</td>
      <td>25.075017</td>
      <td>55.137997</td>
      <td>2094999</td>
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
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>98.291374</td>
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
      <th>1885</th>
      <td>46.0</td>
      <td>25.103972</td>
      <td>55.149621</td>
      <td>31440000</td>
      <td>4</td>
      <td>6</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>607.771426</td>
    </tr>
    <tr>
      <th>1891</th>
      <td>11.0</td>
      <td>25.226946</td>
      <td>55.343628</td>
      <td>7000000</td>
      <td>4</td>
      <td>6</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>377.929404</td>
    </tr>
    <tr>
      <th>1895</th>
      <td>22.0</td>
      <td>25.081243</td>
      <td>55.145120</td>
      <td>1350000</td>
      <td>2</td>
      <td>4</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>146.600934</td>
    </tr>
    <tr>
      <th>1896</th>
      <td>15.0</td>
      <td>25.196489</td>
      <td>55.272126</td>
      <td>18040888</td>
      <td>4</td>
      <td>4</td>
      <td>2.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>488.019459</td>
    </tr>
    <tr>
      <th>1900</th>
      <td>42.0</td>
      <td>25.176892</td>
      <td>55.310712</td>
      <td>1500000</td>
      <td>2</td>
      <td>2</td>
      <td>3.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>100.985561</td>
    </tr>
  </tbody>
</table>
<p>799 rows × 29 columns</p>
</div>


<br>

We can also use the `isin()` method to filter out rows that have a value for a certain column that doesn't belong to a specific set of values.


```python
House_Price_Data.loc[ House_Price_Data['no_of_bedrooms'].isin([2,4]) == False , : ]
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
      <th>private_garden_recode</th>
      <th>private_gym_recode</th>
      <th>private_jacuzzi_recode</th>
      <th>private_pool_recode</th>
      <th>security_recode</th>
      <th>shared_gym_recode</th>
      <th>shared_pool_recode</th>
      <th>shared_spa_recode</th>
      <th>view_of_water_recode</th>
      <th>size_in_m_2</th>
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
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>100.242337</td>
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
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>181.253753</td>
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
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>47.101821</td>
    </tr>
    <tr>
      <th>5</th>
      <td>46.0</td>
      <td>25.114275</td>
      <td>55.139764</td>
      <td>3119900</td>
      <td>1</td>
      <td>2</td>
      <td>2.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>94.296545</td>
    </tr>
    <tr>
      <th>7</th>
      <td>46.0</td>
      <td>25.114275</td>
      <td>55.139764</td>
      <td>3119900</td>
      <td>1</td>
      <td>2</td>
      <td>2.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>94.296545</td>
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
      <th>1899</th>
      <td>27.0</td>
      <td>25.037477</td>
      <td>55.221942</td>
      <td>550000</td>
      <td>1</td>
      <td>2</td>
      <td>2.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>78.688841</td>
    </tr>
    <tr>
      <th>1901</th>
      <td>42.0</td>
      <td>25.166145</td>
      <td>55.276684</td>
      <td>1230000</td>
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
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>70.606280</td>
    </tr>
    <tr>
      <th>1902</th>
      <td>16.0</td>
      <td>25.206500</td>
      <td>55.345056</td>
      <td>2900000</td>
      <td>3</td>
      <td>5</td>
      <td>2.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>179.302790</td>
    </tr>
    <tr>
      <th>1903</th>
      <td>37.0</td>
      <td>25.073858</td>
      <td>55.229844</td>
      <td>675000</td>
      <td>1</td>
      <td>2</td>
      <td>2.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>68.748220</td>
    </tr>
    <tr>
      <th>1904</th>
      <td>36.0</td>
      <td>25.079130</td>
      <td>55.154713</td>
      <td>760887</td>
      <td>1</td>
      <td>2</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>74.322400</td>
    </tr>
  </tbody>
</table>
<p>1106 rows × 29 columns</p>
</div>


<br>


AÑADIR CONDICIONES ENCADENADASPOR & , | ETC



Mathematically `loc[]` filter operation could be define as:






<br>

We can also filter rows and select columns at the same time using the `loc` method:

```python
House_Price_Data.loc[ House_Price_Data.price > 1000000 , ['price', 'no_of_bedrooms', 'quality_recode'] ]
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
      <th>no_of_bedrooms</th>
      <th>quality_recode</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>2700000</td>
      <td>1</td>
      <td>2.0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2850000</td>
      <td>2</td>
      <td>2.0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>1150000</td>
      <td>3</td>
      <td>2.0</td>
    </tr>
    <tr>
      <th>3</th>
      <td>2850000</td>
      <td>2</td>
      <td>1.0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>1729200</td>
      <td>0</td>
      <td>2.0</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>1896</th>
      <td>18040888</td>
      <td>4</td>
      <td>2.0</td>
    </tr>
    <tr>
      <th>1898</th>
      <td>2700000</td>
      <td>1</td>
      <td>2.0</td>
    </tr>
    <tr>
      <th>1900</th>
      <td>1500000</td>
      <td>2</td>
      <td>3.0</td>
    </tr>
    <tr>
      <th>1901</th>
      <td>1230000</td>
      <td>1</td>
      <td>2.0</td>
    </tr>
    <tr>
      <th>1902</th>
      <td>2900000</td>
      <td>3</td>
      <td>2.0</td>
    </tr>
  </tbody>
</table>
<p>1314 rows × 3 columns</p>
</div>


<br>


## `iloc` method 

With the `iloc` method we can filter rows using the index of the rows:

```python
House_Price_Data.iloc[0:5 , :]
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
      <th>private_garden_recode</th>
      <th>private_gym_recode</th>
      <th>private_jacuzzi_recode</th>
      <th>private_pool_recode</th>
      <th>security_recode</th>
      <th>shared_gym_recode</th>
      <th>shared_pool_recode</th>
      <th>shared_spa_recode</th>
      <th>view_of_water_recode</th>
      <th>size_in_m_2</th>
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
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>100.242337</td>
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
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>146.972546</td>
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
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>181.253753</td>
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
      <td>0.0</td>
      <td>0.0</td>
      <td>187.664060</td>
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
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>47.101821</td>
    </tr>
  </tbody>
</table>
<p>5 rows × 29 columns</p>
</div>


<br>

```python
House_Price_Data.iloc[15:120 , :]
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
      <th>private_garden_recode</th>
      <th>private_gym_recode</th>
      <th>private_jacuzzi_recode</th>
      <th>private_pool_recode</th>
      <th>security_recode</th>
      <th>shared_gym_recode</th>
      <th>shared_pool_recode</th>
      <th>shared_spa_recode</th>
      <th>view_of_water_recode</th>
      <th>size_in_m_2</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>15</th>
      <td>46.0</td>
      <td>25.132021</td>
      <td>55.151405</td>
      <td>2349990</td>
      <td>1</td>
      <td>1</td>
      <td>2.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>103.029427</td>
    </tr>
    <tr>
      <th>16</th>
      <td>46.0</td>
      <td>25.132021</td>
      <td>55.151405</td>
      <td>3499000</td>
      <td>2</td>
      <td>2</td>
      <td>2.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>151.710599</td>
    </tr>
    <tr>
      <th>17</th>
      <td>15.0</td>
      <td>25.198316</td>
      <td>55.270758</td>
      <td>2700000</td>
      <td>2</td>
      <td>3</td>
      <td>2.0</td>
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
      <td>0.0</td>
      <td>1.0</td>
      <td>125.233244</td>
    </tr>
    <tr>
      <th>18</th>
      <td>15.0</td>
      <td>25.197020</td>
      <td>55.271023</td>
      <td>1490000</td>
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
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>108.417801</td>
    </tr>
    <tr>
      <th>19</th>
      <td>9.0</td>
      <td>25.180301</td>
      <td>55.263892</td>
      <td>950000</td>
      <td>1</td>
      <td>2</td>
      <td>2.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>83.055282</td>
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
      <th>115</th>
      <td>15.0</td>
      <td>25.196398</td>
      <td>55.271002</td>
      <td>2100000</td>
      <td>2</td>
      <td>3</td>
      <td>2.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>125.790662</td>
    </tr>
    <tr>
      <th>116</th>
      <td>15.0</td>
      <td>25.191753</td>
      <td>55.272818</td>
      <td>1400000</td>
      <td>1</td>
      <td>2</td>
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
      <td>0.0</td>
      <td>0.0</td>
      <td>79.896580</td>
    </tr>
    <tr>
      <th>117</th>
      <td>45.0</td>
      <td>25.189554</td>
      <td>55.273783</td>
      <td>2300000</td>
      <td>2</td>
      <td>3</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>124.304214</td>
    </tr>
    <tr>
      <th>118</th>
      <td>9.0</td>
      <td>25.185823</td>
      <td>55.291922</td>
      <td>2300000</td>
      <td>2</td>
      <td>3</td>
      <td>2.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>133.966126</td>
    </tr>
    <tr>
      <th>119</th>
      <td>49.0</td>
      <td>25.090953</td>
      <td>55.169542</td>
      <td>1335000</td>
      <td>2</td>
      <td>2</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>124.118408</td>
    </tr>
  </tbody>
</table>
<p>105 rows × 29 columns</p>
</div>


<br>


```python
House_Price_Data.iloc[[6,10,15] , :]
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
      <th>private_garden_recode</th>
      <th>private_gym_recode</th>
      <th>private_jacuzzi_recode</th>
      <th>private_pool_recode</th>
      <th>security_recode</th>
      <th>shared_gym_recode</th>
      <th>shared_pool_recode</th>
      <th>shared_spa_recode</th>
      <th>view_of_water_recode</th>
      <th>size_in_m_2</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>6</th>
      <td>46.0</td>
      <td>25.114275</td>
      <td>55.139764</td>
      <td>8503600</td>
      <td>2</td>
      <td>3</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>191.565986</td>
    </tr>
    <tr>
      <th>10</th>
      <td>15.0</td>
      <td>25.198796</td>
      <td>55.271342</td>
      <td>3550000</td>
      <td>3</td>
      <td>4</td>
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
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>178.187954</td>
    </tr>
    <tr>
      <th>15</th>
      <td>46.0</td>
      <td>25.132021</td>
      <td>55.151405</td>
      <td>2349990</td>
      <td>1</td>
      <td>1</td>
      <td>2.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>103.029427</td>
    </tr>
  </tbody>
</table>
<p>3 rows × 29 columns</p>
</div>



<br>

We can filter rows and select columns at the same time using the `iloc` method as follows:

```python
House_Price_Data.iloc[3:15 , 2:5]
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
      <th>longitude</th>
      <th>price</th>
      <th>no_of_bedrooms</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>3</th>
      <td>55.341761</td>
      <td>2850000</td>
      <td>2</td>
    </tr>
    <tr>
      <th>4</th>
      <td>55.139764</td>
      <td>1729200</td>
      <td>0</td>
    </tr>
    <tr>
      <th>5</th>
      <td>55.139764</td>
      <td>3119900</td>
      <td>1</td>
    </tr>
    <tr>
      <th>6</th>
      <td>55.139764</td>
      <td>8503600</td>
      <td>2</td>
    </tr>
    <tr>
      <th>7</th>
      <td>55.139764</td>
      <td>3119900</td>
      <td>1</td>
    </tr>
    <tr>
      <th>8</th>
      <td>55.149275</td>
      <td>2100000</td>
      <td>3</td>
    </tr>
    <tr>
      <th>9</th>
      <td>55.282665</td>
      <td>2690000</td>
      <td>2</td>
    </tr>
    <tr>
      <th>10</th>
      <td>55.271342</td>
      <td>3550000</td>
      <td>3</td>
    </tr>
    <tr>
      <th>11</th>
      <td>55.137997</td>
      <td>2094999</td>
      <td>2</td>
    </tr>
    <tr>
      <th>12</th>
      <td>55.137997</td>
      <td>1049999</td>
      <td>1</td>
    </tr>
    <tr>
      <th>13</th>
      <td>55.151574</td>
      <td>1849000</td>
      <td>1</td>
    </tr>
    <tr>
      <th>14</th>
      <td>55.152216</td>
      <td>2089999</td>
      <td>1</td>
    </tr>
  </tbody>
</table>
</div>



<br>

# Traspose a data-frame

We can traspose a data-frame using `T` method:

```python
House_Price_Data.T
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
      <th>0</th>
      <th>1</th>
      <th>2</th>
      <th>3</th>
      <th>4</th>
      <th>5</th>
      <th>6</th>
      <th>7</th>
      <th>8</th>
      <th>9</th>
      <th>...</th>
      <th>1895</th>
      <th>1896</th>
      <th>1897</th>
      <th>1898</th>
      <th>1899</th>
      <th>1900</th>
      <th>1901</th>
      <th>1902</th>
      <th>1903</th>
      <th>1904</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>neighborhood_recode</th>
      <td>4.600000e+01</td>
      <td>4.600000e+01</td>
      <td>3.600000e+01</td>
      <td>1.100000e+01</td>
      <td>4.600000e+01</td>
      <td>4.600000e+01</td>
      <td>4.600000e+01</td>
      <td>4.600000e+01</td>
      <td>4.600000e+01</td>
      <td>1.500000e+01</td>
      <td>...</td>
      <td>2.200000e+01</td>
      <td>1.500000e+01</td>
      <td>4.000000</td>
      <td>4.600000e+01</td>
      <td>27.000000</td>
      <td>4.200000e+01</td>
      <td>4.200000e+01</td>
      <td>1.600000e+01</td>
      <td>37.000000</td>
      <td>36.000000</td>
    </tr>
    <tr>
      <th>latitude</th>
      <td>2.511321e+01</td>
      <td>2.510681e+01</td>
      <td>2.506330e+01</td>
      <td>2.522730e+01</td>
      <td>2.511427e+01</td>
      <td>2.511427e+01</td>
      <td>2.511427e+01</td>
      <td>2.511427e+01</td>
      <td>2.510667e+01</td>
      <td>2.519494e+01</td>
      <td>...</td>
      <td>2.508124e+01</td>
      <td>2.519649e+01</td>
      <td>25.153080</td>
      <td>2.510433e+01</td>
      <td>25.037477</td>
      <td>2.517689e+01</td>
      <td>2.516615e+01</td>
      <td>2.520650e+01</td>
      <td>25.073858</td>
      <td>25.079130</td>
    </tr>
    <tr>
      <th>longitude</th>
      <td>5.513893e+01</td>
      <td>5.515120e+01</td>
      <td>5.513773e+01</td>
      <td>5.534176e+01</td>
      <td>5.513976e+01</td>
      <td>5.513976e+01</td>
      <td>5.513976e+01</td>
      <td>5.513976e+01</td>
      <td>5.514928e+01</td>
      <td>5.528267e+01</td>
      <td>...</td>
      <td>5.514512e+01</td>
      <td>5.527213e+01</td>
      <td>55.254242</td>
      <td>5.514877e+01</td>
      <td>55.221942</td>
      <td>5.531071e+01</td>
      <td>5.527668e+01</td>
      <td>5.534506e+01</td>
      <td>55.229844</td>
      <td>55.154713</td>
    </tr>
    <tr>
      <th>price</th>
      <td>2.700000e+06</td>
      <td>2.850000e+06</td>
      <td>1.150000e+06</td>
      <td>2.850000e+06</td>
      <td>1.729200e+06</td>
      <td>3.119900e+06</td>
      <td>8.503600e+06</td>
      <td>3.119900e+06</td>
      <td>2.100000e+06</td>
      <td>2.690000e+06</td>
      <td>...</td>
      <td>1.350000e+06</td>
      <td>1.804089e+07</td>
      <td>360000.000000</td>
      <td>2.700000e+06</td>
      <td>550000.000000</td>
      <td>1.500000e+06</td>
      <td>1.230000e+06</td>
      <td>2.900000e+06</td>
      <td>675000.000000</td>
      <td>760887.000000</td>
    </tr>
    <tr>
      <th>no_of_bedrooms</th>
      <td>1.000000e+00</td>
      <td>2.000000e+00</td>
      <td>3.000000e+00</td>
      <td>2.000000e+00</td>
      <td>0.000000e+00</td>
      <td>1.000000e+00</td>
      <td>2.000000e+00</td>
      <td>1.000000e+00</td>
      <td>3.000000e+00</td>
      <td>2.000000e+00</td>
      <td>...</td>
      <td>2.000000e+00</td>
      <td>4.000000e+00</td>
      <td>0.000000</td>
      <td>1.000000e+00</td>
      <td>1.000000</td>
      <td>2.000000e+00</td>
      <td>1.000000e+00</td>
      <td>3.000000e+00</td>
      <td>1.000000</td>
      <td>1.000000</td>
    </tr>
    <tr>
      <th>no_of_bathrooms</th>
      <td>2.000000e+00</td>
      <td>2.000000e+00</td>
      <td>5.000000e+00</td>
      <td>3.000000e+00</td>
      <td>1.000000e+00</td>
      <td>2.000000e+00</td>
      <td>3.000000e+00</td>
      <td>2.000000e+00</td>
      <td>3.000000e+00</td>
      <td>3.000000e+00</td>
      <td>...</td>
      <td>4.000000e+00</td>
      <td>4.000000e+00</td>
      <td>1.000000</td>
      <td>2.000000e+00</td>
      <td>2.000000</td>
      <td>2.000000e+00</td>
      <td>2.000000e+00</td>
      <td>5.000000e+00</td>
      <td>2.000000</td>
      <td>2.000000</td>
    </tr>
    <tr>
      <th>quality_recode</th>
      <td>2.000000e+00</td>
      <td>2.000000e+00</td>
      <td>2.000000e+00</td>
      <td>1.000000e+00</td>
      <td>2.000000e+00</td>
      <td>2.000000e+00</td>
      <td>0.000000e+00</td>
      <td>2.000000e+00</td>
      <td>1.000000e+00</td>
      <td>2.000000e+00</td>
      <td>...</td>
      <td>1.000000e+00</td>
      <td>2.000000e+00</td>
      <td>2.000000</td>
      <td>2.000000e+00</td>
      <td>2.000000</td>
      <td>3.000000e+00</td>
      <td>2.000000e+00</td>
      <td>2.000000e+00</td>
      <td>2.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <th>maid_room_recode</th>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>1.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>1.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>...</td>
      <td>0.000000e+00</td>
      <td>1.000000e+00</td>
      <td>0.000000</td>
      <td>0.000000e+00</td>
      <td>0.000000</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>1.000000e+00</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <th>unfurnished_recode</th>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>1.000000e+00</td>
      <td>1.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>...</td>
      <td>0.000000e+00</td>
      <td>1.000000e+00</td>
      <td>0.000000</td>
      <td>1.000000e+00</td>
      <td>1.000000</td>
      <td>1.000000e+00</td>
      <td>0.000000e+00</td>
      <td>1.000000e+00</td>
      <td>1.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <th>balcony_recode</th>
      <td>1.000000e+00</td>
      <td>1.000000e+00</td>
      <td>1.000000e+00</td>
      <td>1.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>1.000000e+00</td>
      <td>...</td>
      <td>0.000000e+00</td>
      <td>1.000000e+00</td>
      <td>1.000000</td>
      <td>1.000000e+00</td>
      <td>1.000000</td>
      <td>1.000000e+00</td>
      <td>1.000000e+00</td>
      <td>1.000000e+00</td>
      <td>1.000000</td>
      <td>1.000000</td>
    </tr>
    <tr>
      <th>barbecue_area_recode</th>
      <td>1.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>...</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000</td>
      <td>0.000000e+00</td>
      <td>0.000000</td>
      <td>1.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000</td>
      <td>1.000000</td>
    </tr>
    <tr>
      <th>central_ac_recode</th>
      <td>1.000000e+00</td>
      <td>1.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>1.000000e+00</td>
      <td>1.000000e+00</td>
      <td>1.000000e+00</td>
      <td>1.000000e+00</td>
      <td>0.000000e+00</td>
      <td>1.000000e+00</td>
      <td>...</td>
      <td>0.000000e+00</td>
      <td>1.000000e+00</td>
      <td>1.000000</td>
      <td>0.000000e+00</td>
      <td>1.000000</td>
      <td>1.000000e+00</td>
      <td>1.000000e+00</td>
      <td>1.000000e+00</td>
      <td>1.000000</td>
      <td>1.000000</td>
    </tr>
    <tr>
      <th>childrens_play_area_recode</th>
      <td>1.000000e+00</td>
      <td>1.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>...</td>
      <td>0.000000e+00</td>
      <td>1.000000e+00</td>
      <td>0.000000</td>
      <td>0.000000e+00</td>
      <td>0.000000</td>
      <td>1.000000e+00</td>
      <td>1.000000e+00</td>
      <td>1.000000e+00</td>
      <td>1.000000</td>
      <td>1.000000</td>
    </tr>
    <tr>
      <th>childrens_pool_recode</th>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>...</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000</td>
      <td>0.000000e+00</td>
      <td>0.000000</td>
      <td>1.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000</td>
      <td>1.000000</td>
    </tr>
    <tr>
      <th>concierge_recode</th>
      <td>1.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>1.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>...</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000</td>
      <td>0.000000e+00</td>
      <td>1.000000</td>
      <td>1.000000e+00</td>
      <td>1.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000</td>
      <td>1.000000</td>
    </tr>
    <tr>
      <th>covered_parking_recode</th>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>1.000000e+00</td>
      <td>1.000000e+00</td>
      <td>1.000000e+00</td>
      <td>1.000000e+00</td>
      <td>1.000000e+00</td>
      <td>1.000000e+00</td>
      <td>0.000000e+00</td>
      <td>1.000000e+00</td>
      <td>...</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>1.000000</td>
      <td>1.000000e+00</td>
      <td>1.000000</td>
      <td>1.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>1.000000</td>
      <td>1.000000</td>
    </tr>
    <tr>
      <th>kitchen_appliances_recode</th>
      <td>1.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>1.000000e+00</td>
      <td>1.000000e+00</td>
      <td>1.000000e+00</td>
      <td>1.000000e+00</td>
      <td>0.000000e+00</td>
      <td>1.000000e+00</td>
      <td>...</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000</td>
      <td>1.000000e+00</td>
      <td>0.000000</td>
      <td>1.000000e+00</td>
      <td>1.000000e+00</td>
      <td>0.000000e+00</td>
      <td>1.000000</td>
      <td>1.000000</td>
    </tr>
    <tr>
      <th>maid_service_recode</th>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>...</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000</td>
      <td>0.000000e+00</td>
      <td>0.000000</td>
      <td>1.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <th>pets_allowed_recode</th>
      <td>1.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>1.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>...</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>1.000000</td>
      <td>0.000000e+00</td>
      <td>1.000000</td>
      <td>1.000000e+00</td>
      <td>0.000000e+00</td>
      <td>1.000000e+00</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <th>private_garden_recode</th>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>...</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000</td>
      <td>0.000000e+00</td>
      <td>0.000000</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>1.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <th>private_gym_recode</th>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>...</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000</td>
      <td>0.000000e+00</td>
      <td>0.000000</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <th>private_jacuzzi_recode</th>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>1.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>...</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000</td>
      <td>0.000000e+00</td>
      <td>0.000000</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <th>private_pool_recode</th>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>...</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000</td>
      <td>0.000000e+00</td>
      <td>1.000000</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <th>security_recode</th>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>1.000000e+00</td>
      <td>0.000000e+00</td>
      <td>1.000000e+00</td>
      <td>1.000000e+00</td>
      <td>1.000000e+00</td>
      <td>1.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>...</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>1.000000</td>
      <td>0.000000e+00</td>
      <td>0.000000</td>
      <td>1.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>1.000000</td>
      <td>1.000000</td>
    </tr>
    <tr>
      <th>shared_gym_recode</th>
      <td>1.000000e+00</td>
      <td>1.000000e+00</td>
      <td>1.000000e+00</td>
      <td>0.000000e+00</td>
      <td>1.000000e+00</td>
      <td>1.000000e+00</td>
      <td>1.000000e+00</td>
      <td>1.000000e+00</td>
      <td>0.000000e+00</td>
      <td>1.000000e+00</td>
      <td>...</td>
      <td>0.000000e+00</td>
      <td>1.000000e+00</td>
      <td>1.000000</td>
      <td>1.000000e+00</td>
      <td>1.000000</td>
      <td>1.000000e+00</td>
      <td>1.000000e+00</td>
      <td>0.000000e+00</td>
      <td>1.000000</td>
      <td>1.000000</td>
    </tr>
    <tr>
      <th>shared_pool_recode</th>
      <td>0.000000e+00</td>
      <td>1.000000e+00</td>
      <td>1.000000e+00</td>
      <td>0.000000e+00</td>
      <td>1.000000e+00</td>
      <td>1.000000e+00</td>
      <td>1.000000e+00</td>
      <td>1.000000e+00</td>
      <td>0.000000e+00</td>
      <td>1.000000e+00</td>
      <td>...</td>
      <td>0.000000e+00</td>
      <td>1.000000e+00</td>
      <td>1.000000</td>
      <td>1.000000e+00</td>
      <td>1.000000</td>
      <td>1.000000e+00</td>
      <td>1.000000e+00</td>
      <td>1.000000e+00</td>
      <td>1.000000</td>
      <td>1.000000</td>
    </tr>
    <tr>
      <th>shared_spa_recode</th>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>1.000000e+00</td>
      <td>1.000000e+00</td>
      <td>1.000000e+00</td>
      <td>1.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>...</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000</td>
      <td>0.000000e+00</td>
      <td>0.000000</td>
      <td>1.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000</td>
      <td>1.000000</td>
    </tr>
    <tr>
      <th>view_of_water_recode</th>
      <td>1.000000e+00</td>
      <td>1.000000e+00</td>
      <td>1.000000e+00</td>
      <td>0.000000e+00</td>
      <td>1.000000e+00</td>
      <td>1.000000e+00</td>
      <td>1.000000e+00</td>
      <td>1.000000e+00</td>
      <td>0.000000e+00</td>
      <td>1.000000e+00</td>
      <td>...</td>
      <td>0.000000e+00</td>
      <td>0.000000e+00</td>
      <td>0.000000</td>
      <td>1.000000e+00</td>
      <td>0.000000</td>
      <td>1.000000e+00</td>
      <td>1.000000e+00</td>
      <td>0.000000e+00</td>
      <td>1.000000</td>
      <td>1.000000</td>
    </tr>
    <tr>
      <th>size_in_m_2</th>
      <td>1.002423e+02</td>
      <td>1.469725e+02</td>
      <td>1.812538e+02</td>
      <td>1.876641e+02</td>
      <td>4.710182e+01</td>
      <td>9.429654e+01</td>
      <td>1.915660e+02</td>
      <td>9.429654e+01</td>
      <td>2.030860e+02</td>
      <td>1.413055e+02</td>
      <td>...</td>
      <td>1.466009e+02</td>
      <td>4.880195e+02</td>
      <td>55.741800</td>
      <td>9.996363e+01</td>
      <td>78.688841</td>
      <td>1.009856e+02</td>
      <td>7.060628e+01</td>
      <td>1.793028e+02</td>
      <td>68.748220</td>
      <td>74.322400</td>
    </tr>
  </tbody>
</table>
<p>29 rows × 1905 columns</p>
</div>


<br>


# Data-frame to numpy

We can convert a pandas data-frame to a numpy array using `to_numpy()` method:

```python
House_Price_Data.to_numpy()
```




    array([[ 46.      ,  25.113208,  55.138932, ...,   0.      ,   1.      ,
            100.242337],
           [ 46.      ,  25.106809,  55.151201, ...,   0.      ,   1.      ,
            146.972546],
           [ 36.      ,  25.063302,  55.137728, ...,   0.      ,   1.      ,
            181.253753],
           ...,
           [ 16.      ,  25.2065  ,  55.345056, ...,   0.      ,   0.      ,
            179.30279 ],
           [ 37.      ,  25.073858,  55.229844, ...,   0.      ,   1.      ,
             68.74822 ],
           [ 36.      ,  25.07913 ,  55.154713, ...,   1.      ,   1.      ,
             74.3224  ]])



<br>


# Delete columns from a data-frame


```python
House_Price_Data.drop(['price'], axis=1)
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
      <th>no_of_bedrooms</th>
      <th>no_of_bathrooms</th>
      <th>quality_recode</th>
      <th>maid_room_recode</th>
      <th>unfurnished_recode</th>
      <th>balcony_recode</th>
      <th>barbecue_area_recode</th>
      <th>...</th>
      <th>private_garden_recode</th>
      <th>private_gym_recode</th>
      <th>private_jacuzzi_recode</th>
      <th>private_pool_recode</th>
      <th>security_recode</th>
      <th>shared_gym_recode</th>
      <th>shared_pool_recode</th>
      <th>shared_spa_recode</th>
      <th>view_of_water_recode</th>
      <th>size_in_m_2</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>46.0</td>
      <td>25.113208</td>
      <td>55.138932</td>
      <td>1</td>
      <td>2</td>
      <td>2.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>100.242337</td>
    </tr>
    <tr>
      <th>1</th>
      <td>46.0</td>
      <td>25.106809</td>
      <td>55.151201</td>
      <td>2</td>
      <td>2</td>
      <td>2.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>146.972546</td>
    </tr>
    <tr>
      <th>2</th>
      <td>36.0</td>
      <td>25.063302</td>
      <td>55.137728</td>
      <td>3</td>
      <td>5</td>
      <td>2.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>181.253753</td>
    </tr>
    <tr>
      <th>3</th>
      <td>11.0</td>
      <td>25.227295</td>
      <td>55.341761</td>
      <td>2</td>
      <td>3</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>187.664060</td>
    </tr>
    <tr>
      <th>4</th>
      <td>46.0</td>
      <td>25.114275</td>
      <td>55.139764</td>
      <td>0</td>
      <td>1</td>
      <td>2.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>47.101821</td>
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
      <td>42.0</td>
      <td>25.176892</td>
      <td>55.310712</td>
      <td>2</td>
      <td>2</td>
      <td>3.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>100.985561</td>
    </tr>
    <tr>
      <th>1901</th>
      <td>42.0</td>
      <td>25.166145</td>
      <td>55.276684</td>
      <td>1</td>
      <td>2</td>
      <td>2.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>70.606280</td>
    </tr>
    <tr>
      <th>1902</th>
      <td>16.0</td>
      <td>25.206500</td>
      <td>55.345056</td>
      <td>3</td>
      <td>5</td>
      <td>2.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>179.302790</td>
    </tr>
    <tr>
      <th>1903</th>
      <td>37.0</td>
      <td>25.073858</td>
      <td>55.229844</td>
      <td>1</td>
      <td>2</td>
      <td>2.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>...</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>68.748220</td>
    </tr>
    <tr>
      <th>1904</th>
      <td>36.0</td>
      <td>25.079130</td>
      <td>55.154713</td>
      <td>1</td>
      <td>2</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>74.322400</td>
    </tr>
  </tbody>
</table>
<p>1905 rows × 28 columns</p>
</div>


<br>

```python
House_Price_Data.drop(['price', 'longitude'], axis=1)
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
      <th>no_of_bedrooms</th>
      <th>no_of_bathrooms</th>
      <th>quality_recode</th>
      <th>maid_room_recode</th>
      <th>unfurnished_recode</th>
      <th>balcony_recode</th>
      <th>barbecue_area_recode</th>
      <th>central_ac_recode</th>
      <th>...</th>
      <th>private_garden_recode</th>
      <th>private_gym_recode</th>
      <th>private_jacuzzi_recode</th>
      <th>private_pool_recode</th>
      <th>security_recode</th>
      <th>shared_gym_recode</th>
      <th>shared_pool_recode</th>
      <th>shared_spa_recode</th>
      <th>view_of_water_recode</th>
      <th>size_in_m_2</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>46.0</td>
      <td>25.113208</td>
      <td>1</td>
      <td>2</td>
      <td>2.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>100.242337</td>
    </tr>
    <tr>
      <th>1</th>
      <td>46.0</td>
      <td>25.106809</td>
      <td>2</td>
      <td>2</td>
      <td>2.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>146.972546</td>
    </tr>
    <tr>
      <th>2</th>
      <td>36.0</td>
      <td>25.063302</td>
      <td>3</td>
      <td>5</td>
      <td>2.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>181.253753</td>
    </tr>
    <tr>
      <th>3</th>
      <td>11.0</td>
      <td>25.227295</td>
      <td>2</td>
      <td>3</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>187.664060</td>
    </tr>
    <tr>
      <th>4</th>
      <td>46.0</td>
      <td>25.114275</td>
      <td>0</td>
      <td>1</td>
      <td>2.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>47.101821</td>
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
      <td>42.0</td>
      <td>25.176892</td>
      <td>2</td>
      <td>2</td>
      <td>3.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>100.985561</td>
    </tr>
    <tr>
      <th>1901</th>
      <td>42.0</td>
      <td>25.166145</td>
      <td>1</td>
      <td>2</td>
      <td>2.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>70.606280</td>
    </tr>
    <tr>
      <th>1902</th>
      <td>16.0</td>
      <td>25.206500</td>
      <td>3</td>
      <td>5</td>
      <td>2.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>179.302790</td>
    </tr>
    <tr>
      <th>1903</th>
      <td>37.0</td>
      <td>25.073858</td>
      <td>1</td>
      <td>2</td>
      <td>2.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>68.748220</td>
    </tr>
    <tr>
      <th>1904</th>
      <td>36.0</td>
      <td>25.079130</td>
      <td>1</td>
      <td>2</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>74.322400</td>
    </tr>
  </tbody>
</table>
<p>1905 rows × 27 columns</p>
</div>


<br>

# Delete rows from a data-frame


```python
House_Price_Data.drop(3, axis=0)
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
      <th>private_garden_recode</th>
      <th>private_gym_recode</th>
      <th>private_jacuzzi_recode</th>
      <th>private_pool_recode</th>
      <th>security_recode</th>
      <th>shared_gym_recode</th>
      <th>shared_pool_recode</th>
      <th>shared_spa_recode</th>
      <th>view_of_water_recode</th>
      <th>size_in_m_2</th>
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
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>100.242337</td>
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
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>146.972546</td>
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
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>181.253753</td>
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
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>47.101821</td>
    </tr>
    <tr>
      <th>5</th>
      <td>46.0</td>
      <td>25.114275</td>
      <td>55.139764</td>
      <td>3119900</td>
      <td>1</td>
      <td>2</td>
      <td>2.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>94.296545</td>
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
      <td>42.0</td>
      <td>25.176892</td>
      <td>55.310712</td>
      <td>1500000</td>
      <td>2</td>
      <td>2</td>
      <td>3.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>100.985561</td>
    </tr>
    <tr>
      <th>1901</th>
      <td>42.0</td>
      <td>25.166145</td>
      <td>55.276684</td>
      <td>1230000</td>
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
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>70.606280</td>
    </tr>
    <tr>
      <th>1902</th>
      <td>16.0</td>
      <td>25.206500</td>
      <td>55.345056</td>
      <td>2900000</td>
      <td>3</td>
      <td>5</td>
      <td>2.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>179.302790</td>
    </tr>
    <tr>
      <th>1903</th>
      <td>37.0</td>
      <td>25.073858</td>
      <td>55.229844</td>
      <td>675000</td>
      <td>1</td>
      <td>2</td>
      <td>2.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>68.748220</td>
    </tr>
    <tr>
      <th>1904</th>
      <td>36.0</td>
      <td>25.079130</td>
      <td>55.154713</td>
      <td>760887</td>
      <td>1</td>
      <td>2</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>74.322400</td>
    </tr>
  </tbody>
</table>
<p>1904 rows × 29 columns</p>
</div>


<br>

```python
House_Price_Data.drop([2,3,1900], axis=0)
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
      <th>private_garden_recode</th>
      <th>private_gym_recode</th>
      <th>private_jacuzzi_recode</th>
      <th>private_pool_recode</th>
      <th>security_recode</th>
      <th>shared_gym_recode</th>
      <th>shared_pool_recode</th>
      <th>shared_spa_recode</th>
      <th>view_of_water_recode</th>
      <th>size_in_m_2</th>
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
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>100.242337</td>
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
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>146.972546</td>
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
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>47.101821</td>
    </tr>
    <tr>
      <th>5</th>
      <td>46.0</td>
      <td>25.114275</td>
      <td>55.139764</td>
      <td>3119900</td>
      <td>1</td>
      <td>2</td>
      <td>2.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>94.296545</td>
    </tr>
    <tr>
      <th>6</th>
      <td>46.0</td>
      <td>25.114275</td>
      <td>55.139764</td>
      <td>8503600</td>
      <td>2</td>
      <td>3</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>191.565986</td>
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
      <th>1899</th>
      <td>27.0</td>
      <td>25.037477</td>
      <td>55.221942</td>
      <td>550000</td>
      <td>1</td>
      <td>2</td>
      <td>2.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>78.688841</td>
    </tr>
    <tr>
      <th>1901</th>
      <td>42.0</td>
      <td>25.166145</td>
      <td>55.276684</td>
      <td>1230000</td>
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
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>70.606280</td>
    </tr>
    <tr>
      <th>1902</th>
      <td>16.0</td>
      <td>25.206500</td>
      <td>55.345056</td>
      <td>2900000</td>
      <td>3</td>
      <td>5</td>
      <td>2.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>179.302790</td>
    </tr>
    <tr>
      <th>1903</th>
      <td>37.0</td>
      <td>25.073858</td>
      <td>55.229844</td>
      <td>675000</td>
      <td>1</td>
      <td>2</td>
      <td>2.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>68.748220</td>
    </tr>
    <tr>
      <th>1904</th>
      <td>36.0</td>
      <td>25.079130</td>
      <td>55.154713</td>
      <td>760887</td>
      <td>1</td>
      <td>2</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>74.322400</td>
    </tr>
  </tbody>
</table>
<p>1902 rows × 29 columns</p>
</div>


<br>

# Rename columns from a data-frame

We can rename columns from a data-frame as follows:

```python
House_Price_Data.rename(columns={'neighborhood_recode' : 'neighborhood'})
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
      <th>neighborhood</th>
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
      <th>private_garden_recode</th>
      <th>private_gym_recode</th>
      <th>private_jacuzzi_recode</th>
      <th>private_pool_recode</th>
      <th>security_recode</th>
      <th>shared_gym_recode</th>
      <th>shared_pool_recode</th>
      <th>shared_spa_recode</th>
      <th>view_of_water_recode</th>
      <th>size_in_m_2</th>
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
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>100.242337</td>
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
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>146.972546</td>
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
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>181.253753</td>
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
      <td>0.0</td>
      <td>0.0</td>
      <td>187.664060</td>
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
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>47.101821</td>
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
      <td>42.0</td>
      <td>25.176892</td>
      <td>55.310712</td>
      <td>1500000</td>
      <td>2</td>
      <td>2</td>
      <td>3.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>100.985561</td>
    </tr>
    <tr>
      <th>1901</th>
      <td>42.0</td>
      <td>25.166145</td>
      <td>55.276684</td>
      <td>1230000</td>
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
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>70.606280</td>
    </tr>
    <tr>
      <th>1902</th>
      <td>16.0</td>
      <td>25.206500</td>
      <td>55.345056</td>
      <td>2900000</td>
      <td>3</td>
      <td>5</td>
      <td>2.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>179.302790</td>
    </tr>
    <tr>
      <th>1903</th>
      <td>37.0</td>
      <td>25.073858</td>
      <td>55.229844</td>
      <td>675000</td>
      <td>1</td>
      <td>2</td>
      <td>2.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>68.748220</td>
    </tr>
    <tr>
      <th>1904</th>
      <td>36.0</td>
      <td>25.079130</td>
      <td>55.154713</td>
      <td>760887</td>
      <td>1</td>
      <td>2</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>74.322400</td>
    </tr>
  </tbody>
</table>
<p>1905 rows × 29 columns</p>
</div>


<br>

# Group by

We can group the rows of the data frame by the values ​​in one column and then compute within each group a statistic from some of the other columns:

```python
House_Price_Data.groupby('quality_recode').sum()
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
      <th>maid_room_recode</th>
      <th>unfurnished_recode</th>
      <th>balcony_recode</th>
      <th>barbecue_area_recode</th>
      <th>...</th>
      <th>private_garden_recode</th>
      <th>private_gym_recode</th>
      <th>private_jacuzzi_recode</th>
      <th>private_pool_recode</th>
      <th>security_recode</th>
      <th>shared_gym_recode</th>
      <th>shared_pool_recode</th>
      <th>shared_spa_recode</th>
      <th>view_of_water_recode</th>
      <th>size_in_m_2</th>
    </tr>
    <tr>
      <th>quality_recode</th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0.0</th>
      <td>3733.0</td>
      <td>3364.807548</td>
      <td>7397.947955</td>
      <td>360303131</td>
      <td>259</td>
      <td>356</td>
      <td>48.0</td>
      <td>80.0</td>
      <td>127.0</td>
      <td>50.0</td>
      <td>...</td>
      <td>9.0</td>
      <td>5.0</td>
      <td>20.0</td>
      <td>14.0</td>
      <td>116.0</td>
      <td>131.0</td>
      <td>129.0</td>
      <td>51.0</td>
      <td>88.0</td>
      <td>19662.548338</td>
    </tr>
    <tr>
      <th>1.0</th>
      <td>14463.0</td>
      <td>13665.847174</td>
      <td>30036.819722</td>
      <td>1054059587</td>
      <td>964</td>
      <td>1351</td>
      <td>10.0</td>
      <td>223.0</td>
      <td>140.0</td>
      <td>4.0</td>
      <td>...</td>
      <td>2.0</td>
      <td>1.0</td>
      <td>5.0</td>
      <td>5.0</td>
      <td>15.0</td>
      <td>87.0</td>
      <td>151.0</td>
      <td>2.0</td>
      <td>36.0</td>
      <td>70533.072436</td>
    </tr>
    <tr>
      <th>2.0</th>
      <td>30586.0</td>
      <td>28786.683374</td>
      <td>63272.825114</td>
      <td>2484669505</td>
      <td>2063</td>
      <td>2876</td>
      <td>163.0</td>
      <td>887.0</td>
      <td>1023.0</td>
      <td>134.0</td>
      <td>...</td>
      <td>20.0</td>
      <td>8.0</td>
      <td>71.0</td>
      <td>62.0</td>
      <td>460.0</td>
      <td>959.0</td>
      <td>1043.0</td>
      <td>62.0</td>
      <td>452.0</td>
      <td>152492.563551</td>
    </tr>
    <tr>
      <th>3.0</th>
      <td>2896.0</td>
      <td>2029.667054</td>
      <td>4471.911678</td>
      <td>74473686</td>
      <td>130</td>
      <td>204</td>
      <td>54.0</td>
      <td>32.0</td>
      <td>81.0</td>
      <td>81.0</td>
      <td>...</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>80.0</td>
      <td>81.0</td>
      <td>81.0</td>
      <td>79.0</td>
      <td>78.0</td>
      <td>8101.699018</td>
    </tr>
  </tbody>
</table>
<p>4 rows × 28 columns</p>
</div>


<br>


```python
House_Price_Data.groupby('quality_recode')['price'].sum()
```




    quality_recode
    0.0     360303131
    1.0    1054059587
    2.0    2484669505
    3.0      74473686
    Name: price, dtype: int64


<br>

```python
House_Price_Data.groupby('quality_recode')['price'].mean()
```




    quality_recode
    0.0    2.688829e+06
    1.0    1.937610e+06
    2.0    2.168123e+06
    3.0    9.194282e+05
    Name: price, dtype: float64



<br>

```python
House_Price_Data.groupby('quality_recode')['price'].median()
```




    quality_recode
    0.0    1400103.0
    1.0    1465444.0
    2.0    1470388.5
    3.0     759502.0
    Name: price, dtype: float64


<br>

```python
House_Price_Data.groupby('quality_recode')['price'].std()
```




    quality_recode
    0.0    4.852033e+06
    1.0    2.307412e+06
    2.0    2.947205e+06
    3.0    3.950463e+05
    Name: price, dtype: float64



<br>

```python
import numpy as np
```


```python
House_Price_Data.groupby('quality_recode')['price'].agg([np.min, np.max, np.median, np.sum, np.std])
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
      <th>amin</th>
      <th>amax</th>
      <th>median</th>
      <th>sum</th>
      <th>std</th>
    </tr>
    <tr>
      <th>quality_recode</th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0.0</th>
      <td>360000</td>
      <td>34340000</td>
      <td>1400103.0</td>
      <td>360303131</td>
      <td>4.852033e+06</td>
    </tr>
    <tr>
      <th>1.0</th>
      <td>220000</td>
      <td>35000000</td>
      <td>1465444.0</td>
      <td>1054059587</td>
      <td>2.307412e+06</td>
    </tr>
    <tr>
      <th>2.0</th>
      <td>230000</td>
      <td>34314000</td>
      <td>1470388.5</td>
      <td>2484669505</td>
      <td>2.947205e+06</td>
    </tr>
    <tr>
      <th>3.0</th>
      <td>440500</td>
      <td>2551888</td>
      <td>759502.0</td>
      <td>74473686</td>
      <td>3.950463e+05</td>
    </tr>
  </tbody>
</table>
</div>


<br>

# Concat data-frames

We can concat data-frames using `concat()` method.

First we are going to remember the `Ventas`, `Proveedores`and `Clientes` data-frames, because we are going to use them in this section:

```python
Ventas.head()
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
      <th>VentasId</th>
      <th>Producto</th>
      <th>Precio</th>
      <th>Cliente</th>
      <th>Proveedor</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>V1</td>
      <td>Alfombra</td>
      <td>1500.0</td>
      <td>C1</td>
      <td>P1</td>
    </tr>
    <tr>
      <th>1</th>
      <td>V2</td>
      <td>Killim</td>
      <td>699.5</td>
      <td>C3</td>
      <td>P1</td>
    </tr>
    <tr>
      <th>2</th>
      <td>V3</td>
      <td>Killim</td>
      <td>475.0</td>
      <td>C9</td>
      <td>P3</td>
    </tr>
    <tr>
      <th>3</th>
      <td>V4</td>
      <td>Alfombra</td>
      <td>5000.0</td>
      <td>C4</td>
      <td>P1</td>
    </tr>
    <tr>
      <th>4</th>
      <td>V5</td>
      <td>Killim</td>
      <td>499.5</td>
      <td>C8</td>
      <td>P1</td>
    </tr>
  </tbody>
</table>
</div>




```python
Proveedores
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
      <th>ProveedorID</th>
      <th>Nombre</th>
      <th>Email</th>
      <th>Telefono</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>P1</td>
      <td>Intertrade</td>
      <td>Intertrade@gmail.com</td>
      <td>912223344</td>
    </tr>
    <tr>
      <th>1</th>
      <td>P2</td>
      <td>SaidKarpet</td>
      <td>SaidKarpet@gmail.com</td>
      <td>912783794</td>
    </tr>
    <tr>
      <th>2</th>
      <td>P3</td>
      <td>OrientKillim</td>
      <td>OrientKillim@gmail.com</td>
      <td>9100155475</td>
    </tr>
  </tbody>
</table>
</div>




```python
Clientes.head()
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
      <th>ClienteID</th>
      <th>Nombre</th>
      <th>Pais</th>
      <th>Ciudad</th>
      <th>Email</th>
      <th>Telefono</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>C1</td>
      <td>Orlando</td>
      <td>Australia</td>
      <td></td>
      <td></td>
      <td>917755028</td>
    </tr>
    <tr>
      <th>1</th>
      <td>C2</td>
      <td>Keith</td>
      <td>India</td>
      <td></td>
      <td>keith0@adventure-works.com</td>
      <td></td>
    </tr>
    <tr>
      <th>2</th>
      <td>C3</td>
      <td>Donna</td>
      <td>Germany</td>
      <td>Berlin</td>
      <td>donna0@adventure-works.com</td>
      <td>915547890</td>
    </tr>
    <tr>
      <th>3</th>
      <td>C4</td>
      <td>Janet</td>
      <td>United States</td>
      <td>California</td>
      <td>janet1@adventure-works.com</td>
      <td></td>
    </tr>
    <tr>
      <th>4</th>
      <td>C5</td>
      <td>Fabio</td>
      <td>España</td>
      <td>Madrid</td>
      <td>fabio10@gmail.com</td>
      <td></td>
    </tr>
  </tbody>
</table>
</div>



<br>

```python
from pandas import concat
```

There are several ways to apply the `concat` method to a pair of data frames, each one giving different results. 

Let's see some of them:

```python
concat([Ventas,Clientes])
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
      <th>VentasId</th>
      <th>Producto</th>
      <th>Precio</th>
      <th>Cliente</th>
      <th>Proveedor</th>
      <th>ClienteID</th>
      <th>Nombre</th>
      <th>Pais</th>
      <th>Ciudad</th>
      <th>Email</th>
      <th>Telefono</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>V1</td>
      <td>Alfombra</td>
      <td>1500.0</td>
      <td>C1</td>
      <td>P1</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>1</th>
      <td>V2</td>
      <td>Killim</td>
      <td>699.5</td>
      <td>C3</td>
      <td>P1</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>2</th>
      <td>V3</td>
      <td>Killim</td>
      <td>475.0</td>
      <td>C9</td>
      <td>P3</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>3</th>
      <td>V4</td>
      <td>Alfombra</td>
      <td>5000.0</td>
      <td>C4</td>
      <td>P1</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>4</th>
      <td>V5</td>
      <td>Killim</td>
      <td>499.5</td>
      <td>C8</td>
      <td>P1</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>5</th>
      <td>V6</td>
      <td>Killim</td>
      <td>55.0</td>
      <td>C5</td>
      <td>P3</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>6</th>
      <td>V7</td>
      <td>Alfombra</td>
      <td>2500.0</td>
      <td>C2</td>
      <td>P1</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>7</th>
      <td>V8</td>
      <td>Killim</td>
      <td>299.5</td>
      <td>C10</td>
      <td>P1</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>8</th>
      <td>V9</td>
      <td>Killim</td>
      <td>600.0</td>
      <td>C2</td>
      <td>P3</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>9</th>
      <td>V10</td>
      <td>Alfombra</td>
      <td>1200.0</td>
      <td>C7</td>
      <td>P1</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>10</th>
      <td>V11</td>
      <td>Killim</td>
      <td>500.0</td>
      <td>C8</td>
      <td>P1</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>11</th>
      <td>V12</td>
      <td>Killim</td>
      <td>650.0</td>
      <td>C9</td>
      <td>P3</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>12</th>
      <td>V13</td>
      <td>NaN</td>
      <td>3500.0</td>
      <td>C7</td>
      <td>P1</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>13</th>
      <td>V14</td>
      <td>NaN</td>
      <td>1000.0</td>
      <td>C6</td>
      <td>P1</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>14</th>
      <td>V15</td>
      <td>NaN</td>
      <td>350.0</td>
      <td>C10</td>
      <td>P3</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>0</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>C1</td>
      <td>Orlando</td>
      <td>Australia</td>
      <td></td>
      <td></td>
      <td>917755028</td>
    </tr>
    <tr>
      <th>1</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>C2</td>
      <td>Keith</td>
      <td>India</td>
      <td></td>
      <td>keith0@adventure-works.com</td>
      <td></td>
    </tr>
    <tr>
      <th>2</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>C3</td>
      <td>Donna</td>
      <td>Germany</td>
      <td>Berlin</td>
      <td>donna0@adventure-works.com</td>
      <td>915547890</td>
    </tr>
    <tr>
      <th>3</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>C4</td>
      <td>Janet</td>
      <td>United States</td>
      <td>California</td>
      <td>janet1@adventure-works.com</td>
      <td></td>
    </tr>
    <tr>
      <th>4</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>C5</td>
      <td>Fabio</td>
      <td>España</td>
      <td>Madrid</td>
      <td>fabio10@gmail.com</td>
      <td></td>
    </tr>
    <tr>
      <th>5</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>C6</td>
      <td>Juan</td>
      <td>España</td>
      <td>Sevilla</td>
      <td></td>
      <td>915869028</td>
    </tr>
    <tr>
      <th>6</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>C7</td>
      <td>Lucia</td>
      <td>España</td>
      <td></td>
      <td>LuciaPerez@hotmail.com</td>
      <td></td>
    </tr>
    <tr>
      <th>7</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>C8</td>
      <td>Pedro</td>
      <td>Italia</td>
      <td>Roma</td>
      <td>Pedro99@gmail.com</td>
      <td>910007890</td>
    </tr>
    <tr>
      <th>8</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>C9</td>
      <td>Sergio</td>
      <td>United States</td>
      <td>New York</td>
      <td>sergio_as@gmail.com</td>
      <td></td>
    </tr>
    <tr>
      <th>9</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>C10</td>
      <td>Grecia</td>
      <td>Peru</td>
      <td>Lima</td>
      <td>Grecia89@gmail.com</td>
      <td></td>
    </tr>
  </tbody>
</table>
</div>

<br>


```python
concat([Ventas,Clientes] , ignore_index=True)
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
      <th>VentasId</th>
      <th>Producto</th>
      <th>Precio</th>
      <th>Cliente</th>
      <th>Proveedor</th>
      <th>ClienteID</th>
      <th>Nombre</th>
      <th>Pais</th>
      <th>Ciudad</th>
      <th>Email</th>
      <th>Telefono</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>V1</td>
      <td>Alfombra</td>
      <td>1500.0</td>
      <td>C1</td>
      <td>P1</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>1</th>
      <td>V2</td>
      <td>Killim</td>
      <td>699.5</td>
      <td>C3</td>
      <td>P1</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>2</th>
      <td>V3</td>
      <td>Killim</td>
      <td>475.0</td>
      <td>C9</td>
      <td>P3</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>3</th>
      <td>V4</td>
      <td>Alfombra</td>
      <td>5000.0</td>
      <td>C4</td>
      <td>P1</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>4</th>
      <td>V5</td>
      <td>Killim</td>
      <td>499.5</td>
      <td>C8</td>
      <td>P1</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>5</th>
      <td>V6</td>
      <td>Killim</td>
      <td>55.0</td>
      <td>C5</td>
      <td>P3</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>6</th>
      <td>V7</td>
      <td>Alfombra</td>
      <td>2500.0</td>
      <td>C2</td>
      <td>P1</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>7</th>
      <td>V8</td>
      <td>Killim</td>
      <td>299.5</td>
      <td>C10</td>
      <td>P1</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>8</th>
      <td>V9</td>
      <td>Killim</td>
      <td>600.0</td>
      <td>C2</td>
      <td>P3</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>9</th>
      <td>V10</td>
      <td>Alfombra</td>
      <td>1200.0</td>
      <td>C7</td>
      <td>P1</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>10</th>
      <td>V11</td>
      <td>Killim</td>
      <td>500.0</td>
      <td>C8</td>
      <td>P1</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>11</th>
      <td>V12</td>
      <td>Killim</td>
      <td>650.0</td>
      <td>C9</td>
      <td>P3</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>12</th>
      <td>V13</td>
      <td>NaN</td>
      <td>3500.0</td>
      <td>C7</td>
      <td>P1</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>13</th>
      <td>V14</td>
      <td>NaN</td>
      <td>1000.0</td>
      <td>C6</td>
      <td>P1</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>14</th>
      <td>V15</td>
      <td>NaN</td>
      <td>350.0</td>
      <td>C10</td>
      <td>P3</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>15</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>C1</td>
      <td>Orlando</td>
      <td>Australia</td>
      <td></td>
      <td></td>
      <td>917755028</td>
    </tr>
    <tr>
      <th>16</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>C2</td>
      <td>Keith</td>
      <td>India</td>
      <td></td>
      <td>keith0@adventure-works.com</td>
      <td></td>
    </tr>
    <tr>
      <th>17</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>C3</td>
      <td>Donna</td>
      <td>Germany</td>
      <td>Berlin</td>
      <td>donna0@adventure-works.com</td>
      <td>915547890</td>
    </tr>
    <tr>
      <th>18</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>C4</td>
      <td>Janet</td>
      <td>United States</td>
      <td>California</td>
      <td>janet1@adventure-works.com</td>
      <td></td>
    </tr>
    <tr>
      <th>19</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>C5</td>
      <td>Fabio</td>
      <td>España</td>
      <td>Madrid</td>
      <td>fabio10@gmail.com</td>
      <td></td>
    </tr>
    <tr>
      <th>20</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>C6</td>
      <td>Juan</td>
      <td>España</td>
      <td>Sevilla</td>
      <td></td>
      <td>915869028</td>
    </tr>
    <tr>
      <th>21</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>C7</td>
      <td>Lucia</td>
      <td>España</td>
      <td></td>
      <td>LuciaPerez@hotmail.com</td>
      <td></td>
    </tr>
    <tr>
      <th>22</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>C8</td>
      <td>Pedro</td>
      <td>Italia</td>
      <td>Roma</td>
      <td>Pedro99@gmail.com</td>
      <td>910007890</td>
    </tr>
    <tr>
      <th>23</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>C9</td>
      <td>Sergio</td>
      <td>United States</td>
      <td>New York</td>
      <td>sergio_as@gmail.com</td>
      <td></td>
    </tr>
    <tr>
      <th>24</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>C10</td>
      <td>Grecia</td>
      <td>Peru</td>
      <td>Lima</td>
      <td>Grecia89@gmail.com</td>
      <td></td>
    </tr>
  </tbody>
</table>
</div>



<br>

```python
concat([Ventas,Clientes] , axis=1)
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
      <th>VentasId</th>
      <th>Producto</th>
      <th>Precio</th>
      <th>Cliente</th>
      <th>Proveedor</th>
      <th>ClienteID</th>
      <th>Nombre</th>
      <th>Pais</th>
      <th>Ciudad</th>
      <th>Email</th>
      <th>Telefono</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>V1</td>
      <td>Alfombra</td>
      <td>1500.0</td>
      <td>C1</td>
      <td>P1</td>
      <td>C1</td>
      <td>Orlando</td>
      <td>Australia</td>
      <td></td>
      <td></td>
      <td>917755028</td>
    </tr>
    <tr>
      <th>1</th>
      <td>V2</td>
      <td>Killim</td>
      <td>699.5</td>
      <td>C3</td>
      <td>P1</td>
      <td>C2</td>
      <td>Keith</td>
      <td>India</td>
      <td></td>
      <td>keith0@adventure-works.com</td>
      <td></td>
    </tr>
    <tr>
      <th>2</th>
      <td>V3</td>
      <td>Killim</td>
      <td>475.0</td>
      <td>C9</td>
      <td>P3</td>
      <td>C3</td>
      <td>Donna</td>
      <td>Germany</td>
      <td>Berlin</td>
      <td>donna0@adventure-works.com</td>
      <td>915547890</td>
    </tr>
    <tr>
      <th>3</th>
      <td>V4</td>
      <td>Alfombra</td>
      <td>5000.0</td>
      <td>C4</td>
      <td>P1</td>
      <td>C4</td>
      <td>Janet</td>
      <td>United States</td>
      <td>California</td>
      <td>janet1@adventure-works.com</td>
      <td></td>
    </tr>
    <tr>
      <th>4</th>
      <td>V5</td>
      <td>Killim</td>
      <td>499.5</td>
      <td>C8</td>
      <td>P1</td>
      <td>C5</td>
      <td>Fabio</td>
      <td>España</td>
      <td>Madrid</td>
      <td>fabio10@gmail.com</td>
      <td></td>
    </tr>
    <tr>
      <th>5</th>
      <td>V6</td>
      <td>Killim</td>
      <td>55.0</td>
      <td>C5</td>
      <td>P3</td>
      <td>C6</td>
      <td>Juan</td>
      <td>España</td>
      <td>Sevilla</td>
      <td></td>
      <td>915869028</td>
    </tr>
    <tr>
      <th>6</th>
      <td>V7</td>
      <td>Alfombra</td>
      <td>2500.0</td>
      <td>C2</td>
      <td>P1</td>
      <td>C7</td>
      <td>Lucia</td>
      <td>España</td>
      <td></td>
      <td>LuciaPerez@hotmail.com</td>
      <td></td>
    </tr>
    <tr>
      <th>7</th>
      <td>V8</td>
      <td>Killim</td>
      <td>299.5</td>
      <td>C10</td>
      <td>P1</td>
      <td>C8</td>
      <td>Pedro</td>
      <td>Italia</td>
      <td>Roma</td>
      <td>Pedro99@gmail.com</td>
      <td>910007890</td>
    </tr>
    <tr>
      <th>8</th>
      <td>V9</td>
      <td>Killim</td>
      <td>600.0</td>
      <td>C2</td>
      <td>P3</td>
      <td>C9</td>
      <td>Sergio</td>
      <td>United States</td>
      <td>New York</td>
      <td>sergio_as@gmail.com</td>
      <td></td>
    </tr>
    <tr>
      <th>9</th>
      <td>V10</td>
      <td>Alfombra</td>
      <td>1200.0</td>
      <td>C7</td>
      <td>P1</td>
      <td>C10</td>
      <td>Grecia</td>
      <td>Peru</td>
      <td>Lima</td>
      <td>Grecia89@gmail.com</td>
      <td></td>
    </tr>
    <tr>
      <th>10</th>
      <td>V11</td>
      <td>Killim</td>
      <td>500.0</td>
      <td>C8</td>
      <td>P1</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>11</th>
      <td>V12</td>
      <td>Killim</td>
      <td>650.0</td>
      <td>C9</td>
      <td>P3</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>12</th>
      <td>V13</td>
      <td>NaN</td>
      <td>3500.0</td>
      <td>C7</td>
      <td>P1</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>13</th>
      <td>V14</td>
      <td>NaN</td>
      <td>1000.0</td>
      <td>C6</td>
      <td>P1</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>14</th>
      <td>V15</td>
      <td>NaN</td>
      <td>350.0</td>
      <td>C10</td>
      <td>P3</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
  </tbody>
</table>
</div>


<br>

```python
concat([Ventas,Clientes] , axis=0)
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
      <th>VentasId</th>
      <th>Producto</th>
      <th>Precio</th>
      <th>Cliente</th>
      <th>Proveedor</th>
      <th>ClienteID</th>
      <th>Nombre</th>
      <th>Pais</th>
      <th>Ciudad</th>
      <th>Email</th>
      <th>Telefono</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>V1</td>
      <td>Alfombra</td>
      <td>1500.0</td>
      <td>C1</td>
      <td>P1</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>1</th>
      <td>V2</td>
      <td>Killim</td>
      <td>699.5</td>
      <td>C3</td>
      <td>P1</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>2</th>
      <td>V3</td>
      <td>Killim</td>
      <td>475.0</td>
      <td>C9</td>
      <td>P3</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>3</th>
      <td>V4</td>
      <td>Alfombra</td>
      <td>5000.0</td>
      <td>C4</td>
      <td>P1</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>4</th>
      <td>V5</td>
      <td>Killim</td>
      <td>499.5</td>
      <td>C8</td>
      <td>P1</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>5</th>
      <td>V6</td>
      <td>Killim</td>
      <td>55.0</td>
      <td>C5</td>
      <td>P3</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>6</th>
      <td>V7</td>
      <td>Alfombra</td>
      <td>2500.0</td>
      <td>C2</td>
      <td>P1</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>7</th>
      <td>V8</td>
      <td>Killim</td>
      <td>299.5</td>
      <td>C10</td>
      <td>P1</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>8</th>
      <td>V9</td>
      <td>Killim</td>
      <td>600.0</td>
      <td>C2</td>
      <td>P3</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>9</th>
      <td>V10</td>
      <td>Alfombra</td>
      <td>1200.0</td>
      <td>C7</td>
      <td>P1</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>10</th>
      <td>V11</td>
      <td>Killim</td>
      <td>500.0</td>
      <td>C8</td>
      <td>P1</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>11</th>
      <td>V12</td>
      <td>Killim</td>
      <td>650.0</td>
      <td>C9</td>
      <td>P3</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>12</th>
      <td>V13</td>
      <td>NaN</td>
      <td>3500.0</td>
      <td>C7</td>
      <td>P1</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>13</th>
      <td>V14</td>
      <td>NaN</td>
      <td>1000.0</td>
      <td>C6</td>
      <td>P1</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>14</th>
      <td>V15</td>
      <td>NaN</td>
      <td>350.0</td>
      <td>C10</td>
      <td>P3</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>0</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>C1</td>
      <td>Orlando</td>
      <td>Australia</td>
      <td></td>
      <td></td>
      <td>917755028</td>
    </tr>
    <tr>
      <th>1</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>C2</td>
      <td>Keith</td>
      <td>India</td>
      <td></td>
      <td>keith0@adventure-works.com</td>
      <td></td>
    </tr>
    <tr>
      <th>2</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>C3</td>
      <td>Donna</td>
      <td>Germany</td>
      <td>Berlin</td>
      <td>donna0@adventure-works.com</td>
      <td>915547890</td>
    </tr>
    <tr>
      <th>3</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>C4</td>
      <td>Janet</td>
      <td>United States</td>
      <td>California</td>
      <td>janet1@adventure-works.com</td>
      <td></td>
    </tr>
    <tr>
      <th>4</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>C5</td>
      <td>Fabio</td>
      <td>España</td>
      <td>Madrid</td>
      <td>fabio10@gmail.com</td>
      <td></td>
    </tr>
    <tr>
      <th>5</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>C6</td>
      <td>Juan</td>
      <td>España</td>
      <td>Sevilla</td>
      <td></td>
      <td>915869028</td>
    </tr>
    <tr>
      <th>6</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>C7</td>
      <td>Lucia</td>
      <td>España</td>
      <td></td>
      <td>LuciaPerez@hotmail.com</td>
      <td></td>
    </tr>
    <tr>
      <th>7</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>C8</td>
      <td>Pedro</td>
      <td>Italia</td>
      <td>Roma</td>
      <td>Pedro99@gmail.com</td>
      <td>910007890</td>
    </tr>
    <tr>
      <th>8</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>C9</td>
      <td>Sergio</td>
      <td>United States</td>
      <td>New York</td>
      <td>sergio_as@gmail.com</td>
      <td></td>
    </tr>
    <tr>
      <th>9</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>C10</td>
      <td>Grecia</td>
      <td>Peru</td>
      <td>Lima</td>
      <td>Grecia89@gmail.com</td>
      <td></td>
    </tr>
  </tbody>
</table>
</div>

<br>


We create two new data frames that will have the same column names:


```python
X1 = pd.Series([ 2 , 4 , 3, 35, 23 ])
X2 = pd.Series([10, 12, 3, 3, -13])
X3 = pd.Series([22, 33, 1, 5, -3])
X4 = pd.Series([52, 2, 23, 6, -5])
X5 = pd.Series([ 22 , 34 , 13, 35, 23 ])
X6 = pd.Series([10, 12, 32, 30, -13])
X7 = pd.Series([22, 33, 1, 56, -13])
X8 = pd.Series([5, 12, 2, 66, -5])

df1 = pd.DataFrame( {"X1": X1 , "X2": X2 , "X3": X3 , "X4": X4} ) 

df2 = pd.DataFrame( {"X1": X5 , "X2": X6 , "X3": X7 , "X4": X8} )
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
      <th>X1</th>
      <th>X2</th>
      <th>X3</th>
      <th>X4</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>2</td>
      <td>10</td>
      <td>22</td>
      <td>52</td>
    </tr>
    <tr>
      <th>1</th>
      <td>4</td>
      <td>12</td>
      <td>33</td>
      <td>2</td>
    </tr>
    <tr>
      <th>2</th>
      <td>3</td>
      <td>3</td>
      <td>1</td>
      <td>23</td>
    </tr>
    <tr>
      <th>3</th>
      <td>35</td>
      <td>3</td>
      <td>5</td>
      <td>6</td>
    </tr>
    <tr>
      <th>4</th>
      <td>23</td>
      <td>-13</td>
      <td>-3</td>
      <td>-5</td>
    </tr>
  </tbody>
</table>
</div>




```python
df2
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
      <th>X1</th>
      <th>X2</th>
      <th>X3</th>
      <th>X4</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>22</td>
      <td>10</td>
      <td>22</td>
      <td>5</td>
    </tr>
    <tr>
      <th>1</th>
      <td>34</td>
      <td>12</td>
      <td>33</td>
      <td>12</td>
    </tr>
    <tr>
      <th>2</th>
      <td>13</td>
      <td>32</td>
      <td>1</td>
      <td>2</td>
    </tr>
    <tr>
      <th>3</th>
      <td>35</td>
      <td>30</td>
      <td>56</td>
      <td>66</td>
    </tr>
    <tr>
      <th>4</th>
      <td>23</td>
      <td>-13</td>
      <td>-13</td>
      <td>-5</td>
    </tr>
  </tbody>
</table>
</div>


<br>

```python
concat([df1,df2] , axis=0)
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
      <th>X1</th>
      <th>X2</th>
      <th>X3</th>
      <th>X4</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>2</td>
      <td>10</td>
      <td>22</td>
      <td>52</td>
    </tr>
    <tr>
      <th>1</th>
      <td>4</td>
      <td>12</td>
      <td>33</td>
      <td>2</td>
    </tr>
    <tr>
      <th>2</th>
      <td>3</td>
      <td>3</td>
      <td>1</td>
      <td>23</td>
    </tr>
    <tr>
      <th>3</th>
      <td>35</td>
      <td>3</td>
      <td>5</td>
      <td>6</td>
    </tr>
    <tr>
      <th>4</th>
      <td>23</td>
      <td>-13</td>
      <td>-3</td>
      <td>-5</td>
    </tr>
    <tr>
      <th>0</th>
      <td>22</td>
      <td>10</td>
      <td>22</td>
      <td>5</td>
    </tr>
    <tr>
      <th>1</th>
      <td>34</td>
      <td>12</td>
      <td>33</td>
      <td>12</td>
    </tr>
    <tr>
      <th>2</th>
      <td>13</td>
      <td>32</td>
      <td>1</td>
      <td>2</td>
    </tr>
    <tr>
      <th>3</th>
      <td>35</td>
      <td>30</td>
      <td>56</td>
      <td>66</td>
    </tr>
    <tr>
      <th>4</th>
      <td>23</td>
      <td>-13</td>
      <td>-13</td>
      <td>-5</td>
    </tr>
  </tbody>
</table>
</div>


<br>


# Join data-frames <a class="anchor" id="1"></a>  


we are going to remember the `Ventas`, `Proveedores`and `Clientes` data-frames, because we are going to use them in this section:



```python
Ventas
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
      <th>VentasId</th>
      <th>Producto</th>
      <th>Precio</th>
      <th>ClienteID</th>
      <th>Proveedor</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>V1</td>
      <td>Alfombra</td>
      <td>1500.0</td>
      <td>C1</td>
      <td>P1</td>
    </tr>
    <tr>
      <th>1</th>
      <td>V2</td>
      <td>Killim</td>
      <td>699.5</td>
      <td>C3</td>
      <td>P1</td>
    </tr>
    <tr>
      <th>2</th>
      <td>V3</td>
      <td>Killim</td>
      <td>475.0</td>
      <td>C9</td>
      <td>P3</td>
    </tr>
    <tr>
      <th>3</th>
      <td>V4</td>
      <td>Alfombra</td>
      <td>5000.0</td>
      <td>C4</td>
      <td>P1</td>
    </tr>
    <tr>
      <th>4</th>
      <td>V5</td>
      <td>Killim</td>
      <td>499.5</td>
      <td>C8</td>
      <td>P1</td>
    </tr>
    <tr>
      <th>5</th>
      <td>V6</td>
      <td>Killim</td>
      <td>55.0</td>
      <td>C5</td>
      <td>P3</td>
    </tr>
    <tr>
      <th>6</th>
      <td>V7</td>
      <td>Alfombra</td>
      <td>2500.0</td>
      <td>C2</td>
      <td>P1</td>
    </tr>
    <tr>
      <th>7</th>
      <td>V8</td>
      <td>Killim</td>
      <td>299.5</td>
      <td>C10</td>
      <td>P1</td>
    </tr>
    <tr>
      <th>8</th>
      <td>V9</td>
      <td>Killim</td>
      <td>600.0</td>
      <td>C2</td>
      <td>P3</td>
    </tr>
    <tr>
      <th>9</th>
      <td>V10</td>
      <td>Alfombra</td>
      <td>1200.0</td>
      <td>C7</td>
      <td>P1</td>
    </tr>
    <tr>
      <th>10</th>
      <td>V11</td>
      <td>Killim</td>
      <td>500.0</td>
      <td>C8</td>
      <td>P1</td>
    </tr>
    <tr>
      <th>11</th>
      <td>V12</td>
      <td>Killim</td>
      <td>650.0</td>
      <td>C9</td>
      <td>P3</td>
    </tr>
    <tr>
      <th>12</th>
      <td>V13</td>
      <td>NaN</td>
      <td>3500.0</td>
      <td>C7</td>
      <td>P1</td>
    </tr>
    <tr>
      <th>13</th>
      <td>V14</td>
      <td>NaN</td>
      <td>1000.0</td>
      <td>C6</td>
      <td>P1</td>
    </tr>
    <tr>
      <th>14</th>
      <td>V15</td>
      <td>NaN</td>
      <td>350.0</td>
      <td>C10</td>
      <td>P3</td>
    </tr>
  </tbody>
</table>
</div>




```python
Clientes
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
      <th>ClienteID</th>
      <th>Nombre</th>
      <th>Pais</th>
      <th>Ciudad</th>
      <th>Email</th>
      <th>Telefono</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>C1</td>
      <td>Orlando</td>
      <td>Australia</td>
      <td></td>
      <td></td>
      <td>917755028</td>
    </tr>
    <tr>
      <th>1</th>
      <td>C2</td>
      <td>Keith</td>
      <td>India</td>
      <td></td>
      <td>keith0@adventure-works.com</td>
      <td></td>
    </tr>
    <tr>
      <th>2</th>
      <td>C3</td>
      <td>Donna</td>
      <td>Germany</td>
      <td>Berlin</td>
      <td>donna0@adventure-works.com</td>
      <td>915547890</td>
    </tr>
    <tr>
      <th>3</th>
      <td>C4</td>
      <td>Janet</td>
      <td>United States</td>
      <td>California</td>
      <td>janet1@adventure-works.com</td>
      <td></td>
    </tr>
    <tr>
      <th>4</th>
      <td>C5</td>
      <td>Fabio</td>
      <td>España</td>
      <td>Madrid</td>
      <td>fabio10@gmail.com</td>
      <td></td>
    </tr>
    <tr>
      <th>5</th>
      <td>C6</td>
      <td>Juan</td>
      <td>España</td>
      <td>Sevilla</td>
      <td></td>
      <td>915869028</td>
    </tr>
    <tr>
      <th>6</th>
      <td>C7</td>
      <td>Lucia</td>
      <td>España</td>
      <td></td>
      <td>LuciaPerez@hotmail.com</td>
      <td></td>
    </tr>
    <tr>
      <th>7</th>
      <td>C8</td>
      <td>Pedro</td>
      <td>Italia</td>
      <td>Roma</td>
      <td>Pedro99@gmail.com</td>
      <td>910007890</td>
    </tr>
    <tr>
      <th>8</th>
      <td>C9</td>
      <td>Sergio</td>
      <td>United States</td>
      <td>New York</td>
      <td>sergio_as@gmail.com</td>
      <td></td>
    </tr>
    <tr>
      <th>9</th>
      <td>C10</td>
      <td>Grecia</td>
      <td>Peru</td>
      <td>Lima</td>
      <td>Grecia89@gmail.com</td>
      <td></td>
    </tr>
    <tr>
      <th>10</th>
      <td>C11</td>
      <td>Ismael</td>
      <td>España</td>
      <td>Madrid</td>
      <td>Isma98@gmail.com</td>
      <td>912234543</td>
    </tr>
    <tr>
      <th>11</th>
      <td>C12</td>
      <td>Luis</td>
      <td>España</td>
      <td>Murcia</td>
      <td>Luismiguel123@gmail.com</td>
      <td></td>
    </tr>
  </tbody>
</table>
</div>



## Inner join

Inner join es una operacion que consiste en juntar dos data-frames (df1 y df2) a través de una columna compartida por ambos, denominada columna de enlace. El data-frame resultante de un inner join tiene como filas la concatenacion de las filas de df1 y las de df2 que contienen en la columna de enlace un mismo valor.

```python
# inner join

pd.merge(Ventas, Clientes, on='ClienteID', how='inner')  
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
      <th>VentasId</th>
      <th>Producto</th>
      <th>Precio</th>
      <th>ClienteID</th>
      <th>Proveedor</th>
      <th>Nombre</th>
      <th>Pais</th>
      <th>Ciudad</th>
      <th>Email</th>
      <th>Telefono</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>V1</td>
      <td>Alfombra</td>
      <td>1500.0</td>
      <td>C1</td>
      <td>P1</td>
      <td>Orlando</td>
      <td>Australia</td>
      <td></td>
      <td></td>
      <td>917755028</td>
    </tr>
    <tr>
      <th>1</th>
      <td>V2</td>
      <td>Killim</td>
      <td>699.5</td>
      <td>C3</td>
      <td>P1</td>
      <td>Donna</td>
      <td>Germany</td>
      <td>Berlin</td>
      <td>donna0@adventure-works.com</td>
      <td>915547890</td>
    </tr>
    <tr>
      <th>2</th>
      <td>V3</td>
      <td>Killim</td>
      <td>475.0</td>
      <td>C9</td>
      <td>P3</td>
      <td>Sergio</td>
      <td>United States</td>
      <td>New York</td>
      <td>sergio_as@gmail.com</td>
      <td></td>
    </tr>
    <tr>
      <th>3</th>
      <td>V12</td>
      <td>Killim</td>
      <td>650.0</td>
      <td>C9</td>
      <td>P3</td>
      <td>Sergio</td>
      <td>United States</td>
      <td>New York</td>
      <td>sergio_as@gmail.com</td>
      <td></td>
    </tr>
    <tr>
      <th>4</th>
      <td>V4</td>
      <td>Alfombra</td>
      <td>5000.0</td>
      <td>C4</td>
      <td>P1</td>
      <td>Janet</td>
      <td>United States</td>
      <td>California</td>
      <td>janet1@adventure-works.com</td>
      <td></td>
    </tr>
    <tr>
      <th>5</th>
      <td>V5</td>
      <td>Killim</td>
      <td>499.5</td>
      <td>C8</td>
      <td>P1</td>
      <td>Pedro</td>
      <td>Italia</td>
      <td>Roma</td>
      <td>Pedro99@gmail.com</td>
      <td>910007890</td>
    </tr>
    <tr>
      <th>6</th>
      <td>V11</td>
      <td>Killim</td>
      <td>500.0</td>
      <td>C8</td>
      <td>P1</td>
      <td>Pedro</td>
      <td>Italia</td>
      <td>Roma</td>
      <td>Pedro99@gmail.com</td>
      <td>910007890</td>
    </tr>
    <tr>
      <th>7</th>
      <td>V6</td>
      <td>Killim</td>
      <td>55.0</td>
      <td>C5</td>
      <td>P3</td>
      <td>Fabio</td>
      <td>España</td>
      <td>Madrid</td>
      <td>fabio10@gmail.com</td>
      <td></td>
    </tr>
    <tr>
      <th>8</th>
      <td>V7</td>
      <td>Alfombra</td>
      <td>2500.0</td>
      <td>C2</td>
      <td>P1</td>
      <td>Keith</td>
      <td>India</td>
      <td></td>
      <td>keith0@adventure-works.com</td>
      <td></td>
    </tr>
    <tr>
      <th>9</th>
      <td>V9</td>
      <td>Killim</td>
      <td>600.0</td>
      <td>C2</td>
      <td>P3</td>
      <td>Keith</td>
      <td>India</td>
      <td></td>
      <td>keith0@adventure-works.com</td>
      <td></td>
    </tr>
    <tr>
      <th>10</th>
      <td>V8</td>
      <td>Killim</td>
      <td>299.5</td>
      <td>C10</td>
      <td>P1</td>
      <td>Grecia</td>
      <td>Peru</td>
      <td>Lima</td>
      <td>Grecia89@gmail.com</td>
      <td></td>
    </tr>
    <tr>
      <th>11</th>
      <td>V15</td>
      <td>NaN</td>
      <td>350.0</td>
      <td>C10</td>
      <td>P3</td>
      <td>Grecia</td>
      <td>Peru</td>
      <td>Lima</td>
      <td>Grecia89@gmail.com</td>
      <td></td>
    </tr>
    <tr>
      <th>12</th>
      <td>V10</td>
      <td>Alfombra</td>
      <td>1200.0</td>
      <td>C7</td>
      <td>P1</td>
      <td>Lucia</td>
      <td>España</td>
      <td></td>
      <td>LuciaPerez@hotmail.com</td>
      <td></td>
    </tr>
    <tr>
      <th>13</th>
      <td>V13</td>
      <td>NaN</td>
      <td>3500.0</td>
      <td>C7</td>
      <td>P1</td>
      <td>Lucia</td>
      <td>España</td>
      <td></td>
      <td>LuciaPerez@hotmail.com</td>
      <td></td>
    </tr>
    <tr>
      <th>14</th>
      <td>V14</td>
      <td>NaN</td>
      <td>1000.0</td>
      <td>C6</td>
      <td>P1</td>
      <td>Juan</td>
      <td>España</td>
      <td>Sevilla</td>
      <td></td>
      <td>915869028</td>
    </tr>
  </tbody>
</table>
</div>

<br>

## Outer join

Outer join es una operacion que consiste en juntar dos data-frames (df1 y df2) a través de una columna compartida por ambos, denominada columna de enlace. El data-frame resultante de un inner join tiene como filas la concatenacion de las filas de df1 y las de df2 que contienen en la columna de enlace un mismo valor, y además si hay alguna fila de df1 que contiene un valor en la columna enlace que no aparece en ninguna fila de df2, entonces esta fila se concatena con una fila con tantos NaN como columnas (sin contar la de enlace) tiene df2, y se añade al nuevo data-frame. Y lo mismo para df2, es decir, si hay alguna fila de df2 que contiene un valor en la columna enlace que no aparece en ninguna fila de df1, entonces esta fila se concatena con una fila con tantos NaN como columnas (sin contar la de enlace) tiene df1, y se añade al nuevo data-frame.

```python
pd.merge(Ventas, Clientes, on='ClienteID', how='outer')  
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
      <th>VentasId</th>
      <th>Producto</th>
      <th>Precio</th>
      <th>ClienteID</th>
      <th>Proveedor</th>
      <th>Nombre</th>
      <th>Pais</th>
      <th>Ciudad</th>
      <th>Email</th>
      <th>Telefono</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>V1</td>
      <td>Alfombra</td>
      <td>1500.0</td>
      <td>C1</td>
      <td>P1</td>
      <td>Orlando</td>
      <td>Australia</td>
      <td></td>
      <td></td>
      <td>917755028</td>
    </tr>
    <tr>
      <th>1</th>
      <td>V2</td>
      <td>Killim</td>
      <td>699.5</td>
      <td>C3</td>
      <td>P1</td>
      <td>Donna</td>
      <td>Germany</td>
      <td>Berlin</td>
      <td>donna0@adventure-works.com</td>
      <td>915547890</td>
    </tr>
    <tr>
      <th>2</th>
      <td>V3</td>
      <td>Killim</td>
      <td>475.0</td>
      <td>C9</td>
      <td>P3</td>
      <td>Sergio</td>
      <td>United States</td>
      <td>New York</td>
      <td>sergio_as@gmail.com</td>
      <td></td>
    </tr>
    <tr>
      <th>3</th>
      <td>V12</td>
      <td>Killim</td>
      <td>650.0</td>
      <td>C9</td>
      <td>P3</td>
      <td>Sergio</td>
      <td>United States</td>
      <td>New York</td>
      <td>sergio_as@gmail.com</td>
      <td></td>
    </tr>
    <tr>
      <th>4</th>
      <td>V4</td>
      <td>Alfombra</td>
      <td>5000.0</td>
      <td>C4</td>
      <td>P1</td>
      <td>Janet</td>
      <td>United States</td>
      <td>California</td>
      <td>janet1@adventure-works.com</td>
      <td></td>
    </tr>
    <tr>
      <th>5</th>
      <td>V5</td>
      <td>Killim</td>
      <td>499.5</td>
      <td>C8</td>
      <td>P1</td>
      <td>Pedro</td>
      <td>Italia</td>
      <td>Roma</td>
      <td>Pedro99@gmail.com</td>
      <td>910007890</td>
    </tr>
    <tr>
      <th>6</th>
      <td>V11</td>
      <td>Killim</td>
      <td>500.0</td>
      <td>C8</td>
      <td>P1</td>
      <td>Pedro</td>
      <td>Italia</td>
      <td>Roma</td>
      <td>Pedro99@gmail.com</td>
      <td>910007890</td>
    </tr>
    <tr>
      <th>7</th>
      <td>V6</td>
      <td>Killim</td>
      <td>55.0</td>
      <td>C5</td>
      <td>P3</td>
      <td>Fabio</td>
      <td>España</td>
      <td>Madrid</td>
      <td>fabio10@gmail.com</td>
      <td></td>
    </tr>
    <tr>
      <th>8</th>
      <td>V7</td>
      <td>Alfombra</td>
      <td>2500.0</td>
      <td>C2</td>
      <td>P1</td>
      <td>Keith</td>
      <td>India</td>
      <td></td>
      <td>keith0@adventure-works.com</td>
      <td></td>
    </tr>
    <tr>
      <th>9</th>
      <td>V9</td>
      <td>Killim</td>
      <td>600.0</td>
      <td>C2</td>
      <td>P3</td>
      <td>Keith</td>
      <td>India</td>
      <td></td>
      <td>keith0@adventure-works.com</td>
      <td></td>
    </tr>
    <tr>
      <th>10</th>
      <td>V8</td>
      <td>Killim</td>
      <td>299.5</td>
      <td>C10</td>
      <td>P1</td>
      <td>Grecia</td>
      <td>Peru</td>
      <td>Lima</td>
      <td>Grecia89@gmail.com</td>
      <td></td>
    </tr>
    <tr>
      <th>11</th>
      <td>V15</td>
      <td>NaN</td>
      <td>350.0</td>
      <td>C10</td>
      <td>P3</td>
      <td>Grecia</td>
      <td>Peru</td>
      <td>Lima</td>
      <td>Grecia89@gmail.com</td>
      <td></td>
    </tr>
    <tr>
      <th>12</th>
      <td>V10</td>
      <td>Alfombra</td>
      <td>1200.0</td>
      <td>C7</td>
      <td>P1</td>
      <td>Lucia</td>
      <td>España</td>
      <td></td>
      <td>LuciaPerez@hotmail.com</td>
      <td></td>
    </tr>
    <tr>
      <th>13</th>
      <td>V13</td>
      <td>NaN</td>
      <td>3500.0</td>
      <td>C7</td>
      <td>P1</td>
      <td>Lucia</td>
      <td>España</td>
      <td></td>
      <td>LuciaPerez@hotmail.com</td>
      <td></td>
    </tr>
    <tr>
      <th>14</th>
      <td>V14</td>
      <td>NaN</td>
      <td>1000.0</td>
      <td>C6</td>
      <td>P1</td>
      <td>Juan</td>
      <td>España</td>
      <td>Sevilla</td>
      <td></td>
      <td>915869028</td>
    </tr>
    <tr>
      <th>15</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>C11</td>
      <td>NaN</td>
      <td>Ismael</td>
      <td>España</td>
      <td>Madrid</td>
      <td>Isma98@gmail.com</td>
      <td>912234543</td>
    </tr>
    <tr>
      <th>16</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>C12</td>
      <td>NaN</td>
      <td>Luis</td>
      <td>España</td>
      <td>Murcia</td>
      <td>Luismiguel123@gmail.com</td>
      <td></td>
    </tr>
  </tbody>
</table>
</div>

<br>

## Left join

Left join es una operacion que consiste en juntar dos data-frames (df1 y df2) a través de una columna compartida por ambos, denominada columna de enlace. El data-frame resultante de un inner join tiene como filas la concatenacion de las filas de df1 y las de df2 que contienen en la columna de enlace un mismo valor, y además si hay alguna fila de df1 (df de la izquierda) que contiene un valor en la columna enlace que no aparece en ninguna fila de df2, entonces esta fila se concatena con una fila con tantos NaN como columnas (sin contar la de enlace) tiene df2, y se añade al nuevo data-frame.


```python
pd.merge(Ventas, Clientes, on='ClienteID', how='left')
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
      <th>VentasId</th>
      <th>Producto</th>
      <th>Precio</th>
      <th>ClienteID</th>
      <th>Proveedor</th>
      <th>Nombre</th>
      <th>Pais</th>
      <th>Ciudad</th>
      <th>Email</th>
      <th>Telefono</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>V1</td>
      <td>Alfombra</td>
      <td>1500.0</td>
      <td>C1</td>
      <td>P1</td>
      <td>Orlando</td>
      <td>Australia</td>
      <td></td>
      <td></td>
      <td>917755028</td>
    </tr>
    <tr>
      <th>1</th>
      <td>V2</td>
      <td>Killim</td>
      <td>699.5</td>
      <td>C3</td>
      <td>P1</td>
      <td>Donna</td>
      <td>Germany</td>
      <td>Berlin</td>
      <td>donna0@adventure-works.com</td>
      <td>915547890</td>
    </tr>
    <tr>
      <th>2</th>
      <td>V3</td>
      <td>Killim</td>
      <td>475.0</td>
      <td>C9</td>
      <td>P3</td>
      <td>Sergio</td>
      <td>United States</td>
      <td>New York</td>
      <td>sergio_as@gmail.com</td>
      <td></td>
    </tr>
    <tr>
      <th>3</th>
      <td>V4</td>
      <td>Alfombra</td>
      <td>5000.0</td>
      <td>C4</td>
      <td>P1</td>
      <td>Janet</td>
      <td>United States</td>
      <td>California</td>
      <td>janet1@adventure-works.com</td>
      <td></td>
    </tr>
    <tr>
      <th>4</th>
      <td>V5</td>
      <td>Killim</td>
      <td>499.5</td>
      <td>C8</td>
      <td>P1</td>
      <td>Pedro</td>
      <td>Italia</td>
      <td>Roma</td>
      <td>Pedro99@gmail.com</td>
      <td>910007890</td>
    </tr>
    <tr>
      <th>5</th>
      <td>V6</td>
      <td>Killim</td>
      <td>55.0</td>
      <td>C5</td>
      <td>P3</td>
      <td>Fabio</td>
      <td>España</td>
      <td>Madrid</td>
      <td>fabio10@gmail.com</td>
      <td></td>
    </tr>
    <tr>
      <th>6</th>
      <td>V7</td>
      <td>Alfombra</td>
      <td>2500.0</td>
      <td>C2</td>
      <td>P1</td>
      <td>Keith</td>
      <td>India</td>
      <td></td>
      <td>keith0@adventure-works.com</td>
      <td></td>
    </tr>
    <tr>
      <th>7</th>
      <td>V8</td>
      <td>Killim</td>
      <td>299.5</td>
      <td>C10</td>
      <td>P1</td>
      <td>Grecia</td>
      <td>Peru</td>
      <td>Lima</td>
      <td>Grecia89@gmail.com</td>
      <td></td>
    </tr>
    <tr>
      <th>8</th>
      <td>V9</td>
      <td>Killim</td>
      <td>600.0</td>
      <td>C2</td>
      <td>P3</td>
      <td>Keith</td>
      <td>India</td>
      <td></td>
      <td>keith0@adventure-works.com</td>
      <td></td>
    </tr>
    <tr>
      <th>9</th>
      <td>V10</td>
      <td>Alfombra</td>
      <td>1200.0</td>
      <td>C7</td>
      <td>P1</td>
      <td>Lucia</td>
      <td>España</td>
      <td></td>
      <td>LuciaPerez@hotmail.com</td>
      <td></td>
    </tr>
    <tr>
      <th>10</th>
      <td>V11</td>
      <td>Killim</td>
      <td>500.0</td>
      <td>C8</td>
      <td>P1</td>
      <td>Pedro</td>
      <td>Italia</td>
      <td>Roma</td>
      <td>Pedro99@gmail.com</td>
      <td>910007890</td>
    </tr>
    <tr>
      <th>11</th>
      <td>V12</td>
      <td>Killim</td>
      <td>650.0</td>
      <td>C9</td>
      <td>P3</td>
      <td>Sergio</td>
      <td>United States</td>
      <td>New York</td>
      <td>sergio_as@gmail.com</td>
      <td></td>
    </tr>
    <tr>
      <th>12</th>
      <td>V13</td>
      <td>NaN</td>
      <td>3500.0</td>
      <td>C7</td>
      <td>P1</td>
      <td>Lucia</td>
      <td>España</td>
      <td></td>
      <td>LuciaPerez@hotmail.com</td>
      <td></td>
    </tr>
    <tr>
      <th>13</th>
      <td>V14</td>
      <td>NaN</td>
      <td>1000.0</td>
      <td>C6</td>
      <td>P1</td>
      <td>Juan</td>
      <td>España</td>
      <td>Sevilla</td>
      <td></td>
      <td>915869028</td>
    </tr>
    <tr>
      <th>14</th>
      <td>V15</td>
      <td>NaN</td>
      <td>350.0</td>
      <td>C10</td>
      <td>P3</td>
      <td>Grecia</td>
      <td>Peru</td>
      <td>Lima</td>
      <td>Grecia89@gmail.com</td>
      <td></td>
    </tr>
  </tbody>
</table>
</div>


<br>


## Right join

Right join is an operation that consists of joining two data-frames (df1 and df2) through a column shared by both, called link column. The data-frame resulting from a right join has as rows the concatenation of the rows of df1 and those of df2 that contain the same value in the link column, and also if there is any row of df2 (df on the right) that contains a value in the link column that does not appear in any row of df1, then this row is concatenated with a row with as many NaN as there are columns (not counting the link column) df1 has, and it is added to the new data-frame.

```python
pd.merge(Ventas, Clientes, on='ClienteID', how='right') 
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
      <th>VentasId</th>
      <th>Producto</th>
      <th>Precio</th>
      <th>ClienteID</th>
      <th>Proveedor</th>
      <th>Nombre</th>
      <th>Pais</th>
      <th>Ciudad</th>
      <th>Email</th>
      <th>Telefono</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>V1</td>
      <td>Alfombra</td>
      <td>1500.0</td>
      <td>C1</td>
      <td>P1</td>
      <td>Orlando</td>
      <td>Australia</td>
      <td></td>
      <td></td>
      <td>917755028</td>
    </tr>
    <tr>
      <th>1</th>
      <td>V7</td>
      <td>Alfombra</td>
      <td>2500.0</td>
      <td>C2</td>
      <td>P1</td>
      <td>Keith</td>
      <td>India</td>
      <td></td>
      <td>keith0@adventure-works.com</td>
      <td></td>
    </tr>
    <tr>
      <th>2</th>
      <td>V9</td>
      <td>Killim</td>
      <td>600.0</td>
      <td>C2</td>
      <td>P3</td>
      <td>Keith</td>
      <td>India</td>
      <td></td>
      <td>keith0@adventure-works.com</td>
      <td></td>
    </tr>
    <tr>
      <th>3</th>
      <td>V2</td>
      <td>Killim</td>
      <td>699.5</td>
      <td>C3</td>
      <td>P1</td>
      <td>Donna</td>
      <td>Germany</td>
      <td>Berlin</td>
      <td>donna0@adventure-works.com</td>
      <td>915547890</td>
    </tr>
    <tr>
      <th>4</th>
      <td>V4</td>
      <td>Alfombra</td>
      <td>5000.0</td>
      <td>C4</td>
      <td>P1</td>
      <td>Janet</td>
      <td>United States</td>
      <td>California</td>
      <td>janet1@adventure-works.com</td>
      <td></td>
    </tr>
    <tr>
      <th>5</th>
      <td>V6</td>
      <td>Killim</td>
      <td>55.0</td>
      <td>C5</td>
      <td>P3</td>
      <td>Fabio</td>
      <td>España</td>
      <td>Madrid</td>
      <td>fabio10@gmail.com</td>
      <td></td>
    </tr>
    <tr>
      <th>6</th>
      <td>V14</td>
      <td>NaN</td>
      <td>1000.0</td>
      <td>C6</td>
      <td>P1</td>
      <td>Juan</td>
      <td>España</td>
      <td>Sevilla</td>
      <td></td>
      <td>915869028</td>
    </tr>
    <tr>
      <th>7</th>
      <td>V10</td>
      <td>Alfombra</td>
      <td>1200.0</td>
      <td>C7</td>
      <td>P1</td>
      <td>Lucia</td>
      <td>España</td>
      <td></td>
      <td>LuciaPerez@hotmail.com</td>
      <td></td>
    </tr>
    <tr>
      <th>8</th>
      <td>V13</td>
      <td>NaN</td>
      <td>3500.0</td>
      <td>C7</td>
      <td>P1</td>
      <td>Lucia</td>
      <td>España</td>
      <td></td>
      <td>LuciaPerez@hotmail.com</td>
      <td></td>
    </tr>
    <tr>
      <th>9</th>
      <td>V5</td>
      <td>Killim</td>
      <td>499.5</td>
      <td>C8</td>
      <td>P1</td>
      <td>Pedro</td>
      <td>Italia</td>
      <td>Roma</td>
      <td>Pedro99@gmail.com</td>
      <td>910007890</td>
    </tr>
    <tr>
      <th>10</th>
      <td>V11</td>
      <td>Killim</td>
      <td>500.0</td>
      <td>C8</td>
      <td>P1</td>
      <td>Pedro</td>
      <td>Italia</td>
      <td>Roma</td>
      <td>Pedro99@gmail.com</td>
      <td>910007890</td>
    </tr>
    <tr>
      <th>11</th>
      <td>V3</td>
      <td>Killim</td>
      <td>475.0</td>
      <td>C9</td>
      <td>P3</td>
      <td>Sergio</td>
      <td>United States</td>
      <td>New York</td>
      <td>sergio_as@gmail.com</td>
      <td></td>
    </tr>
    <tr>
      <th>12</th>
      <td>V12</td>
      <td>Killim</td>
      <td>650.0</td>
      <td>C9</td>
      <td>P3</td>
      <td>Sergio</td>
      <td>United States</td>
      <td>New York</td>
      <td>sergio_as@gmail.com</td>
      <td></td>
    </tr>
    <tr>
      <th>13</th>
      <td>V8</td>
      <td>Killim</td>
      <td>299.5</td>
      <td>C10</td>
      <td>P1</td>
      <td>Grecia</td>
      <td>Peru</td>
      <td>Lima</td>
      <td>Grecia89@gmail.com</td>
      <td></td>
    </tr>
    <tr>
      <th>14</th>
      <td>V15</td>
      <td>NaN</td>
      <td>350.0</td>
      <td>C10</td>
      <td>P3</td>
      <td>Grecia</td>
      <td>Peru</td>
      <td>Lima</td>
      <td>Grecia89@gmail.com</td>
      <td></td>
    </tr>
    <tr>
      <th>15</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>C11</td>
      <td>NaN</td>
      <td>Ismael</td>
      <td>España</td>
      <td>Madrid</td>
      <td>Isma98@gmail.com</td>
      <td>912234543</td>
    </tr>
    <tr>
      <th>16</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>C12</td>
      <td>NaN</td>
      <td>Luis</td>
      <td>España</td>
      <td>Murcia</td>
      <td>Luismiguel123@gmail.com</td>
      <td></td>
    </tr>
  </tbody>
</table>
</div>


<br>

The correct way to use `merge` when the names of link columns are different is:


```python
# df_merge = pd.merge(df1, df2, left_on='id1' , right_on='id2', how='inner')
```


<br>


# Sorting columns from a data-frame


```python
House_Price_Data.sort_values(by='price', ascending=True)
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
      <th>private_garden_recode</th>
      <th>private_gym_recode</th>
      <th>private_jacuzzi_recode</th>
      <th>private_pool_recode</th>
      <th>security_recode</th>
      <th>shared_gym_recode</th>
      <th>shared_pool_recode</th>
      <th>shared_spa_recode</th>
      <th>view_of_water_recode</th>
      <th>size_in_m_2</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>1592</th>
      <td>31.0</td>
      <td>25.173301</td>
      <td>55.402315</td>
      <td>220000</td>
      <td>0</td>
      <td>1</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>44.965052</td>
    </tr>
    <tr>
      <th>1610</th>
      <td>23.0</td>
      <td>25.036803</td>
      <td>55.200909</td>
      <td>230000</td>
      <td>0</td>
      <td>1</td>
      <td>2.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>35.303140</td>
    </tr>
    <tr>
      <th>1609</th>
      <td>23.0</td>
      <td>25.036803</td>
      <td>55.200909</td>
      <td>230000</td>
      <td>0</td>
      <td>1</td>
      <td>2.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>33.630886</td>
    </tr>
    <tr>
      <th>749</th>
      <td>25.0</td>
      <td>25.115934</td>
      <td>55.390236</td>
      <td>245000</td>
      <td>0</td>
      <td>1</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>28.428318</td>
    </tr>
    <tr>
      <th>1499</th>
      <td>25.0</td>
      <td>25.115934</td>
      <td>55.390236</td>
      <td>250000</td>
      <td>0</td>
      <td>1</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>32.794759</td>
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
      <th>427</th>
      <td>9.0</td>
      <td>25.188299</td>
      <td>55.288975</td>
      <td>30950000</td>
      <td>4</td>
      <td>4</td>
      <td>2.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>735.977566</td>
    </tr>
    <tr>
      <th>1885</th>
      <td>46.0</td>
      <td>25.103972</td>
      <td>55.149621</td>
      <td>31440000</td>
      <td>4</td>
      <td>6</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>607.771426</td>
    </tr>
    <tr>
      <th>576</th>
      <td>46.0</td>
      <td>25.103550</td>
      <td>55.168509</td>
      <td>34314000</td>
      <td>4</td>
      <td>5</td>
      <td>2.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>889.639128</td>
    </tr>
    <tr>
      <th>1869</th>
      <td>46.0</td>
      <td>25.103972</td>
      <td>55.149621</td>
      <td>34340000</td>
      <td>4</td>
      <td>6</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>810.299966</td>
    </tr>
    <tr>
      <th>989</th>
      <td>46.0</td>
      <td>25.103550</td>
      <td>55.168509</td>
      <td>35000000</td>
      <td>4</td>
      <td>5</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>682.465438</td>
    </tr>
  </tbody>
</table>
<p>1905 rows × 29 columns</p>
</div>




```python
House_Price_Data.sort_values(by='price', ascending=False)
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
      <th>private_garden_recode</th>
      <th>private_gym_recode</th>
      <th>private_jacuzzi_recode</th>
      <th>private_pool_recode</th>
      <th>security_recode</th>
      <th>shared_gym_recode</th>
      <th>shared_pool_recode</th>
      <th>shared_spa_recode</th>
      <th>view_of_water_recode</th>
      <th>size_in_m_2</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>989</th>
      <td>46.0</td>
      <td>25.103550</td>
      <td>55.168509</td>
      <td>35000000</td>
      <td>4</td>
      <td>5</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>682.465438</td>
    </tr>
    <tr>
      <th>1869</th>
      <td>46.0</td>
      <td>25.103972</td>
      <td>55.149621</td>
      <td>34340000</td>
      <td>4</td>
      <td>6</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>810.299966</td>
    </tr>
    <tr>
      <th>576</th>
      <td>46.0</td>
      <td>25.103550</td>
      <td>55.168509</td>
      <td>34314000</td>
      <td>4</td>
      <td>5</td>
      <td>2.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>889.639128</td>
    </tr>
    <tr>
      <th>1885</th>
      <td>46.0</td>
      <td>25.103972</td>
      <td>55.149621</td>
      <td>31440000</td>
      <td>4</td>
      <td>6</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>607.771426</td>
    </tr>
    <tr>
      <th>427</th>
      <td>9.0</td>
      <td>25.188299</td>
      <td>55.288975</td>
      <td>30950000</td>
      <td>4</td>
      <td>4</td>
      <td>2.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>735.977566</td>
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
      <th>1499</th>
      <td>25.0</td>
      <td>25.115934</td>
      <td>55.390236</td>
      <td>250000</td>
      <td>0</td>
      <td>1</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>32.794759</td>
    </tr>
    <tr>
      <th>749</th>
      <td>25.0</td>
      <td>25.115934</td>
      <td>55.390236</td>
      <td>245000</td>
      <td>0</td>
      <td>1</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>28.428318</td>
    </tr>
    <tr>
      <th>1609</th>
      <td>23.0</td>
      <td>25.036803</td>
      <td>55.200909</td>
      <td>230000</td>
      <td>0</td>
      <td>1</td>
      <td>2.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>33.630886</td>
    </tr>
    <tr>
      <th>1610</th>
      <td>23.0</td>
      <td>25.036803</td>
      <td>55.200909</td>
      <td>230000</td>
      <td>0</td>
      <td>1</td>
      <td>2.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>35.303140</td>
    </tr>
    <tr>
      <th>1592</th>
      <td>31.0</td>
      <td>25.173301</td>
      <td>55.402315</td>
      <td>220000</td>
      <td>0</td>
      <td>1</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>44.965052</td>
    </tr>
  </tbody>
</table>
<p>1905 rows × 29 columns</p>
</div>








