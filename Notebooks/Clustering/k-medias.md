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

 


A continuación se va a realizar una descripción formal del algoritmo k-medias. Pero hay que hacer notar que existen multiples versiones del algoritmo k-medias. Nosotros vamos a inspirarnos en el algoritmo de clustering propuesto por Park y Jun en el articulo citado en la bibliografía. Esa propuesta es realmente una versión del algoritmo k-medoids, que nosotros modificaremos para adaptarla a k-medias. El algoritmo k-medoids será estudiado en otro artículo.

 

<br>




<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

 $\hspace{0.25cm}$ ***k-medias: adaptación de la versión de Park & Jun***    


----

- Se considera que la variable respuesta $\hspace{0.1cm}\mathcal{Y}\hspace{0.1cm}$ tiene $\hspace{0.1cm} k\hspace{0.1cm}$ categorias $\hspace{0.1cm}g_1,...,g_k$ $\\[0.4cm]$


----

$\hspace{0.25cm}$ **1) Definición de los clusters iniciales**

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


       -  $C_r\hspace{0.1cm}$ es un vector cuyas componentes son vectores fila, luego es una matriz. Como además estos vectores fila son observaciones de variables estadisticas, puede verse como una matriz de datos. 

----



$\hspace{0.25cm}$ **2) Cálculo de los centroides de los clusters**


-  Se calculan los **centroides** de los clusters.

    - El **centroide** de un cluster $\hspace{0.1cm} C_r\hspace{0.1cm}$  es definido en el algoritmo k-medias como la media de las observaciones del cluster. Si las observaciones son $\hspace{0.1cm}p$-dimensionales (como en este caso) el centroide será un vector de medias como centroide del cluster.


    - El **centroide** del cluster $\hspace{0.1cm}C_r\hspace{0.1cm}$ se define como $\hspace{0.2cm}\overline{x}_{C_r} = \left( \overline{X \hspace{0.1cm}}_{1, C_r} ,...,\overline{X\hspace{0.1cm}}_{p, C_r} \right)$

     - Donde:

    $$X_{j , C_r } = (\hspace{0.1cm} x_{ij} \hspace{0.1cm}/\hspace{0.1cm} i\in I_r \hspace{0.1cm})  \hspace{0.2cm} , \hspace{0.2cm} \forall j\in \lbrace 1,...,p \rbrace$$

    $\hspace{1cm}$  es la muestra de observaciones de la variable $\hspace{0.1cm}\mathcal{X}_j\hspace{0.1cm}$ que pertenecen al cluster $\hspace{0.1cm}C_r$ $\\[0.8cm]$
    
    $\hspace{1cm}$ Por tanto,  $\hspace{0.1cm}\overline{X \hspace{0.1cm}}_{j, C_r}\hspace{0.1cm}$ es la media de la muestra de observaciones de la variable $\hspace{0.1cm}\mathcal{X}_j\hspace{0.1cm}$ que pertenecen al cluster $\hspace{0.1cm}C_r$



----


$\hspace{0.25cm}$ **3) Cálculo de la suma de varianzas intra-cluster**


- Dada una medida de distancia $\hspace{0.1cm}\delta\hspace{0.1cm}$ defindida para cada par $\hspace{0.1cm}(x_i,x_r)\hspace{0.1cm}$ de observaciones de los predictores, la **suma de varianzas intra-cluster** para la configuración de clusters $\hspace{0.1cm}C_1,...,C_k\hspace{0.1cm}$ se define como sigue:


$$V(C_1,...,C_k) = \sum_{r=1}^{k} \hspace{0.2cm} \sum_{i \in I_r} \hspace{0.2cm} \delta(x_i , \overline{x}_{C_r}) \\$$



- Se calcula $\hspace{0.12cm}V(C_1,...,C_k)\hspace{0.12cm}$, puesto que será la métrica en base a la cual se define el criterio de parada.



    - Es una medida de lo similares que son entre si las observaciones contenidas en un mismo cluster. Cuanto menor sea, mas similares son, y viceversa.

----

$\hspace{0.25cm}$ **4) Re-asignación de las observaciones a los clusters**



- Se calcula $\hspace{0.12cm} \delta(x_i , \overline{x}_{C_r}) \hspace{0.12cm}$


- Se re-asigna $\hspace{0.12cm}x_i\hspace{0.12cm}$ al cluster que le quede más cerca.

