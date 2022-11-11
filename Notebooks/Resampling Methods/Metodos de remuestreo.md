---
title: 'Métodos de Remuestreo'
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

# Inferencia clásica <a class="anchor" id="1"></a>

## Variables aleatorias i.i.d.

$\mathcal{X}_1,...,X_n\hspace{0.08cm}$ son variables aleatorias mutuamente independientes e identicamente distribuidas  (i.i.d.) $\hspace{0.3cm}\Leftrightarrow$

1) $\hspace{0.08cm} X_1,...,X_n\hspace{0.08cm}$ son mutuamente independientes independientes , es decir, $\hspace{0.08cm} P(X_1=x_1,...,X_n=x_n)= \prod_{i=1}^n P(X_i=x_i)$. Llo que implica que también son independientes dos a dos , es decir, $\hspace{0.08cm} X_i \perp X_j \hspace{0.08cm} \forall i\neq j \\$

2) $\hspace{0.08cm}X_1,...,X_n\hspace{0.08cm}$ tienen la misma distribución de probabilidad, es decir, $\hspace{0.08cm}X_i \sim F(\dot), \forall i=1,...,n$ 

Donde $\hspace{0.08cm}F(\cdot)\hspace{0.08cm}$ es una distribucion de probabilidad con parametros no especificados.

<br>


Seguiremos la siguiente notación:


$(X_1,...,X_n) \underset{i.i.d.}{\sim} F(\cdot) \hspace{0.3cm} \Leftrightarrow$

1) $\hspace{0.08cm}X_1,...,X_n \hspace{0.08cm}$ son mutuamente independientes $\\[0.6cm]$

2) $\hspace{0.08cm}X_i \sim F(\cdot), \hspace{0.08cm} \forall i=1,...,n$ 





## Muestra Aleatoria Simple

Sea $\hspace{0.08cm}X\hspace{0.08cm}$ una v.a. tal que $\hspace{0.08cm}X \sim D(\cdot)$ 


$(X_1,...,X_n)\hspace{0.08cm}$ es una muestra aleatoria simple (m.a.s.) de tamaño $\hspace{0.08cm}n\hspace{0.08cm}$ de $\hspace{0.08cm}X$ $\hspace{0.08cm}\Leftrightarrow\hspace{0.08cm}$ $(X_1,...,X_n) \underset{i.i.d.}{\sim} D(\cdot) \\$

**Observación:**

Una m.a.s. de una v.a. es un vector de v.a.'s


## Muestra de Observaciones


Sea $\hspace{0.08cm}X\hspace{0.08cm}$ una v.a. tal que $\hspace{0.08cm}X \sim D(\cdot)$ 


$(x_1,...,x_n)\hspace{0.08cm}$ es una muestra de $\hspace{0.08cm}n\hspace{0.08cm}$ observaciones de $\hspace{0.08cm}X$ $\hspace{0.2cm}\Leftrightarrow\hspace{0.2cm}$ $x_i \in Im(X) \hspace{0.08cm} , \forall i=1,...,n$ $\hspace{0.18cm}\Leftrightarrow\hspace{0.18cm}$ $x_i$ es una realizacion de la v.a. $\hspace{0.08cm}X$  , $\hspace{0.08cm}\forall i=1,...,n \\$


**Observación:**

1) Una muestra de observaciones de una v.a. es un vector de números, no son v.a.'s. $\\[0.4cm]$

2) Si $(x_1,...,x_n)$ es una muestra de $n$ observaciones de $X\sim D(\cdot)$ , entonces $x_i$ es una observacion que ha sido generada por la distribución de probabilidad $D(\cdot)$, es decir, $x_i$ puede verse como un numero aleatorio generado en base a la distribución de probabilidad $D(\cdot)$ $\\[0.4cm]$

3) Si $(x_1,...,x_n)$ es una muestra de $n$ observaciones de $X\sim D(\cdot)$ , entonces:


$P(X= x_i)$ es la probabilidad de  observar $x_i$ al extraer una muestra de observaciones de $X$ $\\[0.4cm]$


4) Si $(X_1,...,X_n)$ es una muestra aleatoria simple (m.a.s.) de tamaño $n$ de $X\sim D(\cdot)$ , entonces:

$P(X_1 = x_1 , ..., X_n=x_n)$ es la probabilidad de obtener como valores $(x_1,...,x_n)$ al extraer una muestra de observaciones de $X$


<br>



## Estadístico

Sea $\hspace{0.1cm}X\hspace{0.1cm}$ una v.a. tal que $\hspace{0.1cm} X \sim D(\theta)$ ,

Sea $\hspace{0.1cm}(X_1,...,X_n)\hspace{0.1cm}$ una m.a.s. de $\hspace{0.1cm}X$

Un estadistico es una funcion $\hspace{0.1cm}T\hspace{0.1cm}$ de una m.a.s. que no depende del parametro $\hspace{0.1cm}\theta$


Por tanto:

$T(X_1,...,X_n)\hspace{0.1cm}$ es un estadistico

<br>

**Observación:**

1) $\hspace{0.1cm}T(X_1,...,X_n)\hspace{0.1cm}$ es una v.a. al ser una función de v.a.'s

2) Dada una muestra de observaciones $\hspace{0.1cm}(x_1 ,..., x_n)\hspace{0.1cm}$ de  la v.a. $\hspace{0.1cm}X \sim D(\theta)$ 

$T(x_1,...,x_n)\hspace{0.1cm}$ es una observación de la v.a. $\hspace{0.1cm}T(X_1,...,X_n)$


3) Dadas $\hspace{0.1cm}B\hspace{0.1cm}$ muestras de observaciones $\hspace{0.1cm}(x_1^1 , ..., x_n^1) ,...,(x_1^B,...,x_n^B)\hspace{0.1cm}$ de la v.a. $\hspace{0.1cm}X \sim D(\theta)$ 

$T(x_1^1 , ..., x_n^1) ,..., T(x_1^B,...,x_n^B)\hspace{0.1cm}$ es una muestra de observaciones de la v.a. $\hspace{0.1cm}T(X_1,...,X_n)$


<br>

### Ejemplos de estadisticos


Sea $\hspace{0.1cm}X\hspace{0.1cm}$ una v.a. tal que $\hspace{0.1cm}X \sim D(\theta)\hspace{0.1cm}$ , y sea $\hspace{0.1cm}(X_1,...,X_n)\hspace{0.1cm}$ una m.a.s. de $X$


**Media muestral**

$$T(X_1,...,X_n) = \overline{X} = \dfrac{1}{n} \sum_{i=1}^n X_i \\$$


**Varianza muestral**

$$T(X_1,...,X_n) = S^2 = \dfrac{1}{n} \sum_{i=1}^n (X_i - \overline{X})^2 \\$$


**Cuasi-Varianza muestral**

$$T(X_1,...,X_n) = S^2 = \dfrac{1}{n-1} \sum_{i=1}^n (X_i - \overline{X})^2 \\$$




<br>


## Estimador Puntual

Dada una v.a. $\hspace{0.1cm}X\sim D(\theta)\hspace{0.1cm}$ y una m.a.s. $\hspace{0.1cm}(X_1,...,X_n)\hspace{0.1cm}$ de $\hspace{0.1cm}X$, 

Un estimador puntual para el parametro $\hspace{0.1cm}\theta\hspace{0.1cm}$ es un estadistico $\hspace{0.1cm}\widehat{\theta}(X_1,...,X_n)\hspace{0.1cm}$ que se propone para estimar $\theta$


<br>


## Estimación Puntual

Dada una v.a. $\hspace{0.1cm}X\sim D(\theta)\hspace{0.1cm}$ , una m.a.s. $\hspace{0.1cm}(X_1,...,X_n)\hspace{0.1cm}$ de $\hspace{0.1cm}X\hspace{0.1cm}$ y un estadistico $\hspace{0.1cm}\widehat{\theta}(X_1,...,X_n)$

