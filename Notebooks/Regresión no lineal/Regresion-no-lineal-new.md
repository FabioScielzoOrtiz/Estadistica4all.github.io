---
title: 'Regresión no lineal'
author: 'Fabio Scielzo Ortiz'
date: '15/1/23'
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



<div class="warning" style='background-color:#FCF2EC; color: #000000; border-left: solid #FE9554 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:10em;'>


$\hspace{0.3cm}$ **Más artículos:    $\hspace{0.1cm}$ [Estadistica4all](https://fabioscielzoortiz.github.io/Estadistica4all.github.io/)**

$\hspace{0.3cm}$ **Autor:** $\hspace{0.1cm}$ [Fabio Scielzo Ortiz](http://estadistica4all.com/autores/autores.html)

$\hspace{0.3cm}$ **Si utilizas este artículo, por favor, cítalo:** 

$\hspace{0.5cm}$ Scielzo Ortiz, F. (2022). Regresión no lineal. http://estadistica4all.com/Articulos/KNN.html


</p>
 
</p></span>
</div>


***Se recomienda abrir el artículo en un ordenador o en una tablet.***
 
 

El modelo de regresión lineal ordinario es relativamente sencillo de describir e implementar, y tiene ventajas sobre otros enfoques en términos de interpretación e inferencia.

Sin embargo puede tener limitaciones significativas en términos de predicción, ya que el supuesto de linealidad casi nunca se cumple, y en ocasiones de manera demasiado fuerte.

En este artícullo vamos a relajar el supuesto de linealidad, aunque esto tendrá un alto coste en términos de interpretación.

Vamos a ver varios modelos en los que solo disponemos de un predictor.

Posterirmente veremis un modelo que permite incluir varios predictores.


 
Se recomienda la lectura de algunos artículos de [Estadistica4all](http://estadistica4all.com/) como paso previo a la lectura de este articulo. En concreto el artículo sobre el [modelo de regresión lineal](http://estadistica4all.com/Articulos/Linear-Regression-new.html).
 
 
 
 
<br>


# El algoritmo de regresión lineal por minimos cuadrados ordinaros <a class="anchor" id="5"></a>



En esta sección vamos a recordar el modelo de regresión lineal por mínimos cuadrados ordinarios desde un enfoque algorítmico, como algoritmo de regresión.

- Se consideran $\hspace{0.1cm} p\hspace{0.1cm}$ predictores $\hspace{0.1cm}\mathcal{X}_1,...,\mathcal{X}_p\hspace{0.1cm}$ y una variable respuesta $\hspace{0.1cm}\mathcal{Y}$ $\\[0.5cm]$




- Se tiene una muestra de observaciones $\hspace{0.1cm}X_r = (x_{1r},...,x_{nr})^t\hspace{0.1cm}$ de la variable $\hspace{0.1cm}\mathcal{X}_r\hspace{0.1cm}$ , para cada $\hspace{0.1cm}r \in \lbrace 1,...,p \rbrace$ $\\[0.5cm]$


- Se tiene una muestra de observaciones $\hspace{0.1cm}Y = (y_1,...,y_n)^t\hspace{0.1cm}$ de la variable $\hspace{0.1cm}\mathcal{Y}$ $\\[0.5cm]$


- En conclusión, se tiene una muestra de observaciones $\hspace{0.12cm}D=[\hspace{0.12cm}X_1,...,X_p,Y \hspace{0.12cm}]\hspace{0.12cm}$
de los predictores y la respuesta. $\\[0.5cm]$



El modelo estadístico que se plantea en regresión lineal es el siguiente:

Tenemos una m.a.s $\hspace{0.1cm}\mathcal{Y}_1,...,\mathcal{Y}_n\hspace{0.1cm}$ de la v.a. $\hspace{0.1cm}\mathcal{Y}$

Se asume que para cada $\hspace{0.1cm}i=1,...,n\hspace{0.1cm}$ se tiene la siguiente relación:

$$\mathcal{Y}_i = \beta_0 + \sum_{j=1}^p \beta_j \cdot x_{ij} + \varepsilon_i$$ 




Donde:

- $\varepsilon_i \sim N(0,\sigma^2) \hspace{0.25cm} , \hspace{0.25cm} \forall \hspace{0.1cm} i \in \lbrace 1,...,n\rbrace \\$

- $Corr(\varepsilon_i , \varepsilon_r) = 0 \hspace{0.25cm} , \hspace{0.25cm} \forall \hspace{0.1cm} i \neq r \in \lbrace 1,...,n\rbrace \\$

- $\beta_0,...,\beta_p  \in \mathbb{R}\\$


Observación: de lo anterior se deduce que  $\hspace{0.25cm} \mathcal{Y}_i \sim N( \beta_0 + \sum_{j=1}^p \beta_j \cdot x_{ij} , \sigma^2  )$


Este modelo estadístico permite hacer inferencia estadística sobre la respuesta y los predictores, que puede ser de gran interés, pero no es estrictamente necesario para realizar predicciones. 

En regresión lineal clásica existen esencialmente dos vias equivalentes de hacer predicciones con el modelo. Una pasa por usar suspropiedades estadisticas para estimarl los coeficientes betas por el método de máxima verosimilitud. El otro pasa por estimar los betas por el método de minimos cuadrados, el cual no depende de las propiedades estadisticas del modelo. Estas dos vías son equivalentes en el contexto de la regresión lineal clasica, es decir, cuando las perturbaciones $\varepsilon_i$ cumplen las propiedades estadisticas especificadass anteriormente.

En este caso vamos a exponer la vía basada en el método de mínimos cuadrados ordinarios:

La predicción de la variable respuesta para un vector cualquiera de observaciones   de los predictores $\hspace{0.1cm}x_{*}=(x_{*1},...,x_{*p}) \in \mathbb{R}^{p}\hspace{0.1cm}$, según el algoritmo de regresión lineal, es la siguiente: $\\[0.4cm]$



$$\widehat{\hspace{0.01cm} y \hspace{0.01cm}}_*  \hspace{0.15cm}=\hspace{0.15cm} \widehat{\beta}_0 +  \sum_{r=1}^p \hspace{0.12cm} \widehat{\beta}_r \cdot x_{*r} \hspace{0.15cm}=\hspace{0.15cm} \widehat{\beta}_0 \hspace{0.1cm}  +   \hspace{0.1cm}  x_{*}^t \cdot \widehat{\beta} \hspace{0.3cm} , \hspace{0.25cm} \forall \hspace{0.1cm} x_* \in \mathbb{R}^p \\$$


Matricialmente, el vector de predicciones de la respuesta para una matriz de $\hspace{0.1cm}h\hspace{0.1cm}$ datos cualesquiera $\hspace{0.01cm} X=[X_1,...,X_p]\hspace{0.01cm}$ de los predictores es el siguiente:

$$\widehat{Y} \hspace{0.1cm} = \hspace{0.1cm} \widehat{\beta}_0 + X \cdot \widehat{\beta} \hspace{0.1cm}=\hspace{0.1cm}  \widehat{\beta}_0 +   \widehat{\beta}_1 \cdot X_1 + \dots + \widehat{\beta}_p \cdot X_p  \hspace{0.3cm} , \hspace{0.3cm} \forall \hspace{0.1cm} X_1,...,X_p \in \mathbb{R}^h \\$$



donde los parámetros $\hspace{0.12cm}\widehat{\beta} \hspace{0.1cm}=\hspace{0.1cm} \left( \widehat{\beta}_0 , \widehat{\beta}_1,...,\widehat{\beta}_p \right) \hspace{0.12cm}$ se obtienen resolviendo el **problema de mínimos cuadrados ordinarios**:

$$\widehat{\beta} \hspace{0.15cm}=\hspace{0.15cm} \left( \widehat{\beta}_0 , \widehat{\beta}_1,...,\widehat{\beta}_p \right)  \hspace{0.2cm} = \hspace{0.2cm} arg \hspace{0.2cm} \underset{ \beta_0 , \beta_1,...,\beta_p}{Min} \hspace{0.2cm} \sum_{i=1}^n  \hspace{0.12cm} \left(  y_i - \left( \hspace{0.12cm} \beta_0 + \sum_{r=1}^p \hspace{0.1 cm} \beta_r \cdot x_{ir} \hspace{0.12cm} \right) \right)^2 \\[1.5cm]
\hspace{4.6cm} \text{sujeto a:}  \hspace{0.35cm}  \beta_0 , \beta_1,...,\beta_p \in \mathbb{R}$$

 

<br>

Existe una solución cerrada para este problema de optimización, y se puede demostrar que es la siguiente:


$$\widehat{\beta}\hspace{0.1cm}=\hspace{0.1cm}(X^t \cdot X)^{-1} \cdot X^t \cdot Y$$

donde: 

$$\hspace{0.1cm} X \hspace{0.1cm}=\hspace{0.1cm} [\hspace{0.05cm}\mathbb{1} , X_1,...,X_p \hspace{0.05cm}]$$


No entraremos aquí en los detalles matemáticos sobre como se obtiene esta solución. Lo reservamos para futuros artículos sobre métodos de optimización aplicados a la ciencia de datos.

<br>


**Observaciones:**

- La muestra $\hspace{0.12cm}D=[\hspace{0.12cm}X_1,...,X_p,Y\hspace{0.12cm}]\hspace{0.12cm}$ esta jugando el papel de muestra de entrenamiento. $\\[0.4cm]$



- Es de especial interés el caso en el que $\hspace{0.12cm}x_*\hspace{0.12cm}$  es una nueva observación de los predictores para la que se desconoce el valor de la respuesta, es decir, $\hspace{0.12cm}x_* = x_{new}$. $\\[0.4cm]$

- El algoritmo también permite predecir la respuesta para las observaciones de los predictores con las que el modelo ha sido entrenado, es decir:
    
    $$\widehat{\hspace{0.01cm} y \hspace{0.01cm}}_i  \hspace{0.15cm}=\hspace{0.15cm} \widehat{\beta}_0 +  \sum_{r=1}^p \hspace{0.12cm} \widehat{\beta}_r \cdot x_{ir} \hspace{0.3cm} , \hspace{0.25cm} \forall \hspace{0.1cm} i =1,...,n \\$$
    
    

- Se denomina regresión **lineal** por que la ecuación con la que se predice la respuesta es una ecuación lineal en los betas.  $\\[0.4cm]$

- $\widehat{\beta}_0 +  \sum_{r=1}^p \hspace{0.12cm} \widehat{\beta}_r \cdot x\hspace{0.12cm}$ , con $\hspace{0.12cm}x\in \mathbb{R}^p\hspace{0.12cm}$, es el hiper-plano $\hspace{0.12cm}p$-dimensional que mejor se ajusta a los datos disponibles de la respusta y los predictores $\hspace{0.12cm}\lbrace (y_i,x_i) \hspace{0.12cm} / \hspace{0.12cm} i=1,...,n \rbrace\hspace{0.12cm}$, dado que es el hiper-plano óptimo en el sentido de minimos cuadrados ordinarios.






<br>

A continuación vamos a ver deferentes modelos o algoritmos de regresión no lineal. Primero veremos algoritmos que solo consideran un parámetro, para posteriormente ver un algoritmo que permite combinar los demás e involucrar varios predictores.




# Regresión Polinómica


- Se considera $\hspace{0.1cm} 1\hspace{0.1cm}$ predictor **cuantitativo** $\hspace{0.1cm}\mathcal{X}_1\hspace{0.1cm}$ y una variable respuesta $\hspace{0.1cm}\mathcal{Y}$ $\\[0.5cm]$


- Se tiene una muestra de observaciones $\hspace{0.1cm}X_1 = (x_{11},...,x_{n1})^t\hspace{0.1cm}$ del predictor $\hspace{0.1cm}\mathcal{X}_1\hspace{0.1cm}$  $\\[0.5cm]$


- Se tiene una muestra de observaciones $\hspace{0.1cm}Y = (y_1,...,y_n)^t\hspace{0.1cm}$ de la respuesta $\hspace{0.1cm}\mathcal{Y}$ $\\[0.5cm]$


- En conclusión, se tiene una muestra de observaciones $\hspace{0.12cm}D=[\hspace{0.12cm}X_1,Y \hspace{0.12cm}]\hspace{0.12cm}$
del predictores y la respuesta. $\\[1cm]$



El modelo estadístico que se plantea en regresión polinómica de grado $\hspace{0.1cm}d\hspace{0.1cm}$ es el siguiente:

Tenemos una m.a.s $\hspace{0.1cm}\mathcal{Y}_1,...,\mathcal{Y}_n\hspace{0.1cm}$ de la v.a. $\hspace{0.1cm}\mathcal{Y}$

Se asume que para cada $\hspace{0.1cm} i=1,...,n\hspace{0.1cm}$ se tiene la siguiente relación:

$$\mathcal{Y}_i \hspace{0.15cm}=\hspace{0.15cm}       \beta_0 \hspace{0.05cm} + \hspace{0.05cm} \sum_{r=1}^d \hspace{0.1cm} \beta_r \cdot x_{i1}^r \hspace{0.05cm} + \hspace{0.05cm} \varepsilon_i \hspace{0.15cm}=\hspace{0.15cm} \beta_0  \hspace{0.05cm} + \hspace{0.05cm}   \beta_1 \cdot x_{i1}^1  \hspace{0.05cm} +  \hspace{0.05cm}  \beta_2 \cdot x_{i1}^2  \hspace{0.05cm} + \dots +  \hspace{0.05cm}  \beta_d \cdot x_{i1}^d \hspace{0.05cm} + \hspace{0.05cm} \varepsilon_i \hspace{0.3cm} , \hspace{0.3cm} \forall \hspace{0.1cm} i \in \lbrace 1,...,n \rbrace$$ 





Donde:

- $\varepsilon_i \sim N(0,\sigma^2) \hspace{0.25cm} , \hspace{0.25cm} \forall \hspace{0.1cm} i \in \lbrace 1,...,n\rbrace \\$

- $Corr(\varepsilon_i , \varepsilon_r) = 0 \hspace{0.25cm} , \hspace{0.25cm} \forall \hspace{0.1cm} i \neq r \in \lbrace 1,...,n\rbrace \\$

- $\beta_0,\beta_1,...,\beta_d  \in \mathbb{R}\\$


Observación: de lo anterior se deduce que  $\hspace{0.25cm} \mathcal{Y}_i \sim N(\hspace{0.1cm} \beta_0 \hspace{0.05cm} + \hspace{0.05cm} \sum_{r=1}^d \hspace{0.1cm} \beta_r \cdot x_{i1}^r \hspace{0.15cm},\hspace{0.15cm} \sigma^2 \hspace{0.1cm} )$





La predicción de la variable respuesta para una observacioón cualquiera del predictor $\hspace{0.1cm}x_{*1} \in \mathbb{R}\hspace{0.1cm}$, según el algoritmo de regresión lineal, es la siguiente: $\\[0.4cm]$



$$\widehat{\hspace{0.01cm} y \hspace{0.01cm}}_*  \hspace{0.15cm}=\hspace{0.15cm} \widehat{\beta}_0 +  \sum_{r=1}^d \hspace{0.12cm} \widehat{\beta}_r \cdot x_{*1}^r     \hspace{0.3cm} , \hspace{0.25cm} \forall \hspace{0.1cm} x_{*1} \in \mathbb{R}$$


Matricialmente, el vector de predicciones de la respuesta para una muestra cualquiera $\hspace{0.01cm} X_1\hspace{0.01cm}$ de tamaño  $\hspace{0.1cm}h\hspace{0.1cm}$      del predictor $\hspace{0.01cm}\mathcal{X}_1\hspace{0.01cm}$, es el siguiente:

$$\widehat{Y} \hspace{0.1cm} = \hspace{0.1cm} \widehat{\beta}_0 \hspace{0.1cm}+\hspace{0.1cm}  \widehat{\beta}_1 \cdot X_1 \hspace{0.1cm}+\hspace{0.1cm}  \widehat{\beta}_2 \cdot X_1^2 \hspace{0.1cm}+\hspace{0.1cm} \dots \hspace{0.1cm}+\hspace{0.1cm} \widehat{\beta}_d \cdot X_1^d \hspace{0.3cm} , \hspace{0.3cm} \forall \hspace{0.1cm} X_1 \in \mathbb{R}^h \\$$


donde los parámetros $\hspace{0.12cm}\widehat{\beta}_0 , \widehat{\beta}_1,...,\widehat{\beta}_p\hspace{0.12cm}$ se obtienen resolviendo el **problema de mínimos cuadrados ordinarios**:

$$\widehat{\beta} \hspace{0.15cm}=\hspace{0.15cm} \left( \widehat{\beta}_0 , \widehat{\beta}_1,...,\widehat{\beta}_d \right)  \hspace{0.2cm} = \hspace{0.2cm} arg \hspace{0.2cm} \underset{ \beta_0 , \beta_1,...,\beta_d}{Min} \hspace{0.2cm} \sum_{i=1}^n  \hspace{0.12cm} \left(  y_i - \left( \hspace{0.12cm} \beta_0 + \sum_{r=1}^d \hspace{0.1 cm} \beta_r \cdot x_{i1}^r \hspace{0.12cm} \right) \right)^2 \\[1.5cm]
\hspace{4.6cm} \text{sujeto a:}  \hspace{0.35cm}  \beta_0 , \beta_1,...,\beta_d \in \mathbb{R}$$

 

<br>

Existe una solución cerrada para este problema de optimización, y se puede demostrar que es la siguiente:


$$\widehat{\beta}\hspace{0.1cm}=\hspace{0.1cm}(X^t \cdot X)^{-1} \cdot X^t \cdot Y$$

donde: 

$$\hspace{0.1cm} X \hspace{0.1cm}=\hspace{0.1cm} [\hspace{0.05cm}\mathbb{1} , X_1,X_1^2,...,X_1^d \hspace{0.05cm}]$$


No entraremos aquí en los detalles matemáticos sobre como se obtiene esta solución. Lo reservamos para futuros artículos sobre métodos de optimización aplicados a la ciencia de datos.




> Por tanto el modelos de regresión polinómica de grado $d$ con predictor $\hspace{0.1cm}\mathcal{X}_1\hspace{0.1cm}$ es simplemente un modelo de regresión lineal con los predictores $\hspace{0.1cm}\mathcal{X}_1, \mathcal{X}_1^2 ,...,\mathcal{X}_1^d$




<br>


## Seleccion del grado del polinomio

En la práctica lo habitual es   seleccionar un grado $\hspace{0.1cm} d \leq 4 \hspace{0.1cm}$, ya que cuanto mayor sea el grado, mayor es la flexibilidad del polinomio y mayor el sobre-ajuste del modelo.



<br>


## Problemas

Es mucho más complicado realizar inferencia con el modelo de regresión polinómica que con el de regresión lineal.


<br>


<br>


# Regresión con funciones escalón <a class="anchor" id="52"></a>


- Se considera $\hspace{0.1cm} 1\hspace{0.1cm}$ predictor **cuantitativo** $\hspace{0.1cm}\mathcal{X}_1\hspace{0.1cm}$ y una variable respuesta $\hspace{0.1cm}\mathcal{Y}$ $\\[0.5cm]$


- Se tiene una muestra de observaciones $\hspace{0.1cm}X_1 = (x_{11},...,x_{n1})^t\hspace{0.1cm}$ del predictor $\hspace{0.1cm}\mathcal{X}_1\hspace{0.1cm}$  $\\[0.5cm]$


- Se tiene una muestra de observaciones $\hspace{0.1cm}Y = (y_1,...,y_n)^t\hspace{0.1cm}$ de la respuesta $\hspace{0.1cm}\mathcal{Y}$ $\\[0.5cm]$


- En conclusión, se tiene una muestra de observaciones $\hspace{0.12cm}D=[\hspace{0.12cm}X_1,Y \hspace{0.12cm}]\hspace{0.12cm}$
del predictores y la respuesta. $\\[1cm]$


- Se tienen que considerar una serie de $\hspace{0.1cm} k+1\hspace{0.1cm}$ intervalos $\hspace{0.1cm} L = \lbrace \hspace{0.15cm} [L_0 , L_1),[L_1 , L_2),...,[L_{k-1} , L_k)[L_k , L_{k+1}) \hspace{0.1cm} \rbrace  \hspace{0.1cm}$ tales que: $\\[0.4cm]$

    - Son disjuntos dos a dos, es decir, no comparten elementos dos a dos. $$[L_h , L_{h+1})\cap [L_{r} , L_{r+1}) = \varnothing   \hspace{0.3cm}  ,   \hspace{0.3cm} \forall  \hspace{0.1cm} h\neq r \in \lbrace 0,1,...,k \rbrace \\[0.5cm]$$

    - Toda observación de la muestra $X_1$ pertenece a alguno de los intervalos:

$$x_{i1} \in [L_0 , L_1)\cup ... \cup [L_{k-1} , L_k)\cup [L_k , L_{k+1}) \hspace{0.3cm}  ,   \hspace{0.3cm}  \forall \hspace{0.1cm} i \in \lbrace 1,..,n \rbrace \\$$




Se definen las siguientes variables **dummies**:


$$D_j(X_{1})\hspace{0.15cm} = \hspace{0.15cm} \left(\hspace{0.15cm} I\left(\hspace{0.05cm} x_{i1} \in [L_j , L_{j+1}) \hspace{0.05cm} \right) \hspace{0.2cm} : \hspace{0.2cm} i\in \lbrace 1,...,n   \rbrace  \hspace{0.15cm} \right)^t \hspace{0.15cm}=\hspace{0.15cm} \left( \hspace{0.15cm} d_{ij}  \hspace{0.2cm} : \hspace{0.2cm} i\in \lbrace 1,...,n   \rbrace  \hspace{0.15cm} \right) \hspace{0.3cm}  ,   \hspace{0.3cm}  \forall \hspace{0.1cm} j \in \lbrace 1,..,k \rbrace\\$$  



Donde: $\hspace{0.2cm}d_{ij} = I\left(\hspace{0.05cm} x_{i1} \in [L_j , L_{j+1}) \hspace{0.05cm} \right) \hspace{0.2cm}$ y  $\hspace{0.2cm} I (\cdot) \hspace{0.15cm}$ es la función indicatriz o indicadora.

<br>


El modelo estadístico que se plantea en regresión con funciones escalón de grado $\hspace{0.1cm}k\hspace{0.1cm}$ es el siguiente:

Tenemos una m.a.s $\hspace{0.1cm}\mathcal{Y}_1,...,\mathcal{Y}_n\hspace{0.1cm}$ de la v.a. $\hspace{0.1cm}\mathcal{Y}$

Se tiene la siguiente relación:

$$\mathcal{Y}_i \hspace{0.15cm}=\hspace{0.15cm}       \beta_0 \hspace{0.05cm} + \hspace{0.05cm} \sum_{j=1}^k \hspace{0.1cm} \beta_j \cdot d_{ij} \hspace{0.05cm} + \hspace{0.05cm} \varepsilon_i \hspace{0.15cm}=\hspace{0.15cm}       \beta_0 \hspace{0.05cm} + \hspace{0.05cm} \sum_{j=1}^k \hspace{0.1cm} \beta_j \cdot I\left(\hspace{0.05cm} x_{i1} \in [L_j , L_{j+1}) \hspace{0.05cm} \right) \hspace{0.05cm} + \hspace{0.05cm} \varepsilon_i  \hspace{0.3cm} , \hspace{0.3cm} \forall \hspace{0.1cm} i \in \lbrace 1,...,n \rbrace$$ 



Donde:

- $\varepsilon_i \sim N(0,\sigma^2) \hspace{0.25cm} , \hspace{0.25cm} \forall \hspace{0.1cm} i \in \lbrace 1,...,n\rbrace \\$

- $Corr(\varepsilon_i , \varepsilon_r) = 0 \hspace{0.25cm} , \hspace{0.25cm} \forall \hspace{0.1cm} i \neq r \in \lbrace 1,...,n\rbrace \\$

- $\beta_0,\beta_1,...,\beta_d  \in \mathbb{R}\\$


Observación: de lo anterior se deduce que  $\hspace{0.25cm} \mathcal{Y}_i \sim N(\hspace{0.1cm} \beta_0 \hspace{0.05cm} + \hspace{0.05cm} \sum_{j=1}^k \hspace{0.1cm} \beta_j \cdot d_{ij} \hspace{0.15cm},\hspace{0.15cm} \sigma^2 \hspace{0.1cm} )$




<br>



La predicción de la variable respuesta para una observación cualquiera del predictor $\hspace{0.1cm}x_{*1} \in \mathbb{R}\hspace{0.1cm}$, según el algoritmo de regresión con funciones escalón, es la siguiente: $\\[0.4cm]$



$$\widehat{\hspace{0.01cm} y \hspace{0.01cm}}_*  \hspace{0.15cm}=\hspace{0.15cm}            \widehat{\beta}_0 \hspace{0.05cm} + \hspace{0.05cm}  \sum_{j=1}^k \hspace{0.12cm} \widehat{\beta}_j \cdot d_{*j}    \hspace{0.15cm}=\hspace{0.15cm}   \widehat{\beta}_0 \hspace{0.05cm} + \hspace{0.05cm}  \sum_{j=1}^k \hspace{0.12cm} \widehat{\beta}_j \cdot I\left(\hspace{0.05cm} x_{*1} \in [L_j , L_{j+1}) \right)  \hspace{0.3cm} , \hspace{0.25cm} \forall \hspace{0.1cm} x_{*1} \in \mathbb{R}$$


Matricialmente, el vector de predicciones de la respuesta para una muestra cualquiera $\hspace{0.01cm} X_1\hspace{0.01cm}$ de tamaño  $\hspace{0.1cm}h\hspace{0.1cm}$      del predictor $\hspace{0.01cm}\mathcal{X}_1\hspace{0.01cm}$, es el siguiente:

$$\widehat{Y} \hspace{0.1cm} = \hspace{0.1cm} \widehat{\beta}_0 \hspace{0.1cm}+\hspace{0.1cm}  \widehat{\beta}_1 \cdot D_1(X_1) \hspace{0.1cm}+\hspace{0.1cm}  \widehat{\beta}_2 \cdot D_2(X_1) \hspace{0.1cm}+\hspace{0.1cm} \dots \hspace{0.1cm}+\hspace{0.1cm} \widehat{\beta}_k \cdot D_k(X_1) \hspace{0.3cm} , \hspace{0.3cm} \forall \hspace{0.1cm} X_1 \in \mathbb{R}^h \\$$


donde los parámetros $\hspace{0.12cm}\widehat{\beta}_0 , \widehat{\beta}_1,...,\widehat{\beta}_p\hspace{0.12cm}$ se obtienen resolviendo el **problema de mínimos cuadrados ordinarios**:

$$\widehat{\beta} \hspace{0.15cm}=\hspace{0.15cm} \left( \widehat{\beta}_0 , \widehat{\beta}_1,...,\widehat{\beta}_d \right)  \hspace{0.2cm} = \hspace{0.2cm} arg \hspace{0.2cm} \underset{ \beta_0 , \beta_1,...,\beta_d}{Min} \hspace{0.2cm} \sum_{i=1}^n  \hspace{0.12cm} \left(  y_i - \left( \hspace{0.12cm} \beta_0 + \sum_{j=1}^k \hspace{0.12cm} \widehat{\beta}_j \cdot d_{*j} \hspace{0.12cm} \right) \right)^2  \hspace{0.2cm} = \hspace{0.2cm} arg \hspace{0.2cm} \underset{ \beta_0 , \beta_1,...,\beta_d}{Min} \hspace{0.2cm} \sum_{i=1}^n  \hspace{0.12cm} \left(  y_i - \left( \hspace{0.12cm} \beta_0 +  \sum_{j=1}^k \hspace{0.12cm} \widehat{\beta}_j \cdot I\left(\hspace{0.05cm} x_{*1} \in [L_j , L_{j+1}) \right)   \hspace{0.12cm} \right) \right)^2 \\[1.5cm]
\hspace{-15cm} \text{sujeto a:}  \hspace{0.35cm}  \beta_0 , \beta_1,...,\beta_d \in \mathbb{R}$$

 

<br>

Existe una solución cerrada para este problema de optimización, y se puede demostrar que es la siguiente:


$$\widehat{\beta}\hspace{0.1cm}=\hspace{0.1cm}(X^t \cdot X)^{-1} \cdot X^t \cdot Y$$

donde: 

$$\hspace{0.1cm} X \hspace{0.1cm}=\hspace{0.1cm} [\hspace{0.05cm}\mathbb{1} , D_1(X_1),D_2(X_1),...,D_k(X_1) \hspace{0.05cm}]$$


No entraremos aquí en los detalles matemáticos sobre como se obtiene esta solución. Lo reservamos para futuros artículos sobre métodos de optimización aplicados a la ciencia de datos.




<br>


**Observaciones**

- No se incluye $\hspace{0.1cm}D_0(X_1)\hspace{0.1cm}$ en el modelo porque si no habría   multicolinealidad perfecta y no se podría estimar el modelo. $\\[0.5cm]$

- Una cuestión en la regresión con fucniones escalón es la de cómo determinar los intervalos. Para ello se suelen usar los cuantiles del predictor.

     Si se quieren $\hspace{0.1cm} k\hspace{0.1cm}$ intervalos se usan los cuantiles que van de $\hspace{0.1cm}100/k\hspace{0.1cm}$ en $\hspace{0.1cm}100/k\hspace{0.1cm}$ para definir los extremos de los intervalos. 

     - Por ejemplo si queremos $\hspace{0.12cm}k=5\hspace{0.12cm}$ , entonces se usan los cuantiles que van de $\hspace{0.12cm}100/5=20\hspace{0.12cm}$ en $\hspace{0.12cm}20\hspace{0.12cm}$ , es decir, los cuantiles $\hspace{0.12cm}Q_0\hspace{0.1cm},\hspace{0.1cm} Q_{20}\hspace{0.1cm},\hspace{0.1cm}Q_{40}\hspace{0.1cm},\hspace{0.1cm}Q_{60}\hspace{0.1cm},\hspace{0.1cm}Q_{80}\hspace{0.1cm},\hspace{0.1cm} Q_{100}\hspace{0.12cm}$  para definir los extremos de los intervalos. Así  los intervalos serían los siguientes:
    
    $$[Q_0 , Q_{20}) \hspace{0.1cm},\hspace{0.1cm} [Q_{20} , Q_{40}) \hspace{0.1cm},\hspace{0.1cm} [Q_{40}, Q_{60})\hspace{0.1cm} ,\hspace{0.1cm} [Q_{60} , Q_{80})\hspace{0.1cm} ,\hspace{0.1cm} [Q_{80}, Q_{100} + c)$$
    
    Donde: $\hspace{0.15cm} c>0$ , $\hspace{0.15cm}Q_0 = Min(X_1) \hspace{0.15cm}$ , $\hspace{0.15cm}Q_{100}=Max(X_1)$
    
 
     - Notese que se añade $\hspace{0.12cm}c>0\hspace{0.12cm}$ para cumplir la condición de que toda observacion de $\hspace{0.12cm}X_1\hspace{0.12cm}$ pertenezca a alguno de os intervalos. Si no se añadiese, entonces la observación $\hspace{0.12cm}Max(X_1)\hspace{0.12cm}$ no estaria en ninguno de los intervalos, al ser el último abierto en su extremo superior. $\\[0.5cm]$


- El número de intervalos no debe ser excesivo, puesto cuanto mayor sea menos observaciones caen en cada intervalo, y menos precisas son las estimaciones. $\\[0.5cm]$

- La regresión con funciones escalón es un modelo muy fácil de interpretar:

    - $\beta_0 \hspace{0.15cm}$ es la media  de $\hspace{0.15cm}X_1\hspace{0.15cm}$ en el intervalo $[L_0 , L_1)$ . Mientras que  $\hspace{0.15cm}\beta_j\hspace{0.15cm}$ es la media de $\hspace{0.15cm}X_1\hspace{0.15cm}$ en el intervalo $\hspace{0.15cm}[L_0 , L_1)\hspace{0.15cm}$ y algo mas (o algo menos). $\\[0.5cm]$

- El modelo de regresión con funciones escalón con el predictor **cuantitativo** $\hspace{0.1cm}X_1\hspace{0.1cm}$  y los intervalos $\hspace{0.1cm} L = \lbrace \hspace{0.1cm} [L_0 , L_1) \hspace{0.1cm},\hspace{0.1cm} [L_1 , L_2) \hspace{0.1cm},...,\hspace{0.1cm}[L_{k-1} , L_k)[L_k , L_k+1] \hspace{0.1cm}\rbrace\hspace{0.1cm}$ es equivalente al modelo de regresión lineal con el predictor **cuantitativo** $\hspace{0.1cm}X_1\hspace{0.1cm}$ categorizado en base a los intervalos de $\hspace{0.1cm}L \\[0.6cm]$




    Veamos este último punto con más detalle:

   

    La versión categorizada de  $\hspace{0.1cm}X_1\hspace{0.1cm}$ se puede definir como: $\\[0.5cm]$


    $$X_1^{cat} \hspace{0.1cm}=\hspace{0.1cm} (\hspace{0.1cm} x^{cat}_{i1} \hspace{0.1cm}/\hspace{0.1cm} i=1,..,n \hspace{0.1cm}\hspace{0.1cm}) \\$$

    Donde: 

    $$ x^{cat}_{i1}\hspace{0.1cm} =\hspace{0.1cm} \left\lbrace\begin{array}{l} 0, \hspace{0.2cm}\text{ Si} \hspace{0.25cm} x_{ik} \in [L_{0},L_{1}) \\ 1, \hspace{0.2cm}\text{ Si} \hspace{0.25cm} x_{ik} \in [L_{1},L_{2}) \\ ... \\ k, \hspace{0.2cm}\text{ Si } \hspace{0.25cm} x_{ik} \in [L_{k},L_{k+1})  \end{array}\right. $$

<br>

El modelo de regresión lineal con el predictor $\hspace{0.1cm}X_1^{cat}\hspace{0.1cm}$ es de la forma: $\\[0.5cm]$

$$\mathcal{Y}_i \hspace{0.15cm}=\hspace{0.15cm}       \beta_0 \hspace{0.05cm} + \hspace{0.05cm} \sum_{j=1}^k \hspace{0.1cm} \beta_j \cdot D(x_{i1}^{cat} = j)  \hspace{0.05cm} + \hspace{0.05cm} \varepsilon_i   \hspace{0.3cm} , \hspace{0.3cm} \forall \hspace{0.1cm} i \in \lbrace 1,...,n \rbrace$$ 



 

  Donde:

  $$D(x_{i1}^{cat} = j)  \hspace{0.15cm} = \hspace{0.15cm} \left(\hspace{0.1cm} I (\hspace{0.05cm} x_{i1}^{cat} = h \hspace{0.05cm} ) \hspace{0.2cm} / \hspace{0.2cm} i\in \lbrace 1,...,n \rbrace    \hspace{0.1cm} \right)^t  \hspace{0.15cm} = \hspace{0.15cm} \left(\hspace{0.1cm} I (\hspace{0.05cm} x_{i1} \in [L_h , L_{h+1} ) \hspace{0.05cm} ) \hspace{0.2cm} / \hspace{0.2cm} i=1,...,n    \hspace{0.1cm} \right)^t \hspace{0.15cm} = \hspace{0.15cm} D_j(X_1) \hspace{0.45cm} \forall \hspace{0.1cm} j  \in \lbrace 0,1,...,k \rbrace \\$$


  Por tanto, queda demostrado que son el mismo modelo.





<br>



# Regresión con polinomios a trozos

Surge como combinación de la regresión polinómica y la regresión con funciones escalón.

La idea es usar la filosofía de la regresión con funciones escalón pero en lugar de usar una función constante en cada intervalo, usar una función polinómica.



PONER GRAFICO PARA ILUSTRAR LA IDEA

<br>


- Se considera $\hspace{0.1cm} 1\hspace{0.1cm}$ predictor **cuantitativo** $\hspace{0.1cm}\mathcal{X}_1\hspace{0.1cm}$ y una variable respuesta $\hspace{0.1cm}\mathcal{Y}$ $\\[0.5cm]$


- Se tiene una muestra de observaciones $\hspace{0.1cm}X_1 = (x_{11},...,x_{n1})^t\hspace{0.1cm}$ del predictor $\hspace{0.1cm}\mathcal{X}_1\hspace{0.1cm}$  $\\[0.5cm]$


- Se tiene una muestra de observaciones $\hspace{0.1cm}Y = (y_1,...,y_n)^t\hspace{0.1cm}$ de la respuesta $\hspace{0.1cm}\mathcal{Y}$ $\\[0.5cm]$


- En conclusión, se tiene una muestra de observaciones $\hspace{0.12cm}D=[\hspace{0.12cm}X_1,Y \hspace{0.12cm}]\hspace{0.12cm}$
del predictores y la respuesta. $\\[1cm]$


- Se tienen que considerar una serie de $\hspace{0.1cm} k+1\hspace{0.1cm}$ intervalos $\hspace{0.1cm} L = \lbrace \hspace{0.15cm} [L_0 , L_1),[L_1 , L_2),...,[L_{k-1} , L_k)[L_k , L_{k+1}) \hspace{0.1cm} \rbrace  \hspace{0.1cm}$ tales que: $\\[0.4cm]$

    - Son disjuntos dos a dos, es decir, no comparten elementos dos a dos. $$[L_h , L_{h+1})\cap [L_{r} , L_{r+1}) = \varnothing   \hspace{0.3cm}  ,   \hspace{0.3cm} \forall  \hspace{0.1cm} h\neq r \in \lbrace 0,1,...,k \rbrace \\[0.5cm]$$

    - Toda observación de la muestra $X_1$ pertenece a alguno de los intervalos:

$$x_{i1} \in [L_0 , L_1)\cup ... \cup [L_{k-1} , L_k)\cup [L_k , L_{k+1}) \hspace{0.3cm}  ,   \hspace{0.3cm}  \forall \hspace{0.1cm} i \in \lbrace 1,..,n \rbrace \\$$






La idea es, en cada intervalo ajustar una regresión polinómica, con ciertas restricciones.



Supongamos que se ajusta un polinomio de grado $\hspace{0.1cm}d_h\hspace{0.1cm}$ en el intervalo $\hspace{0.1cm}[L_j , L_{j+1})\hspace{0.1cm}$ , para $\hspace{0.1cm} j\in \lbrace 0,1,...,k \rbrace\hspace{0.1cm}$, el modelo de regresión sería de la forma: $\\[0.5cm]$




El modelo estadístico que se plantea en regresión con  polinomios a trozos de grado $\hspace{0.1cm}k\hspace{0.1cm}$ es el siguiente:

Tenemos una m.a.s $\hspace{0.1cm}\mathcal{Y}_1,...,\mathcal{Y}_n\hspace{0.1cm}$ de la v.a. $\hspace{0.1cm}\mathcal{Y}$

Se asume la siguiente relación:

$$\mathcal{Y}_i \hspace{0.15cm}=\hspace{0.15cm}     \sum_{h=0}^k \hspace{0.05cm} \left[ \hspace{0.1 cm}  \beta_{0h}    +   \left( \hspace{0.1 cm} \sum_{r=1}^{d_h} \hspace{0.1cm}  \beta_{rh} \cdot x_{i1}^{r} \hspace{0.1 cm} \right) \cdot D_h(X_1) \hspace{0.05cm} \right]  \hspace{0.1 cm} +  \hspace{0.1 cm} \varepsilon_i \hspace{0.15cm}=\hspace{0.15cm}      \sum_{h=0}^k \hspace{0.05cm} \left[ \beta_{0h}  + \hspace{0.1 cm} \left( \hspace{0.1 cm}   \sum_{r=1}^{d_h} \hspace{0.1cm} \beta_{rh} \cdot x_{i1}^{r} \right) \hspace{0.05cm} \cdot I( \hspace{0.05cm} x_{i1} \in [L_h , L_{h+1}) \hspace{0.05cm} \right]  \hspace{0.1 cm} +  \hspace{0.1 cm} \varepsilon_i \hspace{0.35cm} , \hspace{0.35cm} \forall \hspace{0.1cm} i \in \lbrace 1,...,n \rbrace$$ 





Donde:

- $\varepsilon_i \sim N(0,\sigma^2) \hspace{0.25cm} , \hspace{0.25cm} \forall \hspace{0.1cm} i \in \lbrace 1,...,n\rbrace \\$

- $Corr(\varepsilon_i , \varepsilon_r) = 0 \hspace{0.25cm} , \hspace{0.25cm} \forall \hspace{0.1cm} i \neq r \in \lbrace 1,...,n\rbrace \\$

- $\beta_0,\beta_1,...,\beta_d  \in \mathbb{R}\\$


**Observaciones:**

- De lo anterior se deduce que  $\hspace{0.25cm} \mathcal{Y}_i \sim N(\hspace{0.1cm} \beta_0 \hspace{0.05cm} + \hspace{0.05cm} \sum_{j=1}^k \hspace{0.1cm} \beta_j \cdot d_{ij} \hspace{0.15cm},\hspace{0.15cm} \sigma^2 \hspace{0.1cm} )$

- La regresión polinomica a trozos consiste en plantear un modelo de regresión polinómica de grado $\hspace{0.1cm}d_h\hspace{0.1cm}$ para las observaciones del predictor que pertenecen al intervalo   $\hspace{0.1cm}[L_h , L_{h+1})\hspace{0.1cm}$, y esto para cada $\hspace{0.1cm}h=0,1,...,k$

<br>




La predicción de la variable respuesta para una observación cualquiera del predictor $\hspace{0.1cm}x_{*1} \in \mathbb{R}\hspace{0.1cm}$, según el algoritmo de regresión lineal con polinomios a trozos, es la siguiente: $\\[0.4cm]$



$$\widehat{\hspace{0.01cm} y \hspace{0.01cm}}_*  \hspace{0.15cm}=\hspace{0.15cm}
 \sum_{h=0}^k \hspace{0.05cm} \left[\hspace{0.1cm}  \widehat{\beta}_{0h} + \left(\hspace{0.05cm} \sum_{r=1}^{d_h} \hspace{0.1cm} \widehat{\beta}_{rh} \cdot x_{*1}^{r} \hspace{0.05cm}\right) \cdot D_h(X_1) \hspace{0.05cm} \right]
\hspace{0.15cm}=\hspace{0.15cm}
\sum_{h=0}^k \hspace{0.05cm} \left[ \hspace{0.05cm}  \widehat{\beta}_{0h} + \hspace{0.1 cm} \left( \hspace{0.05cm} \sum_{r=1}^{d_h} \hspace{0.1cm} \widehat{\beta}_{rh} \cdot x_{*1}^{r} \hspace{0.05cm}\right) \cdot I\left( \hspace{0.05cm} x_{*1} \in [L_h , L_{h+1}) \hspace{0.05cm} \right) \hspace{0.05cm} \right]
\hspace{0.3cm} , \hspace{0.3cm} \forall \hspace{0.1cm} x_{*1} \in \mathbb{R}$$

<br>

donde los parámetros $\hspace{0.15cm} \widehat{\beta} \hspace{0.05cm}=\hspace{0.05cm} \left( \hspace{0.1cm} \widehat{\beta}_{h} \hspace{0.1cm} : \hspace{0.1cm} h\in \lbrace 0,1,..,k \rbrace \hspace{0.1cm} \right) \hspace{0.05cm}=\hspace{0.05cm} \left( \hspace{0.1cm} \widehat{\beta}_{0h} , \widehat{\beta}_{1h},...,\widehat{\beta}_{d_h h} \hspace{0.1cm} : \hspace{0.1cm} h\in \lbrace 0,1,..,k \rbrace \hspace{0.1cm} \right) \hspace{0.2cm}$ se obtienen resolviendo el **problema de mínimos cuadrados ordinarios**, asociado a la regresión polinómica, en cada uno de los intervalos definidos para el predictor:




$$\widehat{\beta}_h \hspace{0.05cm}=\hspace{0.05cm} \left( \hspace{0.1cm} \widehat{\beta}_{0h} , \widehat{\beta}_{1h},...,\widehat{\beta}_{d_h h}  \hspace{0.1cm} \right) \hspace{0.2cm} = \hspace{0.2cm} arg \hspace{0.3cm} \underset{ \beta_{0h} , \beta_{1h},...,\beta_{d_h h}  }{Min}  \sum_{ \hspace{0.5cm}  i \in \lbrace 1,...,n \rbrace \\ \hspace{0.2cm} x_{i1} \in [L_h , L_{h+1})}  \left(  y_i - \left( \hspace{0.1cm} \widehat{\beta}_{0h} \hspace{0.05cm} + \hspace{0.05cm}      \sum_{r=1}^{d_h} \hspace{0.1cm} \widehat{\beta}_{rh} \cdot x_{i1}^{r} \right) \hspace{0.1cm} \right)^2$$


Para cada $\hspace{0.1cm}h\in \lbrace 0,1,...,k \rbrace\hspace{0.1cm}$,  existe una solución cerrada para este problema de optimización, y se puede demostrar que es la siguiente:


$$\widehat{\beta}_h\hspace{0.1cm}=\hspace{0.1cm}(X_h^t \cdot X_h)^{-1} \cdot X_h^t \cdot Y$$

donde: 

$$\hspace{0.1cm} X_h \hspace{0.1cm}=\hspace{0.1cm} [\hspace{0.05cm}\mathbb{1} , X_{1h},X_{1h}^2,...,X_{1h}^{d_h} \hspace{0.05cm}]$$


$$X_{1h} = \left(\hspace{0.2cm}  x_{i1} \hspace{0.2cm} : \hspace{0.2cm} i \in \lbrace 1,...,n \rbrace \hspace{0.2cm} \text{y} \hspace{0.2cm} x_{i1} \in [L_h , L_{h+1}) \hspace{0.2cm}  \right)$$


 



<br>


<br>
