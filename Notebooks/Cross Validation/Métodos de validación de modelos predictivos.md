---
title: 'Métodos de validación de modelos predictivos'
author: 'Fabio Scielzo Ortiz'
date: '13/11/22'
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




> More articles in my blog:   $\hspace{0.1cm}$   [Estadistica4all](https://fabioscielzoortiz.github.io/Estadistica4all.github.io/)



En este articulo vamos a considerar que $M$ representa un **modelo estadistico predictivo supervisado**, como por ejemplo el modelo de regresión lineal, regresión logistica, regresión no lineal, regresión lineal penalizada, arboles de regresión y clasificación, KNN , SVM, redes neuronales ...

Notese que en este articulo no se considerar modelos estadisticos predictivos no supervisados como son los modelos de clustering como K-medias, K-medoids, modelos jerarquicos, modelos basados en densidades ...
 
Nos interesa tener un método a través del cual pueda evaluarse la bondad predictiva del modelo $M$.

Una aproximación naive es evaluar el poder predictivo del modelo a través de las predicciones que el modelo hace de la respuesta usando las propias observaciones con las que el modelo ha sido entrenado (construido). Pero esta aproximación tiende a infra-estimar el error de predicción real del modelo. Es por ello que el modelo se evalúa en la práctica usando predicciones que el modelo hace para  observaciones con las que el modelo no ha sido entrenado(observaciones que no ha "visto").



Los métodos de validación de modelos predictivos tiene tres elementos:

1) Una muestra de **train** y otra de **test**
2) Una **métrica de evaluación**
3) Un **algoritmo** para **evaluar el modelo** usando los elementos 1) y 2)


A continuacion vamos a hacer un tour por dichos elementos.


<br>

# Muestras de train y test <a class="anchor" id="1"></a>


Tenemos una muestra  de $\hspace{0.1cm}N\hspace{0.1cm}$ observaciones de $\hspace{0.1cm}p\hspace{0.1cm}$ predictores $\hspace{0.1cm}(\mathcal{X}_1,...,\mathcal{X}_p)\hspace{0.1cm}$ y  de la respuesta $\hspace{0.1cm}\mathcal{Y}\\$ 


$$D=[X_1,...,X_p,Y]=\begin{pmatrix}
    x_{11}&x_{12}&...&x_{1p}& y_1\\
    x_{21}&x_{22}&...&x_{2p} & y_2\\
    &...&\\
    x_{N1}&x_{N2}&...&x_{Np}& y_N
    \end{pmatrix} = \begin{pmatrix}
    x_{1}& y_1\\
    x_{2}& y_2\\
    ...&...\\
    x_{N}& y_N
    \end{pmatrix} \\$$


<br>

Sin entrar aquí en particularidades, para evaluar un modelo predictivo supervisado $\hspace{0.1cm} M\hspace{0.1cm}$ este tiene que ser entrenado con un subconjunto de $n$ filas de $\hspace{0.1cm}D\hspace{0.1cm}$ , llamado muestra de entrenamiento $\hspace{0.1cm}D_{train}\hspace{0.1cm}$, y testado/evaluado con el subconjunto de las $h$ filas restantes de $\hspace{0.1cm}D\hspace{0.1cm}$ llamado  muestra de test $\hspace{0.1cm}D_{test}\hspace{0.1cm}$ , de modo tal que $\hspace{0.1cm}n+h=N$ 

Los métodos de validación típicos usan de algún modo $\hspace{0.1cm}D_{train}\hspace{0.1cm}$ y  $\hspace{0.1cm}D_{test}\hspace{0.1cm}$ , junto con una **métrica de evaluación**, es por ello  que vamos a definir estos elementos con mas precisión a continuación.



<br>

## Train-set

 
Los elementos antes mencionados se definen formalmente como sigue:

- **Muestra train** de $n$ observaciones  del predictor $\hspace{0.1cm}\mathcal{X}_j\\$

$$X_j^{train} = (x_{1j}^{train},...,x_{nj}^{train} )^t \hspace{0.45cm} \forall j=1,...,p \\$$

- **Muestra train** de $\hspace{0.1cm}n\hspace{0.1cm}$ observaciones de la respuesta $\hspace{0.1cm}\mathcal{Y}$

$$Y^{train}= (y_{1}^{train},...,y_n^{train})^t \\$$

- **Train-set**

$$D_{train}(\mathcal{X}_1,...,\mathcal{X}_p, \mathcal{Y})=[X_1^{train},...,X_p^{train}, Y^{train}] =  \begin{pmatrix}
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

<br>

**Observaciones:**

- La fila $\hspace{0.08cm} i\hspace{0.08cm}$ de $D_{train}$ , es decir, $\hspace{0.08cm}(x_i^{train},y_i^{train}) = (x_{i1}^{train}, x_{i2}^{train},...,x_{ip}^{train}, y_i^{train})\hspace{0.08cm}$, es la $\hspace{0.08cm}i$-esima observación de *train* de los predictores y la respuesta $\hspace{0.08cm}(\mathcal{X}_1,...,\mathcal{X}_p, \mathcal{Y}) \\$

- $\hspace{0.08cm} D_{train}\hspace{0.08cm}$ también es llamada simplemente **observaciones de train** de $\hspace{0.08cm}(\mathcal{X}_1,...,\mathcal{X}_p, \mathcal{Y})$


<br>

Como $M$ es un modelo predictivo supervisado es capaz de, una vez es entrenado  con las observaciones de   $\hspace{0.08cm}D_{train}=[X_1^{train},...,X_p^{train}, Y^{train}]\hspace{0.08cm}$ , generar predicciones de la respuesta $\hspace{0.08cm}\mathcal{Y}\hspace{0.08cm}$  , usando tanto las propias **observaciones de train** como   **nuevas observaciones** de los predictores $\hspace{0.08cm}(\mathcal{X}_1,...,\mathcal{X}_p)$ . 

Notese que $M$ nos interesa realmente para predecir la respuesta para **nuevas observaciones** de los predictores, es decir, para predecir la respuesta para individuos/elementos de los que tenemos información sobre los predictores pero no sobre la respuesta.  


<br>

Las **predicciones de train** de la respuesta $\hspace{0.08cm}\mathcal{Y}\hspace{0.08cm}$ ,  son obtenidas aplicando el modelo predictivo *entrenado* a las observaciones de train de los predictores:


$$\widehat{\hspace{0.08cm} Y}^{\hspace{0.08cm} train} = M\left(\hspace{0.08cm} D_{train}(\mathcal{X}_1,...,\mathcal{X}_p) \hspace{0.1cm}|\hspace{0.1cm} D_{train}(\mathcal{X}_1,...,\mathcal{X}_p, \mathcal{Y}) \hspace{0.08cm} \right) = M\left(\hspace{0.08cm} X_1^{train},...,X_p^{train} \hspace{0.1cm}|\hspace{0.1cm} X_1^{train},...,X_p^{train}, Y^{train} \hspace{0.08cm}\right)$$

<br>

**Observaciones:**

- Aqui $\hspace{0.08cm}M( z | w)\hspace{0.08cm}$ representa una función de dos argumentos, el argumento posterior a $\hspace{0.08cm}|\hspace{0.08cm}$ , es decir $w$, son los datos de predictores y respuestas con los que se entrena el modelo $\hspace{0.08cm}M\hspace{0.08cm}$ , y el argumento previo a $\hspace{0.08cm}|\hspace{0.08cm}$ , es decir $\hspace{0.08cm}z$, son los datos de los predictores que el modelo $\hspace{0.08cm}M\hspace{0.08cm}$ usa para generar predicciones de la respuesta. Y devuelve un vector con esas predicciones de la respuesta. $\\[1cm]$



- $\widehat{\hspace{0.08cm} Y}^{\hspace{0.08cm} train}=(\hat{y}_1^{train},..., \hat{y}_n^{train})^t\hspace{0.08cm}$ es un vector con las predicciones de la respuesta hechas por el modelo entrenado $\hspace{0.08cm}M\hspace{0.08cm}$  usando la muestra train de observaciones de los predictores $\hspace{0.08cm}(X_1^{train},...,X_p^{train}) \\$

- $\widehat{y}_i = M(x_i \hspace{0.1cm}|\hspace{0.1cm} D_{traint}(\mathcal{X}_1,...,\mathcal{X}_p, \mathcal{Y}) ) = M(x_{i1}^{train},...,x_{ip}^{train} \hspace{0.1cm}|\hspace{0.1cm} X_1^{train},...,X_p^{train}, Y^{train})\hspace{0.08cm}$ es la predicción de la variable respuesta generada por el modelo entrenado $M$ usando la observación de train de los predictores $\hspace{0.08cm}x_i^{train}=(x_{i1}^{train},...,x_{ip}^{train})$





<br>

## Test-set


- **Muestra test** de $\hspace{0.08cm}h\hspace{0.08cm}$ observaciones   del predictor $\hspace{0.08cm}\mathcal{X}_j\\$

$$X_j^{test}=(x^{test}_{1j},...,x^{test}_{hj} )^t  \hspace{0.45cm} \forall j=1,...,p\\$$

-  **Muestra test** de $\hspace{0.08cm}h\hspace{0.08cm}$ observaciones  de la respuesta $\hspace{0.08cm}\mathcal{Y}\\$

$$Y^{test}=(y^{test}_{1},...,y^{test}_{h} )^t  \hspace{0.45cm} \forall j=1,...,p \\$$


- **Test-set**

