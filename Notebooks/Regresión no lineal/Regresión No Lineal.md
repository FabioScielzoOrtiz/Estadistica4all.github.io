---
title: 'Modelos de Regresión No Lineal'
author: 'Fabio Scielzo Ortiz'
date: '15/11/22'
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



El modelo de regresión lineal ordinario es relativamente sencillo de describir e implementar, y tiene ventajas sobre otros enfoques en términos de interpretación e inferencia.

Sin embargo puede tener limitaciones significativas en términos de predicción, ya que el supuesto de linealidad casi nunca se cumple, y en ocasiones de manera demasiado fuerte.

En este artícullo vamos a relajar el supuesto de linealidad, aunque esto tendrá un alto coste en términos de interpretación.

Vamos a ver varios modelos en los que solo disponemos de un predictor.

Posterirmente veremis un modelo que permite incluir varios predictores.





# Modelo de Regresión Polinómica


Tenemos una variable respuesta $\mathcal{Y}$ y un predictor $\mathcal{X}_1$

Tenemos una muestra de $n$ observaciones de la respuesta  $\mathcal{Y}$ :

$$Y=(y_1,...,y_n)^t$$


Tenemos una muestra de $n$ observaciones del predictor  $\mathcal{X}_1$ : 

$$X_1=(x_{11},...,x_{n1})^t \\[1.5cm]$$




**Modelo de Regresión Lineal Simple (recordatorio)**

El modelo de **regresión lineal** simple ordinario tiene la siguiente forma:


$$y_i = \beta_0 + \beta_1 \cdot x_{i1} + \varepsilon_i \\$$

Matricialmente:

$$Y = \beta_0 + \beta_1 \cdot X_1 + \varepsilon$$

Donde  $\hspace{0.1cm}\varepsilon=( \varepsilon_1,..., \varepsilon_n)^t \\$

Y ahora $\beta_0$ es un vector con $n$ repeticiones de $\beta_0 \\$



En el que el término de error cumple las siguientes hipotesis:

$\varepsilon_i \sim N(0,\sigma^2)$

$cov(\varepsilon_i , \varepsilon_{i+1}) = 0$ 

para $\hspace{0.1cm}i=1,...,n \\$


Y los coeficientes $\hspace{0.1cm} \beta=(\beta_0 , \beta_1)^t\hspace{0.1cm}$ son estimados por mínimos cuadrados ordinarios (MCO):


$$\widehat{\beta} \hspace{0.1cm} =\hspace{0.1cm}  arg\hspace{0.1cm}  Min\hspace{0.1cm}  \lbrace RSS(\beta) \hspace{0.1cm} =\hspace{0.1cm}  \sum_{i=1}^n (y_i - (\beta_0 + \beta_1 \cdot x_{i1}))^2 \hspace{0.1cm} \rbrace$$


<br>

**Modelo de Regresión Polinómica**

El modelo de regresión polinómica de grado $d$ basado en el modelo de regrsión simple anterior tiene la siguiente forma:


$$y_i = \beta_0 + \beta_1 \cdot x_{i1} + \beta_2 \cdot x_{i1}^2  +...+ \beta_d \cdot x_{i1}^d + \varepsilon_i$$

para $\hspace{0.1cm} i=1,...,n \\$

 

Matricialmente:

$$Y = \beta_0 + \beta_1 \cdot X_1 +  \beta_2 \cdot X_1^2 +...+ \beta_d \cdot X_1^d + \varepsilon$$

Donde  $\hspace{0.1cm} X_1^k = (x_{11}^k , x_{21}^k,...,x_{n1}^k)^t\hspace{0.1cm}$ , $\hspace{0.1cm}\varepsilon=( \varepsilon_1,..., \varepsilon_n)^t \\$

Y ahora $\beta_0$ es un vector con $n$ repeticiones de $\beta_0 \\$



En el que el término de error cumple las siguientes hipotesis:


$\varepsilon_i \sim N(0,\sigma^2)$

$cov(\varepsilon_i , \varepsilon_{i+1}) = 0$ 

para $i=1,...,n\\$


Y los coeficientes $\hspace{0.1cm} \beta=(\beta_0 , \beta_1)^t\hspace{0.1cm}$ son estimados por minimos cuadrados ordinarios.


$$\widehat{\beta} \hspace{0.1cm} =\hspace{0.1cm}  arg\hspace{0.1cm}  Min\hspace{0.1cm}  \lbrace RSS(\beta) \hspace{0.1cm} =\hspace{0.1cm}  \sum_{i=1}^n (y_i - (\beta_0 +  \beta_1 \cdot x_{i1} + \beta_2 \cdot x_{i1}^2  +...+ \beta_d \cdot x_{i1}^d ))^2 \hspace{0.1cm} \rbrace$$


<br>


>Por tanto el modelos de regresión polinómica de grado $d$ basado en el modelo de regresión lineal simple con predictor $X_1$ es simplemente un modelo de regresión lineal *múltiple* con predictores $X_1, X_1^2 ,...,X_1^d$


<br>


