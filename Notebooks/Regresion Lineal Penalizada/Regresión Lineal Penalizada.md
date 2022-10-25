---
title: 'Regresión Lineal Penalizada en Python'
author: 'Fabio Scielzo Ortiz'
date: '25/10/22'
output: 
   rmdformats::readthedown:
      use_bookdown: true
      self_contained: true
      thumbnails: true
      lightbox: true
      gallery: true
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

<br>

More articles in my blog:   $\hspace{0.1cm}$   [Estadistica4all](https://fabioscielzoortiz.github.io/Estadistica4all.github.io/)

&nbsp;

How to reference this article ? 

Scielzo Ortiz, F. (2022). Regresión Lineal Penalizada en Python. *Estadistica4all*.  [Linear Regression with Python and R](https://fabioscielzoortiz.github.io/Estadistica4all.github.io/Articulos/Linear%20Regression%20in%20Python%20and%20R.html )



<br>

# La maldición de la dimensionalidad <a class="anchor" id="1"></a>

- Si la verdadera relación entre la respuesta $Y$ y los predictores $X_1, ..., X_p$ es aproximadamente lineal, las predicciones obtenidas con el modelo de regresión lineal (estimado por MCO) tendrán un pequeño sesgo. Pero si la verdadera relación no es lineal, el sesgo será grande.


Supongamos que estamos en el mejor de los casos y que la verdadera relación entre la respuesta y los predictores es aproximadamente lineal:

- Si $\hspace{0.15cm} n\hspace{0.15cm}$ es notablemente mayor que $\hspace{0.15cm} p\hspace {0.15cm}$ $\hspace{0.15cm} (n >> p)\hspace{0.15cm}$ $\Rightarrow \hspace{0.15cm}$ las predicciones obtenidas con el modelo de regresión lineal tendrán poca varianza (además de poco sesgo, debido a la hipótesis de partida), por lo que el modelo funcionará bien con el muestra de prueba, es decir, tendrá un buen error de prueba (error de prueba comparativamente bajo). $\\[0,5 cm]$


- Si $\hspace{0.15cm} n  \approx p \hspace {0.15cm}$ $\Rightarrow \hspace {0.15cm}$ las predicciones obtenidas con el modelo de regresión lineal tendrán mucha varianza (aunque tienen poco sesgo ), por lo que el modelo tendrá un desempeño deficiente en la muestra de prueba, es decir tendrá un error de prueba malo (error de prueba comparativamente alto). $\\[0,5 cm]$

- Si $\hspace {0.15cm} n <p$ $\hspace{0.15cm} \Rightarrow \hspace{0.15cm}$ el modelo de regresión lineal (estimado por OLS) ni siquiera se puede estimar, no hay una estimación única de la coeficientes beta. Este hecho se conoce como la **maldición de la dimensionalidad**.

 <br>



> Necesitamos métodos que nos permitan obtener modelos de regresión lineal con un número de predictores **menor** que $\hspace{0.15cm} p \hspace{0.15cm}$ pero que, sin embargo, sean iguales o mejores que el nivel predictivo modelo de regresión lineal con los $\hspace {0.15cm} p \hspace{0.15cm}$ predictores.


<br>

## Demostración de la "Maldición de la Dimensionalidad"

Supongamos que $\hspace {0.12cm} p> n\hspace {0.12cm}$, entonces es obvio $\hspace {0.12cm} p+1> n\hspace {0.12cm}$


Sabemos que
$X = (1, X_1, ..., X_p) \hspace {0.12cm}$ es de tamaño $\hspace {0.12cm} n$ x $(p + 1) \hspace{0.12cm}$, entonces
$\hspace{0.12cm} X ^ t \cdot X \hspace {0.12cm}$ es de tamaño $\hspace {0.12cm} (p + 1)$ x $(p + 1)$

Y como $\hspace{0.12cm}p + 1> n\hspace{0.12cm}$, entonces $\hspace{0.12cm} Max\hspace{0.12cm} Rg(X) = n\\[0.5cm]$



Supongamos que $\hspace{0.12 cm} Rg (X) = r \leq n \hspace{0.12 cm}$,
entonces por el **teorema del rango de nulidad** tenemos que $\hspace {0.12cm} Rg(X^t\cdot X) = r$

Ya que $\hspace{0.12cm} X^t\cdot X\hspace{0.12cm}$ es $\hspace{0.12cm} (p+1) x (p+1)\hspace{0.12cm}$
entonces $\hspace{0.12cm} Max \hspace{0.12cm} Rg (X^t\cdot X) = p + 1$

Y como $\hspace{0.12cm} Rg(X^t\cdot X) = r\leq n <p+1\hspace{0.12cm}$
entonces $\hspace {0.12cm} X ^ t \cdot X\hspace {0.12cm}$ **no tiene rango máximo**

Por lo tanto, el inverso de $\hspace{0.12cm} X^t\cdot X\hspace{0.12cm}$ no existe, es decir, no existe $\hspace{0.12cm}(X^t\cdot X)^{-1}$

Por lo tanto **no existe** $\hspace{0.12cm}\widehat {\beta}=(X^t\cdot X)^{- 1}\cdot X^t\cdot Y\hspace{0.12cm}$ ya que no hay $\hspace{0.12cm}(X^t\cdot X)^{- 1}$



<br>

# Introducción a la regresión lineal penalizada



Para usar los métodos de regresion lineal penalizada, la respuesta y los predictores deben estandarizarse para que tengan media 0 y varianza 1.

Consideremos el clásico modelo de regresión lineal: 

$$y_i = \beta_0 + \beta_1 \cdot x_{i1} + \beta_2 \cdot x_{i2} + ... +  \beta_p \cdot x_{ip} + \epsilon$$

<br>

Estandarizamos los predictores $\hspace{0.1cm} X_1,...,X_p\hspace{0.1cm}$ y la respuesta $\hspace{0.1cm}Y\hspace{0.1cm}\\[0.3cm]$

$$\widetilde{Y} = \dfrac{Y - \overline{y}}{\sigma_y} \\[0.5cm]$$

$$\widetilde{X_j} = \dfrac{X_j - \overline{x_j}}{\sigma_{x_j}}$$ 

para $j=1,..,p$


Donde:

$$\overline{y} = \dfrac{1}{n} \sum_{i=1}^n y_i \hspace{0.45cm} , \hspace{0.45cm} \overline{x_j} = \dfrac{1}{n} \sum_{i=1}^n x_{ij}$$

$$\sigma_{y} = \sqrt{\sum_{i=1}^n (y_{i}- \overline{y})^2}  \hspace{0.45cm} , \hspace{0.45cm} \sigma_{x_j} = \sqrt{\sum_{i=1}^n (x_{ij}- \overline{x_j})^2}$$

<br>

El **modelo estandarizado** es:

<br>

$$\widetilde{y_i} = \beta_0 + \widetilde{\beta_1} \cdot \widetilde{x_{i1}} + \widetilde{\beta_2} \cdot \widetilde{x_{i2}} + ... +  \widetilde{\beta_p} \cdot \widetilde{x_{ip}} + \widetilde{\varepsilon_i}$$

<br>

Donde:

$\widetilde{\beta_j} = \dfrac{\sigma_{x_j}}{\sigma_{y}}\cdot \beta_j \hspace{0.7cm}$  , para $j=1,...,p$

$\beta_0 = \overline{y} - \sum_{j=1}^{p} \overline{x_j} \cdot \beta_j$

$\widetilde{\varepsilon_i} = \dfrac{\varepsilon_i}{\sigma_{Y}}$

<br>

El **modelo estandarizado estimado** es:

$$\widehat{\widetilde{y_i}} = \widehat{\beta}_0 + \widehat{\widetilde{\beta_1}} \cdot  \widetilde{x_{i1}} + \widehat{\widetilde{\beta_2}} \cdot \widetilde{x_{i2}} + ... +  \widehat{\widetilde{\beta_p}} \cdot \widetilde{x_{ip}}$$

Ahora los coeficientes betas estimados $\hspace{0.2cm}\widehat{\widetilde{\beta_1}}, \widehat{\widetilde{\beta_2}} , ..., \widehat{\widetilde{\beta_p}}\hspace{0.2cm}$ son directamente comparables ya que no dependen de las unidades de medida de los predictores ni de la respuesta, puesto que al haber estandarizado  las unidades de medida se eliminan.

Ahora si se cumple que dados dos betas estimados si  $\hspace{0.2cm}\widehat{\widetilde{\beta_r}} > \widehat{\widetilde{\beta_h}}\hspace{0.2cm}$ , entonces $\hspace{0.2cm}X_r\hspace{0.2cm}$ es mas relevante como predictor de $\hspace{0.2cm}Y\hspace{0.2cm}$ (tiene más peso) que $\hspace{0.2cm}X_h$

Esto no se cumplia en la regresion lineal ordinaria puesto que las estimaciones de los betas no eran directamente comparables al depender de las unidades de medida de la respuesta y de los predictores (ver con mas detalle en la seccion 5.2.1 del articulo [Linear Regresion](https://fabioscielzoortiz.github.io/Estadistica4all.github.io/Articulos/Linear-Regression-in-Python-and-R.html)).

Por ello betas estimados cercanos a cero no implicaban necesariamente que el predictor asociado fuese no significativo. Ya que si ese predictor se media, por ejemplo, en horas, y la respuesta en millones de euros, el beta asociado a ese predictor se media en millon de euros por hor. Asi que si tenemos un beta estimado de 0.001 millon de euros por hora, y cambiamos las unidades de la respuesta de millones de euros a simplemente euros, entonces el valor de beta estimado cambiaria a 1000 euros por hora. Es el mismo beta estimado pero habiendo cambiado solo las unidades de medida de la respuesta y los predictores, y un valor (0.001) esta mucho mas cerca del 0  que el otro (1000). 


Observación:

$0.001\cdot \dfrac{1 Millon €}{1 hora} = 0.001\cdot \dfrac{1000000 \cdot 1 €}{1 hora} = 1000\cdot \dfrac{1 €}{1 hora}$

<br>

-----

<br>

# Regresión Ridge

El modelo de regresión Ridge es básicamente un modelo de regresión lineal en el que la respuesta y los predictores están estandarizados y la estimacion de los coeficientes betas se hace resolviendo un problema de optimizacion similar (pero diferente) al de minimos cuadrados ordinarios (MCO) propio de la regresión lineal ordinaria, pero diferente, llamado **problema Ridge**:

<br>

Sea $\hspace{0.15cm}\widetilde{\beta\hspace{0.15cm}}= (\widetilde{\beta_1},\widetilde{\beta_2},...,\widetilde{\beta_p})\in   \mathbb{R}^p \hspace{0.25cm}$ y $\hspace{0.25cm} \widetilde{x_i} = (\widetilde{x_{i1}},\widetilde{x_{i2}},...,\widetilde{x_{ip}})\in  \mathbb{R}^p$

<br>

\begin{gather*}
\hspace{0.15cm}\widehat{\widetilde{\beta\hspace{0.15cm}}}\hspace{0.05cm}^{Ridge} \hspace{0.15cm} =\hspace{0.15cm}  arg \hspace{0.12cm} \underset{\widetilde{\beta\hspace{0.15cm}}}{Min} \hspace{0.2cm}  \biggl\{ \hspace{0.1cm} RSS\left(\hspace{0.12cm}\widetilde{\beta\hspace{0.15cm}}\hspace{0.12cm}\right) \hspace{0.1cm} +\hspace{0.1cm}  \lambda \cdot | | \hspace{0.06cm}\widetilde{\beta\hspace{0.15cm}} \hspace{0.06cm}||^2_2 \hspace{0.1cm} \biggl\} \hspace{0.2cm} = \hspace{0.2cm} arg \hspace{0.12cm} \underset{\widetilde{\beta\hspace{0.15cm}}}{Min} \hspace{0.2cm} \biggl\{ \hspace{0.1cm} \sum_{i=1}^{n} \hspace{0.1cm}(y_i - \beta_0 - \widetilde{x_i}\hspace{0.1cm}^t \cdot \beta)\hspace{0.02cm}^2 \hspace{0.1cm} + \hspace{0.1cm}  \lambda \cdot | | \hspace{0.06cm}\widetilde{\beta\hspace{0.15cm}} \hspace{0.06cm}||^2_2  \hspace{0.1cm} \biggl\} \hspace{0.2cm} =  \\[0.8cm]
  = \hspace{0.2cm} arg \hspace{0.12cm} \underset{\widetilde{\beta_1},\widetilde{\beta_2},...,\widetilde{\beta_p}}{Min} \hspace{0.2cm} \biggl\{ \hspace{0.1cm} \sum_{i=1}^{n} \hspace{0.1cm}(y_i - \beta_0 - \widetilde{\beta_1} \cdot \widetilde{x_{i1}} - \dots - \widetilde{\beta_p} \cdot \widetilde{x_{ip}})\hspace{0.02cm}^2  \hspace{0.1cm} + \hspace{0.1cm}  \lambda \cdot | | \hspace{0.06cm}\widetilde{\beta\hspace{0.15cm}} \hspace{0.06cm}||^2_2 \hspace{0.1cm} \biggl\}
\end{gather*}

<br>

Donde: 

- $\lambda \geq 0\hspace{0.2cm}$ es un **parámetro de penalización** $\\[0.7cm]$

- $| | \hspace{0.06cm}\widetilde{\beta\hspace{0.15cm}} \hspace{0.06cm}||^2_2 \hspace{0.1cm} = \hspace{0.1cm} \sum_{j=1}^p \hspace{0.1cm} \widetilde{\beta_j}\hspace{0.09cm}^2\hspace{0.15cm}$ es la **norma Euclidea** (al cuadrado) del vector $\hspace{0.15cm}\widetilde{\beta\hspace{0.15cm}}\hspace{0.15cm}$, la cual es una medida del tamaño del vector $\hspace{0.15cm}\widetilde{\beta\hspace{0.15cm}}\hspace{0.15cm}$.

<br>

**Observaciones :**

- La expresión $\hspace{0.15cm}\lambda \cdot | | \hspace{0.06cm}\widetilde{\beta\hspace{0.15cm}} \hspace{0.06cm}||^2_2\hspace{0.25cm}$ **penaliza** el tamaño del vector $\hspace{0.15cm}\widetilde{\beta\hspace{0.15cm}}$ 

    - Cuanto mayor sea $\hspace{0.15cm}\lambda\hspace{0.15cm}$ mayor es la penalización impuesta al tamaño del vector $\hspace{0.15cm}\widetilde{\beta} \hspace{0.15cm}$  en el problema de optimización.$\\[0.7cm]$

- Si $\hspace{0.15cm}\lambda = 0\hspace{0.15cm}$ el problema de optimizacion es el de minimos cuadrados ordinarios (MCO), propio del modelo de regresion lineal ordinario.$\\[0.7cm]$

- Si $\hspace{0.15cm}\lambda\hspace{0.15cm}$ es **muy grande**  la solucion del problema $\hspace{0.15cm}\widehat{\widetilde{\beta\hspace{0.15cm}}}\hspace{0.05cm}^{Ridge} \hspace{0.15cm}$  tendra un **tamaño** (norma Euclidea)  **muy pequeño**, es decir, los coeficientes estimados  $\hspace{0.15cm}\widehat{\widetilde{\beta_1}}, \widehat{\widetilde{\beta_2}},..., \widehat{\widetilde{\beta_p}}\hspace{0.15cm} \hspace{0.15cm} \approx \hspace{0.15cm} 0\hspace{0.25cm}$ aunque todos serán $\hspace{0.15cm}\neq 0$ $\\[0.7cm]$

- $\lambda$ debe ser seleccionado **a priori** de la resolucion del problema de optimización Ridge.

<br>

## Ventajas de la regresion Ridge sobre la regresion de minimos cuadrados ordinarios
 

- Las predicciones de la regresion por minimos cuadrados ordinarios son insesgadas pero tiene alta varianza, especialmente si $\hspace{0.15cm}p \approx n \hspace{0.15cm}$. $\hspace{0.15cm}$ Además si $\hspace{0.15cm}p>n\hspace{0.15cm}$ no se puede estimar la regresion por minimos cuadrados ordinarios.$\\[0.7cm]$

-  La regresión Ridge se basa en el equilibrio entre sesgo y varianza. Disminuye sustancialmente la varianza de las predicciones a costa de aumentar un poco su sesgo. Además, incluso si $\hspace{0.15cm}p \approx n \hspace{0.15cm}$ o $\hspace{0.15cm} p>n\hspace{0.15cm}$ , la regresion Ridge puede funcionar bien.$\\[0.7cm]$


- Como conclusión del punto anterio, si $\hspace{0.15cm}\lambda\hspace{0.15cm}$ es seleccionado correctamente, el error cuadratico medio de prediccion $\hspace{0.15cm}(ECMP)\hspace{0.15cm}$ es menor en la regresion Ridge que en la de minimos cuadrados ordinarios, lo que conduce a mayor bondad predictiva de Ridge sobre minimos cuadrados ordinarios.


<br>

## Seleccion del parametro de penalización





<br>


# Regresión Lasso

**Desventaja de la regresión Ridge:** 

El método de regresión Ridge no hace selección de predictores. Es decir, aunque la regresion Ridge puede aproximar los betas estimados a cero, no lleva a ninguno de ellos a ser exactamente cero.

Por tanto, la regresion Ridge siempre generara un modelo de regresion lineal que involucra a todos los predictores disponibles.


Incrementar $\lambda$ tendra a reducir las magnitudes de los coeficientes betas, pero  no dará lugar a la exclusion de ninguno de los predictores.


<br>

El modelo de regresión Lasso es básicamente un modelo de regresión lineal en el que la respuesta y los predictores están estandarizados y la estimacion de los coeficientes betas se hace resolviendo un problema de optimizacion similar (pero diferente) al de minimos cuadrados ordinarios (MCO) propio de la regresión lineal ordinaria, pero diferente, llamado **problema Lasso**:

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


# Regresión Elastic Net





555










