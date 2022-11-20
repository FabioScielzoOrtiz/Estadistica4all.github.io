---
title: 'Modelos de Clasificación No Supervisada'
author: 'Fabio Scielzo Ortiz'
date: '13/11/22'
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


# Problema de clasificación no supervisada


Un proble de clasificación supervisada  es un problema estadistico que consiste en predecir una variable respuesta **categorica** usando para ello informacion exclusivamente de unas variables predictoras, puesto que no se tienen datos sobre la respuesta (esta es la diferencia entre la clasificación no supervisada y la supervisada). 

A los prblemas de clasificación no supervisada tambien se les conoce como problemas de clustering.$\\[1cm]$



- Tenemos $p$ predictores  $\hspace{0.1cm}(\mathcal{X}_1 ,...,\mathcal{X}_p)\hspace{0.1cm}$ y una variable respuesta **categorica** $\hspace{0.1cm}\mathcal{Y} \\$ que es desconocida.


- Tenemos una muestra de tamaño $\hspace{0.1cm}n\hspace{0.1cm}$ de los $\hspace{0.1cm}p\hspace{0.1cm}$ predictores $\hspace{0.1cm}X_1,...,X_p\hspace{0.1cm}$  pero no tenemos muestra de la respuesta (elemento clave de la clasificación no supervisada), tampoco conocemos su recorrido, es decir, las categorias que la definen.

Port tanto tenemos la siguiente matriz de datos: $\\[0.8cm]$

$$D=[X_1,...,X_p]=\begin{pmatrix}
    x_{11}&x_{12}&...&x_{1p} \\
    x_{21}&x_{22}&...&x_{2p} \\
    ... &...& ...&...\\
    x_{n1}&x_{n2}&...&x_{np}
    \end{pmatrix} = \begin{pmatrix}
    x_{1} \\
    x_{2}  \\
     ...\\
     x_{n} 
    \end{pmatrix}$$





# k-medias


Es un modelo o algoritmo de clasificación no supervisada, en el sentido de que permite resolver problemas de clasificación no supervisada.

A continuación vamos a explicar su mécanica, partiendo de los elementos descritos en la sección anterior.

<br>

**Descripción no formal del algoritmo**






<br>





**Descripción formal del algoritmo**


$1)\hspace{0.1cm}$ Se considera que la variable respuesta $\hspace{0.1cm}\mathcal{Y}\hspace{0.1cm}$ tiene $\hspace{0.1cm} k\hspace{0.1cm}$ categorias $\hspace{0.1cm}g_1,...,g_k$ $\\[0.6cm]$


$2)\hspace{0.1cm}$  Se asignan aleatoriamente las observaciones disponibles $\hspace{0.1cm}x_1,...,x_n\hspace{0.1cm}$ de los predictores a dichas categorias, formandose clusters (o grupos) de observaciones $\hspace{0.1cm} C_1,...,C_k\hspace{0.1cm}$ , de un tamaño similar : $\\[0.4cm]$

$$C_j = ( x_i^t \hspace{0.1cm}/\hspace{0.1cm} i \in I_j \subset \lbrace 1,...,n \rbrace )^t \\$$

Donde $\hspace{0.1cm}I_j\hspace{0.1cm}$ es el conjunto de indices de las observaciones de los predictores que pertenecen al cluster $\hspace{0.1cm}C_j$. $\hspace{0.08cm}$ Por lo que puede verse como el conjunto de los individuos de la muestra asociados al cluster $\hspace{0.1cm} C_j$

Notese que $\hspace{0.1cm}I_j\hspace{0.1cm}$ es definido aleatoriamente en esta primera etapa. 

También hay que notar que $\hspace{0.1cm}C_j\hspace{0.1cm}$ es un vector cuyas componentes son vectores fila, luego es una matriz. Como además estos vectores fila son observaciones de variables estadisticas, puede verse como una matriz de datos. $\\[0.8cm]$


$3)\hspace{0.1cm}$  Se calculan los **centroides** de los clusters formados en el paso anterior.

El **centroide** de un cluster $\hspace{0.1cm} C_j\hspace{0.1cm}$  es definido en el algoritmo k-medias como la media de las observaciones del cluster. Si las observaciones son $\hspace{0.1cm}p$-dimensionales (como en este caso) el centroide será un vector de medias como centroide del cluster.


El **centroide** del cluster $\hspace{0.1cm}C_j\hspace{0.1cm}$ es $\hspace{0.2cm}\overline{x}_{C_j} = (\overline{X}_{1, C_j} ,...,\overline{X}_{p, C_j})$

