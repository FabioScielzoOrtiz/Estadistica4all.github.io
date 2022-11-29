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
 



> More articles in my blog:   $\hspace{0.1cm}$   [Estadistica4all](https://fabioscielzoortiz.github.io/Estadistica4all.github.io/)

<br>

El concepto de distancia entre observaciones de variables estadisticas tiene un papel relevante en muchas tecnicas y modelos estadistico tales como KNN, PCA, MDS, Clustering , Regresión  y Clasificacion (supervisada). Es por ello de especial relevancia para todo cientifico de datos saber que son las distancias estadisticas, que tipos hay y como implementarlas.



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




### Distancia Euclidea en `Python` <a class="anchor" id="14"></a>


















