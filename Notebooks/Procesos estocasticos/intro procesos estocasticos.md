---
title: 'Introducción a los procesos estocásticos'
author: 'Fabio Scielzo Ortiz'
date: '30/12/22'
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


# Proceso estocástico  <a class="anchor" id="1"></a>

Sea $\hspace{0.1cm}\mathcal{X}_t\hspace{0.1cm}$ una variable aleatoria para cada $\hspace{0.1cm}t\in T$



Un proceso estocastico es un conjunto de v.a's $\hspace{0.1cm}\left\lbrace \hspace{0.1cm} \mathcal{X}_t \hspace{0.1cm}/\hspace{0.1cm} t \in T \hspace{0.1cm}\right\rbrace\hspace{0.1cm}$ tales que $\hspace{0.1cm}\hspace{0.1cm}\mathcal{X}_t \in S \subset \mathbb{R}$
 

Donde:

$T\hspace{0.1cm}$ es denominado **espacio parametral** y es el conjunto de los indices de las v.a's que definen el proceso estoccastico

$S\hspace{0.1cm}$ es denominado **espacio de estados** y es el campo de variación de las v.a's que definen al proceso estocastico.



Diremos que $\hspace{0.1cm}\lbrace \hspace{0.1cm} \mathcal{X}_t \in S  \hspace{0.1cm}/\hspace{0.1cm} t \in T \hspace{0.1cm} \rbrace\hspace{0.1cm}$ es un proceso estocastico con espacio parametral $\hspace{0.1cm}T\hspace{0.1cm}$ y espacio de estados $\hspace{0.1cm}S$

**Observación:**

$T$ generalmente se interpreta como instantes de tiempo, ya que una de las aplicaciones más fuertes de los procesos estocasticos es al modelado de series temporales.

De modo que:

$X_t$ es una v.a. que se suele usar para modelar el estado de un sistema en el momento del tiempo $t$, o bien para modelar una variable de interés (como el PIB o las precipitaciones de una región) en el momento o periodo $t$.

<br>


# Proceso estocástico discreto 

 $\hspace{0.1cm}\lbrace \hspace{0.1cm} \mathcal{X}_t \in S  \hspace{0.1cm}/\hspace{0.1cm} t \in T \hspace{0.1cm} \rbrace\hspace{0.1cm}$ es un proceso estocastico **discreto** si $\hspace{0.1cm}T\subset \lbrace 0,1,2,... \rbrace$



<br>

# Proceso estocastico continuo



 $\hspace{0.1cm}\lbrace \hspace{0.1cm} \mathcal{X}_t \in S  \hspace{0.1cm}/\hspace{0.1cm} t \in T \hspace{0.1cm} \rbrace\hspace{0.1cm}$ es un proceso estocástico **continuo** si $\hspace{0.1cm}T\subset [0, \infty)$


<br>

# Tipos de procesos estocasticos

## Proceso de ensayos independientes


$\hspace{0.1cm}\lbrace \hspace{0.1cm} \mathcal{X}_t \in S  \hspace{0.1cm}/\hspace{0.1cm} t \in T \hspace{0.1cm} \rbrace\hspace{0.1cm}$ es un proceso estocastico de ensayos independientes si las v.a's que lo definen son independientes.


<br>

## Proceso de Markov

Un proceso estocastico discreto $\hspace{0.1cm}\lbrace \hspace{0.1cm} \mathcal{X}_t \in S  \hspace{0.1cm}/\hspace{0.1cm} t \in \lbrace 0,1,2,... \hspace{0.1cm} \rbrace\hspace{0.1cm}$ es una proceso  de Markov si:



$$P(\mathcal{X}_{n+1} = x_{n+1}\hspace{0.1cm} |\hspace{0.1cm} \mathcal{X}_0 = x_0 ,..., \mathcal{X}_n =x_n) = P(\mathcal{X}_{n+1} = x_{n+1}\hspace{0.1cm} |\hspace{0.1cm} \mathcal{X}_n = x_n)$$


Donde: $\hspace{0.2cm} x_{t} \in S \hspace{0.2cm},\hspace{0.2cm} \forall\hspace{0.1cm} t \in \lbrace 0,1,...,n+1\rbrace$




Esta propiedad es conocida como propiedad de falta de memoria de Markov. Ya que implica que el estado futuro del sistema, $\mathcal{X}_{n+1}$ , solo depende del estado presente  $x_n$ y no de los estados pasados $x_0,...,x_{n-1}$

<br>


## Proceso de incrementos independientes


Un proceso estocastico continuo $\hspace{0.1cm}\lbrace \hspace{0.1cm} \mathcal{X}_t \in S  \hspace{0.1cm}/\hspace{0.1cm} t \geq 0 \rbrace\hspace{0.1cm}$ es una proceso  de incrementos independientes si:

