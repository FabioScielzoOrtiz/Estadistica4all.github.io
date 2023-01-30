---
title: 'Algoritmos de validación cruzada'
author: 'Fabio Scielzo Ortiz'
date: '28/12/22'
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

$\hspace{0.5cm}$ Scielzo Ortiz, F. (2022). Algoritmos de validación cruzada. http://estadistica4all.com/Articulos/Algoritmos-de-validacion-cruzada.html


</p>
 
</p></span>
</div>


***Se recomienda abrir el artículo en un ordenador o en una tablet.***
 
 
 
 
 <br>
 
Los algoritmos de validación son una familia muy importante de algoritmos dentro del aprendizaje estadístico o machine learning que permiten evaluar la capacidad predictiva de un modelo predictivo.

Distinguiremos dos tipos de algoritmos de validación de modelos:

- Métodos de validación de modelos de **aprendizaje supervisado** $\hspace{0.2cm} \Rightarrow\hspace{0.2cm}$ son algoritmos que permiten evaluar modelos de aprendizaje supervisado usando **muestras de test y train de los predictores y la respuesta**, y una **métrica de evaluación**.

- Métodos de evaluación de modelos de **aprendizaje no supervisado** $\hspace{0.2cm}\Rightarrow\hspace{0.2cm}$ son algoritmos que permiten evaluar modelos de aprendizaje no supervisado usando una **muestra de train de los predictores** y una **métrica de evaluación**.


<br>

**Observación:**

Los métodos de validación de modelos de **aprendizaje supervisado**
también son llamados **métodos de validación cruzada**. Aunque realmente son mucho más conocidos por su nombre en ingles: **cross validation**

<br>

**¿Por qué no se aplican los mismos métodos de validación a los modelos de aprendizaje supervisado y no supervisado?**

Debido a que tienen unas características diferentes, en particular, en el aprendizaje supervisado se tienen datos de la variable respuesta, mientras que en el no supervisado no se dispone de información alguna.

