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


Este artículo está< dividido en dos partes. Una primera en la que se hace una revisión de técnicas de inferencia estadística clásicas, y un segunda parte en la que se introducen técnicas de inferencia estadística basadas en remuestreo.

<br>

# Variables aleatorias i.i.d.

$\mathcal{X}_1,...,\mathcal{X}_n\hspace{0.1cm}$ son variables aleatorias mutuamente independientes e identicamente distribuidas  (i.i.d.) $\hspace{0.3cm}\Leftrightarrow$

$1)\hspace{0.12cm}$ $\hspace{0.1cm} \mathcal{X}_1,...,\mathcal{X}_n\hspace{0.08cm}$ son mutuamente independientes independientes , es decir:

$$\hspace{0.08cm} P(\mathcal{X}_1=x_1,...,\mathcal{X}_n=x_n)= \prod_{i=1}^n P(\mathcal{X}_i=x_i)$$

Lo que implica que también son independientes dos a dos , es decir, $\hspace{0.12cm} \mathcal{X}_i \perp \mathcal{X}_j \hspace{0.12cm} , \hspace{0.12cm} \forall i\neq j \\$

$2)\hspace{0.12cm}$ $\hspace{0.12cm}\mathcal{X}_1,...,\mathcal{X}_n\hspace{0.12cm}$ tienen la misma distribución de probabilidad, es decir, $\hspace{0.12cm}\mathcal{X}_i \sim F( \cdot ) \hspace{0.15cm}, \hspace{0.1cm} \forall i=1,...,n$ 

Donde $\hspace{0.08cm}F( \cdot )\hspace{0.08cm}$ es una distribucion de probabilidad con parametros no especificados.

<br>


Usaremos la siguiente notación:


$$(\mathcal{X}_1,...,\mathcal{X}_n) \underset{i.i.d.}{\sim} F(\cdot) \hspace{0.3cm} \Leftrightarrow
\left\lbrace\begin{array}{l}   \hspace{0.12cm}\mathcal{X}_1,...,\mathcal{X}_n \hspace{0.2cm} \text{son mutuamente independientes} \\[0.1cm] 
\hspace{0.12cm}\mathcal{X}_i \sim F(\cdot) \hspace{0.12cm} , \hspace{0.12cm} \forall i=1,...,n    \end{array}\right. \\[1cm]$$



<br>

# Muestra Aleatoria Simple

Sea $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ una v.a. tal que $\hspace{0.1cm}\mathcal{X} \sim D(\cdot)$ 


$(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ es una muestra aleatoria simple (m.a.s.) de tamaño $\hspace{0.08cm}n\hspace{0.08cm}$ de $\hspace{0.1cm}\mathcal{X}$ $\hspace{0.2cm}\Leftrightarrow\hspace{0.2cm}$ $(X_1,...,X_n) \underset{i.i.d.}{\sim} D(\cdot) \\$

**Observación:**

Una m.a.s. de una v.a. es un vector de v.a.'s


<br>

# Muestra de Observaciones


Sea $\hspace{0.12cm}\mathcal{X}\hspace{0.12cm}$ una v.a. tal que $\hspace{0.12cm}\mathcal{X} \sim D(\cdot)$ 


$X=(x_1,...,x_n)\hspace{0.12cm}$ es una muestra de $\hspace{0.08cm}n\hspace{0.08cm}$ observaciones de $\hspace{0.12cm}\mathcal{X}$ $\hspace{0.2cm}\Leftrightarrow\hspace{0.2cm}$ $x_i \in Im(\mathcal{X}) \hspace{0.12cm} ,\hspace{0.12cm} \forall i=1,...,n$ $\hspace{0.2cm}\Leftrightarrow\hspace{0.2cm}$ $x_i$ es una realización de la v.a. $\hspace{0.12cm}\mathcal{X}$  , $\hspace{0.12cm}\forall i=1,...,n \\$


**Observación:**

$1)\hspace{0.2cm}$ Una muestra de observaciones de una v.a. es un vector de números, no son v.a.'s. $\\[0.4cm]$

$2)\hspace{0.2cm}$ Si $\hspace{0.08cm} X=(x_1,...,x_n)\hspace{0.08cm}$ es una muestra de $\hspace{0.08cm}n\hspace{0.08cm}$ observaciones de $\hspace{0.08cm}\mathcal{X}\sim D(\cdot)$ , entonces $\hspace{0.08cm}x_i\hspace{0.08cm}$ es una observacion que ha sido generada por la distribución de probabilidad $\hspace{0.08cm}D(\cdot)\hspace{0.08cm}$, es decir, $\hspace{0.08cm}x_i\hspace{0.08cm}$ puede verse como un numero aleatorio generado en base a la distribución de probabilidad $\hspace{0.08cm}D(\cdot)$ $\\[0.4cm]$

$3)\hspace{0.2cm}$ Si $\hspace{0.08cm}X=(x_1,...,x_n)\hspace{0.08cm}$ es una muestra de $\hspace{0.08cm}n\hspace{0.08cm}$ observaciones de $\mathcal{X}\sim D(\cdot)$ , entonces:


