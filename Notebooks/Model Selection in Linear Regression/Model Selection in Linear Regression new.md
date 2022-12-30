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



En esta seccion vamos a presentar el modelo de regresión lineal desde un enfoque algoritmico, como algoritmo de regresión.

Se consideran $\hspace{0.1cm} p\hspace{0.1cm}$ variables estadisticas $\hspace{0.1cm}\mathcal{X}_1,...,\mathcal{X}_p\hspace{0.1cm}$ y una variable respuesta $\hspace{0.1cm}\mathcal{Y}$


Se tiene una muestra $\hspace{0.1cm}X_r = (x_{1r},...,x_{nr})^t\hspace{0.1cm}$ de la variable $\hspace{0.1cm}\mathcal{X}_r\hspace{0.1cm}$ , para cada $\hspace{0.1cm}r \in \lbrace 1,...,p \rbrace$


Se tiene una muestra $\hspace{0.1cm}Y = (y_1,...,y_n)^t\hspace{0.1cm}$ de la variable $\mathcal{Y}$


En conclusión, se tiene una muestra $\hspace{0.12cm}D=[\hspace{0.12cm}X_1,...,X_p,Y \hspace{0.12cm}]\hspace{0.12cm}$
de los predictores y la respuesta.

La predicción de la variable respuesta para un vector cualquiera de observaciones   de los predictores $\hspace{0.1cm}x_{*} \in \mathbb{R}^{p}\hspace{0.1cm}$, según el algoritmo de regresión lineal, es la siguiente:



$$\hat{y}_*  \hspace{0.15cm}=\hspace{0.15cm} \widehat{\beta}_0 +  \sum_{r=1}^p \hspace{0.12cm} \widehat{\beta}_r \cdot x_{*r}$$

donde los parametros $\hspace{0.12cm}\beta}_0 , \widehat{\beta}_1,...,\widehat{\beta}_p\hspace{0.12cm}$ se obtienen resolviendo el problema de minimos cuadrados ordinarios:

$$\widehat{\beta} \hspace{0.15cm}=\hspace{0.15cm} \left( \widehat{\beta}_0 , \widehat{\beta}_1,...,\widehat{\beta}_p \right)  \hspace{0.2cm} = \hspace{0.2cm} arg \hspace{0.2cm} \underset{ \beta_0 , \beta_1,...,\beta_p}{Min} \hspace{0.2cm} \sum_{i=1}^n  \hspace{0.12cm} \left(  y_i - \left( \hspace{0.12cm} \beta_0 + \sum_{r=1}^p \hspace{0.1 cm} \beta_r \cdot x_{ir} \hspace{0.12cm} \right) \right)^2$$



<br>

Existe una solución cerrada para este problema de optimización, y se puede demostrar que es la siguiente:


$$\widehat{\beta}\hspace{0.1cm}=\hspace{0.1cm}(X^t \cdot X)^{-1} \cdot X^t \cdot Y$$

donde: 

$$\hspace{0.1cm} X \hspace{0.1cm}=\hspace{0.1cm} [\hspace{0.05cm}\mathbb{1} , X_1,...,X_p \hspace{0.05cm}]$$

<br>


**Observaciones:**

- La muestra $\hspace{0.12cm}D=[\hspace{0.12cm}X_1,...,X_p,Y\hspace{0.12cm}]\hspace{0.12cm}$ esta jugando el papel de muestra de entrenamiento.



- Es de especial interés el caso en el que $\hspace{0.12cm}x_*\hspace{0.12cm}$  es una nueva observación de los predictores para la que se desconoce el valor de la respuesta, es decir, $\hspace{0.12cm}x_* = x_{new}$. 

    El algoritmo también permite predecir la respuesta para las observaciones de los predictores con las que el modelo ha sido entrenado, es decir $x_{*} = x_i \hspace{0.15cm},\hspace{0.15cm} i =1,...,n \\$

- Se denomina regresión **lineal** por que la ecuación con la que se predice la respuesta es una ecuación lineal en los betas.


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

