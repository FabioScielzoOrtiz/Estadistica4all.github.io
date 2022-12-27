---
title: 'Métodos de validación cruzada'
author: 'Fabio Scielzo Ortiz'
date: '25/11/22'
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

$\hspace{0.5cm}$ Scielzo Ortiz, F. (2022). El algoritmo KNN. [Link](http://estadistica4all.com/Articulos/KNN.html)


</p>
 
</p></span>
</div>


***Se recomienda abrir el artículo en un ordenador o en una tablet.***
 
 
 
 
 <br>
 
Los métodos de validación son una familia muy importante de métodos dentro del aprendizaje estadístico o machine learning que permiten evaluar la capacidad predictiva de un modelo predictivo.

Distinguiremos dos tipos de métodos de evaluacion de modelos:

- Métodos de validación de modelos de **aprendizaje supervisado** $\Rightarrow$ son algoritmos que permiten evaluar modelos de aprendizaje supervisado usando **muestras de test y train de los predictores y la respuesta**, y una **métrica de evaluación**.

- Métodos de evaluación de modelos de aprendizaje no supervisado $\Rightarrow$ son algoritmos que permiten evaluar modelos de aprendizaje no supervisado usando una **muestra de train de los predictores** y una **métrica de evaluación**.


Observación:

Los métodos de validación de modelos de **aprendizaje supervisado**
también son llamados **métodos de validación cruzada**. Aunque realmente son mucho más conocidos por su nombre en ingles: **cross validation**

<br>

¿Por que no se aplican los mismos métodos de validacion a los modelos de aprendizaje supervisado y no supervisado?

Debido a que tienen unas carateristicas diferentes, en particular, en el parendizaje supervisado se tienen datos de la variable respuesta, mientras que en el no supervisado no se dispone de información alguna.

Si se quiere ver un planteamiento algo más detallado de los problemas de aprendizaje supervisado y no supervisado se recomienda leer el siguiente articulo de nuestro blog: [link](http://estadistica4all.com/Articulos/Los-problemas-de-clasificaci%C3%B3n-y-regresi%C3%B3n.html)
<br>

Los métodos de evaluación son usados para dos propósitos, principalmente:

- Para **seleccionar**  modelos.

- Para **optimizar hiper-parametros** de modelos.


En otros artículos estudiaremos métodos para selección de modelos y  ajuste de hiper-parámetros.


<br>

En este articulo vamos a estudiar los **métodos de validación de modelos de aprendizaje supervisado**. Los métodos de validación de modelos de aprendizaje no supervisado serán estudiados en otro artículo.

Por lo que consideraremos que $M$ representa un **modelo o algoritmo de aprendizaje supervisado**, como por ejemplo el modelo de regresión lineal, regresión logistica, regresión no lineal, regresión lineal penalizada, arboles de regresión y clasificación, KNN , SVM, redes neuronales ...

Notese que en este articulo no se consideran modelos estadísticos predictivos no supervisados como son los modelos de clustering como K-medias, K-medoids, modelos jerarquicos, modelos basados en densidades ...
 
Nos interesa tener un método a través del cual pueda evaluarse la capacidad o poder predictivo del modelo de aprendizaje supervisado $M$.

Una aproximación naive es evaluar el poder predictivo del modelo usando dos elementos. Por un lado los datos disponibles de la variable respuesta, y por otro las predicciones que el modelo hace para los datos de los predcitores con los que el modelo ha sido entrenado. 

La idea sería comparar los valores reales de la respuesta con los predichos por el modelo, usando alguna métrica.   

Esta aproximación tiende a infra-estimar el error de predicción real del modelo, ya que se está prediciendo la respuesta para observaciones de los predictores que ya han sido "vistas" por el modelo, por ello el rendimiento del modelo al predecir la respuesta para estas observaciones tiende a ser mejor que si fueran observaciones con las que el modelo no ha sido entrenado (observaciones que no ha "visto" aún). 



Los métodos de validación de modelos predictivos **supervisados** tiene tres elementos:

- Una muestra de **train** y otra de **test** de los predictores y la respuesta.

- Una **métrica de evaluación**

- Un **algoritmo** para **evaluar el modelo** que usa los anteriores dos elementos de algún modo.


Este artículo es básicamente un tour (teórico-práctico) sobre estos elementos.


<br>

# Muestras de train y test <a class="anchor" id="1"></a>


<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>

Tenemos una muestra  de $\hspace{0.1cm}N\hspace{0.1cm}$ observaciones de $\hspace{0.1cm}p\hspace{0.1cm}$ variables predictores $\hspace{0.1cm}(\mathcal{X}_1,...,\mathcal{X}_p)\hspace{0.1cm}$ y  de una variable respuesta $\hspace{0.1cm}\mathcal{Y}\\$ 


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

Sin entrar aquí en particularidades, para evaluar un modelo predictivo supervisado $\hspace{0.1cm} M\hspace{0.1cm}$ este tiene que ser entrenado con un subconjunto de $\hspace{0.1cm}n\hspace{0.1cm}$ filas de $\hspace{0.1cm}D\hspace{0.1cm}$ , llamado **muestra de entrenamiento** $\hspace{0.1cm}D_{train}\hspace{0.1cm}$, y testado/evaluado con el subconjunto de las $\hspace{0.1cm}h\hspace{0.1cm}$ filas restantes de $\hspace{0.1cm}D\hspace{0.1cm}$ llamado  **muestra de test** $\hspace{0.1cm}D_{test}\hspace{0.1cm}$ , de modo tal que $\hspace{0.1cm}n+h=N$ 

Los métodos de validación típicos usan de algún modo $\hspace{0.1cm}D_{train}\hspace{0.1cm}$ y  $\hspace{0.1cm}D_{test}\hspace{0.1cm}$ , junto con una **métrica de evaluación**, es por ello  que vamos a definir estos elementos con mas precisión a continuación.



<br>

## Train-set


 
Los elementos antes mencionados se definen formalmente como sigue:

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>

- **Muestra train** de $\hspace{0.1cm}n\hspace{0.1cm}$ observaciones  del predictor $\hspace{0.1cm}\mathcal{X}_j\\$

$$X_j^{train} \hspace{0.1cm}=\hspace{0.1cm} (x_{1j}^{train},...,x_{nj}^{train} )^t \hspace{0.25cm} , \hspace{0.25cm} \forall \hspace{0.1cm} j\in \lbrace 1,...,p \rbrace \\$$

- **Muestra train** de $\hspace{0.1cm}n\hspace{0.1cm}$ observaciones de la respuesta $\hspace{0.1cm}\mathcal{Y}$

$$Y^{train}= (y_{1}^{train},...,y_n^{train})^t \\$$

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

- La fila $\hspace{0.1cm} i\hspace{0.1cm}$ de $\hspace{0.1cm}D_{train}\hspace{0.1cm}$ , es decir, $\hspace{0.1cm}(x_i^{train},y_i^{train}) = (x_{i1}^{train}, x_{i2}^{train},...,x_{ip}^{train}, y_i^{train})\hspace{0.1cm}$, es la $\hspace{0.1cm}i$-esima observación de *train* de los predictores y la respuesta $\hspace{0.1cm}\mathcal{X}_1,...,\mathcal{X}_p, \mathcal{Y} \\$

- $D_{train}\hspace{0.08cm}$ también es llamada simplemente **observaciones de train** de $\hspace{0.1cm}\mathcal{X}_1,...,\mathcal{X}_p, \mathcal{Y}$


<br>

## Predicciones de train

Como $\hspace{0.1cm}M\hspace{0.1cm}$ es un modelo predictivo supervisado es capaz de, una vez es entrenado  con las observaciones de   $\hspace{0.08cm}D_{train}=[X_1^{train},...,X_p^{train}, Y^{train}]\hspace{0.08cm}$ , generar predicciones de la respuesta $\hspace{0.08cm}\mathcal{Y}\hspace{0.08cm}$, tanto para las **observaciones de train** de los predictores como para  **nuevas observaciones**.

Notese que $\hspace{0.1cm}M\hspace{0.1cm}$ nos interesa realmente para predecir la respuesta para **nuevas observaciones** de los predictores, es decir, para predecir la respuesta para individuos/elementos de los que solo tenemos información de los predictores.  


<br>

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>

Las **predicciones de train** de la respuesta $\hspace{0.1cm}\mathcal{Y}\hspace{0.1cm}$ ,  son obtenidas aplicando el modelo predictivo ya *entrenado* a las observaciones de train de los predictores:


$$\widehat{\hspace{0.08cm} Y}^{\hspace{0.08cm} train} \hspace{0.1cm} = \hspace{0.1cm}  M\left(\hspace{0.1cm} X_1^{train},...,X_p^{train} \hspace{0.1cm}|\hspace{0.1cm} X_1^{train},...,X_p^{train}, Y^{train} \hspace{0.1cm}\right)$$

</p>
 
</p></span>
</div>

<br>

**Observaciones:**

- Aqui $\hspace{0.08cm}M(\hspace{0.1cm} z \hspace{0.1cm}|\hspace{0.1cm} w\hspace{0.1cm})\hspace{0.08cm}$ representa una función de dos argumentos, el argumento posterior a $\hspace{0.1cm}|\hspace{0.1cm}$ , es decir $\hspace{0.1cm}w\hspace{0.1cm}$, son los datos de predictores y respuestas con los que se entrena el modelo $\hspace{0.1cm}M\hspace{0.1cm}$ , y el argumento previo a $\hspace{0.1cm}|\hspace{0.1cm}$ , es decir $\hspace{0.1cm}z\hspace{0.1cm}$, son los datos de los predictores que el modelo $\hspace{0.1cm}M\hspace{0.1cm}$ usa para generar predicciones de la respuesta. Y devuelve un vector con esas predicciones de la respuesta. $\\[1cm]$



- $\widehat{\hspace{0.08cm} Y}^{\hspace{0.08cm} train}=(\hat{y}_1^{train},..., \hat{y}_n^{train})^t\hspace{0.1cm}$ es un vector con las predicciones de la respuesta hechas por el modelo entrenado $\hspace{0.08cm}M\hspace{0.1cm}$  para la muestra train de observaciones de los predictores $\hspace{0.1cm}(X_1^{train},...,X_p^{train}) \\$

- $\widehat{y}_i \hspace{0.1cm}=\hspace{0.1cm} M(\hspace{0.1cm} x_i^{train} \hspace{0.1cm}|\hspace{0.1cm} X_1^{train},...,X_p^{train}, Y^{train} \hspace{0.1cm}) \hspace{0.1cm}=\hspace{0.1cm} M(\hspace{0.1cm}x_{i1}^{train},...,x_{ip}^{train} \hspace{0.1cm}|\hspace{0.1cm} X_1^{train},...,X_p^{train}, Y^{train}\hspace{0.1cm})\hspace{0.1cm}$ es la predicción de la variable respuesta generada por el modelo entrenado $\hspace{0.1cm}M\hspace{0.1cm}$ para la observación de train de los predictores $\hspace{0.1cm}x_i^{train}\hspace{0.1cm}=\hspace{0.1cm}(x_{i1}^{train},...,x_{ip}^{train})$





<br>

## Test-set

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>

- **Muestra test** de $\hspace{0.08cm}h\hspace{0.08cm}$ observaciones   del predictor $\hspace{0.08cm}\mathcal{X}_j\\$

$$X_j^{test}=(x^{test}_{1j},...,x^{test}_{hj} )^t  \hspace{0.25cm} , \hspace{0.25cm} \forall j=1,...,p\\$$

-  **Muestra test** de $\hspace{0.1cm}h\hspace{0.1cm}$ observaciones  de la respuesta $\hspace{0.08cm}\mathcal{Y}\\$

$$Y^{test}=(y^{test}_{1},...,y^{test}_{h} )^t  \hspace{0.25cm} , \hspace{0.25cm} \forall j=1,...,p \\$$


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

- La fila $\hspace{0.1cm}i\hspace{0.1cm}$ de $\hspace{0.1cm}D_{test}\hspace{0.1cm}$ , es decir, $\hspace{0.1cm}(x_i^{test},y_i^{test})= (x^{test}_{i1}, x^{test}_{i2},...,x^{test}_{ip}, y_i^{test})\hspace{0.1cm}$, es la $\hspace{0.1cm}i$-esima observación de *test* de los predictores y la respuesta $\hspace{0.1cm}\mathcal{X}_1,...,\mathcal{X}_p, \mathcal{Y}\\$


- $D_{test}\hspace{0.1cm}$ también es llamada simplemente **observaciones de test** de $\hspace{0.1cm}\mathcal{X}_1,...,\mathcal{X}_p, \mathcal{Y}$

<br>

## Predicciones de test


Puesto que $\hspace{0.1cm}M\hspace{0.1cm}$ es un modelo predictivo supervisado es capaz de, una vez es entrenado  con las observaciones de   $\hspace{0.08cm}D_{train}=[X_1^{train},...,X_p^{train}, Y^{train}]\hspace{0.08cm}$ , generar predicciones de la respuesta $\hspace{0.08cm}\mathcal{Y}\hspace{0.08cm}$  ,  tanto para las **observaciones de train** como  para **nuevas observaciones** de los predictores $\hspace{0.08cm}\mathcal{X}_1,...,\mathcal{X}_p$ . 


Notese, de nuevo, que $\hspace{0.1cm}M\hspace{0.1cm}$ nos interesa realmente para predecir la respuesta para **nuevas observaciones** de los predictores, es decir, para predecir la respuesta para individuos/elementos de los que tenemos información sobre los predictores pero no sobre la respuesta.  


<br>


<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>

Las **predicciones de test** de la respuesta $\hspace{0.08cm}\mathcal{Y}\hspace{0.08cm}$ ,   son obtenidas aplicando el **modelo** predictivo **entrenado** a las observaciones de **test**:



 $$\widehat{Y}^{test} \hspace{0.1cm} = \hspace{0.1cm} M(\hspace{0.1cm} X_1^{test},...,X_p^{test} \hspace{0.1cm}|\hspace{0.1cm} X_1^{train},...,X_p^{train}, Y^{train} \hspace{0.1cm})$$


</p>
 
</p></span>
</div>

<br>

**Observaciones:**


- Aqui $\hspace{0.08cm}M(\hspace{0.1cm} z \hspace{0.1cm}|\hspace{0.1cm} w\hspace{0.1cm})\hspace{0.08cm}$ representa una función de dos argumentos, el argumento posterior a $\hspace{0.1cm}|\hspace{0.1cm}$ , es decir $\hspace{0.1cm}w\hspace{0.1cm}$, son los datos de predictores y respuestas con los que se entrena el modelo $\hspace{0.1cm}M\hspace{0.1cm}$ , y el argumento previo a $\hspace{0.1cm}|\hspace{0.1cm}$ , es decir $\hspace{0.1cm}z\hspace{0.1cm}$, son los datos de los predictores que el modelo $\hspace{0.1cm}M\hspace{0.1cm}$ usa para generar predicciones de la respuesta. Y devuelve un vector con esas predicciones de la respuesta. $\\[1cm]$



- $\widehat{\hspace{0.08cm}Y}^{\hspace{0.08cm}test}=(\hat{y}_1^{\hspace{0.08cm}test},..., \hat{y}_h^{\hspace{0.08cm}test})^t\hspace{0.1cm}$ es un vector con las predicciones de la respuesta hechas por el modelo entrenado $\hspace{0.1cm}M\hspace{0.1cm}$  usando la **muestra test** de observaciones de los predictores $\hspace{0.08cm}X_1^{test},...,X_p^{test}$

- $\hat{y}_i^{test} \hspace{0.1cm}=\hspace{0.1cm} M(\hspace{0.1cm} x_i^{test} \hspace{0.1cm}|\hspace{0.1cm} X_1^{train},...,X_p^{train}, Y^{train}\hspace{0.1cm} ) \hspace{0.1cm}=\hspace{0.1cm} M(x^{test}_{i1},...,x^{test}_{ip} \hspace{0.1cm}|\hspace{0.1cm} X_1^{train},...,X_p^{train}, Y^{train})\hspace{0.1cm}$ es la predicción de la respuesta que el modelo entrenado $\hspace{0.1cm}M\hspace{0.1cm}$ genera para la observación de test de los predictores $\hspace{0.1cm}x_i^{test}=(x^{test}_{i1},...,x^{test}_{ip})$ .


<br>

---

Teniendo todo lo anterior en cuenta, la evaluación de los modelos predictivos se realiza, sin entrar en particularidades, comparando las *predicciones de test* de la respuesta generadas por el modelo $\hspace{0.08cm}\widehat{\hspace{0.08cm}Y}^{\hspace{0.08cm}test}\hspace{0.08cm}$ con la muestra de *observaciones test* de la respuesta $\hspace{0.08cm}Y^{test}$

Ya que la muestra test juega el rol de nuevas observaciones. Y el modelo interesa para predecir nuevas observaciones. Por ello se utiliza la muestra test como muestra de prueba para ver el rendimiento del modelo al predecir la respuesta para nuevas observaciones de los predictores.



<br>

-----

<br>


# Métricas para evaluar modelos de aprendizaje supervisado


Dado el modelo predictivo  $M$ , existen varias métricas para evaluar la capacidad predictiva del modelo. Cada una de estas métricas tienen una versión de train (son calculadas usando las predicciones de train) y otra de test (son calculadas usando las predicciones de test).

Además estas métricas son diferentes en función del tipo de modelo de aprendizaje supervisado que consideremos. Vamos a considerar dos tipos, los modelos de regresión y los de clasificación supervisadas.

Se recomienda al lector haber leido previamente el articulo sobre [los problemas de regresión y clasificación supervisada y no supervisada.](http://estadistica4all.com/Articulos/Los-problemas-de-clasificaci%C3%B3n-y-regresi%C3%B3n.html)

<br>

 
A continuación vamos a exponer las métricas de evaluación más habituales para **modelos de regresión**:


## Error cuadrático medio (ECM)

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>


$\hspace{0.25cm}$ **ECM de train**

$$ECM(M)_{train} \hspace{0.1cm}=\hspace{0.1cm} \dfrac{1}{n} \cdot \sum_{i=1}^n \hspace{0.1cm} \left(\hspace{0.08cm} y_i^{\hspace{0.08cm}train} - \hat{y}_i^{\hspace{0.08cm}train} \hspace{0.08cm} \right)^2 \\$$


</p>
 
</p></span>
</div>

$\hspace{0.25cm}$ Donde:

- $y_i^{test}\hspace{0.1cm}$ es la observación de test $\hspace{0.1cm}i$-esima de la variable respuesta, es decir,   $\hspace{0.1cm}y_i^{test} \hspace{0.1cm}=\hspace{0.1cm} Y^{test}[\hspace{0.1cm} i\hspace{0.1cm}]\\$

- $\hat{y}_i^{test} \hspace{0.1cm}=\hspace{0.1cm} M(\hspace{0.1cm} x_i^{test} \hspace{0.1cm}|\hspace{0.1cm} X_1^{train},...,X_p^{train}, Y^{train}\hspace{0.1cm} )\\$

- $\hspace{0.2cm} n \hspace{0.1cm}=\hspace{0.1cm} \# \hspace{0.1cm} Y^{train} \\$





<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>


$\hspace{0.25cm}$ **ECM de test**

$$ECM(M)_{test} \hspace{0.1cm} =\hspace{0.1cm} \dfrac{1}{h} \cdot \sum_{i=1}^h \hspace{0.1cm} \left(\hspace{0.1cm} y_i^{\hspace{0.1cm}test} - \hat{y}_i^{\hspace{0.1cm}test} \hspace{0.1cm} \right)^2$$

</p>
 
</p></span>
</div>

$\hspace{0.25cm}$ Donde:

- $y_i^{test}\hspace{0.1cm}$ es la observación de test $\hspace{0.1cm}i$-esima de la variable respuesta, es decir,   $\hspace{0.1cm}y_i^{test} \hspace{0.1cm}=\hspace{0.1cm} Y^{test}[\hspace{0.1cm} i \hspace{0.1cm}] \\$

- $\hat{y}_i^{test} \hspace{0.1cm}=\hspace{0.1cm} M(\hspace{0.1cm} x_i^{test} \hspace{0.1cm}|\hspace{0.1cm} X_1^{train},...,X_p^{train}, Y^{train} \hspace{0.1cm} )\\$

- $\hspace{0.2cm} h\hspace{0.1cm}=\hspace{0.1cm}\# \hspace{0.1cm} Y^{test}$




<br>







**Observación:**

El $\hspace{0.08cm} ECM\hspace{0.08cm}$ tiene se mide en la unidad de medida que la respuesta **al cuadrado**. $\\[0.7cm]$



**Interpretación:**

Cuanto menor sea $\hspace{0.08cm}ECM\hspace{0.08cm}$ , mayor capacidad predictiva del modelo $\hspace{0.08cm}M\hspace{0.08cm}$, y a la inversa. 

<br>

**¿Por qué el ECM es tan usado en la práctica?**

Teoricamente puede demostraste que en un modelo de regresion   el error cuadratico medio de la prediccion puede descomponerse como sigue: $\\[1cm]$

$$ECM(\widehat{Y}) = E\hspace{0.1cm}[\hspace{0.1cm}(Y - \widehat{Y})^2\hspace{0.1cm}]\hspace{0.1cm} =\hspace{0.1cm} Var(\widehat{Y}) \hspace{0.1cm}+\hspace{0.1cm} Sesgo(\widehat{Y})^2 \hspace{0.1cm}+\hspace{0.1cm} \sigma_{\varepsilon}^2 \\$$



Donde:


- $Var(\widehat{Y})\hspace{0.1cm} =\hspace{0.1cm} E[\hspace{0.1cm}(\widehat{Y} - E[\widehat{Y}])^2\hspace{0.1cm}]\hspace{0.1cm}$ es la varianza de las predicciones del modelo. $\\[0.5cm]$

- $Sesgo(\widehat{Y})\hspace{0.1cm}=\hspace{0.1cm}E[\hspace{0.1cm}\widehat{Y}\hspace{0.1cm}] \hspace{0.1cm}-\hspace{0.1cm} Y\hspace{0.1cm}$ es el sesgo de las predicciones del modelo.$\\[0.5cm]$

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

$$RECM(M)_{train} = \sqrt{\dfrac{1}{n} \sum_{i=1}^n \hspace{0.1cm} \left(y_i^{train} - \hat{y}_i^{train}\right)^2 \hspace{0.2cm}} \\$$


</p>
 
</p></span>
</div>



<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>


$\hspace{0.25cm}$ **RECM de test:**


$$RECM(M)_{test} = \sqrt{ \dfrac{1}{h} \cdot \sum_{i=1}^h \hspace{0.1cm} \left(\hspace{0.1cm} y_i^{\hspace{0.1cm} test} - \hat{y}_{i} ^{\hspace{0.1cm} test} \hspace{0.1cm} \right)^2 \hspace{0.2cm}} \\[0.2cm]$$

</p>
 
</p></span>
</div>


**Observación:**

El $RECM$ tiene la misma unidad de medida que la respuesta. $\\[0.2cm]$


**Interpretación:**

Cuanto menor sea $RECM$ , mayor bondad predictiva del modelo $M$, y a la inversa.

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

Cuanto menor sea $ECR$ , mayor bondad predictiva del modelo $M$, y a la inversa.

<br>


## Coeficiente de determinación 


<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>

$\hspace{0.25cm}$ **Coeficiente de determinación de train:**

$$R_{train}^2 \hspace{0.1cm}=\hspace{0.1cm} 1 - ECR_{train} \\$$

</p>
 
</p></span>
</div>



<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>


$\hspace{0.25cm}$ **Coeficiente de determinación de train:**

$$R_{test}^2 \hspace{0.1cm}=\hspace{0.1cm} 1 - ECR_{test} \\$$

</p>
 
</p></span>
</div>


**Interpretación:**

Cuanto mayor sea $R^2$ , mayor bondad predictiva del modelo $M$, y a la inversa.

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

$$EAR(M)_{train} \hspace{0.1cm}=\hspace{0.1cm} \dfrac{\sum_{i=1}^n \hspace{0.1cm} \left|\hspace{0.1cm} y_i^{train} - \hat{y}_i^{\hspace{0.08cm} train} \hspace{0.1cm} \right| }{\sum_{i=1}^n \hspace{0.1cm} \left| \hspace{0.1cm} y_i^{train} - \overline{y}^{train} \hspace{0.1cm} \right| \hspace{0.1cm}}  \\$$


</p>
 
</p></span>
</div>



<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>

$\hspace{0.25cm}$ **EAR de test:**


$$EAR(M)_{test} \hspace{0.1cm}=\hspace{0.1cm} \dfrac{ \sum_{i=1}^h \hspace{0.1cm} \hspace{0.1cm} \left| \hspace{0.1cm} y_i^{\hspace{0.1cm} test} - \hat{y}_i^{\hspace{0.1cm} test} \hspace{0.1cm} \right| \hspace{0.1cm}  }{\sum_{i=1}^h \hspace{0.1cm}\left|\hspace{0.1cm} y_i^{\hspace{0.1cm} test} - \overline{y}^{\hspace{0.1cm} test} \hspace{0.1cm}\right|\hspace{0.1cm}}$$

</p>
 
</p></span>
</div>

<br>



----



<br>


A continuación vamos a exponer las métricas de evaluación más habituales para **modelos de clasificación supervisada**:


## Tasa de acierto en la clasificación (TAC)


<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>


$\hspace{0.25cm}$ **TAC de train:**

$$TAC(M)_{train} \hspace{0.1cm}=\hspace{0.1cm} \dfrac{1}{n} \cdot \sum_{i=1}^{n} \hspace{0.15cm} \mathbf {I} \left( \hspace{0.1cm} \hat{y}_i^{train} = y_i^{train} \hspace{0.1cm} \right)$$

</p>
 
</p></span>
</div>


<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>


$\hspace{0.25cm}$ **TAC de test:**

$$TAC(M)_{train} \hspace{0.1cm}=\hspace{0.1cm} \dfrac{1}{n} \cdot \sum_{i=1}^{n} \hspace{0.15cm} \mathbf{I} \left( \hspace{0.1cm} \hat{y}_i^{train} = y_i^{train} \hspace{0.1cm}\right)$$

</p>
 
</p></span>
</div>


<br>


 
## Tasa de error en la clasificación (TEC)



<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>

$\hspace{0.25cm}$ **TEC de train:**

$$TEC(M)_{train} \hspace{0.1cm}=\hspace{0.1cm} \dfrac{1}{n} \cdot \sum_{i=1}^{n} \hspace{0.15cm} \mathbf {I} \left( \hspace{0.05cm} \hat{y}_i^{train} \neq y_i^{train} \hspace{0.05cm} \right)$$


</p>
 
</p></span>
</div>



<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>


$\hspace{0.25cm}$ **TEC de test:**

$$TEC(M)_{test} \hspace{0.1cm}=\hspace{0.1cm} \dfrac{1}{h} \cdot \sum_{i=1}^{h} \hspace{0.15cm} \mathbf {I} \left( \hspace{0.1cm} \hat{y}_i^{\hspace{0.05cm} test} \neq y_i^{\hspace{0.05cm} test} \hspace{0.1cm}\right)$$

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

Para todo $\hspace{0.1cm}h=0,1,...,k-1$


Por tanto, para cada $\hspace{0.15cm}i=1,...,n\hspace{0.15cm}$ tenemos que: $\\[0.4cm]$

$$P\left( \hspace{0.1cm} \mathbf{I}(\hat{y}_i = y_i) = 1\hspace{0.1cm} \right) = P \left( \hspace{0.1cm} \hat{y}_i = y_i \hspace{0.1cm} \right) \hspace{0.1cm}=\hspace{0.1cm} 1/k \hspace{0.1cm}=\hspace{0.1cm} p \\$$

$$P\left( \hspace{0.1cm} \mathbf{I}(\hat{y}_i = y_i) = 0 \hspace{0.1cm} \right) \hspace{0.1cm} =\hspace{0.1cm} P\left( \hspace{0.1cm} \hat{y}_i \neq y_i \hspace{0.1cm} \right) \hspace{0.1cm}=\hspace{0.1cm} 1- 1/k  \hspace{0.1cm}=\hspace{0.1cm} 1 - p$$

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

El $k\%$ de las primeras filas del data-set serán la parte de train, y el resto la parte de test.

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


- Se entrena el modelo $\hspace{0.1cm} M\hspace{0.1cm}$ con $\hspace{0.1cm} D_{train}\hspace{0.1cm}$ $\hspace{0.2cm}\Rightarrow\hspace{0.2cm}$ $\widehat{M}\\$

- Se calcula una metrica de evaluacion sobre el modelo entrenado $\widehat{M}$ usando la muestra de test $\hspace{0.1cm} D_{test}\hspace{0.1cm}$ $\hspace{0.2cm}\Rightarrow\hspace{0.2cm}$ Si por ejemplo se calcula el $\hspace{0.1cm}ECM\hspace{0.1cm}$ , se obtendria el $\hspace{0.1cm}ECM_{test}\\$



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


Se obtiene una muestra aleatoria sin remplazo de un $hspace{0.1cm}k\%hspace{0.1cm}$ de las filas del data-set inicial, las cuales serán la parte de train, y el resto la parte de test.

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


- Se entrena el modelo $\hspace{0.1cm}M\hspace{0.1cm}$ con $\hspace{0.1cm}D_{train}\hspace{0.1cm}$ $\hspace{0.1cm}\Rightarrow\hspace{0.2cm}$  $\widehat{M}\\$

- Se calcula una métrica de evaluación sobre el modelo entrenado $\hspace{0.1cm}\widehat{M}\hspace{0.1cm}$ usando $\hspace{0.1cm}D_{test}$ $\hspace{0.2cm}\Rightarrow\hspace{0.2cm}$
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


Se obtiene una muestra aleatoria sin remplazo de un $k\%$ de las filas del data-set inicial, las cuales serán la parte de train, y el resto la parte de test.

El modelo es enetrenado con la muestra train y testado con la muestra test a través de una métrica de evaluación como las vistas en la sección anterior.

Este proceso se repite un número $B$ de veces, asi se obtienen $B$ valores de la métrica de evaluación.

La métrica de evaluacion calculada usando este método de validación es la media de dichos $B$ valores obtenidos para la métrica de evaluación escogida. Este valor medio final es la que será usado para medir el poder predictivo del modelo y compararlo con otros modelos.
 
<br>


**Decripción formal del algoritmo:**



El algoritmo de validación simple aleatoria tiene los siguientes pasos: $\\[0.4cm]$

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>


- Se obtienen $\hspace{0.1cm}B\hspace{0.1cm}$ particiones de $\hspace{0.1cm}D\hspace{0.1cm}$ en parte de train y parte de test del siguiente modo: $\\[0.4cm]$
   
   
   
    $\hspace{0.25cm}$   Sea $\hspace{0.1cm}k\in (0,1)\hspace{0.1cm}$ la proporción de filas de $\hspace{0.1cm}D\hspace{0.1cm}$ que formarán parte de la muestra de **train** (es un hiper-parametro del algoritmo): $\\[0.4cm]$


    - Se generan $\hspace{0.1cm}B\hspace{0.1cm}$  muestras aleatoria sin reemplazamiento de tamaño $\hspace{0.1cm}\lfloor k  \cdot N \rfloor\hspace{0.1cm}$  del vector $\hspace{0.1cm}(1,2,...,N)\hspace{0.1cm}$ :

      $$m_1 \hspace{0.1cm},\hspace{0.1cm} m_2 \hspace{0.1cm},\hspace{0.1cm} ...\hspace{0.1cm},\hspace{0.1cm} m_B \\[0.4cm]$$

 
      Donde: 

      $\hspace{0.25cm}m_r=(m_{r1} ,...,m_{r\lfloor k  \cdot N \rfloor})\hspace{0.15cm} \hspace{0.25cm} , \hspace{0.25cm} \forall \hspace{0.1cm} r\in\lbrace 1,...,B\rbrace$


      $\hspace{0.25cm}\lfloor \cdot \rfloor\hspace{0.1cm}$ es la función suelo, que dado un número como argumento devuelve el mayor entero menor que dicho número. $\\[0.8cm]$

    - Se obtienen las siguientes $\hspace{0.1cm}B\hspace{0.1cm}$ muestras de **train** del data-set original $\hspace{0.1cm}D \\$ 

      $$D_{train, 1}= D[m_1 , :] \hspace{0.15cm},\hspace{0.15cm} D_{train, 2}= D[m_2 , :] \hspace{0.15cm}, \dots ,\hspace{0.15cm} D_{train, B}= D[m_B , :] \\$$

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




    - Se obtienen las siguientes $\hspace{0.1cm}B\hspace{0.1cm}$ muestras de **test** del data-set original $\hspace{0.1cm}D \\$


      $$D_{test, 1}= D[m_1^c , :] \hspace{0.15cm},\hspace{0.15cm} D_{test, 2}= D[m_2^c , :] \hspace{0.15cm}, ... ,\hspace{0.15cm} D_{test, B}= D[m_B^c , :] \\$$


      Donde:

 

      $$D_{test, r} \hspace{0.1cm}=\hspace{0.1cm} D[\hspace{0.1cm}m_r^c\hspace{0.1cm} ,\hspace{0.1cm} :\hspace{0.1cm}]\hspace{0.1cm}=\hspace{0.1cm}  \begin{pmatrix}
    x_{1}^{test, r} & y_{1}^{test, r}\\
    x_{2}^{test, r} & y_{2}^{test, r}\\
    ....&...\\
    x_{\# D_{test, r}}^{test, r} & y_{\# D_{test, r}}^{test, r} 
    \end{pmatrix} \\$$ 
    
      $\hspace{0.4cm}$ es la submatriz que resulta de quedarse solo con las filas de $\hspace{0.1cm}D\hspace{0.1cm}$ que no están en $\hspace{0.1cm}D_{train}\hspace{0.1cm}$, es decir, las filas de $\hspace{0.1cm}m_r^c \\$
    
      Formalmente:  $\hspace{0.2cm} m_r^c \hspace{0.1cm}=\hspace{0.1cm}\left(\hspace{0.1cm} i =1,...,N \hspace{0.1cm} / \hspace{0.1cm} i\neq m_{rj} \hspace{0.1cm} , \hspace{0.1cm} \forall \hspace{0.1cm} j\in \lbrace 1,...,\lfloor k  \cdot N \rfloor \rbrace \hspace{0.1cm} \right) \hspace{0.15cm}$ es el complementario de $\hspace{0.15 cm}m_r \\[0.5cm]$

 
      Por tanto se obtienen $\hspace{0.1cm}B\hspace{0.1cm}$ particiones de **train** y **test** de $\hspace{0.1cm}D \\[0.8cm]$


- Para cada $\hspace{0.1cm}r\in \lbrace 1,...,B\rbrace \\$ 

- Se entrena el modelo $\hspace{0.1cm}M\hspace{0.1cm}$ con cada una de las muestras de train $\hspace{0.1cm} D_{train,r} \hspace{0.1cm}$  $\hspace{0.2cm}\Rightarrow\hspace{0.2cm}$ $\hspace{0.1cm}\widehat{M}_r \\$

- Se calcula una misma métrica de evaluación sobre el modelo entrenado $\hspace{0.1cm}\widehat{M}_r\hspace{0.1cm}$ usando la muestra de **test** $\hspace{0.1cm}D_{test,r} \\$ 

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

- Se obtienen las siguientes $\hspace{0.1cm}B\hspace{0.1cm}$ muestras  **test** del data-set original $\hspace{0.1cm}D \\$ 

    $$D_{test,1}=D[1, :] \hspace{0.1cm} ,\hspace{0.15cm} D_{test,2}=D[2, :]\hspace{0.15cm},...,\hspace{0.15cm} D_{test,B}=D[B, :] \\$$

    Donde:

    -  $D_{test,r}=D[\hspace{0.1cm}r\hspace{0.1cm}, \hspace{0.1cm}:\hspace{0.1cm}]\hspace{0.1cm}$ es la submatriz que resulta de considerar solo la fila $r$ de $D$ , es decir, es la observación $r$-esima del data-set inicial $\hspace{0.1cm}D \\$

    $$D_{test,r} \hspace{0.1cm}=\hspace{0.1cm} D[\hspace{0.1cm}r\hspace{0.1cm},\hspace{0.1cm} :\hspace{0.1cm}] \hspace{0.1cm}=\hspace{0.1cm} (x_{i1} , ..., x_{rp} , y_r)=(x_r \hspace{0.1cm} ,\hspace{0.1cm}  y_r) \\[1cm]$$



- Se obtienen las siguientes $\hspace{0.1cm}B\hspace{0.1cm}$ muestras  **train** del data-set original $\hspace{0.1cm}D \\$

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

- Se entrena el modelo $\hspace{0.1cm}M\hspace{0.1cm}$ con $\hspace{0.1cm} D_{train,r}\hspace{0.1cm}$  $\hspace{0.1cm}\Rightarrow\hspace{0.1cm}$ $\hspace{0.1cm}\widehat{M}_r \\$

- Se calcula una misma métrica de evaluación sobre el modelo entrenado $\hspace{0.1cm}\widehat{M}_r\hspace{0.1cm}$ usando la muestra de **test** $\hspace{0.1cm}D_{test,r}\hspace{0.1cm}$ 

    Supongamos que la métrica de evaluación usada es el $\hspace{0.1cm}ECM\hspace{0.1cm}$ , entonces se obtienen $\hspace{0.1cm}B\hspace{0.1cm}$ valores de esta métrica :
  
    $$ECM(\widehat{M}_1)_{test } \hspace{0.1cm} ,\hspace{0.1cm}   ECM(\widehat{M}_2)_{test } \hspace{0.1cm} , ... ,\hspace{0.1cm}  ECM(\widehat{M}_B)_{test}\\$$

    Donde: 

    - $\hspace{0.1cm} ECM_{test , r}\hspace{0.1cm}$ es el $\hspace{0.1cm}ECM\hspace{0.1cm}$ calculado sobre $\hspace{0.1cm}\widehat{M}_r\hspace{0.1cm}$ usando $\hspace{0.1cm}D_{test,r} \\$ 

    $$ECM(\widehat{M}_r)_{test } =  (\hspace{0.1cm} y_r - \hat{y}_r \hspace{0.1cm})^2$$

    $\hspace{0.2cm}$ Teniendo en cuenta que:

    - $\hat{y}_r \hspace{0.1cm}=\hspace{0.1cm} M(\hspace{0.1cm} x_r \hspace{0.1cm}|\hspace{0.1cm} D_{train,r}) \hspace{0.1cm}=\hspace{0.1cm} \widehat{M}_r (\hspace{0.1cm} x_r \hspace{0.1cm} ) \\$
    
    - $y_r\hspace{0.1cm}$ es la observacion de la muestra de test $\hspace{0.1cm} r$-esima de la variable respuesta. $\\[1cm]$

 
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

    - Existen diferentes métodos para hacer esta división. La problematica de la división es cómo hacer que las partes resultantes estén lo más balanceadas posibles respecto al numero de observaciones que contienen. \\[0.7cm]

    - Hemos desarrollado un método basado en cuantiles que permite obtener este balanceo, el cual ha sido implementado en `Python` con buenos resultados en este aspecto, como se podrá ver posteriormente en la parte de implementación. \\[0.7cm]


    -  Vamos a explicar la mecánica del método ideado: \\[0.7cm]


       - Obtenemos una muestra aleatoria sin remplazamiento $\hspace{0.1cm}m=(m_1,...,m_N)\hspace{0.1cm}$ de tamaño $N$ del vector  $\hspace{0.1cm}(1,...,N) \\$

       - El siguiente paso es dividir la muestra $\hspace{0.1cm}m\hspace{0.1cm}$ en $\hspace{0.1cm}k\hspace{0.1cm}$ partes lo mas balanceadas posibles. No queremos que unas partes tenga muchos elementos, y otras pocos. Queremos que la repartición  de los elementos de $\hspace{0.1cm}m\hspace{0.1cm}$ en las $\hspace{0.1cm}k\hspace{0.1cm}$ partes sea lo mas igualitaria posible. $\\[0.5cm]$


       - La idea es que si, por ejemplo $\hspace{0.1cm}k=10\hspace{0.1cm}$, cada una de las 10 partes en las que dividimos $\hspace{0.1cm}m\hspace{0.1cm}$ tenga un 10% de los elementos totales de $m \\$

       - Si $k=4$  se busca que cada una de las 4 partes en las que dividimos $\hspace{0.1cm}m\hspace{0.1cm}$ tenga el 25% de los elementos de $\hspace{0.1cm}m \\$

       - En general, se busca que cada una de las $\hspace{0.1cm} k\hspace{0.1cm}$ partes en las que dividimos $\hspace{0.1cm}m\hspace{0.1cm}$ tengan $\hspace{0.1cm}(1/k)\cdot 100 \%\hspace{0.1cm}$ de elementos de $\hspace{0.1cm}m\hspace{0.1cm}$, es decir, $\hspace{0.1cm} N/k\hspace{0.1cm}$ elementos de $\hspace{0.1cm}m\hspace{0.1cm}$ , puesto que m tiene N elementos.




       - Una forma de hacer esto es   usando los cuantiles $\hspace{0.1cm} Q_0 \hspace{0.1cm} , \hspace{0.1cm}  Q_{1/k} \hspace{0.1cm} ,\hspace{0.1cm}  Q_{2/k} \hspace{0.1cm} ,...,\hspace{0.1cm} Q_{(k-1)/k}\hspace{0.1cm} ,\hspace{0.1cm}  Q_1\hspace{0.1cm}$  del vector $\hspace{0.1cm}(1,...,N)\hspace{0.1cm}$ como los limites que definen las partes en las que dividiremos $\hspace{0.1cm} m=(m_1,...,m_N) \\$

       - Dichos cuantiles permiten separar $m$ en $k$ partes de un tamaño aproximadamente igual.

       - Si $\hspace{0.1cm} k=10\hspace{0.1cm}$, entonces esos cuantiles serian $\hspace{0.1cm} Q_0, Q_{0.1}, Q_{0.2}, ..., Q_{0.8}, Q_{0.9}, Q_1 \\$

       - Si $\hspace{0.1cm} k=4\hspace{0.1cm}$ , los cuantiles serian $\hspace{0.1cm} Q_0, Q_{0.25}, Q_{0.5},  Q_{0.75}, Q_1\hspace{0.1cm} \\$

          Notese que: $\hspace{0.1cm} Q_0 = Min(1,...,N) = 1\hspace{0.1cm}$ y $\hspace{0.1cm} Q_1=Max(1,...,N)=N \\$




    - Definimos las $\hspace{0.1cm} k\hspace{0.1cm}$ particiones de $m$ usando los cuantiles $\hspace{0.1cm} Q_0=1 \hspace{0.1cm},\hspace{0.1cm} Q_{1/k} \hspace{0.1cm},\hspace{0.1cm} Q_{2/k}\hspace{0.1cm},...,\hspace{0.1cm}Q_{(k-1)/k}\hspace{0.1cm},\hspace{0.1cm} Q_1=N\hspace{0.1cm}$ como sigue: $\\[0.8cm]$

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
    \end{pmatrix} = \begin{pmatrix}
    ... & ...\\
    ... & ...\\
    \text{Parte 1} \hspace{0.15cm}(p_{1,m})  & N/k \hspace{0.15cm} \text{elementos} \\
    ... & ...\\
    ----- & -----\\
    ... & ...\\ 
    \text{Parte 2}\hspace{0.15cm}(p_{2,m}) & N/k \hspace{0.15cm} \text{elementos}  \\
    ... & ...\\
    ----- & -----\\ 
    ... & ...\\
       \text{Parte 3}\hspace{0.15cm}(p_{3,m}) & N/k \hspace{0.15cm} \text{elementos} \\
    ... & ...\\
    ----- & -----\\
    ... & ...\\
    ... & ...\\
    ----- & -----\\
    ... & ...\\
    \text{Parte k}\hspace{0.15cm}(p_{k,m}) & N/k \hspace{0.15cm} \text{elementos} \\
    ... & ...\\
    \end{pmatrix}$$
    
 $\\[0.5cm]$
 
- Se obtienen la siguientes $\hspace{0.1cm}k\hspace{0.1cm}$ muestras de test: $\\[0.4cm]$


    $$D_{test, 1} \hspace{0.1cm}=\hspace{0.1cm} D[\hspace{0.1cm} p(1,m) \hspace{0.1cm} ,\hspace{0.1cm} : \hspace{0.1cm}] \hspace{0.1cm}=\hspace{0.1cm} D[\hspace{0.1cm}m[1:(\lfloor Q_{1/k} \rfloor -1)] \hspace{0.1cm},\hspace{0.1cm} : \hspace{0.1cm}]$$

    $$D_{test, 2} \hspace{0.1cm}=\hspace{0.1cm} D[\hspace{0.1cm}p(2,m)\hspace{0.1cm} ,\hspace{0.1cm} :\hspace{0.1cm}] \hspace{0.1cm}=\hspace{0.1cm} D[\hspace{0.1cm}m[1:(\lfloor Q_{1/k} \rfloor -1)]\hspace{0.1cm} ,\hspace{0.1cm}:\hspace{0.1cm}]$$

    $$\dots$$
 

    $$D_{test, k}\hspace{0.1cm} =\hspace{0.1cm} D[\hspace{0.1cm}p(k,m)\hspace{0.1cm} ,\hspace{0.1cm} :\hspace{0.1cm}] \hspace{0.1cm}=\hspace{0.1cm} D[\hspace{0.1cm}m[\lfloor Q_{(k-1)/k} \rfloor : N]\hspace{0.1cm} ,\hspace{0.1cm} :\hspace{0.1cm}] \\[0.7cm]$$

    Siguiendo la notación habitual del articulo, podemos expresar: $\\[0.6cm]$

$$
  D_{test, r} \hspace{0.1cm}=\hspace{0.1cm}\begin{pmatrix}
  x_{1}^{test, r} & y_{1}^{test, r}\\
    x_{2}^{test, r} & y_{2}^{test, r}\\
    ....&...\\
    x_{\# D_{test, r}}^{test, r} & y_{\# D_{test, r}}^{test, r} 
    \end{pmatrix} \\$$

$\\[0.3cm]$


- Se obtiene la siguientes $\hspace{0.1cm}k\hspace{0.1cm}$ muestras de train: $\\[0.4cm]$


    $$D_{train, 1} \hspace{0.1cm}=\hspace{0.1cm} D[\hspace{0.1cm}-\hspace{0.1cm}p(1,m) \hspace{0.1cm},\hspace{0.1cm} :\hspace{0.1cm}] \hspace{0.1cm}=\hspace{0.1cm} D[\hspace{0.1cm}-\hspace{0.1cm}m[1:(\lfloor Q_{1/k} \rfloor -1)] \hspace{0.1cm},\hspace{0.1cm}:\hspace{0.1cm}]$$

    $$D_{train, 2} \hspace{0.1cm}=\hspace{0.1cm} D[\hspace{0.1cm}-\hspace{0.1cm}p(2,m) \hspace{0.1cm},\hspace{0.1cm} :\hspace{0.1cm}] \hspace{0.1cm}=\hspace{0.1cm} D[\hspace{0.1cm}-\hspace{0.1cm}m[1:(\lfloor Q_{1/k} \rfloor -1)] \hspace{0.1cm},\hspace{0.1cm}:\hspace{0.1cm}]$$

    $$\dots$$
 

    $$D_{train, k} \hspace{0.1cm}=\hspace{0.1cm} D[\hspace{0.1cm}-\hspace{0.1cm}p(k,m) \hspace{0.1cm},\hspace{0.1cm} :\hspace{0.1cm}] \hspace{0.1cm}=\hspace{0.1cm} D[\hspace{0.1cm}-\hspace{0.1cm} m[\lfloor Q_{(k-1)/k} \rfloor : N] \hspace{0.1cm},\hspace{0.1cm} :\hspace{0.1cm}] \\$$


    Siguiendo la notación habitual del articulo, podemos expresar: $\\[0.6cm]$

    $$  D_{train, r} =\begin{pmatrix}   x_{1}^{train, r} & y_{1}^{train, r}\\
    x_{2}^{train, r} & y_{2}^{train, r}\\
    ....&...\\
    x_{\# D_{train, r}}^{train, r} & y_{\# D_{train, r}}^{train, r} 
    \end{pmatrix}$$


$\\[0.3cm]$

- Para $\hspace{0.1cm}r \in \lbrace 1,...,k \rbrace\hspace{0.1cm} \\$ 


- Se entrena el modelo $\hspace{0.1cm}M\hspace{0.1cm}$ con $\hspace{0.1cm} D_{train,r}$  $\hspace{0.15cm}\Rightarrow\hspace{0.15cm}$ $\hspace{0.1cm}\widehat{M}_r \\$

- Se calcula una misma métrica de evaluación sobre el modelo entrenado $\hspace{0.1cm}\widehat{M}_r\hspace{0.1cm}$ usando la muestra de **test** $\hspace{0.1cm}D_{test,r}\hspace{0.1cm}$

    Supongamos que la métrica de evaluación usada es el $\hspace{0.1cm}ECM\hspace{0.1cm}$ , entonces se obtienen $\hspace{0.1cm}k\hspace{0.1cm}$ valores de esta métrica :

    $$ECM_{test }\left(\widehat{M}_1\right) \hspace{0.1cm},\hspace{0.1cm}  ECM_{test }\left(\widehat{M}_2\right) \hspace{0.1cm}, ... ,\hspace{0.1cm} ECM_{test}\left( \widehat{M}_k \right)\\$$

    Donde: 
    
    - $ECM_{test , r}\hspace{0.1cm}$ es el $\hspace{0.1cm}ECM\hspace{0.1cm}$ calculado sobre $\hspace{0.1cm}\widehat{M}_r\hspace{0.1cm}$ usando $\hspace{0.1cm}D_{test,r}\hspace{0.1cm} \\$ 

    $$ECM_{test }\left( \hspace{0.05cm} \widehat{M}_r \hspace{0.05cm}\right) \hspace{0.1cm}=\hspace{0.1cm} \dfrac{1}{\# D_{test, r}} \cdot \sum_{i=1}^{\# D_{test, r}} \hspace{0.1cm} \left( \hspace{0.1cm} y_i^{\hspace{0.1cm}test,r} - \hat{\hspace{0.1cm}y\hspace{0.1cm}}_i^{\hspace{0.1cm}test,r} \hspace{0.1cm} \right)^2 \\$$

    Teniendo en cuenta que :

    - $\hat{\hspace{0.1cm}y\hspace{0.1cm}}_i^{\hspace{0.1cm}test,r} \hspace{0.1cm}=\hspace{0.1cm} M\left(\hspace{0.1cm} x_i^{test, r} \hspace{0.1cm}|\hspace{0.1cm} D_{train,r} \right) \hspace{0.1cm}=\hspace{0.1cm} \widehat{M}_r \left(\hspace{0.1cm} x_i^{test, r} \hspace{0.1cm} \right) \\[0.7cm]$
    
    - $x_i^{\hspace{0.1cm}test,r}\hspace{0.1cm}$ es la observación $i$-esima de la muestra de test $r$-esima de los predictores. $\\[0.7cm]$
    
    - $y_i^{\hspace{0.1cm}test,r}\hspace{0.1cm}$ es la observación $i$-esima de la muestra de test $r$-esima de la variable respuesta. $\\[1cm]$

    

- Se calcula la métrica final de evaluación del modelo como el promedio de las $\hspace{0.1cm}k\hspace{0.1cm}$ métricas calculadas en el paso anterior. Si la métrica usada fuera el ECM, entonces:

    $$ECM( {M})_{test}^{\hspace{0.08cm}*} = \dfrac{1}{k} \cdot \sum_{r=1}^k ECM_{test}(\widehat{M}_r)$$
    

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

- Si la métrica usada para evaluar el modelo es el  $\hspace{0.1cm}ECM\hspace{0.1cm}$ , entocnes se obtienen $\hspace{0.1cm}k\cdot B\hspace{0.1cm}$ valores de esta métrica:


    $$ECM_{test }\left(\hspace{0.1cm}\widehat{M}_1^{\hspace{0.1cm}1}\hspace{0.1cm}\right) \hspace{0.1cm}, ... ,\hspace{0.1cm} ECM_{test}\left(\hspace{0.1cm}\widehat{M}_k^{\hspace{0.1cm}1}\hspace{0.1cm}\right) \hspace{0.1cm},...,\hspace{0.1cm}ECM_{test }\left(\hspace{0.1cm}\widehat{M}_1^{\hspace{0.1cm}B}\hspace{0.1cm}\right) \hspace{0.1cm}, ... ,\hspace{0.1cm} ECM_{test}\left(\hspace{0.1cm}\widehat{M}_k^{\hspace{0.1cm}B} \hspace{0.1cm} \hspace{0.1cm}\right)   \\$$


    Donde: 
    
    Para $\hspace{0.1cm}r\in \lbrace 1,...,k \rbrace\hspace{0.15cm}$ y $\hspace{0.15cm} j\in \lbrace 1,...,B \rbrace\\$


    - $\widehat{M}_r^{\hspace{0.1cm}j}\hspace{0.1cm}$ es el modelo $\hspace{0.1cm}M\hspace{0.1cm}$ entrenado con la muestra de train $\hspace{0.1cm}r$-esima obtenida en la repeticion $\hspace{0.1cm}j$-esima del algoritmo k-fold, es decir,  $\hspace{0.1cm}D_{train, r}^{\hspace{0.1cm}j}\hspace{0.1cm} \\[0.7cm]$  

    - $ECM_{test }\left(\hspace{0.1cm}\widehat{M}_r^{\hspace{0.1cm}j} \hspace{0.1cm}\right)\hspace{0.1cm}$ es el $\hspace{0.1cm}ECM\hspace{0.1cm}$ calculado sobre el modelo $\hspace{0.1cm}\widehat{M}_r^{\hspace{0.1cm}j}\hspace{0.1cm}$ usando la muestra de test $\hspace{0.1cm}r$-esima obtenida en la repeticion $\hspace{0.1cm}j$-esima del algoritmo k-fold , es decir, $\hspace{0.1cm}D_{test,r}^{\hspace{0.1cm}j}\hspace{0.1cm}  \\[0.5cm]$ 

    $$ECM_{test }\left( \hspace{0.1cm} \widehat{M}_r^{\hspace{0.1cm}j} \hspace{0.1cm}\right) = \dfrac{1}{\# D_{test, r}^{\hspace{0.1cm}j}} \cdot \sum_{i=1}^{\# D_{test, r}^{\hspace{0.1cm}j}} \hspace{0.1cm} \left(\hspace{0.1cm} y_i^{\hspace{0.1cm}test,r,j} - \hat{\hspace{0.1cm}y\hspace{0.1cm}}_i^{\hspace{0.1cm}test,r,j} \hspace{0.1cm} \right)^2  \\[1cm]$$



    Considerando lo siguiente : $\\[0.5cm]$
    
 
    - $\hat{y}_i^{\hspace{0.1cm}test,r,j} \hspace{0.1cm}=\hspace{0.1cm} M(\hspace{0.1cm} x_i^{\hspace{0.1cm}test, r,j} \hspace{0.1cm}|\hspace{0.1cm} D_{train,r}^{\hspace{0.1cm}j}) \hspace{0.1cm}=\hspace{0.1cm} \widehat{M}_r^{\hspace{0.1cm}j} (\hspace{0.1cm} x_i^{test, r,j} \hspace{0.1cm} ) \\[0.7cm]$

 

    - $\left( \hspace{0.1cm} x_i^{\hspace{0.1cm} test, r,j} , y_i^{test, r,j}  \hspace{0.1cm}\right)\hspace{0.1cm}$ es la observación (fila) $\hspace{0.1cm}i$-esima de $\hspace{0.1cm}D_{test,r}^{\hspace{0.1cm} j} \\[0.7cm]$

    - $x_i^{\hspace{0.1cm}test, r,j}\hspace{0.1cm}$ es la observación $\hspace{0.1cm}i$-esima de la muestra de test $\hspace{0.1cm}r$-esima de los predictores obtenida en la repetición $\hspace{0.1cm}j$-esima del algoritmo k-folds. $\\[0.7cm]$

    - $y_i^{\hspace{0.1cm}test, r,j}\hspace{0.1cm}$ es la observacion $\hspace{0.1cm}i$-esima de la muestra de test $\hspace{0.1cm}r$-esima de la variable respuesta, obtenida en la repetición $\hspace{0.1cm}j$-esima del algoritmo k-folds. $\\[0.7cm]$


    
    Nótese que debido al componente aleatorio presente en el algoritmo k-folds, cada vez que se repita el algoritmo se obtendram muestras de train y test diferentes. $\\[1cm]$
    
    

- Se calcula la métrica final de evaluación del modelo como el promedio de las $\hspace{0.1cm}k\cdot B\hspace{0.1cm}$ métricas calculadas en el paso anterior. 

Si la métrica considerada es el $\hspace{0.1cm}ECM\hspace{0.1cm}$, entonces:

$$ECM( {M})_{test}^{\hspace{0.08cm}*} \hspace{0.1cm}= \hspace{0.1cm}\dfrac{1}{k\cdot B} \cdot \sum_{j=1}^B \sum_{r=1}^k \hspace{0.1cm}   ECM_{test}\left(\hspace{0.1cm}\widehat{M}_r^{\hspace{0.1cm}j}\hspace{0.1cm}\right)$$
    

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


- Tenemos $\hspace{0.1cm}h\hspace{0.1cm}$ modelos de aprendizaje supervisado $\hspace{0.1cm}M_1\hspace{0.05cm},\hspace{0.05cm}M_2\hspace{0.05cm},...,\hspace{0.05cm}M_h\hspace{0.05cm}$

- Se validan esos modelos usando un mismo algoritmo de validación, con una misma métrica de evaluación. Se obtendrán $\hspace{0.1cm}h\hspace{0.1cm}$ valores de la métrica, una para cada modelo. $\\[0.5cm]$

    Si la métrica fuera el ECM se tendrian por ejemplo los siguientes valores:

    $$ECM(M_1)_{test}^{\hspace{0.05cm} *} \hspace{0.1cm}, ...,\hspace{0.1cm} ECM(M_h)_{test}^{\hspace{0.05cm} *} \\$$


- El criterio es seleccionar el modelo que tienen **mejor** valor de la métrica. Si es una métrica de error, el que menor valor tiene. Si es una métrica de acierto, el que mayor valor tiene. $\\[0.8cm]$


- Si la métrica es de error, como por ejemplo el $\hspace{0.1cm}ECM\hspace{0.1cm}$, entonces: $\\[0.7cm]$

    - El modelo seleccionado es $\hspace{0.1cm}M_{j^{\hspace{0.08cm}*}}\hspace{0.1cm}$ , donde: $\\[0.5cm]$

    $$j^{\hspace{0.08cm}*} \hspace{0.1cm}=\hspace{0.1cm} arg \underset{j \in \lbrace 1,...,h\rbrace }{Min} \hspace{0.15cm}  ECM(M_j)_{test}^{\hspace{0.05cm} *} \\[1cm]$$



- Si la métrica es de acierto, como por ejemplo la $\hspace{0.1cm}TA\hspace{0.1cm}$, entonces: $\\[0.5cm]$

    - El modelo seleccionado es $\hspace{0.1cm}M_{j^{\hspace{0.08cm}*}}\hspace{0.1cm}$ , donde: $\\[0.5cm]$


    $$j^{\hspace{0.08cm}*} \hspace{0.1cm}=\hspace{0.1cm} arg \underset{j \in \lbrace 1,...,h\rbrace }{Max} \hspace{0.15cm}  TA(M_j)_{test}^{\hspace{0.05cm} *}$$


</p>
 
</p></span>
</div>

<br>



# Bibliografía


- Amat Rodrigo, J. (Noviembre 2020). Validación de modelos predictivos: Cross-validation, OneLeaveOut, Bootstraping. *Cienciadedatos*.  
https://www.cienciadedatos.net/documentos/30_cross-validation_oneleaveout_bootstrap




<br>