$$D_{test}(\mathcal{X}_1,...,\mathcal{X}_p, \mathcal{Y}) = [X_1^{test},...,X_p^{test}, Y^{test}]= \begin{pmatrix}
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


<br>

**Observaciones:**

- La fila $\hspace{0.08cm}i\hspace{0.08cm}$ de $\hspace{0.08cm}D_{test}(\mathcal{X}_1,...,\mathcal{X}_p, \mathcal{Y})\hspace{0.08cm}$ , es decir, $\hspace{0.08cm}(x_i^{test},y_i^{test})= (x^{test}_{i1}, x^{test}_{i2},...,x^{test}_{ip}, y_i^{test})\hspace{0.08cm}$, es la $\hspace{0.08cm}i$-esima observación de *test* de los predictores y la respuesta $\hspace{0.08cm}(\mathcal{X}_1,...,\mathcal{X}_p, \mathcal{Y})\\$


- $\hspace{0.08cm} D_{test}\hspace{0.08cm}$ también es llamada simplemente **observaciones de test** de $\hspace{0.08cm}(\mathcal{X}_1,...,\mathcal{X}_p, \mathcal{Y})$

<br>

Como ya se dijo antes:

Puesto que $M$ es un modelo predictivo supervisado es capaz de, una vez es entrenado  con las observaciones de   $\hspace{0.08cm}D_{train}=[X_1^{train},...,X_p^{train}, Y^{train}]\hspace{0.08cm}$ , generar predicciones de la respuesta $\hspace{0.08cm}\mathcal{Y}\hspace{0.08cm}$  , usando tanto las propias **observaciones de train** como   **nuevas observaciones** de los predictores $\hspace{0.08cm}(\mathcal{X}_1,...,\mathcal{X}_p)$ . 


Notese que $M$ nos interesa realmente para predecir la respuesta para **nuevas observaciones** de los predictores, es decir, para predecir la respuesta para individuos/elementos de los que tenemos información sobre los predictores pero no sobre la respuesta.  


<br>

Las **predicciones de test** de la respuesta $\hspace{0.08cm}\mathcal{Y}\hspace{0.08cm}$ ,   son obtenidas aplicando el **modelo** predictivo **entrenado** a las observaciones de **test**:



 $$\widehat{Y}^{test} = M(D_{test}(\mathcal{X}_1,...,\mathcal{X}_p) \hspace{0.1cm}|\hspace{0.1cm} \text{Train-set}(\mathcal{X}_1,...,\mathcal{X}_p, \mathcal{Y})) = M(X_1^{test},...,X_p^{test} \hspace{0.1cm}|\hspace{0.1cm} X_1,...,X_p, Y)$$


<br>

**Observaciones:**


- Aqui $\hspace{0.08cm}M( z | w)\hspace{0.08cm}$ representa una función de dos argumentos, el argumento posterior a $\hspace{0.08cm}|\hspace{0.08cm}$ , es decir $w$, son los datos de predictores y respuestas con los que se entrena el modelo $\hspace{0.08cm}M\hspace{0.08cm}$ , y el argumento previo a $\hspace{0.08cm}|\hspace{0.08cm}$ , es decir $\hspace{0.08cm}z$, son los datos de los predictores que el modelo $\hspace{0.08cm}M\hspace{0.08cm}$ usa para generar predicciones de la respuesta. Y devuelve un vector con esas predicciones de la respuesta. $\\[1cm]$


- $\widehat{\hspace{0.08cm}Y}^{\hspace{0.08cm}test}=(\hat{y}_1^{\hspace{0.08cm}test},..., \hat{y}_h^{\hspace{0.08cm}test})^t\hspace{0.08cm}$ es un vector con las predicciones de la respuesta hechas por el modelo entrenado $\hspace{0.08cm}M\hspace{0.08cm}$  usando la muestra test de observaciones de los predictores $\hspace{0.08cm}(X_1^{test},...,X_p^{test})$

- $\hat{y}_i^{test} = M(x_i^{test} \hspace{0.1cm}|\hspace{0.1cm} D_{train}(\mathcal{X}_1,...,\mathcal{X}_p, \mathcal{Y}) ) = M(x^{test}_{i1},...,x^{test}_{ip} \hspace{0.1cm}|\hspace{0.1cm} X_1,...,X_p, Y)\hspace{0.08cm}$ es la prediccion de la respuesta que el modelo entrenado $\hspace{0.08cm}M\hspace{0.08cm}$ genera usando la observacion de test $\hspace{0.08cm}x_i^{test}=(x^{test}_{i1},...,x^{test}_{ip})$


<br>


>Teniendo todo lo anterior en cuenta, la evaluación de los modelos predictivos se realiza, sin entrar en particularidades, comparando las *predicciones de test* de la respuesta que hace el modelo $\hspace{0.08cm}\widehat{\hspace{0.08cm}Y}^{\hspace{0.08cm}test}\hspace{0.08cm}$ frente a la muestra de *observaciones test* de la respuesta $\hspace{0.08cm}Y^{test}$





<br>

-----

<br>


# Métricas para evaluar modelos estadisticos predictivos


Dado el modelo predictivo  $M$ , existen varias métricas para evaluar la bondad predictiva del modelo. Y cada una de estas métricas tienen una versión de train (son calculadas usando las predicciones de train) y otra de test (son calculadas usando las predicciones de test).

<br>

## Modelos predictivos con variable respuesta cuantitativa: **Modelos de Regresión**

A continuación vamos a exponer las métricas de evaluación más habituales para modelos de regresión:


### Error cuadrático medio (ECM)

**ECM de train**

$$ECM_{train}(M) = \dfrac{1}{n} \cdot \sum_{i=1}^n \hspace{0.1cm} (\hspace{0.08cm} y_i^{\hspace{0.08cm}train} - \hat{y}_i^{\hspace{0.08cm}train} \hspace{0.08cm})^2 \\$$




**ECM de test**

$$ECM_{test}(M) = \dfrac{1}{h} \cdot \sum_{i=1}^h \hspace{0.1cm} (\hspace{0.1cm} y_i^{\hspace{0.1cm}test} - \hat{y}_i^{\hspace{0.1cm}test} \hspace{0.1cm} )^2$$

<br>

Donde: $\hspace{0.15cm} n=\# Y^{test}\hspace{0.2cm}$, $\hspace{0.2cm} h=\# Y^{test} \\$




**Observación:**

El $\hspace{0.08cm} ECM\hspace{0.08cm}$ tiene se mide en la unidad de medida que la respuesta al cuadrado. $\\[0.3cm]$


**Interpretación:**

Cuanto menor sea $\hspace{0.08cm}ECM\hspace{0.08cm}$ , mayor bondad predictiva del modelo $\hspace{0.08cm}M\hspace{0.08cm}$, y a la inversa. 

<br>

**¿Por qué el ECM es tan usado en la práctica?**

Teoricamente puede demostraste que en un modelo de regresion que el error cuadratico medio de la prediccion puede descomponerse como sigue: $\\[1cm]$

$$ECM(\widehat{Y}) = E[(Y - \widehat{Y})^2] = Var(\widehat{Y}) + Sesgo(\widehat{Y})^2 + \sigma_{\varepsilon}^2 \\$$



Donde:


$$Var(\widehat{Y})= E[(\widehat{Y} - E[\widehat{Y}])^2] \\$$

$$Sesgo(\widehat{Y})=E[\widehat{Y}] - Y \\$$


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

### Raiz del error cuadrático medio (RECM)

**RECM de train:**

$$RECM_{train}(M) = \sqrt{\dfrac{1}{n} \sum_{i=1}^n \hspace{0.1cm} (y_i^{train} - \hat{y}_i^{train})^2 \hspace{0.2cm}} \\$$


**RECM de test:**


$$RECM_{test}(M) = \sqrt{ \dfrac{1}{h} \cdot \sum_{i=1}^h \hspace{0.1cm} (\hspace{0.1cm} y_i^{\hspace{0.1cm} test} - \hat{y}_{i} ^{\hspace{0.1cm} test} \hspace{0.1cm})^2 \hspace{0.2cm}} \\[0.2cm]$$


**Observación:**

El $RECM$ tiene la misma unidad de medida que la respuesta. $\\[0.2cm]$


**Interpretación:**

Cuanto menor sea $RECM$ , mayor bondad predictiva del modelo $M$, y a la inversa.

 <br>



### Error cuadratico relativo (ECR)

**ECR de train:**

$$ECR_{train}(M) = \dfrac{\hspace{0.5cm} \sum_{i=1}^n \hspace{0.1cm} (y_i^{train}- \hat{y}_i^{train})^2 \hspace{0.5cm}}{\sum_{i=1}^n \left( y_i^{train} - \overline{Y \hspace{0.1cm}}^{\hspace{0.1cm} train} \right)^2 }  \\$$


**ECR de test:**

$$ECR_{test}(M) = \dfrac{ \hspace{0.5cm} \sum_{i=1}^h \hspace{0.1cm} (\hspace{0.1cm} y_i^{\hspace{0.1cm} test} - \hat{y}_i^{\hspace{0.1cm} test} \hspace{0.1cm})^2 \hspace{0.5cm}    }{\sum_{i=1}^h \left(\hspace{0.1cm} y_i^{\hspace{0.1cm} test} - \overline{Y \hspace{0.1cm}}^{\hspace{0.1cm} test} \hspace{0.1cm} \right)^2 } \\$$


**Interpretación:**

Cuanto menor sea $ECR$ , mayor bondad predictiva del modelo $M$, y a la inversa.

<br>


### Coeficiente de determinación 

**Coeficiente de determinación de train:**