## Seleccion del grado del polinomio

En la práctica lo habitual es no seleccionar un grado $d > 4$, ya que cuanto mayor sea el grado, mayor es la flexibilidad del polinomio y mayor el sobre-ajuste.

<br>


## Problemas

Los coeficientes estimados no son fáciles de interpretar. 


<br>

<br>


# Regresión con funciones escalón <a class="anchor" id="52"></a>


Tenemos una variable respuesta $\hspace{0.1cm}\mathcal{Y}\hspace{0.1cm}$ y un predictor $\hspace{0.1cm}\mathcal{X}_1$

Tenemos una muestra de $n$ observaciones de la respuesta  $\hspace{0.1cm}\mathcal{Y}$ :

$$Y=(y_1,...,y_n)^t$$


Tenemos una muestra de $n$ observaciones del predictor  $\hspace{0.1cm}\mathcal{X}_1$ : 

$$X_1=(x_{11},...,x_{n1})^t \\[1.5cm]$$




Tenemos una serie de $k+1$ intervalos $\hspace{0.1cm} [L_0 , L_1),[L_1 , L_2),...,[L_{k-1} , L_k)[L_k , L_k+1]\hspace{0.1cm}$ tales que: $\\[0.4cm]$

- Son disjuntos dos a dos, es decir, no comparten elementos dos a dos. $\\[0.3cm]$

- Toda observación de la muestra $X_1$ pertenece a alguno de los intervalos:

$$x_{i1} \in [L_0 , L_1)\cup ... \cup [L_{k-1} , L_k)\cup [L_k , L_k+1] \hspace{0.5cm} \forall i =1,..,n \\$$




Se definen las siguientes variables binarias (*dummies*):


$$I_0(X_{1})\hspace{0.15cm} = \hspace{0.15cm} \left(\hspace{0.2cm} \Upsilon (\hspace{0.15cm} x_{i1} \in [L_0 , L_{1}) \hspace{0.15cm} ) \hspace{0.2cm} / \hspace{0.2cm} i=1,...,n    \hspace{0.2cm} \right)^t$$  

$$I_1(X_{1})\hspace{0.15cm} = \hspace{0.15cm} \left(\hspace{0.2cm} \Upsilon (\hspace{0.15cm} x_{i1} \in [L_1 , L_{2}) \hspace{0.15cm} ) \hspace{0.2cm} / \hspace{0.2cm} i=1,...,n    \hspace{0.2cm} \right)^t$$  

$$\dots$$

$$I_{k-1}(X_{1})\hspace{0.15cm} = \hspace{0.15cm} \left(\hspace{0.2cm} \Upsilon (\hspace{0.15cm}  x_{i1} \in [L_{k-1} , L_{k})\hspace{0.15cm}  ) \hspace{0.2cm} / \hspace{0.2cm} i=1,...,n    \hspace{0.2cm} \right)^t$$ 

$$I_{k}(X_{1})\hspace{0.15cm} = \hspace{0.15cm} \left(\hspace{0.2cm} \Upsilon (\hspace{0.15cm}  x_{i1} \in [L_{k} , L_{k+1}) \hspace{0.15cm} ) \hspace{0.2cm} / \hspace{0.2cm} i=1,...,n    \hspace{0.2cm} \right)^t \\$$ 

Donde: $\hspace{0.2cm} \Upsilon (\cdot)$ es la función indicatriz o indicadora.

<br>

El modelo de regresión con funciones escalón tiene la siguiente forma:


$$y_i = \beta_0 \hspace{0.1cm}+\hspace{0.1cm} \beta_1 \cdot \Upsilon (\hspace{0.15cm} x_{i1} \in [L_1 , L_{2}) \hspace{0.15cm} ) \hspace{0.1cm}+\hspace{0.1cm} \beta_2 \cdot \Upsilon (\hspace{0.15cm} x_{i1} \in [L_2 , L_{3}) \hspace{0.15cm} ) \hspace{0.1cm} + ... +\hspace{0.1cm} \beta_k \cdot \Upsilon (\hspace{0.15cm} x_{i1} \in [L_k , L_{k+1}) \hspace{0.15cm} ) \hspace{0.1cm}+ \hspace{0.1cm}\varepsilon_i$$

para $i=1,..,n \\$


Matricialmente:


$$Y= \beta_0 \hspace{0.1cm}+\hspace{0.1cm} \beta_1 \cdot I_1(X_1) \hspace{0.1cm}+\hspace{0.1cm} \beta_2 \cdot I_2(X_1) \hspace{0.1cm}+ ... +\hspace{0.1cm} \beta_k \cdot I_k(X_1) \hspace{0.1cm}+\hspace{0.1cm} \varepsilon \\$$


Donde ahora $\beta_0$ es un vector con $n$ repeticiones de $\beta_0 \\$



**Observaciones**

No se incluye $I_0(X_1)$ en el modelo porque si no habria problemas de multicolinealidad.







<br>

<br>

# Bibliografía 

https://www.iartificial.net/regresion-polinomica-en-python-con-scikit-learn/


















