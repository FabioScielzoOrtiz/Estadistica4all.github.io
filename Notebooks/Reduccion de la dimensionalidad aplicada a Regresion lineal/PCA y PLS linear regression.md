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

- Se consideran $\hspace{0.1cm} p\hspace{0.1cm}$ predictores $\hspace{0.1cm}\mathcal{X}_1,...,\mathcal{X}_p\hspace{0.1cm}$ y una variable respuesta $\hspace{0.1cm}\mathcal{Y}$ $\\[0.5cm]$




- Se tiene una muestra de observaciones $\hspace{0.1cm}X_r = (x_{1r},...,x_{nr})^t\hspace{0.1cm}$ del predictor $\hspace{0.1cm}\mathcal{X}_r\hspace{0.1cm}$ , para cada $\hspace{0.1cm}r \in \lbrace 1,...,p \rbrace$ $\\[0.5cm]$


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

En este caso vamos a exponer la vía basada en el método de mínimos cuadrados ordinarios:

La predicción de la variable respuesta para un vector cualquiera de observaciones   de los predictores $\hspace{0.1cm}x_{*}=(x_{*1},...,x_{*p}) \in \mathbb{R}^{p}\hspace{0.1cm}$, según el algoritmo de regresión lineal, es la siguiente: $\\[0.4cm]$



$$\widehat{\hspace{0.01cm} y \hspace{0.01cm}}_*  \hspace{0.15cm}=\hspace{0.15cm} \widehat{\beta}_0 +  \sum_{r=1}^p \hspace{0.12cm} \widehat{\beta}_r \cdot x_{*r} \hspace{0.15cm}=\hspace{0.15cm} \widehat{\beta}_0 \hspace{0.1cm}  +   \hspace{0.1cm}  x_{*}^t \cdot \widehat{\beta} \hspace{0.3cm} , \hspace{0.25cm} \forall \hspace{0.1cm} x_* \in \mathbb{R}^p$$

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


A continuación vamos a ver algoritmos que nos permiten, dada  una muestra de observaciones de de $\hspace{0.1cm} p\hspace{0.1cm}$ predictores, obtener una muestra de $\hspace{0.1cm}q < p\hspace{0.1cm}$ predictores *auxiliares* que capture gran parte de la información presente en los $\hspace{0.1cm}p\hspace{0.1cm}$ predictores originales. La idea es entrenar el modelo de regresion lineal usando la informacion de los $\hspace{0.1cm}q < p\hspace{0.1cm}$ predictores auxiliares en lugar de los $\hspace{0.1cm}p\hspace{0.1cm}$ originales, en aras de reducir el número de parametros a estimar y mejorar así la maldición de la dimensionalidad. 
 
 
Vamos aver dos métodos a través de los cuales se puede llevar a cabo esta reduccion de la dimensionalidad y posterior aplicación al modelo de regresión lineal: Regresión lineal PCA y regresión lineal  PLS (regresión lineal por minimos cuadrados parciales). 

 
<br>

# Introducción a los métodos de reducción de la dimensión en regresión lineal




Para usar los métodos que describiremos en las próximas secciones el primer paso es considerar las versiones **estandarizadas** de los predictores y de la respuesta.


Las versiones estandarizadas de los predictores $\hspace{0.1cm} \mathcal{X}_1,...,\mathcal{X}_p\hspace{0.1cm}$ y de la respuesta $\hspace{0.1cm} \mathcal{Y}\hspace{0.1cm}$ se obtienen  aplicando la operación de estandarización a los predictores y  la respuesta originales: $\\[0.5cm]$

$$\widetilde{\hspace{0.01cm}\mathcal{\hspace{0.02cm}Y\hspace{0.1cm}}} = \dfrac{\mathcal{Y} - E[\hspace{0.1cm}\mathcal{Y}\hspace{0.1cm}]}{\sqrt{Var(\hspace{0.1cm}\mathcal{Y}\hspace{0.1cm})}}  \\[0.5cm]$$

