---
title: 'Model Selection in Linear Regression'
author: 'Fabio Scielzo Ortiz'
date: '10/1/23'
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

$\hspace{0.3cm}$ **Si utilizas este artículo, por favor, cítalo:** 

$\hspace{0.5cm}$ Scielzo Ortiz, F. (2022). El algoritmo KNN. http://estadistica4all.com/Articulos/KNN.html


</p>
 
</p></span>
</div>


***Se recomienda abrir el artículo en un ordenador o en una tablet.***
 
 
 
 <br>
 
 
Se recomienda la lectura de algunos artículos de [Estadistica4all](http://estadistica4all.com/) como paso previo a la lectura de este articulo. En concreto el artículo sobre el [modelo de regresión lineal](http://estadistica4all.com/Articulos/Linear-Regression-new.html).
 
 
 
 
 <br>


# El algoritmo de regresión lineal <a class="anchor" id="5"></a>



En esta seccion vamos a presentar el modelo de regresión lineal desde un enfoque algorítmico, como algoritmo de regresión.

- Se consideran $\hspace{0.1cm} p\hspace{0.1cm}$ variables estadísticas $\hspace{0.1cm}\mathcal{X}_1,...,\mathcal{X}_p\hspace{0.1cm}$ y una variable respuesta $\hspace{0.1cm}\mathcal{Y}$ $\\[0.5cm]$




- Se tiene una muestra de observaciones $\hspace{0.1cm}X_r = (x_{1r},...,x_{nr})^t\hspace{0.1cm}$ de la variable $\hspace{0.1cm}\mathcal{X}_r\hspace{0.1cm}$ , para cada $\hspace{0.1cm}r \in \lbrace 1,...,p \rbrace$ $\\[0.5cm]$


- Se tiene una muestra de observaciones $\hspace{0.1cm}Y = (y_1,...,y_n)^t\hspace{0.1cm}$ de la variable $\hspace{0.1cm}\mathcal{Y}$ $\\[0.5cm]$


- En conclusión, se tiene una muestra de observaciones $\hspace{0.12cm}D=[\hspace{0.12cm}X_1,...,X_p,Y \hspace{0.12cm}]\hspace{0.12cm}$
de los predictores y la respuesta. $\\[0.5cm]$

La predicción de la variable respuesta para un vector cualquiera de observaciones   de los predictores $\hspace{0.1cm}x_{*} \in \mathbb{R}^{p}\hspace{0.1cm}$, según el algoritmo de regresión lineal, es la siguiente:



$$\hat{y}_*  \hspace{0.15cm}=\hspace{0.15cm} \widehat{\beta}_0 +  \sum_{r=1}^p \hspace{0.12cm} \widehat{\beta}_r \cdot x_{*r} \hspace{0.3cm} , \hspace{0.25cm} \forall \hspace{0.1cm} x_* \in \mathbb{R}^p$$

donde los parametros $\hspace{0.12cm}\widehat{\beta}_0 , \widehat{\beta}_1,...,\widehat{\beta}_p\hspace{0.12cm}$ se obtienen resolviendo el problema de mínimos cuadrados ordinarios:

$$\widehat{\beta} \hspace{0.15cm}=\hspace{0.15cm} \left( \widehat{\beta}_0 , \widehat{\beta}_1,...,\widehat{\beta}_p \right)  \hspace{0.2cm} = \hspace{0.2cm} arg \hspace{0.2cm} \underset{ \beta_0 , \beta_1,...,\beta_p}{Min} \hspace{0.2cm} \sum_{i=1}^n  \hspace{0.12cm} \left(  y_i - \left( \hspace{0.12cm} \beta_0 + \sum_{r=1}^p \hspace{0.1 cm} \beta_r \cdot x_{ir} \hspace{0.12cm} \right) \right)^2$$

 

<br>

Existe una solución cerrada para este problema de optimización, y se puede demostrar que es la siguiente:


$$\widehat{\beta}\hspace{0.1cm}=\hspace{0.1cm}(X^t \cdot X)^{-1} \cdot X^t \cdot Y$$

donde: 

$$\hspace{0.1cm} X \hspace{0.1cm}=\hspace{0.1cm} [\hspace{0.05cm}\mathbb{1} , X_1,...,X_p \hspace{0.05cm}]$$

<br>


**Observaciones:**

- La muestra $\hspace{0.12cm}D=[\hspace{0.12cm}X_1,...,X_p,Y\hspace{0.12cm}]\hspace{0.12cm}$ esta jugando el papel de muestra de entrenamiento. $\\[0.4cm]$



- Es de especial interés el caso en el que $\hspace{0.12cm}x_*\hspace{0.12cm}$  es una nueva observación de los predictores para la que se desconoce el valor de la respuesta, es decir, $\hspace{0.12cm}x_* = x_{new}$. 

- El algoritmo también permite predecir la respuesta para las observaciones de los predictores con las que el modelo ha sido entrenado, es decir:
    
    $$\hat{y}_i  \hspace{0.15cm}=\hspace{0.15cm} \widehat{\beta}_0 +  \sum_{r=1}^p \hspace{0.12cm} \widehat{\beta}_r \cdot x_{ir} \hspace{0.3cm} , \hspace{0.25cm} \forall \hspace{0.1cm} i =1,...,n \\$$
    
    

- Se denomina regresión **lineal** por que la ecuación con la que se predice la respuesta es una ecuación lineal en los betas.  $\\[0.4cm]$

- $\widehat{\beta}_0 +  \sum_{r=1}^p \hspace{0.12cm} \widehat{\beta}_r \cdot x\hspace{0.12cm}$ , con $\hspace{0.12cm}x\in \mathbb{R}^p\hspace{0.12cm}$, es el hiper-plano $\hspace{0.12cm}p$-dimensional que mejor se ajusta a los datos disponibles de la respusta y los predictores $\hspace{0.12cm}\lbrace (y_i,x_i) \hspace{0.12cm} / \hspace{0.12cm} i=1,...,n \rbrace\hspace{0.12cm}$, dado que es el hiper-plano óptimo en el sentido de minimos cuadrados ordinarios.





<br>
 
# La maldición de la dimensionalidad <a class="anchor" id="5"></a>

- Si la verdadera relación entre la variable respuesta y los predictores es aproximadamente lineal, las predicciones obtenidas con el algoritmo de regresión lineal tendrán un sesgo pequeño. Pero si la relación no es lineal el sesgo será grande. $\\[0.4cm]$

Supongamos que estamos en el mejor de los casos y la verdadera relacion entre la respuesta y los predictores es aproximadamente lineal, luego las predicciones tienen poco sesgo:


- Si el tamaño $\hspace{0.1cm}n\hspace{0.1cm}$ de la muestra de entrenamiento (en nuestra exposición anterior $\hspace{0.1cm}D\hspace{0.1cm}$ juega ese rol) es notablemente mayor que el número de predictores $\hspace{0.1cm}p\hspace{0.1cm}$, es decir, $\hspace{0.1cm}n>>p\hspace{0.1cm}$, entonces la predicciones obtenidas con el algoritmo de regresión lineal tendrán poca varianza, por tanto el modelo tendrá un buen desempeño prediciendo observaciones fuera de la muestra de train, al tener sus predicciones poco sesgo y varianza. $\\[0.4cm]$



- Si  $\hspace{0.1cm}n \approx p\hspace{0.1cm}$, entonces la predicciones obtenidas con el algoritmo de regresión lineal tendrán mucha varianza, por tanto el modelo tendrá un mal desempeño prediciendo observaciones fuera de la muestra de train, al tener sus predicciones mucha varianza, a pesar de que tengan poco sesgo. $\\[0.4cm]$


- Si  $\hspace{0.1cm}n < p\hspace{0.1cm}$, entonces el algoritmo de regresión lineal no puede entrenarse, puesto que no puede resolverse el problema de minimos cuadrados ordinarios.  Este hecho es conocido como la maldición de la dimensionalidad en regresión lineal. $\\[0.7cm]$


 
 



> Necesitamos metodos que nos permitan obtener modelos de regresión lineal competitivos con un numero de parametros bajo, para evitar así la maldicion de la dimensionalidad.


A continuación vamos a ver algoritmos que nos permiten, dado un modelo de regresión con $\hspace{0.1 cm}p\hspace{0.1 cm}$ predictores, y por tanto $\hspace{0.1 cm}p+1 \hspace{0.1cm}$ parámetros betas, seleccionar aquellos predictores que son más relevantes, y eliminar aquellos que aportan menos información útil para predecir la respuesta. Esto permite reducir en numero de parámetros de una forma eficiente, reduciendo asi el problema de la dimensionalidad, pero sin perder excesivo poder predictivo, e incluso ganándolo en algunos casos.


<br>

## Demonstración de la maldición de la dimensionalidad <a class="anchor" id="5"></a>

- Supongamos que $\hspace{0.12cm} p > n\hspace{0.12cm}$. Entonces es obvio que $\hspace{0.12cm} p +1 >n\hspace{0.12cm}$ $\\[0.5cm]$

- Sabemos que $\hspace{0.1 cm}X=[\hspace{0.1 cm}1,X_1,...,X_p\hspace{0.1 cm}]\hspace{0.12cm}$ es de un tamaño $\hspace{0.12cm}n\text{x}(p+1)\hspace{0.12cm}$, así que
$\hspace{0.12cm}X^t \cdot X\hspace{0.12cm}$ tiene un tamaño $\hspace{0.12cm}(p+1)\text{x}(p+1)$ $\\[0.5cm]$

- Como $\hspace{0.12cm}p + 1 \hspace{0.12cm}>\hspace{0.12cm} n\hspace{0.12cm}$ , entonces $\hspace{0.05cm}Max\hspace{0.12cm}Rg(X) = n \\[0.5cm]$ $\\[0.5cm]$



- Supongamos que $\hspace{0.12cm}Rg(X) = r \hspace{0.12cm}\leq\hspace{0.12cm} n \hspace{0.12cm}$. Entonces por el teorema de rango-nulidad se cumple que $\hspace{0.12cm}Rg(X^t \cdot X)= r$ $\\[0.5cm]$

- Como $\hspace{0.12cm}X^t \cdot X\hspace{0.12cm}$ es de tamaño $\hspace{0.12cm}(p+1)\text{x}(p+1)\hspace{0.12cm}\hspace{0.12 cm}$,
entonces $\hspace{0.12cm}Max\hspace{0.12cm}Rg(X^t \cdot X) = p+1$ $\\[0.5cm]$

- Y como $\hspace{0.12cm}Rg(X^t \cdot X)=r \hspace{0.12cm}\leq\hspace{0.12cm} n \hspace{0.12cm}<\hspace{0.12cm} p+1\hspace{0.12cm}$,
entonces  $\hspace{0.12cm}X^t \cdot X\hspace{0.12cm}$ **no tiene rango máximo** $\\[0.5cm]$

- Por tanto, la inversa de $\hspace{0.12cm}X^t \cdot X\hspace{0.12cm}$  no existe, es decir, no existe $\hspace{0.12cm}(X^t \cdot X )^{ -1}$ $\\[0.5cm]$

- Por tanto, no existe $\hspace{0.12cm}\widehat{\beta} = (X^t \cdot X)^{-1} \cdot X^t \cdot Y\hspace{0.12cm}$.


<br>



---

<br>

A continuación vamos a ver una técnica estadística clásica para la selección de predictores en regresión lineal, que en el fondo es un contraste de hipotesis.

Posteriormente veremos algoritmos iterativos de seleccion de predictores en regresion lineal, que son más modernos y tienen un enfoque más ligado al machine learning.



# F-test <a class="anchor" id="4"></a>

En regresión lineal dos contrastes de hipotesis muy relevantes son el contraste de significación individual y el contraste de significación global (ANOVA). Si se quiere ver una introducción a estos contrastes se recomienda el articulo sobre el [modelo de regresión lineal](http://estadistica4all.com/Articulos/Linear-Regression-new.html ) de [Estadistica4all](http://estadistica4all.com/).



Los contrastes de significación individual y global (ANOVA) son casos particulares del contraste F-test, el cual permite comarar modelos de regresión lineal, y con ello seleccionar predictores. Lo expondremos a continuación.



- Tenemos un modelo de regresión lineal estimado con $\hspace{0.1cm} p \hspace{0.1cm}$ predictores, y por tanto $\hspace{0.1cm} p+1 \hspace{0.1cm}$ coeficientes beta
 $\hspace{0.2cm} \Rightarrow \hspace{0.2cm} \Omega_{p+1}$

     -  $\Omega_{p+1} \ : \  \ \hat{y}_i = \widehat{\beta}_0 + \widehat{\beta}_1\cdot x_{i1} \hspace{0.1cm} +...+ \hspace{0.1cm} \beta_{p}\cdot x_{ip}  \\[0.5cm]$



-  Tenemos otro modelo de regresión lineal estimado con  solo
    $\hspace{0.1cm} q<p \hspace{0.1cm}$ de los $\hspace{0.1cm} p \hspace{0.1cm}$ predictores del modelo $\hspace{0.1cm}\Omega_{p+1}$ $\hspace{0.1cm} \Rightarrow \hspace{0.1cm}  \omega_{q+1}$

     -  $\omega_{q+1} \ : \  \ \hat{y}_i = \widehat{\beta}_0 + \widehat{\beta}_1\cdot x_{i1} +...+ \widehat{\beta}_{q}\cdot x_{iq}  \\[0.4cm]$ 




-   $\omega_q \hspace{0.1cm}$ es un sub-modelo del modelo $\hspace{0.1cm}\Omega_{p+1}\hspace{0.1cm}$ , podemos denotar esto como    $\hspace{0.1cm} \omega_{q+1} \subset \Omega_{p+1}$
    

<br>

Queremos tener un procedimiento basado en la metodología de los contrastes de hipotesis estadisticos que nos permite seleccionar un modelo de entre $\hspace{0.1cm}\Omega_{p+1}\hspace{0.1cm}$ y $\hspace{0.1cm}\omega_{q+1}$



Las hipotesis a contrastar serían las siguientes:

$$
H_0: \hspace{0.15cm} \omega_{q+1}  \\
H_1: \hspace{0.15cm} \Omega_{p+1}
$$


Donde :


-   Rechazar $H_0$ equivale a seleccionar el modelo $\hspace{0.1cm} \Omega_{p+1}\hspace{0.1cm}$ sobre el modelo $\hspace{0.1cm} \omega_{q+1} \\[0.2cm]$

-   No recchazar $H_0$ equivale a seleccionar el modelo  $\hspace{0.1cm} \omega_{q+1} \hspace{0.1cm}$ sobre el modelo $\hspace{0.1cm} \Omega_{p+1}$

- Como ya se ha mencionado $\hspace{0.2cm} \omega_q \subset \Omega_p$


<br>

Ahora tenemos que determinar una regla de decisión en base a la cual decidir si se rechaza o no la hipotesis nula $(H_0)$

Una primera aproximación es la siguiente:

Consideremos las sumas de cuadrados de los residuos de cada modelo:

$$
RSS_{\Omega_{p+1}} \hspace{0.1cm} = \hspace{0.1cm}  \sum_{i=1}^n \left( y_i - \hat{y}_{\hspace{0.01cm} \Omega_{p+1} \hspace{0.05cm},\hspace{0.02cm} i} \right)^2   
$$

$$
RSS_{\omega_{q+1}} =     \sum_{i=1}^n \left( y_i - \hat{y}_{\omega_{q+1} \hspace{0.05cm},\hspace{0.02cm} i}\right)^2
$$

<br>

-   Si la diferencia $\hspace{0.15cm} RSS_{\omega_{q+1}} - RSS_{\Omega_{p+1}} \hspace{0.15cm}$ es  **pequeña**, entonces las predicciones de entrenamiento del modelo *pequeño* $\omega_q$ son casi tan buenas como las del modelo *grande* $\Omega_k$, así que se selecciona el modelo *pequeño* siguiendo el principio de parsimonia. $\\[0.8cm]$

 

-   Si la diferencia $\hspace{0.15cm} RSS_{\omega_{q+1}} - RSS_{\Omega_{p+1}} \hspace{0.15cm}$ es  **grande**, entonces las predicciones de entrenamiento del modelo *pequeño* $\omega_q$ son notablemente peores que las del modelo *grande* $\Omega_k$, así que se selecciona el modelo *grande*. $\\[0.8cm]$


Lo anterior suguiere que un buen estadístico de contraste sería una expresión como:

$$
\dfrac{RSS_{\omega_{q+1}} - RSS_{\Omega_{p+1}}}{RSS_{\Omega_{p+1}}}
$$

donde el denominador se está usando con el propósito de obtener una medida adimensional.




<br>

## Estadístico de contraste

Podemos obtener un estadistico de contraste basado en la expresión antrerior:

<br>

$$
F \hspace{0.1cm}  =  \hspace{0.1cm} \dfrac{(RSS_{\omega_{q+1}} - RSS_{\Omega_{p+1}})/(p-q)}{RSS_{\Omega_{p+1}}/(n-p-1)} \hspace{0.1cm} \sim \hspace{0.1cm} F_{\hspace{0.05cm} p-q \hspace{0.05cm},\hspace{0.05cm} n-p-1}
$$

 
<br>
 

## Regla de decisión

El p-valor del contraste es: $\\[0.3cm]$


$$\text{p-valor} \hspace{0.1cm}=\hspace{0.1cm} P\left( \hspace{0.1cm} F_{\hspace{0.05cm} p-q \hspace{0.05cm},\hspace{0.05cm} n-p-1} \hspace{0.1cm}\geq\hspace{0.1cm} F \hspace{0.1cm}\right) \\$$


La regla de decisión habitual, basada en el p-valor, es la siguiente: $\\[0.4cm]$


$$\text{Rechazar}\hspace{0.1cm} H_0  \hspace{0.25cm}\Leftrightarrow \hspace{0.25cm} \alpha \hspace{0.1cm}>\hspace{0.1cm} \text{p-valor}$$


<br>


## ANOVA como F-test

Para entender mejor esta sección se recomienda leer previamente el artículo sobre el [modelo de regresión lineal](http://estadistica4all.com/Articulos/Linear-Regression-new.html) que se encuentra también en [Estadistica4all](http://estadistica4all.com/)



<br>

Recordemos las hipotesis del contraste ANOVA para regresión lineal: $\\[0.4cm]$

$$
\hspace{-1.25cm} H_0: \hspace{0.15cm} \beta_1=\dots=\beta_p=0 \\[0.3cm]
H_1: \hspace{0.25cm} \beta_j \neq 0  \hspace{0.25cm} , \hspace{0.25cm}    \exists \ j=1,...,p
$$


<br>

Consideraremos los siguientes modelos de regresión lineal: $\\[0.4cm]$
  
  
  
-  $\Omega_{p+1} \ : \  \ \hat{y}_i = \widehat{\beta}_0 + \widehat{\beta}_1\cdot x_{i1} \hspace{0.1cm} +...+ \hspace{0.1cm} \beta_{p}\cdot x_{ip}  \\[0.5cm]$

  

-   $\omega_{q+1} \ : \ \ \hat{y}_i = \widehat{\beta}_0  \hspace{0.15cm}$ $\hspace{0.45cm}  \text{(Null Model)} \hspace{0.2cm} \Rightarrow \hspace{0.2cm} q=0$

<br>


Entonces las hipotesis del contraste ANOVA se pueden expresar como: $\\[0.4cm]$
 

$\hspace{6.5cm} H_0: \hspace{0.15cm}    \hat{y}_i = \widehat{\beta}_0  \ \hspace{0.3cm} ( \omega_{q+1} ) \\[0.3cm]
\hspace{6.5cm} H_1:  \hspace{0.15cm} \hat{y}_i = \widehat{\beta}_0 + \widehat{\beta}_1\cdot x_{i1} \hspace{0.1cm} +...+ \hspace{0.1cm} \beta_{p}\cdot x_{ip}    \ \hspace{0.3cm} ( \Omega_{p+1} )$



<br>

Además teniendo en cuenta los modelos antes definidos se tiene lo siguiente:



-   $RSS_{\Omega_{p+1}} = \sum_{i=1}^n ( y_i - \widehat{y}_{\hspace{0.01cm} \Omega_{p+1} \hspace{0.02cm},\hspace{0.02cm} i})^2 = \sum_{i=1}^n \left( y_i - ( \widehat{\beta}_0 + \widehat{\beta}_1\cdot x_{i1} +...+ \widehat{\beta}_{p}\cdot x_{ip} ) \right)^2 \\[0.5cm]$


-   $RSS_{\omega_{q+1}} = \sum_{i=1}^n ( y_i - \widehat{y}_{\hspace{0.01cm} \omega_{q+1} \hspace{0.02cm},\hspace{0.02cm} i})^2 = \sum_{i=1}^n ( y_i - \widehat{\beta}_0 )^2 \\[0.5cm]$

 
-  En el modelo nulo se cumple que $\hspace{0.1cm} \widehat{\beta}_0=\overline{y} \hspace{0.1cm}$, por tanto, tenemos: $\\[0.35cm]$

    - $RSS_{\omega_{q+1}}=\sum_{i=1}^n ( y_i - \overline{y} )^2 = TSS$


 
<br>

El estadístico del contraste F-test para estos modelos es el siguiente: $\\[0.5cm]$



$$
F \hspace{0.1cm}= \hspace{0.1cm} \dfrac{(RSS_{\omega_{q+1}} - RSS_{\Omega_{p+1}})/(p-q)}{RSS_{\Omega_{p+1}}/(n-p-1)} \hspace{0.1cm}=\hspace{0.1cm}
\dfrac{(TSS - RSS)/p}{RSS/(n-p-1)}  \hspace{0.1cm}\sim\hspace{0.1cm} F_{p \hspace{0.05cm},\hspace{0.05cm} n-p-1} \\
$$



donde:

- $TSS= RSS_{\omega_{q+1}}$

- $RSS= RSS_{\Omega_{p+1}}$


Y este es el estadístico de contraste del contraste ANOVA.
 


<br>



## Contraste de significación individual como F-test  

Para entender mejor esta sección se recomienda leer previamente el artículo sobre el [modelo de regresión lineal](http://estadistica4all.com/Articulos/Linear-Regression-new.html) que se encuentra también en [Estadistica4all](http://estadistica4all.com/)


Recordemos que las hipotesis del contraste de significación individual para $\hspace{0.1cm} \beta_j\hspace{0.1cm}$ son: $\\[0.4cm]$

$$
H_0: \beta_j=0 \\[0.5cm]
H_1: \beta_j \neq 0
$$



<br>

Consideremos los siguientes modelos de regresión lineal:

-   $\omega_{q+1}  : \  \ \hat{y}_i = \widehat{\beta}_0 + \widehat{\beta}_1\cdot x_{i1} +..+ \widehat{\beta}_{j-1} \cdot x_{i,j-1}+\widehat{\beta}_{j+1} \cdot x_{i,j+1}+..+ \widehat{\beta}_{p}\cdot x_{ip} \hspace{0.25cm} \Rightarrow \hspace{0.25cm} q=p-1  \\[0.5cm]$


-   $\Omega_{p+1} : \ \ \hat{y}_i = \widehat{\beta}_0 + \widehat{\beta}_1\cdot x_{i1} +..+\widehat{\beta}_j \cdot x_{ij}+..+ \widehat{\beta}_{p}\cdot x_{ip}$
    

<br>

Entonces, el contraste de significación de $\hspace{0.1cm}\beta_j\hspace{0.1cm}$ es equivalente al siguiente contraste:



$$
H_0: \hspace{0.2cm} \hat{y}_i = \widehat{\beta}_0 + \widehat{\beta}_1\cdot x_{i1} +\dots+ \widehat{\beta}_{j-1} \cdot x_{i,j-1}+\widehat{\beta}_{j+1} \cdot x_{i,j+1}+\dots+ \widehat{\beta}_{p}\cdot x_{ip}  \ \hspace{0.4cm} (\omega_{q+1}) \\[0.4cm]
\hspace{-4.2cm} H_1: \hspace{0.2cm}  \hat{y}_i = \widehat{\beta}_0 + \widehat{\beta}_1\cdot x_{i1} +..+\widehat{\beta}_j \cdot x_{ij}+\dots+ \widehat{\beta}_{p}\cdot x_{ip}  \ \hspace{0.4cm} ( \Omega_{p+1} )
$$

<br>


donde:


-   $RSS_{\Omega_{p+1}} \hspace{0.1cm} =\hspace{0.1cm}  \sum_{i=1}^n ( y_i - \widehat{y}_{\hspace{0.01cm} \Omega_{p+1} \hspace{0.02cm},\hspace{0.02cm} i})^2 \hspace{0.1cm}  = \hspace{0.1cm} \sum_{i=1}^n\left( y_i -  ( \widehat{\beta}_0 + \widehat{\beta}_1\cdot x_{i1}  +\dots +  \widehat{\beta}_{j} \cdot x_{i,j}+\dots + \widehat{\beta}_{p}\cdot x_{ip} )  \right)^2 \\[0.5cm]$



-   $RSS_{\omega_{q+1}} = \sum_{i=1}^n ( y_i - \widehat{y}_{\hspace{0.01cm} \omega_{q+1} \hspace{0.02cm},\hspace{0.02cm} i})^2  \hspace{0.1cm} =\hspace{0.1cm}  \sum_{i=1}^n \left( y_i - ( \widehat{\beta}_0 + \widehat{\beta}_1\cdot x_{i1}  +\dots + \widehat{\beta}_{j-1} \cdot x_{i,j-1} +  \widehat{\beta}_{j+1} \cdot x_{i,j+1}+\dots + \widehat{\beta}_{p}\cdot x_{ip} ) \right)^2$




<br>

El estadístico de contras del F-test es: $\\[0.4cm]$

 
$$
F\hspace{0.1cm} =\hspace{0.1cm} \dfrac{(RSS_{\omega_{q+1}} - RSS_{\Omega_{p+1}})/(p-q)}{RSS_{\Omega_k}/(n-p-1)} \hspace{0.1cm} =\hspace{0.1cm}  \dfrac{(RSS_{\omega_{q+1}} - RSS_{\Omega_{p+1}})/1}{RSS_{\Omega_{p+1}}/(n-p-1)}  \hspace{0.1cm} \sim\hspace{0.1cm} F_{1, n-p-1} \\[0.5cm]
$$

Los resultados de este contrastes son aproximadamente iguales a los que se obtienen con el contraste de significación individual clásico (t.test).

<br>

**Importante**: $\hspace{0.1cm}$ usar este F-test es la vía adecuada para contrastar si un predictor categórico es significativo. No es adecuado usar el el t-test en ese caso.




<br> 


 
## F-test programado en `Python`



















<br>


<br>

# Introducción a los algoritmos de selección de predictores en regresión lineal

A continuación vamos a ver algunos algoritmos cuyo proposito es la selección de predictores en modelos de regresión lineal.

La idea, dado un modelo de regresión lineal, es seleccionar aquellos predictores que mejor expliquen la respuesta, y descartar aquellos que generan más ruido que información util.

Esto algoritmos permiten obtener modelos de regresión lineal más pequeños que el modelo de partida (con menos coeficientes), pero iguales o incluso mejores a nivel de capacidad predictiva.


Estos algoritmos usan una serie de métricas que se usan como criterio para determinar el mejor modelo de regresión lineal de entre los considerados.


# Algoritmo best-subset-selection






## Metrics <a class="anchor" id="10"></a>

These metrics are one of the most important concepts in modern statistics and machine learning. These metrics are used to select the "best" model under some criteria.

Some of them are:

- **Test error** computed by simple or cross validation
- $\widehat{R}^2 \hspace{0.3cm}$  (Adjusted Determination Coefficient)
- $AIC \hspace{0.3cm}$ (Akaike Information Criteria)
- $BIC \hspace{0.3cm}$ (Bayesian Information Criteria)
- $Cp \hspace{0.3cm}$ (Mallow's Cp)



A detailed review of simple and cross validation methods will be done in a future article on my blog. The test error computed by cross validation will not be used as a criteria in our practical implementation of the following iterative algorithms, because in the iterative selection of linear regression models the most common criteria is to use $AIC$, $BIC$ or $\widehat{R}^2$, so we will do a review of these last.

But in model selection in general, cross-validation plays a very prominent role.



<br>



### Adjusted Determination Coefficient $\hspace{0.2cm} \widehat{R}^2$   

This metric is explained with more details in the following article about linear regression :  

https://fabioscielzoortiz.github.io/Estadistica4all.github.io/Articulos/Linear-Regression-in-Python-and-R-new.html

<br>

Here we will just show the formula that characterizes the adjusted $R^2$:


Given a linear regression model $\hspace{0.1cm} M \hspace{0.1cm}$  with $\hspace{0.1cm} p_M \hspace{0.1cm}$ predictors and $n$ observations:

<br>

\begin{gather*}
\widehat{R}^2 = 1 - \left( 1- R^2 \right) \cdot \dfrac{n-1}{n-p_M}
\end{gather*}

Where:

\begin{gather*}
R^2 = \dfrac{RegSS}{TSS}
\end{gather*}

<br>

This metric is usually used as a criteria to select linear regression models.

<br>

**$\widehat{R}\hspace{0.1cm}^2$ criteria:** 

Given $\hspace{0.1cm} h \hspace{0.1cm}$ linear regression models $\hspace{0.1cm}M_1 , M_2, \dots, M_h$

<br>

$$
\text{If} \hspace{0.4cm}  \widehat{R}^2 (M_j) > \widehat{R}^2 (M_r) \hspace{0.35cm} , \hspace{0.1cm} \forall r \in \lbrace 1,...,h\rbrace - \lbrace j \rbrace \hspace{0.3cm} \Rightarrow \\[0.7cm]  \Rightarrow \hspace{0.3cm} M_j \hspace{0.2cm} \text{is selected instead of} \hspace{0.2cm} M_1, ..., M_{j-1},M_{j+1},...,M_h
$$

<br>

> That is, the model with the **highest** $\hspace{0.15cm} \widehat{R}^2 \hspace{0.15cm}$ is selected over the rest.


<br>

#### $\widehat{R}^2$ in `Python`


```python
X = data_Python[['size_in_m_2', 'longitude', 'latitude', 'no_of_bedrooms', 'no_of_bathrooms', 'quality']]
y = data_Python['price']
```


```python
model = smf.ols(formula = 'price ~ size_in_m_2 + no_of_bedrooms + no_of_bathrooms + quality', data=data_Python).fit()
```


```python
model.rsquared_adj
```




    0.6854449178693436



<br>

#### $\widehat{R}^2$ in `R`


```r
%%R

model <- lm( price ~ size_in_m_2 + no_of_bedrooms + no_of_bathrooms + quality , data = data_R)
```


```r
%%R 

summary(model)$adj.r.squared
```

    [1] 0.6854449
    



<br>



### Akaike Information Criteria $\hspace{0.2cm} AIC$ 

Given a linear regression model $\hspace{0.1cm} M \hspace{0.1cm}$  with $\hspace{0.1cm} p_M \hspace{0.1cm}$ predictors and $\hspace{0.1cm} n \hspace{0.1cm}$ observations:

<br>

$$ AIC(M) = -2 \cdot ln\left(\widehat{L}(M)\right) \hspace{0.1cm}+\hspace{0.1cm} 2 \cdot  \left(\hspace{0.1cm} p_M +1 \hspace{0.1cm}\right)  $$




Where:

$\widehat{L}(M)$ is the value of the **likelihood function** of the model $M$ evaluated at the MLE (Maximum Likelihood Estimation) of model parameters.


This metric is usually used as a criteria to select linear regression models.


<br>

#### **$AIC$ criteria**:

Given $\hspace{0.1cm}h\hspace{0.1cm}$ linear regression models $\hspace{0.1cm}M_1 , M_2, \dots, M_h$

<br>

$$
\text{If} \hspace{0.35cm}  AIC (M_j) < AIC(M_r) \hspace{0.35cm} , \forall r \in \lbrace 1,...,h\rbrace - \lbrace j \rbrace \hspace{0.35cm} \Rightarrow \\[0.7cm]
 \Rightarrow \hspace{0.35cm} M_j \hspace{0.2cm}\text{is selected instead of}\hspace{0.2cm} M_r   \hspace{0.2cm} , \forall r \in \lbrace 1,...,h\rbrace - \lbrace j \rbrace
$$

<br>

> That is, the model with the **less** $\hspace{0.1cm}AIC\hspace{0.1cm}$ is selected over the rest.




<br>



### $BIC$  <a class="anchor" id="13"></a>

Given a linear regression model $\hspace{0.05cm} M \hspace{0.05cm}$  with $\hspace{0.05cm} p_M \hspace{0.051cm}$ predictors and $n$ observations:

<br>

$$BIC(M) = -2 \cdot ln\left(\widehat{L}(M)\right) + ln(n) \cdot  \left(\hspace{0.1cm} p_M +1 \hspace{0.1cm}\right)$$



Where:

$\widehat{L}(M)$ is the value of the likelihood function of the model $M$ evaluated at the MLE (Maximum Likelihood Estimation) of model parameters.



This metric is usually used as a criteria to select linear regression models.


<br>


$BIC$ **criteria**:


Given $\hspace{0.1cm}h\hspace{0.1cm}$ linear regression models $\hspace{0.1cm}M_1 , M_2, \dots, M_h$

$$
\text{If} \hspace{0.35cm}  BIC (M_j) < BIC(M_r) \hspace{0.2cm} , \forall r \in \lbrace 1,...,h\rbrace - \lbrace j \rbrace \hspace{0.35cm} \Rightarrow \\[0.7cm]
\Rightarrow \hspace{0.35cm}   M_j \hspace{0.2cm}\text{is selected instead of}\hspace{0.2cm} M_r   \hspace{0.1cm} , \forall r \in \lbrace 1,...,h\rbrace - \lbrace j \rbrace
$$

<br>

>That is, the model with the **less** $BIC$ is selected over the rest.



<br>



## Maximum Likelihood Estimation in the Linear Regression Model <a class="anchor" id="14"></a>


Given a linear regression model $\hspace{0.1cm} M \hspace{0.1cm}$  with $\hspace{0.1cm} p_M \hspace{0.1cm}$ predictors and $n$ observations, the probability distribution of a random sample of response variable $\hspace{0.1cm}Y_1,...,Y_n\hspace{0.1cm}$ , is the following:

<br>

\begin{gather*}
Y_i \sim N(\hspace{0.1cm} x_i^t  \cdot \beta \hspace{0.15cm} , \hspace{0.15cm} \sigma^2 \hspace{0.1cm} ) \\[0.7cm]
 f_{Y_i}(z) = \dfrac{1}{\sqrt{2\pi \sigma^2}} \cdot exp\lbrace \hspace{0.1cm} - \dfrac{1}{2\sigma^2} \cdot (z - x^t_i\cdot \beta)^2 \hspace{0.1cm} \rbrace 
\end{gather*}
 
For $\hspace{0.2cm} i=1,...,n$
 
<br>

Given a sample of  realizations $\hspace{0.1cm}y_1,...,y_n\hspace{0.1cm}$ of the random sample $\hspace{0.1cm}Y_1,...,Y_n\hspace{0.1cm}$ of the response variable.

The likelihood function of the model $\hspace{0.1cm}M\hspace{0.1cm}$ is:


$$L( M )=L(\beta, \sigma \hspace{0.1cm}|\hspace{0.1cm} x_i, y_i) \hspace{0.2cm}=\hspace{0.2cm} f_{Y_1,...,Y_n}(y_1,...,y_n) \hspace{0.2cm}=\hspace{0.2cm} \prod_{i=1}^{n} f_{Y_i}(y_i) \hspace{0.2cm}=\hspace{0.2cm} (2\pi \sigma^2)^{-n/2} \cdot exp\lbrace \hspace{0.1cm} - \dfrac{1}{2\sigma^2}\cdot \sum_{i=1}^{n} (y_i - x^t_i\cdot \beta)^2 \hspace{0.1cm} \rbrace \\[0.3cm]$$


**Observation:** 

$f_{Y_1,...,Y_n}(y_1,...,y_n)\hspace{0.1cm}$ is the value of the joint density function of the random variables $\hspace{0.1cm}Y_1,...,Y_n\hspace{0.1cm}$ evaluated in $\hspace{0.1cm}y_1,...,y_n$

$f_{Y_i}(y_i)\hspace{0.1cm}$ is the value of the density function of the random variable $\hspace{0.1cm}Y_i\hspace{0.1cm}$ evaluated in $\hspace{0.1cm}y_i$

<br>

Taking natural logarithm we have:

$$ln\left(\hspace{0.1cm}L(M)\hspace{0.1cm}\right)\hspace{0.1cm}=\hspace{0.1cm}ln(\hspace{0.1cm} L(\beta, \sigma \hspace{0.1cm}|\hspace{0.1cm} x_i, y_i)\hspace{0.1cm}) \hspace{0.1cm}=\hspace{0.1cm} - \dfrac{n}{2} \left(ln(2\pi) + ln(\sigma^2) \right) - \dfrac{1}{2\sigma^2} \sum_{i=1}^{n} \left( y_i - x^t_i\cdot \beta \right) ^2   $$


<br>


The maximum likelihood estimation (MLE)  of the parameters $\hspace{0.1cm} \beta$ , $\sigma \hspace{0.1cm}$ of the linear regression model $M$ are calculated as the solution of the following optimization problem:

<br>

$$
\underset{\beta \hspace{0.05cm},\hspace{0.05cm} \sigma}{Max} \hspace{0.2cm} \lbrace \hspace{0.1cm} ln(\hspace{0.1cm}L(M)\hspace{0.1cm}) \hspace{0.1cm}\rbrace\\[0.3cm] 
$$

So, in other words:

$$\widehat{\beta}_{MLE} \hspace{0.1cm},\hspace{0.1cm} \widehat{\sigma}^2_{MLE} \hspace{0.2cm}=\hspace{0.2cm} arg \hspace{0.1cm} \underset{\beta \hspace{0.05cm},\hspace{0.05cm} \sigma}{Max} \hspace{0.2cm} \lbrace\hspace{0.1cm} ln(\hspace{0.1cm}L(M)\hspace{0.1cm}) \hspace{0.1cm}\rbrace
$$

  


<br>

**Solutions:**

\begin{gather*}
\widehat{\beta}_{MLE}\hspace{0.1cm}=\hspace{0.1cm}(X^t \cdot X)^{-1} \cdot X^t \cdot Y  \hspace{0.1cm}=\hspace{0.1cm} \widehat{\beta}_{OLS} \\[0.5cm]
\widehat{\sigma}^2_{MLE} \hspace{0.1cm}=\hspace{0.1cm} \dfrac{RSS(M)}{n}
\end{gather*}



<br>

Note that:

$$
arg \hspace{0.1cm} \underset{\beta \hspace{0.05cm},\hspace{0.05cm} \sigma}{Max} \hspace{0.2cm} L(M) \hspace{0.1cm}=\hspace{0.1cm} arg \hspace{0.1cm} \underset{\beta \hspace{0.05cm},\hspace{0.05cm} \sigma}{Max} \hspace{0.2cm} ln(\hspace{0.1cm}L(M)\hspace{0.1cm}) 
$$

<br>

So, the function $\hspace{0.1cm} ln \left( \hspace{0.1cm}L(M)\hspace{0.1cm} \right) \hspace{0.1cm}$ evaluated in $\hspace{0.1cm} \beta=\widehat{\beta}_{MLE} \hspace{0.1cm}, \hspace{0.1cm}\sigma^2 = \widehat{\sigma}^2_{MLE} \hspace{0.1cm}$ is :

<br>

$$ ln \left( \hspace{0.1cm}\widehat{L}(M)\hspace{0.1cm} \right) =  - \dfrac{n}{2} \left( ln(2\pi) + ln\left(\dfrac{RSS(M)}{n}\right) - ln(n) + 1 \right) $$





<br>

<br>



### $AIC$ and $BIC$ in the Linear Regression Model <a class="anchor" id="14.1"></a> 


Then, in the linear regression model $\hspace{0.1cm}M\hspace{0.1cm}$ with $\hspace{0.1cm}p_M\hspace{0.1cm}$ predictors and $\hspace{0.1cm}n\hspace{0.1cm}$ observations:

<br>

\begin{gather*}
AIC(M) = n \cdot \left( \hspace{0.1cm}  ln(2\pi) + ln(RSS(M)) - ln(n) \hspace{0.1cm} \right) + n + 2\cdot (\hspace{0.1cm}p_M + 1\hspace{0.1cm}) \\[0.6cm]
BIC(M) =  n \cdot \left(  \hspace{0.1cm} ln(2\pi) + ln(RSS(M)) - ln(n) \hspace{0.1cm} \right) + n + ln(n)\cdot(\hspace{0.1cm} p_M + 1\hspace{0.1cm}) 
\end{gather*}


<br>

Where:

$$
RSS(M) \hspace{0.1cm}=\hspace{0.1cm}  \sum_{i=1}^n \hat{\varepsilon}_i^2 \hspace{0.1cm}=\hspace{0.1cm}  \sum_{i=1}^n ( y_i - \hat{y}_i)^2
$$



<br>

### $AIC$ in `Python` <a class="anchor" id="14"></a>

Using `smf.ols` :


```python
model = smf.ols(formula = 'price ~ size_in_m_2 + no_of_bedrooms + no_of_bathrooms+ longitude + latitude + quality', data=data_Python).fit()
```


```python
model.aic
```




    59854.027050178316


<br>


Using the $AIC$ formula: 


```python
def AIC_lm(data, model):

    import math

    n = data.shape[0]

    p = model.df_model

    pi = math.pi

    RSS = anova_lm(model).sum_sq.Residual

    # Other way to compute RSS:
    
    # y = data['response_variable']
    # RSS = ( ( y - model.predict(X) )**2 ).sum()

    AIC = n*(math.log(2*pi) + math.log(RSS) -  math.log(n)) + n + 2*(p+1)

    return AIC
```




```python
model = smf.ols(formula = 'price ~ size_in_m_2 + no_of_bedrooms + no_of_bathrooms+ longitude + latitude + quality', data=data_Python).fit()
```


```python
AIC_lm(data_Python, model)
```




    59854.02705017832





Note:

`math.log(x , base)` , by default $\hspace{0.1cm} base=e$

$ln(x) =$ `math.log(x)` $=$ `math.log(x , math.e)`   



<br>

### $AIC$ in `R` <a class="anchor" id="14"></a>




```r
%%R

model <- lm( price ~ size_in_m_2 + no_of_bedrooms + no_of_bathrooms + quality , data = data_R)
```


```r
%%R

AIC(model)
```

    [1] 59922.77
    



<br>


#### $BIC$ in `Python` <a class="anchor" id="15"></a>

Using `smf.ols` :


```python
model = smf.ols(formula = 'price ~ size_in_m_2 + no_of_bedrooms + no_of_bathrooms + quality', data=data_Python).fit()
```


```python
model.bic
```




    59959.63885835402


<br>


Using the $BIC$ formula: 


```python
def BIC_lm(data, model):

    import math

    n = data.shape[0]

    p = model.df_model

    pi = math.pi

    RSS = anova_lm(model).sum_sq.Residual

    # Other way to compute RSS:
    
    # y = data['response_variable']
    # RSS = ( ( y - model.predict(X) )**2 ).sum()

    BIC = n*(math.log(2*pi) + math.log(RSS) -  math.log(n)) + n + math.log(n)*(p+1)

    return BIC
```




```python
model = smf.ols(formula = 'price ~ size_in_m_2 + no_of_bedrooms + no_of_bathrooms + quality', data=data_Python).fit()
```


```python
BIC_lm(data_Python, model)
```




    59959.638858354025





<br>

#### $BIC$ in `R` <a class="anchor" id="15"></a>


```r
%%R

model <- lm( price ~ size_in_m_2 + no_of_bedrooms + no_of_bathrooms + quality , data = data_R)
```


```r
%%R

BIC(model)
```

    [1] 59967.19
    



<br>



### Mallow's $C_p$ <a class="anchor" id="18"></a>

Given a full linear regression model  with $\hspace{0.1cm} p\hspace{0.1cm}$ predictors $\hspace{0.1cm} M_{Full}:\hspace{0.15cm} y_i \hspace{0.1cm}=\hspace{0.1cm} \beta_0 + \sum_{j=1}^{p} \hspace{0.02cm} \beta_j \cdot x_{ij}$

Given a linear regression model $\hspace{0.1cm} M \subseteq M_{Full}\hspace{0.1cm}$  with $\hspace{0.1cm} p_M \leq p\hspace{0.1cm}$ predictors and $\hspace{0.1cm}n\hspace{0.1cm}$ observations:

<br>

$$C_p(M) \hspace{0.15cm}=\hspace{0.15cm} \dfrac{RSS(M)}{\widehat{\sigma}_{M_{Full}}^2} - n \hspace{0.1cm}+\hspace{0.1cm} 2\cdot \left(\hspace{0.1cm} p_M +1 \hspace{0.1cm}\right)$$



Where:

$\hat{\sigma}_{M_{Full}}^2 \hspace{0.1cm}=\hspace{0.1cm}  \dfrac{RSS(M_{Full})}{n-p-1}  \hspace{0.35cm}$ is the residual variance of the full model.$\\$

$RSS(M_{Full}) \hspace{0.1cm}=\hspace{0.1cm}  \sum_{i=1}^{n} (y_i - \widehat{y}_{M_{Full}\hspace{0.02cm},\hspace{0.02cm} i})^2$


<br>
<br>

### $C_p$ in `Python` <a class="anchor" id="14"></a>


```python
def Cp_lm(data, full_model, model):

    # full_model and model have to be a  smf.ols, because `anova_lm` doesn´t work with sm.OLS

    n = data.shape[0]

    p_full_model =  full_model.df_model

    p_model =  model.df_model

    RSS_full_model = anova_lm(full_model).sum_sq.Residual

    RSS_model = anova_lm(model).sum_sq.Residual

    residual_variance_full_model = RSS_full_model/(n-p_full_model-1)

    # Other way to compute RSS:
    
    # y = data['response_variable']
    # RSS = ( ( y - model.predict(X) )**2 ).sum()

    Cp = RSS_model/residual_variance_full_model - n + 2*(p_model + 1)

    return Cp
```




```python
full_model = smf.ols(formula = 'price ~ size_in_m_2 + no_of_bedrooms + no_of_bathrooms + quality + latitude + longitude', data =data_Python).fit()

model = smf.ols(formula = 'price ~ size_in_m_2 + no_of_bedrooms + no_of_bathrooms', data =data_Python).fit()
```


```python
Cp_lm(data_Python, full_model, model)
```




    75.98029458609994





<br>

### $C_p$ in `R` <a class="anchor" id="14"></a>


```r
%%R

# install.packages("olsrr")
```

  
    


```r
%%R

full_model <- lm( price ~ size_in_m_2 + no_of_bedrooms + no_of_bathrooms + quality + latitude + longitude  , data = data_R)

model <- lm( price ~ size_in_m_2 + no_of_bedrooms + no_of_bathrooms  , data = data_R)
```


```r
%%R

library(olsrr)

ols_mallows_cp(model, full_model)
```

    [1] 75.98029
    


<br>

<br>

## Classic Best Subset Selection <a class="anchor" id="20"></a>

Classic best subset selection  consist in the following algorithm :

We have $p$ predictors: $\hspace{0.1cm} X_1,...,X_p$

- We train the null linear model $(M_0)\\[0.25cm]$
   
- We train all possible linear models with $\hspace{0.1cm}1\hspace{0.1cm}$ predictor and select the one with the smallest train error $(M^*_1)\\[0.25cm]$  

- We train all the possible linear models with $\hspace{0.1cm}2\hspace{0.1cm}$ predictors and select the one with the smallest train error $(M^*_2)$ 
  
   $\dots \\[0.3cm]$ 

- We train all the possible linear models with $\hspace{0.1cm}p-1\hspace{0.1cm}$ predictors and select the one with the smallest train error $(M^*_{p-1})\\[0.25cm]$ 

- We train the full linear model $(M_p)\\[0.25cm]$


- We select one of those models under some criteria, for example the one with **less**    $\hspace{0.05cm}AIC\hspace{0.05cm}$, $\hspace{0.05cm}BIC\hspace{0.05cm}$ or $\hspace{0.05cm}Cp\hspace{0.05cm}$, or **greater**  $\hspace{0.05cm}\widehat{R}^2\hspace{0.05cm}$. That model will be consider "the best model".



<br>

**Scheme of the algorithm:**

- Train $\hspace{0.08cm}M_0 =  \text{null linear model}  \\[0.35cm]$

- Train $\hspace{0.08cm}M_1=\lbrace \text{linear models with 1 predictor} \rbrace \hspace{0.12cm}\underset{\text{train error}}{\Rightarrow}\hspace{0.12cm} M_1^*\\[0.35cm]$ 

- Train $\hspace{0.08cm}M_2=\lbrace \text{linear models with 2 predictors} \rbrace \hspace{0.12cm}\underset{\text{train error}}{\Rightarrow}\hspace{0.12cm} M_2^*$

$\dots$

- Train $\hspace{0.08cm}M_{p-1}=\lbrace \text{linear models with p-1 predictors} \rbrace \hspace{0.12cm}\underset{\text{train error}}{\Rightarrow}\hspace{0.12cm} M_{p-1}^*\\[0.35cm]$

- Train $\hspace{0.08cm}M_{p}= \text{full linear model} \\[0.35cm]$



- $M_0 ,  M_1^* , ..., M_{p-1}^*, M_p  \underset{ \hspace{0.15cm} AIC\hspace{0.08cm},\hspace{0.08cm} BIC, \hspace{0.08cm}C_p \hspace{0.08cm},\hspace{0.08cm} \widehat{R}^2 \hspace{0.15cm}}{\Rightarrow} \hspace{0.1cm} M\hspace{0.05cm}^* \hspace{0.2cm}(Best \hspace{0.1cm} Model)$

<br>

**Observation:**

Due to the characteristics of the Backward algorithm, it **doesn't have to be true** that:

$M_0 \subset M_1^* \subset M_2^* \subset M_3^* ,..., M_{p-1}^* \subset M_p$


<br>

**Why don't we select the final model using the training error?**

The train error of a linear regression model is defined as:

$$\text{Train Error} (M_j) = ECM_{train}(M_j) =
\dfrac{1}{n} \cdot RSS_{train}(M_j)$$

And it is fulfilled that:

$$RSS_{train}(M_0) > RSS_{train}(M_1^*) > RSS_{train}(M_2^*) > ... > RSS_{train}(M_{p-1}^*) > RSS_ {train}(M_p^*)$$

So:

$$\text{Train Error} (M_0) > \text{Train Error} (M_1^*) >\text{Train Error} (M_2^*)>...>\text{Train Error} (M_{p -1}^*)>\text{Train Error} (M_p)$$


So if the train error were used as a metric to select the final model, the largest model (the one with the most parameters, that is, the complete model $M_p$) would always be selected.

For this reason we don't select the final model using the training error.

Although this isn't true with the test error, for this reason the test error    could be used to select the final model.

<br>

**Problems:**

- **Large computational requirements:** compute $2^p$ models is required, which is impossible with more than $\hspace{0.05cm} p=40 \hspace{0.05cm}$ predictors, because $\hspace{0.05cm} 2^{40}=1099511627776$.
  
  The growth of the computational requirements is exponential, for example, with $\hspace{0.05cm} p=10$ predictors we need to calculate $\hspace{0.05cm} 2^{10}=1024 \hspace{0.05cm}$ models, but with $\hspace{0.05cm} p=15\hspace{0.05cm}$ the models to be calculated are too many, $\hspace{0.05cm} 2^{15}=32768$



<br>

## Alternative Best Subset Selection <a class="anchor" id="20"></a>

Alternative best subset selection  consist in the following algorithm :

We have $p$ predictors: $\hspace{0.1cm} X_1,...,X_p \\[0.25cm]$

- We train the null linear model $\\[0.25cm]$
   
- We train all the possible linear models with  $\hspace{0.1cm}1\hspace{0.1cm}$ predictor $\\[0.25cm]$

- We train all the possible linear models with $\hspace{0.1cm}2\hspace{0.1cm}$ predictors 
  
   $\dots \\[0.3cm]$ 

- We train all the possible linear models with $\hspace{0.1cm}p-1\hspace{0.1cm}$ predictors $\\[0.25cm]$

- We train the full linear model $\\[0.25cm]$


- We select one of those models under some criteria, for example the one with **less**  $\hspace{0.05cm}AIC\hspace{0.05cm}$, $\hspace{0.05cm}BIC\hspace{0.05cm}$ or $\hspace{0.05cm}Cp\hspace{0.05cm}$, or **greater**  $\hspace{0.05cm}\widehat{R}^2\hspace{0.05cm}$. That model will be consider "the best model".



<br>

**Scheme of the algorithm:**

- Train $\hspace{0.08cm}M_0 = \lbrace \text{null linear model} \rbrace$

- Train $\hspace{0.08cm}M_1=\lbrace \text{linear models with 1 predictor} \rbrace$

- Train $\hspace{0.08cm}M_2=\lbrace \text{linear models with 2 predictors} \rbrace$

$\dots$

- Train $\hspace{0.08cm}M_{p-1}=\lbrace \text{linear models with p-1 predictors} \rbrace$

- Train $\hspace{0.08cm}M_{p}=\lbrace \text{full linear model} \rbrace \\[0.25cm]$



- $M_0 \cup M_1 \cup ...\cup M_p  \underset{ \hspace{0.15cm}  AIC\hspace{0.08cm},\hspace{0.08cm} BIC, \hspace{0.08cm}C_p \hspace{0.08cm},\hspace{0.08cm} \widehat{R}^2 \hspace{0.15cm}}{\Rightarrow} \hspace{0.1cm} M\hspace{0.05cm}^* \hspace{0.2cm}(Best \hspace{0.1cm} Model)$

<br>

**Problems:**

- **Large computational requirements:** compute $2^p$ models is required, which is impossible with more than $\hspace{0.05cm} p=40 \hspace{0.05cm}$ predictors, because $\hspace{0.05cm} 2^{40}=1099511627776$.
  
  The growth of the computational requirements is exponential, for example, with $\hspace{0.05cm} p=10$ predictors we need to calculate $\hspace{0.05cm} 2^{10}=1024 \hspace{0.05cm}$ models, but with $\hspace{0.05cm} p=15\hspace{0.05cm}$ the models to be calculated are too many, $\hspace{0.05cm} 2^{15}=32768$







<br>

### Best Subset Selection in `Python` <a class="anchor" id="21"></a>










<br>

## Algoritmo best-subset-selection programado en `Python`












<br>


# Algoritmo forward-selection







<br>


# Algoritmo backward-selection






<br>


