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


<br>


Se puede demostrar que este algoritmo hace disminuir con cada nueva configuración de clusters la suma de varizas intra-cluster definida en báse a la distancia Euclidea:

Es decir, para cada nueva configuración de clusters se reduce la siguiente cantidad: $\\[0.5cm]$


$$\sum_{j=1}^{k} \hspace{0.2cm} \sum_{i \in I_j } \hspace{0.2cm} \delta(x_i , \overline{x}_{C_j})_{Euclidea}$$



Notese que: $\hspace{0.2cm} i \in I_j \hspace{0.2cm} \Leftrightarrow \hspace{0.2cm} x_{i} \in C_j$
 



<br>




**Observación: los predictores en k-medias deben ser cuantitativos**


¿Por qué?  $\hspace{0.15cm}\Rightarrow\hspace{0.15cm}$ Por como se definen los centroides, son medias de variables, y la media solo deberia aplicarse a variables cuantitativas.


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

 $\hspace{2cm} \centerdot C_{j\hspace{0.08cm}^*}\hspace{0.1cm}$ ahora contiene a $x_1$

 $\hspace{2cm}$ El cluster que contenía a $\hspace{0.1cm}x_1\hspace{0.1cm}$ ahora ya no lo contiene

Se recalculan los centroides de los clusters para la nueva configuracion de clusters.

Se aplica 4) y 5) de nuevo a la observacion $\hspace{0.1cm}x_1\hspace{0.1cm}$

$\\[0.8cm]$

$6)\hspace{0.1cm}$  Cuando el paso 4) y 5) se hayan aplicado a todas las observaciones $\hspace{0.1cm}x_1,...,x_n\hspace{0.1cm}$, se detiene el algoritmo, obteniendose la configuración definitiva de clusters, y con ello las predicciones de la respuesta.

Para las observaciones $\hspace{0.1cm} x_i \in C_j\hspace{0.1cm}$ se predice la respuesta como $\hspace{0.1cm}\hat{y}_i = g_j\hspace{0.1cm}$

Una tarea posterior es la interpretar la categoria $\hspace{0.1cm}g_j\hspace{0.1cm}$ , puesto que desconocemos a que hace referencia al no tener esa info sobre la respuesta


<br>


Se puede demostrar que este algoritmo hace disminuir con cada nueva configuración de clusters la suma de varizas intra-cluster definida en báse a la distancia Euclidea:

Es decir, para cada nueva configuración de clusters se reduce la siguiente cantidad: $\\[0.5cm]$


$$\sum_{j=1}^{k} \hspace{0.2cm} \sum_{i \hspace{0.1cm}/\hspace{0.1cm} x_{i} \in C_j} \hspace{0.2cm} \delta(x_i , \overline{x}_{C_j})_{Euclidea}$$




 



<br>




**Observación: los predictores en k-medias deben ser cuantitativos**


¿Por qué?  $\hspace{0.15cm}\Rightarrow\hspace{0.15cm}$ Por como se definen los centroides, son medias de variables, y la media solo deberia aplicarse a variables cuantitativas.


<br>

<br>






