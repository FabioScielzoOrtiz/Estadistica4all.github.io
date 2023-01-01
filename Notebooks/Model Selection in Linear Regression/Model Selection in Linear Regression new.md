---
title: 'Algoritmos de selección de predictores en regresión lienal'
author: 'Fabio Scielzo Ortiz'
date: '20/1/23'
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



El modelo estadístico que se plantea en regresión lineal es el siguiente:

Tenemos una m.a.s $\hspace{0.1cm}\mathcal{Y}_1,...,\mathcal{Y}_n\hspace{0.1cm}$ de la v.a. $\hspace{0.1cm}\mathcal{Y}$

Se asume que para cada $\hspace{0.1cm}i=1,...,n\hspace{0.1cm}$ se tiene la siguiente relación:

$$\mathcal{Y}_i = \beta_0 + \sum_{j=1}^p \beta_j \cdot x_{ij} + \varepsilon_i$$ 


Donde:

- $\varepsilon_i \sim N(0,\sigma^2) \hspace{0.25cm} , \hspace{0.25cm} \forall \hspace{0.1cm} i \in \lbrace 1,...,n\rbrace \\$

- $Corr(\varepsilon_i , \varepsilon_r) = 0 \hspace{0.25cm} , \hspace{0.25cm} \forall \hspace{0.1cm} i \neq r \in \lbrace 1,...,n\rbrace \\$

- $\beta_0,...,\beta_p  \in \mathbb{R}\\$


Observación: $\hspace{0.25cm} \mathcal{Y}_i \sim N( \beta_0 + \sum_{j=1}^p \beta_j \cdot x_{ij} , \sigma^2  )$


Este modelo estadístico permite hacer inferencia estadistica sobre la respuesta y los predictores, que puede ser de gran interés, pero no es estrictamente necesario para realizar predicciones. 

En regresión lineal clásica existen esencialmente dos vias equivalentes de hacer predicciones con el modelo. Una pasa por usar suspropiedades estadisticas para estimarl los coeficientes betas por el método de máxima verosimilitud. El otro pasa por estimar los betas por el método de minimos cuadrados, el cual no depende de las propiedades estadisticas del modelo. Estas dos vías son equivalentes en el contexto de la regresión lineal clasica, es decir, cuando las perturbaciones $\varepsilon_i$ cumplen las propiedades estadisticas especificadass anteriormente.

En este caso vamos a esponer la vía basada en el método de mínimos cuadrados ordinarios:

La predicción de la variable respuesta para un vector cualquiera de observaciones   de los predictores $\hspace{0.1cm}x_{*} \in \mathbb{R}^{p}\hspace{0.1cm}$, según el algoritmo de regresión lineal, es la siguiente: $\\[0.4cm]$



$$\hat{y}_*  \hspace{0.15cm}=\hspace{0.15cm} \widehat{\beta}_0 +  \sum_{r=1}^p \hspace{0.12cm} \widehat{\beta}_r \cdot x_{*r} \hspace{0.3cm} , \hspace{0.25cm} \forall \hspace{0.1cm} x_* \in \mathbb{R}^p$$

donde los parametros $\hspace{0.12cm}\widehat{\beta}_0 , \widehat{\beta}_1,...,\widehat{\beta}_p\hspace{0.12cm}$ se obtienen resolviendo el problema de mínimos cuadrados ordinarios:

$$\widehat{\beta} \hspace{0.15cm}=\hspace{0.15cm} \left( \widehat{\beta}_0 , \widehat{\beta}_1,...,\widehat{\beta}_p \right)  \hspace{0.2cm} = \hspace{0.2cm} arg \hspace{0.2cm} \underset{ \beta_0 , \beta_1,...,\beta_p}{Min} \hspace{0.2cm} \sum_{i=1}^n  \hspace{0.12cm} \left(  y_i - \left( \hspace{0.12cm} \beta_0 + \sum_{r=1}^p \hspace{0.1 cm} \beta_r \cdot x_{ir} \hspace{0.12cm} \right) \right)^2 \\[1.5cm]
\hspace{4.6cm} \text{sujeto a:}  \hspace{0.35cm}  \beta_0 , \beta_1,...,\beta_p \in \mathbb{R}$$

 

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
 

$\hspace{5.5cm} H_0: \hspace{0.15cm}    \hat{y}_i = \widehat{\beta}_0  \ \hspace{0.3cm} ( \omega_{q+1} ) \\[0.3cm]
\hspace{5.5cm} H_1:  \hspace{0.15cm} \hat{y}_i = \widehat{\beta}_0 + \widehat{\beta}_1\cdot x_{i1} \hspace{0.1cm} +...+ \hspace{0.1cm} \beta_{p}\cdot x_{ip}    \ \hspace{0.3cm} ( \Omega_{p+1} )$



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



Algunas de estas métricas son:

- El coeficiente de determinación ajustado $(R_{adj}^2)$

- El criterio de información de Akaike $(AIC)$
- El criterio de información bayesiano $(BIC)$

- El Mallow's Cp $(Cp)$



 


<br>