$$\widetilde{\hspace{0.02cm} \mathcal{X}}_j = \dfrac{\mathcal{X}_j - E[\hspace{0.1cm}\mathcal{X}_j\hspace{0.1cm}]}{\sqrt{Var(\hspace{0.1cm}\mathcal{X}_j\hspace{0.1cm})}}  \\[0.5cm]$$

  

para $\hspace{0.1cm} j \in \lbrace 1,..,p \rbrace\\$


<br>

---

<br>


Las muestras de los predictores y de la respuesta estandarizados $\hspace{0.1cm} \widetilde{\hspace{0.01cm}\mathcal{X}}_1,...,\widetilde{\hspace{0.01cm}\mathcal{X}}_p\hspace{0.1cm}$ y de la respuesta $\hspace{0.1cm} \widetilde{\hspace{0.01cm}\mathcal{\hspace{0.02cm}Y\hspace{0.1cm}}}\hspace{0.1cm}$ se obtienen de manera análoga, aplicando la operación de estandarización a las muestras disponibles de los predictores y de la respuesta originales: $\\[0.5cm]$

$$\widetilde{\hspace{0.1cm} Y} = \dfrac{Y - \overline{y}}{\sigma_y}  \hspace{0.3cm}\Rightarrow \hspace{0.3cm} \widetilde{y}_i = \dfrac{y_i - \overline{y}}{\sigma_{y}} \\[0.5cm]$$

$$\widetilde{X_j} = \dfrac{X_j - \overline{x}_j}{\sigma_{x_j}}  \hspace{0.3cm}\Rightarrow \hspace{0.3cm} \widetilde{x}_{ij} = \dfrac{x_{ij} - \overline{x}_j}{\sigma_{x_j}} \\$$ 

para $\hspace{0.1cm} j \in \lbrace 1,..,p \rbrace$.


Donde:

$$\overline{y} = \dfrac{1}{n} \sum_{i=1}^n y_i \hspace{0.45cm} , \hspace{0.45cm} \overline{x_j} = \dfrac{1}{n} \sum_{i=1}^n x_{ij} \\$$

$$\sigma_{y} = \sqrt{\sum_{i=1}^n (y_{i}- \overline{y})^2}  \hspace{0.45cm} , \hspace{0.45cm} \sigma_{x_j} = \sqrt{\sum_{i=1}^n (x_{ij}- \overline{x_j})^2}$$

<br>

---

<br>
 

Lo siguiente es obtener $\hspace{0.1cm} q < p\hspace{0.1cm}$ predictores auxiliares que capturen buena parte de la información contenida en las muestras de los $\hspace{0.1cm}p\hspace{0.1cm}$ predictores originales estandarizados .

Estos predictores auxiliares se obtendrán de la siguiente forma:

$$\mathcal{Z}_j \hspace{0.1cm}=\hspace{0.1cm} c_{j1} \cdot  \widetilde{\hspace{0.01cm}\mathcal{X}}_1 \hspace{0.1cm}+ \dots +\hspace{0.1cm} c_{jp} \cdot  \widetilde{\hspace{0.01cm}\mathcal{X}}_p \hspace{0.35cm} , \hspace{0.35cm} \forall \hspace{0.1cm} j \in \lbrace 1,..., q \rbrace \\$$

donde $\hspace{0.1cm}c_{j1},...,c_{jp}\hspace{0.1cm}$ son los pesos que en el predictor auxiliar $\hspace{0.1cm}\mathcal{Z}_j\hspace{0.1cm}$ tienen cada uno de los $\hspace{0.1cm}p\hspace{0.1cm}$ predictores originales, para $\hspace{0.1cm}j=1,...,p$ $\\[0.4cm]$


Las muestras de los predictores auxiliares se obtiene directamente de las muestras de los originales:

$$Z_j \hspace{0.1cm}=\hspace{0.1cm} (z_{1j},...,z_{nj}) \hspace{0.1cm}=\hspace{0.1cm} c_{j1} \cdot  \widetilde{X}_1 \hspace{0.1cm}+ \dots +\hspace{0.1cm} c_{jp} \cdot  \widetilde{X}_p \hspace{0.35cm} , \hspace{0.35cm} \forall \hspace{0.1cm} j \in \lbrace 1,..., q \rbrace \\$$