Si se quiere ver un planteamiento algo más detallado de los problemas de aprendizaje supervisado y no supervisado se recomienda leer el siguiente articulo de nuestro blog: [link](http://estadistica4all.com/Articulos/Los-problemas-de-clasificaci%C3%B3n-y-regresi%C3%B3n.html)
<br>

Los métodos de evaluación son usados para dos propósitos, principalmente:

- Para **seleccionar**  modelos.

- Para **optimizar hiper-parametros** de modelos.


En otros artículos estudiaremos métodos para selección de modelos y  ajuste de hiper-parámetros.


<br>

En este articulo vamos a estudiar los **métodos de validación de modelos de aprendizaje supervisado**. Los métodos de validación de modelos de aprendizaje no supervisado serán estudiados en otro artículo.

Por lo que consideraremos que $\hspace{0.1cm} M \hspace{0.1cm}$ representa un **modelo o algoritmo de aprendizaje supervisado**, como por ejemplo el modelo de regresión lineal, regresión logistica, regresión no lineal, regresión lineal penalizada, arboles de regresión y clasificación, KNN , SVM, redes neuronales ...

Notese que en este articulo no se consideran modelos estadísticos predictivos no supervisados como son los modelos de clustering como K-medias, K-medoids, modelos jerarquicos, modelos basados en densidades ...
 
Nos interesa tener un método a través del cual pueda evaluarse la capacidad o poder predictivo del modelo de aprendizaje supervisado $\hspace{0.1cm}M\hspace{0.1cm}$.

Una aproximación naive es evaluar el poder predictivo del modelo usando dos elementos. Por un lado los datos disponibles de la variable respuesta, y por otro las predicciones que el modelo hace para los datos de los predcitores con los que el modelo ha sido entrenado. 

La idea sería comparar los valores reales de la respuesta con los predichos por el modelo, usando alguna métrica.   

Esta aproximación tiende a infra-estimar el error de predicción real del modelo, ya que se está prediciendo la respuesta para observaciones de los predictores que ya han sido "vistas" por el modelo, por ello el rendimiento del modelo al predecir la respuesta para estas observaciones tiende a ser mejor que si fueran observaciones con las que el modelo no ha sido entrenado (observaciones que no ha "visto" aún). 



Los métodos de validación de modelos predictivos **supervisados** tiene tres elementos:

- Muestras de **train** y **test** de los predictores y la respuesta. $\\[0.5cm]$

- Una **métrica de evaluación**. $\\[0.5cm]$

- Un **algoritmo** para **evaluar el modelo** que usa los anteriores dos elementos de algún modo.


Este artículo es básicamente un tour (teórico-práctico) sobre estos elementos.


<br>

# Muestras de train y test <a class="anchor" id="1"></a>


<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>

- Tenemos una muestra  de $\hspace{0.1cm}N\hspace{0.1cm}$ observaciones de $\hspace{0.1cm}p\hspace{0.1cm}$ predictores $\hspace{0.1cm}\mathcal{X}_1,...,\mathcal{X}_p\hspace{0.1cm}$ y  de una variable respuesta $\hspace{0.1cm}\mathcal{Y}\\$ 


    $$D=[\hspace{0.1cm} X_1,...,X_p,Y \hspace{0.1cm}]=\begin{pmatrix}
    x_{11}&x_{12}&...&x_{1p}& y_1\\
    x_{21}&x_{22}&...&x_{2p} & y_2\\
    ...&...&...&...\\
    x_{N1}&x_{N2}&...&x_{Np}& y_N
    \end{pmatrix} = \begin{pmatrix}
    x_{1}& y_1\\
    x_{2}& y_2\\
    ...&...\\
    x_{N}& y_N
    \end{pmatrix} \\$$

</p>
 
</p></span>
</div>


<br>

Sin entrar aquí en particularidades, para evaluar un modelo de aprendizaje supervisado $\hspace{0.1cm} M\hspace{0.1cm}$ este tiene que ser entrenado con un subconjunto de $\hspace{0.1cm}n\hspace{0.1cm}$ filas de $\hspace{0.1cm}D\hspace{0.05cm}$ , llamado **muestra de entrenamiento** o de **train** $\hspace{0.1cm}D_{train}\hspace{0.05cm}$, y testado con el subconjunto de las $\hspace{0.1cm}h\hspace{0.1cm}$ filas restantes de $\hspace{0.1cm}D\hspace{0.05cm}$, llamado  **muestra de test** $\hspace{0.1cm}D_{test}\hspace{0.1cm}$ , de modo  que $\hspace{0.1cm}n+h=N$ 

Los métodos de validación típicos usan de algún modo $\hspace{0.1cm}D_{train}\hspace{0.1cm}$ y  $\hspace{0.1cm}D_{test}\hspace{0.1cm}$ , junto con una **métrica de evaluación**, es por ello  que vamos a definir estos elementos con mas precisión a continuación.



<br>

## Train-set


 
Los elementos antes mencionados se definen formalmente como sigue:

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>

- **Muestra train** de $\hspace{0.1cm}n\hspace{0.1cm}$ observaciones  del predictor $\hspace{0.1cm}\mathcal{X}_j\\$

$$X_j^{train} \hspace{0.1cm}=\hspace{0.1cm} \left(\hspace{0.1cm}x_{1j}^{train},...,x_{nj}^{train}\hspace{0.1cm} \right)^t \hspace{0.3cm} , \hspace{0.3cm} \forall \hspace{0.1cm} j\in \lbrace 1,...,p \rbrace \\[0.4cm]$$

- **Muestra train** de $\hspace{0.1cm}n\hspace{0.1cm}$ observaciones de la respuesta $\hspace{0.1cm}\mathcal{Y}$

$$Y^{train}= \left(\hspace{0.1cm}y_{1}^{train},...,y_n^{train}\hspace{0.1cm}\right)^t \\[0.4cm]$$

- **Train-set**

$$D_{train}\hspace{0.1cm}=\hspace{0.1cm}[\hspace{0.1cm}X_1^{train},...,X_p^{train}, Y^{train}\hspace{0.1cm}]\hspace{0.1cm} =\hspace{0.1cm}  \begin{pmatrix}
    x_{11}^{train} &x_{12}^{train}&...&x_{1p}^{train}& y_1^{train}\\
    x_{21}^{train}&x_{22}^{train}&...&x_{2p}^{train} & y_2^{train}\\
    &...&\\
    x_{n1}^{train}&x_{n2}^{train}&...&x_{np}^{train}& y_n^{train}
    \end{pmatrix}= \begin{pmatrix}
    x_{1}^{train}& y_1^{train}\\
    x_{2}^{train}& y_2^{train}\\
    ...&...\\
    x_{n}^{train}& y_n^{train}
    \end{pmatrix}$$

</p>
 
</p></span>
</div>

<br>

**Observaciones:**

- La fila $\hspace{0.1cm} i\hspace{0.1cm}$ de $\hspace{0.1cm}D_{train}\hspace{0.1cm}$ , es decir, $\hspace{0.1cm}\left(x_i^{train},y_i^{train}\right) = \left(x_{i1}^{train}, x_{i2}^{train},...,x_{ip}^{train}, y_i^{train}\right)\hspace{0.1cm}$, es la $\hspace{0.1cm}i$-esima **observación de train** de los predictores y la respuesta $\hspace{0.1cm}\mathcal{X}_1,...,\mathcal{X}_p \hspace{0.1cm},\hspace{0.1cm} \mathcal{Y} \\$

- $D_{train}\hspace{0.08cm}$ también es llamada simplemente **observaciones de train** de $\hspace{0.1cm}\mathcal{X}_1,...,\mathcal{X}_p\hspace{0.1cm},\hspace{0.1cm} \mathcal{Y}$


<br>

## Predicciones de train

Como $\hspace{0.1cm}M\hspace{0.1cm}$ es un modelo de aprendizaje supervisado es capaz de, una vez es entrenado  con las observaciones de   $\hspace{0.08cm}D_{train}=[X_1^{train},...,X_p^{train}, Y^{train}]\hspace{0.08cm}$ , generar predicciones de la variable respuesta $\hspace{0.08cm}\mathcal{Y}\hspace{0.08cm}$, tanto para las **observaciones de train** de los predictores como para  **nuevas observaciones**.

Notese que $\hspace{0.1cm}M\hspace{0.1cm}$ nos interesa realmente para predecir la variable respuesta para **nuevas observaciones** de los predictores, es decir, para predecir la respuesta para individuos/elementos de los que solo tenemos información de los predictores.  


<br>

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>

$\hspace{0.2cm}$ Las **predicciones de train** de la respuesta $\hspace{0.1cm}\mathcal{Y}\hspace{0.1cm}$ ,  son obtenidas aplicando el modelo de aprendizaje supervisado ya **entrenado** a las **observaciones de train** de los **predictores**:


$$\widehat{\hspace{0.08cm} Y}^{\hspace{0.1cm} train} \hspace{0.1cm} = \hspace{0.1cm}  M\left(\hspace{0.1cm} X_1^{train},...,X_p^{train} \hspace{0.15cm}|\hspace{0.15cm} X_1^{train},...,X_p^{train}, Y^{train} \hspace{0.1cm}\right)$$

</p>
 
</p></span>
</div>

<br>

**Observaciones:**

- Aqui $\hspace{0.08cm}M(\hspace{0.1cm} z \hspace{0.1cm}|\hspace{0.1cm} w\hspace{0.1cm})\hspace{0.08cm}$ representa una función de dos argumentos, el argumento posterior a $\hspace{0.1cm}|\hspace{0.1cm}$ , es decir $\hspace{0.1cm}w\hspace{0.1cm}$, son los datos de predictores y respuestas con los que se entrena el modelo de aprendizaje supervisado $\hspace{0.1cm}M\hspace{0.05cm}$ , y el argumento previo a $\hspace{0.1cm}|\hspace{0.1cm}$ , es decir $\hspace{0.1cm}z\hspace{0.1cm}$, son los datos de los predictores que el modelo $\hspace{0.1cm}M\hspace{0.05cm}$ usa para generar predicciones de la variable respuesta. Y devuelve un vector con esas predicciones de la respuesta. $\\[0.5cm]$



- $\widehat{\hspace{0.08cm} Y}^{\hspace{0.08cm} train}\hspace{0.1cm}=\hspace{0.1cm}(\hat{y}_1^{train},..., \hat{y}_n^{train})^t\hspace{0.15cm}$ es un vector con las predicciones de la respuesta hechas por el modelo entrenado $\hspace{0.08cm}M\hspace{0.1cm}$  para la muestra train de observaciones de los predictores $\hspace{0.1cm}(X_1^{train},...,X_p^{train}) \\$

- $\widehat{y}_i^{train} \hspace{0.1cm}=\hspace{0.1cm} M(\hspace{0.1cm} x_i^{train} \hspace{0.1cm}|\hspace{0.1cm} X_1^{train},...,X_p^{train}, Y^{train} \hspace{0.1cm}) \hspace{0.1cm}=\hspace{0.1cm} M(\hspace{0.1cm}x_{i1}^{train},...,x_{ip}^{train} \hspace{0.1cm}|\hspace{0.1cm} X_1^{train},...,X_p^{train}, Y^{train}\hspace{0.1cm})\hspace{0.1cm}$ es la predicción de la variable respuesta generada por el modelo entrenado $\hspace{0.05cm}M\hspace{0.05cm}$ para la observación de train de los predictores $\hspace{0.1cm}x_i^{train}\hspace{0.1cm}=\hspace{0.1cm}(x_{i1}^{train},...,x_{ip}^{train})$





<br>

## Test-set

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>

- **Muestra test** de $\hspace{0.08cm}h\hspace{0.08cm}$ observaciones   del predictor $\hspace{0.08cm}\mathcal{X}_j\\$

$$X_j^{test}=\left(x^{test}_{1j},...,x^{test}_{hj} \right)^t  \hspace{0.3cm} , \hspace{0.3cm} \forall j=1,...,p\\[0.4cm]$$

-  **Muestra test** de $\hspace{0.1cm}h\hspace{0.1cm}$ observaciones  de la respuesta $\hspace{0.08cm}\mathcal{Y}\\$

$$Y^{test}=\left(y^{test}_{1},...,y^{test}_{h} \right)^t  \hspace{0.3cm} , \hspace{0.3cm} \forall j=1,...,p \\[0.4cm]$$


- **Test-set**

$$D_{test}  \hspace{0.1cm}=\hspace{0.1cm} [\hspace{0.1cm}X_1^{test},...,X_p^{test}, Y^{test}\hspace{0.1cm}] \hspace{0.1cm}=\hspace{0.1cm} \begin{pmatrix}
    x^{test}_{11}&x^{test}_{12}&...&x^{test}_{1p} & y^{test}_1\\
    x^{test}_{21}&x^{test}_{22}&...&x^{test}_{2p} & y^{test}_2\\
    &...&\\
    x^{test}_{h1}&x^{test}_{h2}&...&x^{test}_{hp} & y^{test}_h
    \end{pmatrix}= \begin{pmatrix}
    x_{1}^{test}& y_1^{test}\\
    x_{2}^{test}& y_2^{test}\\
    ...&...\\
    x_{h}^{test}& y_h^{test}
    \end{pmatrix}$$


</p>
 
</p></span>
</div>


<br>

**Observaciones:**

- La fila $\hspace{0.1cm}i\hspace{0.1cm}$ de $\hspace{0.1cm}D_{test}\hspace{0.1cm}$ , es decir, $\hspace{0.1cm}(x_i^{test},y_i^{test})= (x^{test}_{i1}, x^{test}_{i2},...,x^{test}_{ip}, y_i^{test})\hspace{0.1cm}$, es la $\hspace{0.1cm}i$-esima **observación de test** de los predictores y la respuesta $\hspace{0.1cm}\mathcal{X}_1,...,\mathcal{X}_p\hspace{0.08cm},\hspace{0.08cm} \mathcal{Y}\\$


- $D_{test}\hspace{0.1cm}$ también es llamada simplemente **observaciones de test** de $\hspace{0.1cm}\mathcal{X}_1,...,\mathcal{X}_p, \mathcal{Y}$

<br>

## Predicciones de test


Puesto que $\hspace{0.1cm}M\hspace{0.1cm}$ es un modelo predictivo supervisado es capaz de, una vez es entrenado  con las observaciones de   $\hspace{0.08cm}D_{train}=[X_1^{train},...,X_p^{train}, Y^{train}]\hspace{0.08cm}$ , generar predicciones de la respuesta $\hspace{0.08cm}\mathcal{Y}\hspace{0.08cm}$  ,  tanto para las **observaciones de train** como  para **nuevas observaciones** de los predictores $\hspace{0.08cm}\mathcal{X}_1,...,\mathcal{X}_p$ . 


Notese, de nuevo, que $\hspace{0.1cm}M\hspace{0.1cm}$ nos interesa realmente para predecir la respuesta para **nuevas observaciones** de los predictores, es decir, para predecir la respuesta para individuos/elementos de los que tenemos información sobre los predictores pero no sobre la respuesta.  


<br>


<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>

$\hspace{0.2cm}$ Las **predicciones de test** de la respuesta $\hspace{0.08cm}\mathcal{Y}\hspace{0.08cm}$ ,   son obtenidas aplicando el **modelo** predictivo **entrenado** a las observaciones de **test**:



 $$\widehat{Y}\hspace{0.08cm}^{test} \hspace{0.1cm} = \hspace{0.1cm} M\left(\hspace{0.1cm} X_1^{test},...,X_p^{test} \hspace{0.15cm}|\hspace{0.15cm} X_1^{train},...,X_p^{train}, Y^{train} \hspace{0.1cm}\right)$$


</p>
 
</p></span>
</div>

<br>

**Observaciones:**


- Aqui $\hspace{0.08cm}M(\hspace{0.1cm} z \hspace{0.1cm}|\hspace{0.1cm} w\hspace{0.1cm})\hspace{0.08cm}$ representa una función de dos argumentos, el argumento posterior a $\hspace{0.1cm}|\hspace{0.1cm}$ , es decir $\hspace{0.1cm}w\hspace{0.1cm}$, son los datos de predictores y respuestas con los que se entrena el modelo $\hspace{0.1cm}M\hspace{0.1cm}$ , y el argumento previo a $\hspace{0.1cm}|\hspace{0.1cm}$ , es decir $\hspace{0.1cm}z\hspace{0.1cm}$, son los datos de los predictores que el modelo $\hspace{0.1cm}M\hspace{0.1cm}$ usa para generar predicciones de la respuesta. Y devuelve un vector con esas predicciones de la respuesta. $\\[0.5cm]$



- $\widehat{\hspace{0.08cm}Y}^{\hspace{0.08cm}test}\hspace{0.08cm}=\hspace{0.08cm} \left(\hat{y}_1^{\hspace{0.08cm}test},..., \hat{y}_h^{\hspace{0.08cm}test}\right)^t\hspace{0.1cm}$ es un vector con las predicciones de la respuesta hechas por el modelo entrenado $\hspace{0.1cm}M\hspace{0.1cm}$  usando la **muestra test** de observaciones de los predictores $\hspace{0.08cm}X_1^{test},...,X_p^{test} \\$

- $\hat{y}_i^{test} \hspace{0.1cm}=\hspace{0.1cm} M \left(\hspace{0.1cm} x_i^{test} \hspace{0.15cm}|\hspace{0.15cm} X_1^{train},...,X_p^{train}, Y^{train}\hspace{0.1cm} \right) \hspace{0.1cm}=\hspace{0.1cm} M\left( \hspace{0.08cm} x^{test}_{i1},...,x^{test}_{ip} \hspace{0.15cm}|\hspace{0.15cm} X_1^{train},...,X_p^{train}, Y^{train}\right)\hspace{0.1cm}$ es la predicción de la respuesta que el modelo entrenado $\hspace{0.1cm}M\hspace{0.1cm}$ genera para la observación de test de los predictores $\hspace{0.1cm}x_i^{test}=(x^{test}_{i1},...,x^{test}_{ip})$ .


<br>

 

Teniendo todo lo anterior en cuenta, la evaluación de los modelos de aprendizaje supervisado $\hspace{0.05cm} M\hspace{0.05cm}$ se realiza, sin entrar en particularidades, comparando las **predicciones de test** de la variable respuesta generadas por el modelo $\hspace{0.05cm}M\hspace{0.05cm}$, es decir, $\hspace{0.08cm}\widehat{\hspace{0.08cm}Y}^{\hspace{0.08cm}test}\hspace{0.08cm}$, con la muestra de **observaciones test** de la respuesta, $\hspace{0.08cm}Y^{test}$

La muestra test juega el rol de muestra de nuevas observaciones. Y el modelo  $\hspace{0.05cm} M\hspace{0.05cm}$ interesa  para predecir nuevas observaciones. 

Por ello se utiliza la muestra test como muestra para evaluar el rendimiento del modelo al predecir la respuesta para nuevas observaciones de los predictores.



<br>




# Métricas para evaluar modelos de regresión


Dado un modelo de regresión  $\hspace{0.05cm} M\hspace{0.05cm}$ , existen varias métricas para evaluar la capacidad predictiva del modelo. Cada una de estas métricas tienen una versión de train (son calculadas usando las predicciones de train) y otra de test (son calculadas usando las predicciones de test).



Se recomienda al lector haber leido previamente el articulo sobre [los problemas de regresión y clasificación supervisada y no supervisada.](http://estadistica4all.com/Articulos/Los-problemas-de-clasificaci%C3%B3n-y-regresi%C3%B3n.html)


 
A continuación vamos a exponer las métricas de evaluación más habituales para **modelos de regresión**:


## Error cuadrático medio (ECM)

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>


$\hspace{0.25cm}$ **ECM de train**

$$ECM(M)_{train} \hspace{0.15cm}=\hspace{0.15cm} \dfrac{1}{n} \cdot \sum_{i=1}^n \hspace{0.1cm} \left(\hspace{0.08cm} y_i^{\hspace{0.08cm}train} - \hat{y}_i^{\hspace{0.08cm}train} \hspace{0.08cm} \right)^2 \\$$


</p>
 
</p></span>
</div>

$\hspace{0.25cm}$ Donde:

- $y_i^{test}\hspace{0.1cm}$ es la **observación de test** $\hspace{0.1cm}i$-esima de la variable respuesta, es decir,   $\hspace{0.15cm}y_i^{test} \hspace{0.1cm}=\hspace{0.1cm} Y^{test}[\hspace{0.1cm} i\hspace{0.1cm}]\\$

- $\hat{y}_i^{test} \hspace{0.1cm}=\hspace{0.1cm} M\left(\hspace{0.1cm} x_i^{test} \hspace{0.15cm}|\hspace{0.15cm} X_1^{train},...,X_p^{train}, Y^{train}\hspace{0.1cm} \right)\\$

- $\hspace{0.2cm} n \hspace{0.1cm}=\hspace{0.1cm} \# \hspace{0.1cm} Y^{train} \\$





<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>


$\hspace{0.25cm}$ **ECM de test**

$$ECM(M)_{test} \hspace{0.15cm} =\hspace{0.15cm} \dfrac{1}{h} \cdot \sum_{i=1}^h \hspace{0.1cm} \left(\hspace{0.1cm} y_i^{\hspace{0.1cm}test} - \hat{y}_i^{\hspace{0.1cm}test} \hspace{0.1cm} \right)^2$$

</p>
 
</p></span>
</div>

$\hspace{0.25cm}$ Donde:

- $y_i^{test}\hspace{0.1cm}$ es la observación de test $\hspace{0.1cm}i$-esima de la variable respuesta, es decir,   $\hspace{0.15cm}y_i^{test} \hspace{0.1cm}=\hspace{0.1cm} Y^{test}[\hspace{0.1cm} i \hspace{0.1cm}] \\$

- $\hat{y}_i^{test} \hspace{0.1cm}=\hspace{0.1cm} M\left(\hspace{0.1cm} x_i^{test} \hspace{0.15cm}|\hspace{0.15cm} X_1^{train},...,X_p^{train}, Y^{train} \hspace{0.1cm} \right)\\$

- $\hspace{0.2cm} h\hspace{0.1cm}=\hspace{0.1cm}\# \hspace{0.1cm} Y^{test}$




<br>







**Observación:**

El $\hspace{0.08cm} ECM\hspace{0.08cm}$ tiene se mide en la unidad de medida que la respuesta **al cuadrado**. $\\[0.7cm]$



**Interpretación:**

Cuanto menor sea $\hspace{0.08cm}ECM(M)_{test}\hspace{0.08cm}$ , mayor capacidad predictiva del modelo $\hspace{0.08cm}M\hspace{0.08cm}$, y a la inversa. 

<br>

**¿Por qué el ECM es tan usado en la práctica?**

Teóricamente puede demostraste que en un modelo de regresión   el error cuadrático medio de la predicción puede descomponerse como sigue: $\\[0.5cm]$

$$ECM(\hspace{0.08cm}\widehat{\mathcal{Y}}\hspace{0.08cm}) = E\hspace{0.1cm}[\hspace{0.1cm}(\mathcal{Y} - \widehat{\mathcal{Y}})^2\hspace{0.1cm}]\hspace{0.1cm} =\hspace{0.1cm} Var(\hspace{0.08cm}\widehat{\mathcal{Y}}\hspace{0.08cm}) \hspace{0.1cm}+\hspace{0.1cm} Sesgo(\hspace{0.08cm}\widehat{\mathcal{Y}}\hspace{0.08cm})^2 \hspace{0.1cm}+\hspace{0.1cm} \sigma_{\varepsilon}^2 \\$$



Donde:


- $Var(\hspace{0.08cm}\widehat{\mathcal{Y}}\hspace{0.08cm})\hspace{0.1cm} =\hspace{0.1cm} E[\hspace{0.1cm}(\hspace{0.08cm}\widehat{\mathcal{Y}} - E[\hspace{0.08cm}\widehat{\mathcal{Y}}\hspace{0.08cm}]\hspace{0.08cm})^2\hspace{0.1cm}]\hspace{0.1cm}$ es la varianza de las predicciones del modelo. $\\[0.5cm]$

- $Sesgo(\hspace{0.08cm}\widehat{\mathcal{Y}}\hspace{0.08cm})\hspace{0.1cm}=\hspace{0.1cm}E[\hspace{0.08cm}\hspace{0.1cm}\widehat{\mathcal{Y}}\hspace{0.1cm}] \hspace{0.1cm}-\hspace{0.1cm} \mathcal{Y}\hspace{0.15cm}$ es el sesgo de las predicciones del modelo.$\\[0.5cm]$

- $\sigma_{\varepsilon}^2\hspace{0.1cm}$ es la varianza del ruido aleatorio o perturbación del modelo. $\\[0.5cm]$


Por tanto, en un modelo de regresion,  el ECM del estimador de la respuesta puede descomponerse como la suma de la varianza y sesgo al cuadrado de dicho estimador de la respuesta, y tambien de la varianza del ruido aleatorio del modelo.

Los dos primeros terminos (varianza y sesgo del estimador de la respuesta) pueden se reducidos, en función del modelo utilizado. En cambio el tercer componente (la varianza del ruido) es irreducible, no depende del modelo.


Esta propiedad del ECM es una de las razones por las que es tan usado, ya que nos da información sobre el ratio varianza-sego de las predicciones de un modelo.

Un modelo con baja varianza y sesgo en sus predicciones tendra bajo ECM.

Un modelo con alta varianza o alto sesgo en sus predicciones tendra alto ECM.

Los modelos con menor ECM de entre una colección de modelos serán aquellos con un mayor equilibrio en el ratio varianza-sesgo en sus predicciones.


Un modelo con mucha varianza en sus predicciones es un modelo cuyas predicciones sobre la respuesta varian mucho de una muestra de train a otra. Es decir, al ser entrenado con múltiples muestras, las predicciones que el modelo hace de la respuesta usando una determinada muestra fija de test varían mucho de un modelo entrenado a otro. En un modelo con poca varianza en sus predicciones ocurre al revés, la precisión de sus predicciones es alta en el sentido de que varian poco en funcion de la muestra de train empleada. Otra cuestión es si estas predicciones son mas o menos acertadas (esto tiene que ver mas con el sesgo).

Un modelo con mucho sesgo en sus predicciones es un modelo cuyas predicciones sobre la respuesta están en media muy lejos de los verdaderos valores de la respuesta. Es decir, si el modelo es entrenado con múltiples muestras de train y se predice la respuesta para una muestra fija de test, la media de las predicciones de la respuesta obtenidas con cada uno de los modelos entrenados aleja bastante de la verdadera respuesta.
En cambio un modelo con bajo sesgo genera predicciones que en media son bastante acertadas. Es decir, si se entrena el modelo con múltiples muestras de train y se predice la respuesta usando una muestra fija de test, la media de esas predicciones obtenidas con cada uno de los modelos entrenados es bastante cercana a la respuesta real.




<br>




## Raiz del error cuadrático medio (RECM)

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>


$\hspace{0.25cm}$ **RECM de train:**

$$RECM(M)_{train} \hspace{0.08cm}=\hspace{0.08cm} \sqrt{\dfrac{1}{n} \sum_{i=1}^n \hspace{0.1cm} \left(y_i^{train} - \hat{y}_i^{train}\right)^2 \hspace{0.2cm}} \\$$


</p>
 
</p></span>
</div>



<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>


$\hspace{0.25cm}$ **RECM de test:**


$$RECM(M)_{test} \hspace{0.08cm}=\hspace{0.08cm} \sqrt{ \dfrac{1}{h} \cdot \sum_{i=1}^h \hspace{0.1cm} \left(\hspace{0.1cm} y_i^{\hspace{0.1cm} test} - \hat{y}_{i} ^{\hspace{0.1cm} test} \hspace{0.1cm} \right)^2 \hspace{0.2cm}} \\[0.2cm]$$

</p>
 
</p></span>
</div>


<br>

**Observación:**

El $\hspace{0.08cm}RECM\hspace{0.08cm}$ tiene la misma unidad de medida que la respuesta. $\\[0.4cm]$


**Interpretación:**

Cuanto menor sea $\hspace{0.08cm}RECM(M)_{test}\hspace{0.08cm}$ , mayor bondad predictiva del modelo $\hspace{0.08cm}M\hspace{0.08cm}$, y a la inversa.

 <br>



## Error cuadratico relativo (ECR)

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>


$\hspace{0.25cm}$ **ECR de train:**

$$ECR(M)_{train} \hspace{0.1cm}=\hspace{0.1cm} \dfrac{\hspace{0.5cm} \sum_{i=1}^n \hspace{0.1cm} \left( y_i^{train}- \hat{y}_i^{train} \right)^2 \hspace{0.5cm}}{\sum_{i=1}^n \left( y_i^{train} - \overline{Y \hspace{0.1cm}}^{\hspace{0.1cm} train} \right)^2 }  \\$$

</p>
 
</p></span>
</div>


<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>


$\hspace{0.25cm}$ **ECR de test:**

$$ECR(M)_{test} \hspace{0.1cm}=\hspace{0.1cm} \dfrac{ \hspace{0.5cm} \sum_{i=1}^h \hspace{0.1cm} \left(\hspace{0.1cm} y_i^{\hspace{0.1cm} test} - \hat{y}_i^{\hspace{0.1cm} test} \hspace{0.1cm}\right)^2 \hspace{0.5cm}    }{\sum_{i=1}^h \left(\hspace{0.1cm} y_i^{\hspace{0.1cm} test} - \overline{Y \hspace{0.1cm}}^{\hspace{0.1cm} test} \hspace{0.1cm} \right)^2 } \\$$

</p>
 
</p></span>
</div>


**Interpretación:**

Cuanto menor sea $\hspace{0.08cm}ECR(M)_{test}\hspace{0.08cm}$ , mayor bondad predictiva del modelo $\hspace{0.08cm}M\hspace{0.08cm}$, y a la inversa.

<br>


## Coeficiente de determinación 


<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>

$\hspace{0.25cm}$ **Coeficiente de determinación de train:**

$$R(M)^2_{train} \hspace{0.1cm}=\hspace{0.1cm} 1 - ECR(M)_{train} \\$$

</p>
 
</p></span>
</div>



<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>


$\hspace{0.25cm}$ **Coeficiente de determinación de train:**

$$R(M)^2_{test} \hspace{0.1cm}=\hspace{0.1cm} 1 - ECR(M)_{test} \\$$

</p>
 
</p></span>
</div>


**Interpretación:**

Cuanto mayor sea $\hspace{0.05cm}R(M)^2_{test}\hspace{0.05cm}$ , mayor bondad predictiva del modelo $\hspace{0.05cm}M\hspace{0.05cm}$, y a la inversa.

<br>

 
## Error absoluto medio (EAM)


<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>

$\hspace{0.25cm}$ **EAM de train:**

$$EAM(M)_{train} \hspace{0.1cm}=\hspace{0.1cm} \dfrac{1}{n} \cdot \sum_{i=1}^n \hspace{0.1cm} \left|\hspace{0.1cm} y_i^{train} - \hat{y}_i^{train} \hspace{0.1cm}\right| \\$$

</p>
 
</p></span>
</div>


<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>

$\hspace{0.25cm}$ **EAM de test:**


$$EAM(M)_{test} \hspace{0.1cm}=\hspace{0.1cm} \dfrac{1}{h} \cdot \sum_{i=1}^h \hspace{0.1cm} \left| \hspace{0.1cm} y_i^{\hspace{0.1cm}test} - \hat{y}_i^{\hspace{0.1cm}test} \hspace{0.1cm} \right|$$

</p>
 
</p></span>
</div>

<br>

## Error absoluto relativo (EAR)


<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>

$\hspace{0.25cm}$ **EAR de train:**

$$EAR(M)_{train} \hspace{0.1cm}=\hspace{0.1cm} \dfrac{\sum_{i=1}^n \hspace{0.1cm} \left|\hspace{0.1cm} y_i^{train} - \hat{y}_i^{\hspace{0.08cm} train} \hspace{0.1cm} \right| \hspace{0.2cm} }{\sum_{i=1}^n \hspace{0.1cm} \left| \hspace{0.1cm} y_i^{train} - \overline{y}^{train} \hspace{0.1cm} \right| \hspace{0.1cm}}  \\$$


</p>
 
</p></span>
</div>



<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>

$\hspace{0.25cm}$ **EAR de test:**


$$EAR(M)_{test} \hspace{0.1cm}=\hspace{0.1cm} \dfrac{ \sum_{i=1}^h \hspace{0.1cm} \hspace{0.1cm} \left| \hspace{0.1cm} y_i^{\hspace{0.1cm} test} - \hat{y}_i^{\hspace{0.1cm} test} \hspace{0.1cm} \right| \hspace{0.2cm}  }{\sum_{i=1}^h \hspace{0.1cm}\left|\hspace{0.1cm} y_i^{\hspace{0.1cm} test} - \overline{y}^{\hspace{0.1cm} test} \hspace{0.1cm}\right|\hspace{0.1cm}}$$

</p>
 
</p></span>
</div>

 


<br>


# Métricas para evaluar modelos de clasificación supervisada

A continuación vamos a exponer las métricas de evaluación más habituales para **modelos de clasificación supervisada**:


## Tasa de acierto en la clasificación (TAC)


<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>


$\hspace{0.25cm}$ **TAC de train:**

$$TAC(M)_{train} \hspace{0.1cm}=\hspace{0.1cm} \dfrac{1}{n} \cdot \sum_{i=1}^{n} \hspace{0.2cm} \mathbf {I} \left( \hspace{0.1cm} \hat{y}_i^{train} = y_i^{train} \hspace{0.1cm} \right)$$

</p>
 
</p></span>
</div>


<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>


$\hspace{0.25cm}$ **TAC de test:**

$$TAC(M)_{train} \hspace{0.1cm}=\hspace{0.1cm} \dfrac{1}{n} \cdot \sum_{i=1}^{n} \hspace{0.2cm} \mathbf{I} \left( \hspace{0.1cm} \hat{y}_i^{train} = y_i^{train} \hspace{0.1cm}\right)$$

</p>
 
</p></span>
</div>


<br>


 
## Tasa de error en la clasificación (TEC)



<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>

$\hspace{0.25cm}$ **TEC de train:**

$$TEC(M)_{train} \hspace{0.1cm}=\hspace{0.1cm} \dfrac{1}{n} \cdot \sum_{i=1}^{n} \hspace{0.2cm} \mathbf {I} \left( \hspace{0.05cm} \hat{y}_i^{train} \neq y_i^{train} \hspace{0.05cm} \right)$$


</p>
 
</p></span>
</div>



<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>


$\hspace{0.25cm}$ **TEC de test:**

$$TEC(M)_{test} \hspace{0.1cm}=\hspace{0.1cm} \dfrac{1}{h} \cdot \sum_{i=1}^{h} \hspace{0.2cm} \mathbf {I} \left( \hspace{0.1cm} \hat{y}_i^{\hspace{0.05cm} test} \neq y_i^{\hspace{0.05cm} test} \hspace{0.1cm}\right)$$

</p>
 
</p></span>
</div>

<br>

## Kappa

Suponemos que una variable respuesta tiene $\hspace{0.05cm}k \geq 2\hspace{0.05cm}$ categorias

Si usamos un modelo de clasificación basado en la distribución de probabilidad uniforme discreta, este predice cada categoria de la respuesta con igual probabilidad $\hspace{0.05cm}1/k\hspace{0.05cm}$, por lo que la tasa de acierto del modelo esperada es $\hspace{0.05cm}1/k$, es decir, si el modelo se aplica muchas veces, la $\hspace{0.08cm} TAC\hspace{0.08cm}$ **media** será de $1/k$



<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>

$\hspace{0.25cm}$ **Kappa de train:**

$$Kappa(M)_{\hspace{0.05cm} train} \hspace{0.1cm} = \hspace{0.1cm} \dfrac{\hspace{0.1cm} TAC_{\hspace{0.05cm} train} \hspace{0.1cm}-\hspace{0.1cm} 1/k \hspace{0.1cm}}{1 \hspace{0.1cm} -\hspace{0.1cm} 1/k}$$

</p>
 
</p></span>
</div>


<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>


$\hspace{0.25cm}$ **Kappa de test:**

$$Kappa(M)_{\hspace{0.05cm} test} \hspace{0.1cm}=\hspace{0.1cm} \dfrac{\hspace{0.1cm} TAC_{\hspace{0.05cm} test} \hspace{0.1cm}-\hspace{0.1cm} 1/k \hspace{0.1cm}}{1 \hspace{0.1cm}-\hspace{0.1cm} 1/k}$$

</p>
 
</p></span>
</div>




<br>



### Modelo de clasificación aleatoria uniforme

Dada una respuesta $\hspace{0.1cm}\mathcal{Y}\hspace{0.1cm}$ con $\hspace{0.1cm}k\geq 2\hspace{0.1cm}$ categorias  y  de una serie de predictotres $\hspace{0.1cm}\mathcal{X}_1 , ..., \mathcal{X}_p$

Dada una muestra de $\hspace{0.1cm}n\hspace{0.1cm}$ observaciones de $\hspace{0.1cm}Y\hspace{0.1cm}$ del predictor  
y una muestra $\hspace{0.1cm}X_j\hspace{0.1cm}$ del predictor $\hspace{0.1cm}\mathcal{X}_j \\$


Un modelo de clasificación aleatorio basado en la distribución discreta $\hspace{0.1cm}U\lbrace 0,1,..., k-1 \rbrace\hspace{0.1cm}$ es un modelo tal que:

$$\widehat{y}_i \sim U\lbrace 0,1,..., k-1 \rbrace$$

Por lo que:

$$P(\widehat{y}_i = h) = 1/k = p$$ 

para todo $\hspace{0.1cm}h=0,1,...,k-1$


Por tanto, para cada $\hspace{0.15cm}i=1,...,n\hspace{0.15cm}$ tenemos que: $\\[0.4cm]$

$\hspace{0.5cm} P\left( \hspace{0.1cm} \mathbf{I}(\hat{y}_i = y_i) = 1\hspace{0.1cm} \right) = P \left( \hspace{0.1cm} \hat{y}_i = y_i \hspace{0.1cm} \right) \hspace{0.1cm}=\hspace{0.1cm} 1/k \hspace{0.1cm}=\hspace{0.1cm} p$

$\hspace{0.5cm} P\left( \hspace{0.1cm} \mathbf{I}(\hat{y}_i = y_i) = 0 \hspace{0.1cm} \right) \hspace{0.1cm} =\hspace{0.1cm} P\left( \hspace{0.1cm} \hat{y}_i \neq y_i \hspace{0.1cm} \right) \hspace{0.1cm}=\hspace{0.1cm} 1- 1/k  \hspace{0.1cm}=\hspace{0.1cm} 1 - p\\$

Por lo que $\hspace{0.1cm}\mathbf{I}(\hat{y}_i = y_i)\hspace{0.1cm}$  es una variable binaria, con probabilidad de exito $\hspace{0.1cm}p\hspace{0.1cm}$ y de fracaso $\hspace{0.1cm}1-p\hspace{0.1cm}$, es decir:

$$\mathbf{I}(\hat{y}_i = y_i)  \hspace{0.1cm}\sim\hspace{0.1cm} Bernoulli\left( \hspace{0.1cm} p=1/k \hspace{0.1cm} \right)$$


Por lo tanto:

$$\sum_{i=1}^n \mathbf{I}(\hat{y}_i = y_i) \hspace{0.1cm}\sim\hspace{0.1cm} Binomial(n\cdot p )$$

Asi que, la tasa de acierto  esperada del modelo de clasificación aleatoria uniforme es:


$$E\left[TAC\right] \hspace{0.1cm}=\hspace{0.1cm} E\left[ \dfrac{1}{n} \sum_{i=1}^n \mathbf{I}(\hat{y}_i = y_i) \right] \hspace{0.1cm}=\hspace{0.1cm} E\left[  \dfrac{1}{n} \cdot Binomial(n\cdot p )  \right] \hspace{0.1cm}=\hspace{0.1cm} \dfrac{1}{n} \cdot E\left[ Binomial(n\cdot p )   \right]  \hspace{0.1cm}=\hspace{0.1cm} \dfrac{1}{n} \cdot (n\cdot p) = p = 1/k$$

<br>

---

<br>



# Algoritmos de validación de  modelos de aprendizaje supervisado



Los algoritmos de validación de modelos de aprendizaje supervisado permiten medir la capacidad predictiva de dichos modelos. Estoas algoritmos se suelen basar en:


1) División del data-set inicial de la respuesta y los predictores en parte de train y parte de test.

2) Entrenamiento del modelo con la parte de train.