Si  $\hspace{0.1cm}(x_1,...,x_n)\hspace{0.1cm}$ es una muestra de observaciones  de $\hspace{0.1cm}X\hspace{0.1cm}$ , entonces:

$\widehat{\theta}(x_1,...,x_n)\hspace{0.1cm}$ es una estimación puntual del parametro $\hspace{0.1cm}\theta \\$



**Observaciones:**

Un estimador puntual es una v.a. y una estimación puntual un número.





## Propiedades básicas de los estimadores

Dada una v.a. $\hspace{0.1cm}X\sim D(\theta)\hspace{0.1cm}$ , una m.a.s. $\hspace{0.1cm}(X_1,...,X_n)\hspace{0.1cm}$ de $\hspace{0.1cm}X\hspace{0.1cm}$ y un estimador $\hspace{0.1cm}\widehat{\theta}(X_1,...,X_n)$


### Sesgo


El sesgo del estimador $\widehat{\theta}$ se define como:

$$Sesgo(\widehat{\theta}) = E \left[ \hspace{0.05cm} \widehat{\theta} \hspace{0.05cm} \right]- \theta$$

### Varianza 

La varianza del estimador $\widehat{\theta}$ se define como:

$$Var(\widehat{\theta}) = E \left[ \hspace{0.05cm} \left( \widehat{\theta} - E [ \hspace{0.05cm} \widehat{\theta} \hspace{0.05cm}  ] \right)^2 \hspace{0.05cm} \right]$$


El error estandar (desviación típica) del estimador $\widehat{\theta}$ se define como:

$$s.e.(\widehat{\theta}) = \sqrt{Var(\widehat{\theta})}$$



### Error Cuadratico Medio

El error cuadratico medio del estimador $\widehat{\theta}$ se define como:

$$ECM(\widehat{\theta}) = E[ (\widehat{\theta} - \theta)^2]$$




## Estimacion del sesgo de un estimador por Jacknife y Bootstrap

### Jacknife

Tenemos una v.a. $\hspace{0.1cm}\mathcal{X}\sim D(\theta)\hspace{0.1cm}$ , una m.a.s. $\hspace{0.1cm}(X_1,...,X_n)\hspace{0.1cm}$ de $\hspace{0.1cm}X\hspace{0.1cm}$ y un estimador $\hspace{0.1cm}\widehat{\theta}(X_1,...,X_n)$ del parametro $\theta$


Pero además tenemos una muestra de observaciones $X=(x_1,...,x_n)\hspace{0.08cm}$   de la variable de interés $\hspace{0.08cm}\mathcal{X}$


Se define $X_{(r)}$ como una muestra de todos los elementos de $X$ excepto $x_{r}$

Es decir:



$$X_{(r)} = (\hspace{0.05cm}x_{1}\hspace{0.05cm},\hspace{0.05cm} x_{2}\hspace{0.05cm},..,\hspace{0.05cm} x_{r-1}\hspace{0.05cm},\hspace{0.05cm}x_{r+1}\hspace{0.05cm} ,..,\hspace{0.05cm} x_{n}\hspace{0.05cm})$$  

para  $\hspace{0.2cm} r=1,...,n$

 

Se define la replica $r$-esima del estimador $\widehat{\theta}$ como:

$$\widehat{\theta}_{(r)} = \widehat{\theta}(X_{(r)})= \widehat{\theta}(\hspace{0.05cm}x_{1}\hspace{0.05cm},\hspace{0.05cm} x_{2}\hspace{0.05cm},..,\hspace{0.05cm} x_{r-1}\hspace{0.05cm},\hspace{0.05cm}x_{r+1}\hspace{0.05cm} ,..,\hspace{0.05cm} x_{n}\hspace{0.05cm})$$


## Estimacion de la varianza de un estimador por Jacknife y Bootstrap





## Estimacion del error cuadratico medio de un estimador por Jacknife y Bootstrap





