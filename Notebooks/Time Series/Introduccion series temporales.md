---
title: 'Introduction to Time Series'
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


$\hspace{0.3cm}$ **More articles:    $\hspace{0.1cm}$ [Estadistica4all](https://fabioscielzoortiz.github.io/Estadistica4all.github.io/)**

$\hspace{0.3cm}$ **Author:** $\hspace{0.1cm}$ [Fabio Scielzo Ortiz](http://estadistica4all.com/autores/autores.html)

$\hspace{0.3cm}$ **If you use this article, please quote it !!**

$\hspace{0.5cm}$ Scielzo Ortiz, F. (2022). Introducción a los intervalos de confianza.  http://estadistica4all.com/Articulos/Intervalos-de-confianza.html


</p>
 
</p></span>
</div>


***It's recommended to open the article on a computer or tablet.***
 
 
 
 
 <br>
 
 


# Introduction to stochastic processes  <a class="anchor" id="1"></a>


## Stochastic processes  


Let  $\hspace{0.1cm}\mathcal{X}_t\hspace{0.1cm}$ be a random variable (r.v.), for each $\hspace{0.1cm}t\in T$



A stochastic processes is a set of random variables $\hspace{0.1cm}\left\lbrace \hspace{0.1cm} \mathcal{X}_t \hspace{0.1cm}/\hspace{0.1cm} t \in T \hspace{0.1cm}\right\rbrace\hspace{0.1cm}$ such that $\hspace{0.1cm}\hspace{0.1cm}\mathcal{X}_t \in S \subset \mathbb{R}$
 

Where:

$T\hspace{0.1cm}$ is called **parameter space** and is the set of indices of the random variables that define the stochastic process.

$S\hspace{0.1cm}$ is called **states space** and is the variation field of the random variables thta define the stochastic process.



We will say that $\hspace{0.1cm}\lbrace \hspace{0.1cm} \mathcal{X}_t \in S  \hspace{0.1cm}/\hspace{0.1cm} t \in T \hspace{0.1cm} \rbrace\hspace{0.1cm}$ is a stochastic process with parameter space $\hspace{0.1cm}T\hspace{0.1cm}$ and states space $\hspace{0.1cm}S$


<br>

**Observation:**

$T\hspace{0.1cm}$ is generally interpreted as moments or periods of time, because one of the most important applications of stochastic processes is time series modeling.


Therefore:

$X_t\hspace{0.1cm}$ is a random variable ussually used to model the state of a system at time moment $t$, or to model a variable of interest at the moment or period $t$. 


<br>


## Discrete stochastic process  

 $\hspace{0.1cm}\lbrace \hspace{0.1cm} \mathcal{X}_t \in S  \hspace{0.1cm}/\hspace{0.1cm} t \in T \hspace{0.1cm} \rbrace\hspace{0.1cm}$  is a discrete stochastic process if $\hspace{0.1cm}T\subset \lbrace 0,1,2,... \rbrace$



<br>

## Continuous stochastic process



 $\hspace{0.1cm}\lbrace \hspace{0.1cm} \mathcal{X}_t \in S  \hspace{0.1cm}/\hspace{0.1cm} t \in T \hspace{0.1cm} \rbrace\hspace{0.1cm}$ is a continuous stochastic process if $\hspace{0.1cm}T\subset [0, \infty)$


<br>

## Types of stochastic processes

### Independent process


$\hspace{0.1cm}\lbrace \hspace{0.1cm} \mathcal{X}_t \in S  \hspace{0.1cm}/\hspace{0.1cm} t \in T \hspace{0.1cm} \rbrace\hspace{0.1cm}$ is a independient stochastic process if the random variables that define the process are independient.


<br>

### Markov process

Un proceso estocastico discreto $\hspace{0.1cm}\lbrace \hspace{0.1cm} \mathcal{X}_t \in S  \hspace{0.1cm}/\hspace{0.1cm} t \in \lbrace 0,1,2,... \hspace{0.1cm} \rbrace\hspace{0.1cm}$ is a Markov process if:



$$P(\mathcal{X}_{n+1} = x_{n+1}\hspace{0.1cm} |\hspace{0.1cm} \mathcal{X}_0 = x_0 ,..., \mathcal{X}_n =x_n) = P(\mathcal{X}_{n+1} = x_{n+1}\hspace{0.1cm} |\hspace{0.1cm} \mathcal{X}_n = x_n)$$


Where: $\hspace{0.2cm} x_{t} \in S \hspace{0.2cm},\hspace{0.2cm} \forall\hspace{0.1cm} t \in \lbrace 0,1,...,n+1\rbrace$



This property is known as the memoryless Markov property. Because it implies that the future state of the system, $\mathcal{X}_{n+1}$ , only depends on the present state $x_n$ and does not depend on past states $x_0,...,x_{n- 1}$

<br>


### Process of independent increments


A continouos stochastic process  $\hspace{0.1cm}\lbrace \hspace{0.1cm} \mathcal{X}_t \in S  \hspace{0.1cm}/\hspace{0.1cm} t \geq 0 \rbrace\hspace{0.1cm}$ is a independent increments process if:

For all set of times $\hspace{0.1cm}t_1,t_2,t_3\geq 0\hspace{0.1cm}$ such that $\hspace{0.1cm}t_1 < t_2 < t_3$


$\mathcal{X}_{t_2} - \mathcal{X}_{t_1} , \mathcal{X}_{t_3} - \mathcal{X}_{t_2}\hspace{0.1cm}$ are independients.

This means that the displacements of the process in the time intervals $\hspace{0.1cm}[t_1 , t_2) , [t_2 , t_3)\hspace{0.1cm}$ are independent of each other, for all $\hspace{0.1cm }0 \leq t_1 < t_2 < t_3$.



<br>

### Strictly stationary process

A continouos stochastic process $\hspace{0.1cm}\lbrace \hspace{0.1cm} \mathcal{X}_t \in S  \hspace{0.1cm}/\hspace{0.1cm} t \geq 0 \rbrace\hspace{0.1cm}$ is a strictly stationary process  if:

For all $t \geq 0$ , the probability distribution of $\mathcal{X}_{t}$ is the same as that of $\mathcal{X}_{t+h}$  , for all $h>0$



Therefore, for all set of times $\hspace{0.1cm}t_1 , t_2,...,t_n$ 

$(\mathcal{X}_{t_1}, \mathcal{X}_{t_2},\dots ,\mathcal{X}_{t_n} )\hspace{0.1cm}$ is identically distributed as $\hspace{0.1cm}(\mathcal{X}_{t_1+h}, \mathcal{X}_{t_2+h},\dots ,\mathcal{X}_{t_n+h} )$






<br>



### Process with stationary increments

A continouos stochastic process $\hspace{0.1cm}\lbrace \hspace{0.1cm} \mathcal{X}_t \in S  \hspace{0.1cm}/\hspace{0.1cm} t \geq 0 \rbrace\hspace{0.1cm}$ is a process with stationary increments if:

For all pair of times  $\hspace{0.1cm}t_1,t_2 > 0\hspace{0.1cm}$ such that $\hspace{0.1cm}t_1 < t_2$


$\mathcal{X}_{t_2} - \mathcal{X}_{t_1}\hspace{0.1cm}$ y $\hspace{0.1cm}\mathcal{X}_{t_2 + h} - \mathcal{X}_{t_1 + h}\hspace{0.1cm}$ are independents, for any $\hspace{0.1cm}h>0$

<br>

### Martingalas process

A discrete stochastic process $\hspace{0.1cm}\lbrace \hspace{0.1cm} \mathcal{X}_t \in S  \hspace{0.1cm}/\hspace{0.1cm} t \in \lbrace 0,1,2,... \hspace{0.1cm} \rbrace\hspace{0.1cm}$ is a Martingalas process if:



$$E(\mathcal{X}_{n+1} | X_0 = x_0 ,..., X_n = x_n) = x_n$$


Where: $\hspace{0.2cm} x_{t} \in S \hspace{0.2cm},\hspace{0.2cm} \forall\hspace{0.1cm} t \in \lbrace 0,1,...,n+1\rbrace$



This property is known as Martingala property, and it implies that the expected value of the sistym in the future  $\hspace{0.1cm}n+1\hspace{0.1cm}$ is the value of the system in the present $\hspace{0.1cm}x_n$. In mean the system doesn´t change of the state observed in the last moment.

This property is known as Martingale property, and it implies that the expected value of the sistym in the future $\hspace{0.1cm}n+1\hspace{0.1cm}$ is the value of the system in the present $\hspace {0.1cm}x_n$. So, in mean the system doesn´t change of the state observed in the last moment.


<br>

### Levy process

A continouos stochastic process $\hspace{0.1cm}\lbrace \hspace{0.1cm} \mathcal{X}_t \in S  \hspace{0.1cm}/\hspace{0.1cm} t \geq 0 \rbrace\hspace{0.1cm}$ is a Levy process if is a  process of independents and stationaries increments. 

The Poisson and Brownian process are examples of Levy process.

<br>


### Gaussian Procces

A continouos stochastic process $\hspace{0.1cm}\lbrace \hspace{0.1cm} \mathcal{X}_t \in S  \hspace{0.1cm}/\hspace{0.1cm} t \geq 0 \rbrace\hspace{0.1cm}$ is a Gaussian process if:

For all set of times $\hspace{0.1cm}t_1,...,t_n \geq 0$

$$(\mathcal{X}_{t_1}, \mathcal{X}_{t_2},...,\mathcal{X}_{t_n}) \sim NM(\mu , \Sigma)$$


Where:

$NM(\mu , \Sigma)\hspace{0.1cm}$ denote the multivariate Normal probability distribution with mean vector $\hspace{0.1cm}\mu\hspace{0.1cm}$ y covariance matrix $\hspace{0.1cm}\Sigma$





<br>


The  dynamic phenomena that we observe in a time series can grouped into two classes:

- The first are those that take stable values in time around a constant level, without showing a long term increasing or decreasing trend. These processes are called stationary. 

Examples of those are the average yearly  temperatures in a region or the propotion of births corresponding to males.


- A second class of processes are the non-stationary processes, which are those that can show trend, seasonality and other evolutionary effects over time.

Examples of those are the yearly income of a country, company sales or energy demand. These are series that evolve over time with more or less stable trends.










<br>