La idea es estimar por minimos cuadrados ordinarios un modelo de regresión lineal con los   predictores auxiliares $\mathcal{Z}_1,...,\mathcal{Z}_q$:

$$\widetilde{\hspace{0.01cm}\mathcal{\hspace{0.02cm}Y\hspace{0.1cm}}} \hspace{0.1cm}=\hspace{0.1cm} \beta_0 \hspace{0.1cm} + \hspace{0.1cm} \sum_{j=1}^q \hspace{0.1cm} \beta_j \cdot z_{ij} \hspace{0.1cm}+\hspace{0.1cm} \varepsilon_i$$


Si se aplica el algoritmo de regresión lineal por minimos cuadrados con los **predictores auxiliares** tenemos que la predicción de la variable respuesta para un vector cualquiera de observaciones  de los **predictores auxiliares** $\hspace{0.1cm}z_{*} \in \mathbb{R}^{q}\hspace{0.1cm}$ es la siguiente: $\\[0.4cm]$

$$\widehat{\hspace{0.01cm} y \hspace{0.01cm}}_*  \hspace{0.15cm}=\hspace{0.15cm} \widehat{\beta}_0 +  \sum_{j=1}^q \hspace{0.12cm} \widehat{\beta}_j \cdot x_{*j} \hspace{0.3cm} , \hspace{0.25cm} \forall \hspace{0.1cm} z_* \in \mathbb{R}^q$$

donde los parámetros $\hspace{0.12cm}\widehat{\beta}_0 , \widehat{\beta}_1,...,\widehat{\beta}_q\hspace{0.12cm}$ se obtienen resolviendo el **problema de mínimos cuadrados ordinarios**:

$$\widehat{\beta} \hspace{0.15cm}=\hspace{0.15cm} \left( \widehat{\beta}_0 , \widehat{\beta}_1,...,\widehat{\beta}_q \right)  \hspace{0.2cm} = \hspace{0.2cm} arg \hspace{0.2cm} \underset{ \beta_0 , \beta_1,...,\beta_q}{Min} \hspace{0.2cm} \sum_{i=1}^n  \hspace{0.12cm} \left(  y_i - \left( \hspace{0.12cm} \beta_0 + \sum_{j=1}^q \hspace{0.1 cm} \beta_j \cdot x_{ij} \hspace{0.12cm} \right) \right)^2 \\[1.5cm]
\hspace{4.6cm} \text{sujeto a:}  \hspace{0.35cm}  \beta_0 , \beta_1,...,\beta_q \in \mathbb{R}$$

 

<br>

Existe una solución cerrada para este problema de optimización, y se puede demostrar que es la siguiente:


$$\widehat{\beta}\hspace{0.1cm}=\hspace{0.1cm}(Z^t \cdot Z)^{-1} \cdot Z^t \cdot Y$$

donde: 

$$\hspace{0.1cm} Z \hspace{0.1cm}=\hspace{0.1cm} [\hspace{0.05cm}\mathbb{1} , Z_1,...,Z_p \hspace{0.05cm}]$$





<br>


**Observaciones:**

- Si se determina adecuadamente la nueva dimensión $\hspace{0.1cm}q\hspace{0.1cm}$ y los pesos $\hspace{0.1cm}c_{j1},...,c_{jp}$, el modelo de regresión que usa los predictores auxiliares puede predecir mejor que el modelo de regresión que incorpora los predictores originales.


- Las estimaciones de los parametros en el modelo de regresión con los predictores auxiliares será diferente a la obtenida con los predictores originales, lo que conduce a diferencia en las predicciones realizadas por cada modelo.



<br>

---

<br>


Vamos a ver dos métodos para construir los predictores auxiliares. Siendo más concretos, dos métodos que nos permitiran definir los pesos $\hspace{0.1cm}\hspace{0.1cm}c_{j1},...,c_{jp}\hspace{0.1cm}$ para $\hspace{0.1cm}j=1,...,q$.



Estos métodos son regresión lineal con PCA (componentes principales) y regresión lineal PLS (por mínimos cuadrados parciales). 


<br>


# Regresión lineal PCA
 
El algoritmo PCA define los pesos de los predictores auxiliares (componentes principales) del siguiente modo: $\\[0.6cm]$


