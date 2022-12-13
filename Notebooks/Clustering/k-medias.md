---
title: 'k-medias'
author: 'Fabio Scielzo Ortiz'
date: '16/12/22'
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

 

<div class="warning" style='background-color:#FCF2EC; color: #000000; border-left: solid #FE9554 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:10em;'>


$\hspace{0.3cm}$ **Más artículos:    $\hspace{0.1cm}$ [Estadistica4all](https://fabioscielzoortiz.github.io/Estadistica4all.github.io/)**

$\hspace{0.3cm}$ **Autor:** $\hspace{0.1cm}$ [Fabio Scielzo Ortiz](http://estadistica4all.com/autores/autores.html)

</p>
 
</p></span>
</div>


***Se recomienda abrir el artículo en un ordenador o en una tablet.***
 
 
<br>



 
# Problema de clasificación no supervisada


Un problema de clasificación supervisada  es un problema estadistico que consiste en predecir una variable respuesta **categorica** usando para ello informacion exclusivamente de unas variables predictoras, puesto que no se tienen datos sobre la respuesta (esta es la diferencia entre la clasificación no supervisada y la supervisada). 

A los prblemas de clasificación no supervisada tambien se les conoce como problemas de **clustering**.$\\[1cm]$



- Tenemos $\hspace{0.1cm}p\hspace{0.1cm}$ predictores  $\hspace{0.1cm}(\mathcal{X}_1 ,...,\mathcal{X}_p)\hspace{0.1cm}$ y una variable respuesta **categorica** $\hspace{0.1cm}\mathcal{Y}\hspace{0.1cm}$ sobre la que **no disponemos ninguna muestra de datos**.


- Tenemos una muestra de tamaño $\hspace{0.1cm}n\hspace{0.1cm}$ de los $\hspace{0.1cm}p\hspace{0.1cm}$ predictores $\hspace{0.1cm}X_1,...,X_p\hspace{0.1cm}$  pero no tenemos muestra de la respuesta (elemento diferencial de la clasificación no supervisada), tampoco conocemos su recorrido, es decir, las categorias que la definen.

Por tanto tenemos la siguiente matriz de datos: $\\[0.8cm]$

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


<br>


<br>


# k-medias


Es un modelo o algoritmo de clasificación no supervisada, en el sentido de que permite resolver problemas de clasificación no supervisada.

 


A continuación se va a realizar una descripción formal del algoritmo k-medias. Pero hay que hacer notar que existen multiples versiones del algoritmo k-medias. Nosotros vamos a inspirarnos en la que proponen Park y Jun en el articulo citado en la bibliografía. Esa propuesta será modificada de un modo tal que consideraderos en lugar de medoids, cenntroides. Ya que el uso de medoids en lugar de centroides da lugar a otro algoritmo de clustering conocido con k-medoids que será estudiado en otro artículo.

Por otro lado, vamos a considerar dos versiones del k-medias, que se van a diferencia en el método que se emplea para definir los clusters iniciales. Una versión seguirá el método propuesto por Park y Jun, y la otra usará un método alternativo.


<br>




<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

***$\text{k-medias: primera versión}$***


- Se considera que la variable respuesta $\hspace{0.1cm}\mathcal{Y}\hspace{0.1cm}$ tiene $\hspace{0.1cm} k\hspace{0.1cm}$ categorias $\hspace{0.1cm}g_1,...,g_k$ $\\[0.4cm]$


$\hspace{0.25cm}$ **Definición de los clusters iniciales**

- Se asignan aleatoriamente las observaciones disponibles $\hspace{0.1cm}x_1,...,x_n\hspace{0.1cm}$ de los $p$ predictores a dichas categorias, formandose los **clusters** (o grupos) **iniciales** de observaciones $\hspace{0.1cm} C_1,...,C_k\hspace{0.1cm}$

    - Tienen que ser tales que tengan un tamaño similar, contengan todas las obersaciones del conjunto de datos y no haya observaciones contenidas en dos clusters diferentes. $\\[0.4cm]$

    - Formalmente vamos a definir los clusters del siguiente modo:

     $$C_r = \left( \hspace{0.12cm} x_i^t = (x_{i1},...,x_{ip}) \hspace{0.13cm}/\hspace{0.13cm} i \in I_r \subset \lbrace 1,...,n \rbrace \hspace{0.12cm} \right)^t \\$$

    - Cumpliendose lo siguiente: $\\[0.5cm]$

       - $\# I_r \approx \# I_h \hspace{0.25cm} , \hspace{0.25cm}  \forall r\neq h \in \lbrace 1,...,n\rbrace \\$

       - $\overset{n}{\underset{r=1}{\cup}}  I_r = \lbrace 1,...,n\rbrace \\$

       - $I_r \cap I_h = \varnothing \hspace{0.25cm} , \hspace{0.25cm}  \forall r\neq h \in \lbrace 1,...,n\rbrace \\$

       - $I_r$ es definido **aleatoriamente** en esta primera etapa. $\\[0.6cm]$



       - $I_r\hspace{0.1cm}$ es el conjunto de indices de las observaciones de los predictores que pertenecen al cluster $\hspace{0.1cm}C_r$. $\hspace{0.08cm}$ Por lo que puede verse como el conjunto de los individuos de la muestra que están asociados al cluster $\hspace{0.1cm} C_r \\$


       -  $C_r\hspace{0.1cm}$ es un vector cuyas componentes son vectores fila, luego es una matriz. Como además estos vectores fila son observaciones de variables estadisticas, puede verse como una matriz de datos. $\\[0.8cm]$





-  Se calculan los **centroides** de los clusters iniciales.

    - El **centroide** de un cluster $\hspace{0.1cm} C_r\hspace{0.1cm}$  es definido en el algoritmo k-medias como la media de las observaciones del cluster. Si las observaciones son $\hspace{0.1cm}p$-dimensionales (como en este caso) el centroide será un vector de medias como centroide del cluster.


    - El **centroide** del cluster $\hspace{0.1cm}C_r\hspace{0.1cm}$ es $\hspace{0.2cm}\overline{x}_{C_r} = (\overline{X}_{1, C_r} ,...,\overline{X}_{p, C_r})$

     - Donde:

    $$X_{r , C_r } = (\hspace{0.1cm} x_{ir} \hspace{0.1cm}/\hspace{0.1cm} i\in I_r \hspace{0.1cm})$$

    $\hspace{1cm}$  es la muestra de observaciones de $\hspace{0.1cm}\mathcal{X}_r\hspace{0.1cm}$ que aparecen en el cluster $\hspace{0.1cm}C_r$ $\\[0.8cm]$











-  Aplicado a la observación $\hspace{0.1cm}x_1$

$\hspace{0.25cm}$ Se asigna $\hspace{0.1cm}x_1 \hspace{0.1cm}$ al cluster que le queda mas cercano teniendo en cuenta su centroide, usando para ello una medida de distancia $\hspace{0.1cm}\delta$

$\hspace{0.25cm}$ Se calculan las distancia entre la observacion $\hspace{0.1cm} x_1\hspace{0.1cm}$ y los centroides de cada cluster:

$$\delta(x_1, \overline{x}_{C_1}) \hspace{0.1cm},\hspace{0.1cm} \delta(x_1, \overline{x}_{C_2}) \hspace{0.1cm},...,\hspace{0.1cm} \delta(x_1, \overline{x}_{C_k})$$

$\hspace{0.25cm}$ Se asigna $\hspace{0.1cm}x_1\hspace{0.1cm}$ al cluster que minimiza estas distancias. Es decir, al cluster del que está mas cerca.



$\hspace{0.25cm}$ Por tanto, el algoritmo asigna $\hspace{0.1cm}x_1\hspace{0.1cm}$ al cluster $\hspace{0.1cm}C_{j^*}\hspace{0.1cm}$ tal que: $\\[0.5cm]$

$$j\hspace{0.1cm}^{*} \hspace{0.1cm}=\hspace{0.1cm} arg \hspace{0.15cm} \underset{j}{Min} \hspace{0.15cm} \delta(x_1 , \overline{x}_{C_j}) \\$$

 



- Aplicado a la observación $\hspace{0.1cm} x_1$



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


</p>
 
</p></span>
</div>

 

 
<br>

 <div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

$\hspace{0.25cm}$ **k-medias: segunda versión**

- Se considera que la variable respuesta $\hspace{0.1cm}\mathcal{Y}\hspace{0.1cm}$ tiene $\hspace{0.1cm} k\hspace{0.1cm}$ categorias $\hspace{0.1cm}g_1,...,g_k$ $\\[0.6cm]$


- Se asignan aleatoriamente las observaciones disponibles $\hspace{0.1cm}x_1,...,x_n\hspace{0.1cm}$ de los predictores a dichas categorias, formandose clusters (o grupos) de observaciones $\hspace{0.1cm} C_1,...,C_k\hspace{0.1cm}$ , de un tamaño similar : $\\[0.4cm]$

$$C_j = \left( \hspace{0.12cm} x_i^t = (x_{i1},...,x_{ip}) \hspace{0.13cm}/\hspace{0.13cm} i \in I_j \subset \lbrace 1,...,n \rbrace \hspace{0.12cm} \right)^t \\$$

Donde $\hspace{0.1cm}I_j\hspace{0.1cm}$ es el conjunto de indices de las observaciones de los predictores que pertenecen al cluster $\hspace{0.1cm}C_j$. $\hspace{0.08cm}$ Por lo que puede verse como el conjunto de los individuos de la muestra asociados al cluster $\hspace{0.1cm} C_j$

Notese que $\hspace{0.1cm}I_j\hspace{0.1cm}$ es definido aleatoriamente en esta primera etapa. 

También hay que notar que $\hspace{0.1cm}C_j\hspace{0.1cm}$ es un vector cuyas componentes son vectores fila, luego es una matriz. Como además estos vectores fila son observaciones de variables estadisticas, puede verse como una matriz de datos. $\\[0.8cm]$


-  Se calculan los **centroides** de los clusters formados en el paso anterior.

El **centroide** de un cluster $\hspace{0.1cm} C_j\hspace{0.1cm}$  es definido en el algoritmo k-medias como la media de las observaciones del cluster. Si las observaciones son $\hspace{0.1cm}p$-dimensionales (como en este caso) el centroide será un vector de medias como centroide del cluster.


El **centroide** del cluster $\hspace{0.1cm}C_j\hspace{0.1cm}$ es $\hspace{0.2cm}\overline{x}_{C_j} = (\overline{X}_{1, C_j} ,...,\overline{X}_{p, C_j})$

Donde:

$$X_{r , C_j } = (\hspace{0.1cm} x_{ir} \hspace{0.1cm}/\hspace{0.1cm} i\in I_j \hspace{0.1cm})$$

Es decir, es la muestra de observaciones de $\hspace{0.1cm}\mathcal{X}_r\hspace{0.1cm}$ que aparecen en el cluster $\hspace{0.1cm}C_j$ $\\[0.8cm]$


-  Aplicado a la observación $\hspace{0.1cm}x_1$

Se asigna $\hspace{0.1cm}x_1 \hspace{0.1cm}$ al cluster que le queda mas cercano teniendo en cuenta su centroide, usando para ello una medida de distancia $\hspace{0.1cm}\delta$

Se calculan las distancia entre la observacion $\hspace{0.1cm} x_1\hspace{0.1cm}$ y los centroides de cada cluster:

$$\delta(x_1, \overline{x}_{C_1}) \hspace{0.1cm},\hspace{0.1cm} \delta(x_1, \overline{x}_{C_2}) \hspace{0.1cm},...,\hspace{0.1cm} \delta(x_1, \overline{x}_{C_k})$$

Se asigna $\hspace{0.1cm}x_1\hspace{0.1cm}$ al cluster que minimiza estas distancias. Es decir, al cluster del que está mas cerca.



Por tanto, el algoritmo asigna $\hspace{0.1cm}x_1\hspace{0.1cm}$ al cluster $\hspace{0.1cm}C_{j^*}\hspace{0.1cm}$ tal que: $\\[0.5cm]$

$$j\hspace{0.1cm}^{*} \hspace{0.1cm}=\hspace{0.1cm} arg \hspace{0.15cm} \underset{j}{Min} \hspace{0.15cm} \delta(x_1 , \overline{x}_{C_j}) \\$$

 



- Aplicado a la observación $\hspace{0.1cm} x_1$



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


</p>
 
</p></span>
</div>

 
 <br>

----

<br>


***Observaciones:***

 

**Los predictores en k-medias deben ser cuantitativos**


¿Por qué?  $\hspace{0.15cm}\Rightarrow\hspace{0.15cm}$ Por como se definen los centroides, son medias de variables, y la media solo deberia aplicarse a variables cuantitativas.

<br>


**¿Qué medidas de distancias pueden usarse en k-medias ?**

En k-medias hay que calcular la distancia entre las observaciones de  predictores $x_i$ y los centroides, que son un vector numerico, pero no un vector de observaciones de variables estadisticas.

Hay distancias que no se pueden aplicar en esta contexto, como por ejemplo: 

- La distancias de Pearson y Mahalanobis, puesto que solo esta definida para pares de vectores de observaciones de variables estadisticas,  luego no puede aplicarse a ellos las distancias de Pearson y Mahalanobis.$\\[0.5cm]$

- Las distancias de Sokal y Jaccard, por ser distancias definidas para vectores numericos binarios (de ceros y unos), y al ser k-medias solo aplicable a variables cuantitativas, los vectores de observaciones no sera binarios ni tampoco los centroides, luego no puede aplicarse a ellos las distancias de Sokal y Jaccard. $\\[0.5cm]$

- La distancia de coincidencias, por ser definida para vectores numericos multi-clase , y al ser k-medias solo aplicable a variables cuantitativas, los vectores de observaciones no serán multi-clase y los centroides tampoco, luego no puede aplicarse a ellos la distancia de coincidencias. $\\[0.5cm]$

- La distancia de Gower y Gower-Mahalanobis, al ser distancias definida sobre pares de vectores de tipo mixto (componentes cuantitativas, pero tambien binarias y multi-clase), y como el k-medias solo esta definido para variables cuantitativas, los vectores de observaciones no serán de tipo mixto, y los centroides tampoco, luego no puede aplicarse a ellos la distancia de Gower, ni la de Gower-Mahalanobis, la cual además involucra a la distancia de Mahalanobis que no se puede aplicar con k-medias por lo ya comentado.  $\\[0.5cm]$



Ejemplos de distancias que si pueden aplicarse con k-medias, ya que estan definidas para pares de vectores numéricos (no necesariamente observaciones de variables estadisticas, son los siguientes:

- Distancia Euclidea.  $\\[0.4cm]$

- Distancia Minkowski.  $\\[0.4cm]$
 
- Distancia Canberra.  $\\[0.4cm]$

- Distancia coseno.









<br>

## Varianzas intra-cluster


<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

La varianza intra-cluster de un cluster cualquiera $C_j$ , definida en base a la distancia Euclidea, es: $\\[0.4cm]$

$$\sum_{i \in I_j} \hspace{0.2cm} \delta(x_i , \overline{x}_{C_j})_{Euclidea}\\ $$



Se puede demostrar que este algoritmo hace disminuir con cada nueva configuración de clusters la suma de varizas intra-clustera:

Es decir, para cada nueva configuración de clusters se reduce la siguiente cantidad: $\\[0.5cm]$


$$\sum_{j=1}^{k} \hspace{0.2cm} \sum_{i \in I_j} \hspace{0.2cm} \delta(x_i , \overline{x}_{C_j})_{Euclidea} \\$$

Donde: 

- $\hspace{0.2cm} i \in I_j \hspace{0.2cm} \Leftrightarrow \hspace{0.2cm} x_{i} \in C_j \\$

- $\hspace{0.2cm} \overline{x}_{C_j}$ es el centroide del cluster $C_j$


</p>
 
</p></span>
</div>


<br>

## Interpretación de los clusters en k-medias



<br>

## k-medias en `Python` con algoritmo de creación propia  <a class="anchor" id="2"></a>

 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
