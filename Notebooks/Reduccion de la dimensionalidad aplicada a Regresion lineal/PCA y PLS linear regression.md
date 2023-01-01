---
title: 'Reducción de la dimensión aplicada a regresión lineal'
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


# El algoritmo de regresión lineal por minimos cuadrados ordinaros <a class="anchor" id="5"></a>



En esta sección vamos a presentar el modelo de regresión lineal por minimos cuadrados ordinarios desde un enfoque algorítmico, como algoritmo de regresión.

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



$$\widehat{\hspace{0.01cm} y \hspace{0.01cm}}_*  \hspace{0.15cm}=\hspace{0.15cm} \widehat{\beta}_0 +  \sum_{r=1}^p \hspace{0.12cm} \widehat{\beta}_r \cdot x_{*r} \hspace{0.3cm} , \hspace{0.25cm} \forall \hspace{0.1cm} x_* \in \mathbb{R}^p$$

donde los parametros $\hspace{0.12cm}\widehat{\beta}_0 , \widehat{\beta}_1,...,\widehat{\beta}_p\hspace{0.12cm}$ se obtienen resolviendo el **problema de mínimos cuadrados ordinarios**:

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



- Es de especial interés el caso en el que $\hspace{0.12cm}x_*\hspace{0.12cm}$  es una nueva observación de los predictores para la que se desconoce el valor de la respuesta, es decir, $\hspace{0.12cm}x_* = x_{new}$. 

- El algoritmo también permite predecir la respuesta para las observaciones de los predictores con las que el modelo ha sido entrenado, es decir:
    
    $$\widehat{\hspace{0.01cm} y \hspace{0.01cm}}_i  \hspace{0.15cm}=\hspace{0.15cm} \widehat{\beta}_0 +  \sum_{r=1}^p \hspace{0.12cm} \widehat{\beta}_r \cdot x_{ir} \hspace{0.3cm} , \hspace{0.25cm} \forall \hspace{0.1cm} i =1,...,n \\$$
    
    

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


A continuación vamos a ver algoritmos que nos permiten, dada  una muestra de observaciones de de $\hspace{0.1cm} p\hspace{0.1cm}$ predictores, obtener una muestra de $\hspace{0.1cm}q < p\hspace{0.1cm}$ predictores *auxiliares* que capture gran parte de la información presente en los $\hspace{0.1cm}p\hspace{0.1cm}$ predictores originales. La idea es entrenar el modelo de regresion lineal usando la informacion de los $\hspace{0.1cm}q < p\hspace{0.1cm}$ predictores auxiliares en lugar de los $\hspace{0.1cm}p\hspace{0.1cm}$ originales, en aras de reducir el número de parametros a estimar y mejorar así la maldicion de la dimensionalidad. 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 