## Coeficiente de determinación ajustado   
Esta métrica fue explicada con más detalles en el articulo sobre el [modelo de regresión lineal](http://estadistica4all.com/Articulos/Linear-Regression-new.html) del blog [Estadistica4all](http://estadistica4all.com/)

Aqui solo vamos a ver la formula que caracteriza al coeficiente de determinación ajustado.


Dado un modelo de regresión lineal $\hspace{0.1cm} M \hspace{0.1cm}$  con $\hspace{0.1cm} p \hspace{0.1cm}$ predictores and $\hspace{0.1cm} n \hspace{0.1cm}$ observaciones de train, el coeficiente de determinación ajustado del modelo $\hspace{0.1cm} M\hspace{0.1cm}$ viene dado por:

 
$$
R^2_{adj}\hspace{0.1cm} =\hspace{0.1cm} 1 - \left( 1- R^2 \right) \cdot \dfrac{n-1}{n-p_M}
$$

donde:

$$
R^2 \hspace{0.1cm}=\hspace{0.1cm} \dfrac{TSS - RSS}{TSS}
$$



Esta métrica es usualmente usada con creterio para seleccionar modelos de regresión lineal.

<br>

**Criterio $R_{adj}^2$** 

Dados $\hspace{0.1cm} h \hspace{0.1cm}$ modelos de regresión lineal $\hspace{0.1cm}M_1 , M_2, \dots, M_h$


El modelo seleccionado según el criterio $\hspace{0.1cm}R_{adj}^2\hspace{0.1cm}$ es $\hspace{0.1cm}M_{j\hspace{0.05cm}^*}$

donde:

$$j\hspace{0.05cm}^* \hspace{0.15cm} =  \hspace{0.15cm} arg  \hspace{0.2cm} \underset{j\in \lbrace 1,...,h\rbrace}{Max}  \hspace{0.2cm}  R^2_{adj} (M_j) \\$$
 

 

> El modelo con **mayor** $\hspace{0.1cm} R^2_{adj}\hspace{0.1cm}$ es el seleccionado, segun el criterio del coeficiente de determinación ajustado.


<br>

### Coeficiente de determinación ajustado en `Python`






 

<br>



## Criterio de información de Akaike 

Dado un modelo de regresión lineal $\hspace{0.1cm} M \hspace{0.1cm}$  con $\hspace{0.1cm} p \hspace{0.1cm}$ predictores y $\hspace{0.1cm} n \hspace{0.1cm}$ observaciones de train, el criterio de información de Akaike del modelo $\hspace{0.1cm}M\hspace{0.1cm}$ es:

 

$$AIC(M) \hspace{0.1cm}=\hspace{0.1cm} -2 \cdot ln\left(\widehat{L}(M)\right) \hspace{0.1cm}+\hspace{0.1cm} 2 \cdot  \left(\hspace{0.1cm} p +1 \hspace{0.1cm}\right)  $$




donde:

$\widehat{L}(M)\hspace{0.1cm}$ es  el valor de la funcion de verosimilitud del modelo $\hspace{0.1cm}M\hspace{0.1cm}$ evaliada en la estimación máxima verosimil de los parametros del modelo.





<br>

**Criterio $AIC$ :**

Dados $\hspace{0.1cm}h\hspace{0.1cm}$ modelos de regresión $\hspace{0.1cm}M_1 , M_2, \dots, M_h$



El modelo seleccionado según el criterio $\hspace{0.1cm}AIC\hspace{0.1cm}$ es $\hspace{0.1cm}M_{j\hspace{0.05cm}^*}$

donde:

$$j\hspace{0.05cm}^* \hspace{0.15cm} =  \hspace{0.15cm} arg  \hspace{0.2cm} \underset{j\in \lbrace 1,...,h\rbrace}{Min}  \hspace{0.2cm}  AIC (M_j) \\$$
 

 

> El modelo con **menor** $\hspace{0.1cm}AIC\hspace{0.1cm}$ es el seleccionado, segun el criterio de Akaike.



<br>



## Criterio de información bayesiano


Dado un modelo de regresión lineal $\hspace{0.1cm} M \hspace{0.1cm}$  con $\hspace{0.1cm} p \hspace{0.1cm}$ predictores y $\hspace{0.1cm} n \hspace{0.1cm}$ observaciones de train, el criterio de información de bayesiano del modelo $\hspace{0.1cm}M\hspace{0.1cm}$ es:


$$BIC(M) \hspace{0.1cm} = \hspace{0.1cm} -2 \cdot ln\left(\widehat{L}(M)\right)\hspace{0.1cm} + \hspace{0.1cm}ln(n) \cdot  \left(\hspace{0.1cm} p + 1 \hspace{0.1cm}\right)$$



donde:


$\widehat{L}(M)\hspace{0.1cm}$ es  el valor de la funcion de verosimilitud del modelo $\hspace{0.1cm}M\hspace{0.1cm}$ evaliada en la estimación máxima verosimil de los parametros del modelo.

 


<br>


**Criterio $BIC$ :**

Dados $\hspace{0.1cm}h\hspace{0.1cm}$ modelos de regresión $\hspace{0.1cm}M_1 , M_2, \dots, M_h$



El modelo seleccionado según el criterio $\hspace{0.1cm}BIC\hspace{0.1cm}$ es $\hspace{0.1cm}M_{j\hspace{0.05cm}^*}$

donde:

$$j\hspace{0.05cm}^* \hspace{0.15cm} =  \hspace{0.15cm} arg  \hspace{0.2cm} \underset{j\in \lbrace 1,...,h\rbrace}{Min}  \hspace{0.2cm}  BIC (M_j) \\$$
 

 

> El modelo con **menor** $\hspace{0.1cm}BIC\hspace{0.1cm}$ es el seleccionado, segun el criterio de información bayesiano.




<br>



## Estimación máximo-verosimil en el modelo de regresión lineal  <a class="anchor" id="14"></a>


Dado un modelo de regresión lineal $\hspace{0.1cm} M \hspace{0.1cm}$  con variable respuesta $\hspace{0.1cm}\mathcal{Y}$ 

Dada una m.a.s $\hspace{0.1cm}\mathcal{Y}_1,...,\mathcal{Y}_n\hspace{0.1cm}$ de la v.a. $\hspace{0.1cm}\mathcal{Y}\hspace{0.1cm}$ , en el modelo de regresión lineal ordinario se considera el siguiente supuesto fundamental:

$$\mathcal{Y}_i \hspace{0.1cm}=\hspace{0.1cm} \beta_0 + \sum_{j=1}^{p} \hspace{0.1cm}  \beta_j \cdot x_{ij}   \hspace{0.1cm}+\hspace{0.1cm} \varepsilon_i \hspace{0.35cm},\hspace{0.35cm} \text{con} \hspace{0.25cm} \varepsilon_i \sim N(\hspace{0.1cm} 0 , \sigma^2 \hspace{0.1cm})\hspace{0.35cm} , \hspace{0.35cm}\forall\hspace{0.1cm} i \in \lbrace 1,...,n \rbrace \\$$

De lo que se deduce lo siguiente:

$$\mathcal{Y}_i \hspace{0.1cm}\sim\hspace{0.1cm} N ( \hspace{0.1cm} \beta_0 + \sum_{j=1}^{p} \hspace{0.1cm}  \beta_j \cdot x_{ij} \hspace{0.2cm} , \hspace{0.2cm} \sigma^2 \hspace{0.1cm} )\hspace{0.35cm} , \hspace{0.35cm}\forall\hspace{0.1cm} i \in \lbrace 1,...,n \rbrace$$
 
Por tanto, la función de densidad de la v.a. $\hspace{0.1cm}\mathcal{Y}_i\hspace{0.1cm}$ es la función de densidad normal con la media y varianza especificadas, es decir:

$$
f_{\mathcal{Y}_i}(z) \hspace{0.1cm} = \hspace{0.1cm} \dfrac{1}{\sqrt{2\pi \sigma^2}} \cdot exp \left\lbrace \hspace{0.1cm} - \dfrac{1}{2\sigma^2} \cdot (\hspace{0.1cm} z -  \beta_0 + \sum_{j=1}^{p} \hspace{0.1cm}  \beta_j \cdot x_{ij}   \hspace{0.1cm} )^2 \hspace{0.1cm} \right\rbrace \hspace{0.35cm} , \hspace{0.35cm}\forall\hspace{0.1cm} i \in \lbrace 1,...,n \rbrace
$$


<br>

Dada una muestra de observaciones $Y=(y_1,...,y_n)$ de la variable respuesta $\mathcal{Y}$, donde y_i puede verse como una realizacion de la v.a. $\mathcal{Y}_i$ , la funcion de verosimilitud del modelo de regresión lineal es la funcion de densidad conjunta de la m.a.s $\mathcal{Y}_1,...,\mathcal{Y}_n$ evaluada en el vector de obeservaciones $Y=(y_1,...,y_n)$, es decir:
s:


$$L( M )=L(\beta, \sigma \hspace{0.1cm}|\hspace{0.1cm} x_i, y_i) \hspace{0.2cm}=\hspace{0.2cm} f_{\mathcal{Y}_1,...,\mathcal{Y}_n}(y_1,...,y_n) \hspace{0.2cm}=\hspace{0.2cm} \prod_{i=1}^{n} f_{\mathcal{Y}_i}(y_i) \hspace{0.2cm}=\hspace{0.2cm} \dfrac{1}{\sqrt{2\pi \sigma^2}}^{n} \cdot exp \left\lbrace \hspace{0.1cm} - \dfrac{1}{2\sigma^2}\cdot \sum_{i=1}^{n} ( \hspace{0.1cm} y_i -  \beta_0 + \sum_{j=1}^{p} \hspace{0.1cm}  \beta_j \cdot x_{ij}   \hspace{0.1cm}  )^2 \hspace{0.1cm} \right\rbrace \\[0.3cm]$$





<br>

Si se toma el logaritmo natural se tiene lo siguiente:

$$ln\left(\hspace{0.1cm}L(M)\hspace{0.1cm}\right)\hspace{0.1cm}=\hspace{0.1cm}ln(\hspace{0.1cm} L(\beta, \sigma \hspace{0.1cm}|\hspace{0.1cm} x_i, y_i)\hspace{0.1cm}) \hspace{0.1cm}=\hspace{0.1cm} - \dfrac{n}{2}\cdot \left(\hspace{0.1cm} ln(2\pi) + ln(\sigma^2) \hspace{0.1cm}\right) - \dfrac{1}{2\sigma^2} \sum_{i=1}^{n} \left(\hspace{0.1cm} y_i -  \beta_0 + \sum_{j=1}^{p} \hspace{0.1cm}  \beta_j \cdot x_{ij} \hspace{0.1cm}\right) ^2 $$


<br>

La estimación máximo verosimil de los parámetros $\hspace{0.1cm} \beta\hspace{0.1cm}$ y  $\hspace{0.1cm}\sigma \hspace{0.1cm}$ del modelo de regresión lineal es calculada como sigue:

$$\widehat{\beta}_{MLE} \hspace{0.12cm},\hspace{0.12cm} \widehat{\sigma}^2_{MLE} \hspace{0.2cm}=\hspace{0.2cm} arg \hspace{0.15cm} \underset{\beta \hspace{0.05cm},\hspace{0.05cm} \sigma^2}{Max} \hspace{0.2cm} \left\lbrace\hspace{0.1cm} ln(\hspace{0.1cm}  L(\beta, \sigma \hspace{0.1cm}|\hspace{0.1cm} x_i, y_i)  \hspace{0.1cm}) \hspace{0.1cm}\right\rbrace
$$

  

Existen expresiones cerrada para las soluciones del problema de optimización, y se puede demostrar que son las siguientes:

$$
\widehat{\beta}_{MLE}\hspace{0.1cm}=\hspace{0.1cm}(X^t \cdot X)^{-1} \cdot X^t \cdot Y  \hspace{0.1cm}=\hspace{0.1cm} \widehat{\beta}_{OLS} \\[0.5cm]
\widehat{\sigma}^2_{MLE} \hspace{0.1cm}=\hspace{0.1cm} RSS(M)/n
$$



<br>

Es importante notar que al ser el logaritmo una transformación monotona se conservan los puntos óptimos, aunque el valor de las funciones objetivo en los puntos optimos no sea el mismo. Pero a nosotros lo que nos interesa son los puntos óptimos.

Formalmente:

$$
arg \hspace{0.1cm} \underset{\beta \hspace{0.05cm},\hspace{0.05cm} \sigma}{Max} \hspace{0.2cm} L(\beta, \sigma \hspace{0.1cm}|\hspace{0.1cm} x_i, y_i) \hspace{0.1cm}=\hspace{0.1cm} arg \hspace{0.1cm} \underset{\beta \hspace{0.05cm},\hspace{0.05cm} \sigma}{Max} \hspace{0.2cm} ln(\hspace{0.1cm}  L(\beta, \sigma \hspace{0.1cm}|\hspace{0.1cm} x_i, y_i)\hspace{0.1cm}) \\
$$

 
Finalmente, la función $\hspace{0.15cm} ln \left( \hspace{0.1cm}L(M)\hspace{0.1cm} \right) \hspace{0.15cm}$ evaluada en las estimaciones máximo-verosimiles $\hspace{0.2cm} \beta=\widehat{\beta}_{MLE} \hspace{0.2cm}$ y $\hspace{0.2cm}\sigma^2 = \widehat{\sigma}^2_{MLE} \hspace{0.2cm}$ es : $\\[0.3cm]$

 
$$ ln \left( \hspace{0.1cm}\widehat{L}(M)\hspace{0.1cm} \right) =  - \dfrac{n}{2} \cdot \left( ln(2\pi) + ln\left(\dfrac{RSS(M)}{n}\right) - ln(n) + 1 \right) $$





 
<br>



## Criterios de información de Akaike y bayesiano en el modelo de regresión lineal 


Por tanto, en el modelo de regresión lineal $\hspace{0.1cm}M\hspace{0.1cm}$ con $\hspace{0.1cm}p\hspace{0.1cm}$ predictores y  $\hspace{0.1cm}n\hspace{0.1cm}$ observaciones de entrenamiento, el $\hspace{0.1cm}AIC\hspace{0.1cm}$ y el $\hspace{0.1cm}BIC\hspace{0.1cm}$ del modelo son:

<br>

$$
AIC(M) = n \cdot \left( \hspace{0.1cm}  ln(2\pi) + ln(RSS(M)) - ln(n) + 1 \hspace{0.1cm} \right)   \hspace{0.1cm}+\hspace{0.1cm} 2\cdot (\hspace{0.1cm}p + 1\hspace{0.1cm})
$$

$$
BIC(M) =  n \cdot \left(  \hspace{0.1cm} ln(2\pi) + ln(RSS(M)) - ln(n) + 1 \hspace{0.1cm} \right)  \hspace{0.1cm}+\hspace{0.1cm} ln(n)\cdot(\hspace{0.1cm} p + 1\hspace{0.1cm}) 
$$

<br>

donde:

$$
RSS(M)  \hspace{0.1cm}=\hspace{0.1cm}  \sum_{i=1}^n \hspace{0.1cm} ( y_i - \hat{y}_i)^2
$$



<br>

### Criterio de información de Akaike en  `Python` <a class="anchor" id="14"></a>








<br>



### Criterio de información bayesiano en  `Python`<a class="anchor" id="15"></a>








<br>



## Mallow's  Cp   

Dado un modelo de regresión lineal $\hspace{0.1cm} M_{Full}\hspace{0.1cm}$  entrenado con $\hspace{0.1cm} n\hspace{0.1cm}$ observaciones  la respuesta y  $\hspace{0.1cm} p\hspace{0.1cm}$ predictores $\hspace{0.1cm} M_{Full}:\hspace{0.15cm} \hat{y}_i \hspace{0.1cm}=\hspace{0.1cm} \widehat{\beta}_0 + \sum_{j=1}^{p} \hspace{0.02cm} \widehat{\beta}_j \cdot x_{ij}$




Dado otro modelo de regresión lineal $\hspace{0.1cm} M\hspace{0.1cm}$  entrenado con con $\hspace{0.1cm} n\hspace{0.1cm}$ observaciones de la respuesta y de $\hspace{0.1cm} q \hspace{0.1cm} \leq \hspace{0.1cm} p\hspace{0.1cm}$ de los $\hspace{0.1cm}p\hspace{0.1cm}$ predictores del modelo $M_{Full}$, es decir, $\hspace{0.1cm} M \subseteq M_{Full}\hspace{0.1cm}$  , el Mallows $\hspace{0.1cm}C_p\hspace{0.1cm}$ del modelo $M$ se define como : $\\[0.4cm]$


$$C_p(M) \hspace{0.15cm}=\hspace{0.15cm} \dfrac{RSS(M)}{\widehat{\sigma}_{M_{Full}}^2} - n \hspace{0.1cm}+\hspace{0.1cm} 2\cdot \left(\hspace{0.1cm} q + 1 \hspace{0.1cm}\right)$$



donde:

$\hat{\sigma}_{M_{Full}}^2 \hspace{0.1cm}=\hspace{0.1cm}  \dfrac{RSS(M_{Full})}{n-p-1}  \hspace{0.35cm}$ es la varianza residual del modelo completo.$\\[0.4cm]$

$RSS(M_{Full}) \hspace{0.1cm}=\hspace{0.1cm}  \sum_{i=1}^{n} \hspace{0.1cm} (\hspace{0.1cm} y_i - \widehat{y}_{M_{Full}\hspace{0.02cm},\hspace{0.02cm} i} \hspace{0.1cm})^2 \\$




**Criterio Mallows $C_p$  :**

Dados $\hspace{0.1cm}h\hspace{0.1cm}$ modelos de regresión $\hspace{0.1cm}M_1 , M_2, \dots, M_h$



El modelo seleccionado según el criterio $\hspace{0.1cm}C_p\hspace{0.1cm}$ es $\hspace{0.1cm}M_{j\hspace{0.05cm}^*}$

donde:

$$j\hspace{0.05cm}^* \hspace{0.15cm} =  \hspace{0.15cm} arg  \hspace{0.2cm} \underset{j\in \lbrace 1,...,h\rbrace}{Min}  \hspace{0.2cm}  C_p (M_j) \\$$
 

 

> El modelo con **menor** $\hspace{0.1cm}C_p\hspace{0.1cm}$ es el seleccionado, segun el criterio de información bayesiano.




 
<br>

### Mallows C_p en `Python` <a class="anchor" id="14"></a>








<br>

<br>

# Algoritmo best-subset-selection



- Se consideran $\hspace{0.1cm} p\hspace{0.1cm}$ variables estadísticas $\hspace{0.1cm}\mathcal{X}_1,...,\mathcal{X}_p\hspace{0.1cm}$ y una variable respuesta $\hspace{0.1cm}\mathcal{Y}$ $\\[0.5cm]$




- Se tiene una muestra de observaciones $\hspace{0.1cm}X_r = (x_{1r},...,x_{nr})^t\hspace{0.1cm}$ de la variable $\hspace{0.1cm}\mathcal{X}_r\hspace{0.1cm}$ , para cada $\hspace{0.1cm}r \in \lbrace 1,...,p \rbrace$ $\\[0.5cm]$


- Se tiene una muestra de observaciones $\hspace{0.1cm}Y = (y_1,...,y_n)^t\hspace{0.1cm}$ de la variable $\hspace{0.1cm}\mathcal{Y}$ $\\[0.5cm]$


- En conclusión, se tiene una muestra de observaciones $\hspace{0.12cm}D=[\hspace{0.12cm}X_1,...,X_p,Y \hspace{0.12cm}]\hspace{0.12cm}$
de los predictores y la respuesta.  En este contexto juega el papel de muestra de train. $\\[0.5cm]$


Vamos a añadir algo de notación que nos será util para exponer teoricamente los algoritmos de selección de variables.

  $\hspace{0.1cm}M(r_1,...,r_h)\hspace{0.1cm}$ es el modelo de regresión lineal que incluye la combinaciones de predictores $\hspace{0.1cm}\mathcal{X}_{r_1}  ,...,  \mathcal{X}_{r_h}\hspace{0.1cm}$, donde $\hspace{0.1cm}h\leq p\hspace{0.1cm}$ y $\hspace{0.1cm}r_j \in \lbrace 1,...,p \rbrace$.


$$M(r_1,...,r_h)\hspace{0.2cm} : \hspace{0.2cm} \hat{y}_i \hspace{0.1cm}=\hspace{0.1cm} \widehat{\beta}_0 \hspace{0.1cm} + \hspace{0.1cm} \sum_{j=r_1}^{r_h} \hspace{0.1cm} \widehat{\beta}_j \cdot x_{ij}$$


El algoritmo best-subset-selection consiste en entrenar el  modelo de regresión lineal con todas las posibles combinaciones de los $\hspace{0.1cm} p\hspace{0.1cm}$ predictores, y quedarse con el mejor de ellos, bajo algún criterio de selección.



El algoritmo best-subset-selection tiene los siguientes pasos:

 
- Se entrena el modelo de regresión lineal nulo $\hspace{0.25cm} \Rightarrow \hspace{0.25cm} M_0 \hspace{0.1cm} : \hspace{0.1cm} \hat{y}_i = \widehat{\beta}_0 \hspace{0.1cm}$  $\\[0.5cm]$
   
   
- Se entrenan todos los posibles modelos de regresión lineal con solo $1$ de los $\hspace{0.1cm}p\hspace{0.1cm}$ predictores $\hspace{0.25cm} \Rightarrow \hspace{0.25cm} M_1  \hspace{0.1cm} = \hspace{0.1cm} \left\lbrace \hspace{0.1cm} M(r) \hspace{0.15cm} / \hspace{0.15cm} r=1,...,p  \hspace{0.1cm} \right\rbrace \hspace{0.1cm} = \hspace{0.1cm} \left\lbrace \hspace{0.1cm} \hat{y}_i = \widehat{\beta}_0 + \widehat{\beta}_r \cdot x_{ir} \hspace{0.15cm} / \hspace{0.15cm} r=1,...,p  \hspace{0.1cm} \right\rbrace$ 

    - Se selecciona el  modelo del conjunto $M_1$ que tienen menor error cuadratico medio de train $\hspace{0.25cm} \Rightarrow \hspace{0.25cm} M_1^* = M(r^*)$
    
       Donde:
    
       $$r^* \hspace{0.15cm} = \hspace{0.15cm} arg \hspace{0.15cm} \underset{r\in \lbrace 1,...,p\rbrace}{Min}   \hspace{0.15cm} ECM\left( \hspace{0.05cm} M(r) \hspace{0.05cm}\right)_{train} \\$$

   
- Se entrenan todos los posibles modelos de regresión lineal con solo $2$ de los $\hspace{0.1cm}p\hspace{0.1cm}$ predictores:

    $$M_2 \hspace{0.1cm} = \hspace{0.1cm} \left\lbrace \hspace{0.1cm} M(r_1 , r_2) \hspace{0.15cm} / \hspace{0.15cm} r_1 \neq r_2 \in \lbrace 1,...,p \rbrace  \hspace{0.1cm} \right\rbrace \hspace{0.1cm} = \hspace{0.1cm} \left\lbrace \hspace{0.1cm} \hat{y}_i = \widehat{\beta}_0 + \sum_{j=r_1}^{r_2}  \hspace{0.1cm} \widehat{\beta}_j \cdot x_{ij}  \hspace{0.15cm} / \hspace{0.15cm}  r_1 \neq r_2 \in \lbrace 1,...,p \rbrace  \hspace{0.1cm} \right\rbrace$$ 

    - Se selecciona el  modelo del conjunto $\hspace{0.1cm}M_2\hspace{0.1cm}$ que tienen menor error cuadratico medio de train $\hspace{0.25cm} \Rightarrow \hspace{0.25cm} M_2^* = M(r_1^* , r_2^*)$ $\\[1cm]$
    
    
    Donde:
    
    $$(r_1^*  , r_2^*) \hspace{0.15cm} = \hspace{0.15cm} arg \hspace{0.15cm} \underset{r_1 , r_2\in \lbrace 1,...,p\rbrace \\ \hspace{0.5cm} r_1 \neq r_2}{Min}   \hspace{0.15cm} ECM\left( \hspace{0.05cm} M(r_1 , r_2) \hspace{0.05cm}\right)_{train} \\[1.5cm]$$




 
     
$\dots$ $\\[2cm]$


- Se entrenan todos los posibles modelos de regresión lineal con $\hspace{0.1cm}p-1\hspace{0.1cm}$ de los $\hspace{0.1cm}p\hspace{0.1cm}$ predictores:

    $$M_{p-1}  \hspace{0.1cm} = \hspace{0.1cm} \left\lbrace \hspace{0.1cm} M(r_1,...,r_{p-1})  \hspace{0.15cm} / \hspace{0.15cm} r_1 \neq \dots \neq r_{p-1} \in \lbrace 1,...,p \rbrace \hspace{0.1cm} \right\rbrace \hspace{0.1cm} = \hspace{0.1cm} \left\lbrace \hspace{0.1cm} \hat{y}_i \hspace{0.1cm}=\hspace{0.1cm} \widehat{\beta}_0\hspace{0.1cm} +\hspace{0.1cm} \sum_{j=r_1}^{r_{p-1}} \hspace{0.1cm} \widehat{\beta}_{j} \cdot x_{ij}   \hspace{0.15cm} / \hspace{0.15cm} r_1 \neq   \dots \neq r_{p-1} \in \lbrace 1,...,p \rbrace \hspace{0.1cm} \right\rbrace$$ 

    - Se selecciona el  modelo del conjunto $M_{p-1}$ que tienen menor error de train $\hspace{0.25cm} \Rightarrow \hspace{0.25cm} M_{p-1}^* = M(r_1^*,...,r_{p-1}^*)$ $\\[1cm]$ 
    
       Donde:
    
       $$(r_1^*  ,..., r_{p-1}^*) \hspace{0.15cm} = \hspace{0.15cm} arg \hspace{0.15cm} \underset{r_1 ,..., r_{p-1} \in \lbrace 1,...,p\rbrace \\ \hspace{0.5cm} r_1 \neq \dots \neq r_{p-1} }{Min}   \hspace{0.15cm} ECM\left( \hspace{0.05cm} M(r_1 ,..., r_{p-1}) \hspace{0.05cm}\right)_{train} \\$$

    
    


- Se entrenan el modelo de regresión lineal con los $\hspace{0.1cm}p\hspace{0.1cm}$ predictores:

$$M_p \hspace{0.15cm} : \hspace{0.15cm}  \hat{y}_i \hspace{0.1cm}  =\hspace{0.1cm}  \widehat{\beta}_0 \hspace{0.1cm}  + \hspace{0.1cm} \sum_{j=1}^{p} \hspace{0.1cm}  \widehat{\beta}_{j} \cdot x_{ij}\\[0.7cm]$$  

  


- De entre los modelos $\hspace{0.15cm} M_1, M_2^*,...,M_{p-1}^*,M_p \hspace{0.15cm}$ se selecciona uno bajo algún criterio. $\\[0.5cm]$

    - Si se usa el criterio $\hspace{0.1cm}AIC\hspace{0.1cm}$, $\hspace{0.1cm}BIC\hspace{0.1cm}$ o $\hspace{0.1cm}C_p$ $\hspace{0.2cm}\Rightarrow\hspace{0.2cm}$ se selecciona el modelo con **menor** $\hspace{0.1cm}AIC\hspace{0.1cm}$, $\hspace{0.1cm}BIC\hspace{0.1cm}$ o $\hspace{0.1cm}C_p \\$ 
    
    
    - Si se usa el criterio $\hspace{0.1cm}R_{adj}^2$ $\hspace{0.2cm}\Rightarrow\hspace{0.2cm}$ se selecciona el modelo con **mayor** $\hspace{0.1cm}R_{adj}^2\hspace{0.1cm} \\[1cm]$    
 
     Por ejemplo, si se usa el criterio $\hspace{0.1cm}AIC\hspace{0.1cm}$, entonces el modelo seleccionado es $\hspace{0.15cm} M^*  \hspace{0.15cm} = \hspace{0.15cm} arg \hspace{0.25cm} \underset{M \in \lbrace M_1,M_2^*,...,M_{p-1}^*,M_p \rbrace }{Min}   \hspace{0.25cm} AIC\left( \hspace{0.05cm} M \hspace{0.05cm}\right)_{train} \\$

    
    
 
 


<br>

**Observación:**

 No tiene por que cumplirse lo siguiente:

$$M_0 \subset M_1^* \subset M_2^* \subset \dots \subset M_{p-1}^* \subset M_{p} \\$$





**¿ Por qué no se selecciona el modelo final usando el error de train ?**

En este punto es recomendable haber leido el articulo sobre [métricas y algoritmos de validación de modelos de aprendizaje supervisado](http://estadistica4all.com/Articulos/Algoritmos-de-validacion-cruzada.html) que está disponible el blog [Estadistic4all](http://estadistica4all.com/).

El error de train de un modelo de regresión lineal  usando el error cuadrático medio como métrica de validación se define como:

 
$$ECM(M)_{train} =
\dfrac{1}{n} \cdot RS(M)S_{train} = \dfrac{1}{n} \sum_{i=1}^n (y_i - \hat{y}_{M \hspace{0.05cm},\hspace{0.05cm} i})$$

Y se cumple lo siguiente:

$$RSS(M_0)_{train} > RSS(M_1^*)_{train} > RSS(M_2^*)_{train} > ... > RSS(M_{p-1}^*)_{train} > RSS(M_p^*)_{train}$$

Así que:

$$ECM(M_0)_{train} > ECM(M_1^*)_{train} > ECM(M_2^*)_{train} > ... > ECM(M_{p-1}^*)_{train} > ECM(M_p^*)_{train}$$


Asi que si el error de entrenamiento, usando el ECM, fuese usado para seleccionar el modelo final, entonces el modelo mas grande (con más predictores) será siempre el seleccionado.

Por esta razzon no se seleccion el modelo final usando el error de entrenamiento.

Aunque esto no se cumple con el error de test, por esta razón el error de test podría usarse para seleccionar el modelo final.


<br>

**Problemas del algortimo best-subset-selection:**

- Tiene requerimientos computacionales altos: el algoritmo requiere calcular $\hspace{0.1cm}2^p\hspace{0.1cm}$ modelos, lo cual es imposible con más de $\hspace{0.05cm} p=40 \hspace{0.05cm}$ predictores, porque $\hspace{0.05cm} 2^{40}=1099511627776$.
  
  El crecimiento de los requerimientos computacionales, por ejemplo, con $\hspace{0.05cm} p=10$ predictores, necesitariamos calcular $\hspace{0.05cm} 2^{10}=1024 \hspace{0.05cm}$ modelos, pero con  $\hspace{0.05cm} p=15\hspace{0.05cm}$ los modelos que tiene que calcular ya son demasiados, puesto que $\hspace{0.05cm} 2^{15}=32768$




<br>



# Algoritmo alternative-best-subset-selection  


- Se consideran $\hspace{0.1cm} p\hspace{0.1cm}$ variables estadísticas $\hspace{0.1cm}\mathcal{X}_1,...,\mathcal{X}_p\hspace{0.1cm}$ y una variable respuesta $\hspace{0.1cm}\mathcal{Y}$ $\\[0.5cm]$




- Se tiene una muestra de observaciones $\hspace{0.1cm}X_r = (x_{1r},...,x_{nr})^t\hspace{0.1cm}$ de la variable $\hspace{0.1cm}\mathcal{X}_r\hspace{0.1cm}$ , para cada $\hspace{0.1cm}r \in \lbrace 1,...,p \rbrace$ $\\[0.5cm]$


- Se tiene una muestra de observaciones $\hspace{0.1cm}Y = (y_1,...,y_n)^t\hspace{0.1cm}$ de la variable $\hspace{0.1cm}\mathcal{Y}$ $\\[0.5cm]$


- En conclusión, se tiene una muestra de observaciones $\hspace{0.12cm}D=[\hspace{0.12cm}X_1,...,X_p,Y \hspace{0.12cm}]\hspace{0.12cm}$
de los predictores y la respuesta. En este contexto juega el papel de muestra de train. $\\[0.5cm]$




El algoritmo alternative-best-subset-selection consiste en entrenar el  modelo de regresión lineal con todas las posibles combinaciones de los $\hspace{0.1cm} p\hspace{0.1cm}$ predictores, y quedarse con el mejor de ellos, bajo algún criterio de selección.

El algoritmo alternative-best-subset-selection tiene los siguientes pasos:


- Se entrena el modelo de regresión lineal nulo $\hspace{0.25cm} \Rightarrow \hspace{0.25cm} M_0 \hspace{0.15cm} : \hspace{0.15cm} \hat{y}_i = \widehat{\beta}_0 \hspace{0.1cm}$  $\\[0.5cm]$
   
   
- Se entrenan todos los posibles modelos de regresión lineal con solo **uno** de los $\hspace{0.1cm}p\hspace{0.1cm}$ predictores:

$$M_1   \hspace{0.1cm} = \hspace{0.1cm} \left\lbrace \hspace{0.1cm} M(r) \hspace{0.15cm} / \hspace{0.15cm} r=1,...,p  \hspace{0.1cm} \right\rbrace \hspace{0.1cm} = \hspace{0.1cm} \left\lbrace \hspace{0.1cm} \hat{y}_i = \widehat{\beta}_0 + \widehat{\beta}_r \cdot x_{ir} \hspace{0.15cm} / \hspace{0.15cm} r=1,...,p  \hspace{0.1cm} \right\rbrace$$ $\\[0.5cm]$ 

 
   
- Se entrenan todos los posibles modelos de regresión lineal con solo **dos** de los $\hspace{0.1cm}p\hspace{0.1cm}$ predictores:

$$M_2 \hspace{0.1cm} = \hspace{0.1cm} \left\lbrace \hspace{0.1cm} M(r_1,r_2) \hspace{0.15cm} / \hspace{0.15cm} r_1\neq r_2 =1,...,p  \hspace{0.1cm} \right\rbrace \hspace{0.1cm} = \hspace{0.1cm} \left\lbrace \hspace{0.1cm} \hat{y}_i = \widehat{\beta}_0 + \sum_{j=r_1}^{r_2} \widehat{\beta}_j \cdot x_{ij}   \hspace{0.15cm} / \hspace{0.15cm} r_1 \neq r_2 =1,...,p  \hspace{0.1cm} \right\rbrace \\$$

 


$\dots$ $\\[1cm]$


- Se entrenan todos los posibles modelos de regresión lineal con $\hspace{0.1cm}p-1\hspace{0.1cm}$ de los $\hspace{0.1cm}p\hspace{0.1cm}$ predictores:


$$M_{p-1} \hspace{0.1cm} = \hspace{0.1cm} \left\lbrace \hspace{0.1cm} M(r_1,...,r_{p-1})  \hspace{0.15cm} / \hspace{0.15cm} r_1 \neq \dots \neq r_{p-1} = 1,...,p  \hspace{0.1cm} \right\rbrace \hspace{0.1cm} = \hspace{0.1cm} \left\lbrace \hspace{0.1cm} \hat{y}_i = \widehat{\beta}_0 + \sum_{j=r_1}^{r_{p-1}} \widehat{\beta}_{j} \cdot x_{ij}   \hspace{0.15cm} / \hspace{0.15cm} r_1 \neq  \dots \neq r_{p-1} = 1,...,p  \hspace{0.1cm} \right\rbrace \\$$ 

 

- Se entrenan el modelo de regresión lineal con los $\hspace{0.1cm}p\hspace{0.1cm}$ predictores:

$$M_{p}  \hspace{0.1cm} : \hspace{0.1cm}  \hat{y}_i = \widehat{\beta}_0 + \widehat{\beta}_{1} \cdot x_{i1} + \widehat{\beta}_{2} \cdot x_{i2} +\dots + \widehat{\beta}_{p} \cdot x_{ip} \\$$ 

  


- De entre los modelos del conjunto $\hspace{0.1cm}M_1 \cup M_2 \cup...\cup M_{p-1} \cup M_p\hspace{0.1cm}$ se selecciona uno bajo algún criterio.

    - Si se usa el criterio $\hspace{0.1cm}AIC\hspace{0.1cm}$, $\hspace{0.1cm}BIC\hspace{0.1cm}$ o $\hspace{0.1cm}C_p$ $\hspace{0.2cm}\Rightarrow\hspace{0.2cm}$ se selecciona el modelo con **menor** $\hspace{0.1cm}AIC\hspace{0.1cm}$, $\hspace{0.1cm}BIC\hspace{0.1cm}$ o $\hspace{0.1cm}C_p \\$ 
    
    
    - Si se usa el criterio $\hspace{0.1cm}R_{adj}^2$ $\hspace{0.2cm}\Rightarrow\hspace{0.2cm}$ se selecciona el modelo con **mayor** $\hspace{0.1cm}R_{adj}^2\hspace{0.1cm}\\$    
 
 
      Por ejemplo, si se usa el criterio $\hspace{0.1cm}AIC\hspace{0.1cm}$, entonces el modelo seleccionado es $\hspace{0.15cm} M^*  \hspace{0.15cm} = \hspace{0.15cm} arg \hspace{0.25cm} \underset{M \in M_1\cup ... \cup M_p  }{Min}   \hspace{0.25cm} AIC\left( \hspace{0.05cm} M \hspace{0.05cm}\right)_{train} \\$

    
    
<br>
 

**Problemas:**

- Esencialmente los mismos que el algoritmo best-subset-selection.




<br>



### Alternative-best-subset-selection programado en `Python` <a class="anchor" id="21"></a>


 












<br>


# Algoritmo forward-selection



- Se consideran $\hspace{0.1cm} p\hspace{0.1cm}$ variables estadísticas $\hspace{0.1cm}\mathcal{X}_1,...,\mathcal{X}_p\hspace{0.1cm}$ y una variable respuesta $\hspace{0.1cm}\mathcal{Y}$ $\\[0.5cm]$



- Se tiene una muestra de observaciones $\hspace{0.1cm}X_r = (x_{1r},...,x_{nr})^t\hspace{0.1cm}$ de la variable $\hspace{0.1cm}\mathcal{X}_r\hspace{0.1cm}$ , para cada $\hspace{0.1cm}r \in \lbrace 1,...,p \rbrace$ $\\[0.5cm]$


- Se tiene una muestra de observaciones $\hspace{0.1cm}Y = (y_1,...,y_n)^t\hspace{0.1cm}$ de la variable $\hspace{0.1cm}\mathcal{Y}$ $\\[0.5cm]$


- En conclusión, se tiene una muestra de observaciones $\hspace{0.12cm}D=[\hspace{0.12cm}X_1,...,X_p,Y \hspace{0.12cm}]\hspace{0.12cm}$
de los predictores y la respuesta. En este contexto juega el papel de muestra de train. $\\[0.5cm]$




El algoritmo forward-selection consiste en entrenar el  modelo de regresión lineal con todas las posibles combinaciones de los $\hspace{0.1cm} p\hspace{0.1cm}$ predictores, y quedarse con el mejor de ellos, bajo algún criterio de selección.

El algoritmo forward-selection tiene los siguientes pasos:



- Se entrena el modelo de regresión lineal nulo $\hspace{0.25cm} \Rightarrow \hspace{0.25cm} M_0 \hspace{0.15cm} : \hspace{0.15cm} \hat{y}_i = \widehat{\beta}_0 \hspace{0.1cm}$  $\\[0.5cm]$
   
   
- Se entrenan todos los  modelos de regresión lineal que resultan de añadir uno de los predictores al modelo nulo $M_0$ :

    $$M_1 \hspace{0.1cm} = \hspace{0.1cm} \left\lbrace \hspace{0.1cm} M(r) \hspace{0.15cm} / \hspace{0.15cm} r=1,...,p  \hspace{0.1cm} \right\rbrace \hspace{0.1cm} = \hspace{0.1cm} \left\lbrace \hspace{0.1cm} \hat{y}_i = \widehat{\beta}_0 + \widehat{\beta}_r \cdot x_{ir} \hspace{0.15cm} / \hspace{0.15cm} r=1,...,p  \hspace{0.1cm} \right\rbrace$$  

 
    - Se selecciona el  modelo del conjunto $M_1$ que tienen menor error de train $\hspace{0.25cm} \Rightarrow \hspace{0.25cm} M_1^* = M(r_1^*) \\$
    
       Donde:
    
       $$r_1^* \hspace{0.15cm} = \hspace{0.15cm} arg \hspace{0.15cm} \underset{r\in \lbrace 1,...,p\rbrace}{Min}   \hspace{0.15cm} ECM\left( \hspace{0.05cm} M(r) \hspace{0.05cm}\right)_{train} \\$$

    

   
- Se entrenan todos los  modelos de regresión lineal que resultan de añadir un nuevo predictor al modelo $M_1^*=M(r_1^*)$ :

    $$M_2  \hspace{0.1cm} = \hspace{0.1cm} \left\lbrace \hspace{0.1cm}  M(r_1^* , r) \hspace{0.15cm} / \hspace{0.15cm} r\neq r_1^* \in \lbrace 1,...,p \rbrace \hspace{0.1cm} \right\rbrace\hspace{0.1cm} = \hspace{0.1cm} \left\lbrace \hspace{0.1cm}  \hat{y}_i = \widehat{\beta}_0 + \beta_{r_1^*} \cdot x_{i r_1^*} + \widehat{\beta}_{r} \cdot x_{i r} \hspace{0.15cm} / \hspace{0.15cm} r\neq r_1^* \in \lbrace 1,...,p \rbrace \hspace{0.1cm} \right\rbrace$$ 

 
    - Se selecciona el  modelo del conjunto $M_2$ que tienen menor error de train $\hspace{0.25cm} \Rightarrow \hspace{0.25cm} M_2^*=M(r_1^* , r_2^*) \\$ 
    
        Donde:
    
        $$r_2^* \hspace{0.15cm} = \hspace{0.15cm} arg \hspace{0.15cm} \underset{r\in \lbrace 1,...,p\rbrace}{Min}   \hspace{0.15cm} ECM\left( \hspace{0.05cm} M(r_1^* , r) \hspace{0.05cm}\right)_{train} \\$$

    
    

     $\dots$ $\\[1cm]$

- Se entrenan todos los  modelos de regresión lineal que resultan de añadir un nuevo predictor al modelo $\hspace{0.15cm} M_{p-2}^*$ :



     $$M_{p-1} \hspace{0.1cm} = \hspace{0.1cm} \left\lbrace \hspace{0.1cm}  M(r_1^* , r_2^*,...,r_{p-2}^*, r)    \hspace{0.2cm} / \hspace{0.2cm} r \neq r_1^*\neq \dots \neq r_{p-2}^* \in \lbrace 1,...,p \rbrace  \hspace{0.1cm} \right\rbrace   \hspace{0.1cm} = \hspace{0.1cm} \left\lbrace \hspace{0.1cm}  \hat{y}_i = \widehat{\beta}_0 + \sum_{j=r_1^*}^{r_{p-2}^*} \beta_{j} \cdot x_{i j} +  \beta_{r} \cdot x_{i r}  \hspace{0.2cm} / \hspace{0.2cm} r\neq r_1^*\neq \dots \neq r_{p-2}^* \in \lbrace 1,...,p \rbrace  \hspace{0.1cm} \right\rbrace$$ 

 
    - Se selecciona el  modelo del conjunto $M_{p-1}$ que tienen menor error de train $\hspace{0.25cm} \Rightarrow \hspace{0.25cm} M_{p-1}^*=M(r_1^* , r_2^*,...,r_{p-2}^*, r_{p-1}^*)\\$
    
       Donde:
    
       $$r_{p-1}^* \hspace{0.15cm} = \hspace{0.15cm} arg \hspace{0.15cm} \underset{r\in \lbrace 1,...,p\rbrace}{Min}   \hspace{0.15cm} ECM\left( \hspace{0.05cm}M(r_1^* , r_2^*,...,r_{p-2}^*, r) \hspace{0.05cm}\right)_{train} \\$$

    
    
     

- Se entrenan el modelo de regresión lineal con los $\hspace{0.1cm}p\hspace{0.1cm}$ predictores $\hspace{0.25cm} \Rightarrow \hspace{0.25cm} M_{p}  \hspace{0.1cm} : \hspace{0.1cm}  \hat{y}_i = \widehat{\beta}_0 + \sum_{j=1}^p  \widehat{\beta}_{j} \cdot x_{ij} \\$

 
  


- De entre los modelos  $\hspace{0.1cm}M_1, M_2^*,..., M_{p-1}^*, M_p\hspace{0.1cm}$ se selecciona uno bajo algún criterio.

    - Si se usa el criterio $\hspace{0.1cm}AIC\hspace{0.1cm}$, $\hspace{0.1cm}BIC\hspace{0.1cm}$ o $\hspace{0.1cm}C_p$ $\hspace{0.2cm}\Rightarrow\hspace{0.2cm}$ se selecciona el modelo con **menor** $\hspace{0.1cm}AIC\hspace{0.1cm}$, $\hspace{0.1cm}BIC\hspace{0.1cm}$ o $\hspace{0.1cm}C_p \\$ 
    
    
    - Si se usa el criterio $\hspace{0.1cm}R_{adj}^2$ $\hspace{0.2cm}\Rightarrow\hspace{0.2cm}$ se selecciona el modelo con **mayor** $\hspace{0.1cm}R_{adj}^2\hspace{0.1cm}\\$    
 


      Por ejemplo, si se usa el criterio $\hspace{0.1cm}AIC\hspace{0.1cm}$, entonces el modelo seleccionado es $\hspace{0.15cm} M^*  \hspace{0.15cm} = \hspace{0.15cm} arg \hspace{0.25cm} \underset{M \in \lbrace M_1, M_2^*,..., M_{p-1}^*, M_p \rbrace  }{Min}   \hspace{0.25cm} AIC\left( \hspace{0.05cm} M \hspace{0.05cm}\right)_{train} \\$

 


<br>

**Observación:**

Se cumple en este algoritmo lo siguiente:

$$M_0 \subset M_1^* \subset M_2^* \subset M_3^* ,..., M_{p-1}^* \subset M_p$$






<br>


<br>


# Algoritmo backward-selection




- Se consideran $\hspace{0.1cm} p\hspace{0.1cm}$ variables estadísticas $\hspace{0.1cm}\mathcal{X}_1,...,\mathcal{X}_p\hspace{0.1cm}$ y una variable respuesta $\hspace{0.1cm}\mathcal{Y}$ $\\[0.5cm]$



- Se tiene una muestra de observaciones $\hspace{0.1cm}X_r = (x_{1r},...,x_{nr})^t\hspace{0.1cm}$ de la variable $\hspace{0.1cm}\mathcal{X}_r\hspace{0.1cm}$ , para cada $\hspace{0.1cm}r \in \lbrace 1,...,p \rbrace$ $\\[0.5cm]$


- Se tiene una muestra de observaciones $\hspace{0.1cm}Y = (y_1,...,y_n)^t\hspace{0.1cm}$ de la variable $\hspace{0.1cm}\mathcal{Y}$ $\\[0.5cm]$


- En conclusión, se tiene una muestra de observaciones $\hspace{0.12cm}D=[\hspace{0.12cm}X_1,...,X_p,Y \hspace{0.12cm}]\hspace{0.12cm}$
de los predictores y la respuesta. En este contexto juega el papel de muestra de train. $\\[0.5cm]$




El algoritmo backward-selection consiste en entrenar el  modelo de regresión lineal con todas las posibles combinaciones de los $\hspace{0.1cm} p\hspace{0.1cm}$ predictores, y quedarse con el mejor de ellos, bajo algún criterio de selección.

El algoritmo backward-selection tiene los siguientes pasos:



- Se entrena el modelo de regresión lineal con los $\hspace{0.1cm}p\hspace{0.1cm}$ predictores $\hspace{0.25cm} \Rightarrow \hspace{0.25cm} M_p \hspace{0.1cm} : \hspace{0.1cm} \hat{y}_i = \widehat{\beta}_0 + \sum_{j=1}^p \hspace{0.1cm} \widehat{\beta}_j \cdot x_{ij} \hspace{0.1cm}$  $\\[0.5cm]$
   
   
- Se entrenan todos los  modelos de regresión lineal que resultan de eliminar uno de los predictores del modelo  completo $M_p$ :


     $$M_{p-1} \hspace{0.1cm} = \hspace{0.1cm} \left\lbrace \hspace{0.1cm}  M(r_1 ,...,r_{p-1})    \hspace{0.2cm} / \hspace{0.2cm}  r_1\neq \dots \neq r_{p-1} \in \lbrace 1,...,p \rbrace  \hspace{0.1cm} \right\rbrace   \hspace{0.1cm} = \hspace{0.1cm} \left\lbrace \hspace{0.1cm}  \hat{y}_i = \widehat{\beta}_0 + \sum_{j=r_1}^{r_{p-1}} \beta_{j} \cdot x_{i j}   \hspace{0.2cm} / \hspace{0.2cm}  r_1\neq \dots \neq r_{p-1} \in \lbrace 1,...,p \rbrace  \hspace{0.1cm} \right\rbrace$$ 



 
    - Se selecciona el  modelo del conjunto $M_{p-1}$ que tienen menor error de train  $\hspace{0.25cm} \Rightarrow \hspace{0.25cm} M_{p-1}^* = M(r_{1,1}^*,...,r_{1,p-1}^*)$ $\\[1cm]$ 
    
       Donde:
    
       $$(r_{1,1}^*  ,..., r_{1, p-1}^*) \hspace{0.15cm} = \hspace{0.15cm} arg \hspace{0.15cm} \underset{r_1 ,..., r_{p-1} \in \lbrace 1,...,p\rbrace \\ \hspace{0.5cm} r_1 \neq \dots \neq r_{p-1} }{Min}   \hspace{0.15cm} ECM\left( \hspace{0.05cm} M(r_1 ,..., r_{p-1}) \hspace{0.05cm}\right)_{train} \\$$

    
    

   
- Se entrenan todos los  modelos de regresión lineal que resultan de eliminar un predictor del modelo $M_{p-1}^*$ :


     $$M_{p-2} \hspace{0.1cm} = \hspace{0.1cm} \left\lbrace \hspace{0.1cm}  M(r_1 ,...,r_{p-2})    \hspace{0.2cm} / \hspace{0.2cm}  r_1\neq \dots \neq r_{p-2} \in \lbrace r_{1,1}^*,...,r_{1,p-2}^*,r_{1,p-1}^* \rbrace  \hspace{0.1cm} \right\rbrace   \hspace{0.1cm} = \hspace{0.1cm} \left\lbrace \hspace{0.1cm}  \hat{y}_i = \widehat{\beta}_0 + \sum_{j=r_1}^{r_{p-2}} \beta_{j} \cdot x_{i j}   \hspace{0.2cm} / \hspace{0.2cm}  r_1\neq \dots \neq r_{p-2}\in \lbrace r_{1,1}^*,...,r_{1,p-2}^*,r_{1,p-1}^* \rbrace  \hspace{0.1cm} \right\rbrace$$ 


    - Se selecciona el  modelo del conjunto $M_{p-2}$ que tienen menor error de train  $\hspace{0.25cm} \Rightarrow \hspace{0.25cm} M_{p-2}^* = M(r_{2,1}^*,...,r_{2,p-2}^*)$ $\\[1cm]$ 
    
       Donde:
    
       $$(r_{2,1}^*  ,..., r_{2, p-2}^*) \hspace{0.15cm} = \hspace{0.15cm} arg \hspace{0.15cm} \underset{r_1 ,..., r_{p-2} \in \lbrace 1,...,p\rbrace \\ \hspace{0.5cm} r_1 \neq \dots \neq r_{p-2} }{Min}   \hspace{0.15cm} ECM\left( \hspace{0.05cm} M(r_1 ,..., r_{p-2}) \hspace{0.05cm}\right)_{train} \\$$

    
    


     $\dots$ $\\[1cm]$
     
     

- Se entrenan todos los  modelos de regresión lineal que resultan de eliminar un   predictor del modelo $\hspace{0.15cm} M_{2}^*=M_{p-(p-2)}^*=M(r_{p-2,1}^*,r_{p-2,2}^*)$ :


    $$M_{1} \hspace{0.1cm} = \hspace{0.1cm} \left\lbrace \hspace{0.1cm}  M(r)    \hspace{0.2cm} / \hspace{0.2cm}  r \in \lbrace r_{p-2,1}^*,r_{p-2,2}^* \rbrace  \hspace{0.1cm} \right\rbrace   \hspace{0.1cm} = \hspace{0.1cm} \left\lbrace \hspace{0.1cm}  \hat{y}_i = \widehat{\beta}_0 + \beta_{r} \cdot x_{i r}   \hspace{0.2cm} / \hspace{0.2cm}  r\in \lbrace r_{p-2,1}^*,r_{p-2,2}^* \rbrace  \hspace{0.1cm} \right\rbrace \\$$ 




- Se entrenan el modelo de regresión lineal nulo  $\hspace{0.25cm} \Rightarrow \hspace{0.25cm} M_{0}  \hspace{0.1cm} : \hspace{0.1cm}  \hat{y}_i = \widehat{\beta}_0 \\[0.7cm]$ 

  


- De entre los modelos  $\hspace{0.1cm}M_1, M_2^*,..., M_{p-1}^*, M_p\hspace{0.1cm}$ se selecciona uno bajo algún criterio.

    - Si se usa el criterio $\hspace{0.1cm}AIC\hspace{0.1cm}$, $\hspace{0.1cm}BIC\hspace{0.1cm}$ o $\hspace{0.1cm}C_p$ $\hspace{0.2cm}\Rightarrow\hspace{0.2cm}$ se selecciona el modelo con **menor** $\hspace{0.1cm}AIC\hspace{0.1cm}$, $\hspace{0.1cm}BIC\hspace{0.1cm}$ o $\hspace{0.1cm}C_p \\$ 
    
    
    - Si se usa el criterio $\hspace{0.1cm}R_{adj}^2$ $\hspace{0.2cm}\Rightarrow\hspace{0.2cm}$ se selecciona el modelo con **mayor** $\hspace{0.1cm}R_{adj}^2\hspace{0.1cm}$    
 
       Por ejemplo, si se usa el criterio $\hspace{0.1cm}AIC\hspace{0.1cm}$, entonces el modelo seleccionado es $M^*$.
       
       Donde:
       
$$M^*  \hspace{0.15cm} = \hspace{0.15cm} arg \hspace{0.25cm} \underset{M}{Min}   \hspace{0.25cm} AIC\left( \hspace{0.05cm} M  \hspace{0.05cm}\right)_{train} \\[0.6cm]    
\hspace{-6.5cm} \text{sujeto a :}    \\[0.3cm]  \hspace{3cm}  M \in \lbrace M_1, M_2^*,..., M_{p-1}^*, M_p \rbrace$$

 


<br>

**Observación:**

Se cumple en este algoritmo lo siguiente:

$$M_0 \subset M_1^* \subset M_2^* \subset M_3^* ,..., M_{p-1}^* \subset M_p$$





<br>





<br>