En regresión lineal dos contrastes de hipotesis muy relevantes son el contraste de significación individual y el contraste de significación global (ANOVA). Si se quiere ver una introducción a estos contrastes se recomienda el articulo sobre [el modelo de regresión lineañ](http://estadistica4all.com/Articulos/Linear-Regression-new.html ) de [Estadistica4all](http://estadistica4all.com/)



The ANOVA and significance test are a particular case of a more general test that is useful to compere linear regression models, but always under the assumptions of the model.




-   We have a linear regression model with $\hspace{0.1cm} k \hspace{0.1cm}$ coefficients (betas)  $\hspace{0.1cm} \Rightarrow \hspace{0.1cm} \Omega_k$

     -  $\Omega_k \ : \  \ y_i = \beta_0 + \beta_1\cdot x_{i1} +...+ \beta_{k-1}\cdot x_{i(k-1)} + \varepsilon_i \\[0.5cm]$



-   We have another linear regression model with only
    $\hspace{0.1cm} q<k \hspace{0.1cm}$ coefficients (betas) of $\Omega_p$ $\hspace{0.1cm} \Rightarrow \hspace{0.1cm}  \omega_q$

     -  $\omega_q \ : \  \ y_i = \beta_0 + \beta_1\cdot x_{i1} +...+ \beta_{q-1}\cdot x_{i(q-1)} + \varepsilon_i \\[0.2cm]$ 



-   $\omega_q$ is a sub-model of $\Omega_k$ , we can denote this as
    $\hspace{0.1cm} \omega_q \subset \Omega_k$
    

<br>


The hypothesis test we want to carry out is the following:

<br>

\begin{gather*}
H_0: \hspace{0.15cm} \omega_q  \\
H_1: \hspace{0.15cm} \Omega_k
\end{gather*}



Where :

- $\hspace{0.2cm} \omega_q \subset \Omega_p \\[0.2cm]$

- $\hspace{0.2cm}$ Reject $H_0$ means  $\hspace{0.1cm} \Omega_k\hspace{0.1cm}$ is a "better" model than $\hspace{0.1cm} \omega_q \\[0.2cm]$

- $\hspace{0.2cm}$ Not Reject $H_0$ means $\hspace{0.1cm} \Omega_k \hspace{0.1cm}$ isn't a "better" model than $\hspace{0.1cm} \omega_q$

<br>



Now we have to determinate a rule to reject $\hspace{0.1cm}H_0\hspace{0.1cm}$ in favor of $\hspace{0.1cm}H_1\hspace{0.1cm}$ or not

A first approach is the following:

Let :

$$
RSS_{\Omega_k} =  \sum_{i=1}^n ( \hat{\varepsilon}_{\Omega_k \hspace{0.05cm},\hspace{0.05cm} i} )^2 =  \sum_{i=1}^n \left( y_i - \hat{y}_{\hspace{0.01cm} \Omega_k \hspace{0.05cm},\hspace{0.02cm} i}\right)^2   \\[0.2cm]
$$

$$
RSS_{\omega_q} =  \sum_{i=1}^n ( \hat{\varepsilon}_{\omega_q \hspace{0.05cm},\hspace{0.05cm} i} )^2 =  \sum_{i=1}^n \left( y_i - \hat{y}_{\omega_q \hspace{0.05cm},\hspace{0.02cm} i}\right)^2
$$

<br>

-   If $\hspace{0.15cm} RSS_{\omega_q} - RSS_{\Omega_k} \hspace{0.15cm}$ is **small**, then the (train)
    predictions of the **smaller model** $(\omega_q)$ are almost as good as the **larger
    model** $(\Omega_k)$, so we would prefer the smaller model on the grounds of simplicity. $\\[0.8cm]$

 

-   If $\hspace{0.1cm} RSS_{\omega_q} - RSS_{\Omega_k} \hspace{0.1cm}$ is **large**, then the (train)
    predictions  of the **smaller model** $(\omega_q)$  are much worse than the **larger
    model** $(\Omega_k)$, so we would prefer the larger model.$\\[0.35cm]$

<br>

That suggest that something like

$$
\dfrac{RSS_{\omega_q} - RSS_{\Omega_k}}{RSS_{\Omega_k}}
$$

would be a potentially good test statistic, where the denominator is used for scaling purposes.







<br>

## Statistic Test

Finally we can get  an statistic test based on the previous
expression, called **F-statistic**:

<br>

$$
F=\dfrac{(RSS_{\omega_q} - RSS_{\Omega_k})/(k-q)}{RSS_{\Omega_k}/(n-k)} \sim F_{\hspace{0.05cm} k-q \hspace{0.05cm},\hspace{0.05cm} n-k}
$$


<br>


If $\hspace{0.15cm} df_{\Omega_k} = n-k \hspace{0.15cm}$ and $\hspace{0.15cm} df_{\omega_q} = n-q \hspace{0.15cm}$ , then :


<br>

$$
F=\dfrac{(RSS_{\omega_q} - RSS_{\Omega_k})/(df_{\omega_q} - df_{\Omega_k})}{RSS_{\Omega_k}/df_{\Omega_k}} \sim F_{\hspace{0.05cm} (df_{\omega_q} - df_{\Omega_k}) \hspace{0.05cm},\hspace{0.05cm} df_{\Omega_k}}
$$

<br>


Where:

$k\hspace{0.15cm}$ is the number of coefficients (betas) of the model $\hspace{0.15cm}\Omega_k$

$q\hspace{0.15cm}$ is the number of coefficients (betas) of the model $\hspace{0.15cm}\omega_q$


The beauty of this approach is you only need to know the general form.
In any particular case, you just need to figure out which model
represent the null and alternative hypothesis, fit them and compute the test statistic.



