3) Obtención de predicciones de la respuesta con la parte de test.

4) Cálculo de una métrica de evaluación usando las predicciones obtenidas en el paso 4)  y las observaciones de test de la respuesta. $\\[0.5cm]$

 

Tenemos un modelo de aprendizaje supervisado  $\hspace{0.1cm}M\hspace{0.1cm}$ y una muestra  de $\hspace{0.1cm}N\hspace{0.1cm}$ observaciones de $\hspace{0.1cm}p\hspace{0.1cm}$ predictores $\hspace{0.1cm}\mathcal{X}_1,...,\mathcal{X}_p\hspace{0.1cm}$ y  de la respuesta $\hspace{0.1cm}\mathcal{Y}\\[0.7cm]$ 

 $$D\hspace{0.1cm}=\hspace{0.1cm}[X_1,...,X_p,Y]\hspace{0.1cm}=\hspace{0.1cm}\begin{pmatrix}
    x_{11}&x_{12}&...&x_{1p}& y_1\\
    x_{21}&x_{22}&...&x_{2p} & y_2\\
    &...&\\
    x_{N1}&x_{N2}&...&x_{Np}& y_N
    \end{pmatrix}=\begin{pmatrix}
    x_{1}& y_1\\
    x_{2}& y_2\\
    ...&...\\
    x_{N}& y_N
    \end{pmatrix}$$ 


<br>

<br>

## Validación simple no aleatoria

**Descripción no formal del algoritmo:**


Este algoritmo de validación consiste en dividir el data-set inicial en una parte de train y otra de test de manera no aleatoria.

El $\hspace{0.1cm} k\% \hspace{0.1cm}$ de las primeras filas del data-set serán la parte de train, y el resto la parte de test.

El modelo es entrenado con la muestra train y testado calculando una métrica de evaluación con la muestra test. Este valor de la métrica de evaluación es el que será usado para medir la capacidad predictiva del modelo y compararlo con otros modelos. $\\[1cm]$



**Decripción formal del algoritmo:**

El algoritmo de validación simple no aleatoria tiene los siguientes pasos: $\\[0.3cm]$



<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>

