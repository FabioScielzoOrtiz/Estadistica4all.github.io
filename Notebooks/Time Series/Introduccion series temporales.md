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



In practice, the classification of a series as stationary or not depends on the period of observation, since the series can be stable in a short period and non-stationary in a longer one.






<br>



# Time series

Given a stochastic process $\hspace{0.1cm}\left\lbrace \hspace{0.1cm} \mathcal{X}_t \hspace{0.1cm}/\hspace{0.1cm} t \in T=\lbrace 1,2,...,k \rbrace \hspace{0.1cm}\right\rbrace \hspace{0.1cm} = \hspace{0.1cm}\left\lbrace \hspace{0.1cm} \mathcal{X}_1 ,  \mathcal{X}_2 ,..., \mathcal{X}_k  \hspace{0.1cm}\right\rbrace\hspace{0.1cm}$ 

Given a sample of one observation $X_t=(x_t)$ of each random variable $\mathcal{X}_t$ of the process, for $t \in T=\lbrace 1,2,...,n \rbrace$


$x_1,...,x_k$ is a time serie
 

**Observations:**

- $x_t \in \mathbb{R}$ is a realization of the random variable $\mathcal{X}_t$


- A time serie is a realization of a stochastic process. The time serie is considered a result or trajectory of the stochastic process.




The process is characterized by the join probability distribution of the random variables $\hspace{0.1cm}\left\lbrace \hspace{0.1cm} \mathcal{X}_1 ,  \mathcal{X}_2 ,..., \mathcal{X}_k  \hspace{0.1cm}\right\rbrace\hspace{0.1cm}$, namely, is characterized by the join density or probability function $f_{\mathcal{X}_1 ,  \mathcal{X}_2 ,..., \mathcal{X}_k}$. 

This distribution is called finite-dimensional distribution of the process. We say that we know the probabilistic structure of the stochastic process when we know that join distribution, which determine the distribution of any subset of the variables and, in particular, the marginal distribution of each variable.





# Random walk

A random walk is a stochastic process $\hspace{0.1cm}\left\lbrace \hspace{0.1cm} \mathcal{X}_t \hspace{0.1cm}/\hspace{0.1cm} t \in T=\lbrace 1,2,...,k \rbrace \hspace{0.1cm}\right\rbrace \hspace{0.1cm}$  defined as:

$\mathcal{X}_t = \mathcal{X}_{t-1} + a_t$  , for $t \in \lbrace 1,...,k \rbrace$

Where:

$\mathcal{X}_0 = 0$

$a_t \sim N(0, \sigma^2)$


We say that $\hspace{0.1cm}a_t \sim N(0, \sigma^2)\hspace{0.1cm}$ is a white noise.


<br>

# Mean function 


Given a stochastic process $\hspace{0.1cm}\left\lbrace \hspace{0.1cm} \mathcal{X}_t \hspace{0.1cm}/\hspace{0.1cm} t \in T=\lbrace 1,2,...,k \rbrace \hspace{0.1cm}\right\rbrace \hspace{0.1cm}$

The mean function $\mu_t$ of the process is defined as:

$\mu_t = E\left[\mathcal{X}_t\right]$ , for $t \in \lbrace 1,2,...,k \rbrace$


**Observaciones:**

- An important particular case, due to its simplicity, arises when all the variables have the same mean and thus the mean function is a constant.
The realizations of the process show no trend and we say that the process is stable in the mean.


- If, on the contrary, the means change over time, the observations at dierent
moments will reveal that change.

- On many occasions we only have one realization of the stochastic process and
we have to deduce from that whether the mean function of the process is, or is
not, constant over time.



<br>

# Variance function


Given a stochastic process $\hspace{0.1cm}\left\lbrace \hspace{0.1cm} \mathcal{X}_t \hspace{0.1cm}/\hspace{0.1cm} t \in T=\lbrace 1,2,...,k \rbrace \hspace{0.1cm}\right\rbrace \hspace{0.1cm}$

The variance function $\sigma^2_t$ of the process is defined as:

$\sigma^2_t = Var\left[\mathcal{X}_t\right]$ , for $t \in \lbrace 1,2,...,k \rbrace$