El **primer** predictor auxiliar se define como sigue: $\\[0.4cm]$

$$\mathcal{Z}_1 \hspace{0.15cm}=\hspace{0.15cm}  c_1^* \cdot \widetilde{\hspace{0.01cm} \mathcal{X}}  \hspace{0.15cm}=\hspace{0.15cm} c_{11}^* \cdot  \widetilde{\hspace{0.01cm}\mathcal{X}}_1 \hspace{0.1cm}+ \dots +\hspace{0.1cm} c_{1p}^* \cdot  \widetilde{\hspace{0.01cm}\mathcal{X}}_p  \\[0.4cm]$$

donde $\hspace{0.15cm} c_1^* = (c_{11}^*,...,c_{1p}^*)\in \mathbb{R}^p\hspace{0.2cm}$ y $\hspace{0.2cm}\widetilde{\hspace{0.01cm}\mathcal{X}} \hspace{0.1cm}=\hspace{0.1cm} [\hspace{0.1cm} \widetilde{\hspace{0.01cm}\mathcal{X}}_1,...,\widetilde{\hspace{0.01cm}\mathcal{X}}_q \hspace{0.1cm}]\\[0.4cm]$


Los pesos se obtienen como sigue: $\\[0.4cm]$

$$c_1^* = (c_{11}^*,...,c_{1p}^*) \hspace{0.2cm}=\hspace{0.2cm} arg\hspace{0.25cm} \underset{c_1 \in \mathbb{R}^p }{Max} \hspace{0.25cm} \sigma^2 \left(\hspace{0.1cm} Z_1 \hspace{0.1cm}\right) \hspace{0.2cm}=\hspace{0.2cm} arg\hspace{0.25cm} \underset{c_1 \in \mathbb{R}^p }{Max} \hspace{0.25cm} \sigma^2 \left(\hspace{0.1cm} c_1\cdot \widetilde{X} \hspace{0.1cm}\right)   \\[0.7cm]
\hspace{5.5cm} \text{sujeto a:} \hspace{0.5cm}   ||c_1|| = 1
\\[0.6cm]$$


 

siendo $\hspace{0.15cm}\widetilde{X} \hspace{0.1cm}=\hspace{0.1cm} [\hspace{0.1cm} \widetilde{X}_1,...,\widetilde{X}_q \hspace{0.1cm}]\hspace{0.2cm}$  , $\hspace{0.2cm}||c_1||= \sqrt{ \sum_{j=1}^p c_{1j}^2 \hspace{0.25cm}}\hspace{0.25cm}$ la norma Euclidea del vector $\hspace{0.15cm}c_1\hspace{0.2cm}$  y $\hspace{0.2cm}\sigma^2 \left(\hspace{0.1cm} Z_1 \hspace{0.1cm}\right) = \frac{1}{n} \cdot \sum_{i=1}^{n} ( \hspace{0.05cm} z_{i1} - \overline{Z}_1 \hspace{0.05cm} )^2\hspace{0.15cm}$  la varianza de la muestra $\hspace{0.15cm}Z_1$
 
 
 
Como la respuesta y los predictores están estandarizados, existe una solución cerrada a este problema de optimización, que es la siguiente:

$c_1^*\hspace{0.1cm}$ es el el **autovector** asociado al **mayor autovalor** de de la matriz de correlaciones de $\hspace{0.1cm}\widetilde{X}\hspace{0.1cm}$, es decir, de $\hspace{0.1cm}R_{\widetilde{X}}$
 
<br>
 
--- 

<br> 
 
El **segundo** predictor auxiliar se define como sigue: $\\[0.4cm]$

$$\mathcal{Z}_2 \hspace{0.15cm}=\hspace{0.15cm}  c_2^* \cdot \widetilde{\hspace{0.01cm} \mathcal{X}}  \hspace{0.15cm}=\hspace{0.15cm} c_{21}^* \cdot  \widetilde{\hspace{0.01cm}\mathcal{X}}_1 \hspace{0.1cm}+ \dots +\hspace{0.1cm} c_{2p}^* \cdot  \widetilde{\hspace{0.01cm}\mathcal{X}}_p  \\[0.4cm]$$