Donde:

$$X_{r , C_j } = (\hspace{0.1cm} x_{ir} \hspace{0.1cm}/\hspace{0.1cm} i\in I_j \hspace{0.1cm})$$

Es decir, es la muestra de observaciones de $\hspace{0.1cm}\mathcal{X}_r\hspace{0.1cm}$ que aparecen en el cluster $\hspace{0.1cm}C_j$ $\\[0.8cm]$


$4)\hspace{0.1cm}$  Aplicado a la observación $\hspace{0.1cm}x_1$

Se asigna $\hspace{0.1cm}x_1 \hspace{0.1cm}$ al cluster que le queda mas cercano teniendo en cuenta su centroide, usando para ello una medida de distancia $\hspace{0.1cm}\delta$

Se calculan las distancia entre la observacion $\hspace{0.1cm} x_1\hspace{0.1cm}$ y los centroides de cada cluster:

$$\delta(x_1, \overline{x}_{C_1}) \hspace{0.1cm},\hspace{0.1cm} \delta(x_1, \overline{x}_{C_2}) \hspace{0.1cm},...,\hspace{0.1cm} \delta(x_1, \overline{x}_{C_k})$$

Se asigna $\hspace{0.1cm}x_1\hspace{0.1cm}$ al cluster que minimiza estas distancias. Es decir, al cluster del que está mas cerca.



Por tanto, el algoritmo asigna $\hspace{0.1cm}x_1\hspace{0.1cm}$ al cluster $\hspace{0.1cm}C_{j^*}\hspace{0.1cm}$ tal que: $\\[0.5cm]$

$$j\hspace{0.1cm}^{*} \hspace{0.1cm}=\hspace{0.1cm} arg \hspace{0.15cm} \underset{j}{Min} \hspace{0.15cm} \delta(x_1 , \overline{x}_{C_j}) \\$$

 



$5)\hspace{0.1cm}$  Aplicado a la observación $\hspace{0.1cm} x_1$



- Si en la configuración aleatoria inicial de los clusterings $\hspace{0.1cm} x_1 \in C_{j\hspace{0.08cm}^*}\hspace{0.1cm}$ $\Rightarrow \hspace{0.2cm}$  Aplicar 4) y 5) para la siguiente observación $(x_2) \\$

 
- Si en la configuracion aleatoria inicial de los clusterings $\hspace{0.1cm}x_1 \notin C_{j\hspace{0.08cm}^*}\hspace{0.1cm}$ , entonces:

Se modifica la configuración de los cluesterings del siguiente modo:

- $C_{j\hspace{0.08cm}^*}\hspace{0.1cm}$ ahora contiene a $x_1$

-  El cluster que contenia a $\hspace{0.1cm}x_1\hspace{0.1cm}$ ahora ya no lo contiene

Se recalculan los centroides de los clusters para la nueva configuracion de clusters.

Se aplica 4) y 5) de nuevo a la observacion $\hspace{0.1cm}x_1\hspace{0.1cm}$

$\\[0.8cm]$

$6)\hspace{0.1cm}$  Cuando el paso 4) y 5) se hayan aplicado a todas las observaciones $\hspace{0.1cm}x_1,...,x_n\hspace{0.1cm}$, se detiene el algoritmo, obteniendose la configuración definitiva de clusters, y con ello las predicciones de la respuesta.

Para las observaciones $\hspace{0.1cm} x_i \in C_j\hspace{0.1cm}$ se predice la respuesta como $\hspace{0.1cm}\hat{y}_i = g_j\hspace{0.1cm}$

Una tarea posterior es la interpretar la categoria $\hspace{0.1cm}g_j\hspace{0.1cm}$ , puesto que desconocemos a que hace referencia al no tener esa info sobre la respuesta

 
---

Se puede demostrar que este algoritmo hace disminuir con cada nueva configuración de clusters la suma de varizas intra-cluster definida en báse a la distancia Euclidea:

Es decir, para cada nueva configuración de clusters se reduce la siguiente cantidad: $\\[0.5cm]$


$$\sum_{j=1}^{k} \hspace{0.2cm} \sum_{i \hspace{0.1cm}/\hspace{0.1cm} x_{i} \in C_j} \hspace{0.2cm} \delta(x_i , \overline{x}_{C_j})_{Euclidea}$$

