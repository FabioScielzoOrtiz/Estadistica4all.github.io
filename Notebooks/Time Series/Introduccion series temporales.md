---
title: 'Introduction to Time Series'
author: 'Fabio Scielzo Ortiz'
date: '5/1/23'
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

$\hspace{0.5cm}$ Scielzo Ortiz, F. (2023). Introduction to Time Series.  http://estadistica4all.com/Articulos/Intervalos-de-confianza.html


</p>
 
</p></span>
</div>


***It's recommended to open the article on a computer or tablet.***
 
 
 
 
 <br>
 
 


# Introduction to stochastic processes 


## Stochastic processes  


Let  $\hspace{0.1cm}\mathcal{X}_t\hspace{0.1cm}$ be a random variable (r.v.), for each $\hspace{0.1cm}t\in T$


<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>


$\hspace{0.25cm}$ A stochastic processes is a set of random variables $\hspace{0.1cm}\left\lbrace \hspace{0.1cm} \mathcal{X}_t \hspace{0.1cm}:\hspace{0.1cm} t \in T \hspace{0.1cm}\right\rbrace\hspace{0.1cm}$ such that $\hspace{0.1cm}\hspace{0.1cm}\mathcal{X}_t \in S \subset \mathbb{R}$
 

$\hspace{0.25cm}$ where:

- $T\hspace{0.1cm}$ is called **parameter space** and is the set of indices of the random variables that define the stochastic process. $\\[0.35cm]$

- $S\hspace{0.1cm}$ is called **states space** and is the variation field of the random variables that define the stochastic process. $\\[0.35cm]$



- We will say that $\hspace{0.1cm}\lbrace \hspace{0.1cm} \mathcal{X}_t \in S  \hspace{0.1cm} : \hspace{0.1cm} t \in T \hspace{0.1cm} \rbrace\hspace{0.1cm}$ is a stochastic process with parameter space $\hspace{0.1cm}T\hspace{0.1cm}$ and states space $\hspace{0.1cm}S$ $\\[0.5cm]$

</p>
 
</p></span>
</div>



**Observation:**

$T\hspace{0.1cm}$ is generally interpreted as moments or periods of time, because one of the most important applications of stochastic processes is time series modeling.


Therefore:

$X_t\hspace{0.1cm}$ is a random variable ussually used to model the state of a system at time moment $\hspace{0.06cm}t\hspace{0.06cm}$, or to model a variable of interest at the moment or period $\hspace{0.06cm}t$. 


<br>


## Discrete stochastic process  

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>

$\hspace{0.25cm}$ $\lbrace \hspace{0.1cm} \mathcal{X}_t \in S  \hspace{0.1cm}:\hspace{0.1cm} t \in T \hspace{0.1cm} \rbrace\hspace{0.15cm}$  is a discrete stochastic process if $\hspace{0.15cm}T\subset \lbrace 0,1,2,... \rbrace$

</p>
 
</p></span>
</div>

<br>

## Continuous stochastic process

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>

$\hspace{0.25cm}$ $\lbrace \hspace{0.1cm} \mathcal{X}_t \in S  \hspace{0.1cm}:\hspace{0.1cm} t \in T \hspace{0.1cm} \rbrace\hspace{0.15cm}$ is a continuous stochastic process if $\hspace{0.15cm}T\subset [0, \infty)$

</p>
 
</p></span>
</div>

<br>

## Types of stochastic processes  <a class="anchor" id="1"></a>

### Independent process


<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>

$\hspace{0.25cm}$$\lbrace \hspace{0.1cm} \mathcal{X}_t \in S  \hspace{0.1cm}:\hspace{0.1cm} t \in T \hspace{0.1cm} \rbrace\hspace{0.1cm}$ is a independient stochastic process if the random variables that define the process are independient.

</p>
 
</p></span>
</div>

<br>


### Markov process

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>

$\hspace{0.25cm}$ A discrete stochastic process  $\hspace{0.1cm}\lbrace \hspace{0.1cm} \mathcal{X}_t \in S  \hspace{0.1cm}/\hspace{0.1cm} t \in \lbrace 0,1,2,... \hspace{0.1cm} \rbrace\hspace{0.2cm}$ is a Markov process if: $\\[0.15cm]$



