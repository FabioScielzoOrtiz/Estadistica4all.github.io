---
title: 'Introducción a los intervalos de confianza'
author: 'Fabio Scielzo Ortiz'
date: '12/12/22'
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




<div class="warning" style='background-color:#FCF2EC; color: #000000; border-left: solid #FE9554 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:10em;'>


$\hspace{0.3cm}$ **Más artículos:    $\hspace{0.1cm}$ [Estadistica4all](https://fabioscielzoortiz.github.io/Estadistica4all.github.io/)**

$\hspace{0.3cm}$ **Autor:** $\hspace{0.1cm}$ [Fabio Scielzo Ortiz](http://estadistica4all.com/autores/autores.html)

$\hspace{0.3cm}$ **Si utilizas este artículo, cítalo !!**

$\hspace{0.5cm}$ Scielzo Ortiz, F. (2022). Introducción a los intervalos de confianza.  http://estadistica4all.com/Articulos/Intervalos-de-confianza.html


</p>
 
</p></span>
</div>


***Se recomienda abrir el artículo en un ordenador o en una tablet.***
 
 
 
 
 <br>
 
 ----
 
*Para entender plenamente este artículo se recomienda haber tomado un curso sobre introducción a la probabilidad, o algo equivalente. De todos modos está en marcha un artículo dedicado a teoría de la probabilidad que será recomendable leer previamente a este artículo.*

*En cualquier caso, el artículo pude ser de utilidad, en mayor o menor grado, para cualquier persona que haya tomado un curso de estadística básica, no necesariamente de probabilidad.*
 
 ---
 
 <br>
 
# Variables aleatorias i.i.d.


<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>

$\hspace{0.25cm}\mathcal{X}_1,...,\mathcal{X}_n\hspace{0.1cm}$ son variables aleatorias mutuamente independientes e identicamente distribuidas  *(i.i.d.)* $\hspace{0.3cm}\Leftrightarrow$

- $\hspace{0.1cm}$ $\mathcal{X}_1,...,\mathcal{X}_n\hspace{0.08cm}$ son mutuamente independientes , es decir:

$$\hspace{0.08cm} P(\mathcal{X}_1=x_1,...,\mathcal{X}_n=x_n) \hspace{0.1cm}=\hspace{0.1cm} \prod_{i=1}^n P(\mathcal{X}_i=x_i) \\$$

$\hspace{0.7cm}$ Lo que implica que también son independientes dos a dos , es decir, $\hspace{0.12cm} \mathcal{X}_i \perp \mathcal{X}_j \hspace{0.12cm} , \hspace{0.12cm} \forall i\neq j \\$

- $\hspace{0.1cm}$ $\mathcal{X}_1,...,\mathcal{X}_n\hspace{0.12cm}$ tienen la misma distribución de probabilidad, es decir, $\hspace{0.12cm}\mathcal{X}_i \sim F( \cdot ) \hspace{0.15cm}, \hspace{0.1cm} \forall i=1,...,n$ 



</p>
 
</p></span>
</div>

$\hspace{0.4cm}$ Donde $\hspace{0.08cm}F( \cdot )\hspace{0.08cm}$ es una distribucion de probabilidad con parametros no especificados.




<br>


Usaremos la siguiente notación: $\\[0.6cm]$


$$(\mathcal{X}_1,...,\mathcal{X}_n) \underset{i.i.d.}{\sim} F(\cdot) \hspace{0.3cm} \Leftrightarrow
\left\lbrace\begin{array}{l}   \hspace{0.12cm}\mathcal{X}_1,...,\mathcal{X}_n \hspace{0.2cm} \text{son mutuamente independientes} \\[0.1cm] 
\hspace{0.12cm}\mathcal{X}_i \sim F(\cdot) \hspace{0.12cm} , \hspace{0.12cm} \forall i=1,...,n    \end{array}\right. \\[1cm]$$



<br>

# Muestra Aleatoria Simple

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>

$\hspace{0.25cm}$ Sea $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ una v.a. tal que $\hspace{0.1cm}\mathcal{X} \sim F(\cdot)$ 


$\hspace{0.25cm}$ $\mathcal{X}_1,...,\mathcal{X}_n \hspace{0.1cm}$ es una muestra aleatoria simple (m.a.s.) de tamaño $\hspace{0.08cm}n\hspace{0.08cm}$ de $\hspace{0.1cm}\mathcal{X}$ $\hspace{0.2cm}\Leftrightarrow\hspace{0.2cm}$ $(\mathcal{X}_1,...,\mathcal{X}_n) \underset{i.i.d.}{\sim} F(\cdot) \\$

</p>
 
</p></span>
</div>

**Observación:**

Una m.a.s. de una v.a. $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ es un vector de v.a.'s mutuamente independientes y que se distribuyen probabilisticamente igual que la v.a. $\hspace{0.1cm}\mathcal{X}$


<br>

# Muestra de Observaciones


<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>

$\hspace{0.25cm}$  Sea $\hspace{0.12cm}\mathcal{X}\hspace{0.12cm}$ una v.a. tal que $\hspace{0.12cm}\mathcal{X} \sim F(\cdot)$ 


$\hspace{0.25cm}$ $X=(x_1,...,x_n)\hspace{0.12cm}$ es una muestra de $\hspace{0.08cm}n\hspace{0.08cm}$ observaciones de la v.a. $\hspace{0.12cm}\mathcal{X}$ $\hspace{0.2cm}\Leftrightarrow\hspace{0.2cm}$ $x_i \in Im(\mathcal{X}) \hspace{0.12cm} ,\hspace{0.12cm} \forall i\in \lbrace 1,...,n \rbrace$ $\hspace{0.2cm}\Leftrightarrow\hspace{0.2cm}$ $x_i$ es una realización de la v.a. $\hspace{0.12cm}\mathcal{X}$  , $\hspace{0.12cm}\forall i\in \lbrace 1,...,n \rbrace \\$


</p>
 
</p></span>
</div>

Donde:

$Im(\mathcal{X})\hspace{0.1cm}$ es la imagen de $\hspace{0.1cm}\mathcal{X}$$\hspace{0.1cm}$  , es decir, su campo de variación.

<br>

**Observaciones:**

- Una muestra de observaciones de una v.a. es un vector de números, no son v.a.'s. $\\[0.6cm]$

- Si $\hspace{0.08cm} X=(x_1,...,x_n)\hspace{0.08cm}$ es una muestra de $\hspace{0.08cm}n\hspace{0.08cm}$ observaciones de $\hspace{0.08cm}\mathcal{X}\sim F(\cdot)$ , entonces $\hspace{0.08cm}x_i\hspace{0.08cm}$ es una observacion que ha sido generada por la distribución de probabilidad $\hspace{0.08cm}F(\cdot)\hspace{0.08cm}$, es decir, $\hspace{0.08cm}x_i\hspace{0.08cm}$ puede verse como un numero aleatorio generado en base a la distribución de probabilidad $\hspace{0.08cm} F(\cdot)$ $\\[0.6cm]$

- Si $\hspace{0.08cm}X=(x_1,...,x_n)\hspace{0.08cm}$ es una muestra de $\hspace{0.08cm}n\hspace{0.08cm}$ observaciones de $\mathcal{X}\sim F(\cdot)$ , entonces:


    - $P(\mathcal{X}= x_i)$ es la probabilidad de  observar $x_i$ al extraer una muestra de observaciones de $\mathcal{X}$ $\\[0.6cm]$


- Si $\hspace{0.08cm}(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.08cm}$ es una muestra aleatoria simple (m.a.s.) de tamaño $\hspace{0.08cm}n\hspace{0.08cm}$ de $\hspace{0.08cm}\mathcal{X}\sim F(\cdot)\hspace{0.08cm}$ , entonces:

    -  $P(\mathcal{X}_1 = x_1 , ..., \mathcal{X}_n=x_n)\hspace{0.08cm}$ es la probabilidad de obtener como valores $\hspace{0.08cm}(x_1,...,x_n)\hspace{0.08cm}$ al extraer una muestra de observaciones de $\hspace{0.08cm}\mathcal{X}$


<br>


# Estadístico


<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>
$\hspace{0.25cm}$ $T\hspace{0.1cm}$ es un estadístico de una m.a.s $\hspace{0.1cm}(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ de la v.a. $\hspace{0.1cm}\mathcal{X}\sim F(\theta)$ $\hspace{0.25cm}\Leftrightarrow\hspace{0.25cm}$ $T\hspace{0.1cm}$ es una función de la m.a.s que no depende  del parámetro $\hspace{0.1cm}\theta$




</p>
 
</p></span>
</div>

Por tanto:

- $T(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ es un estadístico.  


<br>

**Observaciones:**

- $\hspace{0.12cm}T(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ es una v.a. al ser una función de v.a.'s $\\[0.8cm]$

- Dada una muestra de observaciones $\hspace{0.1cm}(x_1 ,..., x_n)\hspace{0.1cm}$ de  la v.a. $\hspace{0.1cm}\mathcal{X} \sim D(\theta)$ 

$\hspace{0.6cm} T(x_1,...,x_n)\hspace{0.1cm}$ es una observación de la v.a. $\hspace{0.1cm}T(\mathcal{X}_1,...,\mathcal{X}_n) \\$


- Dadas $\hspace{0.1cm}B\hspace{0.1cm}$ muestras de observaciones $\hspace{0.1cm}(x_1^1 , ..., x_n^1)\hspace{0.1cm} ,...,\hspace{0.1cm}(x_1^B,...,x_n^B)\hspace{0.2cm}$ de la v.a. $\hspace{0.1cm}\mathcal{X} \sim D(\theta)$ 

     - $\hspace{0.1cm}T(x_1^1 , ..., x_n^1) \hspace{0.1cm},...,\hspace{0.1cm} T(x_1^B,...,x_n^B)\hspace{0.2cm}$ es una muestra de observaciones de la v.a. $\hspace{0.1cm}T(\mathcal{X}_1,...,\mathcal{X}_n)$


<br>

## Ejemplos de estadisticos


Sea $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ una v.a. tal que $\hspace{0.1cm}\mathcal{X} \sim D(\theta)\hspace{0.1cm}$ , y sea $\hspace{0.1cm}(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ una m.a.s. de $\hspace{0.1cm} \mathcal{X} \\$


- **Media muestral**

$$T(\mathcal{X}_1,...,\mathcal{X}_n) = \overline{\mathcal{X}} = \dfrac{1}{n} \sum_{i=1}^n \mathcal{X}_i \\[1cm]$$


- **Varianza muestral**

$$T(\mathcal{X}_1,...,\mathcal{X}_n) = S^2 = \dfrac{1}{n} \sum_{i=1}^n (\mathcal{X}_i - \overline{\mathcal{X}})^2 \\[1cm]$$


- **Cuasi-Varianza muestral**

$$T(\mathcal{X}_1,...,\mathcal{X}_n) = S^2 = \dfrac{1}{n-1} \sum_{i=1}^n (\mathcal{X}_i - \overline{X})^2 \\$$



# Variables aleatorias i.i.d.


<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>

$\hspace{0.25cm}\mathcal{X}_1,...,\mathcal{X}_n\hspace{0.1cm}$ son variables aleatorias mutuamente independientes e identicamente distribuidas  *(i.i.d.)* $\hspace{0.3cm}\Leftrightarrow$

- $\hspace{0.1cm}$ $\mathcal{X}_1,...,\mathcal{X}_n\hspace{0.08cm}$ son mutuamente independientes , es decir:

$$\hspace{0.08cm} P(\mathcal{X}_1=x_1,...,\mathcal{X}_n=x_n) \hspace{0.1cm}=\hspace{0.1cm} \prod_{i=1}^n P(\mathcal{X}_i=x_i) \\$$

$\hspace{0.7cm}$ Lo que implica que también son independientes dos a dos , es decir, $\hspace{0.12cm} \mathcal{X}_i \perp \mathcal{X}_j \hspace{0.12cm} , \hspace{0.12cm} \forall i\neq j \\$

- $\hspace{0.1cm}$ $\mathcal{X}_1,...,\mathcal{X}_n\hspace{0.12cm}$ tienen la misma distribución de probabilidad, es decir, $\hspace{0.12cm}\mathcal{X}_i \sim F( \cdot ) \hspace{0.15cm}, \hspace{0.1cm} \forall i=1,...,n$ 



</p>
 
</p></span>
</div>

$\hspace{0.4cm}$ Donde $\hspace{0.08cm}F( \cdot )\hspace{0.08cm}$ es una distribucion de probabilidad con parametros no especificados. $\\[0.5cm]$




Usaremos la siguiente notación: $\\[0.4cm]$


$$(\mathcal{X}_1,...,\mathcal{X}_n) \underset{i.i.d.}{\sim} F(\cdot) \hspace{0.3cm} \Leftrightarrow
\left\lbrace\begin{array}{l}   \hspace{0.12cm}\mathcal{X}_1,...,\mathcal{X}_n \hspace{0.2cm} \text{son mutuamente independientes} \\[0.1cm] 
\hspace{0.12cm}\mathcal{X}_i \sim F(\cdot) \hspace{0.12cm} , \hspace{0.12cm} \forall i=1,...,n    \end{array}\right. \\[1cm]$$



<br>

# Muestra Aleatoria Simple

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>

$\hspace{0.25cm}$ Sea $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ una v.a. tal que $\hspace{0.1cm}\mathcal{X} \sim F(\cdot)$ 


$\hspace{0.25cm}$ $\mathcal{X}_1,...,\mathcal{X}_n \hspace{0.1cm}$ es una muestra aleatoria simple (m.a.s.) de tamaño $\hspace{0.08cm}n\hspace{0.08cm}$ de $\hspace{0.1cm}\mathcal{X}$ $\hspace{0.2cm}\Leftrightarrow\hspace{0.2cm}$ $(\mathcal{X}_1,...,\mathcal{X}_n) \underset{i.i.d.}{\sim} F(\cdot) \\$

</p>
 
</p></span>
</div>

**Observación:**

Una m.a.s. de una v.a. $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ es un vector de v.a.'s mutuamente independientes y que se distribuyen probabilisticamente igual que la v.a. $\hspace{0.1cm}\mathcal{X}$


<br>

# Muestra de Observaciones


<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>

$\hspace{0.25cm}$  Sea $\hspace{0.12cm}\mathcal{X}\hspace{0.12cm}$ una v.a. tal que $\hspace{0.12cm}\mathcal{X} \sim F(\cdot)$ 


$\hspace{0.25cm}$ $X=(x_1,...,x_n)\hspace{0.12cm}$ es una muestra de $\hspace{0.08cm}n\hspace{0.08cm}$ observaciones de la v.a. $\hspace{0.12cm}\mathcal{X}$ $\hspace{0.2cm}\Leftrightarrow\hspace{0.2cm}$ $x_i \in Im(\mathcal{X}) \hspace{0.12cm} ,\hspace{0.12cm} \forall i\in \lbrace 1,...,n \rbrace$ $\hspace{0.2cm}\Leftrightarrow\hspace{0.2cm}$ $x_i$ es una realización de la v.a. $\hspace{0.12cm}\mathcal{X}$  , $\hspace{0.12cm}\forall i\in \lbrace 1,...,n \rbrace \\$


</p>
 
</p></span>
</div>

Donde:

$Im(\mathcal{X})\hspace{0.1cm}$ es la imagen de $\hspace{0.1cm}\mathcal{X}$$\hspace{0.1cm}$  , es decir, su campo de variación.

<br>

**Observaciones:**

- Una muestra de observaciones de una v.a. es un vector de números, no son v.a.'s. $\\[0.6cm]$

- Si $\hspace{0.08cm} X=(x_1,...,x_n)\hspace{0.08cm}$ es una muestra de $\hspace{0.08cm}n\hspace{0.08cm}$ observaciones de $\hspace{0.08cm}\mathcal{X}\sim F(\cdot)$ , entonces $\hspace{0.08cm}x_i\hspace{0.08cm}$ es una observacion que ha sido generada por la distribución de probabilidad $\hspace{0.08cm}F(\cdot)\hspace{0.08cm}$, es decir, $\hspace{0.08cm}x_i\hspace{0.08cm}$ puede verse como un numero aleatorio generado en base a la distribución de probabilidad $\hspace{0.08cm} F(\cdot)$ $\\[0.6cm]$

- Si $\hspace{0.08cm}X=(x_1,...,x_n)\hspace{0.08cm}$ es una muestra de $\hspace{0.08cm}n\hspace{0.08cm}$ observaciones de $\mathcal{X}\sim F(\cdot)$ , entonces:


    - $P(\mathcal{X}= x_i)$ es la probabilidad de  observar $x_i$ al extraer una muestra de observaciones de $\mathcal{X}$ $\\[0.6cm]$


- Si $\hspace{0.08cm}(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.08cm}$ es una muestra aleatoria simple (m.a.s.) de tamaño $\hspace{0.08cm}n\hspace{0.08cm}$ de $\hspace{0.08cm}\mathcal{X}\sim F(\cdot)\hspace{0.08cm}$ , entonces:

    -  $P(\mathcal{X}_1 = x_1 , ..., \mathcal{X}_n=x_n)\hspace{0.08cm}$ es la probabilidad de obtener como valores $\hspace{0.08cm}(x_1,...,x_n)\hspace{0.08cm}$ al extraer una muestra de observaciones de $\hspace{0.08cm}\mathcal{X}$


<br>


# Estadístico


<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>
$\hspace{0.25cm}$ $T\hspace{0.1cm}$ es un estadístico de una m.a.s $\hspace{0.1cm}(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ de la v.a. $\hspace{0.1cm}\mathcal{X}\sim F(\theta)$ $\hspace{0.25cm}\Leftrightarrow\hspace{0.25cm}$ $T\hspace{0.1cm}$ es una función de la m.a.s que no depende  del parámetro $\hspace{0.1cm}\theta$




</p>
 
</p></span>
</div>

Por tanto:

- $T(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ es un estadístico.  $\\[0.4cm]$


 

**Observaciones:**

- $\hspace{0.12cm}T(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ es una v.a. al ser una función de v.a.'s $\\[0.8cm]$

- Dada una muestra de observaciones $\hspace{0.1cm}(x_1 ,..., x_n)\hspace{0.1cm}$ de  la v.a. $\hspace{0.1cm}\mathcal{X} \sim D(\theta)$ 

$\hspace{0.6cm} T(x_1,...,x_n)\hspace{0.1cm}$ es una observación de la v.a. $\hspace{0.1cm}T(\mathcal{X}_1,...,\mathcal{X}_n) \\$


- Dadas $\hspace{0.1cm}B\hspace{0.1cm}$ muestras de observaciones $\hspace{0.1cm}(x_1^1 , ..., x_n^1)\hspace{0.1cm} ,...,\hspace{0.1cm}(x_1^B,...,x_n^B)\hspace{0.2cm}$ de la v.a. $\hspace{0.1cm}\mathcal{X} \sim D(\theta)$ 

     - $\hspace{0.1cm}T(x_1^1 , ..., x_n^1) \hspace{0.1cm},...,\hspace{0.1cm} T(x_1^B,...,x_n^B)\hspace{0.2cm}$ es una muestra de observaciones de la v.a. $\hspace{0.1cm}T(\mathcal{X}_1,...,\mathcal{X}_n)$


<br>

## Ejemplos de estadisticos


Sea $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ una v.a. tal que $\hspace{0.1cm}\mathcal{X} \sim D(\theta)\hspace{0.1cm}$ , y sea $\hspace{0.1cm}(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ una m.a.s. de $\hspace{0.1cm} \mathcal{X} \\$


- **Media muestral**

$$T(\mathcal{X}_1,...,\mathcal{X}_n) = \overline{\mathcal{X}} = \dfrac{1}{n} \sum_{i=1}^n \mathcal{X}_i \\[1cm]$$


- **Varianza muestral**

$$T(\mathcal{X}_1,...,\mathcal{X}_n) = S^2 = \dfrac{1}{n} \sum_{i=1}^n (\mathcal{X}_i - \overline{\mathcal{X}})^2 \\[1cm]$$


- **Cuasi-Varianza muestral**

$$T(\mathcal{X}_1,...,\mathcal{X}_n) = S^2 = \dfrac{1}{n-1} \sum_{i=1}^n (\mathcal{X}_i - \overline{X})^2 \\$$





<br>






<br>




# Métodos de estimacion puntual

## Método de los momentos



### Momentos de una v.a.

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

$\hspace{0.25cm}$ El momento de orden $\hspace{0.1cm} k\hspace{0.1cm}$ de la v.a. $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$  es $\hspace{0.1cm}E\left[ \hspace{0.1cm} \mathcal{X}^k \hspace{0.1cm}\right]$

</p>
 
</p></span>
</div>

<br>


### Momentos muestrales

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

$\hspace{0.25cm}$  El momento de orden $\hspace{0.1cm}k\hspace{0.1cm}$ de la m.a.s. $\hspace{0.1cm}(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ de la v.a. $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ es $\hspace{0.2cm} \overline{\mathcal{X}_n^k} = \dfrac{1}{n} \cdot \sum_{i=1}^n \mathcal{X}_i^k$

</p>
 
</p></span>
</div>

<br>


### El método de los momentos

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>


$\hspace{0.25cm}$  Dada una v.a. $\hspace{0.1cm}\mathcal{X}\sim F(\theta_1,...,\theta_h)\hspace{0.1cm}$ y una m.a.s. $\hspace{0.1cm}(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ de $\hspace{0.1cm}X$.

$\hspace{0.25cm}$  Se quieren estimar los parametros $\hspace{0.1cm}\theta_1,...,\theta_h$ 

$\hspace{0.25cm}$  El método de los momentos consiste en resolver para $\hspace{0.1cm}\theta_1,...,\theta_h\hspace{0.1cm}$ el siguiente sistema de ecuaciones: $\\[0.7cm]$

$$\left\lbrace\begin{array}{l}   
 E\left[\hspace{0.1cm}\mathcal{X} \hspace{0.1cm}\right] \hspace{0.1cm} =\hspace{0.1cm} \dfrac{1}{n} \cdot \sum_{i=1}^n \mathcal{X}_i    \\[0.1cm] 
 E\left[\hspace{0.1cm}\mathcal{X}^2\hspace{0.1cm}\right]  \hspace{0.1cm} =\hspace{0.1cm} \dfrac{1}{n} \cdot \sum_{i=1}^n \mathcal{X}_i^2    \\[0.1cm]
  \hspace{0.25cm} ...   \\[0.1cm]
E\left[\hspace{0.1cm}\mathcal{X}^h\hspace{0.1cm}\right] \hspace{0.1cm} =\hspace{0.1cm} \dfrac{1}{n} \cdot \sum_{i=1}^n \mathcal{X}_i^h
\end{array}\right.$$


</p>
 
</p></span>
</div>

<br>

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

$\hspace{0.25cm}$  Si solución del sistema para $\hspace{0.1cm}(\theta_1,...,\theta_h)\hspace{0.1cm}$ es   $\hspace{0.1cm}\left( \hspace{0.05cm} T_1(\mathcal{X}_1,...,\mathcal{X}_n),...,T_h(\mathcal{X}_1,...,\mathcal{X}_n) \hspace{0.05cm} \right)\hspace{0.1cm}$ , entonces: $\\[0.6cm]$

- Los estimadores de los parámetros $\hspace{0.1cm}(\theta_1,...,\theta_h)\hspace{0.1cm}$ por el método de los momentos son:



$$\widehat{\theta}_1 \hspace{0.1cm} =\hspace{0.1cm} T_1(\mathcal{X}_1,...,\mathcal{X}_n)$$

$$\dots$$

$$\widehat{\theta}_h \hspace{0.1cm}=\hspace{0.1cm} T_h(\mathcal{X}_1,...,\mathcal{X}_n)$$

<br>

- Por tanto, dada una muestra de observaciones  $\hspace{0.1cm}X=(x_1,...,x_n)\hspace{0.1cm}$ de $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ , las estimaciones de los parametros $\hspace{0.1cm}(\theta_1,...,\theta_h)\hspace{0.1cm}$ por el método de los momentos son:


$$\widehat{\theta}_1 \hspace{0.1cm}=\hspace{0.1cm} T_1(x_1,...,x_n)$$


$$\dots$$

$$\widehat{\theta}_h \hspace{0.1cm} =\hspace{0.1cm} T_h(x_1,...,x_n) \\$$


</p>
 
</p></span>
</div>


**Observación:**

Los momentos $\hspace{0.1cm}E\left[\hspace{0.1cm} X\hspace{0.1cm} \right]\hspace{0.05cm},\hspace{0.05cm} E\left[ \hspace{0.1cm}X^2\hspace{0.1cm} \right]\hspace{0.05cm},...,\hspace{0.05cm} E\left[\hspace{0.1cm}X^h\hspace{0.1cm}\right]\hspace{0.1cm}$ dependen generalmente de los parametros a estimar $\hspace{0.1cm}\widehat{\theta}_1\hspace{0.05cm},...,\hspace{0.05cm}\widehat{\theta}_h$


<br>



### Ejemplo: v.a. con distribución normal

Tenemos la siguiente v.a. $\hspace{0.15cm} X \sim N(\mu , \sigma^2)$.

El problema consiste en estimar los parametros de la distribución $\hspace{0.1cm}\mu\hspace{0.1cm}$ y $\hspace{0.1cm}\sigma^2\hspace{0.1cm}$ a partir de una muestra de observaciones de la v.a.



Estimaremos los parametros $\hspace{0.1cm}(\mu , \sigma^2)\hspace{0.1cm}$ usando el **métodos de los momentos**.


$$E[X]= \mu$$

$$E[X^2]= \mu^2 + \sigma^2$$


Siguiendo el método de los momentos debemos resolver en $\hspace{0.1cm}\mu\hspace{0.1cm}$ y $\hspace{0.1cm}\sigma^2\hspace{0.1cm}$ el siguiente sistema de ecuaciones:

$$\mu = \dfrac{1}{n} \cdot \sum_{i=1}^n \mathcal{X}_i$$

$$\mu^2 + \sigma^2 = \dfrac{1}{n} \cdot \sum_{i=1}^n \mathcal{X}_i^k \\$$



La solución del sistema en $\hspace{0.1cm}\mu\hspace{0.1cm}$ y $\hspace{0.1cm}\sigma^2\hspace{0.1cm}$ , respectivamente,  es: 

$$\overline{\mathcal{X}_n} = \dfrac{1}{n} \sum_{i=1}^n \mathcal{X}_i$$

$$S_n^2 = \dfrac{1}{n} \sum_{i=1}^n (\mathcal{X}_i - \overline{\mathcal{X}_n})^2 \\$$


Notese que $\hspace{0.1cm}\overline{\mathcal{X}_n}\hspace{0.1cm}$ y $\hspace{0.1cm}S_n^2\hspace{0.1cm}$ son la media  y la varianza muestral de la m.a.s.  $\hspace{0.1cm}\mathcal{X}_1,...,\mathcal{X}_n\hspace{0.1cm}$ , respectivamente. $\\[0.6cm]$


Por tanto, dada una v.a. $\hspace{0.1cm}\mathcal{X} \sim N(\mu , \sigma^2)\hspace{0.1cm}$, los ***estimadores*** por el **método de los momentos** de los parametros $\hspace{0.1cm}\mu\hspace{0.1cm}$ y $\hspace{0.1cm}\sigma^2\hspace{0.1cm}$ son:


$$\widehat{\mu} \hspace{0.1cm}=\hspace{0.1cm} \overline{\mathcal{X}_n} = \dfrac{1}{n} \sum_{i=1}^n \mathcal{X}_i$$

$$\widehat{\sigma}^2 \hspace{0.1cm}=\hspace{0.1cm} S_n^2 = \dfrac{1}{n} \sum_{i=1}^n (\mathcal{X}_i - \overline{\mathcal{X}_n})^2\\$$


Por lo que dada una muestra $\hspace{0.1cm}X=(x_1,...,x_n)\hspace{0.1cm}$ de $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$, las ***estimaciones*** de $\hspace{0.1cm}\mu\hspace{0.1cm}$ y $\hspace{0.1cm}\sigma^2\hspace{0.1cm}$ por el **método de los momentos** son:

$$\widehat{\mu} \hspace{0.1cm}=\hspace{0.1cm} \overline{X} = \dfrac{1}{n} \sum_{i=1}^n x_i$$

$$\widehat{\sigma}^2 \hspace{0.1cm}=\hspace{0.1cm} S^2(X) = \dfrac{1}{n} \sum_{i=1}^n (x_i - \overline{X})^2$$



<br>

### Justificación: Ley de los grandes números



<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

$\hspace{0.25cm}$ La ley (débil) de los grandes establece lo siguiente:


$\hspace{0.25cm}$  Si tenemos una m.a.s $\hspace{0.1cm}\mathcal{X}_1 ,...,\mathcal{X}_n\hspace{0.1cm}$  de una v.a. $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ , entonces: $\\[0.6cm]$

$$\overline{\mathcal{X}_n^k} = \dfrac{1}{n} \cdot \sum_{i=1}^n \mathcal{X}_i^k \hspace{0.25cm} \underset{p}{\rightarrow} \hspace{0.25cm} E\left[\hspace{0.1cm}\mathcal{X}^k\hspace{0.1cm}\right] \\[1cm]$$



$\hspace{0.25cm}$  El caso canónico es con $k=1$ :  $\\[0.6cm]$

$$\overline{\mathcal{X}_n} = \dfrac{1}{n} \cdot \sum_{i=1}^n \mathcal{X}_i \hspace{0.25cm} \underset{p}{\rightarrow} \hspace{0.25cm} E\left[\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}\right]$$

</p>
 
</p></span>
</div>






<br>


## Método de Máxima Verosimilitud

### Función de Verosimilitud

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>



$\hspace{0.25cm}$ Dada una v.a. $\hspace{0.1cm} \mathcal{X} \sim F(\theta)\hspace{0.1cm}$ y una m.a.s. $\hspace{0.1cm}(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ de $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ y una muestra de observaciones $\hspace{0.1cm}X=(x_1,...,x_n)\hspace{0.1cm}$  de $\hspace{0.1cm}\mathcal{X}\\$


$\hspace{0.25cm}$ La función de verosimilitud de la m.a.s. $\hspace{0.1cm}(\mathcal{X}_1,..., \mathcal{X}_n)\hspace{0.1cm}$ es una función  tal que: $\\[0.7cm]$



$$\mathcal{L}_{\mathcal{X}_1,..., \mathcal{X}_n}(x_1,...,x_n) \hspace{0.15cm}=\hspace{0.15cm} f_{\mathcal{X}_1,...,\mathcal{X}_n}(x_1,...,x_n, \theta) \hspace{0.3cm} , \hspace{0.3cm} \forall\hspace{0.1cm} (x_1,...,x_n)\in \mathbb{R}^n \\$$


$\hspace{0.25cm}$  Donde: 

$\hspace{0.25cm}$  $f_{\mathcal{X}_1,...,\mathcal{X}_n}\hspace{0.1cm}$ es la función de densidad o de probabilidad **conjunta** para las v.a.'s $\hspace{0.1cm}\mathcal{X}_1,...,\mathcal{X}_n \\$


</p>
 
</p></span>
</div>


<br>


**Observaciones:**


- Como  la m.a.s. $\hspace{0.1cm}(\mathcal{X}_1,..., \mathcal{X}_n)\hspace{0.1cm}$ son v.a.'s independientes , entonces : 

    - $\mathcal{L}_{\mathcal{X}_1,..., \mathcal{X}_n}(x_1,...,x_n) \hspace{0.1cm}=\hspace{0.1cm} f_{\mathcal{X}_1,...,\mathcal{X}_n}(x_1,...,x_n, \theta) \hspace{0.1cm}=\hspace{0.1cm} \prod_{i=1}^n f_{\mathcal{X}_i}(x_i , \theta) \\[0.8cm]$




- Como  la m.a.s. $\hspace{0.1cm}(\mathcal{X}_1,..., \mathcal{X}_n)\hspace{0.1cm}$ son v.a.'s identicamente disstribuidas a $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ , es decir, siguen la misma distribución que $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$, se tiene que $\hspace{0.1cm}f_{\mathcal{X}_i}=f_{X}=f_{F(\theta)} , \forall i=1,...,n\hspace{0.1cm}$ , por lo tanto : $\\[0.6cm]$

    - $\mathcal{L}_{\mathcal{X}_1,..., \mathcal{X}_n}(x_1,...,x_n , \theta) \hspace{0.1cm}=\hspace{0.1cm} f_{\mathcal{X}_1,...,\mathcal{X}_n}(x_1,...,x_n , \theta) \hspace{0.1cm}=\hspace{0.1cm}  \prod_{i=1}^n f_{\mathcal{X}}(x_i, \theta)\\$
    
    
    
    
    -  Puesto que al ser $\hspace{0.1cm}(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ identicamente distribuidas a $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ , se cumple que  $\hspace{0.1cm}f_{\mathcal{X}_i} \hspace{0.1cm}=\hspace{0.1cm} f_{\mathcal{X}}\hspace{0.1cm}=\hspace{0.1cm}f_{F(\theta)} \hspace{0.2cm},\hspace{0.2cm} \forall i \in \lbrace 1,...,n \rbrace$


<br>

### Método de Máxima Verosimilitud

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

$\hspace{0.25cm}$ Dada una v.a. $\hspace{0.1cm}\mathcal{X}\sim F(\theta)\hspace{0.1cm}$ y una m.a.s. $\hspace{0.1cm}(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ de $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ y una muestra de observaciones $\hspace{0.1cm}X=(x_1,...,x_n)\hspace{0.1cm}$    de $\hspace{0.1cm}\mathcal{X} \\$


$\hspace{0.25cm}$ La estimación del parámetro $\hspace{0.1cm} \theta\hspace{0.1cm}$ por el método de máxima verosimilitud se denomina estimación máximo-verosímil, y se define como sigue:

$$\widehat{\theta}_{MV} \hspace{0.15cm}=\hspace{0.15cm} arg \hspace{0.15cm} \underset{\theta}{Max} \hspace{0.2cm} \mathcal{L}_{\mathcal{X}_1,..., \mathcal{X}_n}(x_1,...,x_n , \theta) 
\hspace{0.15cm}=\hspace{0.15cm} arg \hspace{0.15cm} \underset{\theta}{Max} \hspace{0.2cm}
f_{\mathcal{X}_1,...,\mathcal{X}_n}(x_1,...,x_n , \theta)
\hspace{0.15cm}=\hspace{0.15cm} arg \hspace{0.15cm} \underset{\theta}{Max} \hspace{0.2cm} \prod_{i=1}^n f_{\mathcal{X}}(x_i , \theta) \\$$


</p>
 
</p></span>
</div>




**Observación:**

La idea del método de estimación por máxima verosimilitud es, dada una muestra de observaciones (unos datos) de una variable de interes que tiene cierta función de densidad o de probabilidad dependiente de un parametro desconocido, estimar el parametro desconocido con aquel valor del parametro que maximiza la funcion de probabilidad o densidad conjunta de la muestra, es decir, que maximiza la probabilidad de obtener la muestra de observaciones que se ha extraido, es decir, que hace más verosimil los datos disponibles.

Siempre bajo el supuesto de que conocemos la distribucion de probabilidad de la variable de interes, y por tanto se puede calcular la probabilidad de extraer aleatoriamente cierta muestra de observaciones de esa variable.



<br>


### Ejemplo: v.a. con distribución normal

Tenemos la siguiente v.a. $\hspace{0.15cm} \mathcal{X} \sim N(\mu , \sigma^2)$.

El problema consiste en estimar los parametros de la distribución $\hspace{0.1cm}\mu\hspace{0.1cm}$ y $\hspace{0.1cm}\sigma^2\hspace{0.1cm}$ a partir de una muestra de observaciones de la v.a.



Estimaremos los parametros $\hspace{0.1cm}(\mu , \sigma^2)\hspace{0.1cm}$ usando el **método de máxima verosimilitud**.


La función de verosimilitud de una m.a.s $\hspace{0.1cm}(\mathcal{X}_1,...,\mathcal{X}_n)$ de $\mathcal{X}\sim N(\mu , \sigma^2)$ es:


$$
\mathcal{L}_{\mathcal{X}_1,..., \mathcal{X}_n}(x_1,...,x_n \hspace{0.1cm}|\hspace{0.1cm} \mu , \sigma^2) \hspace{0.1cm}=\hspace{0.1cm} f_{\mathcal{X}_1,...,\mathcal{X}_n}(x_1,...,x_n | \mu , \sigma^2) \hspace{0.1cm}=\hspace{0.1cm}  \prod_{i=1}^n f_{\mathcal{X}}(x_i \hspace{0.1cm}|\hspace{0.1cm} \mu , \sigma^2) 
 \hspace{0.1cm}=\hspace{0.1cm} \\
 =\hspace{0.1cm}  \prod_{i=1}^n  \dfrac{1}{\sqrt{2\cdot \pi \cdot \sigma^2}} \cdot exp \left\lbrace  -\dfrac{1}{2} \cdot \dfrac{(x_i - \mu)^2}{\sigma^2} \right\rbrace
\hspace{0.1cm}=\hspace{0.1cm} \left( \dfrac{1}{\sqrt{2\cdot \pi \cdot \sigma^2}}\right)^2 \cdot exp \left\lbrace -\dfrac{1}{2} \cdot \sum_{i=1}^n \dfrac{(x_i - \mu)^2}{\sigma^2} \right\rbrace \\[1cm]
$$


Para todo $(x_1,...,x_n)\in \mathbb{R}^n$


Por tanto, dada una muestra de observaciones $\hspace{0.1cm}X=(x_1,...,x_n)\hspace{0.1cm}$ de $\hspace{0.1cm}\mathcal{X}\sim N(\mu, \sigma^2)\hspace{0.1cm}$,las ***estimaciones*** **máximo-verosímiles** de los parametros $\hspace{0.1cm}\mu\hspace{0.1cm}$ y $\hspace{0.1cm}\sigma^2\hspace{0.1cm}$ son:

$$\left(\widehat{\mu} \hspace{0.1cm},\hspace{0.1cm} \widehat{\sigma}^2 \right) \hspace{0.15cm}=\hspace{0.15cm} arg \hspace{0.15cm} \underset{\left(\mu , \sigma^2 \right)}{Max} \hspace{0.15cm}  \left( \dfrac{1}{\sqrt{2\cdot \pi \cdot \sigma^2}}\right)^2 \cdot exp \left\lbrace -\dfrac{1}{2} \cdot \sum_{i=1}^n \dfrac{(x_i - \mu)^2}{\sigma^2} \right\rbrace$$

 
Resolviendo el problema de optimización se obtienen las siguientes expresiones:

$$\widehat{\mu} \hspace{0.1cm}=\hspace{0.1cm} \overline{X} = \dfrac{1}{n} \sum_{i=1}^n x_i$$

$$\widehat{\sigma}^2 \hspace{0.1cm}=\hspace{0.1cm} S(X)^2 = \dfrac{1}{n} \sum_{i=1}^n (x_i - \overline{X})^2 \\[1cm]$$


Por lo que,  dada una v.a. $\hspace{0.1cm}\mathcal{X} \sim N(\mu , \sigma^2)\hspace{0.1cm}$,  los ***estimadores*** **maximo-verosimiles** de los parametros $\hspace{0.1cm}\mu\hspace{0.1cm}$ y $\hspace{0.1cm}\sigma^2\hspace{0.1cm}$ son:

$$\widehat{\mu} \hspace{0.1cm}=\hspace{0.1cm} \overline{\mathcal{X}_n} = \dfrac{1}{n} \sum_{i=1}^n \mathcal{X}_i$$

$$\widehat{\sigma}^2 \hspace{0.1cm}=\hspace{0.1cm} S^2_n = \dfrac{1}{n} \sum_{i=1}^n (x_i - \overline{\mathcal{X}_n})^2 \\$$







 
<br>
 
### Principio de invarianza

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

$\hspace{0.25cm}$  Dada una funcion $\hspace{0.1cm} T\hspace{0.1cm}$ del parametro $\hspace{0.1cm}\theta$ $\hspace{0.15cm}\Rightarrow \hspace{0.15cm}T(\theta)$

$\hspace{0.25cm}$  Si $\hspace{0.1cm}\widehat{\theta}_{MV}\hspace{0.1cm}$ es el estimador máximo-verosímil del parámetro $\hspace{0.1cm}\theta\hspace{0.1cm}$ , entonces:

- $\hspace{0.1cm} T(\widehat{\theta}_{MV})\hspace{0.1cm}$ es el estimador máximo-verosimil de $\hspace{0.1cm}T(\theta)$

</p>
 
</p></span>
</div>
 
 <br>
 

# Estimación por intervalos de confianza <a class="anchor" id="1"></a>

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

$\hspace{0.25cm}$ Dada una v.a. $\hspace{0.1cm} \mathcal{X} \sim F(\theta)\hspace{0.1cm}$ y una m.a.s. $\hspace{0.1cm}(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ de $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$  y dada una constante $\hspace{0.1cm}\alpha \in (0,1) \\$
 
$\hspace{0.25cm}$  Un intervalo de confianza $\hspace{0.1cm}1-\alpha\hspace{0.1cm}$ para el parámetro $\hspace{0.1cm}\theta\hspace{0.1cm}$ es un intervalo $\hspace{0.1cm}\left[ L_1(\mathcal{X}_1,...,\mathcal{X}_n) \hspace{0.1cm},\hspace{0.1cm} L_2(\mathcal{X}_1,...,\mathcal{X}_n) \right]$ tal que: $\\[0.7cm]$
 
 $$P(L_1 \leq \theta  \leq L_2) = 1- \alpha \\$$

 </p>
 
</p></span>
</div>

<br>

**Observaciones:**
 
- $L_1\hspace{0.1cm}$ y $\hspace{0.1cm}L_2\hspace{0.1cm}$ son estadisticos de  la m.a.s. $\hspace{0.1cm}(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ de $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ , y por tanto son variables aleatorias. $\\[0.6cm]$
 
 
 
- Para cada muestra de observaciones $\hspace{0.1cm}X=(x_1,...,x_n)\hspace{0.1cm}$ de $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ se tiene un intervalo de confianza concreto $\hspace{0.1cm}(L_1(x_1,...,x_n) , L_2(x_1,...,x_n))$ $\\[0.6cm]$
 
 
 
- No es correcto decir que la probabilidad de que el parametro pertenezca al intervalo de confianza es $1-\alpha$ , ya que el parametro no es una v.a. , y solo puede hablarse de probabilidad con v.a's (adoptando la perspectiva frecuentista).  $\\[0.6cm]$

- Si es correcto decir que la probabilidad de que el intervalo de confianza contenga al parametro es $1-\alpha$ , puesto que el intervalo de confianza si es una v.a. al ser sus extremos v.a's.
 
<br> 
 
## Interpretación frecuentista de los intervalos de confianza

 
Dada una v.a. $\hspace{0.1cm} \mathcal{X} \sim F(\theta)\hspace{0.1cm}$ y una m.a.s. $\hspace{0.1cm}(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ de $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$

Dado un intervalo de confianza $\hspace{0.1cm}[ L_1(\mathcal{X}_1,...,\mathcal{X}_n) \hspace{0.1cm},\hspace{0.1cm} L_2(\mathcal{X}_1,...,\mathcal{X}_n) ]\hspace{0.1cm}$ para el parámetro $\hspace{0.1cm}\theta\\$


 
- Si se toma un número **grande** $\hspace{0.1cm}B \hspace{0.1cm}$ de muestras de observaciones $\hspace{0.1cm}X^1=(x^1_1,...,x^1_n)\hspace{0.1cm},...,\hspace{0.1cm}X^B=(x^B_1,...,x^B_n)\hspace{0.1cm}$ de $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm} \\$

    - Se obtienen $\hspace{0.1cm}B\hspace{0.1cm}$ realizaciones del intervalo de confianza (intervalos concretos) $\hspace{0.1cm}[L_1(x_1^1,...,x_n^1),L_2(x_1^1,...,x_n^1)]\hspace{0.1cm},...,\hspace{0.1cm} [L_1(x_1^B,...,x_n^B),L_2(x_1^B,...,x_n^B)]\hspace{0.1cm}\\$ 

    - La proporción de los intervalos que  que contienen a $\hspace{0.1cm}\theta\hspace{0.1cm}$ es aproximadamente $\hspace{0.1cm} 1-\alpha$ 


<br>


## Método pivotal

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

$\hspace{0.25cm}$ El método pivotal es un método para la construcción de intervalos de confianza.

$\hspace{0.25cm}$ Es un método general para encontrar $\hspace{0.1cm}L_1(\mathcal{X}_1,...,\mathcal{X}_n)$ y $L_2(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ tales que: 

$$\hspace{0.1cm}P(L_1(\mathcal{X}_1,...,\mathcal{X}_n) \hspace{0.1cm}\leq\hspace{0.1cm} \theta  \hspace{0.1cm}\leq\hspace{0.1cm} L_2(\mathcal{X}_1,...,\mathcal{X}_n))\hspace{0.1cm}=\hspace{0.1cm}1-\alpha$$


$\hspace{0.25cm}$ El método consiste en encontrar una función $\hspace{0.1cm}\Upsilon\hspace{0.1cm}$ de la m.a.s. $\hspace{0.1cm}(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ y del parámetro $\theta$ con distribucion de probabilidad conocida y no dependiente de $\hspace{0.1cm}\theta\hspace{0.1cm}$ , llamada cantidad pivotal:

$\hspace{0.25cm}$ $\Upsilon(\mathcal{X}_1,...,\mathcal{X}_n, \theta)\hspace{0.1cm}$ tiene que ser una v.a. con **distribución de probabilidad conocida** y que **no depende de** $\hspace{0.1cm}\theta\hspace{0.1cm}$ de tal manera que pueden determinarse un par de números $\hspace{0.1cm}a, b\in \mathbb{R}\hspace{0.1cm}$ tales que

$$P(a \hspace{0.1cm}\leq\hspace{0.1cm} \Upsilon(\mathcal{X}_1,...,\mathcal{X}_n, \theta) \hspace{0.1cm}\leq\hspace{0.1cm} b) \hspace{0.1cm}=\hspace{0.1cm} 1-\alpha$$

$\hspace{0.25cm}$ Se tiene que transformar la última expresion para aislar el parametro $\hspace{0.1cm}\theta\hspace{0.1cm}$ de forma que se llegue a la siguiente expresión:

$$P(g_1( a, \mathcal{X}_1,...,\mathcal{X}_n) )  \hspace{0.1cm}\leq\hspace{0.1cm}  \theta \hspace{0.1cm}\leq\hspace{0.1cm} g_2(b, \mathcal{X}_1,...,\mathcal{X}_n) ) = 1-\alpha$$


$\hspace{0.25cm}$ Donde: $\hspace{0.1cm}g_1\hspace{0.1cm}$ y $\hspace{0.1cm}g_2\hspace{0.1cm}$ son funciones dependientes de $\hspace{0.1cm}a,\mathcal{X}_1,...,\mathcal{X}_n\hspace{0.1cm}$ y $\hspace{0.1cm}b, \mathcal{X}_1,...,\mathcal{X}_n\hspace{0.1cm}$ , respectivamente.

</p>
 
</p></span>
</div>

<br>
 
 
## Intervalo de confianza para la proporción 
 
 Una variable **categorica binaria**  $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ con campo de variación $\hspace{0.1cm}\lbrace 0,1 \rbrace\hspace{0.1cm}$ puede modelarse como una variable aleatoria $\hspace{0.1cm}Bernoulli(p)\hspace{0.1cm}$, donde $\hspace{0.1cm}p=P(\mathcal{X} = 1)\hspace{0.1cm}$ y $\hspace{0.1cm}1-p = P(\mathcal{X}=0)$


Queremos obtener un intervalo de confianza para $\hspace{0.1cm}p\hspace{0.1cm}$, que puede interpretarse como la proporción de individuos de la poblacion para los que $\hspace{0.1cm}\mathcal{X}=1$ 


Para ello vamos a apoyarnos en el **teorema de esperanza-varianza de la media muestral** y en el **teorema central del limite** (TCL) y en el **método pivotal**.

<br>

### Distribución Bernoulli

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

$\hspace{0.25cm}$ Dada una v.a. $\mathcal{X}$, la distribución Bernoulli se define del siguiente modo: $\\[0.6cm]$

$$\mathcal{X} \sim Bernoulli(p) \hspace{0.2cm} \Leftrightarrow  \hspace{0.2cm} P(X=x) =p^x (1-p)^x \cdot I(x \in \lbrace 0,1 \rbrace ) \\$$

</p>
 
</p></span>
</div>


**Observaciones:**

- Las v.a. $\hspace{0.1cm} Bernoulli(p)\hspace{0.1cm}$ se usan para modelar experimentos aleatorios con dos únicos resultados dicotomicos (exito-fracaso)
 tales que la probabilidad del exito es $\hspace{0.1cm}p\hspace{0.1cm}$ y la del fracoso $\hspace{0.1cm}1-p$.
 
$\hspace{0.5cm}$ A este tipo de experimentos aleatorios se les llama experimentos tipo Bernoulli.
 
- Si $\hspace{0.1cm}\mathcal{X} \sim Bernoulli(p)\hspace{0.1cm}$ , entonces:

    - $\mathcal{X}\hspace{0.1cm}$ puede interpretarse como el nº de exitos obtenidos tras realizar una vez un experimento tipo Bernoulli (notese que este nº solo puede ser 0 o 1),  con probabilidad de exito $\hspace{0.1cm}p \\$


<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

$\hspace{0.25cm}$ **Propiedades**

- $P(\mathcal{X}=1)=p \\$

- $P(\mathcal{X}=0)=1-p \\$

- $E[\mathcal{X}]=p \\$

- $Var(\mathcal{X})= p\cdot (1-p)  \\$

- $F_\mathcal{X}(x) = \left\lbrace\begin{array}{l} 1 \hspace{0.25cm}  , \hspace{0.25cm}  \text{si} \hspace{0.25cm} x\geq 1 \\ 0 \hspace{0.25cm}  , \hspace{0.25cm}  \text{si} \hspace{0.25cm} x < 0 \\ 1-p \hspace{0.25cm}  , \hspace{0.25cm}  \text{si} \hspace{0.25cm} x\in [0 , 1) \end{array}\right.$


</p>
 
</p></span>
</div>


<br>


### Distribución Binomial

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

$\hspace{0.25cm}$ Dada una v.a. $\hspace{0.1cm} \mathcal{X}\hspace{0.1cm}$, la distribución binomial se define del siguiente modo:


$$\mathcal{X} \sim Binomial(n,p) \hspace{0.2cm} \Leftrightarrow  \hspace{0.2cm}  P(X=x) =\binom{n}{x} \cdot p^x (1-p)^x \cdot I(x\in\lbrace 0,1,...,n \rbrace ) \\$$


</p>
 
</p></span>
</div>



**Observaciones:**


- Si $\mathcal{X} \sim Binomial(p)$ , entonces:

    - $\mathcal{X}$ puede interpretarse como el nº de exitos obtenidos tras realizar $n$ veces un experimento tipo Bernoulli  con probabilidad de exito $p$, notese que este número solo puede ser $0,1,...,n \\$






<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>


$\hspace{0.25cm}$ **Propiedades** 

- Si $\hspace{0.1cm} \mathcal{X}_1,...,\mathcal{X}_n\hspace{0.1cm}$ son v.a. independientes tales que $\hspace{0.1cm}\mathcal{X}_i \sim Bernoulli(p)$ , $i =1,...,n\hspace{0.1cm}$ , entonces:

$$\mathcal{X}_1 + ... + \mathcal{X}_n \sim Binomial (n, p) \\$$


- $Binomial(n=1, p) = Bernoulli(p) \\$


- $E[\mathcal{X}]=n\cdot p \\$


- $Var(\mathcal{X}) = n \cdot p \cdot (1-p) \\$


- Para $\hspace{0.1cm}x\geq n$ 

$$F_\mathcal{X}(x) = \sum_{z\in \lbrace 0,1,...,x\rbrace} \binom{n}{z} \cdot p^z \cdot (1-p)^{n-z}$$

</p>
 
</p></span>
</div>





<br>


### Teorema de esperanza-varianza de la media muestral

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

$\hspace{0.25cm}$ Si tenemos una v.a. $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ y una m.a.s $\hspace{0.1cm}\mathcal{X}_1,...,\mathcal{X}_n\hspace{0.1cm}$ de $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ , entonces: $\\[0.5cm]$

$$E\left[\overline{\mathcal{X}_n}\right] \hspace{0.1cm}=\hspace{0.1cm} E[\mathcal{X}]\\$$

$$Var\left(\overline{\mathcal{X}_n}\right) \hspace{0.1cm}=\hspace{0.1cm} Var(\mathcal{X})/n \\$$

$\hspace{0.25cm}$ Donde:

- $\hspace{0.1cm}\overline{\mathcal{X}_n} = \dfrac{1}{n} \cdot \sum_{i=1}^n \mathcal{X}_i$


</p>
 
</p></span>
</div>


<br>



### Teorema central del límite


<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

$\hspace{0.25cm}$ El TCL dice lo siguiente:

$\hspace{0.25cm}$ Si tenemos una v.a. $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ con varianza finita y no nula, y una m.a.s $\hspace{0.1cm}\mathcal{X}_1,...,\mathcal{X}_n\hspace{0.1cm}$ de $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ , entonces: $\\[0.5cm]$

$$\dfrac{\overline{\mathcal{X}_n} - E\left[\overline{\mathcal{X}_n}\right]}{\sqrt{Var\left(\overline{\mathcal{X}_n}\right)}} = \dfrac{\overline{\mathcal{X}_n} - E\left[\mathcal{X}\right]}{\sqrt{Var(\mathcal{X})/n}} \hspace{0.2cm}\underset{d}{\rightarrow}\hspace{0.2cm} N(0,1)\\$$


</p>
 
</p></span>
</div>






Usando la definicion de convergencia en distribución tenemos lo siguiente: $\\[0.5cm]$



$$\underset{n \rightarrow \infty}{lim} \hspace{0.1cm} F_{W_n}(x) \hspace{0.1cm} =\hspace{0.1cm} F_{N(0,1)}(x) \hspace{0.25cm} , \hspace{0.25cm} \forall x\in \mathbb{R}$$

Donde:

 $$W_n = \dfrac{\overline{\mathcal{X}_n} - E[\mathcal{X}]}{\sqrt{Var(\mathcal{X})/n}}$$
 
<br> 
 
### Teorema de Moivre-Laplace

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

$\hspace{0.25cm}$ Este teorema es un caso particular del TCL para v.a`s Binomiales.


$\hspace{0.25cm}$ Si tenemos una v.a. $\hspace{0.1cm}\mathcal{X}\sim Binomial(k,p)\hspace{0.1cm}$ y una m.a.s $\hspace{0.1cm}\mathcal{X}_1,...,\mathcal{X}_n\hspace{0.1cm}$ de $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ , entonces: $\\[0.5cm]$

 
 
 
$$\dfrac{\overline{\mathcal{X}_n} - E\left[\overline{\mathcal{X}_n}\right]}{\sqrt{Var\left(\overline{\mathcal{X}_n}\right)}} \hspace{0.1cm}=\hspace{0.1cm} \dfrac{\overline{\mathcal{X}_n} - E\left[\mathcal{X}\right]}{\sqrt{Var(\mathcal{X})/n}} \hspace{0.1cm}= \hspace{0.1cm}
\dfrac{\overline{\mathcal{X}_n} - k\cdot p}{\sqrt{k\cdot p\cdot(1-p)/n}}\hspace{0.2cm}\underset{d}{\rightarrow}\hspace{0.2cm} N(0,1)\\$$
 
</p>
 
</p></span>
</div>
 
<br>


 
Para el caso concreto de una distribución $\hspace{0.15cm}Bernouilli(p)=Binomial(k=1,p)\hspace{0.15cm}$ se tiene lo siguiente: $\\[0.6cm]$
 
 
 
$$\dfrac{\overline{\mathcal{X}_n} - E\left[\overline{\mathcal{X}_n}\right]}{\sqrt{Var\left(\overline{\mathcal{X}_n}\right)}} \hspace{0.1cm}=\hspace{0.1cm} \dfrac{\overline{\mathcal{X}_n} - E\left[\mathcal{X}\right]}{\sqrt{Var(\mathcal{X})/n}} \hspace{0.1cm}= \hspace{0.1cm}
\dfrac{\overline{\mathcal{X}_n} - p}{\sqrt{ p\cdot(1-p)/n}} \hspace{0.15cm}\underset{d}{\rightarrow}\hspace{0.15cm} N(0,1)\\$$ 
 

Este último resultado es el que usaremos para construir el intervalo de confianza para la proporción.



<br>

### Intervalo de confianza para la proporción

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

<p style='margin-left:30em;'>

$\hspace{0.25cm}$ La anterior cantidad:

$$\Upsilon(\mathcal{X}_1,...,\mathcal{X}_n, p) \hspace{0.1cm}=\hspace{0.1cm} \dfrac{\overline{\mathcal{X}_n} - p}{\sqrt{ p\cdot(1-p)/n}}\hspace{0.2cm}\underset{d}{\rightarrow}\hspace{0.2cm} N(0,1)$$


$\hspace{0.25cm}$ es una cantidad pivotal , puesto que contienen al parámetro de interés, en este caso $\hspace{0.1cm}\theta = p\hspace{0.1cm}$ , y su distribución de probabilidad es conocida y no depende de dicho parámetro , es una $\hspace{0.1cm}N(0,1)\hspace{0.1cm}$, aproximadamente. $\\[1cm]$
 
 
 
$\hspace{0.25cm}$ Siguiendo el método pivotal hay que encontrar los valores $\hspace{0.1cm}a,b \in \mathbb{R}\hspace{0.1cm}$ tales que: $\\[0.6cm]$

$$P\left( \hspace{0.1cm}a \hspace{0.1cm}< \hspace{0.1cm} \dfrac{\overline{\mathcal{X}_n} - p}{\sqrt{ p\cdot(1-p)/n}}  \hspace{0.1cm}<\hspace{0.1cm} b \hspace{0.1cm}\right) = 1-\alpha \\[1cm]$$


 
$\hspace{0.25cm}$ Siguiendo los anteriores resultados: $\\[0.6cm]$


$$P\left( \hspace{0.1cm} a \hspace{0.1cm}<\hspace{0.1cm} \dfrac{\overline{\mathcal{X}_n} - p}{\sqrt{ p\cdot(1-p)/n}} \hspace{0.1cm} <\hspace{0.1cm} b\hspace{0.1cm} \right) \hspace{0.1cm}\approx\hspace{0.1cm} P\left( a < N(0,1)  < b \right) \\[1cm]$$



$\hspace{0.25cm}$ Teniendo en cuenta las propiedades de la distribución normal: $\\[0.6cm]$

$$P\left( z_{1-\alpha/2} < N(0,1)  < z_{\alpha/2} \right) = P\left( -z_{\alpha/2} < N(0,1)  < z_{\alpha/2} \right) = 1-\alpha \\$$
 
 
$\hspace{0.25cm}$ Donde:


$\hspace{0.35cm}$ $z_{\alpha/2}\hspace{0.1cm}$ es el valor tal que $\hspace{0.1cm}P(N(0,1)>z_{\alpha/2}) = \alpha/2 \\[1cm]$ 



$\hspace{0.25cm}$ Por tanto:


$$P\left( \hspace{0.1cm} -z_{\alpha/2} \hspace{0.1cm}<\hspace{0.1cm} \dfrac{\overline{\mathcal{X}_n} - p}{\sqrt{ p\cdot(1-p)/n}} \hspace{0.1cm} <\hspace{0.1cm} z_{\alpha/2}\hspace{0.1cm} \right) \hspace{0.1cm}\approx\hspace{0.1cm} 1-\alpha \\[1cm]$$

</p>
 
</p></span>
</div>



<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

<p style='margin-left:15em;'>

$\hspace{0.25cm}$ Siguiendo el método pivotal ahora tenemos que aislar el parametro $\theta=p$. 

Operando un poco se llega a lo siguiente: $\\[0.6cm]$


$$P\left( \hspace{0.1cm} \overline{\mathcal{X}_n} -z_{\alpha/2} \cdot \sqrt{p(1-p)/n}\hspace{0.1cm}<\hspace{0.1cm}  p \hspace{0.1cm} <\hspace{0.1cm} \overline{\mathcal{X}_n} + z_{\alpha/2}\cdot \sqrt{p(1-p)/n}\hspace{0.1cm} \right) \hspace{0.1cm}\approx\hspace{0.1cm} 1-\alpha \\[1cm]$$



$\hspace{0.25cm}$ Pero la anterior expresión tienen un problema, dependen ambos lados de la desigualdad de $p$ , que es el parámetro desconocido. 

Una solución a esto es la siguiente:

$\hspace{0.25cm}$ Como $\overline{\mathcal{X}_n}$ es un estimador de $p$ que es insesgado, consistente y de minima varianza, es un muy buen estimador de $p$ , por tanto podemos estimar $p$ con $\overline{\mathcal{X}_n}$ en la anterior expresion. Asi llegamos a la siguiente expresión: $\\[0.7cm]$



$$P\left( \hspace{0.1cm} \overline{\mathcal{X}_n} -z_{\alpha/2} \cdot \sqrt{\overline{\mathcal{X}_n}(1-\overline{\mathcal{X}_n})/n}\hspace{0.1cm}<\hspace{0.1cm}  p \hspace{0.1cm} <\hspace{0.1cm} \overline{\mathcal{X}_n} + z_{\alpha/2}\cdot \sqrt{\overline{\mathcal{X}_n}(1-\overline{\mathcal{X}_n})/n}\hspace{0.1cm} \right) \hspace{0.1cm}\approx\hspace{0.1cm} 1-\alpha \\[1cm]$$

</p>
 
</p></span>
</div>



<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>


$\hspace{0.25cm}$ Por tanto, tenemos el siguiente intervalo de confianza a un nivel aproximado $\hspace{0.1cm} 1-\alpha\hspace{0.1cm}$ para el parametro $\hspace{0.1cm} p \hspace{0.1cm}\\$

$$IC(p)_{1-\alpha} \hspace{0.1cm}=\hspace{0.1cm} \left[ \hspace{0.1cm} \overline{\mathcal{X}_n} \hspace{0.1cm}\pm\hspace{0.1cm} z_{\alpha/2} \cdot \sqrt{\overline{\mathcal{X}_n}(1-\overline{\mathcal{X}_n})/n} \hspace{0.1cm} \right] \\[1cm]$$


$\hspace{0.25cm}$ Dada una muestra $\hspace{0.1cm}X=(x_1,...,x_n)\hspace{0.1cm}$ de la v.a. $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ , tenemos la siguiente realización del intervalo de confianza: $\\[0.6cm]$


$$IC(p)_{1-\alpha} \hspace{0.1cm}=\hspace{0.1cm} \left[ \hspace{0.1cm} \overline{X} \hspace{0.1cm}\pm\hspace{0.1cm} z_{\alpha/2} \cdot \sqrt{\overline{X}\cdot (1-\overline{X})/n} \hspace{0.1cm} \right] \\$$


$\hspace{0.25cm}$ Donde:

- $\hspace{0.1cm} \overline{X} = \dfrac{1}{n} \sum_{i=1}^n x_i$


</p>
 
</p></span>
</div>


<br>

### Intervalo de confianza para la proporción en `Python`



Cargamos los datos con los que vamos a trabajar:
```python
import numpy as np
import pandas as pd
import scipy
```


```python
Data = pd.read_csv('House_Price_Regression.csv')
```


```python
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

Creamos una función que toma como argumnetos una variable categorica binaria , que debe estar codificada en formato estandar (0,1), y un nivel de significación (alpha) y te devuelve como salida el intervalo de confianza para la proporción de individuos de la población tales que pertenecen a la clase o categoria codificada como 1, y además tambien devuelve la estimación puntual de dicha proporción.

```python
def CI_Proportion(Variable , alpha=0.05):

    z_alpha_medios = scipy.stats.norm.ppf( 1 - alpha/2 , loc=0, scale=1)

    X_mean = Variable.mean()

    n = len(Variable)

    L1 = X_mean - z_alpha_medios * np.sqrt(X_mean*(1-X_mean)/n)

    L2 = X_mean + z_alpha_medios * np.sqrt(X_mean*(1-X_mean)/n)

    interval = [L1 , L2]

    return interval , X_mean
```

<br>


Vamos calcular el intervalo de confianza para la proporción de viviendas con balcón. Para ello usaremos la variable Balcony, la cual es una variable binaria que toma el valor 1 si la vivienda tiene balcon y 0 en caso contrario.


```python
Balcony = Data.balcony_recode # 1 = true , 0 = false
```


**Intervalo de confianza para la proporción de viviendas que tienen balcón:**


```python
intervalo , proporcion = CI_Proportion(Variable=Balcony , alpha=0.05)
```


```python
intervalo
```




    [0.6995155465832295, 0.7398545321569281]




```python
proporcion
```




    0.7196850393700788




---
 

Ahora vamos a calcular el intervalo de confianza para la proporción de viviendas que estan clasificadas como de calidad baja, media, alta y ultra, respectivamente. Para ello vamos a usar la variable `quality_recode`, que es una variable categorica con cuatro categorias, por lo que no es binaria. Para poder aplicar el intervalo de confianza que hemos expuesto anteriormente se requiere de una variable categorica binaria (dos categorias). Una solución que permite aplicar dicho intervalo a variables categoricas multiclase (con mas de dos categorias) consiste en *dummificar* la variable multiclase, obteniendo asi variables dummies (binarias) asociadas a cada una de las categorias de la variable multiclase original. Luego se calcular el intervalo de confianza para cada una de estas dummies. A continuación ilustramos este procedimiento.

Primero dummificamos la variable `quality_recode` :

```python
Quality_0 = pd.get_dummies(Data.quality_recode , drop_first=False).iloc[:,0] # 1 = quality low , 0 = not low
Quality_1 = pd.get_dummies(Data.quality_recode , drop_first=False).iloc[:,1] # 1 = quality medium , 0 = not medium
Quality_2 = pd.get_dummies(Data.quality_recode , drop_first=False).iloc[:,2] # 1 = quality high , 0 = not high
Quality_3 = pd.get_dummies(Data.quality_recode , drop_first=False).iloc[:,3] # 1 = quality ultra , 0 = not ultra
```

Ahora podemos aplicar el intervalo de confianza para cada una de las variables dummies (binarias) obtenidas.

**Intervalo de confianza para la proporción de viviendas de baja calidad:**

```python
intervalo , proporcion = CI_Proportion(Variable=Quality_0 , alpha=0.05)
```


```python
intervalo
```




    [0.05885789175110899, 0.08182452294705374]




```python
proporcion
```




    0.07034120734908136

<br>


**Intervalo de confianza para la proporción de viviendas de  calidad media:**

```python
intervalo , proporcion = CI_Proportion(Variable=Quality_1 , alpha=0.05)
```


```python
intervalo
```




    [0.26528121372661256, 0.30584739519727194]




```python
proporcion
```




    0.28556430446194225


<br>


**Intervalo de confianza para la proporción de viviendas de alta calidad:**


```python
intervalo , proporcion = CI_Proportion(Variable=Quality_2 , alpha=0.05)
```


```python
intervalo
```




    [0.5795901905178868, 0.6235594157813258]




```python
proporcion
```




    0.6015748031496063



<br>

**Intervalo de confianza para la proporción de viviendas de calidad ultra:**

```python
intervalo , proporcion = CI_Proportion(Variable=Quality_3 , alpha=0.05)
```


```python
intervalo
```




    [0.03345901015224513, 0.051580359926495026]




```python
proporcion
```




    0.04251968503937008





<br>

<br>
 
## Intervalo de confianza para la media con varianza conocida

Una variable **cuantitativa**  $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ puede modelarse como una variable aleatoria $N(\mu , \sigma^2)$, donde $\hspace{0.1cm}\mu=E[\mathcal{X}]\hspace{0.2cm}$ y $\hspace{0.2cm}\sigma^2 = Var(\mathcal{X})$, que pueden interpretarse respectivamente como la media y varianza poblacional de la variable $\hspace{0.1cm}\mathcal{X}$

Queremos obtener un intervalo de confianza para $\hspace{0.1cm} \mu \hspace{0.1cm}$, bajo el supuesto de que $\hspace{0.1cm}\sigma^2\hspace{0.1cm}$ es conocido.



Para ello vamos a apoyarnos en el teorema de distribucion de la media muestral  y en el método pivotal.


<br>


### Distribución Normal

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

<p style='margin-left:0.1em;'>

$\hspace{0.25cm}$ Dada una v.a.  $\hspace{0.1cm} \mathcal{X}\hspace{0.1cm}$ la distribución Normal sse define del siguiente modo:

$$\mathcal{X} \sim N(\mu, \sigma^2) \hspace{0.2cm} \Leftrightarrow \hspace{0.2cm} f_\mathcal{X}(x) = \dfrac{1}{\sqrt{ 2\pi \cdot \sigma^2} } \cdot exp \left\lbrace \dfrac{-1}{2} \cdot \dfrac{(x- \mu)^2}{\sigma^2}  \right\rbrace \\$$


$\hspace{0.25cm}$ Donde : $\hspace{0.15cm} \mu \in \mathbb{R} \hspace{0.2cm}$ y $\hspace{0.2cm} \sigma^2 > 0 \\$

</p>
 
</p></span>
</div>


<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

<p style='margin-left:0.1em;'>

$\hspace{0.25cm}$ **Propiedades**

- $\hspace{0.1cm}E[\mathcal{X}]=\mu \\$

- $\hspace{0.1cm}Var(\mathcal{X})=\sigma^2 \\$

- $\hspace{0.1cm}\mathcal{X}\cdot a \sim N(\mu \cdot a , a^2 \cdot \sigma^2) \\$

- $\hspace{0.1cm}\mathcal{X}\cdot b + a \sim N( b\cdot \mu + a , b^2 \cdot \sigma^2) \\$

- Si $\hspace{0.1cm}\mathcal{X}_i \sim N(\mu_i , \sigma_i^2)\hspace{0.1cm}$ , para $\hspace{0.1cm}i \in \lbrace 1,...,n\rbrace \hspace{0.1cm}$ , entonces:

$$\mathcal{X}_1 + ...+ \mathcal{X}_n \sim N(\mu_1 +...+ \mu_n , \sigma_1^2 + ...+ \sigma_n^2) \\$$

- Si $\hspace{0.1cm}\mathcal{X}_i \sim N(\mu_i , \sigma_i^2)\hspace{0.1cm}$ , para $\hspace{0.1cm}i \in \lbrace 1,...,n\rbrace \hspace{0.1cm}$ , entonces:

$$\hspace{0.25cm}a_1\cdot \mathcal{X}_1 + ...+ a_n \cdot \mathcal{X}_n \sim N(a_1 \cdot \mu_1 +...+ a_n \cdot \mu_n \hspace{0.1cm},\hspace{0.1cm} a_1^2 \cdot \sigma_1^2 + ...+ a_n^2 \cdot \sigma_n^2) \\$$

- $\hspace{0.1cm}\dfrac{\hspace{0.15cm} \mathcal{X} - \mu \hspace{0.15cm}}{\sqrt{\sigma^2}} \hspace{0.1cm}\sim\hspace{0.1cm} N(0,1)$

</p>
 
</p></span>
</div>



<br>

### Teorema de distribución de la media muestral

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

<p style='margin-left:0.1em;'>

$\hspace{0.25cm}$ Si tenemos una v.a. $\hspace{0.1cm}\mathcal{X}\sim N(\mu , \sigma^2)\hspace{0.1cm}$ y una m.a.s $\hspace{0.1cm}\mathcal{X}_1,...,\mathcal{X}_n\hspace{0.1cm}$ de $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ , entonces: $\\[0.5cm]$


$$\overline{ \mathcal{X}_n } \sim N(\mu \hspace{0.1cm},\hspace{0.1cm} \sigma^2/n)$$

$\hspace{0.25cm}$ Por tanto:


$$\dfrac{\hspace{0.2cm} \overline{ \mathcal{X}_n } - \mu \hspace{0.2cm}}{ \sqrt{\sigma^2 / n}  } \hspace{0.1cm}\sim\hspace{0.1cm} N(0,1)$$

</p>
 
</p></span>
</div>


<br>

### Intervalo de confianza para la media con varianza conocida


<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

<p style='margin-left:0.1em;'>

$\hspace{0.25cm}$ La anterior cantidad:

$$\Upsilon(\mathcal{X}_1,...,\mathcal{X}_n, \mu) \hspace{0.1cm}=\hspace{0.1cm} \dfrac{\hspace{0.1cm} \overline{ \mathcal{X}_n } - \mu \hspace{0.1cm}}{ \sqrt{\sigma^2 / n}  } \hspace{0.1cm} \sim \hspace{0.1cm} N(0,1)$$


$\hspace{0.25cm}$ es una cantidad pivotal, puesto que contienen al parametro de interés, en este caso $\hspace{0.1cm} \theta = \mu\hspace{0.1cm}$, y su distribución de probabilidad es conocida y no depende de dicho parámetro, es una $\hspace{0.1cm}N(0,1)$.


$\hspace{0.25cm}$ Siguiendo el método pivotal hay que encontrar los valores $\hspace{0.1cm} a,b \in \mathbb{R}\hspace{0.1cm}$ tales que:




$$P\left( \hspace{0.1cm}a \hspace{0.1cm}< \hspace{0.1cm} \dfrac{\hspace{0.1cm} \overline{ \mathcal{X}_n } - \mu \hspace{0.1cm}}{ \sqrt{\sigma^2 / n}  }  \hspace{0.1cm}<\hspace{0.1cm} b \hspace{0.1cm}\right) = 1-\alpha \\$$


 
$\hspace{0.25cm}$ Siguiendo los anteriores resultados:


$$P\left( \hspace{0.1cm} a \hspace{0.1cm}<\hspace{0.1cm} \dfrac{\hspace{0.1cm} \overline{ \mathcal{X}_n } - \mu \hspace{0.1cm}}{ \sqrt{\sigma^2 / n}  } \hspace{0.1cm} <\hspace{0.1cm} b\hspace{0.1cm} \right) \hspace{0.1cm}=\hspace{0.1cm} P\left( a < N(0,1)  < b \right) \\$$



$\hspace{0.25cm}$ Teniendo en cuenta las propiedades de la distribución normal: $\\[0.6cm]$

$$P\left( z_{1-\alpha/2} < N(0,1)  < z_{\alpha/2} \right) = P\left( -z_{\alpha/2} < N(0,1)  < z_{\alpha/2} \right) = 1-\alpha \\$$
 
 
$\hspace{0.25cm}$ Donde:


$\hspace{0.35cm}$ $z_{\alpha/2}\hspace{0.1cm}$ es el valor tal que $\hspace{0.1cm}P(N(0,1)>z_{\alpha/2}) = \alpha/2 \\$ 



$\hspace{0.25cm}$ Por tanto:


$$P\left( \hspace{0.1cm} -z_{\alpha/2} \hspace{0.1cm}<\hspace{0.1cm} \hspace{0.1cm} \dfrac{\hspace{0.1cm} \overline{ \mathcal{X}_n } - \mu \hspace{0.1cm}}{ \sqrt{\sigma^2 / n}  }  \hspace{0.1cm} <\hspace{0.1cm} z_{\alpha/2}\hspace{0.1cm} \right) \hspace{0.1cm} = \hspace{0.1cm} 1-\alpha \\[1cm]$$


</p>
 
</p></span>
</div>




<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

<p style='margin-left:0.1em;'>


$\hspace{0.25cm}$ Siguiendo el método pivotal ahora tenemos que aislar el parametro $\theta=\mu$. 

Operando un poco se llega a lo siguiente: $\\[0.6cm]$


$$P\left( \hspace{0.1cm} \overline{\mathcal{X}_n} -z_{\alpha/2} \cdot \sqrt{\sigma^2 / n}\hspace{0.1cm}<\hspace{0.1cm}  \mu \hspace{0.1cm} <\hspace{0.1cm} \overline{\mathcal{X}_n} + z_{\alpha/2}\cdot \sqrt{\sigma^2 / n}\hspace{0.1cm} \right) \hspace{0.1cm}=\hspace{0.1cm} 1-\alpha \\[0.7cm]$$


</p>
 
</p></span>
</div>



<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

<p style='margin-left:0.1em;'>
 

$\hspace{0.25cm}$ Por tanto, tenemos el siguiente intervalo de confianza a un nivel  $\hspace{0.1cm} 1-\alpha\hspace{0.1cm}$ para el parametro $\hspace{0.1cm} \mu \hspace{0.1cm}\\$

$$IC(\mu)_{1-\alpha} \hspace{0.1cm}=\hspace{0.1cm} \left[ \hspace{0.1cm} \overline{\mathcal{X}_n} \hspace{0.1cm}\pm\hspace{0.1cm} z_{\alpha/2} \cdot \sqrt{\sigma^2 / n} \hspace{0.1cm} \right] \\[0.9cm]$$


$\hspace{0.25cm}$ Dada una muestra $\hspace{0.1cm}X=(x_1,...,x_n)\hspace{0.1cm}$ de la v.a. $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ , tenemos la siguiente realización del intervalo de confianza: $\\[0.6cm]$


$$IC(\mu)_{1-\alpha} \hspace{0.1cm}=\hspace{0.1cm} \left[ \hspace{0.1cm} \overline{X} \hspace{0.1cm}\pm\hspace{0.1cm} z_{\alpha/2} \cdot \sqrt{\sigma^2 / n} \hspace{0.1cm} \right]$$


$\hspace{0.25cm}$ Donde:

$\hspace{0.45cm} \overline{X} = \dfrac{1}{n} \sum_{i=1}^n x_i$

</p>
 
</p></span>
</div>


El problema es que en la práctica $\hspace{0.1cm}\sigma^2\hspace{0.1cm}$ no es conocido, por ello se utiliza el intervalo de confianza de la siguiente sección.






<br>

<br>

## Intervalo de confianza para la media con varianza desconocida



 

Una variable cuantitativa  $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ puede modelarse como una variable aleatoria $N(\mu , \sigma^2)$, donde $\hspace{0.1cm}\mu=E[\mathcal{X}]\hspace{0.1cm}$ y $\hspace{0.1cm}\sigma^2 = Var(\mathcal{X})$, que pueden interpretarse respectivamente como la media y varianza poblacional de la variable $\hspace{0.1cm}\mathcal{X}$

Queremos obtener un intervalo de confianza para $\hspace{0.1cm} \mu \hspace{0.1cm}$, teniendo en cuenta que $\hspace{0.1cm}\sigma^2\hspace{0.1cm}$ es desconocido.



Para ello vamos a apoyarnos en el **teorema de Gosset**  y en el **método pivotal**.



<br>

### Distribución t-student

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

<p style='margin-left:0.1em;'>

$\hspace{0.25cm}$ Dada una v.a.  $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$  la distribución t-student se define del siguiente modo:

$$\mathcal{X} \sim t_n \hspace{0.25cm}\Leftrightarrow\hspace{0.25cm} f_X(x) = \dfrac{\Gamma\left(\dfrac{n+1}{2}\right)}{\sqrt{n\cdot \pi \hspace{0.1cm}} \cdot \Gamma(n/2)} \cdot \left(1 + \dfrac{x^2}{n}\right)^{-1/2 \cdot (n+1)} \cdot I( x\in \mathbb{R} ) \\$$

</p>
 
</p></span>
</div>


Donde:

$\hspace{0.2cm} \Gamma$ es la función gamma.


<br>


<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

<p style='margin-left:0.1em;'>


$\hspace{0.25cm}$ **Propiedades** 

- $E[\mathcal{X}] = 0 \\$

- $Var[\mathcal{X}] = \dfrac{n}{n-2}\hspace{0.25cm}$ , si $\hspace{0.1cm} n>2 \\$

- Si $\hspace{0.2cm}\mathcal{Z} \sim N(0,1)\hspace{0.2cm}$ y $\hspace{0.2cm}\mathcal{X}\sim \chi_n^2\hspace{0.2cm}$, y además son **independientes** , entonces:

$$\dfrac{\mathcal{Z}}{\sqrt{\mathcal{X}/n}} \sim t_n$$

</p>
 
</p></span>
</div>


<br>

### Teorema de Gosset

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

<p style='margin-left:0.1em;'>

$\hspace{0.25cm}$ Dada una v.a. $\hspace{0.1cm}\mathcal{X}\sim N(\mu, \sigma^2)\hspace{0.1cm}$, y dada una m.a.s $\hspace{0.1cm}\mathcal{X}_1,...,\mathcal{X}_n\hspace{0.1cm}$ de $\hspace{0.1cm}\mathcal{X} \\$ 


$$\dfrac{\hspace{0.15cm} \overline{\mathcal{X}_n} - \mu \hspace{0.15cm}}{\sqrt{\dfrac{n}{n-1} S_n^2/n \hspace{0.1cm}} } \hspace{0.1cm}\sim\hspace{0.1cm} t_{n-1} \\$$

$\hspace{0.25cm}$ Donde:

- $\overline{\mathcal{X}_n} = \dfrac{1}{n} \cdot \sum_{i=1}^n \mathcal{X}_i \\$

- $S_n^2 = \dfrac{1}{n} \cdot \sum_{i=1}^n (\mathcal{X}_i - \overline{\mathcal{X}_n} )^2$

</p>
 
</p></span>
</div>

<br>


### Intervalo de confianza para la media con varianza desconocida

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

<p style='margin-left:0.1em;'>

$\hspace{0.25cm}$ La anterior cantidad:

$$\Upsilon(\mathcal{X}_1,...,\mathcal{X}_n, \mu) \hspace{0.1cm}=\hspace{0.1cm} \dfrac{\hspace{0.15cm} \overline{\mathcal{X}_n} - \mu \hspace{0.15cm}}{\sqrt{\dfrac{n}{n-1} S_n^2/n \hspace{0.1cm}} } \hspace{0.1cm}\sim\hspace{0.1cm} t_{n-1}$$


$\hspace{0.25cm}$ es una cantidad pivotal, puesto que contienen al parametro de interés, en este caso $\hspace{0.1cm} \theta = \mu\hspace{0.1cm}$, y su distribución de probabilidad es conocida y no depende de dicho parámetro, es una $\hspace{0.1cm} t_{n-1}$.


$\hspace{0.25cm}$ Siguiendo el método pivotal hay que encontrar los valores $\hspace{0.1cm} a,b \in \mathbb{R}\hspace{0.1cm}$ tales que: $\\[0.6cm]$




$$P\left( \hspace{0.1cm}a \hspace{0.1cm}< \hspace{0.1cm} \dfrac{\hspace{0.15cm} \overline{\mathcal{X}_n} - \mu \hspace{0.15cm}}{\sqrt{\dfrac{n}{n-1} S_n^2/n \hspace{0.1cm}} }  \hspace{0.1cm}<\hspace{0.1cm} b \hspace{0.1cm}\right) = 1-\alpha \\$$


 
$\hspace{0.25cm}$ Siguiendo los anteriores resultados: $\\[0.6cm]$


$$P\left( \hspace{0.1cm} a \hspace{0.1cm}<\hspace{0.1cm} \dfrac{\hspace{0.15cm} \overline{\mathcal{X}_n} - \mu \hspace{0.15cm}}{\sqrt{\dfrac{n}{n-1} S_n^2/n \hspace{0.1cm}} } \hspace{0.1cm} <\hspace{0.1cm} b\hspace{0.1cm} \right) \hspace{0.1cm}=\hspace{0.1cm} P\left( a < t_{n-1}  < b \right) \\$$



$\hspace{0.25cm}$ Teniendo en cuenta las propiedades de la distribución t-student: $\\[0.6cm]$

$$P\left( t_{1-\alpha/2} < t_{n-1}  < t_{\alpha/2} \right) = P\left( -t_{\alpha/2} < t_{n-1}  < t_{\alpha/2} \right) = 1-\alpha \\[0.6cm]$$
 
 
$\hspace{0.25cm}$ Donde:


$\hspace{0.25cm}$ $t_{\alpha/2}\hspace{0.1cm}$ es el valor tal que $\hspace{0.1cm}P(t_{n-1}>t_{\alpha/2}) = \alpha/2 \\$ 



$\hspace{0.25cm}$ Por tanto: $\\[0.6cm]$


$$P\left( \hspace{0.1cm} -t^{n-1}_{\alpha/2} \hspace{0.1cm}<\hspace{0.1cm}   \dfrac{\hspace{0.15cm} \overline{\mathcal{X}_n} - \mu \hspace{0.15cm}}{\sqrt{\dfrac{n}{n-1} S_n^2/n \hspace{0.1cm}} }  \hspace{0.1cm} <\hspace{0.1cm} t^{n-1}_{\alpha/2}\hspace{0.1cm} \right) \hspace{0.1cm} = \hspace{0.1cm} 1-\alpha \\[1cm]$$


</p>
 
</p></span>
</div>


<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

<p style='margin-left:0.1em;'>
 

$\hspace{0.25cm}$ Siguiendo el método pivotal ahora tenemos que aislar el parametro $\theta=\mu$

Operando un poco se llega a lo siguiente: $\\[0.6cm]$


$$P\left( \hspace{0.1cm} \overline{\mathcal{X}_n} -t^{n-1}_{\alpha/2} \cdot \sqrt{\dfrac{n}{n-1} S_n^2/n}\hspace{0.1cm}<\hspace{0.1cm}  \mu \hspace{0.1cm} <\hspace{0.1cm} \overline{\mathcal{X}_n} + t^{n-1}_{\alpha/2}\cdot \sqrt{\dfrac{n}{n-1} S_n^2/n}\hspace{0.1cm} \right) \hspace{0.1cm}=\hspace{0.1cm} 1-\alpha \\[0.7cm]$$



</p>
 
</p></span>
</div>



<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

<p style='margin-left:0.1em;'>
 

$\hspace{0.25cm}$ Por tanto, tenemos el siguiente intervalo de confianza a un nivel  $\hspace{0.1cm} 1-\alpha\hspace{0.1cm}$ para el parametro $\hspace{0.1cm} \mu \hspace{0.1cm}\\$

$$IC(\mu)_{1-\alpha} \hspace{0.1cm}=\hspace{0.1cm} \left[ \hspace{0.1cm} \overline{\mathcal{X}_n} \hspace{0.1cm}\pm\hspace{0.1cm} t^{n-1}_{\alpha/2} \cdot \sqrt{\dfrac{n}{n-1} S_n^2/n} \hspace{0.1cm} \right] \\[0.9cm]$$


$\hspace{0.25cm}$ Dada una muestra $\hspace{0.1cm}X=(x_1,...,x_n)\hspace{0.1cm}$ de la v.a. $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ , tenemos la siguiente realización del intervalo de confianza: $\\[0.6cm]$


$$IC(\mu)_{1-\alpha} \hspace{0.1cm}=\hspace{0.1cm} \left[ \hspace{0.1cm} \overline{X} \hspace{0.1cm}\pm\hspace{0.1cm} t^{n-1}_{\alpha/2} \cdot \sqrt{\dfrac{n}{n-1} S(X)^2/n} \hspace{0.1cm} \right]$$


$\hspace{0.25cm}$ Donde:

- $\hspace{0.1cm} \overline{X} = \dfrac{1}{n} \sum_{i=1}^n x_i$

- $\hspace{0.1cm} S(X)^2 = \dfrac{1}{n} \sum_{i=1}^n (x_i - \overline{X})^2$

</p>
 
</p></span>
</div>

<br>


### Intervalo de confianza para la media con varianza desconocida en `Python`

Definimos una función que toma como argumentos una variable cuantitativa, y un nivel de significación (alpha), y te devuelve como salida el intervalo de confianza para la media poblacional de la variable, y además también devuelve la estimación puntual de dicha  media poblacional.

```python
def CI_Mean(Variable , alpha=0.05):

    n = len(Variable)

    t_alpha_medios = scipy.stats.t.ppf( 1 - alpha/2 , df=n-1)

    X_mean = Variable.mean()

    X_cuasi_var = Variable.std()**2 
    
    # std() esta definida por defecto como la cuasi-desviacion-tipica

    L1 = X_mean - t_alpha_medios * np.sqrt(X_cuasi_var/n)

    L2 = X_mean + t_alpha_medios * np.sqrt(X_cuasi_var/n)

    interval = [L1 , L2]

    return interval , X_mean
```
<br>

Aplicamos la función anterior sobre la variable `Price` :

```python
Price = Data.price
```


```python
intervalo , media = CI_Mean(Variable=Price , alpha=0.05)
```


```python
intervalo
```




    [1954927.6388481215, 2216732.108133506]




```python
media
```




    2085829.8734908137








<br>

## Intervalo de confianza para la varianza
 


Una variable cuantitativa  $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ puede modelarse como una variable aleatoria $\hspace{0.1cm}N(\mu , \sigma^2)\hspace{0.1cm}$, donde $\hspace{0.1cm}\mu=E[\mathcal{X}]\hspace{0.1cm}$ y $\hspace{0.1cm}\sigma^2 = Var(\mathcal{X})$, que pueden interpretarse respectivamente como la media y varianza poblacional de la variable $\hspace{0.1cm}\mathcal{X}$

Queremos obtener un intervalo de confianza para $\hspace{0.1cm} \sigma^2$.



Para ello vamos a apoyarnos en el **teorema de Fisher**  y en el **método pivotal**.



<br>

### Distribución chi-cuadrado

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

<p style='margin-left:0.1em;'>

$\hspace{0.25cm}$ Dada una v.a.  $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$  la distribución chi-cuadrado se define del siguiente modo:

$$\mathcal{X} \sim \chi^2_n \hspace{0.25cm} \Leftrightarrow \hspace{0.25cm} f_\mathcal{X}(x) = \dfrac{1}{\Gamma(n/2)} \cdot (1/2)^{n/2} \cdot x^{n/2 - 1}\cdot e^{-x/2} \cdot I(x>0)\\$$

</p>
 
</p></span>
</div>


<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

<p style='margin-left:0.1em;'>

$\hspace{0.25cm}$ **Propiedades** 

- $\chi^2_n = Gamma(\alpha = n/2 \hspace{0.1cm},\hspace{0.1cm} \lambda = 1/2) \\$

- Si $\mathcal{Z}\sim N(0,1) \Rightarrow \mathcal{Z}^2 \sim \chi_1^2 \\$

- Si $\mathcal{Z}_1 , ..., \mathcal{Z}_n$ es una m.a.s de $\mathcal{Z} \sim N(0,1)$ $\Rightarrow \mathcal{Z}_1^2 + ... + \mathcal{Z}_n^2 \sim \chi_n^2 \\$

- $E[\mathcal{X}] = \dfrac{\alpha}{\lambda} = \dfrac{n/2}{1/2} = n \\$

- $Var[\mathcal{X}] = \dfrac{\alpha}{\lambda^2}=\dfrac{n/2}{(1/2)^2} = 2n \\$

- $\chi^2_n + \chi^2_r = \chi^2_{n+r} \hspace{0.2cm}$ , siempre que sean independientes los sumandos.


</p>
 
</p></span>
</div>


<br>

### Teorema de Fisher

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

<p style='margin-left:0.1em;'>

$\hspace{0.25cm}$ Dada una v.a. $\hspace{0.1cm}\mathcal{X}\sim N(\mu, \sigma^2)\hspace{0.1cm}$, y dada una m.a.s $\hspace{0.1cm}\mathcal{X}_1,...,\mathcal{X}_n\hspace{0.1cm}$ de $\hspace{0.1cm}\mathcal{X}$ 


$$\dfrac{\hspace{0.15cm} n\cdot S^2_n \hspace{0.15cm}}{ \sigma^2 \hspace{0.1cm} } \hspace{0.1cm}\sim\hspace{0.1cm} \chi^2_{n-1}$$


$\hspace{0.25cm}$ Donde:

- $\overline{\mathcal{X}_n} = \dfrac{1}{n} \cdot \sum_{i=1}^n \mathcal{X}_i \\$

- $S_n^2 = \dfrac{1}{n} \cdot \sum_{i=1}^n (\mathcal{X}_i - \overline{\mathcal{X}_n} )^2$

</p>
 
</p></span>
</div>

<br>


### Intervalo de confianza para la varianza

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

<p style='margin-left:0.1em;'>

$\hspace{0.25cm}$ La anterior cantidad:

$$\Upsilon(\mathcal{X}_1,...,\mathcal{X}_n, \sigma^2) \hspace{0.1cm}=\hspace{0.1cm} \dfrac{\hspace{0.15cm} n\cdot S^2_n \hspace{0.15cm}}{ \sigma^2 \hspace{0.1cm} } \hspace{0.1cm}\sim\hspace{0.1cm} \chi^2_{n-1}$$


$\hspace{0.25cm}$ es una cantidad pivotal, puesto que contienen al parametro de interés, en este caso $\hspace{0.1cm} \theta = \sigma^2 \hspace{0.1cm}$, y su distribución de probabilidad es conocida y no depende de dicho parámetro, es una $\hspace{0.1cm} \chi^2_{n-1}$.


$\hspace{0.25cm}$ Siguiendo el método pivotal hay que encontrar los valores $\hspace{0.1cm} a,b \in \mathbb{R}\hspace{0.1cm}$ tales que:




$$P\left( \hspace{0.1cm}a \hspace{0.1cm}< \hspace{0.1cm}  \dfrac{\hspace{0.15cm} n\cdot S^2_n \hspace{0.15cm}}{ \sigma^2 \hspace{0.1cm} } \hspace{0.1cm}<\hspace{0.1cm} b \hspace{0.1cm}\right) = 1-\alpha \\$$


 
$\hspace{0.25cm}$ Siguiendo los anteriores resultados:


$$P\left( \hspace{0.1cm} a \hspace{0.1cm}<\hspace{0.1cm}  \dfrac{\hspace{0.15cm} n\cdot S^2_n \hspace{0.15cm}}{ \sigma^2 \hspace{0.1cm} } \hspace{0.1cm} <\hspace{0.1cm} b\hspace{0.1cm} \right) \hspace{0.1cm}=\hspace{0.1cm} P\left( a < \chi^2_{n-1}  < b \right) \\$$



$\hspace{0.25cm}$Teniendo en cuenta las propiedades de la distribución chi-cuadrado: $\\[0.6cm]$

$$P\left( \chi^{n-1}_{1-\alpha/2} < \chi^2_{n-1}  < \chi^{n-1}_{\alpha/2} \right)  = 1-\alpha \\$$
 
 
$\hspace{0.25cm}$ Donde:


$\chi^{n-1}_{\alpha/2}\hspace{0.1cm}$ es el valor tal que $\hspace{0.1cm}P(\chi^2_{n-1}> \chi^{n-1}_{\alpha/2}) = \alpha/2 \\$ 



$\hspace{0.25cm}$ Por tanto:


$$P\left( \hspace{0.1cm}  \chi^{n-1}_{1-\alpha/2} \hspace{0.1cm}<\hspace{0.1cm}  \dfrac{\hspace{0.15cm} n\cdot S^2_n \hspace{0.15cm}}{ \sigma^2 \hspace{0.1cm} }  \hspace{0.1cm} <\hspace{0.1cm} \chi^{n-1}_{\alpha/2}\hspace{0.1cm} \right) \hspace{0.1cm} = \hspace{0.1cm} 1-\alpha \\[1cm]$$

</p>
 
</p></span>
</div>



<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

<p style='margin-left:0.1em;'>

$\hspace{0.25cm}$ Siguiendo el método pivotal ahora tenemos que aislar el parametro $\hspace{0.1cm}\theta=\sigma^2\hspace{0.1cm}$ 

Operando un poco se llega a lo siguiente: $\\[0.6cm]$


$$P\left( \hspace{0.1cm}  \dfrac{n \cdot S_n^2}{\chi^{n-1}_{\alpha/2}}   \hspace{0.1cm}<\hspace{0.1cm}  \sigma^2 \hspace{0.1cm} <\hspace{0.1cm}      \dfrac{n \cdot S_n^2}{\chi^{n-1}_{1-\alpha/2}}        \hspace{0.1cm} \right) \hspace{0.1cm}=\hspace{0.1cm} 1-\alpha \\[0.7cm]$$



</p>
 
</p></span>
</div>


<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

<p style='margin-left:0.1em;'>
 

$\hspace{0.25cm}$ Por tanto, tenemos el siguiente intervalo de confianza a un nivel  $\hspace{0.1cm} 1-\alpha\hspace{0.1cm}$ para el parametro $\hspace{0.1cm} \sigma^2  \hspace{0.1cm}\\$

$$IC(\sigma^2)_{1-\alpha} \hspace{0.1cm}=\hspace{0.1cm} \left[ \hspace{0.1cm} \dfrac{n \cdot S_n^2}{\chi^{n-1}_{\alpha/2}} \hspace{0.15cm},\hspace{0.15cm} \dfrac{n \cdot S_n^2}{\chi^{n-1}_{1-\alpha/2}}     \hspace{0.1cm} \right] \\[0.9cm]$$


$\hspace{0.25cm}$ Dada una muestra $\hspace{0.1cm}X=(x_1,...,x_n)\hspace{0.1cm}$ de la v.a. $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ , tenemos la siguiente realización del intervalo de confianza: $\\[0.6cm]$


$$IC(\sigma^2)_{1-\alpha} \hspace{0.1cm}=\hspace{0.1cm} \left[ \hspace{0.1cm} \dfrac{n \cdot S(X)^2}{\chi^{n-1}_{\alpha/2}} \hspace{0.15cm},\hspace{0.15cm} \dfrac{n \cdot  S(X)^2}{\chi^{n-1}_{1-\alpha/2}}     \hspace{0.1cm} \right] \\[0.9cm]$$

$\hspace{0.25cm}$ Donde:


- $\hspace{0.1cm} S(X)^2 = \dfrac{1}{n} \sum_{i=1}^n (x_i - \overline{X})^2$


</p>
 
</p></span>
</div>

 

<br>


### Intervalo de confianza para la varianza en `Python`


Definimos una función que toma como argumentos una variable cuantitativa, y un nivel de significación (alpha), y te devuelve como salida el intervalo de confianza para la varianza poblacional de la variable, y además también devuelve la estimación puntual de dicha  varianza poblacional.

```python
def CI_Variance(Variable , alpha=0.05):

    n = len(Variable)

    chi_alpha_medios = scipy.stats.chi2.ppf( 1 - alpha/2 , df=n-1)

    chi_1_alpha_medios = scipy.stats.chi2.ppf(alpha/2 , df=n-1)

    X_cuasi_var = Variable.std()**2 

    X_var = ( (n-1)/n )*X_cuasi_var
    
    # std() esta definida por defecto como la cuasi-desviacion-tipica

    L1 =  (n*X_var) / chi_alpha_medios

    L2 = (n*X_var) / chi_1_alpha_medios

    interval = [L1 , L2]

    return interval , X_var 
```

<br>

Aplicamos la función anterior a la variable `Price` , antes definida:
```python
intervalo , varianza = CI_Variance(Variable=Price , alpha=0.05)
```


```python
intervalo
```




    [7972419086050.057, 9052729794266.29]





```python
varianza
```




    8482279037221.85


 



 
 
<br>
 

 
## Intervalo de confianza para la diferencia de medias con muestras independientes y varianzas desconocidas pero iguales




Un par de variables cuantitativas  $\hspace{0.1cm}\mathcal{X}_1\hspace{0.1cm}$ , $\hspace{0.1cm}\mathcal{X}_2\hspace{0.1cm}$ pueden modelarse como un par de variables aleatorias **independientes** con distribución $\hspace{0.1cm} N(\mu_1 , \sigma_1^2)\hspace{0.1cm}$ y $\hspace{0.1cm}N(\mu_2 , \sigma_2^2)\hspace{0.1cm}$, respectivamente. 

Donde $\hspace{0.1cm}\mu_1=E[\mathcal{X}_1]\hspace{0.15cm}$ , $\hspace{0.15cm}\mu_2=E[\mathcal{X}_2]\hspace{0.15cm}$, $\hspace{0.15cm}\sigma_1^2=Var(\mathcal{X}_1)\hspace{0.15cm}$ y $\hspace{0.15cm}\sigma_2^2 = Var(\mathcal{X}_2)\hspace{0.15cm}$, que pueden interpretarse como la media y varianza poblacional de las variables $\hspace{0.15cm}\mathcal{X}_1\hspace{0.15cm}$ y $\hspace{0.15cm}\mathcal{X}_2\hspace{0.15cm}$, respectivamente.

Queremos obtener un intervalo de confianza para $\hspace{0.1cm} \mu_1 - \mu_2 \hspace{0.1cm}$, teniendo en cuenta que $\hspace{0.1cm}\sigma_1^2\hspace{0.1cm}$ y $\hspace{0.1cm}\sigma_2^2\hspace{0.1cm}$ son desconocidas pero iguales $\hspace{0.15cm}\sigma_1^2=\sigma_2^2\hspace{0.15cm}$, y además que  las v.a's $\hspace{0.15cm}\mathcal{X}_1 \sim N(\mu_1,\sigma_1^2)\hspace{0.15cm}$ y $\hspace{0.15cm}\mathcal{X}_2\sim N(\mu_2 , \sigma_2^2)\hspace{0.15cm}$ son **independientes**.



Para ello vamos a apoyarnos en el **teorema de Gosset aumentado con varianzas iguales**  y en el **método pivotal**.

<br>
 
**Observación:**

En la práctica el par de variables $\hspace{0.1cm}\mathcal{X}_1\hspace{0.1cm}$ , $\hspace{0.1cm}\mathcal{X}_2\hspace{0.1cm}$ son una sola variable cuantitativa pero medida sobre dos muestras diferentes.


<br>

### Teorema de Gosset aumentado con varianzas iguales

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

<p style='margin-left:0.1em;'>

$\hspace{0.25cm}$ Dada un par de v.a's **independientes** $\hspace{0.1cm}\mathcal{X}_1\sim N(\mu_1, \sigma_1^2)\hspace{0.1cm}$ y $\hspace{0.1cm}\mathcal{X}_2\sim N(\mu_2, \sigma_2^2)\hspace{0.15cm}$, con $\hspace{0.15cm}\sigma_1^2=\sigma_2^2\hspace{0.15cm}$, y dada un par de m.a.s $\hspace{0.1cm}\mathcal{X}_{11},...,\mathcal{X}_{n_1 1}\hspace{0.1cm}$ y $\hspace{0.1cm}\mathcal{X}_{12},...,\mathcal{X}_{n_2 2}\hspace{0.1cm}$ de $\hspace{0.1cm}\mathcal{X}_1\hspace{0.1cm}$ y  $\hspace{0.1cm}\mathcal{X}_2\hspace{0.15cm}$, respectivamente. $\\[0.6cm]$


$$\dfrac{\hspace{0.15cm} \overline{\mathcal{X}}_1 - \overline{\mathcal{X}}_2 - (\mu_1 - \mu_2) \hspace{0.15cm}}{ \sqrt{S_p^2 \cdot \left(\dfrac{1}{n_1} + \dfrac{1}{n_2}\right)} \hspace{0.1cm} } \hspace{0.1cm}\sim\hspace{0.1cm} t_{n_1 - n_2 -2} \\$$




$\hspace{0.25cm}$ Donde:

- $\overline{\mathcal{X}_j} = \dfrac{1}{n_j} \cdot \sum_{i=1}^{n_j} \mathcal{X}_{ij} \hspace{0.25cm} , \hspace{0.25cm} j \in \lbrace 1, 2\rbrace \\$


- $S_j^2 = \dfrac{1}{n_j} \cdot \sum_{i=1}^{n_j} (\mathcal{X}_{ij} - \overline{\mathcal{X}_j})^2 \hspace{0.25cm} , \hspace{0.25cm} j \in \lbrace 1, 2\rbrace\\$

- $S_p^2 = \dfrac{(n_1-1)\cdot S_1^2 + (n_2-1)\cdot S_2^2}{n_1 + n_2 -2} \\$

</p>
 
</p></span>
</div>

<br>


### Intervalo de confianza para la diferencia de medias con varianzas desconocidas pero iguales

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

<p style='margin-left:0.1em;'>

$\hspace{0.25cm}$ La anterior cantidad:

$$\Upsilon(\mathcal{X}_1,...,\mathcal{X}_n, \sigma^2) \hspace{0.1cm}=\hspace{0.1cm} \dfrac{\hspace{0.15cm} \overline{\mathcal{X}}_1 - \overline{\mathcal{X}}_2 - (\mu_1 - \mu_2) \hspace{0.15cm}}{ \sqrt{S_p^2 \cdot \left(\dfrac{1}{n_1} + \dfrac{1}{n_2}\right)} \hspace{0.1cm} } \hspace{0.1cm}\sim\hspace{0.1cm} t_{n_1 +  n_2 -2}$$


$\hspace{0.25cm}$ es una cantidad pivotal, puesto que contienen al parametro de interés, en este caso $\hspace{0.1cm} \theta = \mu_1 - \mu_2 \hspace{0.15cm}$, y su distribución de probabilidad es conocida y no depende de dicho parámetro, es una $\hspace{0.1cm} t_{n_1 + n_2 -2}$.


$\hspace{0.25cm}$ Siguiendo el método pivotal hay que encontrar los valores $\hspace{0.1cm} a,b \in \mathbb{R}\hspace{0.1cm}$ tales que: $\\[0.6cm]$




$$P\left( \hspace{0.1cm} a \hspace{0.1cm} < \hspace{0.1cm}  \dfrac{\hspace{0.15cm} \overline{\mathcal{X}}_1 - \overline{\mathcal{X}}_2 - (\mu_1 - \mu_2) \hspace{0.15cm}}{ \sqrt{S_p^2 \cdot \left(\dfrac{1}{n_1} + \dfrac{1}{n_2}\right)}}<\hspace{0.1cm} b \hspace{0.1cm}\right) = 1-\alpha \\[1cm]$$


 
$\hspace{0.25cm}$ Siguiendo los anteriores resultados: $\\[0.6cm]$


$$P\left( \hspace{0.1cm} a \hspace{0.1cm}<\hspace{0.1cm}  \dfrac{\hspace{0.15cm} \overline{\mathcal{X}}_1 - \overline{\mathcal{X}}_2 - (\mu_1 - \mu_2) \hspace{0.15cm}}{ \sqrt{S_p^2 \cdot \left(\dfrac{1}{n_1} + \dfrac{1}{n_2}\right)}} \hspace{0.1cm} <\hspace{0.1cm} b\hspace{0.1cm} \right) \hspace{0.1cm}=\hspace{0.1cm} P\left( a \hspace{0.1cm} <\hspace{0.1cm} t_{n_1 +n_2 -2}  \hspace{0.1cm} <\hspace{0.1cm} b \right) \\$$



$\hspace{0.25cm}$ Teniendo en cuenta las propiedades de la distribución t-student: $\\[0.6cm]$

$$P\left( t^{n_1+n_2-2}_{1-\alpha/2} \hspace{0.1cm}<\hspace{0.1cm} t_{n_1+n_2-2}  \hspace{0.1cm}<\hspace{0.1cm} t^{n_1+n_2-2}_{\alpha/2} \right)= P\left( -t^{n_1+n_2-2}_{\alpha/2} \hspace{0.1cm}<\hspace{0.1cm} t_{n_1+n_2-2}  \hspace{0.1cm}<\hspace{0.1cm} t^{n_1+n_2-2}_{\alpha/2} \right)  = 1-\alpha \\$$
 
 
$\hspace{0.25cm}$ Donde:


$\hspace{0.35cm}$ $t^{n_1+n_2-2}_{\alpha/2}\hspace{0.1cm}$ es el valor tal que $\hspace{0.1cm}P(t_{n_1+n_2-2}> t^{n_1+n_2-2}_{\alpha/2}) = \alpha/2 \\$ 



$\hspace{0.25cm}$ Por tanto: $\\[0.6cm]$


$$P\left( \hspace{0.1cm}  t^{n_1+n_2-2}_{1-\alpha/2} \hspace{0.1cm}<\hspace{0.1cm}  \dfrac{\hspace{0.15cm} \overline{\mathcal{X}}_1 - \overline{\mathcal{X}}_2 - (\mu_1 - \mu_2) \hspace{0.15cm}}{ \sqrt{S_p^2 \cdot \left(\dfrac{1}{n_1} + \dfrac{1}{n_2}\right)}}  \hspace{0.1cm} <\hspace{0.1cm} t^{n_1+n_2-2}_{\alpha/2}\hspace{0.1cm} \right) \hspace{0.1cm} = \hspace{0.1cm} 1-\alpha \\[1cm]$$


</p>
 
</p></span>
</div>



<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

<p style='margin-left:0.1em;'>

$\hspace{0.25cm}$ Siguiendo el método pivotal ahora tenemos que aislar el parametro $\hspace{0.1cm}\theta=\mu_1 - \mu_2 \hspace{0.1cm}$. Operando un poco se llega a lo siguiente: $\\[0.6cm]$


$$P\left( \hspace{0.1cm}    \overline{\mathcal{X}}_1 - \overline{\mathcal{X}}_2 -  t^{n_1+n_2-2}_{\alpha/2} \cdot \sqrt{S_p^2 \cdot \left(\dfrac{1}{n_1} + \dfrac{1}{n_2}\right)}  \hspace{0.1cm}<\hspace{0.1cm}  \mu_1 - \mu_2 \hspace{0.1cm} <\hspace{0.1cm}      \overline{\mathcal{X}}_1 - \overline{\mathcal{X}}_2 +  t^{n_1+n_2-2}_{\alpha/2} \cdot \sqrt{S_p^2 \cdot \left(\dfrac{1}{n_1} + \dfrac{1}{n_2}\right)}         \hspace{0.1cm} \right) \hspace{0.1cm}=\hspace{0.1cm} 1-\alpha \\[0.7cm]$$


</p>
 
</p></span>
</div>
 
 
 
<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

<p style='margin-left:0.1em;'>

$\hspace{0.25cm}$ Por tanto, tenemos el siguiente intervalo de confianza a un nivel  $\hspace{0.1cm} 1-\alpha\hspace{0.1cm}$ para el parametro $\hspace{0.1cm} \mu_1 - \mu_2  \hspace{0.1cm}\\$

$$IC(\mu_1 - \mu_2)_{1-\alpha} \hspace{0.1cm}=\hspace{0.1cm} \left[ \hspace{0.1cm} \overline{\mathcal{X}}_1 - \overline{\mathcal{X}}_2 \pm  t^{n_1+n_2-2}_{\alpha/2} \cdot \sqrt{S_p^2 \cdot \left(\dfrac{1}{n_1} + \dfrac{1}{n_2}\right)}      \hspace{0.1cm} \right] \\[0.9cm]$$


$\hspace{0.25cm}$ Dadas dos muestras $\hspace{0.1cm}X_1=(x_{11},...,x_{n1})\hspace{0.1cm}$ y $\hspace{0.1cm}X_2=(x_{12},...,x_{n2})\hspace{0.1cm}$ de las v.a's $\hspace{0.1cm}\mathcal{X}_1\hspace{0.1cm}$ y $\hspace{0.1cm}\mathcal{X}_2\hspace{0.1cm}$  , respectivamente,  tenemos la siguiente realización del intervalo de confianza: $\\[0.6cm]$


$$IC(\mu_1 - \mu_2)_{1-\alpha} \hspace{0.1cm}=\hspace{0.1cm} \left[ \hspace{0.1cm} \overline{X}_1 - \overline{X}_2 \pm  t^{n_1+n_2-2}_{\alpha/2} \cdot \sqrt{S(X)_p^2 \cdot \left(\dfrac{1}{n_1} + \dfrac{1}{n_2}\right)}    \hspace{0.1cm} \right] \\[0.9cm]$$

$\hspace{0.25cm}$ Donde:

- $\hspace{0.1cm} \overline{X}_j = \dfrac{1}{n} \cdot \sum_{i=1}^n x_{ij} \hspace{0.25cm} , \hspace{0.25cm} j \in \lbrace 1, 2\rbrace \\$


- $\hspace{0.1cm} S(X_j)^2 = \dfrac{1}{n}\cdot \sum_{i=1}^n (x_{ij}- \overline{X}_j)^2 \hspace{0.25cm} , \hspace{0.25cm} j \in \lbrace 1, 2\rbrace \\$


- $\hspace{0.1cm} S(X)_p^2 = \dfrac{(n_1-1)\cdot S(X_1)^2 + (n_2-1)\cdot S(X_2)^2}{n_1 + n_2 -2}$


</p>
 
</p></span>
</div>


<br>




## Intervalo de confianza para la diferencia de medias con muestras independientes y varianzas desconocidas pero no necesariamente iguales



Un par de variables cuantitativas  $\hspace{0.1cm}\mathcal{X}_1\hspace{0.1cm}$ , $\hspace{0.1cm}\mathcal{X}_2\hspace{0.1cm}$ pueden modelarse como un par de variables aleatorias **independientes** con distribución $\hspace{0.1cm} N(\mu_1 , \sigma_1^2)\hspace{0.1cm}$ y $\hspace{0.1cm}N(\mu_2 , \sigma_2^2)\hspace{0.1cm}$, respectivamente. 

Donde $\hspace{0.1cm}\mu_1=E[\mathcal{X}_1]\hspace{0.15cm}$ , $\hspace{0.15cm}\mu_2=E[\mathcal{X}_2]\hspace{0.15cm}$, $\hspace{0.15cm}\sigma_1^2=Var(\mathcal{X}_1)\hspace{0.15cm}$ y $\hspace{0.15cm}\sigma_2^2 = Var(\mathcal{X}_2)\hspace{0.15cm}$, que pueden interpretarse como la media y varianza poblacional de las variables $\hspace{0.15cm}\mathcal{X}_1\hspace{0.15cm}$ y $\hspace{0.15cm}\mathcal{X}_2\hspace{0.15cm}$, respectivamente.

Queremos obtener un intervalo de confianza para $\hspace{0.1cm} \mu_1 - \mu_2 \hspace{0.1cm}$, teniendo en cuenta que $\hspace{0.1cm}\sigma_1^2\hspace{0.1cm}$ y $\hspace{0.1cm}\sigma_2^2\hspace{0.1cm}$ son desconocidas y no necesariamente iguales, y además que  las v.a's $\hspace{0.15cm}\mathcal{X}_1 \sim N(\mu_1,\sigma_1^2)\hspace{0.15cm}$ y $\hspace{0.15cm}\mathcal{X}_2\sim N(\mu_2 , \sigma_2^2)\hspace{0.15cm}$ son **independientes**.



Para ello vamos a apoyarnos en el **teorema de Gosset aumentado con varianzas no necesariamente iguales**  y en el **método pivotal**.

<br>
 
**Observación:**

En la práctica el par de variables $\hspace{0.1cm}\mathcal{X}_1\hspace{0.1cm}$ , $\hspace{0.1cm}\mathcal{X}_2\hspace{0.1cm}$ son una sola variable cuantitativa pero medida sobre dos muestras diferentes.






### Teorema de Gosset aumentado con varianzas no necesariamente iguales

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

<p style='margin-left:0.1em;'>

$\hspace{0.25cm}$ Dada un par de v.a's **independientes** $\hspace{0.1cm}\mathcal{X}_1\sim N(\mu_1, \sigma_1^2)\hspace{0.1cm}$ y $\hspace{0.1cm}\mathcal{X}_2\sim N(\mu_2, \sigma_2^2)\hspace{0.15cm}$,  y dada un par de m.a.s $\hspace{0.1cm}\mathcal{X}_{11},...,\mathcal{X}_{n_1 1}\hspace{0.1cm}$ y $\hspace{0.1cm}\mathcal{X}_{12},...,\mathcal{X}_{n_2 2}\hspace{0.1cm}$ de $\hspace{0.1cm}\mathcal{X}_1\hspace{0.1cm}$ y  $\hspace{0.1cm}\mathcal{X}_2\hspace{0.15cm}$, respectivamente. $\\[0.6cm]$


$$\dfrac{\hspace{0.15cm} \overline{\mathcal{X}}_1 - \overline{\mathcal{X}}_2 - (\mu_1 - \mu_2) \hspace{0.15cm}}{ \sqrt{\dfrac{S_1^2}{n_1} + \dfrac{S_2^2}{n_2}} \hspace{0.1cm} } \hspace{0.1cm}\sim\hspace{0.1cm} t_{v} \\$$




$\hspace{0.25cm}$ Con grados de libertad definidos como:


$$v=\dfrac{(S_1^2 / n_1 + S_2^2/n_2 )^2}{\dfrac{(S_1^2 / n_1)^2}{n_1-1} + \dfrac{( S_2^2/n_2 )^2}{n_2-1}} \\$$




$\hspace{0.25cm}$ Donde:

- $\overline{\mathcal{X}_j} = \dfrac{1}{n_j} \cdot \sum_{i=1}^{n_j} \mathcal{X}_{ij} \hspace{0.25cm} , \hspace{0.25cm} j \in \lbrace 1, 2\rbrace \\$


- $S_j^2 = \dfrac{1}{n_j} \cdot \sum_{i=1}^{n_j} (\mathcal{X}_{ij} - \overline{\mathcal{X}_j})^2 \hspace{0.25cm} , \hspace{0.25cm} j \in \lbrace 1, 2\rbrace\\$



</p>
 
</p></span>
</div>

<br>


### Intervalo de confianza para la diferencia de medias con varianzas desconocidas y no necesariamente iguales

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

<p style='margin-left:0.1em;'>

$\hspace{0.25cm}$ La anterior cantidad:

$$\Upsilon(\mathcal{X}_1,...,\mathcal{X}_n, \sigma^2) \hspace{0.1cm}=\hspace{0.1cm} \dfrac{\hspace{0.15cm} \overline{\mathcal{X}}_1 - \overline{\mathcal{X}}_2 - (\mu_1 - \mu_2) \hspace{0.15cm}}{ \sqrt{ \dfrac{S_1^2}{n_1} + \dfrac{s_2^2}{n_2} } \hspace{0.1cm} } \hspace{0.1cm}\sim\hspace{0.1cm} t_{v}$$


$\hspace{0.25cm}$ es una cantidad pivotal, puesto que contienen al parametro de interés, en este caso $\hspace{0.1cm} \theta = \mu_1 - \mu_2 \hspace{0.15cm}$, y su distribución de probabilidad es conocida y no depende de dicho parámetro, es una $\hspace{0.1cm} t_{v}$.


$\hspace{0.25cm}$ Siguiendo el método pivotal hay que encontrar los valores $\hspace{0.1cm} a,b \in \mathbb{R}\hspace{0.1cm}$ tales que: $\\[0.6cm]$




$$P\left( \hspace{0.1cm} a \hspace{0.1cm} < \hspace{0.1cm}  \dfrac{\hspace{0.15cm} \overline{\mathcal{X}}_1 - \overline{\mathcal{X}}_2 - (\mu_1 - \mu_2) \hspace{0.15cm}}{ \sqrt{ \dfrac{S_1^2}{n_1} + \dfrac{S_2^2}{n_2} }}<\hspace{0.1cm} b \hspace{0.1cm}\right) = 1-\alpha \\[1cm]$$


 
$\hspace{0.25cm}$ Siguiendo los anteriores resultados: $\\[0.6cm]$


$$P\left( \hspace{0.1cm} a \hspace{0.1cm}<\hspace{0.1cm}  \dfrac{\hspace{0.15cm} \overline{\mathcal{X}}_1 - \overline{\mathcal{X}}_2 - (\mu_1 - \mu_2) \hspace{0.15cm}}{ \sqrt{ \dfrac{S_1^2}{n_1} + \dfrac{S_2^2}{n_2} }} \hspace{0.1cm} <\hspace{0.1cm} b\hspace{0.1cm} \right) \hspace{0.1cm}=\hspace{0.1cm} P\left( a \hspace{0.1cm} <\hspace{0.1cm} t_{v}  \hspace{0.1cm} <\hspace{0.1cm} b \right) \\$$



$\hspace{0.25cm}$ Teniendo en cuenta las propiedades de la distribución t-student: $\\[0.6cm]$

$$P\left( t^{v}_{1-\alpha/2} \hspace{0.1cm}<\hspace{0.1cm} t_{v}  \hspace{0.1cm}<\hspace{0.1cm} t^{v}_{\alpha/2} \right)= P\left( -t^{v}_{\alpha/2} \hspace{0.1cm}<\hspace{0.1cm} t_{v}  \hspace{0.1cm}<\hspace{0.1cm} t^{v}_{\alpha/2} \right)  = 1-\alpha \\$$
 
 
$\hspace{0.25cm}$ Donde:


$\hspace{0.35cm}$ $t^{v}_{\alpha/2}\hspace{0.1cm}$ es el valor tal que $\hspace{0.1cm}P(t_{v}> t^{v}_{\alpha/2}) = \alpha/2 \\$ 



$\hspace{0.25cm}$ Por tanto: $\\[0.6cm]$


$$P\left( \hspace{0.1cm}  t^{v}_{1-\alpha/2} \hspace{0.1cm}<\hspace{0.1cm}  \dfrac{\hspace{0.15cm} \overline{\mathcal{X}}_1 - \overline{\mathcal{X}}_2 - (\mu_1 - \mu_2) \hspace{0.15cm}}{ \sqrt{\dfrac{S_1^2}{n_1} + \dfrac{S_2^2}{n_2} }}  \hspace{0.1cm} <\hspace{0.1cm} t^{v}_{\alpha/2}\hspace{0.1cm} \right) \hspace{0.1cm} = \hspace{0.1cm} 1-\alpha \\[1cm]$$


</p>
 
</p></span>
</div>



<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

<p style='margin-left:0.1em;'>

$\hspace{0.25cm}$ Siguiendo el método pivotal ahora tenemos que aislar el parametro $\hspace{0.1cm}\theta=\mu_1 - \mu_2 \hspace{0.1cm}$. Operando un poco se llega a lo siguiente: $\\[0.6cm]$


$$P\left( \hspace{0.1cm}    \overline{\mathcal{X}}_1 - \overline{\mathcal{X}}_2 -  t^{v}_{\alpha/2} \cdot \sqrt{ \dfrac{S_1^2}{n_1} + \dfrac{S_2^2}{n_2} }  \hspace{0.1cm}<\hspace{0.1cm}  \mu_1 - \mu_2 \hspace{0.1cm} <\hspace{0.1cm}      \overline{\mathcal{X}}_1 - \overline{\mathcal{X}}_2 +  t^{v}_{\alpha/2} \cdot \sqrt{ \dfrac{S_1^2}{n_1} + \dfrac{S_2^2}{n_2} }         \hspace{0.1cm} \right) \hspace{0.1cm}=\hspace{0.1cm} 1-\alpha \\[0.7cm]$$


</p>
 
</p></span>
</div>
 
 
 
<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

<p style='margin-left:0.1em;'>

$\hspace{0.25cm}$ Por tanto, tenemos el siguiente intervalo de confianza a un nivel  $\hspace{0.1cm} 1-\alpha\hspace{0.1cm}$ para el parametro $\hspace{0.1cm} \mu_1 - \mu_2  \hspace{0.1cm}\\$

$$IC(\mu_1 - \mu_2)_{1-\alpha} \hspace{0.1cm}=\hspace{0.1cm} \left[ \hspace{0.1cm} \overline{\mathcal{X}}_1 - \overline{\mathcal{X}}_2 \pm  t^{v}_{\alpha/2} \cdot \sqrt{\dfrac{S_1^2}{n_1} + \dfrac{S_2^2}{n_2} }      \hspace{0.1cm} \right] \\[0.9cm]$$


$\hspace{0.25cm}$ Dadas dos muestras $\hspace{0.1cm}X_1=(x_{11},...,x_{n1})\hspace{0.1cm}$ y $\hspace{0.1cm}X_2=(x_{12},...,x_{n2})\hspace{0.1cm}$ de las v.a's $\hspace{0.1cm}\mathcal{X}_1\hspace{0.1cm}$ y $\hspace{0.1cm}\mathcal{X}_2\hspace{0.1cm}$  , respectivamente,  tenemos la siguiente realización del intervalo de confianza: $\\[0.6cm]$


$$IC(\mu_1 - \mu_2)_{1-\alpha} \hspace{0.1cm}=\hspace{0.1cm} \left[ \hspace{0.1cm} \overline{X}_1 - \overline{X}_2 \pm  t^{v}_{\alpha/2} \cdot \sqrt{ \dfrac{S_1^2}{n_1} + \dfrac{S_2^2}{n_2} }    \hspace{0.1cm} \right] \\[0.9cm]$$

$\hspace{0.25cm}$ Donde:

- $\hspace{0.1cm} \overline{X}_j = \dfrac{1}{n} \cdot \sum_{i=1}^n x_{ij} \hspace{0.25cm} , \hspace{0.25cm} j \in \lbrace 1, 2\rbrace \\$


- $\hspace{0.1cm} S(X_j)^2 = \dfrac{1}{n}\cdot \sum_{i=1}^n (x_{ij}- \overline{X}_j)^2 \hspace{0.25cm} , \hspace{0.25cm} j \in \lbrace 1, 2\rbrace \\$


 

</p>
 
</p></span>
</div>

<br>

 


### Intervalo de confianza para la diferencia de medias con muestras independientes y  varianzas desconocidas y  no necesariamente iguales en `Python` 



Definimos una función que toma como argumentos dos variables cuantitativas, que deben ser realmente las mediciones de una misma variable sobre dos muestras diferentes, y un nivel de significación (alpha), y te devuelve como salida el intervalo de confianza para la diferencia de medias poblacionales de las variables, y además también devuelve la estimación puntual de dicha diferencia de medias poblacionales.

```python
def CI_Mean_Diference(Variable1 , Variable2 , alpha=0.05):

    X1 = Variable1
    X2 = Variable2

    n1 = len(X1) 
    n2 = len(X2)   

    X1_mean = X1.mean()
    X2_mean = X2.mean()

    X1_cuasi_var = X1.std()**2 
    X2_cuasi_var = X2.std()**2 

    X1_var = ( (n1-1)/n1 )*X1_cuasi_var
    X2_var = ( (n2-1)/n2 )*X2_cuasi_var

 
    v = ( X1_var/n1 + X2_var/n2 )**2 / ( (X1_var/n1)**2 / (n1-1)  + (X2_var/n2)**2 / (n2-1)  )

    t_alpha_medios = scipy.stats.chi.ppf( 1 - alpha/2 , df=v)
  

    L1 =  (X1_mean - X2_mean) - t_alpha_medios * np.sqrt(X1_var/n1 + X2_var/n2)

    L2 =  (X1_mean - X2_mean) + t_alpha_medios * np.sqrt(X1_var/n1 + X2_var/n2)

    interval = [L1 , L2]

    return interval , (X1_mean - X2_mean) 
```

<br>

Obtenemos dos nuevas variables como las mediciones de la variable `Price` para aquellas viviendas que son de baja y alta calidad, respectivamente:

```python
Price_Qualiti_0 = Data.loc[ Data.quality_recode == 0 , 'price']

Price_Qualiti_3 = Data.loc[ Data.quality_recode == 3 , 'price']
```

Aplicamos la función sobre las variables que acabamos de definir:

```python
intervalo , diferencia_medias = CI_Mean_Diference(Price_Qualiti_0 , Price_Qualiti_3 , alpha=0.05)
```


```python
intervalo
```




    [-3705736.666041189, 7244538.893238536]




```python
diferencia_medias
```




    1769401.1135986734










<br>

## Intervalo de confianza para la diferencia de medias con muestras dependientes (pareadas)


Un par de variables cuantitativas  $\hspace{0.1cm}\mathcal{X}_1\hspace{0.1cm}$ y $\hspace{0.1cm}\mathcal{X}_2\hspace{0.1cm}$ pueden modelarse como un par de variables aleatorias **no necesariamente independientes** $\hspace{0.1cm} N(\mu_1 , \sigma_1^2)\hspace{0.1cm}$ y $\hspace{0.1cm}N(\mu_2 , \sigma_2^2)\hspace{0.1cm}$, donde $\hspace{0.1cm}\mu_1=E[\mathcal{X}_1]\hspace{0.1cm}$ , $\hspace{0.1cm}\mu_2=E[\mathcal{X}_2]\hspace{0.1cm}$, $\hspace{0.1cm}\sigma_1^2=E[\mathcal{X}_1]\hspace{0.1cm}$ y $\hspace{0.1cm}\sigma_2^2 = Var(\mathcal{X}_2)$, que pueden interpretarse respectivamente como la media y varianza poblacional de las variables $\hspace{0.1cm}\mathcal{X}_1\hspace{0.1cm}$ y $\hspace{0.1cm}\mathcal{X}_2$

Queremos obtener un intervalo de confianza para $\hspace{0.1cm} \mu_1 - \mu_2 \hspace{0.1cm}$, teniendo en cuenta que $\hspace{0.1cm}\sigma_1^2\hspace{0.1cm}$ y $\hspace{0.1cm}\sigma_2^2\hspace{0.1cm}$ son desconocidas y las v.a. $\hspace{0.1cm}\mathcal{X}_1 \sim N(\mu_1 , \sigma_1^2) \hspace{0.1cm}$  y $\hspace{0.1cm}\mathcal{X}_2\sim N(\mu_2, \sigma_2^2)\hspace{0.1cm}$ **no son independientes**.



Para ello vamos a apoyarnos en el **teorema de Gosset** y en el **método pivotal**.


 
**Observación:**

En la práctica el par de variables $\hspace{0.1cm}\mathcal{X}_1\hspace{0.1cm}$ , $\hspace{0.1cm}\mathcal{X}_2\hspace{0.1cm}$ son una sola variable cuantitativa pero medida sobre una misma muestra, tras alterar alguna de las condiciones que definen a los individuos de la muestra, por ejemplo, tras aplicarles un tratamiento.

<br>

### Teorema de Gosset

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

<p style='margin-left:0.1em;'>
 
$\hspace{0.25cm}$ Tenemos dos v.a's **no necesariamente independientes** $\hspace{0.1cm}\mathcal{X}_1 \sim N(\mu_1 , \sigma_1^2) \hspace{0.1cm}$  y $\hspace{0.1cm}\mathcal{X}_2\sim N(\mu_2, \sigma_2^2)\hspace{0.1cm}$ .

$\hspace{0.25cm}$ Tenemos una m.a.s $\hspace{0.1cm}\mathcal{X}_{11},...,\mathcal{X}_{n1}\hspace{0.1cm}$ de $\hspace{0.1cm}\mathcal{X}_{1}\hspace{0.1cm}$
y otra m.a.s. $\hspace{0.1cm}\mathcal{X}_{12},...,\mathcal{X}_{n2}\hspace{0.1cm}$ de $\hspace{0.1cm}\mathcal{X}_{2}\hspace{0.1cm}$ , donde $\hspace{0.1cm}n_1=n_2=n \\$



$\hspace{0.25cm}$ Utilizando las propiedades de la distribución Normal se tiene  para todo $\hspace{0.2cm}i \in \lbrace 1,...,n \rbrace$ lo siguiente: $\\[0.5cm]$

$\hspace{0.35cm}$ Sea $\hspace{0.2cm} \mathcal{D}_i = \mathcal{X}_{i1} -\mathcal{X}_{i2}\hspace{0.2cm}$ , entonces: $\\[0.5cm]$

$$\mathcal{D}_i \sim N(\mu_\mathcal{D} , \sigma_\mathcal{D}^2)$$

$\hspace{0.25cm}$ Donde:

- $E[\mathcal{D}_i] = E[\mathcal{X}_{i1} -\mathcal{X}_{i2}] = E[ N(\mu_1, \sigma_1^2) - N(\mu_2, \sigma_2^2)] =   E[ N(\mu_1, \sigma_1^2)] - E[ N(\mu_2, \sigma_2^2)] = \mu_1 - \mu_2 = \mu_D \\$

- $Var(\mathcal{D}_i) = Var[\mathcal{X}_{i1} -\mathcal{X}_{i2}] = Var[ N(\mu_1, \sigma_1^2) - N(\mu_2, \sigma_2^2)]  =  Var[ N(\mu_1, \sigma_1^2)] - Var[ N(\mu_2, \sigma_2^2)] - 2\cdot Cov(N(\mu_1, \sigma_1^2) , N(\mu_2, \sigma_2^2)) = \\ = \sigma_1^2 - \sigma_2^2 - 2\cdot \sigma_{12} = \sigma_D^2$


</p>
 
</p></span>
</div>




<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

<p style='margin-left:0.1em;'>


$\hspace{0.25cm}$ $\mathcal{D}_1,...,\mathcal{D}_n\hspace{0.1cm}$ es una m.a.s de $\hspace{0.15cm}\mathcal{D}\sim N(\mu_\mathcal{D} , \sigma_\mathcal{D}^2)\hspace{0.15cm}$, por lo que puede aplicarse le el teorema de Gosset, obteniendose que:

$$\dfrac{\overline{\mathcal{D}} - \mu_\mathcal{D}}{\sqrt{\dfrac{n}{n-1}\cdot S_\mathcal{D}^2 / n}} \sim t_{n-1}$$


$\hspace{0.25cm}$ Donde:

- $\overline{\mathcal{D}} = \dfrac{1}{n} \sum_{i=1}^n \mathcal{D}_i \\$

- $S_\mathcal{D}^2 = \dfrac{1}{n} \sum_{i=1}^n (\mathcal{D}_i - \overline{\mathcal{D}})^2$

</p>
 
</p></span>
</div>


<br>


### Intervalo de confianza para la diferencia de medias con muestras dependientes pareadas

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

<p style='margin-left:0.1em;'>


$\hspace{0.25cm}$ La anterior cantidad:

$$\Upsilon(\mathcal{X}_1,...,\mathcal{X}_n, \mu_\mathcal{D}) \hspace{0.1cm}=\hspace{0.1cm} \dfrac{\overline{\mathcal{D}} - \mu_\mathcal{D}}{\sqrt{\dfrac{n}{n-1}\cdot S_\mathcal{D}^2 / n}} \sim t_{n-1}$$


$\hspace{0.25cm}$ es una cantidad pivotal, puesto que contienen al parametro de interés, en este caso $\hspace{0.1cm} \theta = \mu_\mathcal{D} = \mu_1 - \mu_2  \hspace{0.15cm}$, y su distribución de probabilidad es conocida y no depende de dicho parámetro, es una $\hspace{0.1cm} t_{n-1}$.


$\hspace{0.25cm}$ Siguiendo el método pivotal hay que encontrar los valores $\hspace{0.1cm} a,b \in \mathbb{R}\hspace{0.1cm}$ tales que:




$$P\left( \hspace{0.1cm} a \hspace{0.1cm} < \hspace{0.1cm}   \dfrac{\overline{\mathcal{D}} - \mu_\mathcal{D}}{\sqrt{\dfrac{n}{n-1}\cdot S_\mathcal{D}^2 / n}} \hspace{0.1cm} <\hspace{0.1cm} b \hspace{0.1cm}\right) = 1-\alpha \\$$


 
$\hspace{0.25cm}$ Siguiendo los anteriores resultados:


$$P\left( \hspace{0.1cm} a \hspace{0.1cm}<\hspace{0.1cm}  \dfrac{\overline{\mathcal{D}} - \mu_\mathcal{D}}{\sqrt{\dfrac{n}{n-1}\cdot S_\mathcal{D}^2 / n}} \hspace{0.1cm} <\hspace{0.1cm} b\hspace{0.1cm} \right) \hspace{0.1cm}=\hspace{0.1cm} P\left( a < t_{n  -1}  < b \right) \\$$



$\hspace{0.25cm}$ Teniendo en cuenta las propiedades de la distribución t-student: $\\[0.6cm]$

$$P\left( t^{n-1}_{1-\alpha/2} < t_{n-1}  < t^{n-1}_{\alpha/2} \right) = P\left( -t^{n-1}_{\alpha/2} < t_{n-1}  < t^{n-1}_{\alpha/2} \right) = 1-\alpha \\$$
 
 
$\hspace{0.25cm}$ Donde:


$\hspace{0.35cm} t^{n-1}_{\alpha/2}\hspace{0.1cm}$ es el valor tal que $\hspace{0.1cm}P(t_{n-1}> t^{n-1}_{\alpha/2}) = \alpha/2 \\$ 



$\hspace{0.25cm}$ Por tanto:


$$P\left( \hspace{0.1cm}  -t^{n-1}_{\alpha/2} \hspace{0.1cm}<\hspace{0.1cm}  
\dfrac{\overline{\mathcal{D}} - \mu_\mathcal{D}}{\sqrt{\dfrac{n}{n-1}\cdot S_\mathcal{D}^2 / n}}
\hspace{0.1cm} <\hspace{0.1cm} t^{n-1}_{\alpha/2}\hspace{0.1cm} \right) \hspace{0.1cm} = \hspace{0.1cm} 1-\alpha \\[1cm]$$



</p>
 
</p></span>
</div>




<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

<p style='margin-left:0.1em;'>

$\hspace{0.25cm}$ Siguiendo el método pivotal ahora tenemos que aislar el parametro $\hspace{0.1cm}\theta=\mu_1 - \mu_2 \hspace{0.1cm}$

Operando un poco se llega a lo siguiente: $\\[0.6cm]$



$$P\left( \hspace{0.1cm}    
\overline{\mathcal{D}} - t^{n-1}_{\alpha/2}\cdot \sqrt{\dfrac{n}{n-1}\cdot S_\mathcal{D}^2 / n}
\hspace{0.1cm}<\hspace{0.1cm}  \mu_1 - \mu_2 \hspace{0.1cm} <\hspace{0.1cm}      
\overline{\mathcal{D}} + t^{n-1}_{\alpha/2}\cdot \sqrt{\dfrac{n}{n-1}\cdot S_\mathcal{D}^2 / n}
\hspace{0.1cm} \right) \hspace{0.1cm}=\hspace{0.1cm} 1-\alpha \\[0.7cm]$$


</p>
 
</p></span>
</div>
 


<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

<p style='margin-left:0.1em;'>

$\hspace{0.25cm}$ Por tanto, tenemos el siguiente intervalo de confianza a un nivel  $\hspace{0.1cm} 1-\alpha\hspace{0.1cm}$ para el parametro $\hspace{0.1cm} \mu_\mathcal{D} = \mu_1 - \mu_2  \hspace{0.1cm}\\$

$$IC(\mu_1 - \mu_2)_{1-\alpha} \hspace{0.1cm}=\hspace{0.1cm} \left[ \hspace{0.1cm} \overline{\mathcal{D}} \pm t^{n-1}_{\alpha/2}\cdot \sqrt{\dfrac{n}{n-1}\cdot S_\mathcal{D}^2 / n}
     \hspace{0.1cm} \right] \\[0.9cm]$$


$\hspace{0.25cm}$ Dadas dos muestras $\hspace{0.1cm}X_1=(x_{11},...,x_{n1})\hspace{0.1cm}$ y $\hspace{0.1cm}X_2=(x_{12},...,x_{n2})\hspace{0.1cm}$ de las v.a's $\hspace{0.1cm}\mathcal{X}_1\hspace{0.1cm}$ y $\hspace{0.1cm}\mathcal{X}_2\hspace{0.1cm}$  , respectivamente,  entonces tenemos que $\hspace{0.1cm}D=(d_1,...,d_n)\hspace{0.1cm}$, con $\hspace{0.2cm}d_i = x_{i1}-x_{i2}\hspace{0.1cm}$, es una muestra de observaciones de la v.a. $\hspace{0.1cm}\mathcal{D}\hspace{0.1cm}$ , y con ello tenemos la siguiente realización del intervalo de confianza: $\\[0.6cm]$


$$IC(\mu_1 - \mu_2)_{1-\alpha} \hspace{0.1cm}=\hspace{0.1cm} \left[ \hspace{0.1cm} \overline{D} \pm t^{n-1}_{\alpha/2}\cdot \sqrt{\dfrac{n}{n-1}\cdot S(D)^2 / n}
   \hspace{0.1cm} \right] \\[0.9cm]$$

$\hspace{0.25cm}$ Donde:

- $\hspace{0.1cm} \overline{D} = \dfrac{1}{n} \cdot \sum_{i=1}^n d_{i}$


- $\hspace{0.1cm} S(D)^2 = \dfrac{1}{n}\cdot \sum_{i=1}^n (d_i - \overline{D})^2$

</p>
 
</p></span>
</div>

<br>

 
 

### Intervalo de confianza para la diferencia de medias con muestras dependientes (pareadas) en `Python` 


Definimos una función que toma como argumentos dos variables cuantitativas, que deben ser realmente las mediciones de una misma variable sobre una misma muestra o grupo en dos estados diferentes (antes y después de la aplicación de un tratamiento), y un nivel de significación (alpha), y te devuelve como salida el intervalo de confianza para la diferencia de medias poblacionales de las variables, y además también devuelve la estimación puntual de dicha diferencia de medias poblacionales.

```python
def CI_Mean_Diference_Paired(Variable1 , Variable2 , alpha=0.05):

    X1 = Variable1
    X2 = Variable2

    D = X1-X2

    n = len(D) 

    D_mean = D.mean()
 
    D_cuasi_var = D.std()**2 
 
    D_var = ( (n-1)/n )*D_cuasi_var
 
    t_alpha_medios = scipy.stats.chi.ppf( 1 - alpha/2 , df=n-1)

    L1 = D_mean - t_alpha_medios * np.sqrt((n/(n-1))*D_var/n)

    L2 = D_mean + t_alpha_medios * np.sqrt((n/(n-1))*D_var/n)

    interval = [L1 , L2]

    return interval , D_mean
```
<br>

Vamos a describir un escenario típico de muestras pareadas o dependientes.

Supongamos que se tiene un grupo de alumnos, los cuales se enfrentan a un examen de cierta materia antes y después de recibir clases de apoyo sobre dicha materia, y se recogen las notas obtenidas por cada uno de los 10 alumnos tanto antes como después.

```python
Nota_Examen_1 = np.array([4,6,6,7.5,6,3,5,6,8,5])

Nota_Examen_2 = np.array([5,7,6,7,8,4,5,6,7,9])
```

Aplicamos la funcón antes definida sobre estas variables:

```python
intervalo , diferencia_medias = CI_Mean_Diference_Paired(Nota_Examen_1 , Nota_Examen_2 , alpha=0.05)
```


    intervalo = [-2.632283321526545, 1.1322833215265453]

    diferencia_medias = -0.75







<br>
 
 
 
## Intervalo de confianza para el cociente de varianzas



Un par de variables cuantitativas  $\hspace{0.1cm}\mathcal{X}_1\hspace{0.1cm}$ y $\hspace{0.1cm}\mathcal{X}_2\hspace{0.1cm}$ pueden modelarse como    variables aleatorias **independientes** con distribuciones de probabilidad  $\hspace{0.1cm} N(\mu_1 , \sigma_1^2)\hspace{0.1cm}$ y $\hspace{0.1cm}N(\mu_2 , \sigma_2^2)\hspace{0.1cm}$, respectivamente.

Donde $\hspace{0.1cm}\mu_1=E[\mathcal{X}_1]\hspace{0.1cm}$ , $\hspace{0.1cm}\mu_2=E[\mathcal{X}_2]\hspace{0.1cm}$, $\hspace{0.1cm}\sigma_1^2=E[\mathcal{X}_1]\hspace{0.1cm}$ y $\hspace{0.1cm}\sigma_2^2 = Var(\mathcal{X}_2)\hspace{0.1cm}$  pueden interpretarse respectivamente como la media y varianza poblacional de las variables $\hspace{0.1cm}\mathcal{X}_1\hspace{0.1cm}$ y $\hspace{0.1cm}\mathcal{X}_2$

Queremos obtener un intervalo de confianza para $\hspace{0.1cm} \dfrac{\sigma_1^2}{\sigma_2^2} \hspace{0.1cm}$, teniendo en cuenta que $\hspace{0.1cm}\sigma_1^2\hspace{0.1cm}$ y $\hspace{0.1cm}\sigma_2^2\hspace{0.1cm}$ son desconocidas y no necesariamente iguales, y además las v.a's $\hspace{0.1cm}\mathcal{X}_1 \sim N(\mu_1,\sigma_1^2)\hspace{0.1cm}$ y $\hspace{0.1cm}\mathcal{X}_2\sim N(\mu_2 , \sigma_2^2)\hspace{0.1cm}$ son **independientes**.



Para ello vamos a apoyarnos en el **segundo teorema de Fisher**  y en el **método pivotal**.

<br>

 
**Observación:**

En la práctica el par de variables $\hspace{0.1cm}\mathcal{X}_1\hspace{0.1cm}$ , $\hspace{0.1cm}\mathcal{X}_2\hspace{0.1cm}$ son una sola variable cuantitativa pero medida sobre dos muestras diferentes. 

<br>

### Distribución F de Fisher


<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

$\hspace{0.25cm}$ Dada una v.a. $\hspace{0.1cm} \mathcal{X}\hspace{0.1cm}$, la distribución F de Fidher se define del siguiente modo:


$$\mathcal{X} \sim F(a,b) \hspace{0.2cm} \Leftrightarrow  \hspace{0.2cm}  f_\mathcal{X}(x) =\dfrac{\Gamma((a+b)/2)}{\Gamma(a/2) \cdot \Gamma(b/2)} \cdot (a/b)^{a/2} \cdot x^{a/2 -1} \cdot (1 + (a/b)\cdot x)^{-(a+b)/2}  \cdot I(x>0 ) \\$$


</p>
 
</p></span>
</div>



Donde: 

$\hspace{0.2cm} \Gamma$ es la función gamma.


<br>

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>


$\hspace{0.25cm}$ **Propiedades** 


- $E[\mathcal{X}] = \dfrac{b}{b-2} \\$

- $Var(\mathcal{X}) = \dfrac{2 \cdot b^2 \cdot (a+b-2)}{a\cdot (b-2)\cdot (b-4)} \\$

- $\dfrac{\chi^2_a / a }{\chi^2_b / b} \sim F_{a,b}$


</p>
 
</p></span>
</div>





<br>

### Segundo Teorema de Fisher

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

<p style='margin-left:0.1em;'>

$\hspace{0.25cm}$ Dadas un par de v.a's **independientes**  $\hspace{0.1cm}\mathcal{X}_1\sim N(\mu_1, \sigma_1^2)\hspace{0.1cm}$ y $\hspace{0.1cm}\mathcal{X}_2\sim N(\mu_2, \sigma_2^2)\hspace{0.2cm}$, y  las m.a.s $\hspace{0.2cm}\mathcal{X}_{11},...,\mathcal{X}_{n_11}\hspace{0.2cm}$ y $\hspace{0.2cm}\mathcal{X}_{12},...,\mathcal{X}_{n_22}\hspace{0.1cm}$ de $\hspace{0.1cm}\mathcal{X}_1\hspace{0.1cm}$ y  $\hspace{0.1cm}\mathcal{X}_2\hspace{0.1cm}$, respectivamente.

$\hspace{0.25cm}$ Se cumple lo siguiente: $\\[0.6cm]$


$$\dfrac{S_2^2 / \sigma_2^2}{S_1^2 / \sigma_1^2} \sim F_{n_2-1 , n_1-1}$$





$\hspace{0.25cm}$ Donde:


- $S_j^2 = \dfrac{1}{n_j} \cdot \sum_{i=1}^{n_j} (\mathcal{X}_{ij} - \overline{\mathcal{X}_j})^2 \hspace{0.25cm} , \hspace{0.25cm} j \in \lbrace 0 , 1 \rbrace \\$

 
- $\overline{\mathcal{X}_j} = \dfrac{1}{n_j} \cdot \sum_{i=1}^{n_j} \mathcal{X}_{ij} \hspace{0.25cm} , \hspace{0.25cm} j \in \lbrace 0 , 1 \rbrace$



</p>
 
</p></span>
</div>

<br>


### Intervalo de confianza para el cociente de varianzas

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

<p style='margin-left:0.1em;'>

$\hspace{0.25cm}$ La anterior cantidad:

$$\Upsilon(\mathcal{X}_1,...,\mathcal{X}_n, \sigma_1^2/\sigma_2^2) \hspace{0.1cm}=\hspace{0.1cm} \dfrac{S_2^2 / \sigma_2^2}{S_1^2 / \sigma_1^2} \sim F_{n_2-1 , n_1-1}$$


$\hspace{0.25cm}$ es una cantidad pivotal, puesto que contienen al parametro de interés, en este caso $\hspace{0.1cm} \theta = \sigma_1^2 / \sigma_2^2 \hspace{0.15cm}$, y su distribución de probabilidad es conocida y no depende de dicho parámetro, es una $\hspace{0.1cm} F_{n_2-1 , n_1-1}$.


$\hspace{0.25cm}$ Siguiendo el método pivotal hay que encontrar los valores $\hspace{0.1cm} a,b \in \mathbb{R}\hspace{0.1cm}$ tales que:




$$P\left( \hspace{0.1cm} a \hspace{0.1cm} < \hspace{0.1cm}  \dfrac{S_2^2 / \sigma_2^2}{S_1^2 / \sigma_1^2}  \hspace{0.1cm}<\hspace{0.1cm} b \hspace{0.1cm}\right) = 1-\alpha \\$$


 
$\hspace{0.25cm}$ Siguiendo los anteriores resultados:


$$P\left( \hspace{0.1cm} a \hspace{0.1cm}<\hspace{0.1cm}  \dfrac{S_2^2 / \sigma_2^2}{S_1^2 / \sigma_1^2} \hspace{0.1cm} <\hspace{0.1cm} b\hspace{0.1cm} \right) \hspace{0.1cm}=\hspace{0.1cm} P\left( a < F_{n_2-1 , n_1-1}  < b \right) \\$$



$\hspace{0.25cm}$ Teniendo en cuenta las propiedades de la distribución chi-cuadrado: $\\[0.6cm]$

$$P\left( F^{n_2-1 , n_1-1}_{1-\alpha/2} < F^{n_2-1 , n_1-1}  < F^{n_2-1 , n_1-1}_{\alpha/2} \right)  = 1-\alpha \\$$
 
 
$\hspace{0.25cm}$ Donde:


$\hspace{0.3cm} F^{n_2-1 , n_1-1}_{\alpha/2} \hspace{0.1cm}$ es el valor tal que $\hspace{0.1cm}P(F_{n_2-1 , n_1-1}> F^{n_2-1 , n_1-1}_{\alpha/2}) = \alpha/2 \\$ 



$\hspace{0.25cm}$ Por tanto:


$$P\left( \hspace{0.1cm}  F^{n_2-1 , n_1-1}_{1-\alpha/2} \hspace{0.1cm}<\hspace{0.1cm}  
\dfrac{S_2^2 / \sigma_2^2}{S_1^2 / \sigma_1^2}
\hspace{0.1cm} <\hspace{0.1cm} F^{n_2-1 , n_1-1}_{\alpha/2}\hspace{0.1cm} \right) \hspace{0.1cm} = \hspace{0.1cm} 1-\alpha \\[1cm]$$


</p>
 
</p></span>
</div>






<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

<p style='margin-left:0.1em;'>

$\hspace{0.25cm}$ Siguiendo el método pivotal ahora tenemos que aislar el parametro $\hspace{0.1cm}\theta=\sigma_1^2 / \sigma_2^2 \hspace{0.1cm}$ 

Operando un poco se llega a lo siguiente: $\\[0.6cm]$


$$P\left( \hspace{0.1cm}     \dfrac{S_1^2}{S_2^2} \cdot   F^{n_2-1 , n_1-1}_{1-\alpha/2} \hspace{0.1cm}<\hspace{0.1cm} \sigma_1^2/\sigma_2^2) \hspace{0.1cm} <\hspace{0.1cm}       \dfrac{S_1^2}{S_2^2} \cdot   F^{n_2-1 , n_1-1}_{\alpha/2}        \hspace{0.1cm} \right) \hspace{0.1cm}=\hspace{0.1cm} 1-\alpha \\[0.7cm]$$

</p>
 
</p></span>
</div>

 
 
 
 
 
 <div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

<p style='margin-left:0.1em;'>

$\hspace{0.25cm}$ Por tanto, tenemos el siguiente intervalo de confianza a un nivel  $\hspace{0.1cm} 1-\alpha\hspace{0.1cm}$ para el parametro $\hspace{0.1cm} \sigma_1^2/\sigma_2^2 \hspace{0.1cm}\\$

$$IC(\sigma_1^2/\sigma_2^2)_{1-\alpha} \hspace{0.1cm}=\hspace{0.1cm} \left[ \hspace{0.1cm} \dfrac{S_1^2}{S_2^2} \cdot   F^{n_2-1 , n_1-1}_{1-\alpha/2} \hspace{0.1cm} , \hspace{0.1cm}  \dfrac{S_1^2}{S_2^2} \cdot   F^{n_2-1 , n_1-1}_{\alpha/2}     \hspace{0.1cm} \right] \\[1cm]$$


$\hspace{0.25cm}$ Dadas dos muestras $\hspace{0.1cm}X_1=(x_{11},...,x_{n_11})\hspace{0.1cm}$ y $\hspace{0.1cm}X_2=(x_{12},...,x_{n_22})\hspace{0.1cm}$ de las v.a's $\hspace{0.1cm}\mathcal{X}_1\hspace{0.1cm}$ y $\hspace{0.1cm}\mathcal{X}_2\hspace{0.1cm}$  , respectivamente,  tenemos la siguiente realización del intervalo de confianza: $\\[0.6cm]$


$$IC(\sigma_1^2/\sigma_2^2)_{1-\alpha} \hspace{0.1cm}=\hspace{0.1cm} \left[ \hspace{0.1cm} \dfrac{S(X_1)^2}{S(X_2)^2} \cdot   F^{n_2-1 , n_1-1}_{1-\alpha/2} \hspace{0.1cm} , \hspace{0.1cm}  \dfrac{S(X_1)^2}{S(X_2)^2} \cdot   F^{n_2-1 , n_1-1}_{\alpha/2}     \hspace{0.1cm} \right] \\[0.9cm]$$

$\hspace{0.25cm}$ Donde:

- $\overline{X}_j = \dfrac{1}{n_j} \cdot \sum_{i=1}^{n_j} x_{ij} \hspace{0.25cm} , \hspace{0.25cm} j \in \lbrace 0 , 1 \rbrace$

- $S(X_j)^2 = \dfrac{1}{n_j}\cdot \sum_{i=1}^{n_j} (x_{ij}- \overline{X}_j)^2 \hspace{0.25cm} , \hspace{0.25cm} j \in \lbrace 0 , 1 \rbrace$

 


 
</p>
 
</p></span>
</div>

<br>

### Intervalo de confianza para el cociente de varianzas en `Python`

Definimos una función que toma como argumentos dos variables cuantitativas, que deben ser realmente las mediciones de una misma variable en dos muestras o grupos diferentes, y un nivel de significación (alpha), y te devuelve como salida el intervalo de confianza para el cociente de las varianzas poblacionales de las variables, y además también devuelve la estimación puntual de dicho cociente de varianzas poblacionales.

```python
def CI_Variance_Quotient(Variable1, Variable2, alpha=0.05):

    X1 = Variable1
    X2 = Variable2

    n1 = len(X1)
    n2 = len(X2)

    X1_cuasi_var = X1.std()**2 
    X2_cuasi_var = X2.std()**2 

    X1_var = ( (n1-1)/n1 )*X1_cuasi_var
    X2_var = ( (n2-1)/n2 )*X2_cuasi_var

    F_alpha_medios = scipy.stats.f.ppf( 1 - alpha/2 , dfn=n1, dfd=n2 )

    F_1_alpha_medios = scipy.stats.f.ppf( alpha/2 ,  dfn=n1, dfd=n2 )

    L1 =  (X1_var/X2_var)*F_1_alpha_medios

    L2 = (X1_var/X2_var)*F_alpha_medios

    interval = [L1 , L2]

    return interval , (X1_var/X2_var) 
```




Aplicamos la función a las variables `Price_Qualiti_0` y `Price_Qualiti_3`  definidas anteriormente:

```python
intervalo , cociente_varianzas = CI_Variance_Quotient(Price_Qualiti_0 , Price_Qualiti_3, alpha=0.05)
```


```python
intervalo
```




    [103.38012135091866, 226.6148066572665]




```python
cociente_varianzas
```




    151.59794710463066













<br>

  
## Intervalo de confianza para la diferencia de proporciones
 

Un par de variables **categoricas binarias**  $\hspace{0.1cm}\mathcal{X}_1\hspace{0.1cm}$ , $\hspace{0.1cm}\mathcal{X}_2\hspace{0.1cm}$ pueden modelarse como un par de variables aleatorias **independientes** $\hspace{0.1cm} Bernoulli(p_1)\hspace{0.1cm}$ y $\hspace{0.1cm}Bernoulli(p_2)\hspace{0.1cm}$, donde $\hspace{0.1cm}p_1=P(\mathcal{X}_1 = 1) =E[\mathcal{X}_1]\hspace{0.1cm}$ y $\hspace{0.1cm}p_2=P(\mathcal{X}_2=1)=E[\mathcal{X}_2]\hspace{0.1cm}$,  pueden interpretarse respectivamente como la proporción de individuos de la población para los que $\hspace{0.1cm}\mathcal{X}_1=1\hspace{0.1cm}$ y $\hspace{0.1cm}\mathcal{X}_2=1\hspace{0.1cm}$, respectivamente.


Queremos obtener un intervalo de confianza para $\hspace{0.1cm} p_1 - p_2 \hspace{0.1cm}$



Para ello vamos a apoyarnos en el **teorema de Moivre-Laplace**  y en el **método pivotal**.

<br>

**Observación:**

En la práctica el par de variables $\hspace{0.1cm}\mathcal{X}_1\hspace{0.1cm}$ , $\hspace{0.1cm}\mathcal{X}_2\hspace{0.1cm}$ son dos variables binarias diferentes medidas sobre una misma muestra.

<br>

### Teorema Moivre-Laplace

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

<p style='margin-left:0.1em;'>

$\hspace{0.25cm}$ Dadas un par de v.a's **independientes**  $\hspace{0.1cm}\mathcal{X}_1\sim Bernoulli(p_1)\hspace{0.1cm}$ y $\hspace{0.1cm}\mathcal{X}_2\sim Bernoulli(p_2)\hspace{0.1cm}$, y  las m.a.s $\hspace{0.1cm}\mathcal{X}_{11},...,\mathcal{X}_{n_1 1}\hspace{0.1cm}$ y $\hspace{0.1cm}\mathcal{X}_{12},...,\mathcal{X}_{n_2 2}\hspace{0.1cm}$ de $\hspace{0.1cm}\mathcal{X}_1$ y  $\hspace{0.1cm}\mathcal{X}_2$, respectivamente, se cumple lo siguiente:

$$\overline{\mathcal{X}_1} = \dfrac{1}{n_1} \cdot \sum_{i=1}^n \mathcal{X}_{i1} \hspace{0.15cm}\sim\hspace{0.15cm} Binomial(n,p_1)$$

$$\overline{\mathcal{X}_2} = \dfrac{1}{n_2} \cdot \sum_{i=1}^n \mathcal{X}_{i2} \hspace{0.15cm}\sim\hspace{0.15cm} Binomial(n,p_2)$$

$\hspace{0.25cm}$ Entonces:


$$E[ \overline{\mathcal{X}_1} - \overline{\mathcal{X}_2}  ] = p_1 - p_2 \\$$

$\hspace{0.25cm}$ Como las v.a. son mutuamente independientes :

$$Cov(\overline{\mathcal{X}_1} , \overline{\mathcal{X}_2}) = 0$$

$$Var(\overline{\mathcal{X}_1} - \overline{\mathcal{X}_2}) = Var(\overline{\mathcal{X}_1}) + Var(\overline{\mathcal{X}_2}) - 2Cov(\overline{\mathcal{X}_1} , \overline{\mathcal{X}_2}) = Var(\overline{\mathcal{X}_1}) + Var(\overline{\mathcal{X}_2}) = \dfrac{p_1(1-p_1)}{n_1} + \dfrac{p_2(1-p_2)}{n_2}\\$$

$\hspace{0.25cm}$ Por tanto, aplicando el TCL tenemos lo siguiente:


$$\dfrac{(\overline{\mathcal{X}_1} - \overline{\mathcal{X}_2}) - (p_1 - p_2)}{\sqrt{\dfrac{p_1(1-p_1)}{n_1} + \dfrac{p_2(1-p_2)}{n_2}}} \hspace{0.2cm}\underset{d}{\rightarrow}\hspace{0.2cm} N(0,1)$$


</p>
 
</p></span>
</div>
 
<br>


### Intervalo de confianza para la diferencia de proporciones

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

<p style='margin-left:0.1em;'>


$\hspace{0.25cm}$ La anterior cantidad:

$$\Upsilon(\mathcal{X}_1,...,\mathcal{X}_n, p_1-p_2) \hspace{0.1cm}=\hspace{0.1cm} \dfrac{(\overline{\mathcal{X}_1} - \overline{\mathcal{X}_2}) - (p_1 - p_2)}{\sqrt{\dfrac{p_1(1-p_1)}{n_1} + \dfrac{p_2(1-p_2)}{n_2}}} \hspace{0.15cm} \underset{d}{\rightarrow}\hspace{0.15cm} N(0,1)$$


$\hspace{0.25cm}$ es una cantidad pivotal, puesto que contienen al parametro de interés, en este caso $\hspace{0.1cm} \theta = p_1 - p_2 \hspace{0.15cm}$, y su distribución de probabilidad es conocida y no depende de dicho parámetro, es una $\hspace{0.1cm} N(0,1)$.


$\hspace{0.25cm}$ Siguiendo el método pivotal hay que encontrar los valores $\hspace{0.1cm} a,b \in \mathbb{R}\hspace{0.1cm}$ tales que:




$$P\left( \hspace{0.1cm} a \hspace{0.1cm} < \hspace{0.1cm}  \dfrac{(\overline{\mathcal{X}_1} - \overline{\mathcal{X}_2}) - (p_1 - p_2)}{\sqrt{\dfrac{p_1(1-p_1)}{n_1} + \dfrac{p_2(1-p_2)}{n_2}}}   \hspace{0.1cm}<\hspace{0.1cm} b \hspace{0.1cm}\right) = 1-\alpha \\[1cm]$$


 
$\hspace{0.25cm}$ Siguiendo los anteriores resultados:


$$P\left( \hspace{0.1cm} a \hspace{0.1cm}<\hspace{0.1cm}  \dfrac{(\overline{\mathcal{X}_1} - \overline{\mathcal{X}_2}) - (p_1 - p_2)}{\sqrt{\dfrac{p_1(1-p_1)}{n_1} + \dfrac{p_2(1-p_2)}{n_2}}}  \hspace{0.1cm} <\hspace{0.1cm} b\hspace{0.1cm} \right) \hspace{0.1cm}=\hspace{0.1cm} P\left( a \hspace{0.1cm}<\hspace{0.1cm} N(0,1) \hspace{0.1cm}<\hspace{0.1cm} b \right) \\[1cm]$$



$\hspace{0.25cm}$ Teniendo en cuenta las propiedades de la distribución normal: $\\[0.6cm]$

$$P\left( z_{1-\alpha/2} < N(0,1)  < z_{\alpha/2} \right)  = P\left( -z_{\alpha/2} < N(0,1)  < z_{\alpha/2} \right)  =1-\alpha \\$$
 
 
$\hspace{0.25cm}$ Donde:


$\hspace{0.35cm} z_{\alpha/2} \hspace{0.1cm}$ es el valor tal que $\hspace{0.1cm}P(N(0,1) > z_{\alpha/2}) = \alpha/2 \\[1cm]$ 



$\hspace{0.25cm}$ Por tanto:


$$P\left( \hspace{0.1cm}  -z_{\alpha/2} \hspace{0.1cm}<\hspace{0.1cm}  
\dfrac{(\overline{\mathcal{X}_1} - \overline{\mathcal{X}_2}) - (p_1 - p_2)}{\sqrt{\dfrac{p_1(1-p_1)}{n_1} + \dfrac{p_2(1-p_2)}{n_2}}}
\hspace{0.1cm} <\hspace{0.1cm} z_{\alpha/2}\hspace{0.1cm} \right) \hspace{0.1cm} = \hspace{0.1cm} 1-\alpha \\[1cm]$$



</p>
 
</p></span>
</div>




<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

<p style='margin-left:0.1em;'>


$\hspace{0.25cm}$ Siguiendo el método pivotal ahora tenemos que aislar el parametro $\hspace{0.1cm}\theta=p_1-p_2 \hspace{0.1cm}$. 

$\hspace{0.25cm}$ Operando un poco se llega a lo siguiente: $\\[0.6cm]$


$$P\left( \hspace{0.1cm}  (\overline{\mathcal{X}_1} - \overline{\mathcal{X}_2}) - z_{\alpha/2}\cdot \sqrt{\dfrac{p_1(1-p_1)}{n_1} + \dfrac{p_2(1-p_2)}{n_2}}
\hspace{0.1cm}<\hspace{0.1cm} p_1-p_2 \hspace{0.1cm} <\hspace{0.1cm}       
(\overline{\mathcal{X}_1} - \overline{\mathcal{X}_2}) + z_{\alpha/2}\cdot \sqrt{\dfrac{p_1(1-p_1)}{n_1} + \dfrac{p_2(1-p_2)}{n_2}}
\hspace{0.1cm} \right) \hspace{0.1cm}=\hspace{0.1cm} 1-\alpha \\[0.7cm]$$


$\hspace{0.25cm}$ Como en la práctica se desconocen $p_1$ y $p_2$ , para obtener un intervalo de confianza que pueda ser usado en la práctica debemos estimarlas en ambos lados de la desigualdad. Se estiman como $\overline{\mathcal{X}_1}$ y $\overline{\mathcal{X}_2}$ , respectivamente.
 


</p>
 
</p></span>
</div>




<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

<p style='margin-left:0.1em;'>


$\hspace{0.25cm}$ Por tanto, tenemos el siguiente intervalo de confianza a un nivel  $\hspace{0.1cm} 1-\alpha\hspace{0.1cm}$ para el parametro $\hspace{0.1cm} p_1 - p_2 \hspace{0.1cm}\\$

$$IC(p_1 - p_2)_{1-\alpha} \hspace{0.1cm}=\hspace{0.1cm} \left[ \hspace{0.1cm} (\overline{\mathcal{X}_1} - \overline{\mathcal{X}_2}) \pm z_{\alpha/2}\cdot \sqrt{\dfrac{\overline{\mathcal{X}_1}(1-\overline{\mathcal{X}_1})}{n_1} + \dfrac{\overline{\mathcal{X}_2}(1-\overline{\mathcal{X}_2})}{n_2}}     \hspace{0.1cm} \right] \\[1.1cm]$$


$\hspace{0.25cm}$ Dadas dos muestras $\hspace{0.1cm}X_1=(x_{11},...,x_{n_11})\hspace{0.1cm}$ y $\hspace{0.1cm}X_2=(x_{12},...,x_{n_22})\hspace{0.1cm}$ de las v.a's $\hspace{0.1cm}\mathcal{X}_1\hspace{0.1cm}$ y $\hspace{0.1cm}\mathcal{X}_2\hspace{0.1cm}$  , respectivamente,  tenemos la siguiente realización del intervalo de confianza: $\\[0.6cm]$


$$IC(p_1 - p_2)_{1-\alpha} \hspace{0.1cm}=\hspace{0.1cm} \left[ \hspace{0.1cm} (\overline{X}_1 - \overline{X}_2) \pm z_{\alpha/2}\cdot \sqrt{\dfrac{\overline{X}_1(1-\overline{X}_1)}{n_1} + \dfrac{\overline{X}_2(1-\overline{X}_2)}{n_2}}     \hspace{0.1cm} \right] \\[0.9cm]$$

$\hspace{0.25cm}$ Donde:


- $\overline{X}_j = \dfrac{1}{n_j} \cdot \sum_{i=1}^{n_j} x_{i1} \hspace{0.25cm} , \hspace{0.25cm} j \in \lbrace 1,...,n\rbrace$

 

</p>
 
</p></span>
</div>


<br>



### Intervalo de confianza para la diferencia de proporciones en `Python`


Definimos una función que toma como argumentos dos variables categóricas binarias , que deben estar codificada en formato estándar (0,1), y un nivel de significación (alpha) y te devuelve como salida el intervalo de confianza para la diferencia entre la proporción de individuos de la población tales que pertenecen a la categoría codificada como 1 en la primera variable y la misma proporción en base a la segunda variable, y además también devuelve la estimación puntual de dicha diferencia de proporciones.

```python
def CI_Proportion_Diference(Variable1, Variable2, alpha=0.05):

    X1 = Variable1
    X2 = Variable2

    X1_mean = X1.mean()
    X2_mean = X2.mean()

    n1 = len(X1)
    n2 = len(X2)

    z_alpha_medios = scipy.stats.norm.ppf( 1 - alpha/2, loc=0, scale=1)


    L1 =  (X1_mean-X2_mean) - z_alpha_medios*np.sqrt(X1_mean*(1-X1_mean)/n1 + X2_mean*(1-X2_mean)/n2)

    L2 =  (X1_mean-X2_mean) + z_alpha_medios*np.sqrt(X1_mean*(1-X1_mean)/n1 + X2_mean*(1-X2_mean)/n2)

    interval = [L1 , L2]

    return interval , (X1_mean-X2_mean)
```

<br>

Aplicamos la función sobre las variables `Quality_0` y `Quality_2` antes definidas:

```python
intervalo , diferencia_proporciones = CI_Proportion_Diference(Quality_0, Quality_2, alpha=0.05)
```


```python
intervalo
```




    [-0.5560366143605591, -0.5064305772404909]




```python
diferencia_proporciones
```




    -0.531233595800525







<br>


<br>


# Bibliografía

Rincón, L (2019). Una introducción a la estadística inferencia. Universidad Nacional Autónoma de México.

 Pintarelli, B. Intervalos de Confianza[Presentación de PowerPoint]. Universidad Nacional de La Plata.