donde $\hspace{0.15cm} c_2^* = (c_{21}^*,...,c_{2p}^*)\in \mathbb{R}^p\hspace{0.2cm}$ y $\hspace{0.2cm}\widetilde{\hspace{0.01cm}\mathcal{X}} \hspace{0.1cm}=\hspace{0.1cm} [\hspace{0.1cm} \widetilde{\hspace{0.01cm}\mathcal{X}}_1,...,\widetilde{\hspace{0.01cm}\mathcal{X}}_q \hspace{0.1cm}]\\[0.4cm]$


Los pesos se obtienen como sigue: $\\[0.4cm]$

$$c_2^* = (c_{21}^*,...,c_{2p}^*) \hspace{0.2cm}=\hspace{0.2cm} arg\hspace{0.25cm} \underset{c_2 \in \mathbb{R}^p }{Max} \hspace{0.25cm} \sigma^2 \left(\hspace{0.1cm} Z_2 \hspace{0.1cm}\right)  \hspace{0.15 cm}=\hspace{0.15 cm} \sigma^2 \left(\hspace{0.1 cm}  c_2\cdot \widetilde{X} \hspace{0.1cm} \right) \\[0.7cm]
\hspace{5.5cm} \text{sujeto a:}   \hspace{0.7cm}   ||c_2|| = 1 \\[0.3cm]
\hspace{10cm}  Cov(Z_1,Z_2)=0 
\\[0.8cm]$$


 

siendo $\hspace{0.15cm}\widetilde{X} \hspace{0.1cm}=\hspace{0.1cm} [\hspace{0.1cm} \widetilde{X}_1,...,\widetilde{X}_q \hspace{0.1cm}]\hspace{0.2cm}$  , $\hspace{0.2cm}||c_2||= \sqrt{ \sum_{j=1}^p c_{2j}^2 \hspace{0.25cm}}\hspace{0.25cm}$ la norma Euclidea del vector $\hspace{0.15cm}c_2\hspace{0.2cm}$  y $\hspace{0.2cm}\sigma^2 \left(\hspace{0.1cm} Z_2 \hspace{0.1cm}\right) = \frac{1}{n} \cdot \sum_{i=1}^{n} ( \hspace{0.05cm} z_{i2} - \overline{Z}_2 \hspace{0.05cm} )^2\hspace{0.15cm}$  la varianza de la muestra $\hspace{0.15cm}Z_2$
 
 
 
Como la respuesta y los predictores están estandarizados, existe una solución cerrada a este problema de optimización, que es la siguiente:

$c_2^*\hspace{0.1cm}$ es el  **autovector** asociado al **segundo mayor** **autovalor** de  la matriz de correlaciones de $\hspace{0.1cm}\widetilde{X}\hspace{0.1cm}$, es decir, de $\hspace{0.1cm}R_{\widetilde{X}}$
 
 
<br>
 
--- 

<br> 


A partir de aqui se sigue la misma dinamica para   $\hspace{0.15cm}j \in \lbrace 3,4,...,q \rbrace$ 
 
El  $\hspace{0.1cm}j$-esimo predictor auxiliar se define como sigue: $\\[0.4cm]$

$$\mathcal{Z}_j \hspace{0.15cm}=\hspace{0.15cm}  c_j^* \cdot \widetilde{\hspace{0.01cm} \mathcal{X}}  \hspace{0.15cm}=\hspace{0.15cm} c_{j1}^* \cdot  \widetilde{\hspace{0.01cm}\mathcal{X}}_1 \hspace{0.1cm}+ \dots +\hspace{0.1cm} c_{jp}^* \cdot  \widetilde{\hspace{0.01cm}\mathcal{X}}_p  \\[0.4cm]$$

donde $\hspace{0.15cm} c_j^* = (c_{j1}^*,...,c_{jp}^*)\in \mathbb{R}^p\hspace{0.2cm}$ y $\hspace{0.2cm}\widetilde{\hspace{0.01cm}\mathcal{X}} \hspace{0.1cm}=\hspace{0.1cm} [\hspace{0.1cm} \widetilde{\hspace{0.01cm}\mathcal{X}}_1,...,\widetilde{\hspace{0.01cm}\mathcal{X}}_q \hspace{0.1cm}]\\[0.4cm]$