$P(\mathcal{X}= x_i)$ es la probabilidad de  observar $x_i$ al extraer una muestra de observaciones de $\mathcal{X}$ $\\[0.4cm]$


$4)\hspace{0.2cm}$ Si $\hspace{0.08cm}(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.08cm}$ es una muestra aleatoria simple (m.a.s.) de tamaño $\hspace{0.08cm}n\hspace{0.08cm}$ de $\hspace{0.08cm}\mathcal{X}\sim D(\cdot)\hspace{0.08cm}$ , entonces:

$P(\mathcal{X}_1 = x_1 , ..., \mathcal{X}_n=x_n)\hspace{0.08cm}$ es la probabilidad de obtener como valores $\hspace{0.08cm}(x_1,...,x_n)\hspace{0.08cm}$ al extraer una muestra de observaciones de $\hspace{0.08cm}\mathcal{X}$


<br>


# Estadístico

Sea $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ una v.a. tal que $\hspace{0.1cm} \mathcal{X} \sim D(\theta)$ ,

Sea $\hspace{0.1cm}(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ una m.a.s. de $\hspace{0.1cm}\mathcal{X}$

Un estadístico es una función $\hspace{0.1cm}T\hspace{0.1cm}$ de una m.a.s. que no depende del parametro $\hspace{0.1cm}\theta$


Por tanto:

$T(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ es un estadistico

<br>

**Observación:**

1) $\hspace{0.12cm}T(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ es una v.a. al ser una función de v.a.'s $\\[0.8cm]$

2) Dada una muestra de observaciones $\hspace{0.1cm}(x_1 ,..., x_n)\hspace{0.1cm}$ de  la v.a. $\hspace{0.1cm}\mathcal{X} \sim D(\theta)$ 

$\hspace{0.6cm} T(x_1,...,x_n)\hspace{0.1cm}$ es una observación de la v.a. $\hspace{0.1cm}T(\mathcal{X}_1,...,\mathcal{X}_n) \\$


3) Dadas $\hspace{0.1cm}B\hspace{0.1cm}$ muestras de observaciones $\hspace{0.1cm}(x_1^1 , ..., x_n^1) ,...,(x_1^B,...,x_n^B)\hspace{0.1cm}$ de la v.a. $\hspace{0.1cm}\mathcal{X} \sim D(\theta)$ 

$\hspace{0.6cm} T(x_1^1 , ..., x_n^1) ,..., T(x_1^B,...,x_n^B)\hspace{0.1cm}$ es una muestra de observaciones de la v.a. $\hspace{0.1cm}T(\mathcal{X}_1,...,\mathcal{X}_n)$


<br>

## Ejemplos de estadisticos