$$P(\mathcal{X}_{n+1} = x_{n+1}\hspace{0.15cm} |\hspace{0.15cm} \mathcal{X}_0 = x_0 ,..., \mathcal{X}_n =x_n) \hspace{0.1cm}=\hspace{0.1cm} P(\mathcal{X}_{n+1} = x_{n+1}\hspace{0.15cm} |\hspace{0.15cm} \mathcal{X}_n = x_n)$$ $\\[0.15cm]$


$\hspace{0.25cm}$ where: $\hspace{0.2cm} x_{t} \in S \hspace{0.2cm},\hspace{0.2cm} \forall\hspace{0.1cm} t \in \lbrace 0,1,...,n+1\rbrace$  $\\[0.35cm]$

</p>
 
</p></span>
</div>

This property is known as the memoryless Markov property. Because it implies that the future state of the system, $\mathcal{X}_{n+1}$ , only depends on the present state $x_n$ and does not depend on past states $x_0,...,x_{n- 1}$

<br>


### Process of independent increments


<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>

$\hspace{0.25cm}$ A continuous stochastic process  $\hspace{0.1cm}\lbrace \hspace{0.1cm} \mathcal{X}_t \in S  \hspace{0.1cm}/\hspace{0.1cm} t \geq 0 \rbrace\hspace{0.1cm}$ is a independent increments process if:

$\hspace{0.25cm}$ For all set of times $\hspace{0.1cm}t_1,t_2,t_3\geq 0\hspace{0.13cm}$ such that $\hspace{0.1cm}t_1 < t_2 < t_3$


$\hspace{0.25cm}$ $\mathcal{X}_{t_2} - \mathcal{X}_{t_1} \hspace{0.1cm} , \hspace{0.1cm} \mathcal{X}_{t_3} - \mathcal{X}_{t_2}\hspace{0.1cm}$ are independents.

</p>
 
</p></span>
</div>

This means that the displacements of the process in the time intervals $\hspace{0.1cm}[t_1 , t_2) , [t_2 , t_3)\hspace{0.1cm}$ are independent of each other, for all $\hspace{0.1cm }0 \leq t_1 < t_2 < t_3$.



<br>

### Strictly stationary process

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>

$\hspace{0.25cm}$ A continuous stochastic process $\hspace{0.1cm}\lbrace \hspace{0.1cm} \mathcal{X}_t \in S  \hspace{0.1cm}/\hspace{0.1cm} t \geq 0 \rbrace\hspace{0.2cm}$ is a strictly stationary process  if:

$\hspace{0.25cm}$ For all $t \geq 0$ , the probability distribution of $\mathcal{X}_{t}$ is the same as that of $\mathcal{X}_{t+h}$  , for all $h>0$

</p>
 
</p></span>
</div>


Therefore, for all set of times $\hspace{0.1cm}t_1 , t_2,...,t_n$ 

$(\mathcal{X}_{t_1}, \mathcal{X}_{t_2},\dots ,\mathcal{X}_{t_n} )\hspace{0.1cm}$ is identically distributed as $\hspace{0.1cm}(\mathcal{X}_{t_1+h}, \mathcal{X}_{t_2+h},\dots ,\mathcal{X}_{t_n+h} )$






<br>



### Process with stationary increments

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>

$\hspace{0.25cm}$ A continuous stochastic process $\hspace{0.1cm}\lbrace \hspace{0.1cm} \mathcal{X}_t \in S  \hspace{0.1cm}/\hspace{0.1cm} t \geq 0 \rbrace\hspace{0.1cm}$ is a process with stationary increments if:

$\hspace{0.25cm}$ For all pair of times  $\hspace{0.1cm}t_1,t_2 > 0\hspace{0.1cm}$ such that $\hspace{0.1cm}t_1 < t_2$


$\hspace{0.25cm}$ $\mathcal{X}_{t_2} - \mathcal{X}_{t_1}\hspace{0.1cm}$ and $\hspace{0.1cm}\mathcal{X}_{t_2 + h} - \mathcal{X}_{t_1 + h}\hspace{0.1cm}$ are independents, for any $\hspace{0.1cm}h>0$

</p>
 
</p></span>
</div>


<br>

### Martingalas process

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>

$\hspace{0.25cm}$ A discrete stochastic process $\hspace{0.1cm}\lbrace \hspace{0.1cm} \mathcal{X}_t \in S  \hspace{0.1cm}/\hspace{0.1cm} t \in \lbrace 0,1,2,... \hspace{0.1cm} \rbrace\hspace{0.1cm}$ is a Martingalas process if: $\\[0.15cm]$



