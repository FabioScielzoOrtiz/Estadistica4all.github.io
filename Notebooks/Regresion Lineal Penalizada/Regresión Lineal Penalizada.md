---
title: 'Regresión lineal penalizada'
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


A continuación vamos a ver algoritmos que nos permiten, dado un modelo de regresión con $\hspace{0.1 cm}p\hspace{0.1 cm}$ predictores, y por tanto $\hspace{0.1 cm}p+1 \hspace{0.1cm}$ parámetros betas, seleccionar aquellos predictores que son más relevantes, y reducir el peso o eliminar aquellos que aportan menos información útil para predecir la respuesta. Esto permite reducir en numero de parámetros de una forma eficiente, reduciendo asi el problema de la dimensionalidad, pero sin perder excesivo poder predictivo, e incluso ganándolo en algunos casos.






<br>

# Introducción a la regresión lineal penalizada



Para usar los métodos de regresión lineal penalizada, la respuesta y los predicadores deben **estandarizarse** para que tengan media 0 y varianza 1.

Estandarizamos las muestras disponibles de los predictores $\hspace{0.1cm} \mathcal{X}_1,...,\mathcal{X}_p\hspace{0.1cm}$ y de la respuesta $\hspace{0.1cm} \mathcal{Y}\hspace{0.1cm}\\[0.3cm]$

$$\widetilde{\hspace{0.1cm} Y} = \dfrac{Y - \overline{y}}{\sigma_y}  \hspace{0.3cm}\Rightarrow \hspace{0.3cm} \widetilde{y}_i = \dfrac{y_i - \overline{y}}{\sigma_{y}} \\[0.5cm]$$

$$\widetilde{X_j} = \dfrac{X_j - \overline{x}_j}{\sigma_{x_j}}  \hspace{0.3cm}\Rightarrow \hspace{0.3cm} \widetilde{x}_{ij} = \dfrac{x_{ij} - \overline{x}_j}{\sigma_{x_j}} \\$$ 

para $\hspace{0.1cm}j \in \lbrace 1,..,p \rbrace$.


Donde:

$$\overline{y} = \dfrac{1}{n} \sum_{i=1}^n y_i \hspace{0.45cm} , \hspace{0.45cm} \overline{x_j} = \dfrac{1}{n} \sum_{i=1}^n x_{ij} \\$$

$$\sigma_{y} = \sqrt{\sum_{i=1}^n (y_{i}- \overline{y})^2}  \hspace{0.45cm} , \hspace{0.45cm} \sigma_{x_j} = \sqrt{\sum_{i=1}^n (x_{ij}- \overline{x_j})^2}$$

<br>
 