Los pesos se obtienen como sigue: $\\[0.4cm]$

$$c_j^* = (c_{j1}^*,...,c_{jp}^*) \hspace{0.2cm}=\hspace{0.2cm} arg\hspace{0.25cm} \underset{c_j \in \mathbb{R}^p }{Max} \hspace{0.25cm} \sigma^2 \left(\hspace{0.1cm} Z_j \hspace{0.1cm}\right)  \hspace{0.15 cm}=\hspace{0.15 cm} \sigma^2 \left(\hspace{0.1 cm}  c_j\cdot \widetilde{X} \hspace{0.1cm} \right) \\[0.7cm]
\hspace{5.5cm} \text{sujeto a:} \hspace{0.5cm}   ||c_j|| = 1 \\[0.3cm]
\hspace{11.6cm}  Cov(Z_1,Z_2,...,Z_j)=0 
\\[0.6cm]$$


 

siendo $\hspace{0.15cm}\widetilde{X} \hspace{0.1cm}=\hspace{0.1cm} [\hspace{0.1cm} \widetilde{X}_1,...,\widetilde{X}_q \hspace{0.1cm}]\hspace{0.2cm}$  , $\hspace{0.2cm}||c_j||= \sqrt{ \sum_{r=1}^p c_{jr}^2 \hspace{0.25cm}}\hspace{0.25cm}$ la norma Euclidea del vector $\hspace{0.15cm}c_j\hspace{0.2cm}$  y $\hspace{0.2cm}\sigma^2 \left(\hspace{0.1cm} Z_j \hspace{0.1cm}\right) = \frac{1}{n} \cdot \sum_{i=1}^{n} ( \hspace{0.05cm} z_{ij} - \overline{Z}_j \hspace{0.05cm} )^2\hspace{0.15cm}$  la varianza de la muestra $\hspace{0.15cm}Z_j$
 
 
 
Como la respuesta y los predictores están estandarizados, existe una solución cerrada a este problema de optimización, que es la siguiente:

$c_j^*\hspace{0.1cm}$ es el  **autovector** asociado al **$\hspace{0.1cm} j$-esimo mayor** **autovalor** de  la matriz de correlaciones de $\hspace{0.1cm}\widetilde{X}\hspace{0.1cm}$, es decir, de $\hspace{0.1cm}R_{\widetilde{X}}$
 
 
 
<br>



**¿Cuantos predictores auxiliares (componentes principales) considerar?**

- Se pueden seguir diferentes criterios para seleccionar el número $\hspace{0.1cm} q\leq p \hspace{0.1cm}$ de predictores auxiliares. Uno de los más comunes es el métdodo del porcentaje de variación explicada de los predictores originales. Se suele seleccionar un $\hspace{0.1cm}q\hspace{0.1cm}$ tal que el porcentaje de la varianza de los predictores originales que es explicada por los predictores auxiliares es al menos del 90 $\%$ .


- Se puede considerar $\hspace{0.1cm}q\hspace{0.1cm}$ como un hiper-parametro del algoritmo de regresion lineal con PCA. Por tanto puede determinarse mediante un algoritmo de ajuste de hiper-parametros, como grid search o random search.



<br>

**Desventajas de regresión lineal con PCA**

- Al construir los predictores auxiliares (componentes principales) no se considera en ningun momento información sobre la variable respuesta.
 




<br>


# Regresión PLS
 
 
Este algoritmo tiene la misma filosofia que   PCA, pero supera la principal desventaja de este último, ya que al construir los predictores auxiliares si que tiene en cuenta a la variable respuesta.

El algoritmo PLS define los pesos de los predictores auxiliares   del siguiente modo: $\\[0.6cm]$
 
El **primer** predictor auxiliar se define como sigue: $\\[0.4cm]$