- Formalmente, $\hspace{0.12cm}x_i\hspace{0.12cm}$ es re-asignado al cluster $\hspace{0.12cm}C_{r^*}$

    $$r^* \hspace{0.12cm}=\hspace{0.12cm} arg \hspace{0.12cm} \underset{r}{Min} \hspace{0.16cm} \delta(x_i , \overline{x}_{C_r} )$$

    - Por tanto, $\hspace{0.12cm}x_i\hspace{0.12cm}$ es re-asignado al cluster $\hspace{0.12cm}C_{r^*}\hspace{0.12cm}$, que podria ser el cluster al que ya estaba asignada, o no. 


- Tras  re-asignar todas las observaciones $\hspace{0.12cm}x_1,...,x_n\hspace{0.12cm}$ se obtiene una **nueva** configuracion de clusters $\hspace{0.12cm}C_1^{1 },...,C_k^{1 }\hspace{0.12cm}$ , que generalmente será diferente de la anterior, aunque no necesariamente.

- El super-indice 1 indica que esta nueva configuración de clusters es la obtenida con la iteración 1 del algoritmo.

- Se calcula la suma de varianzas intra-cluster para la nueva configuracion de clusters obtenida en el paso anterior:

$$V(C_1^{\dagger },...,C_k^{\dagger })$$

----


$\hspace{0.25cm}$ **5) Iterar paso 4)**


- Se itera el paso **4)** un número $\hspace{0.1cm}b\hspace{0.1cm}$ de veces, asi se obtienen $\hspace{0.1cm}b\hspace{0.1cm}$ configuraciones de clusters, y con ello $\hspace{0.1cm}b\hspace{0.1cm}$ valores de la suma de varianzas intra-cluster.


---

$\hspace{0.25cm}$ **6) Selección de la configuracion de clusters definitiva**


- Tras los pasos anteriores  se habrán obtenido un total de $\hspace{0.1cm}b+2\hspace{0.1cm}$ configuraciones de clusters $\hspace{0.1cm}\Rightarrow \hspace{0.1cm} b\hspace{0.1cm}$ en el paso **5)** , $1$ en el paso **1)** y $1$ en el paso **4)**.



$$\left\lbrace \hspace{0.15cm} V(C_1^{h},....,C_k^h) \hspace{0.12cm} / \hspace{0.12cm} h \in \lbrace 1,...,b+2\rbrace \hspace{0.15cm} \right\rbrace$$




- Se selecciona como configuración de clusters **definitiva** aquella que minimiza la suma de varianzas intra-cluster, de entre las $\hspace{0.1cm} b+2 \hspace{0.1cm}$ obtenidas.

-  Formalmente, se seleccionan la configuración de clusters $\hspace{0.1cm} C_1^{h^*},...,C_k^{h^*}$

     - Donde:
     
       $$h^*  \hspace{0.15cm}=\hspace{0.12cm} arg \hspace{0.12cm} \underset{h}{Min} \hspace{0.16cm} V(C_1^{h},....,C_k^h)$$ 
    
   
    
 

</p>
 
</p></span>
</div>

 


<br>


***Observaciones:***

 

- **Los predictores en k-medias deben ser cuantitativos**


    - ¿Por qué?  $\hspace{0.15cm}\Rightarrow\hspace{0.15cm}$ Por como se definen los centroides, son medias de variables, y la media solo deberia aplicarse a variables cuantitativas.

<br>


- **¿Qué medidas de distancias pueden usarse en k-medias ?**

    - Como k-medias solo debe usarse con variables cuantitativas, solo deben usarse distancias adecuadas para variables cuantitativas.  Por tanto, ejemplos de distancias que podrían usarse son la Euclidea, Minkowski, Canberra, Pearson y Mahalanobis.


<br>

## Interpretación de los clusters






<br>


## Validación de algoritmos de clustering

Uno de los métodos de validación de algoritmos de clustering más populares es el método silhouette.

Se tratará este tema en un articulo sobre métodos de validación de modelos de aprendizaje no supervisado (modelos de clustering).



<br>


## Ajuste del hiper-parametro k

Usando el método silhouette se puede realizar una selección óptima del hiper-parametro $k$

Se tratará este tema en un artículo sobre ajuste de hiper-parametros de modelos de aprendizaje no supervisado (modelos de clustering).


<br>



## k-medias en `Python` con algoritmo de creación propia  <a class="anchor" id="2"></a>

 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