Notese que: $\hspace{0.2cm} i \in I_j \hspace{0.2cm} \Leftrightarrow \hspace{0.2cm} x_{i} \in C_j$

<br>




**Observación: los predictores en k-medias deben ser cuantitativos**


¿Por qué?  $\hspace{0.15cm}\Rightarrow\hspace{0.15cm}$ Por como se definen los centroides, son medias de variables, y la media solo deberia aplicarse a variables cuantitativas.


<br>

**Observación: ¿cQué medidas de distancias pueden usarse en k-medias ?**

En k-medias hay que calcular la distancia entre las observaciones de  predictores x_i y los centroides, que son un vector numerico, pero no un vector de observaciones de variables estadisticas.

Hay distancias que no se pueden aplicar en esta contexto, como por ejemplo: 

- La distancias de Pearson y Mahalanobis, puesto que solo esta definida para pares de vectores de observaciones de variables estadisticas,  luego no puede aplicarse a ellos las distancias de Pearson y Mahalanobis.

- Las distancias de Sokal y Jaccard, por ser distancias definidas para vectores numericos binarios (de ceros y unos), y al ser k-medias solo aplicable a variables cuantitativas, los vectores de observaciones no sera binarios ni tampoco los centroides, luego no puede aplicarse a ellos las distancias de Sokal y Jaccard.

- La distancia de coincidencias, por ser definida para vectores numericos multi-clase , y al ser k-medias solo aplicable a variables cuantitativas, los vectores de observaciones no serán multi-clase y los centroides tampoco, luego no puede aplicarse a ellos la distancia de coincidencias.

- La distancia de Gower y Gower-Mahalanobis, al ser distancias definida sobre pares de vectores de tipo mixto (componentes cuantitativas, pero tambien binarias y multi-clase), y como el k-medias solo esta definido para variables cuantitativas, los vectores de observaciones no serán de tipo mixto, y los centroides tampoco, luego no puede aplicarse a ellos la distancia de Gower, ni la de Gower-Mahalanobis, la cual además involucra a la distancia de Mahalanobis que no se puede aplicar con k-medias por lo ya comentado.


Ejemplos de distancias que si pueden aplicarse con k-medias:

- Distancia Euclidea.

- Distancia Minkowski.

- Distancia Canberra.

- Distancia coseno.









<br>

<br>

## k-medias en `Python` con algoritmo de creación propia  <a class="anchor" id="2"></a>




Cargamos los datos con los que vamos a trabajar:

```python
import pandas as pd
```


```python
Data = pd.read_csv('House_Price_Regression.csv')

Data = Data.loc[:, ['latitude', 'longitude', 'price', 'size_in_m_2']]

Data.head()
```
```
    latitude  longitude    price  size_in_m_2
0  25.113208  55.138932  2700000   100.242337
1  25.106809  55.151201  2850000   146.972546
2  25.063302  55.137728  1150000   181.253753
3  25.227295  55.341761  2850000   187.664060
4  25.114275  55.139764  1729200    47.101821
```


```python



```



```python
lista_clusters = k_means(k=4 , Data=Data, random_seed=123) # Tarda solo 18.8 segundos 
```


```python
lista_clusters[0]
```

       latitude  longitude       price  size_in_m_2
1004  25.087251  55.145574   2990000.0   162.208638
43    25.091487  55.172015   1150000.0   105.259099
1214  25.078367  55.140410   1650000.0   166.575079
351   25.111108  55.137591   1699000.0   124.304214
182   25.064767  55.138814    875000.0   123.282281
...         ...        ...         ...          ...
1871  25.099380  55.141275   1352888.0    69.212735
1877  25.072573  55.131009   1499000.0   175.029252
1879  25.203553  55.345554    890000.0    70.606280
1883  25.072569  55.126527   1970000.0    81.940446
1885  25.103972  55.149621  31440000.0   607.771426

[517 rows x 4 columns]





```python
lista_clusters[1]
```
       latitude  longitude      price  size_in_m_2
1041  25.026191  55.156948   350000.0    35.117334
1282  25.198796  55.271342  2500000.0   168.804751
1476  25.081955  55.138863   690000.0    66.332742
1251  25.077150  55.135515  1550000.0   127.648722
1091  25.206412  55.275199  3950000.0   243.498763
...         ...        ...        ...          ...
1868  25.207533  55.277978  2300000.0   170.569908
1889  25.106668  55.149275  1400000.0   108.975219
1890  25.072954  55.128089  3800000.0   167.875721
1897  25.153080  55.254242   360000.0    55.741800
1901  25.166145  55.276684  1230000.0    70.606280