Para toda serie de tiempos $t_1,t_2,t_3\geq 0 $ tales que $t_1 < t_2 < t_3$


$\mathcal{X}_{t_2} - \mathcal{X}_{t_1} , \mathcal{X}_{t_3} - \mathcal{X}_{t_2}$ son independientes


Esto quiere decir que los desplazamientos que tiene el proceso en los  intervalos de tiempo $[t_1 , t_2) , [t_2 , t_3)$ son independientes unos de otros, para todo $0 \leq t_1 < t_2 < t_3$.


<br>

## Procesos estrictamente estacionarios

Un proceso estocastico continuo $\hspace{0.1cm}\lbrace \hspace{0.1cm} \mathcal{X}_t \in S  \hspace{0.1cm}/\hspace{0.1cm} t \geq 0 \rbrace\hspace{0.1cm}$ es una proceso  estrictamente estacionario si:

Para todo $t \geq 0$ , la distribucion de probabilidad de $\mathcal{X}_{t}$ coincide con la de $\mathcal{X}_{t+h}$  , para cualquier $h>0$



Por tanto, para toda serie de tiempos $\hspace{0.1cm}t_1 , t_2,...,t_n$ 

$(\mathcal{X}_{t_1}, \mathcal{X}_{t_2},\dots ,\mathcal{X}_{t_n} )\hspace{0.1cm}$ es identicamente distribuido probabilisticamente que $\hspace{0.1cm}(\mathcal{X}_{t_1+h}, \mathcal{X}_{t_2+h},\dots ,\mathcal{X}_{t_n+h} )$






<br>



## Proceso con incrementos estacionarios


Un proceso estocastico continuo $\hspace{0.1cm}\lbrace \hspace{0.1cm} \mathcal{X}_t \in S  \hspace{0.1cm}/\hspace{0.1cm} t \geq 0 \rbrace\hspace{0.1cm}$ es una proceso  de incrementos estacionarios si:

Para todo par de tiempos  $\hspace{0.1cm}t_1,t_2 > 0\hspace{0.1cm}$ tales que $\hspace{0.1cm}t_1 < t_2$


$\mathcal{X}_{t_2} - \mathcal{X}_{t_1}\hspace{0.1cm}$ y $\hspace{0.1cm}\mathcal{X}_{t_2 + h} - \mathcal{X}_{t_1 + h}\hspace{0.1cm}$ son independientes, para cualquier $\hspace{0.1cm}h>0$

<br>

## Proceso Martingalas

Un proceso estocastico discreto $\hspace{0.1cm}\lbrace \hspace{0.1cm} \mathcal{X}_t \in S  \hspace{0.1cm}/\hspace{0.1cm} t \in \lbrace 0,1,2,... \hspace{0.1cm} \rbrace\hspace{0.1cm}$ es una proceso  de Martingalas si:



$$E(\mathcal{X}_{n+1} | X_0 = x_0 ,..., X_n = x_n) = x_n$$


Donde: $\hspace{0.2cm} x_{t} \in S \hspace{0.2cm},\hspace{0.2cm} \forall\hspace{0.1cm} t \in \lbrace 0,1,...,n+1\rbrace$



Esta propiedad es conocida como propiedad Martingala. Implica que el valor esperado del sistema en el futuro $\hspace{0.1cm}n+1\hspace{0.1cm}$ es el valor del sistema en el presente $\hspace{0.1cm}x_n$. En promedio el sistema no cambia de lo observado en el ultimo momento.


<br>

## Proceso de Levy

Un proceso estocastico continuo $\hspace{0.1cm}\lbrace \hspace{0.1cm} \mathcal{X}_t \in S  \hspace{0.1cm}/\hspace{0.1cm} t \geq 0 \rbrace\hspace{0.1cm}$ es una proceso  de Levy si es un proceso de uncrementos independientes y estacionarios.

Los procesos de Poisson y el movimiento Browniano son ejemplos de proceso de Levy.

<br>


## Procesos Gaussianos

Un proceso estocastico continuo $\hspace{0.1cm}\lbrace \hspace{0.1cm} \mathcal{X}_t \in S  \hspace{0.1cm}/\hspace{0.1cm} t \geq 0 \rbrace\hspace{0.1cm}$ es una proceso  Gaussiano si:


Para toda serie de tiempos $\hspace{0.1cm}t_1,...,t_n \geg 0$

$$(\mathcal{X}_{t_1}, \mathcal{X}_{t_2},...,\mathcal{X}_{t_n}) \sim NM(\mu , \Sigma)$$


Donde:

$NM(\mu , \Sigma)\hspace{0.1cm}$ denota al distribución de probabilidad Normal multivariante con vector de medias $\hspace{0.1cm}\mu\hspace{0.1cm}$ y matriz de covarianzas $\hspace{0.1cm}\Sigma$