$$R_{train}^2 = 1 - ECR_{train} \\$$


**Coeficiente de determinación de train:**

$$R_{test}^2 = 1 - ECR_{test} \\$$



**Interpretación:**

Cuanto mayor sea $R^2$ , mayor bondad predictiva del modelo $M$, y a la inversa.

<br>

 
### Error absoluto medio (EAM)

**EAM de train:**

$$EAM_{train}(M) = \dfrac{1}{n} \cdot \sum_{i=1}^n | y_i^{train} - \hat{y}_i^{train} | \\$$


**EAM de test:**


$$EAM_{test}(M) = \dfrac{1}{h} \cdot \sum_{i=1}^h \hspace{0.1cm} | \hspace{0.1cm} y_i^{\hspace{0.1cm}test} - \hat{y}_i^{\hspace{0.1cm}test} \hspace{0.1cm} |$$



<br>

### Error absoluto relativo (EAR)

**EAR de train:**

$$EAM_{train}(M) = \dfrac{\sum_{i=1}^n |\hspace{0.08cm} y_i^{train} - \hat{y}_i^{\hspace{0.08cm} train} | }{\sum_{i=1}^n | y_i - \overline{y} |}  \\$$


**EAR de test:**


$$EAM_{train}(M) = \dfrac{ \sum_{i=1}^n \hspace{0.1cm} | \hspace{0.1cm} y_i^{\hspace{0.1cm} test} - \hat{y}_i^{\hspace{0.1cm} test} \hspace{0.1cm} |  }{\sum_{i=1}^n | y_i^{\hspace{0.1cm} test} - \overline{y}^{\hspace{0.1cm} test} |}$$


<br>











<br>

## Modelos predictivos con variable respuesta categorica: Modelos de Clasificación Supervisada


A continuación vamos a exponer las métricas de evaluación más habituales para modelos de clasificación supervisada:


### Tasa de acierto en la clasificación (TAC)

**TAC de train:**

$$TAC_{train}(M) = \dfrac{1}{n} \cdot \sum_{i=1}^{n} \hspace{0.05cm} \mathbf {1} ( \hspace{0.05cm} \hat{y}_i^{train} = y_i^{train} \hspace{0.05cm})$$


**TAC de test:**

$$TAC_{train}(M) = \dfrac{1}{n} \cdot \sum_{i=1}^{n} \hspace{0.05cm} \mathbf {1} ( \hspace{0.05cm} \hat{y}_i^{train} = y_i^{train} \hspace{0.05cm})$$

<br>


 
### Tasa de error en la clasificación (TEC)

**TEC de train:**

$$TEC_{train}(M) = \dfrac{1}{n} \cdot \sum_{i=1}^{n} \hspace{0.05cm} \mathbf {1} ( \hspace{0.05cm} \hat{y}_i^{train} \neq y_i^{train} \hspace{0.05cm})$$


**TEC de test:**

$$TEC_{test}(M) = \dfrac{1}{h} \cdot \sum_{i=1}^{h} \hspace{0.05cm} \mathbf {1} ( \hspace{0.05cm} \hat{y}_i^{\hspace{0.05cm} test} \neq y_i^{\hspace{0.05cm} test} \hspace{0.05cm})$$


<br>

### Kappa

Suponemos que una variable respuesta tiene $\hspace{0.05cm}k \geq 2\hspace{0.05cm}$ categorias

Si usamos un modelo de clasificación basado en la distribución de probabilidad uniforme discreta, este predice cada categoria de la respuesta con igual probabilidad $\hspace{0.05cm}1/k\hspace{0.05cm}$, por lo que la tasa de acierto del modelo esperada es $\hspace{0.05cm}1/k$, es decir, si el modelo se aplica muchas veces, la $\hspace{0.08cm} TAC\hspace{0.08cm}$ **media** será de $1/k$


**Kappa de train:**

$$Kappa_{\hspace{0.05cm} train}(M) = \dfrac{TAC_{\hspace{0.05cm} train} - 1/k}{1 - 1/k}$$


**Kappa de test:**

$$Kappa_{\hspace{0.05cm} test}(M) = \dfrac{TAC_{\hspace{0.05cm} test} - 1/k}{1 - 1/k}$$

<br>

#### Modelo de clasificación aleatoria uniforme

Dada una respuesta $\mathcal{Y}$ con $k\geq 2$ categorias  y  de una serie de predictotres $\mathcal{X}_1 , ..., \mathcal{X}_p$

Dada una muestra de $n$ observaciones de $Y$ del predictor  
y una muestra $X_j$ del predictor $\mathcal{X}_j \\$


Un modelo de clasificación aleatorio basado en la distribución discreta $U{0,1,..., k-1}$ es un modelo tal que:

$$\widehat{y}_i \sim U{0,1,..., k-1}$$

Por lo que:

$$P(\widehat{y}_i = h) = 1/k = p$$ 

Para todo $h=0,1,...,k-1$


Por tanto, $para cada i=1,...,n$ tenemos que:

$$P(I(\hat{y}_i = y_i) = 1) = P(\hat{y}_i = y_i) = 1/k = p$$

$$P(I(\hat{y}_i = y_i) = 0) = P(\hat{y}_i \neq y_i) = 1- 1/k  = 1 - p$$

Por lo que $I(\hat{y}_i = y_i)$  es una variable binaria, con probabilidad de exito $p$ y de fracaso $1-p$, es decir:

$$I(\hat{y}_i = y_i)  \sim Bernoulli(p=1/k)$$


Por lo tanto:

$$\sum_{i=1}^n I(\hat{y}_i = y_i) \sim Binomial(n\cdot p )$$

Asi que, la tasa de acierto  esperada del modelo de clasificación aleatoria uniforme es:


$$E\left[TAC\right] = E\left[ \dfrac{1}{n} \sum_{i=1}^n I(\hat{y}_i = y_i) \right]= E\left[  \dfrac{1}{n} \cdot Binomial(n\cdot p )  \right] = \dfrac{1}{n} \cdot E\left[ Binomial(n\cdot p )   \right]  = \dfrac{1}{n} \cdot (n\cdot p) = p = 1/k$$

<br>


<br>



# Algoritmos de validación de modelos predictivos



Los algoritmos de validación permiten evaluar la bondad predictiva de modelos predictivos. Se suelen basar en:


1) División del data-set en parte de train y parte de test.

2) Entrenamiento del modelo con la parte de train.

3) Cálculo de una métrica de evaluación con la parte de test.

<br>

Tenemos un modelo predictivo $\hspace{0.1cm}M\hspace{0.1cm}$ y una muestra  de $\hspace{0.1cm}N\hspace{0.1cm}$ observaciones de $\hspace{0.1cm}p\hspace{0.1cm}$ predictores $\hspace{0.1cm}(\mathcal{X}_1,...,\mathcal{X}_p)\hspace{0.1cm}$ y  de la respuesta $\hspace{0.1cm}\mathcal{Y}\\$ 

 $$D=[X_1,...,X_p,Y]=\begin{pmatrix}
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

**Decripción no formal del algoritmo:**


Este algoritmo de validacion consiste en dividir el data-set inicial en una parte de train y otra de test de manera no aleatoria.

El $k\%$ de las primeras filas del data-set serán la parte de train, y el resto la parte de test.

El modelo es enetrenado con la muestra train y testado calculando una métrica de evaluación con la muestra test. Este valor de la métrica de evaluación es el que será usado para medir el poder predictivo del modelo y compararlo con otros modelos. 


**Decripción formal del algoritmo:**

El algoritmo de validación simple no aleatoria tiene los siguientes pasos: $\\[0.3cm]$

$1)\hspace{0.1cm}$ Se divide $\hspace{0.1cm}D\hspace{0.1cm}$ en parte de train y parte de test del siguiente modo: $\\[0.4cm]$

Sea $\hspace{0.1cm}k\in (0,1)\hspace{0.1cm}$ la proporción de filas de $\hspace{0.1cm}D\hspace{0.1cm}$ que formaran parte del muestra de **train** (es un hiper-parametro del algoritmo): $\\[0.4cm]$

Las primeras $\hspace{0.2cm}\lfloor k  \cdot N \rfloor\hspace{0.2cm}$ observaciones (filas) definen el conjunto de train:$\\[0.6cm]$

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
    \end{pmatrix} \\$$
    
    
Donde:

$\# D_{train}\hspace{0.1cm}$ es el número de **filas** de $\hspace{0.1cm}D_{train}$

<br>

Las siguientes $\hspace{0.2cm} N - \lfloor k  \cdot N \rfloor\hspace{0.2cm}$ observaciones definen (filas) el conjunto de test: $\\[0.6cm]$ 

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
    \end{pmatrix} \\$$
 
    
    
Donde:

$\# D_{test}\hspace{0.1cm}$ es el número de **filas** de $\hspace{0.1cm}D_{test}$

$\hspace{0.1cm} \lfloor \cdot \rfloor\hspace{0.1cm}$ es la funcion suelo, que dado un número como argumento te  devuelve el mayor entero menor que dicho número $\\[0.5cm]$


$2)\hspace{0.1cm}$ Se entrena el modelo $\hspace{0.1cm} M\hspace{0.1cm}$ con $\hspace{0.1cm} D_{train}\hspace{0.1cm}$ $\hspace{0.1cm}\Rightarrow\hspace{0.2cm}$ $\widehat{M}\\$