[378 rows x 4 columns]


```python
lista_clusters[2]
```

       latitude  longitude      price  size_in_m_2
539   25.068729  55.139815   820000.0    59.457920
730   25.093469  55.173061  1220000.0   119.008743
1472  25.064191  55.216245   380000.0    63.081137
849   25.180869  55.271015   700000.0    66.239839
631   25.048095  55.206373   600205.0    74.786915
...         ...        ...        ...          ...
1573  25.078870  55.148529  1400000.0   157.006070
1857  25.078148  55.148277   400888.0    37.439909
1861  25.090987  55.385389   590000.0   101.635882
1864  25.081241  55.137946  2400000.0   171.127326
1865  25.209806  55.278974   795000.0    71.442407

[499 rows x 4 columns]

```python
lista_clusters[3]
```

       latitude  longitude      price  size_in_m_2
393   25.104115  55.148470  3150000.0   152.825435
397   24.999981  55.293818   930888.0    86.399790
404   25.233787  55.294217  1642777.0    92.717194
407   25.233787  55.294217  1550000.0    91.973970
415   25.076944  55.134135  2950000.0   139.633209
...         ...        ...        ...          ...
1891  25.226946  55.343628  7000000.0   377.929404
1893  25.073590  55.126352  2000000.0    79.617871
1894  25.191107  55.269910   980888.0   101.078464
1898  25.104330  55.148769  2700000.0    99.963628
1899  25.037477  55.221942   550000.0    78.688841

[511 rows x 4 columns]


```python
lista_clusters[0].mean()
```
latitude       2.511612e+01
longitude      5.521077e+01
price          2.051995e+06
size_in_m_2    1.297637e+02
dtype: float64

```python
lista_clusters[1].mean()
```


```python
lista_clusters[2].mean()
```


```python
lista_clusters[3].mean()
```


## k-medias en `Python` con `PyClustering`



<br>

<br>

# k-medoids



Es un modelo o algoritmo de clasificación no supervisada, en el sentido de que permite resolver problemas de clasificación no supervisada.

A continuacion vamos a explicar su mécanica, partiendo de los elementos descritos en la sección anterior.

<br>

**Descripción no formal del algoritmo**






<br>





**Descripción formal del algoritmo**


$1)\hspace{0.1cm}$ Se considera que la variable respuesta $\hspace{0.1cm}\mathcal{Y}\hspace{0.1cm}$ tiene $\hspace{0.1cm} k\hspace{0.1cm}$ categorias $\hspace{0.1cm}g_1,...,g_k$ $\\[0.6cm]$


$2)\hspace{0.1cm}$  Se asignan aleatoriamente las observaciones disponibles $\hspace{0.1cm}x_1,...,x_n\hspace{0.1cm}$ de los predictores a dichas categorias, formandose clusters (o grupos) de observaciones $\hspace{0.1cm} C_1,...,C_k\hspace{0.1cm}$ , de un tamaño similar : $\\[0.4cm]$

$$C_j = ( x_{i}^{t} \hspace{0.1cm}/\hspace{0.1cm} i \in I_j \subset \lbrace 1,...,n \rbrace )^t \\$$

Donde $\hspace{0.1cm}I_j\hspace{0.1cm}$ es el conjunto de indices de las observaciones de los predictores que pertenecen al cluster $\hspace{0.1cm}C_j$. $\hspace{0.08cm}$ Por lo que puede verse como el conjunto de los individuos de la muestra asociados al cluster $\hspace{0.1cm} C_j$

Notese que $\hspace{0.1cm}I_j\hspace{0.1cm}$ es definido aleatoriamente en esta primera etapa.  

También hay que notar que $\hspace{0.1cm}C_j\hspace{0.1cm}$ es un vector cuyas componentes son vectores fila, luego es una matriz. Como además estos vectores fila son observaciones de variables estadisticas, puede verse como una matriz de datos. $\\[0.8cm]$


$3)\hspace{0.1cm}$  Se calculan los **medoids** de los clusters formados en el paso anterior (lo que en k-medias eran los centroides).


Sea $\hspace{0.1cm}\delta\hspace{0.1cm}$ una medida de distancia;

El **medoid** de un cluster $\hspace{0.1cm} C_j\hspace{0.1cm}$  es $\hspace{0.12cm}\overline{x}_{C_j} = x_{i\hspace{0.07cm}^*}\hspace{0.1cm}$   $\\[0.5cm]$