Sea $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ una v.a. tal que $\hspace{0.1cm}\mathcal{X} \sim D(\theta)\hspace{0.1cm}$ , y sea $\hspace{0.1cm}(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ una m.a.s. de $\hspace{0.1cm} \mathcal{X} \\$


**Media muestral**

$$T(\mathcal{X}_1,...,\mathcal{X}_n) = \overline{\mathcal{X}} = \dfrac{1}{n} \sum_{i=1}^n \mathcal{X}_i \\$$


**Varianza muestral**

$$T(\mathcal{X}_1,...,\mathcal{X}_n) = S^2 = \dfrac{1}{n} \sum_{i=1}^n (\mathcal{X}_i - \overline{\mathcal{X}})^2 \\$$


**Cuasi-Varianza muestral**

$$T(\mathcal{X}_1,...,\mathcal{X}_n) = S^2 = \dfrac{1}{n-1} \sum_{i=1}^n (\mathcal{X}_i - \overline{X})^2 \\$$




<br>


# Estimador Puntual

Dada una v.a. $\hspace{0.1cm}\mathcal{X}\sim D(\theta)\hspace{0.1cm}$ y una m.a.s. $\hspace{0.1cm}(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ de $\hspace{0.1cm}X$, 

Un estimador puntual para el parametro $\hspace{0.1cm}\theta\hspace{0.1cm}$ es un estadistico $\hspace{0.1cm}\widehat{\theta}(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ que se propone para estimar $\hspace{0.1cm}\theta$


<br>


# Estimación Puntual

Dada una v.a. $\hspace{0.1cm}\mathcal{X}\sim D(\theta)\hspace{0.1cm}$ , una m.a.s. $\hspace{0.1cm}(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ de $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ y un estadistico $\hspace{0.1cm}\widehat{\theta}(\mathcal{X}_1,...,\mathcal{X}_n)$

Si  $\hspace{0.1cm}X=(x_1,...,x_n)\hspace{0.1cm}$ es una muestra de observaciones  de $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ , entonces:

$\widehat{\theta}(X) = \widehat{\theta}(x_1,...,x_n)\hspace{0.1cm}$ es una estimación puntual del parametro $\hspace{0.1cm}\theta \\$



**Observaciones:**

Un estimador puntual es una v.a. y una estimación puntual un número.




<br>

# Propiedades básicas de los estimadores

Dada una v.a. $\hspace{0.1cm}\mathcal{X}\sim D(\theta)\hspace{0.1cm}$ , una m.a.s. $\hspace{0.1cm}(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ de $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ y un estimador $\hspace{0.1cm}\widehat{\theta}(\mathcal{X}_1,...,\mathcal{X}_n)$


<br>

## Sesgo


El sesgo del estimador $\widehat{\theta}$ se define como:

$$Sesgo(\widehat{\theta}) = E \left[ \hspace{0.05cm} \widehat{\theta} \hspace{0.05cm} \right]- \theta$$

<br>

## Varianza 

La varianza del estimador $\widehat{\theta}$ se define como:

$$Var(\widehat{\theta}) = E \left[ \hspace{0.05cm} \left( \widehat{\theta} - E [ \hspace{0.05cm} \widehat{\theta} \hspace{0.05cm}  ] \right)^2 \hspace{0.05cm} \right]$$


El error estandar (desviación típica) del estimador $\widehat{\theta}$ se define como:

$$s.e.(\widehat{\theta}) = \sqrt{Var(\widehat{\theta})}$$

<br>

## Error Cuadratico Medio

El error cuadratico medio del estimador $\widehat{\theta}$ se define como:

$$ECM(\widehat{\theta}) = E[ (\widehat{\theta} - \theta)^2] = E[Sesgo(\widehat{\theta})^2]$$


<br>


# Estimacion del sesgo y varianza por Jacknife

Tenemos una v.a. $\hspace{0.1cm}\mathcal{X}\sim D(\theta)\hspace{0.1cm}$ , una m.a.s. $\hspace{0.1cm}(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ de $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ y un estimador $\hspace{0.1cm}\widehat{\theta}(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ del parametro $\hspace{0.1cm}\theta$


Además tenemos una muestra de observaciones $\hspace{0.1cm}X=(x_1,...,x_n)\hspace{0.1cm}$   de la variable de interés $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ , por lo que tenemos la estimación  $\hspace{0.1cm}\widehat{\theta}(X)=\widehat{\theta}(x_1,...,x_n)\hspace{0.1cm}$ del parámetro $\hspace{0.1cm} \theta \\$


Se define $\hspace{0.1cm}X_{(r)}\hspace{0.1cm}$ como la muestra que contiene todos los valores de $\hspace{0.1cm}X\hspace{0.1cm}$ excepto $\hspace{0.1cm}x_{r}$

Es decir:



$$X_{(r)} = (\hspace{0.05cm}x_{1}\hspace{0.05cm},\hspace{0.05cm} x_{2}\hspace{0.05cm},..,\hspace{0.05cm} x_{r-1}\hspace{0.05cm},\hspace{0.05cm}x_{r+1}\hspace{0.05cm} ,..,\hspace{0.05cm} x_{n}\hspace{0.05cm})$$  

para  $\hspace{0.2cm} r=1,...,n \\$

 

Se define la replica $\hspace{0.1cm}r$-esima del estimador $\hspace{0.1cm}\widehat{\theta}\hspace{0.1cm}$ como: $\\[0.5cm]$

$$\widehat{\theta}_{(r)} = \widehat{\theta}(X_{(r)})= \widehat{\theta}(\hspace{0.05cm}x_{1}\hspace{0.05cm},\hspace{0.05cm} x_{2}\hspace{0.05cm},..,\hspace{0.05cm} x_{r-1}\hspace{0.05cm},\hspace{0.05cm}x_{r+1}\hspace{0.05cm} ,..,\hspace{0.05cm} x_{n}\hspace{0.05cm})$$


<br>

## Estimación Jacknife del sesgo


El **estimación Jacknife** del **sesgo** del estimador $\hspace{0.1cm}\widehat{\theta}\hspace{0.1cm}$ se define como: $\\[0.5cm]$

$$\widehat{Sesgo}(\widehat{\theta})_{Jack} \hspace{0.1cm}=\hspace{0.1cm}  (n-1) \cdot \left(   \dfrac{1}{n} \cdot \sum_{r=1}^{n} \widehat{\theta}_{(r)} \hspace{0.1cm} -\hspace{0.1cm} \widehat{\theta} \right)$$



Donde:

$$\widehat{\theta} \hspace{0.1cm}=\hspace{0.1cm} \widehat{\theta}(X) \hspace{0.1cm}=\hspace{0.1cm} \widehat{\theta}(x_1,...,x_n)$$


<br>

## Estimación Jacknife de la varianza

La **estimación Jacknife** de la **varianza** del estimador $\widehat{\theta}$ se define como: $\\[0.6cm]$


$$\widehat{ Var}(\widehat{\theta})_{Jack} \hspace{0.1cm}= \hspace{0.1cm} \dfrac{n-1}{n} \cdot \sum_{r=1}^{n} \left( \widehat{\theta}_{(r)} \hspace{0.1cm}-\hspace{0.1cm} \dfrac{1}{n} \sum_{r=1}^{n} \widehat{\theta}_{(r)}  \right)^2$$



<br>

La **estimación Jacknife** del **error estandar** del estimador $\widehat{\theta}$ se define como: $\\[0.6cm]$

$$\widehat{ s.e.}(\widehat{\theta})_{Jack} \hspace{0.1cm}=\hspace{0.1cm} \sqrt{ \widehat{ Var}(\widehat{\theta})_{Jack} \hspace{0.1cm}}$$

<br>

**Observación:**

El Jacknife funciona bien cuando el estimador es suave (smooth). 

Un estimador es suave cuando ante pequeños cambios en la muestra de datos genera pequeños cambios en el estimador.

Ejemplo de estimador suave es el estimador plug-in de la media poblacional, es decir la media muestral.

Ejemplo de estimador no suave es el estimador plug-in de la mediana poblacional, es decir la mediana muestral


 


<br>

## Estimación Jacknife de un parametro con corrección de sesgo


Tenemos una v.a. $\hspace{0.1cm}\mathcal{X}\sim D(\theta)\hspace{0.1cm}$ , una m.a.s. $\hspace{0.1cm}(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ de $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ y un estimador $\hspace{0.1cm}\widehat{\theta}(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ del parametro $\hspace{0.1cm}\theta$


Además tenemos una muestra de observaciones $\hspace{0.1cm}X=(x_1,...,x_n)\hspace{0.1cm}$   de la variable de interés $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ , por lo que tenemos la estimación  $\hspace{0.1cm}\widehat{\theta}(X)=\widehat{\theta}(x_1,...,x_n)\hspace{0.1cm}$ del parámetro $\hspace{0.1cm} \theta \\[1cm]$


La **estimación Jacknife con sesgo corregido** del parametro $\hspace{0.1cm} \theta\hspace{0.1cm}$ se define como: $\\[0.5cm]$

$$
\widehat{\theta}_{Jack} \hspace{0.2cm}=\hspace{0.2cm} \widehat{\theta} \hspace{0.1cm}-\hspace{0.1cm} \widehat{Sesgo}(\widehat{\theta})_{Jack} \ \hspace{0.2cm}=\hspace{0.2cm} \widehat{\theta} -  (n-1) \cdot \left(    \dfrac{1}{n} \cdot \sum_{r=1}^{n} \widehat{\theta}_{(r)}
 - \widehat{\theta} \right) \hspace{0.2cm}=\hspace{0.2cm}   n\cdot \widehat{\theta} - (n-1)\cdot  \dfrac{1}{n} \cdot \sum_{r=1}^{n} \widehat{\theta}_{(r)} \\
$$

Donde:

$$\widehat{\theta} \hspace{0.1cm} =\hspace{0.1cm} \widehat{\theta}(X)\hspace{0.1cm} =\hspace{0.1cm} \widehat{\theta}(x_1,...,x_n)$$


<br

<br>

## Estimación Jacknife del sesgo en `Python`


## Estimación Jacknife de la desviación típica en `Python`


## Estimación Jacknife del error cuadratico medio en `Python`


## Estimación Jacknife con sesgo correguido en `Python`




<br>

<br>


# Estimación del sesgo , varianza y error cuadratico medio de un estimador por Bootstrap


Tenemos una v.a. $\hspace{0.1cm}\mathcal{X}\sim D(\theta)\hspace{0.1cm}$ , una m.a.s. $\hspace{0.1cm}(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ de $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ y un estimador $\hspace{0.1cm}\widehat{\theta}(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ del parametro $\hspace{0.1cm}\theta$


Además tenemos una muestra de observaciones $\hspace{0.1cm}X=(x_1,...,x_n)\hspace{0.1cm}$   de la variable de interés $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ , por lo que tenemos la estimación $\hspace{0.1cm}\widehat{\theta}(X)=\widehat{\theta}(x_1,...,x_n)\hspace{0.1cm}$ del parametro $\hspace{0.1cm}\theta\\$ 


Una **muestra bootstrap**  de $\hspace{0.1cm}X\hspace{0.1cm}$ se define como una **muestra aleatoria con reemplazamiento** de tamaño $\hspace{0.1cm}n\hspace{0.1cm}$ de $\hspace{0.1cm}X$ 


Tenemos $\hspace{0.1cm}B\hspace{0.1cm}$ muestras bootstrap de $\hspace{0.1cm}X\hspace{0.1cm}$ : $\\[0.5cm]$

$$X_{(1)},X_{(2)},...,X_{(B)} \\$$


Se define la replica bootstap $\hspace{0.1cm}b$-esima del estimador $\hspace{0.1cm}\widehat{\theta}$ como: $\\[0.5cm]$


$$\widehat{\theta}_{(b)} = \widehat{\theta}(X_{(b)})$$



<br>

<br>


## Estimación bootstrap del sesgo de un estimador

La **estimación bootstrap** del **sesgo** del estimador $\hspace{0.1cm}\widehat{\theta}\hspace{0.1cm}$ se define como: $\\[0.5cm]$


$$\widehat{Sesgo}(\widehat{\theta})_{Boot} \hspace{0.12cm} =\hspace{0.12cm}  \dfrac{1}{B} \cdot \sum_{b=1}^{B} \left( \widehat{\theta}_{(b)}  - \widehat{\theta}(X) \right) \hspace{0.12cm}=\hspace{0.12cm}  \dfrac{1}{B} \cdot \sum_{b=1}^{B}  \widehat{\theta}_{(b)}  \hspace{0.1cm} -\hspace{0.1cm} \widehat{\theta}(X)$$


Donde:


$$\widehat{\theta}(X) \hspace{0.12cm} =\hspace{0.12cm}  \widehat{\theta}(x_1,...,x_n)\\$$

**Observación:**

La estimación bootstrap del sesgo del estimador $\hspace{0.12cm}\widehat{\theta}\hspace{0.12cm}$ es la media del vector de replicas bootstrap $\hspace{0.12cm}(\widehat{\theta}_{(1)},\widehat{\theta}_{(2)},...,\widehat{\theta}_{(B)})$ menos la estimación $\widehat{\theta}(X)$



<br>


## Estimación bootstrap de la varianza de un estimador

La **estimación Bootstrap** de la **varianza** del estimador $\hspace{0.1cm}\widehat{\theta}\hspace{0.1cm}$ se define como: $\\[0.5cm]$

$$\widehat{Var}(\widehat{\theta})_{Boot} \hspace{0.12cm} =\hspace{0.12cm}   \dfrac{1}{B-1} \cdot \sum_{b=1}^{B} \left( \widehat{\theta}_{(b)}  \hspace{0.1cm}-\hspace{0.1cm} \dfrac{1}{B} \cdot \sum_{b=1}^{B} \widehat{\theta}_{(b)} \right)^2 \\[0.8cm]$$


La **estimación bootstrap** de la **desviación típica** del estimador $\hspace{0.1cm}\widehat{\theta}\hspace{0.1cm}$ se define como: $\\[0.5cm]$

$$\widehat{s.e.}(\widehat{\theta})_{Boot} \hspace{0.12cm} =\hspace{0.12cm}   \sqrt{ \widehat{Var}(\widehat{\theta})_{Boot}   }\\$$


**Observación:**

La estimación bootstrap de la varianza del estimador $\hspace{0.12cm}\widehat{\theta}\hspace{0.12cm}$ es la cuasi-varianza del vector de replicas bootstrap $\hspace{0.12cm}(\widehat{\theta}_{(1)},\widehat{\theta}_{(2)},...,\widehat{\theta}_{(B)})$


<br>


## Estimación bootstrap del error cuadratico medio de un estimador

El **estimación Bootstrap** del **error cuadrático medio** del estimador $\hspace{0.1cm}\widehat{\theta}\hspace{0.1cm}$ se define como: $\\[0.5cm]$

$$\widehat{ECM}(\widehat{\theta})_{Boot} \hspace{0.12cm} =\hspace{0.12cm}   \dfrac{1}{B} \cdot \sum_{b=1}^{B} \left( \widehat{\theta}_{(b)}  - \widehat{\theta}(X) \right)^2\\$$


Donde:


$$\widehat{\theta}(X) \hspace{0.12cm} =\hspace{0.12cm}  \widehat{\theta}(x_1,...,x_n)$$


<br>

## Estimación bootstrap  de un parametro con corrección de sesgo

La **estimación Bootstrap con sesgo corregido** del parametro $\hspace{0.1cm} \theta\hspace{0.1cm}$ se define como: $\\[0.5cm]$

$$
\widehat{\theta}_{Boot} \hspace{0.2cm}=\hspace{0.2cm} \widehat{\theta}(X) \hspace{0.1cm}-\hspace{0.1cm} \widehat{Sesgo}(\widehat{\theta})_{Boot} \ \hspace{0.2cm}=\hspace{0.2cm}  \widehat{\theta}(X) \hspace{0.1cm} -\hspace{0.1cm}\hspace{0.1cm} \dfrac{1}{B} \cdot \sum_{b=1}^{B} \left( \widehat{\theta}_{(b)}  - \widehat{\theta}(X) \right) \\
$$

Donde:

$$\widehat{\theta}(X)\hspace{0.1cm} =\hspace{0.1cm} \widehat{\theta}(x_1,...,x_n)$$


<br>

<br>

## Estimación bootstrap del sesgo en `Python`


## Estimación bootstrap de la desviación típica en `Python`


## Estimación bootstrap del error cuadratico medio en `Python`


## Estimación bootstrap con sesgo correguido en `Python`


<br>



# La función de distribución  

Dada una v.a. $\hspace{0.1cm}\mathcal{X}\sim D(\theta)\hspace{0.1cm}$ y una m.a.s. $\hspace{0.1cm}(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ de $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$  


La **función de distribución** de la v.a. $\mathcal{X}$ es : $\\[0.7cm]$

$$F_{X}(z) = P(X \leq z)  \hspace{0.2cm}, \hspace{0.2cm}\forall z \in \mathbb{R} \\$$


**Observación:**

La función de distribución de la v.a. $\mathcal{X}$ coincide con las funciones de distribución de las v.a's $\mathcal{X}_1,...,\mathcal{X}_n \\$ , porque tienen la misma distribución de probabilidad.

$$F_{X}(z) = F_{X_i}(z) \hspace{0.2cm}, \hspace{0.2cm}\forall z \in \mathbb{R} \hspace{0.2cm},\hspace{0.2cm} \forall i \in \lbrace 1,...,n \rbrace$$


<br>



# La función de distribución empírica

Dada una v.a. $\hspace{0.1cm}\mathcal{X}\sim D(\theta)\hspace{0.1cm}$



La función de distribución empírica basada en una m.a.s. $\hspace{0.1cm}(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ de $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ se define como:


$$\widehat{F}_n(z) \hspace{0.1cm} = \hspace{0.1cm} \dfrac{1}{n} \sum_{i=1}^n  I(\mathcal{X}_i \geq z) $$

donde:

$$I(X_i \geq z) =  \left\lbrace\begin{array}{l}   \hspace{0.12cm} 1 \hspace{0.2cm},\hspace{0.3cm} \text{si} \hspace{0.3cm} X_i \geq z \\[0.1cm] 
\hspace{0.12cm} 0 \hspace{0.2cm},\hspace{0.3cm} \text{si} \hspace{0.3cm} X_i > z \\[0.1cm] 
\end{array}\right.$$

para $\hspace{0.1cm} z\in \mathbb{R}$


**Observaciones:**

- $\widehat{F}_n(z)$ es una v.a.

- $\widehat{F}_n(z)$ es usada como estimador de $F_X(z)$

<br>



## Porpiedades de la función de distribución empírica como estimador

<br>

$$\hspace{0.2cm} I(X_i \geq z) \hspace{0.2cm}\sim\hspace{0.2cm} Bernoulli\left( p \right) \hspace{0.2cm} ,\hspace{0.2cm}  \text{con}\hspace{0.2cm} \hspace{0.2cm} p=F_X(z)=P(X<z)\\[0.8cm]$$

$$\hspace{0.2cm}  \sum_{i=1}^n  I(X_i \geq z) \hspace{0.2cm}\sim\hspace{0.2cm} Binomial(n , p  ) \hspace{0.2cm} ,\hspace{0.2cm}  \text{con}\hspace{0.2cm} \hspace{0.2cm} p=F_X(z)=P(X<z) \\[0.8cm]$$

$$\hspace{0.2cm} \widehat{F}_n(z) \hspace{0.1cm} = \hspace{0.1cm}   \dfrac{1}{n} \sum_{i=1}^n  I(X_i \geq z) \hspace{0.2cm}\sim\hspace{0.2cm}  \dfrac{1}{n} \cdot Binomial(n , p  ) \hspace{0.2cm} ,\hspace{0.2cm}  \text{con}\hspace{0.2cm} \hspace{0.2cm} p\hspace{0.1cm}=\hspace{0.1cm}F_X(z)\hspace{0.1cm}=\hspace{0.1cm}P(X<z) \\[0.8cm]$$


$$E\left[ \widehat{F}_n(z)  \right] \hspace{0.1cm}=\hspace{0.1cm}  E \left[ \dfrac{1}{n} \cdot Binomial(n , p  ) \right] \hspace{0.1cm}=\hspace{0.1cm} \dfrac{1}{n} \cdot n \cdot  p  \hspace{0.1cm}=\hspace{0.1cm} p \hspace{0.1cm}=\hspace{0.1cm} F_X(z)=P(X<z) \\[0.8cm]$$


$$Var\left[ \widehat{F}_n(z)  \right] \hspace{0.1cm}=\hspace{0.1cm} Var \left[ \dfrac{1}{n} \cdot Binomial(n , p  ) \right]\hspace{0.1cm}=\hspace{0.1cm} \dfrac{1}{n^2} \cdot n \cdot  p \cdot (1-p) \hspace{0.1cm}=\hspace{0.1cm} \dfrac{1}{n} \cdot  F_X(z)\cdot (1- F_X(z))  \hspace{0.1cm}=\hspace{0.1cm} F_X(z)=P(X<z) \\[0.8cm]$$


<br>

<br>


Si tenemos una muestra de observaciones $\hspace{0.1cm}X=(x_1,...,x_n)\hspace{0.1cm}$   de la variable de interés $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$  


Tenemos la siguiente **estimación** de la función de distribución de $\mathcal{X}$ a través de la funcion de distribución emprica:

$$\widehat{F}_n(z) \hspace{0.1cm}=\hspace{0.1cm} \dfrac{1}{n} \sum_{i=1}^n  I(x_i \geq z) \hspace{0.1cm} = \hspace{0.1cm} \dfrac{\# \lbrace \hspace{0.1cm}  i=1,..,n\hspace{0.1cm}  / \hspace{0.1cm}  x_i \geq z\hspace{0.1cm}  \rbrace}{n}\\$$


para $\hspace{0.1cm} z\in \mathbb{R} \\$

<br>

## Propiedades de la función de distribución emprica como estimación

<br>

- $\hspace{0.2cm} \widehat{F}_n(z) \hspace{0.1cm}=\hspace{0.1cm} Q(X , z) \\$

$\hspace{1.5cm}$ Donde: $\hspace{0.2cm} Q(X , z)\hspace{0.1cm}$  es el cuantil de orden $\hspace{0.1cm}z\hspace{0.1cm}$ de $\hspace{0.1cm}X=(x_1,...,x_n) \\$



- Si se ordena la muestra $\hspace{0.1cm}X=(x_1,...,x_n)\hspace{0.1cm}$ de menor a mayor $x_{(1)}\hspace{0.1cm}<\hspace{0.1cm}x_{(2)}\hspace{0.1cm}<...<\hspace{0.1cm}x_{(n)}\hspace{0.1cm}$ , entonces: $\\[0.6cm]$



$$\hspace{0.2cm} \widehat{F}_n(z) = \left\lbrace\begin{array}{l}   \hspace{0.12cm} 0 \hspace{0.2cm},\hspace{0.3cm} \text{si} \hspace{0.3cm} z < x_{(1)} \\[0.1cm] 
\hspace{0.12cm} 1/n   \hspace{0.2cm},\hspace{0.3cm} \text{si} \hspace{0.3cm} z = x_{(1)}  \\[0.1cm] 
\hspace{0.12cm} 1/n   \hspace{0.2cm},\hspace{0.3cm} \text{si} \hspace{0.3cm}  x_{(1)} \leq z < x_{(2)} \\[0.1cm] 
\hspace{0.12cm} 2/n   \hspace{0.2cm},\hspace{0.3cm} \text{si} \hspace{0.3cm}  z = x_{(2)} \\[0.1cm] 
\hspace{0.12cm} 2/n   \hspace{0.2cm},\hspace{0.3cm} \text{si} \hspace{0.3cm}  x_{(2)} \leq z < x_{(3)} \\[0.1cm]
\dots \\[0.15cm]
\hspace{0.12cm} (n-1)/n   \hspace{0.2cm},\hspace{0.3cm} \text{si} \hspace{0.3cm}   z = x_{(n-1)} \\[0.1cm]
\hspace{0.12cm} (n-1)/n   \hspace{0.2cm},\hspace{0.3cm} \text{si} \hspace{0.3cm}   x_{(n-1)} \leq z < x_{(n)} \\[0.1cm] 
\hspace{0.12cm} 1   \hspace{0.2cm},\hspace{0.3cm} \text{si} \hspace{0.3cm}   z \geq x_{(n)}
\end{array}\right.$$


<br>

## Ley debil de los grandes números

La ley debil de los grandes números afirma que:

Dada una v.a. $\hspace{0.1cm}\mathcal{X}\sim D(\theta)\hspace{0.1cm}$ tal que $\hspace{0.1cm}E[\mathcal{X}]=\mu\hspace{0.1cm}$

Si $\widehat{F}_n(z)$ es la función de distribución empirica basada en la m.a.s. $\hspace{0.1cm}(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ de $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ , se cumple que:

$$\dfrac{1}{n} \sum_{i=1}^n \mathcal{X}_i \hspace{0.25cm}\underset{p}{\rightarrow}\hspace{0.25cm} E[X]=\mu$$


**Observación:**

$$E[X]=E[X_i] \hspace{0.25cm},\hspace{0.25 cm} \forall i \in \lbrace 1,...,n \rbrace$$

<br>

Podemos aplicar la ley de los grandes números a la distribución empirica:


Como $\hspace{0.15cm}I(\mathcal{X}_i \geq z) \sim Bernouilli(p)\hspace{0.15cm}$ , con $\hspace{0.15cm}E\left[I(\mathcal{X}_i \geq z)\right]\hspace{0.1cm} =\hspace{0.1cm} p\hspace{0.1cm}=\hspace{0.1cm}F_X(z)\hspace{0.1cm}=\hspace{0.1cm}P(X \leq z)\\$

Aplicando la ley debil de los grandes números tenemos lo siguiente:


$$\widehat{F}_n(z) \hspace{0.1cm} = \hspace{0.1cm} \dfrac{1}{n} \sum_{i=1}^n  I(\mathcal{X}_i \geq z) \hspace{0.25cm}\underset{p}{\rightarrow} \hspace{0.25cm} p=F_X(z) \\$$

En conclusión:

$$\widehat{F}_n(z) \hspace{0.25cm}\underset{p}{\rightarrow} \hspace{0.25cm} F_X(z)\\$$


Usando la definición de convergencia en probabilidad, se tiene que: $\\[0.5cm]$


$$\underset{n\rightarrow \infty}{lim} \hspace{0.1cm} P\left( \hspace{0.1cm} | \widehat{F}_n(z) - F_X(z) |\hspace{0.1cm} \leq \varepsilon \right) \hspace{0.1cm}=\hspace{0.1cm} 1 \hspace{0.25cm},\hspace{0.25cm} \forall \varepsilon > 0 \\$$


Pero se cumple un resultado más fuerte aun, el **teorema de Glivenko-Cantelli**.

## Teorema de Glivenko-Cantelli

Dada una v.a. $\hspace{0.1cm}\mathcal{X}\sim D(\theta)\hspace{0.1cm}$ tal que $\hspace{0.1cm}E[\mathcal{X}]=\mu\hspace{0.1cm}\\$ 

Si $\hspace{0.1cm}\widehat{F}_n(z)\hspace{0.1cm}$ es la función de distribución empirica basada en la m.a.s. $\hspace{0.1cm}(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ de $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ , se cumple que: $\\[0.5cm]$

$$sup \left\lbrace \hspace{0.1cm}\left|\hspace{0.1cm} \widehat{F}_n(z)  - F_X(z)\hspace{0.1cm} \right| \hspace{0.15cm}  / \hspace{0.15cm} z \in \mathbb{R} \hspace{0.1cm}\right\rbrace \hspace{0.25cm}\underset{p}{\rightarrow} \hspace{0.25cm} 0\\$$






<br>

<br>

# Bootstrap en Regresión Lineal 

## Botstrap en Regresión Lineal basado en residuos

Tenemos un modelo de regresión lineal:

$$y_i = \beta\cdot x_i + \varepsilon_i \forall i \in \lbrace 1,...,n \rbrace\\$$

El modelo de regresión lineal estimado por mínimos cuadrados ordinarios es:

Tenemos un modelo de regresión lineal:

$$y_i = \widehat{\beta}\cdot x_i  \forall i \in \lbrace 1,...,n \rbrace\\$$

Donde:

$$\widehat{\beta} = (X \cdot X^t)^{-1} \cdot X^t \cdot y$$


Recordemos que en el modelo de regresión lineal los residuos estimados del modelo son:


$$\widehat{\varepsilon} = (\widehat{\varepsilon}_1,...,\widehat{\varepsilon}_n)^t\\$$

Donde:

$$\widehat{\varepsilon}_i = y_i - \widehat{\beta}\cdot x_i  \forall i \in \lbrace 1,...,n \rbrace\\$$

Se toma una muestra aleatoria con reemplazamiento de los residuos estimados del modelo: $\\[0.5cm]$


$$\widehat{\varepsilon}^* = (\widehat{\varepsilon}_1^*,...,\widehat{\varepsilon}_n^*)^t\\$$


Donde:


$$\forall j \in  \lbrace 1,...,n \rbrace  \hspace{0.25cm} , \hspace{0.25cm} \exists \hspace{0.1cm} i \in \lbrace 1,...,n \rbrace \hspace{0.25cm} , \hspace{0.25cm} \widehat{\varepsilon}_j^* = \widehat{\varepsilon}_i$$


Las respuestas bootstrap se generan como:

$$y_i^* = x_i \cdot \widehat{\beta} + \varepsilon_i^*  \hspace{0.25cm} , \hspace{0.25cm} \forall j \in  \lbrace 1,...,n \rbrace$$



La estimación bootstrap de $\hspace{0.1cm} \beta\hspace{0.1cm} $ es:


$$\widehat{\beta}\hspace{0.05cm}^* = (X^t \cdot X)^{-1} \cdot X^t \cdot y^* \\$$

Donde:

$$y\hspace{0.05cm}^* = (y_1^* ,..., y_n^*)^t \\$$


La estimación de la varianza de los coeficientes bootstrap es:


$$Var(\widehat{\beta}_j^*) \hspace{0.1cm}=\hspace{0.1cm} \widehat{\sigma}^2_* \cdot q_{jj} \\$$

Donde:

$$q_{jj} \hspace{0.1cm}=\hspace{0.1cm} diag (X^t\cdot X)^{-1} [j+1]$$

$$\widehat{\sigma}^2_* \hspace{0.1cm}=\hspace{0.1cm} Var(\varepsilon_i^*) \hspace{0.1cm}=\hspace{0.1cm} \dfrac{1}{n-p-1} \cdot \sum_{i=1}^n \varepsilon_i^*$$





<br>


## Botstrap en Regresión Lineal basado en pares


Este método consiste en remuestrar con reemplazamiento los pares $z_i = (x_i , y_i)$

En este caso la muestra bootstrap es la siguiente:

$$z^* = \lbrace  (x_1^* , y_1^*) ,..., (x_n^* , y_n^*)      \rbrace$$

Donde:


$$\forall j \in  \lbrace 1,...,n \rbrace  \hspace{0.25cm} , \hspace{0.25cm} \exists \hspace{0.1cm} i \in \lbrace 1,...,n \rbrace \hspace{0.25cm} , \hspace{0.25cm} x_j^* = x_i$$

$$\forall j \in  \lbrace 1,...,n \rbrace  \hspace{0.25cm} , \hspace{0.25cm} \exists \hspace{0.1cm} i \in \lbrace 1,...,n \rbrace \hspace{0.25cm} , \hspace{0.25cm} y_j^* = y_i$$



<br>

<br>

# Bootstrap en Series temporales






<br>

<br>


# Intervalos de confianza basados en bootstrap






<br>

<br>

# Contrastes de hipotesis basados en permutaciones <a class="anchor" id="1"></a>  


<br>

# Contrastes de hipotesis basados en bootstrap