$3)\hspace{0.1cm}$ Se calcula una metrica de evaluacion sobre el modelo entrenado  con $\hspace{0.1cm} D_{test}\hspace{0.1cm}$ $\hspace{0.1cm}\Rightarrow\hspace{0.1cm}$ Si por ejemplo se calcula el $\hspace{0.1cm}ECM\hspace{0.1cm}$ , se obtendria el $\hspace{0.1cm}ECM_{test}\\$



$4)\hspace{0.1cm}$ La métrica de evaluación final del modelo es la obtenida en el paso 3) 

Si la métrica empleada en 3) fue el $\hspace{0.1cm}ECM\hspace{0.1cm}$ , entonces:

$$ECM_{test}^*(M) \hspace{0.1cm}=\hspace{0.1cm} ECM_{test}(\widehat{M}) \hspace{0.1cm}=\hspace{0.1cm} \dfrac{1}{\# D_{test}} \cdot \sum_{i=1}^{\# D_{test}} \hspace{0.1cm} (y_i^{test} - \hat{y}_i^{test} )^2 \\$$


Donde:

$$\hat{y}_i^{test} \hspace{0.1cm}=\hspace{0.1cm} \widehat{M}(\hspace{0.1cm} x_i^{test} \hspace{0.1cm}|\hspace{0.1cm} D_train)$$


<br>

**Problemas**

Toda la validación queda condicionada a solo una muestra de train y otra de test. Si alguna de estas muestras tienen defectos, estos se van a trasladar a la validación, que será por tanto defectuosa. Es la primera aproximación naive a los algoritmos de validación.


<br>

<br>

## Validación simple aleatoria

**Decripción no formal del algoritmo:**


Este algoritmo de validacion consiste en dividir el data-set inicial en una parte de train y otra de test de manera aleatoria.


Se obtiene una muestra aleatoria sin remplazo de un $k\%$ de las filas del data-set inicial, las cuales serán la parte de train, y el resto la parte de test.

El modelo es entrenado con la muestra train y testado calculando un métrica de evaluación con la muestra de test. Este valor de la métrica de evaluación es el que será usado para medir el poder predictivo del modelo y compararlo con otros modelos. la muestra test a través de una métrica de evaluación.
 
<br>


**Decripción formal del algoritmo:**


El algoritmo de validación simple   aleatoria tiene los siguientes pasos: $\\[0.3cm]$

$1)\hspace{0.1cm}$ Se divide $\hspace{0.1cm}D\hspace{0.1cm}$ en parte de train y parte de test del siguiente modo: $\\[0.4cm]$

Sea $\hspace{0.1cm}k\in (0,1)\hspace{0.1cm}$ la proporción de filas de $\hspace{0.1cm}D\hspace{0.1cm}$ que formarán parte de la muestra de **train** (es un hiper-parametro del algoritmo): $\\[0.4cm]$

$\hspace{0.3cm} 1.1)\hspace{0.1cm}$ Se genera una muestra aleatoria sin reemplazamiento de tamaño $\hspace{0.1cm} \lfloor k  \cdot N \rfloor\hspace{0.1cm}$  del vector $\hspace{0.1cm}(1,2,...,N) \\$


$$m=(m_1 ,m_2,...,m_{\lfloor k  \cdot N \rfloor}) \\$$

$\hspace{0.3cm} 1.2)\hspace{0.1cm}$ Las observaciones (filas) $\hspace{0.1cm}m=(m_1,m_2 ,...,m_{\lfloor k  \cdot N \rfloor})\hspace{0.1cm}$ de $\hspace{0.1cm}D\hspace{0.1cm}$  definen la muestra de train: $\\[0.4cm]$

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

$\# D_{train}\hspace{0.1cm}$ es el número de **filas** de $\hspace{0.1cm}D_{train}$

<br>


$\hspace{0.3cm} 1.3)\hspace{0.1cm}$ Las observaciones (filas) de $\hspace{0.1cm}D\hspace{0.1cm}$ complementarias a  $\hspace{0.1cm}m\hspace{0.1cm}$ , es decir, las filas de $\hspace{0.1cm}D\hspace{0.1cm}$ que no estan en $\hspace{0.1cm}D_{train}\hspace{0.1cm}$, es decir, las filas de $\hspace{0.1cm}m^c\hspace{0.1cm}$,
 definen la muestra de test:  $\\[0.4cm]$
 
 $$D_{test} = D[m^c , :] =  \begin{pmatrix}
    x_{1}^{test} & y_{1}^{test}\\
    x_{2}^{test} & y_{2}^{test}\\
    ....&...\\
    x_{\# D_{test}}^{test} & y_{\# D_{test}}^{test}\\
    \end{pmatrix} \\$$



Donde: 

$\# D_{test}\hspace{0.1cm}$ es el número de **filas** de $\hspace{0.1cm}D_{test}$

 
$\lfloor \cdot \rfloor\hspace{0.1cm}$ es la funcion suelo, que dado un número como argumento te  devuelve el mayor entero menor que dicho número

$m^c=(\hspace{0.1cm} i =1,...,N \hspace{0.1cm}/\hspace{0.1cm} i\neq m_j \hspace{0.1cm},\hspace{0.1cm} \forall j=1,...,\lfloor k  \cdot N \rfloor \hspace{0.1cm}) \\$


$2)\hspace{0.1cm}$ Se entrena el modelo $\hspace{0.1cm}M\hspace{0.1cm}$ con $\hspace{0.1cm}D_{train}\hspace{0.1cm}$ $\hspace{0.1cm}\Rightarrow\hspace{0.2cm}$  $\widehat{M}\\$

$3)\hspace{0.1cm}$ Se calcula una metrica de evaluacion sobre el modelo entrenado $\hspace{0.1cm}\widehat{M}\hspace{0.1cm}$ usando $\hspace{0.1cm}D_{test}$ 

$\hspace{0.6cm}$  Si por ejemplo se calcula el $\hspace{0.1cm}ECM\hspace{0.1cm}$ , se obtendria el $\hspace{0.1cm}ECM_{test}(\widehat{M})\\$

$4)\hspace{0.1cm}$ La métrica de evaluacion final del modelo es la obtenida en el paso 3) 

$\hspace{0.6cm}$  Si la métrica empleada en 3) fue el $\hspace{0.1cm}ECM\hspace{0.1cm}$ , entonces:

$$ECM_{test}^*(M) = ECM_{test}(\widehat{M}) = \dfrac{1}{\# D_{test}} \sum_{i=1}^{\# D_{test}} (y_i^{test} - \hat{y}_i^{test})$$


Donde:

$$\hat{y}_i^{test} \hspace{0.1cm}=\hspace{0.1cm} M(\hspace{0.1cm} x_i^{test} \hspace{0.1cm}|\hspace{0.1cm} D_{train})\hspace{0.1cm}=\hspace{0.1cm} \widehat{M}(\hspace{0.1cm} x_i^{test} \hspace{0.1cm})$$


<br>

**Problemas**

Toda la validación queda condicionada a solo una muestra de train y otra de test. Si alguna de estas muestras tienen defectos, estos se van a trasladar a la validación, que será por tanto defectuosa. 

Ademas la métrica de evaluacion calculada por validación simple aleatoria tiene generalmente una varianza alta, en comparación con otros métodos de validación. Esto será ilustrado en la práctica.

La varianza de una metrica de evaluación calculada con un algorimo de validación se puede entender como como la varianza de los valores obtenidos de la métrica al ejecutar el algoritmo un número elevado de veces.

 Es la segundo aproximación naive a los algoritmos de validación.
 
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


$1)\hspace{0.1cm}$ Se obtienen $\hspace{0.1cm}B\hspace{0.1cm}$ particiones de $\hspace{0.1cm}D\hspace{0.1cm}$ en parte de train y parte de test del siguiente modo: $\\[0.4cm]$
   
   
   
Sea $\hspace{0.1cm}k\in (0,1)\hspace{0.1cm}$ la proporción de filas de $\hspace{0.1cm}D\hspace{0.1cm}$ que formarán parte de la muestra de **train** (es un hiper-parametro del algoritmo): $\\[0.4cm]$


$\hspace{0.3cm} 1.1)\hspace{0.1cm}$ Se generan $\hspace{0.1cm}B\hspace{0.1cm}$  muestras aleatoria sin reemplazamiento de tamaño $\hspace{0.1cm}\lfloor k  \cdot N \rfloor\hspace{0.1cm}$  del vector $\hspace{0.1cm}(1,2,...,N)\hspace{0.1cm}$ :

$$m_1 , m_2 , ..., m_B \\[0.4cm]$$

 
Donde: 

$m_r=(m_{r1} ,...,m_{r\lfloor k  \cdot N \rfloor})\hspace{0.15cm} \hspace{0.4cm} \forall r=1,...,B$


$\lfloor \cdot \rfloor\hspace{0.1cm}$ es la función suelo, que dado un número como argumento devuelve el mayor entero menor que dicho número. $\\[0.5cm]$

$\hspace{0.1cm} 1.2)\hspace{0.1cm}$ Se obtienen las siguientes $\hspace{0.1cm}B\hspace{0.1cm}$ muestras de **train** del data-set original $\hspace{0.1cm}D \\$ 

$$D_{train, 1}= D[m_1 , :] \hspace{0.15cm},\hspace{0.15cm} D_{train, 2}= D[m_2 , :] \hspace{0.15cm}, ... ,\hspace{0.15cm} D_{train, B}= D[m_B , :] \\$$

Donde: 

Para $\hspace{0.1cm}r=1,...,B$

