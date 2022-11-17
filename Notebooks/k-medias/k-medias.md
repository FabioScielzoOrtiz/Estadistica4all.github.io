---
title: 'k-medias clustering'
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

A continuacion vamos a explicar su mécanica, partiendo de los elementos descritos en la sección anterior.



**Descripción no formal del algoritmo**












**Descripción formal del algoritmo**


1) Se considerar $k$ categorias $g_1,...,g_k$


2) Se asignan aleatoriamente las observaciones disponibles $x_1,...,x_n$ de los predictores a dichas categorias, formandose clusters (o grupos) de observaciones $C_1,...,C_k$ , cada cluster esta asociado a una categoria.

$$C_j = ( x_i / i \in I_j \subset \lbrace 1,...,n \rbrace )$$

Donde $I_j$ es el conjunto de indices de las observaciones de los predictores que pertenecen al cluster $C_j$

Notese que $I_j$ es definido aleatoriamente en esta primera etapa.


3) Se calculan los centroides de los clusters formados en el paso anterior.

El centroide de un cluster $C_j$  es la media de las observaciones del cluster. Si las observaciones son $p$-dimensionales (como en este caso) se usa el vector de medias como centroide del cluster.


El centroide del cluster $C_j$ es $\overline{x}_{C_j} = (\overline{X}_{1, C_j} ,...,\overline{X}_{p, C_j})$

Donde:

$$X_{r , C_j } = (x_{ir} / i=1,...,n y x_{ir} \in C_j)$$

Es decir, es la muestra de observaciones de $\mathcal{X}_r$ que pertenecen al cluster $C_j$


4) Aplicado a la observación $x_1$

Se asigna x_1 al cluster que le queda mas cercano, usando para ello una medida de distancia $\delta$

Se calculan las distancia entre la observacion x_i y los centroides de cada cluster:

$$\delta(x_1, \overline{x}_{C_1}), \delta(x_1, \overline{x}_{C_2}),...,\delta(x_1, \overline{x}_{C_k})$$

Se asigna $x_1$ al cluster que minimiza estas distancias. Es decir, al cluster del que está mas cerca.



Por tanto, el algoritmo asigna $x_1$ al cluster $C_{j^*}$ tal que:

$$j^{*} = arg \underset{j}{Min} \delta(x_1 , \overline{x}_{C_j})$$





5) Aplicado a la observación $x_1$



- Si en la configuración aleatoria inicial de los clusterings $x_1 \in C_{j^*}$  , entonces :

Aplicar 4) y 5) para la siguiente observación $(x_2)$

 
- Si en la configuracion aleatoria inicial de los clusterings $x_1 \notin C_{j^*}$ , entonces:

Se modifica la configuración de los cluesterings del siguiente modo:

 - - $C_{j^*}$ ahora contiene a $x_1$

 - - El cluster que contenia a $x_1$ ahora ya no lo contiene

Se recalculan los centroides de los clusters para la nueva configuracion de clusters.

Se aplica 4) y 5) de nuevo a la observacion $x_1$



6) Cuando el paso 4) y 5) se hayan aplicado a todas las observaciones $x_1,...,x_n$, se detiene el algoritmo, obteniendose la configuración definitiva de clusters,, y con ello las predicciones de la respuesta (para las obse x_i \in C_j se predice la respuesta como \hat{y}_i = g_j  Una tarea posterior es la interpretar la categoria g_j , puesto que desconocemos a que hace referencia al no tener esa info sobre la respuesta


<br>


Se puede demostrar que este algoritmo hace disminuir con cada nueva configuración de clusters la suma de varizas intra-cluster, definida como sigue:













**Observacion: los predictores en k-medias deben ser cuantitativos**


¿Por que?  --> por como se definen los centroides, son medias, y la media solo deberia aplicarse a variables cuantitativas.