$$E\left[\hspace{0.1cm}\mathcal{X}_{n+1} | X_0 = x_0 ,..., X_n = x_n\hspace{0.1cm} \right] \hspace{0.1cm} = \hspace{0.1cm} x_n$$ $\\[0.15cm]$


$\hspace{0.25cm}$ where: $\hspace{0.2cm} x_{t} \in S \hspace{0.2cm},\hspace{0.2cm} \forall\hspace{0.1cm} t \in \lbrace 0,1,...,n+1\rbrace$ $\\[0.35cm]$

</p>
 
</p></span>
</div>

This property is known as Martingalas property, and it implies that the expected value of the sistym in the future  $\hspace{0.1cm}n+1\hspace{0.1cm}$ is the value of the system in the present $\hspace{0.1cm}x_n$. In mean the system doesn´t change of the state observed in the last moment.

This property is known as Martingale property, and it implies that the expected value of the sistym in the future $\hspace{0.1cm}n+1\hspace{0.1cm}$ is the value of the system in the present $\hspace {0.1cm}x_n$. So, in mean the system doesn´t change of the state observed in the last moment.


<br>

### Levy process

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>

$\hspace{0.25cm}$ A continuous stochastic process $\hspace{0.1cm}\lbrace \hspace{0.1cm} \mathcal{X}_t \in S  \hspace{0.1cm}/\hspace{0.1cm} t \geq 0 \rbrace\hspace{0.15cm}$ is a Levy process if is a  process of independents and stationaries increments. 

</p>
 
</p></span>
</div>

The Poisson and Brownian process are examples of Levy process.

<br>


### Gaussian Process  <a class="anchor" id="1"></a>

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>

$\hspace{0.25cm}$ A continuous stochastic process $\hspace{0.1cm}\lbrace \hspace{0.1cm} \mathcal{X}_t \in S  \hspace{0.1cm}/\hspace{0.1cm} t \geq 0 \rbrace\hspace{0.15cm}$ is a Gaussian process if:

$\hspace{0.25cm}$ For all set of times $\hspace{0.1cm}t_1,...,t_n \geq 0$

$$(\mathcal{X}_{t_1}, \mathcal{X}_{t_2},...,\mathcal{X}_{t_n}) \sim NM(\mu , \Sigma)$$


$\hspace{0.25cm}$ where:

$\hspace{0.25cm}$ $NM(\mu , \Sigma)\hspace{0.1cm}$ denote the multivariate Normal probability distribution with mean vector $\hspace{0.1cm}\mu\hspace{0.1cm}$ y covariance matrix $\hspace{0.1cm}\Sigma$ $\\[0.4cm]$


</p>
 
</p></span>
</div>



The  dynamic phenomena that we observe in a time series can grouped into two classes:

- The first are those that take stable values in time around a constant level, without showing a long term increasing or decreasing trend. These processes are called stationary. 

Examples of those are the average yearly  temperatures in a region or the propotion of births corresponding to males.


- A second class of processes are the non-stationary processes, which are those that can show trend, seasonality and other evolutionary effects over time.

Examples of those are the yearly income of a country, company sales or energy demand. These are series that evolve over time with more or less stable trends.



In practice, the classification of a series as stationary or not depends on the period of observation, since the series can be stable in a short period and non-stationary in a longer one.






<br>



# Time series   

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>

$\hspace{0.25cm}$ Given a stochastic process $\hspace{0.15cm}\Bigl\{ \hspace{0.06cm} \mathcal{X}_t \hspace{0.1cm}: \hspace{0.1cm} t \in T=\lbrace 1,2,...,n \rbrace \hspace{0.06cm}\Bigl\} \hspace{0.1cm} = \hspace{0.1cm}\Bigl\{ \hspace{0.06cm} \mathcal{X}_1 ,  \mathcal{X}_2 ,..., \mathcal{X}_n  \hspace{0.06cm}\Bigl\} \hspace{0.1cm}$ 

$\hspace{0.25cm}$ Given a sample of one observation $\hspace{0.06cm}x_t\hspace{0.06cm}$ of each random variable $\hspace{0.06cm}\mathcal{X}_t\hspace{0.06cm}$ of the process, for $\hspace{0.06cm}t \in T=\lbrace 1,2,...,n \rbrace$. $\\[1cm]$