$$D_{train, r} = D[m_r , :]= \begin{pmatrix}
    x_{m_{r1},1} & x_{m_{r1},2} & ... & x_{m_{r1},p} & y_{m_{r1}} \\
    x_{m_{r1},1} & x_{m_{r1},2} & ... & x_{m_{r1},p} & y_{m_{r2}} \\
    ....&...\\
    x_{m_{r\lfloor k  \cdot N \rfloor} ,1} & x_{m_{r\lfloor k  \cdot N \rfloor},2} & ... & x_{m_{r\lfloor k  \cdot N \rfloor},p} & y_{m_{r\lfloor k  \cdot N \rfloor}} \end{pmatrix} = \begin{pmatrix}
    x_{1}^{train, r} & y_{1}^{train, r}\\
    x_{2}^{train, r} & y_{2}^{train, r}\\
    ....&...\\
    x_{\# D_{train, r}}^{train, r} & y_{\# D_{train, r}}^{train, r}
    \end{pmatrix} \\$$ 
    
es la submatriz que resulta de quedarse solo con las filas de $\hspace{0.1cm}D\hspace{0.1cm}$ definidas por la muestra $\hspace{0.1cm}m_r\hspace{0.1cm}$ de $\hspace{0.1cm}(1,...,N) \\$




$\hspace{0.1cm} 1.3)\hspace{0.1cm}$ Se obtienen las siguientes $\hspace{0.1cm}B\hspace{0.1cm}$ muestras de **test** del data-set original $\hspace{0.1cm}D \\$


$$D_{test, 1}= D[m_1^c , :] \hspace{0.15cm},\hspace{0.15cm} D_{test, 2}= D[m_2^c , :] \hspace{0.15cm}, ... ,\hspace{0.15cm} D_{test, B}= D[m_B^c , :] \\$$


Donde:

Para $r=1,...,B$


$$D_{test, r} = D[m_r^c , :]=  \begin{pmatrix}
    x_{1}^{test, r} & y_{1}^{test, r}\\
    x_{2}^{test, r} & y_{2}^{test, r}\\
    ....&...\\
    x_{\# D_{test, r}}^{test, r} & y_{\# D_{test, r}}^{test, r} 
    \end{pmatrix} \\$$ 
    
es la submatriz que resulta de quedarse solo con las filas de $\hspace{0.1cm}D\hspace{0.1cm}$ que no están en $\hspace{0.1cm}D_{train}\hspace{0.1cm}$, es decir, las filas de $\hspace{0.1cm}m_r^c \\$

$m_r^c=(\hspace{0.1cm} i =1,...,N \hspace{0.1cm} / \hspace{0.1cm} i\neq m_{rj} , \forall j=1,...,\lfloor k  \cdot N \rfloor\hspace{0.1cm} )\hspace{0.1cm}\hspace{0.15cm}$ es el complementario de $\hspace{0.15 cm}m_r \\[0.7cm]$

 


Por tanto se obtienen $\hspace{0.1cm}B\hspace{0.1cm}$ particiones de **train** y **test** de $\hspace{0.1cm}D \\$



$2)\hspace{0.1cm}$ Se entrena el modelo $\hspace{0.1cm}M\hspace{0.1cm}$ con cada una de las muestras de train $\hspace{0.1cm} D_{train,1} \hspace{0.1cm},\hspace{0.1cm} D_{train,2}\hspace{0.1cm} , ...,\hspace{0.1cm} D_{train,B}\hspace{0.1cm}$  $\hspace{0.1cm}\Rightarrow\hspace{0.1cm}$ $\hspace{0.1cm}\widehat{M}_1 ,..., \widehat{M}_B \\$

$3)\hspace{0.1cm}$ Se calcula una misma métrica de evaluación sobre el modelo entrenado $\hspace{0.1cm}\widehat{M}_r\hspace{0.1cm}$ usando la muestra de **test** $\hspace{0.1cm}D_{test,r}\hspace{0.1cm}$ , para cada $\hspace{0.1cm}r=1,...,B$ 

Supongamos que la métrica de evaluación usada es el $\hspace{0.1cm}ECM\hspace{0.1cm}$ , entonces se obtienen $\hspace{0.1cm}B\hspace{0.1cm}$ valores de esta métrica :

$$ECM_{test }(\widehat{M}_1) \hspace{0.1cm},\hspace{0.1cm}  ECM_{test }(\widehat{M}_2)\hspace{0.1cm} , ... ,\hspace{0.1cm} ECM_{test}(\widehat{M}_B)\\$$

Donde: 

$ECM_{test , r}\hspace{0.1cm}$ es el $\hspace{0.1cm}ECM\hspace{0.1cm}$ calculado sobre $\hspace{0.1cm}\widehat{M}_r\hspace{0.1cm}$ usando $\hspace{0.1cm}D_{test,r}\hspace{0.1cm}$ 

$$ECM_{test }(\widehat{M}_r) = \dfrac{1}{\# D_{test,r}} \cdot \sum_{i=1}^{\# D_{test,r}} \hspace{0.1cm} (\hspace{0.1cm} y_i^{\hspace{0.1cm}test,r} - \hat{\hspace{0.1cm}y\hspace{0.1cm}}_i^{\hspace{0.1cm}test,r} \hspace{0.1cm})^2$$





$\hspace{0.55cm}$ Donde:

$$\hat{y}_i^{test,r} \hspace{0.1cm}=\hspace{0.1cm} M(\hspace{0.1cm} x_i^{test, r} \hspace{0.1cm}|\hspace{0.1cm} D_{train,r}) \hspace{0.1cm}=\hspace{0.1cm} \widehat{M}_r (\hspace{0.1cm} x_i^{test, r} \hspace{0.1cm} ) \\$$


para $\hspace{0.1cm}r=1,...,B \\$


$4) \hspace{0.1cm}$ Se calcula la métrica final de evaluacion del modelo como el promedio de las $B$ metricas calculadas en 3). Si la metrica usada en 3) es el ECM, entonces: $\\[0.4cm]$

$$ECM_{test}^{\hspace{0.08cm}*}( {M}) = \dfrac{1}{B} \cdot \sum_{r=1}^B ECM_{test}(\widehat{M}_r)$$






<br>

**Ventajas**

Permite reducir la varianza de la métrica de validación. En la validación simple aleatoria no repetida la métrica de validación obtenida usando validacion simple tiene mayor varianza, en el sentido de que si se implementa el algoritmo un número elevado de veces, la varianza de los valores obtenidos de la métrica es mayor si se aplica el mismo procedimiento con validación simple aleatoria repetida. Esto será ilustrado en la práctica.

<br>


## Leave-one-out

El algoritmo de validación leave-one-out tiene los siguientes pasos: $\\[0.3cm]$


$1)\hspace{0.1cm}$ Se obtienen $\hspace{0.1cm} B\hspace{0.1cm}$ particiones de $\hspace{0.1cm} D\hspace{0.1cm}$ en parte de train y parte de test del siguiente modo:

$\hspace{0.3cm} 1.2)\hspace{0.1cm}$ Se obtienen las siguientes $\hspace{0.1cm}B\hspace{0.1cm}$ muestras  **test** del data-set original $\hspace{0.1cm}D \\$ 

$$D_{test,1}=D[1, :] \hspace{0.1cm} ,\hspace{0.15cm} D_{test,2}=D[2, :]\hspace{0.15cm},...,\hspace{0.15cm} D_{test,B}=D[B, :] \\$$

Donde:

$D_{test,1}=D[r, :]\hspace{0.1cm}$ es la submatriz que resulta de considerar solo la fila $r$ de $D$ , es decir, es la observación $r$-esima del data-set inicial $\hspace{0.1cm}D \\$

 $$D_{test,r} \hspace{0.1cm}=\hspace{0.1cm} D[r, :] \hspace{0.1cm}=\hspace{0.1cm} (x_{i1} , ..., x_{rp} , y_r)=(x_r \hspace{0.1cm} ,\hspace{0.1cm}  y_r) \\$$



$\hspace{0.3cm} 1.3)\hspace{0.1cm}$ Se obtienen las siguientes $\hspace{0.1cm}B\hspace{0.1cm}$ muestras  **train** del data-set original $\hspace{0.1cm}D \\$

$$D_{train,1}=D[-1, :] \hspace{0.2cm},\hspace{0.2cm} D_{train,2}=D[-2, :]\hspace{0.2cm},...,\hspace{0.2cm} D_{train,B}=D[-B, :] \\$$


Donde:

$D_{train,r}=D[-r, :]\hspace{0.15cm}$ es la submatriz que resulta de eliminar la fila $i$ de $\hspace{0.1cm} D\hspace{0.1cm}$, es decir: $\\[0.7cm]$


$$D_{train,r}=D[-r, :]= \begin{pmatrix}
    x_{11}&x_{12}&...&x_{1p}& y_1\\
    ...&...&...&...&...\\
    x_{(i-1)1}&x_{(i-1)2}&...&x_{(i-1)p} & y_(i-1)\\
    x_{(i+1)1}&x_{(i+1)2}&...&x_{(i+1)p} & y_(i+1)\\
    &...&\\
    x_{N1}&x_{N2}&...&x_{Np}& y_N
    \end{pmatrix}=\begin{pmatrix}
    x_{1}& y_1\\
    ...&...&...&...&...\\
    x_{(i-1)}&y_(i-1)\\
    x_{(i+1)}& y_(i+1)\\
    &...&\\
    x_{N}& y_N
    \end{pmatrix} \\$$  
    
para $r=1,...,B \\$


    
$2)\hspace{0.1cm}$ Se entrena el modelo $\hspace{0.1cm}M\hspace{0.1cm}$ con $\hspace{0.1cm} D_{train,1} , D_{train,2} , ..., D_{train,B}\hspace{0.1cm}$  $\hspace{0.1cm}\Rightarrow\hspace{0.1cm}$ $\hspace{0.1cm}\widehat{M}_1 ,..., \widehat{M}_B \\$