El motivo por el que estandarizamos los predictores y la respuesta es que es una forma de hacer que los coeficientes betas sean adimensionales. Como se explicó con mayor detalle en el artículo sobre [regresión linel](http://estadistica4all.com/Articulos/Linear-Regression-new.html) del blog [Estadistica4all](http://estadistica4all.com/), las unidades de medida de los coeficientes betas dependen de las unidades de medida de los predictores y la respuesta. Si en lugar de considerar los predictores y la respuesta originales consideramos sus verisones estandarizadas, que son adimensionales, entoces los coeficientes betas también serán adimensionel, y con ello las estimaciones de estos coeficientes.

Esto es relevante porque en regresion lineal clásica, sin escalar predictores ni respuesta, si teniamos que $\hspace{0.1cm}\widehat{\beta}_r > \widehat{\beta}_j\hspace{0.1cm}$ esto no podia interpretarse como que el predictor $\hspace{0.1cm}\mathcal{X}_r\hspace{0.1cm}$ era mas relevante para explicar la respuesta que el predictor $\hspace{0.1cm}\mathcal{X}_j\hspace{0.1cm}$, puesto que los coeficientes estimados no son directamente comparables al no medirse en las mismas unidades, salvo que los predictores en cuestion se midan en las mismas unidades. 
En cambio, si los predictores y la respuesta están estandarizados, es interpretación si que es valida, puesto que los betas estimados son adimensionales, y por ello directamente comparables.

Ahora betas estimados cercanos a cer implican poca relevancia del predictor asociado coeficiente, para explicar o predecir la respuesta. Y dados dos coeficientes distintos, si uno es mayor que otro, el predictor asociado al mayor es mas relevante para explicar o predecir la respuesta que el predictor asociado al menor coeficiente.




<br>

# Regresión lineal Ridge

El algoritmo de regresión lineal Ridge es básicamente el algoritmo de regresión lineal de minimos cuadrados ordinarios, con la diferencia de que la respuesta y los predictores están estandarizados y la estimacion de los coeficientes betas se hace resolviendo un problema de optimizacion similar al de minimos cuadrados ordinarios, pero diferente, llamado **problema Ridge**:

<br>

Partimos el modelo de regresion lineal clasico, que fue detalaldo anteriormente, solo que considerando las versiones **estandarizadas** de los predictores y de la respuesta.



Como ya se comentó anteriormente, la predicción de la variable respuesta para un vector cualquiera de observaciones   de los predictores **estandarizados** $\hspace{0.1cm}\widetilde{x}_{*} \in \mathbb{R}^{p}\hspace{0.1cm}$, según el algoritmo de regresión lineal, es la siguiente: $\\[0.4cm]$



$$\widehat{\widetilde{y}}_*  \hspace{0.15cm}=\hspace{0.15cm} \widehat{\beta}_0 +  \sum_{r=1}^p \hspace{0.12cm} \widehat{\beta}_r \cdot \widetilde{x}_{*r} \hspace{0.3cm} , \hspace{0.25cm} \forall \hspace{0.1cm} \widetilde{x}_* \in \mathbb{R}^p$$

donde los parametros $\hspace{0.12cm}\widehat{\beta}_0 , \widehat{\beta}_1,...,\widehat{\beta}_p\hspace{0.12cm}$ se obtienen resolviendo el **problema de mínimos cuadrados ordinarios**:

$$\widehat{\beta} \hspace{0.15cm}=\hspace{0.15cm} \left( \widehat{\beta}_0 , \widehat{\beta}_1,...,\widehat{\beta}_p \right)  \hspace{0.2cm} = \hspace{0.2cm} arg \hspace{0.2cm} \underset{ \beta_0 , \beta_1,...,\beta_p}{Min} \hspace{0.2cm} \sum_{i=1}^n  \hspace{0.12cm} \left(  \widetilde{y}_i - \left( \hspace{0.12cm} \beta_0 + \sum_{r=1}^p \hspace{0.1 cm} \beta_r \cdot \widetilde{x}_{ir} \hspace{0.12cm} \right) \right)^2 \\[1.5cm]
\hspace{4.6cm} \text{sujeto a:}  \hspace{0.35cm}  \beta_0 , \beta_1,...,\beta_p \in \mathbb{R}$$


Notese que la única diferencia es que ahora los predictores y la respuesta están **estandarizados**.
 
 

<br>

Existe una solución cerrada para este problema de optimización, y se puede demostrar que es la siguiente:


$$\widehat{\beta}\hspace{0.1cm}=\hspace{0.1cm}\left( \hspace{0.05cm} \widetilde{X}\hspace{0.01cm}^t \cdot \widetilde{X} \hspace{0.05cm} \right)^{-1} \cdot \widetilde{X}\hspace{0.01cm}^t \cdot \widetilde{\hspace{0.1cm} Y}$$

donde: 

$$\hspace{0.1cm} \widetilde{X} \hspace{0.1cm}=\hspace{0.1cm} [\hspace{0.05cm}\mathbb{1} , \widetilde{X}_1,...,\widetilde{X}_p \hspace{0.05cm}]$$



No entraremos aquí en los detalles matemáticos sobre como se obtiene esta solución. Lo reservamos para futuros artículos sobre métodos de optimización aplicados a la ciencia de datos.


<br>


Hasta ahora no hay nada nuevo. Lo anterior es el algoritmo de regresión lineal clásico, que fue ya había sido descrito, pero aplicado con los predictores y la respuesta **estandarizados**.

Notese que los betas estimados en este caso no serán iguales a los que se obtienen cuando se usan los predictores y la respuesta sin escalar. Además las predicciones de la respuesta que obtengamos será para la respuesta **estandarizada**. Si queremos obtener las predicciones para la respuesta original hay que des-estandarizar las predicciones aplicandoles la operación inversa a la de estandarizar, es decir multiplicar por la desviacion tipica y luego sumar la media.



$$\widehat{\hspace{0.01cm} y \hspace{0.01cm}}_* \hspace{0.1cm} = \hspace{0.1cm} \sigma_y \cdot \widehat{\widetilde{y}}_*  + \overline{y}$$

<br>

----

<br>

A continuación vamos a presentar el algoritmo de regresión Ridge, que basicamente es igual, solo que varia el problema de optimización a través del que se estiman los coeficientes betas del modelo.

El algoritmo de regresión lineal Ridge es básicamente el algoritmo de regresión lineal de minimos cuadrados ordinarios, con la diferencia de que la respuesta y los predictores están estandarizados y la estimacion de los coeficientes betas se hace resolviendo un problema de optimizacion similar al de minimos cuadrados ordinarios, pero diferente, llamado **problema Ridge**:

Según el algoritmo de regresión lineal **Ridge**, la predicción de la variable respuesta para un vector cualquiera de observaciones   de los predictores **estandarizados** $\hspace{0.1cm}x_{*} \in \mathbb{R}^{p}\hspace{0.1cm}$, es la siguiente: $\\[0.4cm]$



$$\hat{y}_*  \hspace{0.15cm}=\hspace{0.15cm} \widehat{\beta}_0 +  \sum_{r=1}^p \hspace{0.12cm} \widehat{\beta}_r \cdot x_{*r} \hspace{0.3cm} , \hspace{0.25cm} \forall \hspace{0.1cm} x_* \in \mathbb{R}^p$$

donde los parametros $\hspace{0.12cm}\widehat{\beta}_0 , \widehat{\beta}_1,...,\widehat{\beta}_p\hspace{0.12cm}$ se obtienen resolviendo el **problema Ridge**: $\\[0.4cm]$

$$\widehat{\beta} \hspace{0.15cm}=\hspace{0.15cm} \left( \widehat{\beta}_0 , \widehat{\beta}_1,...,\widehat{\beta}_p \right)  \hspace{0.2cm} = \hspace{0.2cm} arg \hspace{0.2cm} \underset{ \beta_0 , \beta_1,...,\beta_p}{Min} \hspace{0.2cm} \sum_{i=1}^n  \hspace{0.12cm} \left(  \widetilde{y}_i - \left( \hspace{0.12cm} \beta_0 + \sum_{r=1}^p \hspace{0.1 cm} \beta_r \cdot \widetilde{x}_{ir} \hspace{0.12cm} \right) \right)^2   \hspace{0.1cm} +  \hspace{0.1cm} \lambda \cdot ||\hspace{0.1cm} \beta \hspace{0.1cm}||_2^2 \\[1.5cm]
\hspace{4.6cm} \text{sujeto a:}  \hspace{0.35cm}  \beta_0 , \beta_1,...,\beta_p \in \mathbb{R} \\  \hspace{7cm} \beta = (\beta_1,...,\beta_p)^t$$


donde: 

- $\lambda \geq 0\hspace{0.2cm}$ es un **parámetro de penalización** $\\[0.7cm]$

- $| | \hspace{0.06cm}\widetilde{\beta\hspace{0.15cm}} \hspace{0.06cm}||^2_2 \hspace{0.1cm} = \hspace{0.1cm} \sum_{j=1}^p \hspace{0.1cm} \beta_j^2\hspace{0.2cm}$ es la **norma Euclidea (al cuadrado)** del vector $\hspace{0.1cm}\beta\hspace{0.1cm}$, la cual es una medida del tamaño del vector $\hspace{0.1cm}\beta\hspace{0.1cm}$.


<br>

Existe una solución cerrada para este problema de optimización, y se puede demostrar que es la siguiente:


$$\widehat{\beta}\hspace{0.1cm}=\hspace{0.1cm} \left( \hspace{0.05cm} \widetilde{X}\hspace{0.01cm}^t \cdot \widetilde{X} + \lambda \cdot \mathbb{I} \hspace{0.05cm} \right)^{-1} \cdot \widetilde{X}\hspace{0.01cm}^t \cdot \widetilde{\hspace{0.02cm}Y}$$


Donde: 

- $\widetilde{X} \hspace{0.1cm}=\hspace{0.1cm} [\hspace{0.05cm}\mathbb{1} , \widetilde{X}_1,...,\widetilde{X}_p \hspace{0.05cm}] \\$ 

- $\mathbb{I} \hspace{0.1cm}$ es la matriz identidad, con las mismas dimensiones que $\hspace{0.1cm}\widetilde{X}$

 
No entraremos aquí en los detalles matemáticos sobre como se obtiene esta solución. Lo reservamos para futuros artículos sobre métodos de optimización aplicados a la ciencia de datos.



<br>

**Observaciones :**

- La expresión $\hspace{0.15cm}\lambda \cdot | | \hspace{0.06cm}\widetilde{\beta\hspace{0.15cm}} \hspace{0.06cm}||^2_2\hspace{0.25cm}$ **penaliza** el tamaño del vector $\hspace{0.15cm}\beta\hspace{0.15cm}$ 

    - Cuanto mayor sea $\hspace{0.15cm}\lambda\hspace{0.15cm}$ mayor es la penalización impuesta al tamaño del vector $\hspace{0.15cm}\beta \hspace{0.15cm}$  en el problema de optimización.$\\[0.7cm]$

- Si $\hspace{0.15cm}\lambda = 0\hspace{0.15cm}$ el problema de optimizacion es el de minimos cuadrados ordinarios (MCO), propio del modelo de regresion lineal ordinario.$\\[0.7cm]$

- Si $\hspace{0.15cm}\lambda\hspace{0.15cm}$ es **muy grande**  la solucion del problema $\hspace{0.15cm}\widehat{\beta}\hspace{0.15cm}$  tendra un **tamaño** (norma Euclidea)  **muy pequeño**, es decir, los coeficientes estimados  $\hspace{0.15cm}\widehat{\beta}_1, \widehat{\beta}_2,..., \widehat{\beta}_p\hspace{0.15cm} \hspace{0.15cm} \approx \hspace{0.15cm} 0\hspace{0.25cm}$ aunque todos serán $\hspace{0.15cm}\neq 0$ $\\[0.7cm]$

- $\lambda \hspace{0.1cm}$ debe ser seleccionado **a priori** de la resolución del problema de optimización Ridge. Es un **hiper-parámetro** del algoritmo de regresión lineal Ridge.




<br>




## Ventajas de la regresion lineal Ridge sobre la regresion lineal de mínimos cuadrados ordinarios
 

- Las predicciones que se obtienen con el algoritmo de regresion lineal por minimos cuadrados ordinarios son insesgadas pero tiene alta varianza, especialmente si $\hspace{0.15cm}p \approx n \hspace{0.15cm}$.  Además si $\hspace{0.15cm}p>n\hspace{0.15cm}$ no se puede estimar o entrenar el algoritmo por mínimos cuadrados ordinarios.$\\[0.7cm]$

-  La regresión lineal Ridge se basa en el equilibrio entre sesgo y varianza. Disminuye sustancialmente la varianza de las predicciones a costa de aumentar un poco su sesgo. Además, incluso si $\hspace{0.15cm}p \approx n \hspace{0.15cm}$ o $\hspace{0.15cm} p>n\hspace{0.15cm}$ , la regresion Ridge puede funcionar bien.$\\[0.7cm]$


- Como conclusión del punto anterio, si $\hspace{0.15cm}\lambda\hspace{0.15cm}$ es seleccionado correctamente, el error cuadratico medio de prediccion  será menor en la regresion Ridge que en la de minimos cuadrados ordinarios, lo que conduce a mejor capacidad predictiva de Ridge sobre minimos cuadrados ordinarios.




<br>



## Seleccion del parametro de penalización

Es un hiper-parametro del algoritmo, por lo que puede aplicarse algún algorimtode a ajuste de hiper-parametros como grid search o random seach.  

Para ver con más detalle teorico este aspecto se recomienda el articulo que tenemos en el blog sobre [ajuste de hiper-parámetros]()



<br>


# Regresión lineal Lasso



La regresión lineal Lasso surgue como un intento de resolver algunas de las problematicas o desventajs que tiene la regresión lineal Ridge.



**Desventajas de la regresión Ridge:** 

El método de regresión Ridge no hace selección de predictores. Es decir, aunque la regresion Ridge puede aproximar los betas estimados a cero, no lleva a ninguno de ellos a ser exactamente cero.

Por tanto, la regresión Ridge siempre generara un modelo de regresion lineal que involucra a todos los predictores considerados inicialmente.


Incrementar $\hspace{0.05cm} \lambda \hspace{0.05cm}$ tenderá a reducir las magnitudes de los coeficientes betas, pero  no dará lugar a la exclusión de ninguno de los predictores.

<br>

El algoritmo de regresión lineal Ridge es básicamente el algoritmo de regresión lineal de minimos cuadrados ordinarios, con la diferencia de que la respuesta y los predictores están estandarizados y la estimacion de los coeficientes betas se hace resolviendo un problema de optimizacion similar al de minimos cuadrados ordinarios, pero diferente, llamado **problema Lasso**:

Según el algoritmo de regresión lineal **Lasso**, la predicción de la variable respuesta para un vector cualquiera de observaciones   de los predictores **estandarizados** $\hspace{0.1cm}x_{*} \in \mathbb{R}^{p}\hspace{0.1cm}$, es la siguiente: $\\[0.4cm]$



$$\hat{y}_*  \hspace{0.15cm}=\hspace{0.15cm} \widehat{\beta}_0 +  \sum_{r=1}^p \hspace{0.12cm} \widehat{\beta}_r \cdot x_{*r} \hspace{0.3cm} , \hspace{0.25cm} \forall \hspace{0.1cm} x_* \in \mathbb{R}^p$$

donde los parametros $\hspace{0.12cm}\widehat{\beta}_0 , \widehat{\beta}_1,...,\widehat{\beta}_p\hspace{0.12cm}$ se obtienen resolviendo el **problema Lasso**: $\\[0.4cm]$

$$\widehat{\beta} \hspace{0.15cm}=\hspace{0.15cm} \left( \widehat{\beta}_0 , \widehat{\beta}_1,...,\widehat{\beta}_p \right)  \hspace{0.2cm} = \hspace{0.2cm} arg \hspace{0.2cm} \underset{ \beta_0 , \beta_1,...,\beta_p}{Min} \hspace{0.2cm} \sum_{i=1}^n  \hspace{0.12cm} \left(  \widetilde{y}_i - \left( \hspace{0.12cm} \beta_0 + \sum_{r=1}^p \hspace{0.1 cm} \beta_r \cdot \widetilde{x}_{ir} \hspace{0.12cm} \right) \right)^2   \hspace{0.1cm} +  \hspace{0.1cm} \lambda \cdot ||\hspace{0.1cm} \beta \hspace{0.1cm}||_1 \\[1.5cm]
\hspace{4.6cm} \text{sujeto a:}  \hspace{0.35cm}  \beta_0 , \beta_1,...,\beta_p \in \mathbb{R} \\  \hspace{7cm} \beta = (\beta_1,...,\beta_p)^t$$


donde: 

- $\lambda \geq 0\hspace{0.2cm}$ es un **parámetro de penalización** $\\[0.7cm]$

- $| | \hspace{0.06cm}\widetilde{\beta\hspace{0.15cm}} \hspace{0.06cm}||_1 \hspace{0.1cm} = \hspace{0.1cm} \sum_{j=1}^p \hspace{0.1cm} |  \beta_j | \hspace{0.2cm}$ es la **norma L1** del vector $\hspace{0.1cm}\beta\hspace{0.1cm}$, la cual es una medida del tamaño del vector $\hspace{0.1cm}\beta\hspace{0.1cm}$.


<br>

No existe una solución cerrada para este problema de optimización. Por tanto es necesario usar métodos numéricos de optimización  para obtener soluciones aproximadas del problema Lasso. No entraremos aquí en detalles sobre este asunto. Lo reservamos para futuros artículos sobre métodos de optimización aplicados a la ciencia de datos.
 




<br>

**Observaciones :**

- La expresión $\hspace{0.15cm}\lambda \cdot | | \hspace{0.06cm}\widetilde{\beta\hspace{0.15cm}} \hspace{0.06cm}||_1\hspace{0.25cm}$ **penaliza** el tamaño del vector $\hspace{0.15cm}\beta\hspace{0.15cm}$ 

    - Cuanto mayor sea $\hspace{0.15cm}\lambda\hspace{0.15cm}$ mayor es la penalización impuesta al tamaño del vector $\hspace{0.15cm}\beta \hspace{0.15cm}$  en el problema de optimización.$\\[0.7cm]$

- Si $\hspace{0.15cm}\lambda = 0\hspace{0.15cm}$ el problema de optimizacion es el de minimos cuadrados ordinarios (MCO), propio del modelo de regresion lineal ordinario.$\\[0.7cm]$

- Si $\hspace{0.15cm}\lambda\hspace{0.15cm}$ es **muy grande**  la solucion del problema $\hspace{0.15cm}\widehat{\beta}\hspace{0.15cm}$  tendra un **tamaño** (norma L1)  **muy pequeño**, es decir, los coeficientes estimados  $\hspace{0.15cm}\widehat{\beta}_1, \widehat{\beta}_2,..., \widehat{\beta}_p\hspace{0.15cm} \hspace{0.15cm} \approx \hspace{0.15cm} 0\hspace{0.25cm}$, **y algunos incluso serán** $\hspace{0.15cm}\neq 0$ $\\[0.7cm]$

- $\lambda \hspace{0.1cm}$ debe ser seleccionado **a priori** de la resolución del problema de optimización Lasso. Es un **hiper-parámetro** del algoritmo de regresión lineal Lasso.
















---------



<br>

El algoritmo de regresión Lasso es básicamente el algoritmo de regresión lineal, pero con la respuesta y  predictores estandarizados, y con  y la estimacion de los coeficientes betas se hace resolviendo un problema de optimizan similar (pero diferente) al de minimos cuadrados ordinarios (MCO) propio de la regresión lineal ordinaria, pero diferente, llamado **problema Lasso**:

<br>

Sea $\hspace{0.15cm}\widetilde{\beta\hspace{0.15cm}}= (\widetilde{\beta_1},\widetilde{\beta_2},...,\widetilde{\beta_p})\in   \mathbb{R}^p \hspace{0.25cm}$ y $\hspace{0.25cm} \widetilde{x_i} = (\widetilde{x_{i1}},\widetilde{x_{i2}},...,\widetilde{x_{ip}})\in  \mathbb{R}^p$

<br>

\begin{gather*}
\hspace{0.15cm}\widehat{\widetilde{\beta\hspace{0.15cm}}}\hspace{0.05cm}^{Lasso} \hspace{0.15cm} =\hspace{0.15cm}  arg \hspace{0.12cm} \underset{\widetilde{\beta\hspace{0.15cm}}}{Min} \hspace{0.2cm}  \biggl\{ \hspace{0.1cm} RSS\left(\hspace{0.12cm}\widetilde{\beta\hspace{0.15cm}}\hspace{0.12cm}\right) \hspace{0.1cm} +\hspace{0.1cm}  \lambda \cdot | | \hspace{0.06cm}\widetilde{\beta\hspace{0.15cm}} \hspace{0.06cm}||_1 \hspace{0.1cm} \biggl\} \hspace{0.2cm} = \hspace{0.2cm} arg \hspace{0.12cm} \underset{\widetilde{\beta\hspace{0.15cm}}}{Min} \hspace{0.2cm} \biggl\{ \hspace{0.1cm} \sum_{i=1}^{n} \hspace{0.1cm}(y_i - \beta_0 - \widetilde{x_i}\hspace{0.1cm}^t \cdot \beta)\hspace{0.02cm}^2 \hspace{0.1cm} + \hspace{0.1cm}  \lambda \cdot | | \hspace{0.06cm}\widetilde{\beta\hspace{0.15cm}} \hspace{0.06cm}||_1  \hspace{0.1cm} \biggl\} \hspace{0.2cm} =  \\[0.8cm]
  = \hspace{0.2cm} arg \hspace{0.12cm} \underset{\widetilde{\beta_1},\widetilde{\beta_2},...,\widetilde{\beta_p}}{Min} \hspace{0.2cm} \biggl\{ \hspace{0.1cm} \sum_{i=1}^{n} \hspace{0.1cm}(y_i - \beta_0 - \widetilde{\beta_1} \cdot \widetilde{x_{i1}} - \dots - \widetilde{\beta_p} \cdot \widetilde{x_{ip}})\hspace{0.02cm}^2  \hspace{0.1cm} + \hspace{0.1cm}  \lambda \cdot | | \hspace{0.06cm}\widetilde{\beta\hspace{0.15cm}} \hspace{0.06cm}||_1 \hspace{0.1cm} \biggl\}
\end{gather*}

<br>

Donde: 

- $\lambda \geq 0\hspace{0.2cm}$ es un **parámetro de penalización** $\\[0.7cm]$

- $| | \hspace{0.06cm}\widetilde{\beta\hspace{0.15cm}} \hspace{0.06cm}||_1 \hspace{0.1cm} = \hspace{0.1cm} \sum_{j=1}^p \hspace{0.1cm} |\hspace{0.1cm} \widetilde{\beta_j}\hspace{0.1cm} |\hspace{0.15cm}$ es la **norma Euclidea** (al cuadrado) del vector $\hspace{0.15cm}\widetilde{\beta\hspace{0.15cm}}\hspace{0.15cm}$, la cual es una medida del tamaño del vector $\hspace{0.15cm}\widetilde{\beta\hspace{0.15cm}}\hspace{0.15cm}$.

<br>

**Observación:**

La unica diferencia entre regresión Ridge y Lasso es que el termino $\hspace{0.15cm}| | \hspace{0.06cm}\widetilde{\beta\hspace{0.15cm}} \hspace{0.06cm}||_2^2\hspace{0.15cm}$ ha sido reemplado por el termino $\hspace{0.15cm}| | \hspace{0.06cm}\widetilde{\beta\hspace{0.15cm}} \hspace{0.06cm}||_1\hspace{0.15cm}$










<br>





<br>

# Error de train, test , sesgo y varianza en Regresion Ridge y Lasso


grafico de lambda vs train error/test error/sesgo/varianza









<br>


# Regresión lineal Elastic Net





555