- $X_t = \left( x_1, x_2, ...,x_n \right)^t \hspace{0.12cm}$ is a **time serie**.
 
 
$\hspace{0.25cm}$ where:

$\hspace{0.25cm}$ $x_t\hspace{0.06cm}$ could be interpreted as the value observed of the variable $\hspace{0.06cm}\mathcal{X}\hspace{0.06cm}$ at the time $\hspace{0.06cm}t$. $\\[0.35cm]$

</p>
 
</p></span>
</div>


**Observations:**

- $x_t \in \mathbb{R}\hspace{0.06cm}$ is a realization of the random variable $\mathcal{X}_t$ $\\[0.35cm]$


- A time serie is a realization of a stochastic process. The time serie is considered a result or trajectory of the stochastic process.




The process is characterized by the join probability distribution of the random variables $\hspace{0.1cm}\Bigl\{  \hspace{0.06cm} \mathcal{X}_1 ,  \mathcal{X}_2 ,..., \mathcal{X}_k  \hspace{0.06cm} \Bigl\} \hspace{0.1cm}$, namely, is characterized by the join density or probability function $\hspace{0.06cm}f_{\mathcal{X}_1 ,  \mathcal{X}_2 ,..., \mathcal{X}_k}$. 

This distribution is called finite-dimensional distribution of the process. We say that we know the probabilistic structure of the stochastic process when we know that join distribution, which determine the distribution of any subset of the variables and, in particular, the marginal distribution of each variable.


<br>


# Random walk

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>

$\hspace{0.25cm}$ A random walk is a stochastic process $\hspace{0.1cm}\Bigl\{  \hspace{0.1cm} \mathcal{X}_t \hspace{0.1cm}:\hspace{0.1cm} t \in T=\lbrace 1,2,...,n \rbrace \hspace{0.1cm}\Bigl\} \hspace{0.1cm}$  defined as:

- $\mathcal{X}_t = \mathcal{X}_{t-1} + a_t$ ,
for $t \in \lbrace 1,...,n \rbrace$

$\hspace{0.25cm}$ where:

- $\mathcal{X}_0 = 0$ $\\[0.25cm]$

- $a_t \sim N(0, \sigma^2)$ $\\[0.25cm]$


- We say that $\hspace{0.1cm}a_t \sim N(0, \sigma^2)\hspace{0.1cm}$ is a white noise.

</p>
 
</p></span>
</div>

<br>

# Mean function 


Given a stochastic process $\hspace{0.1cm}\left\lbrace \hspace{0.1cm} \mathcal{X}_t \hspace{0.1cm}/\hspace{0.1cm} t \in T=\lbrace 1,2,...,k \rbrace \hspace{0.1cm}\right\rbrace \hspace{0.1cm}$

The mean function $\mu_t$ of the process is defined as:

$$\mu_t = E\left[\mathcal{X}_t\right]$$

for $t \in \lbrace 1,2,...,k \rbrace \\$


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

$$\sigma^2_t = Var\left[\mathcal{X}_t\right]$$

for $t \in \lbrace 1,2,...,k \rbrace \\$


We say that the process is stable in the variance if the variability is constant
over time.

A process can be stable in the mean but not in the variance and vice versa.


<br>

# Autocovariance function


The structure of linear dependence between random variables is represented by
the covariance and correlation functions.

Given a stochastic process $\hspace{0.1cm}\left\lbrace \hspace{0.1cm} \mathcal{X}_t \hspace{0.1cm}/\hspace{0.1cm} t \in T=\lbrace 1,2,...,k \rbrace \hspace{0.1cm}\right\rbrace \hspace{0.1cm}$

The autocavariance function $\gamma_{t , t+h}$ of the process is defined as:

$$\gamma_{t , t+h} = Cov(\mathcal{X}_t , \mathcal{X}_{t+h}) = E\left[ (\mathcal{X}_t - \mu_t)\cdot (\mathcal{X}_{t+h} - \mu_{t+h})   \right]$$

for $\hspace{0.1cm}t \in \lbrace 1,2,...,k \rbrace\hspace{0.1cm}$ and $\hspace{0.1cm}  h\in \lbrace 1,2,... \rbrace \\$



In particular, we have


$$\gamma_{t , t} = \sigma_t^2$$




The autocovariances have dimensions, the squares of the series, thus it is not
advisable to use them for comparing series measured in dierent units.



<br>

# Autocorrelation function