Donde:

$$i\hspace{0.08cm}^* \hspace{0.1cm}=\hspace{0.1cm}  arg \hspace{0.15cm} \underset{i \in I_j}{Min} \hspace{0.15cm} \sum_{r \in I_j} \hspace{0.1cm} \delta(x_i , x_r) \\$$

Y es importante recordar que:

$$i \in I_j \hspace{0.2cm} \Leftrightarrow \hspace{0.2cm} x_{i} \in C_j \\$$



$4)\hspace{0.1cm}$  Aplicado a la observación $\hspace{0.1cm}x_1$

Se asigna $\hspace{0.1cm}x_1 \hspace{0.1cm}$ al cluster que le queda mas cercano teniendo en cuenta su medoid.

Se calculan las distancia entre la observacion $\hspace{0.1cm} x_1\hspace{0.1cm}$ y los **medoids** de cada cluster:

$$\delta(x_1, \overline{x}_{C_1}) \hspace{0.1cm},\hspace{0.1cm} \delta(x_1, \overline{x}_{C_2}) \hspace{0.1cm},...,\hspace{0.1cm} \delta(x_1, \overline{x}_{C_k})$$

Se asigna $\hspace{0.1cm}x_1\hspace{0.1cm}$ al cluster que minimiza estas distancias. Es decir, al cluster del que está mas cerca.



Por tanto, el algoritmo asigna $\hspace{0.1cm}x_1\hspace{0.1cm}$ al cluster $\hspace{0.1cm}C_{j\hspace{0.07cm}^*}\hspace{0.1cm}$ tal que: $\\[0.5cm]$

$$j\hspace{0.1cm}^{*} \hspace{0.1cm}=\hspace{0.1cm} arg \hspace{0.15cm} \underset{j=1,...,k}{Min} \hspace{0.15cm} \delta(x_1 , \overline{x}_{C_j}) \\$$

 



$5)\hspace{0.1cm}$  Aplicado a la observación $\hspace{0.1cm} x_1$



- Si en la configuración aleatoria inicial de los clusterings $\hspace{0.1cm} x_1 \in C_{j\hspace{0.08cm}^*}\hspace{0.1cm}$  $\Rightarrow \hspace{0.2cm}$ Aplicar 4) y 5) para la siguiente observación $(x_2) \\$

 
- Si en la configuracion aleatoria inicial de los clusterings $\hspace{0.1cm}x_1 \notin C_{j\hspace{0.08cm}^*}\hspace{0.1cm}$ $\Rightarrow \hspace{0.2cm}$ Se modifica la configuración de los cluesterings del siguiente modo:

    -  $C_{j\hspace{0.08cm}^*}\hspace{0.1cm}$ ahora contiene a $x_1$

    - El cluster que contenía a $\hspace{0.1cm}x_1\hspace{0.1cm}$ ahora ya no lo contiene

       - Después se recalculan los centroides de los clusters para la nueva configuracion de clusters.

       - Posteriormente se aplica 4) y 5) de nuevo a la observacion $\hspace{0.1cm}x_1\hspace{0.1cm} \\$


$6)\hspace{0.1cm}$  Cuando el paso 4) y 5) se hayan aplicado a todas las observaciones $\hspace{0.1cm}x_1,...,x_n\hspace{0.1cm}$, se detiene el algoritmo, obteniendose la configuración definitiva de clusters, y con ello las predicciones de la respuesta.

Para las observaciones $\hspace{0.1cm} x_i \in C_j\hspace{0.1cm}$ se predice la respuesta como $\hspace{0.1cm}\hat{y}_i = g_j\hspace{0.1cm}$

Una tarea posterior es la interpretar la categoria $\hspace{0.1cm}g_j\hspace{0.1cm}$ , puesto que desconocemos a que hace referencia al no tener esa info sobre la respuesta



 

<br>




**Observación: los predictores en k-medoids pueden ser tanto cuantitativos como caategoricos**


¿Por qué?  $\hspace{0.15cm}\Rightarrow\hspace{0.15cm}$ Por como se definen los medoids, si se usa una medida de distancia adecuada para conjuntos de predictores de tipo mixto, el k-medoids puede aplicarse a ese tipo de variables y la media solo deberia aplicarse a predictores que sean tanto cuantitativos como categoricos.


<br>

<br>


## k-medoids en `Python` con algoritmo de creación propia





<br>

## k-medoids en `Python` con  `kmedoids`