$3)\hspace{0.1cm}$ Se calcula una misma métrica de evaluación sobre el modelo entrenado $\hspace{0.1cm}\widehat{M}_r\hspace{0.1cm}$ usando la muestra de **test** $\hspace{0.1cm}D_{test,r}\hspace{0.1cm}$ , para $\hspace{0.1cm}r=1,...,B \\$ 

Supongamos que la métrica de evaluación usada es el $\hspace{0.1cm}ECM\hspace{0.1cm}$ , entonces se obtienen $\hspace{0.1cm}B\hspace{0.1cm}$ valores de esta métrica :

$$ECM_{test }(\widehat{M}_1) \hspace{0.1cm} ,\hspace{0.1cm}   ECM_{test }(\widehat{M}_2) \hspace{0.1cm} , ... ,\hspace{0.1cm}  ECM_{test}(\widehat{M}_B)\\$$

Donde: 

$ECM_{test , r}\hspace{0.1cm}$ es el $\hspace{0.1cm}ECM\hspace{0.1cm}$ calculado sobre $\hspace{0.1cm}\widehat{M}_r\hspace{0.1cm}$ usando $\hspace{0.1cm}D_{test,r} \\$ 

$$ECM_{test }(\widehat{M}_r) =  (\hspace{0.1cm} y_r - \hat{y}_r \hspace{0.1cm})^2$$

$\hspace{0.55cm}$ Donde:

$$\hat{y}_r \hspace{0.1cm}=\hspace{0.1cm} M(\hspace{0.1cm} x_r \hspace{0.1cm}|\hspace{0.1cm} D_{train,r}) \hspace{0.1cm}=\hspace{0.1cm} \widehat{M}_r (\hspace{0.1cm} x_r \hspace{0.1cm} ) \\$$

para $\hspace{0.1cm}r=1,...,B \\$

$4)\hspace{0.1cm}$ Se calcula la métrica final de evaluacion del modelo como el promedio de las $B$ metricas calculadas en 3). Si la metrica usada en 3) es el $ECM$, entonces:

$$ECM_{test}^{\hspace{0.08cm}*}( {M}) = \dfrac{1}{B} \cdot \sum_{r=1}^B ECM_{test}(\widehat{M}_r)$$
    
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


Este algoritmo de validacion consiste en dividir el data-set inicial en $k$ partes, y usar de manera secuencial cada una de esas partes como muestra test, y las union de las partes restantes como muestra train.

Por tanto con este método se usan $k$ muestras de test y de train.

El modelo es entrenado secuencialmente con cada una de las $k$ muestras de train disitntas, y se testea con la correspondiente muestra de test (que es el complementario de la de train), usando una métrica de evaluacion.

Es decir, tras dividir el data-set inicial en $k$ partes la parte 1 se usa como test y el resto como train, se calcula la metrica de evaluacion. Luego la parte 2 se usa como test y el resto como train, y se calcula la metrica de evaluacion. Asi sucesivamente hasta haber usado las $k$ partes como muestras de test.

Tras este proceso se habrán obtenido $k$ valores de dicha métrica de evaluacion.

La métrica de evaluacion calculada usando este método de validación es la media de dichos $k$ valores obtenidos para la métrica de evaluación escogida. Este valor medio final es la que será usado para medir el poder predictivo del modelo y compararlo con otros modelos.

<br>


**Decripción formal del algoritmo:**



El algoritmo de validación k-folds tiene los siguientes pasos:

$1)\hspace{0.1cm}$ Se divide aleatoriamente el data-set inicial $\hspace{0.1cm}D\hspace{0.1cm}$  en $\hspace{0.1cm}k\hspace{0.1cm}$ partes de manera que  cada parte tenga aproximadamente el mismo número de observaciones (sean lo mas balanceadas posibles).

Existen diferentes métodos para hacer esta división. La problematica de la división es cómo hacer que las partes resultantes estén lo más balanceadas posibles respecto al numero de observaciones que contienen.

Hemos desarrollado un método basado en cuantiles que permite obtener este balanceo, el cual ha sido implementado en `Python` con buenos resultados en este aspecto, como se podrá ver posteriormente en la parte de implementación.


Vamos a explicar la mecánica del método ideado:


Obtenemos una muestra aleatoria sin remplazamiento $\hspace{0.1cm}m=(m_1,...,m_N)\hspace{0.1cm}$ de tamaño $N$ del vector  $\hspace{0.1cm}(1,...,N)$

El siguiente paso es dividir la muestra $\hspace{0.1cm}m\hspace{0.1cm}$ en $\hspace{0.1cm}k\hspace{0.1cm}$ partes lo mas balanceadas posibles. No queremos que unas partes tenga muchos elementos, y otras pocos. Queremos que la repartición  de los elementos de $\hspace{0.1cm}m\hspace{0.1cm}$ en las $\hspace{0.1cm}k\hspace{0.1cm}$ partes sea lo mas igualitaria posible.


La idea es que si, por ejemplo $\hspace{0.1cm}k=10\hspace{0.1cm}$, cada una de las 10 partes en las que dividimos $\hspace{0.1cm}m\hspace{0.1cm}$ tenga un 10% de los elementos totales de $m$

Si $k=4$  se busca que cada una de las 4 partes en las que dividimos $\hspace{0.1cm}m\hspace{0.1cm}$ tenga el 25% de los elementos de $\hspace{0.1cm}m$

En general, se busca que cada una de las $\hspace{0.1cm} k\hspace{0.1cm}$ partes en las que dividimos $\hspace{0.1cm}m\hspace{0.1cm}$ tengan $\hspace{0.1cm}(1/k)\cdot 100 \%\hspace{0.1cm}$ de elementos de $\hspace{0.1cm}m\hspace{0.1cm}$, es decir, $\hspace{0.1cm} N/k\hspace{0.1cm}$ elementos de $\hspace{0.1cm}m\hspace{0.1cm}$ , puesto que m tiene N elementos.




Una forma de hacer esto es   usando los cuantiles $\hspace{0.1cm} Q_0 \hspace{0.1cm} , \hspace{0.1cm}  Q_{1/k} \hspace{0.1cm} ,\hspace{0.1cm}  Q_{2/k} \hspace{0.1cm} ,...,\hspace{0.1cm} Q_{(k-1)/k}\hspace{0.1cm} ,\hspace{0.1cm}  Q_1\hspace{0.1cm}$  del vector $\hspace{0.1cm}(1,...,N)\hspace{0.1cm}$
como los limites que definen las partes en las que dividiremos $\hspace{0.1cm} m=(m_1,...,m_N)$

Dichos cuantiles permiten separar $m$ en $k$ partes de un tamaño aproximadamente igual.

Si $\hspace{0.1cm} k=10\hspace{0.1cm}$, entonces esos cuantiles serian $\hspace{0.1cm} Q_0, Q_{0.1}, Q_{0.2}, ..., Q_{0.8}, Q_{0.9}, Q_1$

Si $\hspace{0.1cm} k=4\hspace{0.1cm}$ , los cuantiles serian $\hspace{0.1cm} Q_0, Q_{0.25}, Q_{0.5},  Q_{0.75}, Q_1\hspace{0.1cm}$

Notese que: $\hspace{0.1cm} Q_0 = Min(1,...,N) = 1\hspace{0.1cm}$ y $\hspace{0.1cm} Q_1=Max(1,...,N)=N \\$




Definimos las $\hspace{0.1cm} k\hspace{0.1cm}$ particiones de $m$ usando los cuantiles $\hspace{0.1cm} Q_0=1 \hspace{0.1cm},\hspace{0.1cm} Q_{1/k} \hspace{0.1cm},\hspace{0.1cm} Q_{2/k}\hspace{0.1cm},...,\hspace{0.1cm}Q_{(k-1)/k}\hspace{0.1cm},\hspace{0.1cm} Q_1=N\hspace{0.1cm}$ como sigue: $\\[0.8cm]$

$$p_{1,m} \hspace{0.1cm}=\hspace{0.1cm} m[\hspace{0.1cm}1:(\lfloor Q_{1/k} \rfloor -1)\hspace{0.1cm}]\hspace{0.1cm}=\hspace{0.1cm}(m_1,...,m_{\lfloor  Q_{1/k} \rfloor - 1} )$$

$$p_{2,m} \hspace{0.1cm}=\hspace{0.1cm} m[\hspace{0.1cm}\lfloor Q_{1/k} \rfloor:(\lfloor Q_{2/k} \rfloor-1)\hspace{0.1cm}]\hspace{0.1cm}=\hspace{0.1cm}(m_{\lfloor  Q_{1/k} \rfloor},...,m_{\lfloor  Q_{2/k} \rfloor - 1})$$

$$\dots$$

$$p_{k,m} \hspace{0.1cm}=\hspace{0.1cm} m[\hspace{0.1cm}\lfloor Q_{(k-1)/k} \rfloor : N\hspace{0.1cm}]\hspace{0.1cm}=\hspace{0.1cm}(m_{\lfloor  Q_{(k-1)/k} \rfloor},...,m_{N})\\$$



Se puede demostrar que $\hspace{0.1cm} p_{1,m}\hspace{0.1cm},...,\hspace{0.1cm} p_{k,m}\hspace{0.1cm}$ tienen un nº de elementos aproximadamente igual , por lo que son particiones aproximadamente igualitarias (balanceadas), que era lo que buscabamos.