$$\mathcal{Z}_1 \hspace{0.15cm}=\hspace{0.15cm}  c_1^* \cdot \widetilde{\hspace{0.01cm} \mathcal{X}}  \hspace{0.15cm}=\hspace{0.15cm} c_{11}^* \cdot  \widetilde{\hspace{0.01cm}\mathcal{X}}_1 \hspace{0.1cm}+ \dots +\hspace{0.1cm} c_{1p}^* \cdot  \widetilde{\hspace{0.01cm}\mathcal{X}}_p  \\[0.4cm]$$

donde $\hspace{0.15cm} c_1^* = (c_{11}^*,...,c_{1p}^*)$

Los pesos se obtienen como sigue: $\\[0.4cm]$

Dado el modelo de regresión lineal estimado que incluye al predictor $\widetilde{\mathcal{X}}_j$ y la respuesta $\widetilde{\mathcal{Y}}$:

$$\hat{\tilde{y}}_i = \widehat{\beta}_0 + \widehat{\beta}_j \cdot \tilde{x}_{ij}$$

entonces, se define:

$$c_{1j}^* = \widehat{\beta}_j \\[0.4cm]$$

 
 
 
Y como los predictores y la respuesta han sido estandarizados se cumple lo siguiente:


$$c_{1j}^* = \widehat{\beta}_r = Corr(\widetilde{Y}, \widetilde{X}_j) \hspace{0.3cm}  ,  \hspace{0.3cm}\forall \hspace{0.1 cm} r \in \lbrace 1,...,p \rbrace \\[0.4cm]$$



 Por tanto, $\hspace{0.1 cm}\mathcal{Z}_1 = c_1^* \cdot \widetilde{\hspace{0.01cm} \mathcal{X}}\hspace{0.1 cm}$ pone mayor peso en los predictores  con mayor correlación muestral con la variable respuesta.


<br>

---
 
<br>


El **segundo** predictor auxiliar se define como sigue: $\\[0.4cm]$

$$\mathcal{Z}_2 \hspace{0.15cm}=\hspace{0.15cm}  c_2^* \cdot \widetilde{\hspace{0.01cm} \mathcal{X}}  \hspace{0.15cm}=\hspace{0.15cm} c_{21}^* \cdot  \widetilde{\hspace{0.01cm}\mathcal{X}}_1 \hspace{0.1cm}+ \dots +\hspace{0.1cm} c_{2p}^* \cdot  \widetilde{\hspace{0.01cm}\mathcal{X}}_p  \\[0.4cm]$$

donde $\hspace{0.15cm} c_2^* = (c_{21}^*,...,c_{2p}^*)$

Los pesos se obtienen como sigue: $\\[0.4cm]$



Dado el modelo de regresión lineal estimado que incluye al predictor $\hspace{0.1cm}\mathcal{Z}_2\hspace{0.1cm}$ y la respuesta $\hspace{0.1cm}\widetilde{\mathcal{Y}}\hspace{0.1cm}$:

$$\hat{\tilde{y}}_i = \widehat{\beta}_0 + \widehat{\beta}_1 \cdot \tilde{z}_{i1}$$

Se calculan el vector de residuos del modelo anterior:

$$\widehat{\varepsilon} = \left(\hspace{0.1cm} \widehat{\varepsilon}_i = \tilde{y}_i - \hat{\tilde{y}}_i   \hspace{0.2cm} / \hspace{0.2cm} i \in \lbrace 1,...,n \rbrace \hspace{0.1cm} \right)^t$$

entonces, se define:

$$c_{2j}^* = Corr( \widehat{\varepsilon} , \widetilde{X}_r )   \hspace{0.3cm}  ,  \hspace{0.3cm}\forall \hspace{0.1 cm} r \in \lbrace 1,...,p \rbrace \\[0.4cm]$$

 
  
 
<br>

---
 
<br>


El **tercer** predictor auxiliar se define como sigue: $\\[0.4cm]$

$$\mathcal{Z}_3 \hspace{0.15cm}=\hspace{0.15cm}  c_3^* \cdot \widetilde{\hspace{0.01cm} \mathcal{X}}  \hspace{0.15cm}=\hspace{0.15cm} c_{31}^* \cdot  \widetilde{\hspace{0.01cm}\mathcal{X}}_1 \hspace{0.1cm}+ \dots +\hspace{0.1cm} c_{3p}^* \cdot  \widetilde{\hspace{0.01cm}\mathcal{X}}_p  \\[0.4cm]$$