- Se divide $\hspace{0.1cm}D\hspace{0.1cm}$ en parte de train y parte de test del siguiente modo: $\\[0.4cm]$

    - Sea $\hspace{0.1cm}k\in (0,1)\hspace{0.1cm}$ la proporción de filas de $\hspace{0.1cm}D\hspace{0.1cm}$ que formaran parte del muestra de **train** (es un hiper-parametro del algoritmo): $\\[0.5cm]$

         - Las primeras $\hspace{0.2cm}\lfloor k  \cdot N \rfloor\hspace{0.2cm}$ observaciones (filas) definen el conjunto de train:$\\[0.6cm]$

         $$D_{train}= \begin{pmatrix}
    x_{11}&x_{12}&...&x_{1p}& y_1\\
    x_{21}&x_{22}&...&x_{2p} & y_2\\
    &...&\\
    x_{\lfloor k  \cdot N \rfloor1}&x_{\lfloor k  \cdot N \rfloor2}&...&x_{\lfloor k  \cdot N \rfloor p}& y_{\lfloor k  \cdot N \rfloor}
    \end{pmatrix}=\begin{pmatrix}
    x_{1}^{train} & y_{1}^{train}\\
    x_{2}^{train} & y_{2}^{train}\\
    ....&...\\
    x_{\# D_{train}}^{train} & y_{\# D_{train}}^{train}\\
    \end{pmatrix} \hspace{0.1cm}=\hspace{0.1cm} \left[\hspace{0.1cm} X_1^{train} ,..., X_p^{train} , Y^{train}\hspace{0.1cm}\right]\\$$
    
    
        Donde:

        $\# D_{train}\hspace{0.1cm}$ es el número de **filas** de $\hspace{0.1cm}D_{train} \\[0.8cm]$


       - Las siguientes $\hspace{0.2cm} N - \lfloor k  \cdot N \rfloor\hspace{0.2cm}$ observaciones definen (filas) el conjunto de test: $\\[0.6cm]$ 

        $$D_{test}= \begin{pmatrix}
    x_{(\lfloor k  \cdot N \rfloor + 1) \hspace{0.05cm} 1 } & x_{(\lfloor k  \cdot N \rfloor + 1) \hspace{0.05cm} 2}&...&x_{(\lfloor k  \cdot N \rfloor + 1) \hspace{0.05cm} p}& y_{\lfloor k  \cdot N \rfloor + 1} \\
    x_{(\lfloor k  \cdot N \rfloor + 2) \hspace{0.05cm} 1 } & x_{(\lfloor k  \cdot N \rfloor + 2) \hspace{0.05cm} 2}&...&x_{(\lfloor k  \cdot N \rfloor + 2) \hspace{0.05cm} p}& y_{\lfloor k  \cdot N \rfloor + 2}\\
    &...&\\
    x_{N \hspace{0.05cm} 1 } & x_{N 2}&...&x_{N p}& y_{N}
    \end{pmatrix}=\begin{pmatrix}
    x_{1}^{test} & y_{1}^{test}\\
    x_{2}^{test} & y_{2}^{test}\\
    ....&...\\
    x_{\# D_{test}}^{test} & y_{\# D_{test}}^{test}\\
    \end{pmatrix} \hspace{0.1cm}=\hspace{0.1cm} \left[\hspace{0.1cm} X_1^{train} ,..., X_p^{train} , Y^{train}\hspace{0.1cm}\right] \\$$
 
    
    
        Donde:

        $\# D_{test}\hspace{0.1cm}$ es el número de **filas** de $\hspace{0.1cm}D_{test}$

        $\hspace{0.1cm} \lfloor \cdot \rfloor\hspace{0.1cm}$ es la funcion suelo, que dado un número como argumento te  devuelve el mayor entero menor que dicho número $\\[1cm]$


- Se entrena el modelo $\hspace{0.1cm} M\hspace{0.1cm}$ con la **muestra de train** $\hspace{0.1cm} D_{train}\hspace{0.1cm}$ $\hspace{0.25cm}\Rightarrow\hspace{0.25cm}$ $\widehat{M}\\$

- Se calcula una métrica de evaluación sobre el modelo entrenado $\hspace{0.1cm}\widehat{M}\hspace{0.1cm}$ usando la **muestra de test** $\hspace{0.1cm} D_{test}\hspace{0.1cm}$ $\hspace{0.2cm}\Rightarrow\hspace{0.2cm}$ Si por ejemplo se calcula el $\hspace{0.1cm}ECM\hspace{0.1cm}$ , se obtendria el $\hspace{0.1cm}ECM_{test}\\$



- La métrica de evaluación final del modelo es la obtenida en el paso anterior. 

    Si la métrica empleada en el paso anterior es el $\hspace{0.1cm}ECM\hspace{0.1cm}$ , entonces la métrica de evaluación calculada con el algoritmo de validación simple no aleatoria es la siguiente:

    $$ECM(M)_{test}^* \hspace{0.1cm}=\hspace{0.1cm} ECM(\widehat{M})_{test} \hspace{0.1cm}=\hspace{0.1cm} \dfrac{1}{\# D_{test}} \cdot \sum_{i=1}^{\# D_{test}} \hspace{0.1cm} \left( \hspace{0.1cm} y_i^{test} - \hat{y}_i^{test} \hspace{0.1cm}\right)^2 \\$$


    Donde:

    $$\hat{y}_i^{test} \hspace{0.1cm}=\hspace{0.1cm} \widehat{M}(\hspace{0.1cm} x_i^{test} \hspace{0.1cm}|\hspace{0.1cm} D_{train}) \hspace{0.1cm}=\hspace{0.1cm} M(\hspace{0.1cm} x_i^{test} \hspace{0.1cm}|\hspace{0.1cm} X_1^{train},...,X_p^{train},Y^{train})\hspace{0.1cm}=\hspace{0.1cm} \widehat{M}(\hspace{0.1cm} x_i^{test} \hspace{0.1cm})$$

</p>
 
</p></span>
</div>



<br>

**Problemas**

Toda la validación queda condicionada a solo una muestra de train y otra de test. Si alguna de estas muestras tienen defectos, estos se van a trasladar a la validación, que será por tanto defectuosa. Es la primera aproximación naive a los algoritmos de validación.


<br>

<br>

## Validación simple aleatoria

**Decripción no formal del algoritmo:**


Este algoritmo de validacion consiste en dividir el data-set inicial en una parte de train y otra de test de manera **aleatoria**.


Se obtiene una muestra aleatoria sin remplazo de un $\hspace{0.1cm} k\% \hspace{0.1cm}$ de las filas del data-set inicial, las cuales serán la parte de train, y el resto la parte de test.

El modelo es entrenado con la muestra train y testado calculando un métrica de evaluación con la muestra de test. Este valor de la métrica de evaluación es el que será usado para medir el poder predictivo del modelo y compararlo con otros modelos. 

<br>


**Decripción formal del algoritmo:**


El algoritmo de validación simple   aleatoria tiene los siguientes pasos: $\\[0.3cm]$



<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>

- Se divide $\hspace{0.1cm}D\hspace{0.1cm}$ en parte de train y parte de test del siguiente modo: $\\[0.4cm]$

    $\hspace{0.25cm}$ Sea $\hspace{0.1cm}k\in (0,1)\hspace{0.1cm}$ la proporción de filas de $\hspace{0.1cm}D\hspace{0.1cm}$ que formarán parte de la muestra de **train** (es un hiper-parametro del algoritmo): $\\[0.4cm]$

    - Se genera una muestra aleatoria sin reemplazamiento de tamaño $\hspace{0.1cm} \lfloor k  \cdot N \rfloor\hspace{0.1cm}$  del vector $\hspace{0.1cm}(1,2,...,N) \\$


    $$m=(m_1 ,m_2,...,m_{\lfloor k  \cdot N \rfloor}) \\$$

    - Las observaciones (filas) $\hspace{0.1cm}m=(m_1,m_2 ,...,m_{\lfloor k  \cdot N \rfloor})\hspace{0.1cm}$ de $\hspace{0.1cm}D\hspace{0.1cm}$  definen la muestra de train: $\\[0.4cm]$

      $$D_{train}= D[m , :] = \begin{pmatrix}
    x_{m_11}&x_{m_12}&...&x_{m_1p}& y_{m_1}\\
    x_{m_21}&x_{m_22}&...&x_{m_2p} & y_{m_2}\\
    &...&\\
    x_{m_{\lfloor k  \cdot N \rfloor} 1}&x_{m_{\lfloor k  \cdot N \rfloor}  2}&...&x_{m_{\lfloor k  \cdot N \rfloor} p}& y_{m_{\lfloor k  \cdot N \rfloor}}
    \end{pmatrix}  =  \begin{pmatrix}
    x_{1}^{train} & y_{1}^{train}\\
    x_{2}^{train} & y_{2}^{train}\\
    ....&...\\
    x_{\# D_{train}}^{train} & y_{\# D_{train}}^{train}\\
    \end{pmatrix} \\$$
    
    
      Donde:

        - $\# D_{train}\hspace{0.1cm}$ es el número de **filas** de $\hspace{0.1cm}D_{train} \\[1cm]$



    - Las observaciones (filas) de $\hspace{0.1cm}D\hspace{0.1cm}$ complementarias a  $\hspace{0.1cm}m\hspace{0.1cm}$ , es decir, las filas de $\hspace{0.1cm}D\hspace{0.1cm}$ que no estan en $\hspace{0.1cm}D_{train}\hspace{0.1cm}$, es decir, las filas de $\hspace{0.1cm}m^c\hspace{0.1cm}$,
 definen la muestra de test:  $\\[0.4cm]$
 
      $$D_{test} = D[m^c , :] =  \begin{pmatrix}
    x_{1}^{test} & y_{1}^{test}\\
    x_{2}^{test} & y_{2}^{test}\\
    ....&...\\
    x_{\# D_{test}}^{test} & y_{\# D_{test}}^{test}\\
    \end{pmatrix} \\$$



      Donde: 
 
       - $\# D_{test}\hspace{0.1cm}$ es el número de **filas** de $\hspace{0.1cm}D_{test}\\$

 
       - $\lfloor \cdot \rfloor\hspace{0.1cm}$ es la funcion suelo, que dado un número como argumento te  devuelve el mayor entero menor que dicho número $\\[0.5cm]$

       - $m^c \hspace{0.1cm}= \hspace{0.1cm}\left(\hspace{0.1cm} i =1,...,N \hspace{0.1cm}/\hspace{0.1cm} i\neq m_j \hspace{0.1cm},\hspace{0.1cm} \forall j=1,...,\lfloor k  \cdot N \rfloor \hspace{0.1cm} \right) \\[1cm]$


- Se entrena el modelo $\hspace{0.1cm}M\hspace{0.1cm}$ con la **muestra de train** $\hspace{0.1cm}D_{train}\hspace{0.1cm}$ $\hspace{0.1cm}\Rightarrow\hspace{0.2cm}$  $\widehat{M}\\$

- Se calcula una métrica de evaluación sobre el modelo entrenado $\hspace{0.1cm}\widehat{M}\hspace{0.1cm}$ con la **muestra de test** $\hspace{0.1cm}D_{test}$ $\hspace{0.2cm}\Rightarrow\hspace{0.2cm}$
  Si por ejemplo se calcula el $\hspace{0.1cm}ECM\hspace{0.1cm}$ , se obtendria el $\hspace{0.1cm}ECM_{test}(\widehat{M})\\$

- La métrica de evaluación final del modelo es la obtenida en el paso anterior: 

    Si la métrica empleada en el paso anterior fue el $\hspace{0.1cm}ECM\hspace{0.1cm}$ , entonces:

    $$ECM(M)_{test}^* \hspace{0.1cm}=\hspace{0.1cm} ECM(\widehat{M})_{test} \hspace{0.1cm}=\hspace{0.1cm} \dfrac{1}{\# D_{test}} \cdot \sum_{i=1}^{\# D_{test}} (y_i^{test} - \hat{y}_i^{test})$$


    Donde:

    - $\hat{y}_i^{test} \hspace{0.1cm}=\hspace{0.1cm} M(\hspace{0.1cm} x_i^{test} \hspace{0.1cm}|\hspace{0.1cm} D_{train})\hspace{0.1cm}=\hspace{0.1cm} M(\hspace{0.1cm} x_i^{test} \hspace{0.1cm}|\hspace{0.1cm} X_1^{train},...,X_p^{train},Y^{train})\hspace{0.1cm}=\hspace{0.1cm} \widehat{M}(\hspace{0.1cm} x_i^{test} \hspace{0.1cm})$

</p>
 
</p></span>
</div>



<br>

**Problemas**

Toda la validación queda condicionada a solo una muestra de train y otra de test. Si alguna de estas muestras tienen defectos, estos se van a trasladar a la validación, que será por tanto defectuosa. 

Ademas la métrica de evaluacion calculada por validación simple aleatoria tiene generalmente una varianza alta, en comparación con otros métodos de validación. Esto será ilustrado en la práctica.

La varianza de una metrica de evaluación calculada con un algorimo de validación se puede entender como como la varianza de los valores obtenidos de la métrica al ejecutar el algoritmo un número elevado de veces.

 Es la segunda aproximación naive a los algoritmos de validación.
 
<br>

<br>





## Validación simple aleatoria repetida


**Decripción no formal del algoritmo:**


Este algoritmo de validacion consiste en dividir el data-set inicial en una parte de train y otra de test de manera aleatoria.


Se obtiene una muestra aleatoria sin remplazo de un $\hspace{0.1cm}k\%\hspace{0.1cm}$ de las filas del data-set inicial, las cuales serán la parte de train, y el resto la parte de test.

El modelo es enetrenado con la muestra train y testado con la muestra test a través de una métrica de evaluación como las vistas en la sección anterior.

Este proceso se repite un número $\hspace{0.1cm}B\hspace{0.1cm}$ de veces, asi se obtienen $\hspace{0.1cm}B\hspace{0.1cm}$ valores de la métrica de evaluación.

La métrica de evaluacion calculada usando este método de validación es la media de dichos $\hspace{0.1cm}B\hspace{0.1cm}$ valores obtenidos para la métrica de evaluación escogida. Este valor medio final es la que será usado para medir el poder predictivo del modelo y compararlo con otros modelos.
 
 
<br>


**Decripción formal del algoritmo:**



El algoritmo de validación simple aleatoria tiene los siguientes pasos: $\\[0.4cm]$

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>


- Se obtienen $\hspace{0.1cm}B\hspace{0.1cm}$ particiones de la muestra de observaciones $\hspace{0.1cm}D\hspace{0.1cm}$ en parte de **train** y parte de **test** del siguiente modo: $\\[0.4cm]$
   
   
   
    $\hspace{0.25cm}$   Sea $\hspace{0.1cm}k\in (0,1)\hspace{0.1cm}$ la proporción de filas de $\hspace{0.1cm}D\hspace{0.1cm}$ que formarán parte de la muestra de **train** : $\\[0.4cm]$


    - Se generan $\hspace{0.1cm}B\hspace{0.1cm}$  muestras aleatoria sin reemplazamiento de tamaño $\hspace{0.1cm}\lfloor k  \cdot N \rfloor\hspace{0.1cm}$  del vector $\hspace{0.1cm}(1,2,...,N)\hspace{0.1cm}$ :

      $$m_1 \hspace{0.1cm},\hspace{0.1cm} m_2 \hspace{0.1cm},\hspace{0.1cm} ...\hspace{0.1cm},\hspace{0.1cm} m_B \\[0.4cm]$$

 
      Donde: 

      $\hspace{0.25cm}m_r=(m_{r1} ,...,m_{r\lfloor k  \cdot N \rfloor})\hspace{0.15cm} \hspace{0.25cm} , \hspace{0.25cm} \forall \hspace{0.1cm} r\in\lbrace 1,...,B\rbrace$


      $\hspace{0.25cm}\lfloor \cdot \rfloor\hspace{0.1cm}$ es la función suelo, que dado un número como argumento devuelve el mayor entero menor que dicho número. $\\[1cm]$

    - Se obtienen las siguientes $\hspace{0.1cm}B\hspace{0.1cm}$ **muestras de train** del data-set original $\hspace{0.1cm}D \\$ 

      $$D_{train, 1}= D[\hspace{0.1cm}m_1\hspace{0.1cm} ,\hspace{0.1cm} :\hspace{0.1cm}] \hspace{0.15cm},\hspace{0.15cm} D_{train, 2}= D[\hspace{0.1cm}m_2\hspace{0.1cm} ,\hspace{0.1cm} :\hspace{0.1cm}] \hspace{0.15cm}, \dots ,\hspace{0.15cm} D_{train, B}= D[\hspace{0.1cm}m_B\hspace{0.1cm} ,\hspace{0.1cm} :\hspace{0.1cm}] \\$$

      Donde: 


      $$D_{train, r} \hspace{0.1cm}=\hspace{0.1cm} D[\hspace{0.1cm}m_r\hspace{0.1cm} ,\hspace{0.1cm} :\hspace{0.1cm}] \hspace{0.1cm}=\hspace{0.1cm} \begin{pmatrix}
    x_{m_{r1},1} & x_{m_{r1},2} & ... & x_{m_{r1},p} & y_{m_{r1}} \\
    x_{m_{r1},1} & x_{m_{r1},2} & ... & x_{m_{r1},p} & y_{m_{r2}} \\
    ....&...\\
    x_{m_{r\lfloor k  \cdot N \rfloor} ,1} & x_{m_{r\lfloor k  \cdot N \rfloor},2} & ... & x_{m_{r\lfloor k  \cdot N \rfloor},p} & y_{m_{r\lfloor k  \cdot N \rfloor}} \end{pmatrix} = \begin{pmatrix}
    x_{1}^{train, r} & y_{1}^{train, r}\\
    x_{2}^{train, r} & y_{2}^{train, r}\\
    ....&...\\
    x_{\# D_{train, r}}^{train, r} & y_{\# D_{train, r}}^{train, r}
    \end{pmatrix} \\$$ 
    
    $\hspace{0.4cm}$ es la submatriz que resulta de quedarse solo con las filas de $\hspace{0.1cm}D\hspace{0.1cm}$ definidas por la muestra $\hspace{0.1cm}m_r\hspace{0.1cm}$ de $\hspace{0.1cm}(1,...,N) \\[1cm]$




    - Se obtienen las siguientes $\hspace{0.1cm}B\hspace{0.1cm}$ **muestras de test** del data-set original $\hspace{0.1cm}D \\$


      $$D_{test, 1}= D[\hspace{0.1cm}m_1^c\hspace{0.1cm} ,\hspace{0.1cm} :\hspace{0.1cm}] \hspace{0.15cm},\hspace{0.15cm} D_{test, 2}= D[\hspace{0.1cm}m_2^c\hspace{0.1cm} ,\hspace{0.1cm} :\hspace{0.1cm}] \hspace{0.15cm}, ... ,\hspace{0.15cm} D_{test, B}= D[\hspace{0.1cm}m_B^c\hspace{0.1cm} , \hspace{0.1cm}:\hspace{0.1cm}] \\$$


      Donde:

 

      $$D_{test, r} \hspace{0.1cm}=\hspace{0.1cm} D[\hspace{0.1cm}m_r^c\hspace{0.1cm} ,\hspace{0.1cm} :\hspace{0.1cm}]\hspace{0.1cm}=\hspace{0.1cm}  \begin{pmatrix}
    x_{1}^{test, r} & y_{1}^{test, r}\\
    x_{2}^{test, r} & y_{2}^{test, r}\\
    ....&...\\
    x_{\# D_{test, r}}^{test, r} & y_{\# D_{test, r}}^{test, r} 
    \end{pmatrix} \\$$ 
    
      $\hspace{0.4cm}$ es la submatriz que resulta de quedarse solo con las filas de $\hspace{0.1cm}D\hspace{0.1cm}$ que no están en $\hspace{0.1cm}D_{train}\hspace{0.1cm}$, es decir, las filas de $\hspace{0.1cm}m_r^c \\$
    
      Formalmente:  $\hspace{0.15cm} m_r^c \hspace{0.1cm}=\hspace{0.1cm}\left(\hspace{0.1cm} i \in \lbrace 1,...,N \rbrace \hspace{0.15cm} / \hspace{0.15cm} i\hspace{0.1cm}\neq\hspace{0.1cm} m_{rj} \hspace{0.15cm} , \hspace{0.15cm} \forall \hspace{0.1cm} j\in \lbrace 1,...,\lfloor k  \cdot N \rfloor \rbrace \hspace{0.1cm} \right) \hspace{0.15cm}$ es el complementario de $\hspace{0.1  cm}m_r \\[0.5cm]$

 
      Por tanto se obtienen $\hspace{0.1cm}B\hspace{0.1cm}$ particiones de **train** y **test** de $\hspace{0.1cm}D \\[1cm]$


- Para cada $\hspace{0.1cm}r\in \lbrace 1,...,B\rbrace \\$ 

    - Se entrena el modelo $\hspace{0.1cm}M\hspace{0.1cm}$ con cada una de las **muestras de train** $\hspace{0.1cm} D_{train,r} \hspace{0.1cm}$  $\hspace{0.2cm}\Rightarrow\hspace{0.2cm}$ $\hspace{0.1cm}\widehat{M}_r \\$

    - Se calcula una misma métrica de evaluación sobre el modelo entrenado $\hspace{0.1cm}\widehat{M}_r\hspace{0.1cm}$ con la **muestra de test** $\hspace{0.1cm}D_{test,r} \\$ 

    Supongamos que la métrica de evaluación usada es el $\hspace{0.1cm}ECM\hspace{0.1cm}$ , entonces se obtienen $\hspace{0.1cm}B\hspace{0.1cm}$ valores de esta métrica :

    $$ECM_{test }(\widehat{M}_1) \hspace{0.1cm},\hspace{0.1cm}  ECM_{test }(\widehat{M}_2)\hspace{0.1cm} , ... ,\hspace{0.1cm} ECM_{test}(\widehat{M}_B)\\$$

     Donde: 

     - $ECM_{test , r}\hspace{0.1cm}$ es el $\hspace{0.1cm}ECM\hspace{0.1cm}$ calculado sobre $\hspace{0.1cm}\widehat{M}_r\hspace{0.1cm}$ usando $\hspace{0.1cm}D_{test,r}\\$ 

    $$ECM_{test }(\widehat{M}_r) \hspace{0.1cm}=\hspace{0.1cm} \dfrac{1}{\# D_{test,r}} \cdot \sum_{i=1}^{\# D_{test,r}} \hspace{0.1cm} (\hspace{0.1cm} y_i^{\hspace{0.1cm}test,r} - \hat{\hspace{0.1cm}y\hspace{0.1cm}}_i^{\hspace{0.1cm}test,r} \hspace{0.1cm})^2 \\$$





     Teniendo en cuenta que:

     - $\hat{y}_i^{test,r} \hspace{0.1cm}=\hspace{0.1cm} M(\hspace{0.1cm} x_i^{test, r} \hspace{0.1cm}|\hspace{0.1cm} D_{train,r}) \hspace{0.1cm}=\hspace{0.1cm} \widehat{M}_r (\hspace{0.1cm} x_i^{test, r} \hspace{0.1cm} ) \\[1cm]$


 


- Se calcula la métrica final de evaluación del modelo como el promedio de las $\hspace{0.1cm}B\hspace{0.1cm}$ métricas calculadas en el apartado anterior. 

    Si la métrica usada en el apartado anterior es el ECM, entonces: $\\[0.4cm]$

    $$ECM_{test}^{\hspace{0.08cm}*}( {M}) = \dfrac{1}{B} \cdot \sum_{r=1}^B ECM_{test}(\widehat{M}_r)$$


</p>
 
</p></span>
</div>



<br>

**Ventajas**

Permite reducir la varianza de la métrica de validación. En la validación simple aleatoria no repetida la métrica de validación obtenida usando validacion simple tiene mayor varianza, en el sentido de que si se implementa el algoritmo un número elevado de veces, la varianza de los valores obtenidos de la métrica es mayor si se aplica el mismo procedimiento con validación simple aleatoria repetida. Esto será ilustrado en la práctica.

<br>


## Leave-one-out

El algoritmo de validación leave-one-out tiene los siguientes pasos: $\\[0.3cm]$

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>


- Se obtienen $\hspace{0.1cm} B\hspace{0.1cm}$ particiones de $\hspace{0.1cm} D\hspace{0.1cm}$ en parte de train y parte de test del siguiente modo: $\\[0.5cm]$

- Se obtienen las siguientes $\hspace{0.1cm}B\hspace{0.1cm}$ **muestras  test** del data-set original $\hspace{0.1cm}D \\$ 

    $$D_{test,1}=D[1, :] \hspace{0.1cm} ,\hspace{0.15cm} D_{test,2}=D[2, :]\hspace{0.15cm},...,\hspace{0.15cm} D_{test,B}=D[B, :] \\$$

    Donde:

    -  $D_{test,r}=D[\hspace{0.1cm}r\hspace{0.1cm}, \hspace{0.1cm}:\hspace{0.1cm}]\hspace{0.1cm}$ es la submatriz que resulta de considerar solo la fila $r$ de $D$ , es decir, es la observación $r$-esima del data-set inicial $\hspace{0.1cm}D \\$

    $$D_{test,r} \hspace{0.1cm}=\hspace{0.1cm} D[\hspace{0.1cm}r\hspace{0.1cm},\hspace{0.1cm} :\hspace{0.1cm}] \hspace{0.1cm}=\hspace{0.1cm} (x_{i1} , ..., x_{rp} , y_r)=(x_r \hspace{0.1cm} ,\hspace{0.1cm}  y_r) \\[1cm]$$



- Se obtienen las siguientes $\hspace{0.1cm}B\hspace{0.1cm}$ **muestras  train** del data-set original $\hspace{0.1cm}D \\$

    $$D_{train,1}=D[\hspace{0.1cm}-1 \hspace{0.1cm},\hspace{0.1cm} :\hspace{0.1cm}] \hspace{0.2cm},\hspace{0.2cm} D_{train,2}=D[\hspace{0.1cm}-2\hspace{0.1cm}, \hspace{0.1cm}:\hspace{0.1cm}]\hspace{0.2cm},...,\hspace{0.2cm} D_{train,B}=D[\hspace{0.1cm}-B\hspace{0.1cm},\hspace{0.1cm} :\hspace{0.1cm}] \\$$


    Donde:
      

    - $D_{train,r}\hspace{0.1cm}=\hspace{0.1cm}D[\hspace{0.1cm}-r\hspace{0.1cm},\hspace{0.1cm} :\hspace{0.1cm}]\hspace{0.15cm}$ es la submatriz que resulta de eliminar la fila $i$ de $\hspace{0.1cm} D\hspace{0.1cm}$, es decir: $\\[1cm]$


    $$D_{train,r}\hspace{0.1cm}=\hspace{0.1cm}D[\hspace{0.1cm}-r\hspace{0.1cm},\hspace{0.1cm} :\hspace{0.1cm}] \hspace{0.1cm}= \hspace{0.1cm}\begin{pmatrix}
    x_{11}&x_{12}&...&x_{1p}& y_1\\
    ...&...&...&...&...\\
    x_{(r-1)1}&x_{(r-1)2}&...&x_{(r-1)p} & y_{(r-1)}\\
    x_{(r+1)1}&x_{(r+1)2}&...&x_{(r+1)p} & y_{(r+1)}\\
    &...&\\
    x_{N1}&x_{N2}&...&x_{Np}& y_N
    \end{pmatrix}=\begin{pmatrix}
    x_{1}& y_1\\
    ...&...\\
    x_{(r-1)}&y_{(r-1)}\\
    x_{(r+1)}& y_{(r+1)}\\
    &...&\\
    x_{N}& y_N
    \end{pmatrix}$$  
    
     $\\[0.7cm]$


    
- Para $\hspace{0.1cm}r\in \lbrace 1,...,B \rbrace \hspace{0.1cm} \\$

    - Se entrena el modelo $\hspace{0.1cm}M\hspace{0.1cm}$ con la **muestra de train** $\hspace{0.1cm} D_{train,r}\hspace{0.1cm}$  $\hspace{0.1cm}\Rightarrow\hspace{0.1cm}$ $\hspace{0.1cm}\widehat{M}_r \\$

    - Se calcula una misma métrica de evaluación sobre el modelo entrenado $\hspace{0.1cm}\widehat{M}_r\hspace{0.1cm}$ con la **muestra de test** $\hspace{0.1cm}D_{test,r}\hspace{0.1cm} \\$ 

    Supongamos que la métrica de evaluación usada es el $\hspace{0.1cm}ECM\hspace{0.1cm}$ , entonces se obtienen $\hspace{0.1cm}B\hspace{0.1cm}$ valores de esta métrica :
  
    $$ECM(\widehat{M}_1)_{test } \hspace{0.1cm} ,\hspace{0.1cm}   ECM(\widehat{M}_2)_{test } \hspace{0.1cm} , ... ,\hspace{0.1cm}  ECM(\widehat{M}_B)_{test}\\$$

    Donde: 

    - $\hspace{0.1cm} ECM_{test , r}\hspace{0.1cm}$ es el $\hspace{0.1cm}ECM\hspace{0.1cm}$ calculado sobre $\hspace{0.1cm}\widehat{M}_r\hspace{0.1cm}$ usando $\hspace{0.1cm}D_{test,r} \\$ 

    $$ECM(\widehat{M}_r)_{test } =  (\hspace{0.1cm} y_r - \hat{y}_r \hspace{0.1cm})^2$$

    $\hspace{0.2cm}$ Teniendo en cuenta que:

    - $\hat{y}_r \hspace{0.1cm}=\hspace{0.1cm} M(\hspace{0.1cm} x_r \hspace{0.1cm}|\hspace{0.1cm} D_{train,r}) \hspace{0.1cm}=\hspace{0.1cm} \widehat{M}_r (\hspace{0.1cm} x_r \hspace{0.1cm} ) \\$
    
    - $y_r\hspace{0.1cm}$ es la única observación de la muestra de test $\hspace{0.1cm} r$-esima de la variable respuesta. $\\[1cm]$

 
- Se calcula la métrica final de evaluación del modelo como el promedio de las $\hspace{0.1cm}B\hspace{0.1cm}$ métricas calculadas en el paso anterior. 

    Si la métrica  usada es el $\hspace{0.1cm}ECM\hspace{0.1cm}$, entonces:

    $$ECM( M )_{test}^{\hspace{0.08cm}*} \hspace{0.1cm}=\hspace{0.1cm} \dfrac{1}{B} \cdot \sum_{r=1}^B \hspace{0.1cm} ECM(\widehat{M}_r)_{test}$$
   
   
</p>
 
</p></span>
</div>   
    
<br>

**Ventaja**

Una vez aplicado el algoritmo todas las observaciones han formado parte de conjunto de train (en alguna iteracion), y lo mismo para el conjunto de test.

<br>

**Problema**

Algunos autores (vease la referencia 1) consideran que, al emplearse todas las observaciones como entrenamiento, se puede estar cayendo en overfitting (sobre-ajuste).
    
    
    
    
    
    
    
<br>
    
    
<br>

## k-fold


**Decripción no formal del algoritmo:**


Este algoritmo de validacion consiste en dividir el data-set inicial en $\hspace{0.1cm} k\hspace{0.1cm}$ partes, y usar de manera secuencial cada una de esas partes como muestra test, y las union de las partes restantes como muestra train.

Por tanto con este método se usan $\hspace{0.1cm}k\hspace{0.1cm}$ muestras de test y de train.

El modelo es entrenado secuencialmente con cada una de las $\hspace{0.1cm}k\hspace{0.1cm}$ muestras de train disitntas, y se testea con la correspondiente muestra de test (que es el complementario de la de train), usando una métrica de evaluacion.

Es decir, tras dividir el data-set inicial en $\hspace{0.1cm}k\hspace{0.1cm}$ partes la parte 1 se usa como test y el resto como train, se calcula la metrica de evaluacion. Luego la parte 2 se usa como test y el resto como train, y se calcula la metrica de evaluacion. Asi sucesivamente hasta haber usado las $\hspace{0.1cm}k\hspace{0.1cm}$ partes como muestras de test.

Tras este proceso se habrán obtenido $\hspace{0.1cm}k\hspace{0.1cm}$ valores de dicha métrica de evaluacion.

La métrica de evaluacion calculada usando este método de validación es la media de dichos $\hspace{0.1cm}k\hspace{0.1cm}$ valores obtenidos para la métrica de evaluación escogida. Este valor medio final es la que será usado para medir el poder predictivo del modelo y compararlo con otros modelos.

<br>


**Decripción formal del algoritmo:**



El algoritmo de validación k-folds tiene los siguientes pasos:

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>

- Se divide aleatoriamente el data-set inicial $\hspace{0.1cm}D\hspace{0.1cm}$  en $\hspace{0.1cm}k\hspace{0.1cm}$ partes de manera que  cada parte tenga aproximadamente el mismo número de observaciones (sean lo mas balanceadas posibles).

    - Existen diferentes métodos para hacer esta división. La problematica de la división es cómo hacer que las partes resultantes estén lo más balanceadas posibles respecto al numero de observaciones que contienen. $\\[0.7cm]$

    - Hemos desarrollado un método basado en cuantiles que permite obtener este balanceo, el cual ha sido implementado en `Python` con buenos resultados en este aspecto, como se podrá ver posteriormente en la parte de implementación. $\\[0.7cm]$


    -  Vamos a explicar la mecánica del método ideado: $\\[0.2cm]$


       - Obtenemos una muestra aleatoria sin remplazamiento $\hspace{0.1cm}m=(m_1,...,m_N)\hspace{0.1cm}$ de tamaño $N$ del vector  $\hspace{0.1cm}(1,...,N) \\$

       - El siguiente paso es dividir la muestra $\hspace{0.1cm}m\hspace{0.1cm}$ en $\hspace{0.1cm}k\hspace{0.1cm}$ partes lo mas balanceadas posibles. No queremos que unas partes tenga muchos elementos, y otras pocos. Queremos que la repartición  de los elementos de $\hspace{0.1cm}m\hspace{0.1cm}$ en las $\hspace{0.1cm}k\hspace{0.1cm}$ partes sea lo mas igualitaria posible. $\\[0.5cm]$


       - La idea es que si, por ejemplo $\hspace{0.1cm}k=10\hspace{0.1cm}$, cada una de las 10 partes en las que dividimos $\hspace{0.1cm}m\hspace{0.1cm}$ tenga un 10% de los elementos totales de $m \\$

       - Si $\hspace{0.1cm}k=4\hspace{0.1cm}$  se busca que cada una de las 4 partes en las que dividimos $\hspace{0.1cm}m\hspace{0.1cm}$ tenga el 25% de los elementos de $\hspace{0.1cm}m . \\$

       - En general, se busca que cada una de las $\hspace{0.1cm} k\hspace{0.1cm}$ partes en las que dividimos $\hspace{0.1cm}m\hspace{0.1cm}$ tengan $\hspace{0.1cm}(1/k)\cdot 100 \%\hspace{0.1cm}$ de elementos de $\hspace{0.1cm}m\hspace{0.1cm}$, es decir, $\hspace{0.1cm} N/k\hspace{0.1cm}$ elementos de $\hspace{0.1cm}m\hspace{0.1cm}$ , puesto que m tiene N elementos. $\\[0.5cm]$



       - Una forma de hacer esto es usando los cuantiles $\hspace{0.1cm} Q_0 \hspace{0.1cm} , \hspace{0.1cm}  Q_{1/k} \hspace{0.1cm} ,\hspace{0.1cm}  Q_{2/k} \hspace{0.1cm} ,...,\hspace{0.1cm} Q_{(k-1)/k}\hspace{0.1cm} ,\hspace{0.1cm}  Q_1\hspace{0.1cm}$  del vector $\hspace{0.1cm}(1,...,N)\hspace{0.1cm}$ como los limites que definen las partes en las que dividiremos $\hspace{0.1cm} m=(m_1,...,m_N) \\$

       - Dichos cuantiles permiten separar $\hspace{0.1cm} m \hspace{0.1cm}$ en $\hspace{0.1cm} k \hspace{0.1cm}$ partes de un tamaño aproximadamente igual. $\\[0.5cm]$

       - Si $\hspace{0.1cm} k=10\hspace{0.1cm}$, entonces esos cuantiles serian $\hspace{0.1cm} Q_0 \hspace{0.1cm},\hspace{0.1cm} Q_{0.1} \hspace{0.1cm},\hspace{0.1cm} Q_{0.2} \hspace{0.1cm}, ...,\hspace{0.1cm} Q_{0.8} \hspace{0.1cm},\hspace{0.1cm} Q_{0.9} \hspace{0.1cm},\hspace{0.1cm} Q_1 \\$

       - Si $\hspace{0.1cm} k=4\hspace{0.1cm}$ , los cuantiles serían $\hspace{0.1cm} Q_0 \hspace{0.1cm},\hspace{0.1cm} Q_{0.25} \hspace{0.1cm},\hspace{0.1cm} Q_{0.5} \hspace{0.1cm},\hspace{0.1cm}  Q_{0.75} \hspace{0.1cm},\hspace{0.1cm} Q_1\hspace{0.1cm} \\$

          Notese que: $\hspace{0.2cm} Q_0 = Min(1,...,N) = 1\hspace{0.2cm}$ y $\hspace{0.2cm} Q_1=Max(1,...,N)=N \\[0.6cm]$




    - Definimos las $\hspace{0.1cm} k\hspace{0.1cm}$ particiones de $\hspace{0.1cm} m \hspace{0.1cm}$ usando los cuantiles $\hspace{0.15cm} Q_0=1 \hspace{0.1cm},\hspace{0.1cm} Q_{1/k} \hspace{0.1cm},\hspace{0.1cm} Q_{2/k}\hspace{0.1cm},...,\hspace{0.1cm}Q_{(k-1)/k}\hspace{0.1cm},\hspace{0.1cm} Q_1=N\hspace{0.2cm}$ como sigue: $\\[0.8cm]$

      $\hspace{2cm} p_{1,m} \hspace{0.1cm}=\hspace{0.1cm} m\left[\hspace{0.1cm}1:(\lfloor Q_{1/k} \rfloor -1)\hspace{0.1cm}\right]\hspace{0.1cm}=\hspace{0.1cm}(m_1,...,m_{\lfloor  Q_{1/k} \rfloor - 1} ) \\$

      $\hspace{2cm} p_{2,m} \hspace{0.1cm}=\hspace{0.1cm} m\left[\hspace{0.1cm}\lfloor Q_{1/k} \rfloor:(\lfloor Q_{2/k} \rfloor-1)\hspace{0.1cm}\right]\hspace{0.1cm}=\hspace{0.1cm}(m_{\lfloor  Q_{1/k} \rfloor},...,m_{\lfloor  Q_{2/k} \rfloor - 1})$

      $\hspace{2.4cm} \dots \\$

      $\hspace{2cm} p_{k,m} \hspace{0.1cm}=\hspace{0.1cm} m\left[\hspace{0.1cm}\lfloor Q_{(k-1)/k} \rfloor : N\hspace{0.1cm}\right]\hspace{0.1cm}=\hspace{0.1cm}(m_{\lfloor  Q_{(k-1)/k} \rfloor},...,m_{N})\\[1cm]$



    - Se puede demostrar que $\hspace{0.1cm} p_{1,m}\hspace{0.1cm},...,\hspace{0.1cm} p_{k,m}\hspace{0.1cm}$ tienen un nº de elementos aproximadamente igual , por lo que son particiones aproximadamente igualitarias (balanceadas), que era lo que buscabamos. $\\[0.7cm]$

    - La siguiente matriz ilustra por qué este método funciona: $\\[0.7cm]$

    $$\begin{pmatrix}
    1 & m_1\\
    2 & m_2\\
    ... & ... \\
    \lfloor  Q_{1/k} \rfloor - 1  & m_{\lfloor  Q_{1/k} \rfloor - 1} \\
    ----- & ----- \\
    \lfloor  Q_{1/k} \rfloor  & m_{\lfloor  Q_{1/k} \rfloor} \\
    ... & ... \\
    \lfloor  Q_{2/k} \rfloor - 1  & m_{\lfloor  Q_{2/k} \rfloor - 1} \\
    ----- & -----\\
    \lfloor  Q_{2/k} \rfloor  & m_{\lfloor  Q_{2/k} \rfloor} \\
    ... & ... \\
     \lfloor  Q_{3/k} \rfloor - 1  & m_{\lfloor  Q_{3/k} \rfloor - 1} \\
    ----- & -----\\
    ... & ... \\
    ... & ... \\
    ----- & -----\\
    \lfloor  Q_{(k-1)/k} \rfloor  & m_{\lfloor  Q_{(k-1)/k} \rfloor} \\
    ... & ... \\
    N & m_N 
    \end{pmatrix}\hspace{0.1cm} = \hspace{0.1cm} \begin{pmatrix}
    ... & ...\\
    ... & ...\\
    \text{Parte 1} \hspace{0.15cm}(p_{1,m})  & \hspace{0.2cm} \approx N/k \hspace{0.15cm} \text{elementos} \\
    ... & ...\\
    ----- & -----\\
    ... & ...\\ 
    \text{Parte 2}\hspace{0.15cm}(p_{2,m}) & \hspace{0.2cm} \approx N/k \hspace{0.15cm} \text{elementos}  \\
    ... & ...\\
    ----- & -----\\ 
    ... & ...\\
       \text{Parte 3}\hspace{0.15cm}(p_{3,m}) & \hspace{0.2cm} \approx N/k \hspace{0.15cm} \text{elementos} \\
    ... & ...\\
    ----- & -----\\
    ... & ...\\
    ... & ...\\
    ----- & -----\\
    ... & ...\\
    \text{Parte k}\hspace{0.15cm}(p_{k,m}) & \hspace{0.2cm} \approx N/k \hspace{0.15cm} \text{elementos} \\
    ... & ...\\
    \end{pmatrix}$$
    
 $\\[0.3cm]$
 
- Se obtienen la siguientes $\hspace{0.1cm}k\hspace{0.1cm}$ muestras de test: $\\[0.4cm]$


    $$D_{test, 1} \hspace{0.1cm}=\hspace{0.1cm} D[\hspace{0.1cm} p_{1,m} \hspace{0.1cm} ,\hspace{0.1cm} : \hspace{0.1cm}] \hspace{0.1cm}=\hspace{0.1cm} D[\hspace{0.12cm}m[1:(\lfloor Q_{1/k} \rfloor -1)] \hspace{0.12cm},\hspace{0.12cm} : \hspace{0.12cm}]$$

    $$D_{test, 2} \hspace{0.1cm}=\hspace{0.1cm} D[\hspace{0.1cm}p_{2,m} \hspace{0.1cm} ,\hspace{0.1cm} :\hspace{0.1cm}] \hspace{0.1cm}=\hspace{0.1cm} D[\hspace{0.12cm}m[\lfloor Q_{1/k} \rfloor : (\lfloor Q_{2/k} \rfloor - 1 )]\hspace{0.12cm} ,\hspace{0.12cm}:\hspace{0.12cm}]$$

    $$\dots$$
 

    $$D_{test, k}\hspace{0.1cm} =\hspace{0.1cm} D[\hspace{0.1cm}p_{k,m} \hspace{0.12cm} ,\hspace{0.12cm} :\hspace{0.12cm}] \hspace{0.1cm}=\hspace{0.1cm} D[\hspace{0.12cm}m[\lfloor Q_{(k-1)/k} \rfloor : N]\hspace{0.12cm} ,\hspace{0.12cm} :\hspace{0.12cm}] \\[0.7cm]$$

    Siguiendo la notación habitual del articulo, podemos expresar: $\\[0.6cm]$

$$
  D_{test, r} \hspace{0.1cm}=\hspace{0.1cm}\begin{pmatrix}
  x_{1}^{test, r} & y_{1}^{test, r}\\
    x_{2}^{test, r} & y_{2}^{test, r}\\
    ....&...\\
    x_{\# D_{test, r}}^{test, r} & y_{\# D_{test, r}}^{test, r} 
    \end{pmatrix}$$

$\\[0.3cm]$


- Se obtiene las siguientes $\hspace{0.1cm}k\hspace{0.1cm}$ muestras de train: $\\[0.4cm]$


    $$D_{train, 1} \hspace{0.1cm}=\hspace{0.1cm} D[\hspace{0.12cm}-\hspace{0.12cm}p_{1,m} \hspace{0.12cm},\hspace{0.12cm} :\hspace{0.12cm}] \hspace{0.1cm}=\hspace{0.1cm} D[\hspace{0.12cm}-\hspace{0.12cm} m[1:(\lfloor Q_{1/k} \rfloor -1)] \hspace{0.12cm},\hspace{0.12cm}:\hspace{0.12cm}]$$

    $$D_{train, 2} \hspace{0.1cm}=\hspace{0.1cm} D[\hspace{0.12cm}-\hspace{0.12cm} p_{2,m} \hspace{0.12cm},\hspace{0.12cm} :\hspace{0.12cm}] \hspace{0.1cm}=\hspace{0.1cm} D[\hspace{0.12cm}-\hspace{0.12cm}m[\lfloor Q_{1/k} \rfloor : (\lfloor Q_{2/k} \rfloor - 1 )] \hspace{0.12cm},\hspace{0.12cm}:\hspace{0.12cm}]$$

    $$\dots$$
 

    $$D_{train, k} \hspace{0.1cm}=\hspace{0.1cm} D[\hspace{0.12cm}-\hspace{0.12cm} p_{k,m} \hspace{0.12cm},\hspace{0.12cm} : \hspace{0.12cm}] \hspace{0.1cm}=\hspace{0.1cm} D[\hspace{0.12cm}-\hspace{0.12cm} m[\lfloor Q_{(k-1)/k} \rfloor : N] \hspace{0.12cm},\hspace{0.12cm} : \hspace{0.12cm}] \\$$


    Siguiendo la notación habitual del articulo, podemos expresar: $\\[0.6cm]$

    $$  D_{train, r} =\begin{pmatrix}   x_{1}^{train, r} & y_{1}^{train, r}\\
    x_{2}^{train, r} & y_{2}^{train, r}\\
    ....&...\\
    x_{\# D_{train, r}}^{train, r} & y_{\# D_{train, r}}^{train, r} 
    \end{pmatrix}$$


$\\[0.2cm]$

- Para $\hspace{0.1cm}r \in \lbrace 1,...,k \rbrace\hspace{0.1cm}$ 


    - Se entrena el modelo $\hspace{0.1cm}M\hspace{0.1cm}$ con la **muestra de train** $\hspace{0.1cm} D_{train,r}$  $\hspace{0.2cm}\Rightarrow\hspace{0.2cm}$ $\hspace{0.1cm}\widehat{M}_r \\$

    - Se calcula una misma métrica de evaluación sobre el modelo entrenado $\hspace{0.1cm}\widehat{M}_r\hspace{0.1cm}$ con la **muestra de test** $\hspace{0.1cm}D_{test,r}\hspace{0.1cm} \\$

    Supongamos que la métrica de evaluación usada es el $\hspace{0.1cm}ECM\hspace{0.1cm}$ , entonces se obtienen $\hspace{0.1cm}k\hspace{0.1cm}$ valores de esta métrica :

    $$ECM_{test }\left(\widehat{M}_1\right) \hspace{0.1cm},\hspace{0.1cm}  ECM_{test }\left(\widehat{M}_2\right) \hspace{0.1cm}, ... ,\hspace{0.1cm} ECM_{test}\left( \widehat{M}_k \right)\\$$

    Donde: 
    
    - $ECM_{test , r}\hspace{0.1cm}$ es el $\hspace{0.1cm}ECM\hspace{0.1cm}$ calculado sobre $\hspace{0.1cm}\widehat{M}_r\hspace{0.1cm}$ usando $\hspace{0.1cm}D_{test,r}\hspace{0.1cm} \\$ 

    $$ECM_{test }\left( \hspace{0.05cm} \widehat{M}_r \hspace{0.05cm}\right) \hspace{0.1cm}=\hspace{0.1cm} \dfrac{1}{\# D_{test, r}} \cdot \sum_{i=1}^{\# D_{test, r}} \hspace{0.1cm} \left( \hspace{0.1cm} y_i^{\hspace{0.1cm}test,r} - \hat{\hspace{0.1cm}y\hspace{0.1cm}}_i^{\hspace{0.1cm}test,r} \hspace{0.1cm} \right)^2 \\$$

    Teniendo en cuenta que :

    - $\hat{\hspace{0.1cm}y\hspace{0.1cm}}_i^{\hspace{0.1cm}test,r} \hspace{0.1cm}=\hspace{0.1cm} M\left(\hspace{0.1cm} x_i^{test, r} \hspace{0.1cm}|\hspace{0.1cm} D_{train,r} \right) \hspace{0.1cm}=\hspace{0.1cm} \widehat{M}_r \left(\hspace{0.1cm} x_i^{test, r} \hspace{0.1cm} \right) \\[0.7cm]$
    
    - $x_i^{\hspace{0.1cm}test,r}\hspace{0.1cm}$ es la observación $\hspace{0.1cm}i$-esima de la muestra de test $\hspace{0.1cm}r$-esima de los predictores. $\\[0.7cm]$
    
    - $y_i^{\hspace{0.1cm}test,r}\hspace{0.1cm}$ es la observación $\hspace{0.1cm}i$-esima de la muestra de test $\hspace{0.1cm}r$-esima de la variable respuesta. $\\[1.5cm]$

    

- Se calcula la métrica final de evaluación del modelo como el promedio de las $\hspace{0.1cm}k\hspace{0.1cm}$ métricas calculadas en el paso anterior. Si la métrica usada fuera el ECM, entonces:

    $$ECM( {M})_{test}^{\hspace{0.08cm}*} \hspace{0.1cm}=\hspace{0.1cm} \dfrac{1}{k} \cdot \sum_{r=1}^k ECM_{test}(\widehat{M}_r)$$
    

</p>
 
</p></span>
</div>


<br>


**Ventajas**

La metrica de validacion calculada por k-fold tiene menor varianza que con los métodos anteriores, luego es el mas preciso de todos ellos.



<br>

## Repeted k-fold



Este algoritmo consiste en **repetir** el algoritmo **k-fold** un número $\hspace{0.1cm} B \hspace{0.1cm}$ de veces.

No vamos a hacer aquí una descripción tan detallada del algoritmo como las anteriores, puesto que buena parte es repetir $\hspace{0.1cm}B\hspace{0.1cm}$ veces la estructura del k-fold. $\\[0.5cm]$



<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>


- Es fácil ver que se obtendrían $\hspace{0.1cm}k\cdot B\hspace{0.1cm}$ muestras de test y train, por lo que se entrenaría y testaría el modelo $\hspace{0.1cm}M\hspace{0.1cm}$ un total de $\hspace{0.1cm}k\cdot B\hspace{0.1cm}$ veces.$\\[0.5cm]$

- Si la métrica usada para evaluar el modelo es el  $\hspace{0.1cm}ECM\hspace{0.05cm}$ , entocnes se obtienen $\hspace{0.1cm}k\cdot B\hspace{0.1cm}$ valores de esta métrica:


    $$ECM_{test }\left(\hspace{0.1cm}\widehat{M}_1^{\hspace{0.1cm}1}\hspace{0.1cm}\right) \hspace{0.05cm}, ... ,\hspace{0.05cm} ECM_{test}\left(\hspace{0.1cm}\widehat{M}_k^{\hspace{0.1cm}1}\hspace{0.1cm}\right) \hspace{0.05cm},...,\hspace{0.05cm}ECM_{test }\left(\hspace{0.1cm}\widehat{M}_1^{\hspace{0.1cm}B}\hspace{0.1cm}\right) \hspace{0.05cm}, ... ,\hspace{0.05cm} ECM_{test}\left(\hspace{0.1cm}\widehat{M}_k^{\hspace{0.1cm}B} \hspace{0.1cm} \hspace{0.1cm}\right)   \\$$


    Donde: 
    
    $\hspace{0.1cm}$ Para $\hspace{0.1cm}r\in \lbrace 1,...,k \rbrace\hspace{0.15cm}$ y $\hspace{0.15cm} j\in \lbrace 1,...,B \rbrace\\$


    - $\widehat{M}_r^{\hspace{0.1cm}j}\hspace{0.1cm}$ es el modelo $\hspace{0.1cm}M\hspace{0.1cm}$ entrenado con la **muestra de train** $\hspace{0.1cm}r$-esima  obtenida en la repetición $\hspace{0.1cm}j$-esima del algoritmo k-fold, es decir, es el modelo entrenado con la muestra de train $\hspace{0.1cm}D_{train, r}^{\hspace{0.1cm}j}\hspace{0.1cm} \\[0.7cm]$  

    - $ECM_{test }\left(\hspace{0.1cm}\widehat{M}_r^{\hspace{0.1cm}j} \hspace{0.1cm}\right)\hspace{0.1cm}$ es el $\hspace{0.1cm}ECM\hspace{0.1cm}$ calculado sobre el modelo $\hspace{0.1cm}\widehat{M}_r^{\hspace{0.1cm}j}\hspace{0.1cm}$ con la **muestra de test** $\hspace{0.1cm}r$-esima  obtenida en la repetición $\hspace{0.1cm}j$-esima del algoritmo k-fold, es decir,  con la muestra de test $\hspace{0.1cm}D_{test, r}^{\hspace{0.1cm}j}   \\[0.5cm]$ 

    $$ECM_{test }\left( \hspace{0.1cm} \widehat{M}_r^{\hspace{0.1cm}j} \hspace{0.1cm}\right) = \dfrac{1}{\# D_{test, r}^{\hspace{0.1cm}j}} \cdot \sum_{i=1}^{\# D_{test, r}^{\hspace{0.1cm}j}} \hspace{0.1cm} \left(\hspace{0.1cm} y_i^{\hspace{0.1cm}test,r,j} - \hat{\hspace{0.1cm}y\hspace{0.1cm}}_i^{\hspace{0.1cm}test,r,j} \hspace{0.1cm} \right)^2  \\[1cm]$$



    Considerando lo siguiente : $\\[0.5cm]$
    
 
    - $\hat{y}_i^{\hspace{0.1cm}test,r,j} \hspace{0.1cm}=\hspace{0.1cm} M(\hspace{0.1cm} x_i^{\hspace{0.1cm}test, r,j} \hspace{0.12cm}|\hspace{0.12cm} D_{train,r}^{\hspace{0.1cm}j}) \hspace{0.1cm}=\hspace{0.1cm} \widehat{M}_r^{\hspace{0.1cm}j} (\hspace{0.1cm} x_i^{test, r,j} \hspace{0.1cm} ) \\[0.7cm]$

 

    - $\left( \hspace{0.1cm} x_i^{\hspace{0.1cm} test, r,j} , y_i^{test, r,j}  \hspace{0.1cm}\right)\hspace{0.1cm}$ es la observación (fila) $\hspace{0.1cm}i$-esima de $\hspace{0.1cm}D_{test,r}^{\hspace{0.1cm} j} \\[0.7cm]$

    - $x_i^{\hspace{0.1cm}test, r,j}\hspace{0.1cm}$ es la observación $\hspace{0.1cm}i$-esima de la muestra de test $\hspace{0.1cm}r$-esima de los predictores obtenida en la repetición $\hspace{0.1cm}j$-esima del algoritmo k-folds. $\\[0.7cm]$

    - $y_i^{\hspace{0.1cm}test, r,j}\hspace{0.1cm}$ es la observacion $\hspace{0.1cm}i$-esima de la muestra de test $\hspace{0.1cm}r$-esima de la variable respuesta obtenida en la repetición $\hspace{0.1cm}j$-esima del algoritmo k-folds. $\\[0.7cm]$


    
    Nótese que debido al componente aleatorio presente en el algoritmo k-folds, cada vez que se repita el algoritmo se obtendran muestras de train y test diferentes. $\\[1cm]$
    
    

- Se calcula la métrica final de evaluación del modelo como el promedio de las $\hspace{0.1cm}k\cdot B\hspace{0.1cm}$ métricas calculadas en el paso anterior. 

    Si la métrica considerada es el $\hspace{0.1cm}ECM\hspace{0.1cm}$, entonces:

    $$ECM( {M})_{test}^{\hspace{0.08cm}*} \hspace{0.13cm} = \hspace{0.13cm}\dfrac{1}{k\cdot B} \hspace{0.1cm} \cdot\hspace{0.1cm} \sum_{j=1}^B \hspace{0.1cm} \sum_{r=1}^k \hspace{0.15cm}   ECM_{test}\left(\hspace{0.1cm}\widehat{M}_r^{\hspace{0.1cm}j}\hspace{0.1cm}\right)$$
    

</p>
 
</p></span>
</div>





<br>


**Ventajas**

La métrica de validación calculada por repeted k-fold tiene menor varianza que con los métodos anteriores, luego es el mas preciso de todos ellos. Este debería ser el método empleado en la práctica, siempre que se pueda, ya que también es el que mas requerimientos computacionales tiene.



<br>


# Selección de modelos basada en validación cruzada



Dado un conjunto de  modelos de aprendizaje supervisado, nos interesa establecer un criterio para seleccionar uno de ellos como el mejor.

A continuación se expone un criterio basado en las métricas y algoritmos de validación que se han visto anteriormente. $\\[0.5cm]$




<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>


- Tenemos $\hspace{0.1cm}h\hspace{0.1cm}$ modelos de aprendizaje supervisado $\hspace{0.1cm}M_1\hspace{0.05cm},\hspace{0.05cm}M_2\hspace{0.05cm},...,\hspace{0.05cm}M_h\hspace{0.05cm}  \\$

- Se validan esos modelos usando un mismo algoritmo de validación, con una misma métrica de evaluación. Se obtendrán $\hspace{0.1cm}h\hspace{0.1cm}$ valores de la métrica, una para cada modelo. $\\[0.3cm]$

    Si la métrica fuera el ECM se tendrian por ejemplo los siguientes valores: $\\[0.15cm]$

    $$ECM(M_1)_{test}^{\hspace{0.05cm} *} \hspace{0.1cm}, ...,\hspace{0.1cm} ECM(M_h)_{test}^{\hspace{0.05cm} *} \\$$


- El criterio es seleccionar el modelo que tienen **mejor** valor de la métrica. Si es una métrica de error, el que menor valor tiene. Si es una métrica de acierto, el que mayor valor tiene. $\\[0.8cm]$


- Si la métrica es de **error**, como por ejemplo el $\hspace{0.1cm}ECM\hspace{0.1cm}$, entonces: $\\[0.7cm]$

    - El modelo seleccionado es $\hspace{0.1cm}M_{j^{\hspace{0.08cm}*}}\hspace{0.1cm}$ , donde: $\\[0.5cm]$

    $$j^{\hspace{0.08cm}*} \hspace{0.1cm}=\hspace{0.1cm} arg \hspace{0.1cm} \underset{j \in \lbrace 1,...,h\rbrace }{Min} \hspace{0.15cm}  ECM(M_j)_{test}^{\hspace{0.05cm} *} \\[1cm]$$



- Si la métrica es de **acierto**, como por ejemplo la $\hspace{0.1cm}TAC\hspace{0.1cm}$, entonces: $\\[0.5cm]$

    - El modelo seleccionado es $\hspace{0.1cm}M_{j^{\hspace{0.08cm}*}}\hspace{0.1cm}$ , donde: $\\[0.5cm]$


    $$j^{\hspace{0.08cm}*} \hspace{0.1cm}=\hspace{0.1cm} arg \hspace{0.1cm} \underset{j \in \lbrace 1,...,h\rbrace }{Max} \hspace{0.15cm}  TAC(M_j)_{test}^{\hspace{0.05cm} *}$$


</p>
 
</p></span>
</div>

<br>

<br>


# Algoritmos de validación cruzada programados en `Python`


Importamos las librerias que vamos a utilizar:

```python
import pandas as pd
import numpy as np
import math
import sklearn

from sklearn.utils import resample
from sklearn.neighbors import NearestNeighbors
```


Cargamos los datos con los que vamos a trabajar, los cuales fueron detallados en nuestro artículo sobre [regresión lineal](http://estadistica4all.com/Articulos/Linear-Regression-new.html)

```python
Data = pd.read_csv('House_Price_Regression.csv')

Data = Data.loc[:, ['no_of_bedrooms' , 'no_of_bathrooms', 'latitude', 'longitude', 'price', 'size_in_m_2', 'balcony_recode', 'private_garden_recode', 'quality_recode']]

Data.head()
```



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
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>no_of_bedrooms</th>
      <th>no_of_bathrooms</th>
      <th>latitude</th>
      <th>longitude</th>
      <th>price</th>
      <th>size_in_m_2</th>
      <th>balcony_recode</th>
      <th>private_garden_recode</th>
      <th>quality_recode</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>2</td>
      <td>25.113208</td>
      <td>55.138932</td>
      <td>2700000</td>
      <td>100.242337</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>2.0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>2</td>
      <td>25.106809</td>
      <td>55.151201</td>
      <td>2850000</td>
      <td>146.972546</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>2.0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>3</td>
      <td>5</td>
      <td>25.063302</td>
      <td>55.137728</td>
      <td>1150000</td>
      <td>181.253753</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>2.0</td>
    </tr>
    <tr>
      <th>3</th>
      <td>2</td>
      <td>3</td>
      <td>25.227295</td>
      <td>55.341761</td>
      <td>2850000</td>
      <td>187.664060</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>0</td>
      <td>1</td>
      <td>25.114275</td>
      <td>55.139764</td>
      <td>1729200</td>
      <td>47.101821</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>2.0</td>
    </tr>
  </tbody>
</table>
</div>





A continuación se van a programar los algoritmos de validación cruzada que se han expuesto a nivel teórico anteriormente.

Además se probarán los algoritmos con el modelo KNN tanto en su versión para regresión como para clasificación.


<br>

## Validación simple no aleatoria


```python
def simple_validation_not_random(D, k, response, metric, model):

    # D --> It has to be a pandas data frame.

    # k --> It is the proportion of observation of D that define D_train.

    # response --> It has to be a string with the name of the response variable.

    N = len(D)

    D_train = D.iloc[0:(math.floor(k*N)+1) , :]

    D_test = D.iloc[(math.floor(k*N)+1):N , :]

    X_train = D_train.loc[: , D_train.columns != response]
    Y_train = D_train.loc[: , response]

    X_test = D_test.loc[: , D_test.columns != response]
    Y_test = D_test.loc[: , response]

############################################################################

    # Training the model wit train sample

    model.fit(X_train, Y_train)

    # Making predictions with test sample

    Y_predict_test = model.predict( X_test )     

############################################################################

 # Computing the test metric

    if metric == 'ECM' :  
        
        ECM_test = np.mean( (Y_predict_test - Y_test)**2 )

        return ECM_test

    elif metric == 'TA' :  
        
        TA_test = np.mean( (Y_predict_test == Y_test) )

        return TA_test
```


Definimos el modelo KNN para regresión con el que vamos a testear el algoritmo que se acaba de programar:

```python
knn_regression = sklearn.neighbors.KNeighborsRegressor(n_neighbors=10 ,  p=2, metric='minkowski')
```

Aplicamos el algoritmo de validación sobre el modelo KNN para regresión, usando como métrica de validación el error cuadratico medio (ECM):

```python
ECM_test_Simple_Validation_not_random  = simple_validation_not_random(D=Data, k=0.75, response='price', metric='ECM', model=knn_regression)

ECM_test_Simple_Validation_not_random
```




    2176125958588.6355



Definimos el modelo KNN para clasificación con el que vamos a testear el algoritmo que se acaba de programar:

```python
knn_classification = sklearn.neighbors.KNeighborsClassifier(n_neighbors=10 ,  p=2, metric='minkowski')
```


Aplicamos el algoritmo de validación simple no aleatoria sobre el modelo KNN para clasificación, usando como métrica de validación la tasa de acierto (TA):


```python
TAC_test_Simple_Validation_not_random  = simple_validation_not_random(D=Data, k=0.75, response='quality_recode', metric='TA', model=knn_classification)

TAC_test_Simple_Validation_not_random
```




    0.5609243697478992


<br>


## Validación simple aleatoria


```python
def simple_validation_random(D, k, response, random_seed, metric, model):

    # D --> have to be a pandas data frame.

    # k --> is the proportion of observation of D that define D_train.

    # response --> have to be a string with the name of the response variable.

    # random_seed --> seed to replicate the random process

    N = len(D)

    D_train = D.sample(frac=k, replace=False, random_state=random_seed)

    D_test = D.drop( D_train.index , )

    X_train = D_train.loc[: , D_train.columns != response]
    Y_train = D_train.loc[: , response]

    X_test = D_test.loc[: , D_test.columns != response]
    Y_test = D_test.loc[: , response]

############################################################################

    # Training the model wit train sample

    model.fit(X_train, Y_train)

    # Making predictions with test sample

    Y_predict_test = model.predict( X_test ) 

####################################################################

 # Computing the test metric

    if metric == 'ECM' :  
        
        ECM_test = np.mean( (Y_predict_test - Y_test)**2 )

        return ECM_test

    elif metric == 'TA' :  
        
        TA_test = np.mean( (Y_predict_test == Y_test) )

        return TA_test
```


Definimos el modelo KNN para regresión con el que vamos a testear el algoritmo que se acaba de programar:

```python
knn_regression = sklearn.neighbors.KNeighborsRegressor(n_neighbors=10 ,  p=2, metric='minkowski')
```


Aplicamos el algoritmo de validación simple aleatoria sobre el modelo KNN para regresión, usando como métrica de validación el error cuadratico medio (ECM):


```python
ECM_test_Simple_Validation_random = simple_validation_random(D=Data, k=0.75, response='price', random_seed=123, metric='ECM', model=knn_regression)

ECM_test_Simple_Validation_random
```




    2464363295205.937



Definimos el modelo KNN para clasificacion con el que vamos a testear el algoritmo que se acaba de programar:

```python
knn_classification = sklearn.neighbors.KNeighborsClassifier(n_neighbors=10 ,  p=2, metric='minkowski')
```

Aplicamos el algoritmo de validación simple aleatoria sobre el modelo KNN para clasificación, usando como métrica de validación la tasa de acierto (TA):

```python
TAC_test_Simple_Validation_random = simple_validation_random(D=Data, k=0.75, response='quality_recode', random_seed=123, metric='TA', model =knn_classification)

TAC_test_Simple_Validation_random
```




    0.5777310924369747




<br>


## Validación simple aleatoria repetida


```python
def repeated_random_simple_validation(D, k, B, response, random_seed, metric, model):

    # D --> have to be a pandas data frame.

    # k --> is the proportion of observation of D that define D_train.

    # B --> number of replications of the random simple validation algorithm

    # response --> have to be a string with the name of the response variable.

    # random_seed --> seed to replicate the random process


    np.random.seed(random_seed)

    ECM_test_list , TA_test_list = [ ] , [ ]

    seed_array = np.random.randint(9999999, size=(B))


    if metric == 'ECM':

        for b in range(0,B) :

            ECM_test_list.append( simple_validation_random(D, k, response, random_seed=seed_array[b], metric=metric, model=model) )


        ECM_test = np.mean(ECM_test_list)    

        return ECM_test 


    elif metric == 'TA':

        for b in range(0,B) :

            TA_test_list.append( simple_validation_random(D, k, response, random_seed=seed_array[b], metric=metric, model=model) )


        TA_test = np.mean(TA_test_list)    

        return TA_test 
```



Definimos el modelo KNN para regresión con el que vamos a testear el algoritmo que se acaba de programar:

```python
knn_regression = sklearn.neighbors.KNeighborsRegressor(n_neighbors=10 ,  p=2, metric='minkowski')
```

Aplicamos el algoritmo de validación simple aleatoria repetida sobre el modelo KNN para regresión, usando como métrica de validación el error cuadratico medio (ECM):

```python
ECM_test_Simple_Validation_repeated = repeated_random_simple_validation(D=Data, k=0.75, B=1000, response='price', random_seed=123, metric='ECM', model=knn_regression)
```



```python
ECM_test_Simple_Validation_repeated
```




    2297076499859.55
    



Definimos el modelo KNN para clasificación con el que vamos a testear el algoritmo que se acaba de programar:

```python
knn_classification = sklearn.neighbors.KNeighborsClassifier(n_neighbors=10 ,  p=2, metric='minkowski')
```

Aplicamos el algoritmo de validación simple aleatoria repetida sobre el modelo KNN para clasificación, usando como métrica de validación la tasa de acierto (TA):


```python
TAC_test_Simple_Validation_repeated = repeated_random_simple_validation(D=Data, k=0.75, B=1000, response='quality_recode', random_seed=123, metric='TA', model=knn_classification)
```



```python
TAC_test_Simple_Validation_repeated
```




    0.5516638655462184


<br>


## Leave one out


```python
def leave_one_out_validation(D, response, metric, model):

    # D --> have to be a pandas data frame.

    # k --> is the proportion of observation of D that define D_train.

    # response --> have to be a string with the name of the response variable.

    ECM_test_list , TA_test_list = [ ] , [ ]

    N = len(D)

    for r in range(0,N):

        D_test = D.iloc[r,:]
        D_train = D.drop( r , )

        X_train = D_train.loc[: , D_train.columns != response]
        Y_train = D_train.loc[: , response]

        X_test = D_test.loc[D_test.index != response]
        Y_test = D_test.loc[response]

############################################################################

        # Training the model wit train sample

        model.fit(X_train, Y_train)

        # Making predictions with test sample

        Y_predict_test = model.predict( pd.DataFrame([X_test]) ) 
        
############################################################################

        if metric == 'ECM' :  ECM_test_list.append( np.mean( (Y_predict_test - Y_test)**2 ) )
    
        elif metric == 'TA' :  TA_test_list.append( np.mean( (Y_predict_test == Y_test ) ) )

############################################################################
        
    if metric == 'ECM' : 
        
        ECM_test = np.mean(ECM_test_list)

        return ECM_test


    elif metric == 'TA' :

        TA_test = np.mean(TA_test_list)

        return TA_test

```



Definimos el modelo KNN para regresión con el que vamos a testear el algoritmo que se acaba de programar:

```python
knn_regression = sklearn.neighbors.KNeighborsRegressor(n_neighbors=10 ,  p=2, metric='minkowski')
```

Aplicamos el algoritmo de validación leave one out  sobre el modelo KNN para regresión, usando como métrica de validación el error cuadratico medio (ECM):

```python
ECM_test_leave_one_out = leave_one_out_validation(D=Data, response='price', metric='ECM', model=knn_regression)
```



```python
ECM_test_leave_one_out
```




    2268581861335.2305



Definimos el modelo KNN para clasificación con el que vamos a testear el algoritmo que se acaba de programar:


```python
knn_classification = sklearn.neighbors.KNeighborsClassifier(n_neighbors=10 ,  p=2, metric='minkowski')
```

Aplicamos el algoritmo de validación leave one out  sobre el modelo KNN para clasificación, usando como métrica de validación la tasa de acierto (TA):


```python
TAC_test_leave_one_out = leave_one_out_validation(D=Data, response='quality_recode', metric='TA', model=knn_classification)

TAC_test_leave_one_out
```




    0.5511811023622047







<br>


## k-fold


```python
def K_Fold_CV(D, K, response, random_seed, metric, model):

    ECM_K_FOLDS_vector , TA_K_FOLDS_vector = [] , []

    np.random.seed(random_seed)

    sample = resample(range(0, len(D)), n_samples=len(D), replace=False)

    df_sample = pd.DataFrame({'index': range(0,len(D)) , 'sample':sample})

    Q = []

    for q in np.arange(0 , 1 + 1/K , 1/K):

        Q.append( np.quantile( range(0, len(D)) , q ).round(0) )


    for j in range(0, len(Q)-1):

            X_test = D.loc[df_sample.loc[Q[j]:(math.floor(Q[j+1])-1), 'sample'] , D.columns != response ] 
            Y_test = D.loc[df_sample.loc[Q[j]:(math.floor(Q[j+1])-1), 'sample'] , D.columns == response ]

            X_train = D.loc[ : , D.columns != response ].drop(df_sample.loc[Q[j]:(math.floor(Q[j+1])-1), 'sample'] )
            Y_train = D.loc[ : ,  D.columns == response ].drop(df_sample.loc[Q[j]:(math.floor(Q[j+1])-1), 'sample'])
            
            Y_test = Y_test.to_numpy()

           #########################################################################

            if model == 'knn_regression' :

              # Training the model wit train sample

                knn_regression.fit(X_train, Y_train)


               # Making predictions with test sample

                Y_predict_test = knn_regression.predict( X_test ) 

    
            elif model == 'knn_classification' :

               # Training the model wit train sample

                knn_classification.fit(X_train, Y_train)


               # Making predictions with test sample

                Y_predict_test = knn_classification.predict( X_test )  

            #########################################################################

            if metric == 'ECM' :  ECM_K_FOLDS_vector.append( np.mean( ( Y_predict_test - Y_test )**2 ) )

            elif metric == 'TA' :  TA_K_FOLDS_vector.append( np.mean( ( Y_predict_test == Y_test ) ) )

##################################################################################################################################################

    if metric == 'ECM' :

        ECM_K_Folds = np.mean(ECM_K_FOLDS_vector)
    
        return  ECM_K_Folds

    
    elif metric == 'TA' :

        TA_K_Folds = np.mean(TA_K_FOLDS_vector)
    
        return  TA_K_Folds
```


Definimos el modelo KNN para regresión con el que vamos a testear el algoritmo que se acaba de programar:

```python
knn_regression = sklearn.neighbors.KNeighborsRegressor(n_neighbors=10 ,  p=2, metric='minkowski')
```

Aplicamos el algoritmo de validación cruzada K-fold  sobre el modelo KNN para regresión, usando como métrica de validación el error cuadrático medio (ECM):

```python
ECM_K_Folds = K_Fold_CV(D=Data, response='price', K=10, random_seed=123, metric='ECM', model='knn_regression')
```



```python
ECM_K_Folds
```




    2220503635404.005




Definimos el modelo KNN para clasificación con el que vamos a testear el algoritmo que se acaba de programar:


```python
knn_classification = sklearn.neighbors.KNeighborsClassifier(n_neighbors=10 ,  p=2, metric='minkowski')
```

Aplicamos el algoritmo de validación cruzada K-fold  sobre el modelo KNN para clasificación, usando como métrica de validación la tasa de acierto (TA):


```python
TAC_K_Folds = K_Fold_CV(D=Data, response='quality_recode', K=10, random_seed=123, metric='TA', model='knn_classification')

TAC_K_Folds
```




    0.5363984159477089






<br>

## Repeated k-folds


```python
def repeated_K_Fold_CV(D, B, K, response, random_seed, metric, model):


    ECM_Repeted_K_Folds_vector , TA_Repeted_K_Folds_vector = [] , []

    np.random.seed(random_seed)


    for b in range(0, B):

        sample = resample(range(0, len(D)), n_samples=len(D), replace=False)

        df_sample = pd.DataFrame({'index': range(0,len(D)) , 'sample':sample})

        
        Q = []

        
        for q in np.arange(0 , 1 + 1/K , 1/K):

            Q.append( np.quantile( range(0, len(D)) , q ).round(0) )



        ECM_K_FOLDS_vector , TA_K_FOLDS_vector = [] , []

        for j in range(0, len(Q)-1):

            X_test = D.loc[df_sample.loc[Q[j]:(math.floor(Q[j+1])-1), 'sample'] , D.columns != response ] 
            Y_test = D.loc[df_sample.loc[Q[j]:(math.floor(Q[j+1])-1), 'sample'] , D.columns == response ]

            X_train = D.loc[ : , D.columns != response ].drop(df_sample.loc[Q[j]:(math.floor(Q[j+1])-1), 'sample'] )
            Y_train = D.loc[ : ,  D.columns == response ].drop(df_sample.loc[Q[j]:(math.floor(Q[j+1])-1), 'sample'])      

            Y_test = Y_test.to_numpy()

        #######################################################################
            
            if model == 'knn_regression' :

              # Training the model wit train sample

                knn_regression.fit(X_train, Y_train)


               # Making predictions with test sample

                Y_predict_test = knn_regression.predict( X_test ) 

    
            elif model == 'knn_classification' :

               # Training the model wit train sample

                knn_classification.fit(X_train, Y_train)


               # Making predictions with test sample

                Y_predict_test = knn_classification.predict( X_test )  

        #######################################################################

            if metric == 'ECM' :  ECM_K_FOLDS_vector.append( np.mean( ( Y_predict_test - Y_test )**2 ) )

            elif metric == 'TA' :  TA_K_FOLDS_vector.append( np.mean( ( Y_predict_test == Y_test ) ) )

        #######################################################################
    
        if metric == 'ECM' : ECM_Repeted_K_Folds_vector.append( np.mean(ECM_K_FOLDS_vector) )

        elif metric == 'TA' : TA_Repeted_K_Folds_vector.append( np.mean(TA_K_FOLDS_vector) )

##########################################################################################################################

    if metric == 'ECM' :
        
        ECM_Repeted_K_Folds = np.mean(ECM_Repeted_K_Folds_vector)

        return  ECM_Repeted_K_Folds
        

    elif metric == 'TA' :
        
        TA_Repeted_K_Folds = np.mean(TA_Repeted_K_Folds_vector)

        return  TA_Repeted_K_Folds
    
    
```

Definimos el modelo KNN para regresión con el que vamos a testear el algoritmo que se acaba de programar:


```python
knn_regression = sklearn.neighbors.KNeighborsRegressor(n_neighbors=10 ,  p=2, metric='minkowski')
```

Aplicamos el algoritmo de validación cruzada K-fold repetida sobre el modelo KNN para regresión, usando como métrica de validación el error cuadrático medio (ECM):

```python
ECM_repeated_K_Folds = repeated_K_Fold_CV(D=Data, response='price', K=10, B=100, random_seed=123, metric='ECM', model='knn_regression')
```



```python
ECM_repeated_K_Folds
```




    2268486279605.6816



Definimos el modelo KNN para clasificación con el que vamos a testear el algoritmo que se acaba de programar:

```python
knn_classification = sklearn.neighbors.KNeighborsClassifier(n_neighbors=10 ,  p=2, metric='minkowski')
```

Aplicamos el algoritmo de validación cruzada K-fold repetida sobre el modelo KNN para clasificación, usando como métrica la tasa de acierto (TA):

```python
TAC_repeated_K_Folds = repeated_K_Fold_CV(D=Data, response='quality_recode', K=10, B=100, random_seed=123, metric='TA', model='knn_classification')
```



```python
TAC_repeated_K_Folds
```




    0.5371267212075105



<br>


# Algoritmos de valicación cruzada con `Sklearn`

Importamos los módulos que usaremos en esta sección:

```python
from sklearn.model_selection import cross_val_score

from sklearn.model_selection import RepeatedKFold

from sklearn.model_selection import KFold
```


## k-fold

Inicializamos el algoritmo k-fold. Usaremos los parámetros k=10 y un inicio aleatorio del algoritmo con semilla 123.

```python
cv_k_fold = KFold(n_splits=10, random_state=123, shuffle=True)
```

---

Vamos a aplicar el algoritmo de validacion k-fold   a un porblema de regresión usando la métrica ECM.



Creamos por un lado el vector de la respuesta y por otro la matriz de los predictores. En este caso la respuesta es la variable *price*, y los predictores son el resto de variables.

```python
Y_reg = Data.loc[:,'price']

X_reg = Data.loc[:, Data.columns != 'price']
```

 
Calculamos la métrica ECM usando el algoritmo de validación cruzada k-folds con k=10:

```python
ECM_K_Folds_sklearn = cross_val_score(knn_regression, X_reg, Y_reg, cv=cv_k_fold, scoring='neg_mean_squared_error')

ECM_K_Folds_sklearn = np.mean( - ECM_K_Folds_sklearn )

ECM_K_Folds_sklearn
```

 
    2220103512647.2095


---

Vamos a aplicar el algoritmo de validacion k-fold   a un porblema de clasificación supervisada usando la métrica TAC.


Creamos por un lado el vector de la respuesta y por otro la matriz de los predictores. En este caso la respuesta es la variable *quality_recode*, y los predictores son el resto de variables.


```python
Y_class = Data.loc[:,'quality_recode']
 
X_class = Data.loc[:, Data.columns != 'quality_recode']
```


```python
TAC_K_Folds_sklearn = cross_val_score(knn_classification, X_class, Y_class, cv=cv_k_fold, scoring='accuracy')

TAC_K_Folds_sklearn = np.mean( TAC_K_Folds_sklearn )

TAC_K_Folds_sklearn
```


    0.5606558280518048




<br>

## Repeated k-fold

 
Inicializamos el algoritmo repeated k-fold. Usaremos los parámetros k=10, un número de 100 repeticiones y un inicio aleatorio con semilla 123.

```python
cv_repeated_k_fold = RepeatedKFold(n_splits=10, n_repeats=100, random_state=123)
```

---

Vamos a aplicar el algoritmo de validacion k-fold   a un problema de **regresión** usando la métrica TAC.

Calculamos la métrica ECM usando el algoritmo de validación cruzada repeated-k-folds con k=10 y B=100 repeticiones:

```python
ECM_repeated_K_Folds_sklearn = cross_val_score(knn_regression, X_reg, Y_reg, cv=cv_repeated_k_fold, scoring='neg_mean_squared_error')

ECM_repeated_K_Folds_sklearn = np.mean( - ECM_repeated_K_Folds_sklearn )

ECM_repeated_K_Folds_sklearn
```
 



    2269036673148.278


 
----

 

Vamos a aplicar el algoritmo de validacion repeated k-fold a un problema de **clasificación supervisada** usando la métrica TAC.

 

Calculamos la métrica TAC usando el algoritmo de validación cruzada repeated-k-folds con k=10 y B=100 repeticiones:

```python
TAC_repeated_K_Folds_sklearn = cross_val_score(knn_classification, X_class, Y_class, cv=cv_repeated_k_fold, scoring='accuracy')

TAC_repeated_K_Folds_sklearn = np.mean( TAC_repeated_K_Folds_sklearn )

TAC_repeated_K_Folds_sklearn
```


    0.554644943510609



<br>



# Comparación final

Importamos las librerias de visualización de datos que usaremos para realizar la comparación final.

```python
import seaborn as sns
import matplotlib.pyplot as plt
```

Creamos un data-frame con los distintos valores de la métrica ECM obtenidos con los distintos algoritmos de validación utilizados:

```python
ECM_df = pd.DataFrame({'ECM' : [ECM_test_Simple_Validation_not_random , ECM_test_Simple_Validation_random, ECM_test_Simple_Validation_repeated, ECM_test_leave_one_out, ECM_K_Folds, ECM_K_Folds_sklearn , ECM_repeated_K_Folds, ECM_repeated_K_Folds_sklearn],
 'names' : ['Simple validation (not random)' , 'Simple validation (random)', 'Simple validation (repeted)', 'Leave one out', 'k-folds', 'k-folds (sklearn)', 'repeted-k-folds', 'repeted-k-folds (sklearn)']})
```

```python
fig, ax = plt.subplots()

p3 = sns.barplot(x="ECM", y ='names' , data=ECM_df)

fig.savefig('p3.jpg', format='jpg', dpi=1200)
```


<center>

![](p3.jpg){width="45%"}

</center>



<br>

---

<br>

Creamos un data-frame con los distintos valores de la métrica TAC obtenidos con los distintos algoritmos de validación utilizados:

```python
TAC_df = pd.DataFrame({'TAC' : [TAC_test_Simple_Validation_not_random , TAC_test_Simple_Validation_random, TAC_test_Simple_Validation_repeated, TAC_test_leave_one_out, TAC_K_Folds, TAC_K_Folds_sklearn, TAC_repeated_K_Folds, TAC_repeated_K_Folds_sklearn],
 'names' : ['Simple validation (not random)' , 'Simple validation (random)', 'Simple validation (repeted)', 'Leave one out', 'k-folds', 'k-folds (sklearn)', 'repeted-k-folds', 'repeted-k-folds (sklearn)']})
```

```python
fig, ax = plt.subplots()

p4 = sns.barplot(x="TAC", y ='names' , data=TAC_df)

fig.savefig('p4.jpg', format='jpg', dpi=1200)
```


    
<center>

![](p4.jpg){width="45%"}

</center>




<br>

----

<br>

# Bibliografía <a class="anchor" id="1"></a>  


- Amat Rodrigo, J. (Noviembre 2020). Validación de modelos predictivos: Cross-validation, OneLeaveOut, Bootstraping. *Cienciadedatos*.  
https://www.cienciadedatos.net/documentos/30_cross-validation_oneleaveout_bootstrap $\\[0.5cm]$


- Aler Mur, Ricardo. (2022). *Metodología: evaluación de modelos.* [Presentación de PowerPoint]. Aula Global UC3M.

<br>