La siguiente matriz ilustra por qué este método funciona: $\\[0.7cm]$

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
    
 $\\[1cm]$
 
$2)$ Se obtienen la siguientes $k$ muestras de test:


$$D_{test, 1} \hspace{0.1cm}=\hspace{0.1cm} D[\hspace{0.1cm} p(1,m) \hspace{0.1cm} ,\hspace{0.1cm} :] \hspace{0.1cm}=\hspace{0.1cm} D[\hspace{0.1cm}m[1:(\lfloor Q_{1/k} \rfloor -1)] \hspace{0.1cm},\hspace{0.1cm} :]$$

$$D_{test, 2} \hspace{0.1cm}=\hspace{0.1cm} D[\hspace{0.1cm}p(2,m)\hspace{0.1cm} ,\hspace{0.1cm} :] \hspace{0.1cm}=\hspace{0.1cm} D[\hspace{0.1cm}m[1:(\lfloor Q_{1/k} \rfloor -1)]\hspace{0.1cm} ,\hspace{0.1cm}:]$$

$$\dots$$
 

$$D_{test, k}\hspace{0.1cm} =\hspace{0.1cm} D[\hspace{0.1cm}p(k,m)\hspace{0.1cm} ,\hspace{0.1cm} :] \hspace{0.1cm}=\hspace{0.1cm} D[\hspace{0.1cm}m[\lfloor Q_{(k-1)/k} \rfloor : N]\hspace{0.1cm} ,\hspace{0.1cm} :] \\[0.7cm]$$

Siguiendo la notación habitual del articulo, podemos expresar: $\\[0.6cm]$

$$
  D_{test, r} =\begin{pmatrix}
  x_{1}^{test, r} & y_{1}^{test, r}\\
    x_{2}^{test, r} & y_{2}^{test, r}\\
    ....&...\\
    x_{\# D_{test, r}}^{test, r} & y_{\# D_{test, r}}^{test, r} 
    \end{pmatrix} \\$$

$\\[0.4cm]$


$3)$ Se obtiene la siguientes $k$ muestras de train:


$$D_{train, 1} = D[\hspace{0.1cm}-\hspace{0.1cm}p(1,m) \hspace{0.1cm},\hspace{0.1cm} :] = D[\hspace{0.1cm}-\hspace{0.1cm}m[1:(\lfloor Q_{1/k} \rfloor -1)] \hspace{0.1cm},\hspace{0.1cm}:] = $$

$$D_{train, 2} = D[\hspace{0.1cm}-\hspace{0.1cm}p(2,m) \hspace{0.1cm},\hspace{0.1cm} :] = D[\hspace{0.1cm}-\hspace{0.1cm}m[1:(\lfloor Q_{1/k} \rfloor -1)] \hspace{0.1cm},\hspace{0.1cm}:]$$

$$\dots$$
 

$$D_{train, k} = D[\hspace{0.1cm}-\hspace{0.1cm}p(k,m) \hspace{0.1cm},\hspace{0.1cm} :] = D[\hspace{0.1cm}-\hspace{0.1cm} m[\lfloor Q_{(k-1)/k} \rfloor : N] \hspace{0.1cm},\hspace{0.1cm} :] \\$$


Siguiendo la notación habitual del articulo, podemos expresar: $\\[0.6cm]$

$$
  D_{train, r} =\begin{pmatrix}
  x_{1}^{train, r} & y_{1}^{train, r}\\
    x_{2}^{train, r} & y_{2}^{train, r}\\
    ....&...\\
    x_{\# D_{train, r}}^{train, r} & y_{\# D_{train, r}}^{train, r} 
    \end{pmatrix} \\$$

$\\[0.4cm]$

$4)\hspace{0.1cm}$ Se entrena el modelo $\hspace{0.1cm}M\hspace{0.1cm}$ con $\hspace{0.1cm} D_{train,1}\hspace{0.1cm} ,\hspace{0.1cm} D_{train,2}\hspace{0.1cm} , ...,\hspace{0.1cm} D_{train,k}\hspace{0.1cm}$  $\hspace{0.1cm}\Rightarrow\hspace{0.1cm}$ $\hspace{0.1cm}\widehat{M}_1 ,..., \widehat{M}_k \\$

$3)\hspace{0.1cm}$ Se calcula una misma métrica de evaluación sobre el modelo entrenado $\hspace{0.1cm}\widehat{M}_r\hspace{0.1cm}$ usando la muestra de **test** $\hspace{0.1cm}D_{test,r}\hspace{0.1cm}$ , para $\hspace{0.1cm}r=1,...,k$ 

Supongamos que la métrica de evaluación usada es el $\hspace{0.1cm}ECM\hspace{0.1cm}$ , entonces se obtienen $\hspace{0.1cm}k\hspace{0.1cm}$ valores de esta métrica :

$$ECM_{test }(\widehat{M}_1) \hspace{0.1cm},\hspace{0.1cm}  ECM_{test }(\widehat{M}_2) \hspace{0.1cm}, ... ,\hspace{0.1cm} ECM_{test}(\widehat{M}_k)\\$$

Donde: 

$ECM_{test , r}\hspace{0.1cm}$ es el $\hspace{0.1cm}ECM\hspace{0.1cm}$ calculado sobre $\hspace{0.1cm}\widehat{M}_r\hspace{0.1cm}$ usando $\hspace{0.1cm}D_{test,r}\hspace{0.1cm} \\$ 

$$ECM_{test }(\widehat{M}_r) = \dfrac{1}{\# D_{test, r}} \cdot \sum_{i=1}^{\# D_{test, r}} \hspace{0.1cm} (\hspace{0.1cm} y_i^{\hspace{0.1cm}test,r} - \hat{\hspace{0.1cm}y\hspace{0.1cm}}_i^{\hspace{0.1cm}test,r} \hspace{0.1cm})^2$$

$\hspace{0.55cm}$ Donde:

$$\hat{y}_i^{test,r} \hspace{0.1cm}=\hspace{0.1cm} M(\hspace{0.1cm} x_i^{test, r} \hspace{0.1cm}|\hspace{0.1cm} D_{train,r}) \hspace{0.1cm}=\hspace{0.1cm} \widehat{M}_r (\hspace{0.1cm} x_i^{test, r} \hspace{0.1cm} ) \\$$

para $\hspace{0.1cm}r=1,...,k \\$

$4)\hspace{0.1cm}$ Se calcula la métrica final de evaluacion del modelo como el promedio de las $k$ metricas calculadas en 3). Si la metrica usada en 3) es el ECM, entonces:

$$ECM_{test}^{\hspace{0.08cm}*}( {M}) = \dfrac{1}{k} \cdot \sum_{r=1}^k ECM_{test}(\widehat{M}_r)$$
    

<br>

**Ventajas**

La metrica de validacion calculada por k-fold tiene menor varianza que con los métodos anteriores, luego es el mas preciso de todos ellos.



<br>

## Repeted k-fold



Este algoritmo consiste en repetir el algoritmo k-fold un número $B$ de veces.

No vamos a hacer aqui una descripción tan detallada del algoritmo como las anteriores, puesto que buena parte es repetir la estructura de k-fold, pero repitiendola $B$ veces.

Es facil ver que se obtendrian $k\cdot B$ muestras de test y train, por lo que se entrenaria y testaria el modelo $M$ un total de $k\cdot B$ veces.

Si la metrica usada para evaluar el modelo es el habitual $ECM$ , entocnes se obtienen $k\cdot B$ valores de esta metrica:


$$ECM_{test }(\widehat{M}_1^{\hspace{0.1cm}1}) \hspace{0.1cm},  \hspace{0.1cm}, ... ,\hspace{0.1cm} ECM_{test}(\widehat{M}_k^{\hspace{0.1cm}1}) ,ECM_{test }(\widehat{M}_1^{\hspace{0.1cm}2}) \hspace{0.1cm}, \hspace{0.1cm}, ... ,\hspace{0.1cm} ECM_{test}(\widehat{M}_k^{\hspace{0.1cm}2}),...,ECM_{test }(\widehat{M}_1^{\hspace{0.1cm}B}) \hspace{0.1cm},\ \hspace{0.1cm}, ... ,\hspace{0.1cm} ECM_{test}(\widehat{M}_k^{\hspace{0.1cm}B})   \\$$


Donde: 

$\widehat{M}_r^{\hspace{0.1cm}j}\hspace{0.1cm}$ es el modelo M entrenado con la muestra $\hspace{0.1cm}D_{train, r}\hspace{0.1cm}$ en la repeticion $\hspace{0.1cm}j\hspace{0.1cm}$ del algoritmo k-fold , para $\hspace{0.1cm}r=1,...,k\hspace{0.1cm}$ y $\hspace{0.1cm}j=1,...,B$

$ECM_{test }(\widehat{M}_r^{\hspace{0.1cm}j})\hspace{0.1cm}$ es el $\hspace{0.1cm}ECM\hspace{0.1cm}$ calculado sobre el modelo $\hspace{0.1cm}\widehat{M}_r^{\hspace{0.1cm}j}\hspace{0.1cm}$ usando la muestra de train $r$-esima obtenida en la repeticion $j$-esima del algoritmo k-fold , es decir, $\hspace{0.1cm}D_{test,r}^{\hspace{0.1cm}j}\hspace{0.1cm} \\$ 