Given a stochastic process $\hspace{0.1cm}\left\lbrace \hspace{0.1cm} \mathcal{X}_t \hspace{0.1cm}/\hspace{0.1cm} t \in T=\lbrace 1,2,...,k \rbrace \hspace{0.1cm}\right\rbrace \hspace{0.1cm}$

The autocorrelation function $\rho_{t , t+h}$ of the process is defined as:

$$\rho_{t , t+h} = \dfrac{\gamma_{t , t+h}}{\sqrt{\sigma_t^2 \cdot \sigma_{t+h}^2}}$$

for $\hspace{0.1cm}t \in \lbrace 1,2,...,k \rbrace\hspace{0.1cm}$ and $\hspace{0.1cm} h\in \lbrace 1,2,... \rbrace \\$


In particular, we have


$$\rho_{t , t} = 1$$


<br>

It is interesting to notice the differences between conditional distributions and the marginal distributions.

The marginal distribution of $\mathcal{X}_t$ represents what we know about a variable, without knowing anything about its trajectory until time $t$.

The conditional distribution of $\mathcal{X}_t$ given $\mathcal{X}_{t-1}$,...,$\mathcal{X}_{t-r}$ represents what we
know about a variable when we know the k previous values of the process.

In time series conditional distributions are of greater interest than marginal
ones because they define the predictions that we can make about the future
knowing the past.


<br>

# Stationary processes

Given a stochastic process $\hspace{0.1cm}\left\lbrace \hspace{0.1cm} \mathcal{X}_t \hspace{0.1cm}/\hspace{0.1cm} t \in T=\lbrace 1,2,...,k \rbrace \hspace{0.1cm}\right\rbrace \hspace{0.1cm}$

A stochastic process is **strictly stationary** if:

the probability distribution of $\mathcal{X}_{t}$ is the same as that of $\mathcal{X}_{t+h}$

for all $\hspace{0.1cm}t \in \lbrace 1,2,...,k \rbrace\hspace{0.1cm}$ and $\hspace{0.1cm} h \in \in \lbrace 1,2,... \rbrace$.   



Therefore, for all set of times $\hspace{0.1cm}t_1 , t_2,...,t_n$ 

$(\mathcal{X}_{t_1}, \mathcal{X}_{t_2},\dots ,\mathcal{X}_{t_n} )\hspace{0.1cm}$ is identically distributed as $\hspace{0.1cm}(\mathcal{X}_{t_1+h}, \mathcal{X}_{t_2+h},\dots ,\mathcal{X}_{t_n+h} )$


<br>

Strict stationarity is a very strong condition, since to prove it we must have the joint distributions for any set of variables in the process. A weaker property, but one which is easier to prove, is **weak stationarity**.



A stochastic process is **weakly stationary** if:

- $\mu_t = \mu = cte , \forall t \in \lbrace 1,2,...,k \rbrace$

- $\sigma_t^2 = \sigma = cte , , \forall t \in \lbrace 1,2,...,k \rbrace$

- $\gamma_{t , t + h} = Cov(\mathcal{X}_t,\mathcal{X}_{t+h}) E[(\mathcal{X}_t - \mu)\cdot (\mathcal{X}_{t+h} - \mu)] = \gamma(h)  , \forall h \in  \lbrace 0 , \pm 1 , \pm 2 ,... \rbrace$



The first two conditions indicate that the mean and variance are constant.

The third indicates that the covariance between two variables depends only on
their separation.

In a stationary process the autocovariances and autocorrelations depend only on
the lag between the variables and, in particular, the relationship between $\mathcal{X}_t$ and $\mathcal{X}_{t+h}$ ,  is always equal to the relationship between $\mathcal{X}_t$ and $\mathcal{X}_{t-h}$ .


As a result, in stationary processes:



$\gamma_{t , t + h} = \gamma_{t + r , t + h + r} = \gamma(h) , \forall r \in  \lbrace 0 , \pm 1 , \pm 2 ,... \rbrace$


$$\rho_{t, t+h} = \dfrac{\gamma_{t , t + h}}{\sqrt{\sigma_t^2 \cdot \sigma_{t+h}^2}} = \dfrac{\gamma(h)}{\sqrt{\sigma^2 \cdot \sigma^2}} = \dfrac{\gamma(h)}{\sigma^2} = \dfrac{\gamma(h)}{\gamma(0)} = \rho(h)$$

Where:

$\gamma(0) = \sigma^2$




DIAPOSITIVA 23