donde $\hspace{0.15cm} c_3^* = (c_{31}^*,...,c_{3p}^*)$

Los pesos se obtienen como sigue: $\\[0.4cm]$



Dado el modelo de regresión lineal estimado que incluye al predictor $\hspace{0.1cm}\mathcal{Z}_3\hspace{0.1cm}$ y la respuesta $\hspace{0.1cm}\widetilde{\mathcal{Y}}\hspace{0.1cm}$:

$$\hat{\tilde{y}}_i = \widehat{\beta}_0 + \widehat{\beta}_1 \cdot \tilde{z}_{i1} + \widehat{\beta}_2 \cdot \tilde{z}_{i2}$$

Se calculan el vector de residuos del modelo anterior:

$$\widehat{\varepsilon} = \left(\hspace{0.1cm} \widehat{\varepsilon}_i = \tilde{y}_i - \hat{\tilde{y}}_i   \hspace{0.2cm} / \hspace{0.2cm} i \in \lbrace 1,...,n \rbrace \hspace{0.1cm} \right)^t$$

entonces, se define:

$$c_{2j}^* = Corr( \widehat{\varepsilon} , \widetilde{X}_r )  \hspace{0.3cm}  ,  \hspace{0.3cm}\forall \hspace{0.1 cm} r \in \lbrace 1,...,p \rbrace \\[0.4cm]$$

  
 
<br>

---
 
<br>

Para $\hspace{0.15cm} j\in \lbrace 4,...,q \rbrace$

El **$j$-esimo** predictor auxiliar se define como sigue: $\\[0.4cm]$

$$\mathcal{Z}_j \hspace{0.15cm}=\hspace{0.15cm}  c_j^* \cdot \widetilde{\hspace{0.01cm} \mathcal{X}}  \hspace{0.15cm}=\hspace{0.15cm} c_{j1}^* \cdot  \widetilde{\hspace{0.01cm}\mathcal{X}}_1 \hspace{0.1cm}+ \dots +\hspace{0.1cm} c_{jp}^* \cdot  \widetilde{\hspace{0.01cm}\mathcal{X}}_p  \\[0.4cm]$$

donde $\hspace{0.15cm} c_j^* = (c_{j1}^*,...,c_{jp}^*)$

Los pesos se obtienen como sigue: $\\[0.4cm]$



Dado el modelo de regresión lineal estimado que incluye al predictor $\hspace{0.1cm}\mathcal{Z}_j\hspace{0.1cm}$ y la respuesta $\hspace{0.1cm}\widetilde{\mathcal{Y}}\hspace{0.1cm}$:

$$\hat{\tilde{y}}_i = \widehat{\beta}_0 + \widehat{\beta}_1 \cdot \tilde{z}_{i1} + \widehat{\beta}_2 \cdot \tilde{z}_{i2} + \dots + \widehat{\beta}_j \cdot \tilde{z}_{ij}$$

Se calculan el vector de residuos del modelo anterior:

$$\widehat{\varepsilon} = \left(\hspace{0.1cm} \widehat{\varepsilon}_i = \tilde{y}_i - \hat{\tilde{y}}_i   \hspace{0.2cm} / \hspace{0.2cm} i \in \lbrace 1,...,n \rbrace \hspace{0.1cm} \right)^t$$

entonces, se define:

$$c_{jr}^* = Corr( \widehat{\varepsilon} , \widetilde{X}_r )  \hspace{0.3cm}  ,  \hspace{0.3cm}\forall \hspace{0.1 cm} r \in \lbrace 1,...,p \rbrace \\[0.4cm]$$

   
 
 
 <br>

**¿Cuantos predictores auxiliares  considerar?**

 

- Se puede considerar $\hspace{0.1cm}q\hspace{0.1cm}$ como un hiper-parametro del algoritmo de regresion lineal con PLS. Por tanto puede determinarse mediante un algoritmo de ajuste de hiper-parametros, como grid search o random search.

 
 
 
 
 
 
 
 
 
 
 
 
 
 
 