$$ECM_{test }(\widehat{M}_r^{\hspace{0.1cm}j}) = \dfrac{1}{\# D_{test, r}} \cdot \sum_{i=1}^{\# D_{test, r}^{\hspace{0.1cm}j}} \hspace{0.1cm} (\hspace{0.1cm} y_i^{\hspace{0.1cm}test,r,j} - \hat{\hspace{0.1cm}y\hspace{0.1cm}}_i^{\hspace{0.1cm}test,r,j} \hspace{0.1cm})^2$$

$\hspace{0.55cm}$ Donde:

$$\hat{y}_i^{test,r,j} \hspace{0.1cm}=\hspace{0.1cm} M(\hspace{0.1cm} x_i^{test, r,j} \hspace{0.1cm}|\hspace{0.1cm} D_{train,r}^{\hspace{0.1cm}j}) \hspace{0.1cm}=\hspace{0.1cm} \widehat{M}_r (\hspace{0.1cm} x_i^{test, r,j} \hspace{0.1cm} ) \\$$

para $\hspace{0.1cm}r=1,...,k \\$

$4)\hspace{0.1cm}$ Se calcula la métrica final de evaluacion del modelo como el promedio de las $k\cdot B$ metricas calculadas en 3). Si la metrica usada en 3) es el $ECM$, entonces:

$$ECM_{test}^{\hspace{0.08cm}*}( {M}) = \dfrac{1}{k\cdot B} \cdot \sum_{j=1}^B \sum_{r=1}^k   ECM_{test}(\widehat{M}_r^{\hspace{0.1cm}j})$$
    







<br>


**Ventajas**

La metrica de validacion calculada por repeted k-fold tiene menor varianza que con los métodos anteriores, luego es el mas preciso de todos ellos. Este deberia ser el método empleado en la práctica, siempre que se pueda, ya que también es el que mas requerimientos computacionales tiene.






<br>

<br>

# Anexo

## Propuesta basada en remuestreo para estimar la varianza de las predicciones de un modelo

Consideraremos que una estimacion de la varianza de las predicciones de un modelo de regresion (variable respuesta cuantitativa) $M$ es:

$$\dfrac{1}{h} \sum_{i=1}^{h} \widehat{Var}(\hat{y}_i)$$ 

Cálculo de $\widehat{Var}(\hat{y}_i)$ por remuestreo (en algunos modelos no habra expresiones cerradas para este estimacion, por eso veo interesante un procedimiento general que no dependa del modelo usado):

Tenemos una muestra inicial de predictores y de la respuesta $(X,Y)=(X_1,...,X_p, Y)$ con $n$ filas (observaciones)

Tomamos $B$ muestras bootstrap (muestras aleatorias con reemplazamiento) de $(X,Y)$:

$$(X,Y)_1 ,...,(X,Y)_B$$


Entrenamos el modelo $M$ con cada una de las $B$ muestras bootstrap , asi obtenemos $B$ modelos entrenados diferentes $M_1,..,.M_B$

Notese que el modelo $M_r$ ha sido entrenado con la muestra train de observaciones $(X,Y)_r$

Con cada uno de los $B$ modelos entrenados  $M_1,..,.M_B$ obtener la prediccion de test de la respuesta, es decir $\widehat{Y}^{test}$ , usando una misma muestra fija de test de los predictores $(X_1^{test},...,X_p^{test})$, asi se obtienen $B$ vectores de predcciones de la respuesta $(\widehat{Y}^{test}_1 ,...,\widehat{Y}^{test}_B)$  y con ellos se obtienen $B$ predicciones de la respuesta para la $i$-esima observacion de test de los predictores $x_i^{test} = (x_{i1}^{test} ,..., x_{ip}^{test})^t$  , esto es, se obtiene $\hat{y}_{i}^{boot}=( \hat{y}_{i1}^{test} , ...,\hat{y}_{iB}^{test})$ ,  para $i=1,...,h$


Notese que:

$\widehat{Y}^{test}_r$ es el vector con las predicciones de la respuesta que el modelo entrenado $M_r$ genera usando la muestra test de observaciones de los predictores $(X_1^{test},...,X_p^{test})$ , , para $r=1,...,B$

$\hat{y}_{ir}^{test}$ es la prediccion  de la variable respuesta que el modelo entrenado $M_r$ genera usando la observacion  test de los predictores $x_i^{test}=(x_{i1}^{test} ,..., x_{ip}^{test})^t$ , para $r=1,...,B$

$\hat{y}_{i}^{boot}=( \hat{y}_{i1}^{test} , ...,\hat{y}_{iB}^{test})$ es la prediccion de la respuesta para la observacion de test $x_i^{test}$ hecha por los distintos modelos $M_1,...,M_B$ entrenados. 


Estimamos ${Var}(\hat{y}_i)$ como la varianza de  $\hat{y}_{i}^{boot}=( \hat{y}_{i1}^{test} , ...,\hat{y}_{iB}^{test})$

$$ \widehat{Var}(\hat{y}_i) = \dfrac{1}{B} \sum_{r=1}^{B} \left( {y}_{ir}^{test} - \overline{\hat{y}_{i}^{boot}} \right)^2   $$

Repetimos el proceso con cada $i=1,...,h$, donde $h$ es el tamaño de la muestra de test.

Asi obtenderemos: $\hspace{0.2cm} \widehat{Var}(\hat{y}_1),\widehat{Var}(\hat{y}_2),..., \widehat{Var}(\hat{y}_h)$

Promediamos y obtenimos asi una estimacion de la varianza de las predcciones del modelo:

$$ \dfrac{1}{h} \sum_{i=1}^{h} \widehat{Var}(\hat{y}_i) $$  


<br>

<br>

## Propuesta basada en remuestreo para estimar el sesgo de las predicciones de un modelo

Consideraremos que una estimacion del sesgo de las predicciones de un modelo de regresion (variable respuesta cuantitativa) $M$ es:

$$\dfrac{1}{h} \sum_{i=1}^{h} \widehat{Sesgo}(\hat{y}_i)$$ 


Cálculo de $\widehat{Sesgo}(\hat{y}_i)$ por remuestreo (en algunos modelos no habra expresiones cerradas para este estimacion, por eso veo interesante un procedimiento general que no dependa del modelo usado):

Tenemos una muestra inicial de predictores y de la respuesta $(X,Y)=(X_1,...,X_p, Y)$ con $n$ filas (observaciones)

Tomamos $B$ muestras bootstrap (muestras aleatorias con reemplazamiento) de $(X,Y)$:

$$(X,Y)_1 ,...,(X,Y)_B$$


Entrenamos el modelo $M$ con cada una de las $B$ muestras bootstrap , asi obtenemos $B$ modelos entrenados diferentes $M_1,..,.M_B$

Notese que el modelo $M_r$ ha sido entrenado con la muestra train de observaciones $(X,Y)_r$

Con cada uno de los $B$ modelos entrenados  $M_1,..,.M_B$ obtener la prediccion de test de la respuesta, es decir $\widehat{Y}^{test}$ , usando una misma muestra fija de test de los predictores $(X_1^{test},...,X_p^{test})$, asi se obtienen $B$ vectores de predcciones de la respuesta $(\widehat{Y}^{test}_1 ,...,\widehat{Y}^{test}_B)$  y con ellos se obtienen $B$ predicciones de la respuesta para la $i$-esima observacion de test de los predictores $x_i^{test} = (x_{i1}^{test} ,..., x_{ip}^{test})^t$  , esto es, se obtiene $\hat{y}_{i}^{boot}=( \hat{y}_{i1}^{test} , ...,\hat{y}_{iB}^{test})$ ,  para $i=1,...,h$

Notese que:

$\widehat{Y}^{test}_r$ es el vector con las predicciones de la respuesta que el modelo entrenado $M_r$ genera usando la muestra test de observaciones de los predictores $(X_1^{test},...,X_p^{test})$ , , para $r=1,...,B$

$\hat{y}_{ir}^{test}$ es la prediccion  de la variable respuesta que el modelo entrenado $M_r$ genera usando la observacion  test de los predictores $x_i^{test}=(x_{i1}^{test} ,..., x_{ip}^{test})^t$ , para $r=1,...,B$

$\hat{y}_{i}^{boot}=( \hat{y}_{i1}^{test} , ...,\hat{y}_{iB}^{test})$ es la prediccion de la respuesta para la observacion de test $x_i^{test}$ hecha por los distintos modelos $M_1,...,M_B$ entrenados. 

Notese que sabemos que $y_i^{test}$ es el verdadero valor de la respuesta en la muestra de test para la observacion $x_i^{test}$ 



Estimamos ${Sesgo}(\hat{y}_i)$ como la diferencia entre la media de  $\hat{y}_{i}^{boot}=( \hat{y}_{i1}^{test} , ...,\hat{y}_{iB}^{test})$ y el verdadero valor $y_i^{test}$ de la respuesta en la muestra de test para  la observacion de test $x_i^{test}$

$$\widehat{Sesgo}(\hat{y}_i) = \left( \dfrac{1}{h} \sum_{r=1}^{B}  \hat{y}_{ir}^{test}    \right)- y_i^{test}$$

Repetimos el proceso con cada $i=1,...,h$, donde $h$ es el tamaño de la muestra de test.

Asi obtenderemos: $\hspace{0.2cm} \widehat{Sesgo}(\hat{y}_1),\widehat{Sesgo}(\hat{y}_2),..., \widehat{Sesgo}(\hat{y}_h)$

Promediamos y obtenimos asi una estimacion de la varianza de las predcciones del modelo:

$$ \dfrac{1}{h} \sum_{i=1}^{h} \widehat{Sesgo}(\hat{y}_i) $$  


<br>


# Bibliografía




1) An introduction to statistical learning










