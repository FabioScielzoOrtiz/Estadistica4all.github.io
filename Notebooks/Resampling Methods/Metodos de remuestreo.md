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

$\mathcal{X}_1,...,\mathcal{X}_n\hspace{0.08cm}$ son variables aleatorias mutuamente independientes e identicamente distribuidas  (i.i.d.) $\hspace{0.3cm}\Leftrightarrow$

1) $\hspace{0.08cm} \mathcal{X}_1,...,\mathcal{X}_n\hspace{0.08cm}$ son mutuamente independientes independientes , es decir, $\hspace{0.08cm} P(\mathcal{X}_1=x_1,...,\mathcal{X}_n=x_n)= \prod_{i=1}^n P(\mathcal{X}_i=x_i)$. Llo que implica que también son independientes dos a dos , es decir, $\hspace{0.08cm} \mathcal{X}_i \perp \mathcal{X}_j \hspace{0.08cm} \forall i\neq j \\$

2) $\hspace{0.08cm}\mathcal{X}_1,...,\mathcal{X}_n\hspace{0.08cm}$ tienen la misma distribución de probabilidad, es decir, $\hspace{0.08cm}\mathcal{X}_i \sim F(\dot), \forall i=1,...,n$ 

Donde $\hspace{0.08cm}F(\cdot)\hspace{0.08cm}$ es una distribucion de probabilidad con parametros no especificados.

<br>


Seguiremos la siguiente notación:


$(\mathcal{X}_1,...,\mathcal{X}_n) \underset{i.i.d.}{\sim} F(\cdot) \hspace{0.3cm} \Leftrightarrow$

1) $\hspace{0.08cm}\mathcal{X}_1,...,\mathcal{X}_n \hspace{0.08cm}$ son mutuamente independientes $\\[0.6cm]$

2) $\hspace{0.08cm}\mathcal{X}_i \sim F(\cdot), \hspace{0.08cm} \forall i=1,...,n$ 





## Muestra Aleatoria Simple

Sea $\hspace{0.08cm}\mathcal{X}\hspace{0.08cm}$ una v.a. tal que $\hspace{0.08cm}\mathcal{X} \sim D(\cdot)$ 


$(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.08cm}$ es una muestra aleatoria simple (m.a.s.) de tamaño $\hspace{0.08cm}n\hspace{0.08cm}$ de $\hspace{0.08cm}\mathcal{X}$ $\hspace{0.08cm}\Leftrightarrow\hspace{0.08cm}$ $(X_1,...,X_n) \underset{i.i.d.}{\sim} D(\cdot) \\$

**Observación:**

Una m.a.s. de una v.a. es un vector de v.a.'s


## Muestra de Observaciones


Sea $\hspace{0.08cm}\mathcal{X}\hspace{0.08cm}$ una v.a. tal que $\hspace{0.08cm}\mathcal{X} \sim D(\cdot)$ 


$X=(x_1,...,x_n)\hspace{0.08cm}$ es una muestra de $\hspace{0.08cm}n\hspace{0.08cm}$ observaciones de $\hspace{0.08cm}\mathcal{X}$ $\hspace{0.2cm}\Leftrightarrow\hspace{0.2cm}$ $x_i \in Im(\mathcal{X}) \hspace{0.08cm} , \forall i=1,...,n$ $\hspace{0.18cm}\Leftrightarrow\hspace{0.18cm}$ $x_i$ es una realizacion de la v.a. $\hspace{0.08cm}\mathcal{X}$  , $\hspace{0.08cm}\forall i=1,...,n \\$


**Observación:**

1) Una muestra de observaciones de una v.a. es un vector de números, no son v.a.'s. $\\[0.4cm]$

2) Si $\hspace{0.08cm} X=(x_1,...,x_n)\hspace{0.08cm}$ es una muestra de $\hspace{0.08cm}n\hspace{0.08cm}$ observaciones de $\hspace{0.08cm}\mathcal{X}\sim D(\cdot)$ , entonces $\hspace{0.08cm}x_i\hspace{0.08cm}$ es una observacion que ha sido generada por la distribución de probabilidad $\hspace{0.08cm}D(\cdot)\hspace{0.08cm}$, es decir, $\hspace{0.08cm}x_i\hspace{0.08cm}$ puede verse como un numero aleatorio generado en base a la distribución de probabilidad $\hspace{0.08cm}D(\cdot)$ $\\[0.4cm]$

3) Si $\hspace{0.08cm}X=(x_1,...,x_n)\hspace{0.08cm}$ es una muestra de $\hspace{0.08cm}n\hspace{0.08cm}$ observaciones de $\mathcal{X}\sim D(\cdot)$ , entonces:


$P(\mathcal{X}= x_i)$ es la probabilidad de  observar $x_i$ al extraer una muestra de observaciones de $\mathcal{X}$ $\\[0.4cm]$


4) Si $\hspace{0.08cm}(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.08cm}$ es una muestra aleatoria simple (m.a.s.) de tamaño $\hspace{0.08cm}n\hspace{0.08cm}$ de $\hspace{0.08cm}\mathcal{X}\sim D(\cdot)\hspace{0.08cm}$ , entonces:

$P(\mathcal{X}_1 = x_1 , ..., \mathcal{X}_n=x_n)\hspace{0.08cm}$ es la probabilidad de obtener como valores $\hspace{0.08cm}(x_1,...,x_n)\hspace{0.08cm}$ al extraer una muestra de observaciones de $\hspace{0.08cm}\mathcal{X}$


<br>



## Estadístico

Sea $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ una v.a. tal que $\hspace{0.1cm} \mathcal{X} \sim D(\theta)$ ,

Sea $\hspace{0.1cm}(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ una m.a.s. de $\hspace{0.1cm}\mathcal{X}$

Un estadistico es una funcion $\hspace{0.1cm}T\hspace{0.1cm}$ de una m.a.s. que no depende del parametro $\hspace{0.1cm}\theta$


Por tanto:

$T(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ es un estadistico

<br>

**Observación:**

1) $\hspace{0.1cm}T(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ es una v.a. al ser una función de v.a.'s

2) Dada una muestra de observaciones $\hspace{0.1cm}(x_1 ,..., x_n)\hspace{0.1cm}$ de  la v.a. $\hspace{0.1cm}\mathcal{X} \sim D(\theta)$ 

$T(x_1,...,x_n)\hspace{0.1cm}$ es una observación de la v.a. $\hspace{0.1cm}T(\mathcal{X}_1,...,\mathcal{X}_n)$


3) Dadas $\hspace{0.1cm}B\hspace{0.1cm}$ muestras de observaciones $\hspace{0.1cm}(x_1^1 , ..., x_n^1) ,...,(x_1^B,...,x_n^B)\hspace{0.1cm}$ de la v.a. $\hspace{0.1cm}\mathcal{X} \sim D(\theta)$ 

$T(x_1^1 , ..., x_n^1) ,..., T(x_1^B,...,x_n^B)\hspace{0.1cm}$ es una muestra de observaciones de la v.a. $\hspace{0.1cm}T(\mathcal{X}_1,...,\mathcal{X}_n)$


<br>

### Ejemplos de estadisticos


Sea $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ una v.a. tal que $\hspace{0.1cm}\mathcal{X} \sim D(\theta)\hspace{0.1cm}$ , y sea $\hspace{0.1cm}(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ una m.a.s. de $\mathcal{X}$


**Media muestral**

$$T(\mathcal{X}_1,...,\mathcal{X}_n) = \overline{\mathcal{X}} = \dfrac{1}{n} \sum_{i=1}^n \mathcal{X}_i \\$$


**Varianza muestral**

$$T(\mathcal{X}_1,...,\mathcal{X}_n) = S^2 = \dfrac{1}{n} \sum_{i=1}^n (\mathcal{X}_i - \overline{\mathcal{X}})^2 \\$$


**Cuasi-Varianza muestral**

$$T(\mathcal{X}_1,...,\mathcal{X}_n) = S^2 = \dfrac{1}{n-1} \sum_{i=1}^n (\mathcal{X}_i - \overline{X})^2 \\$$




<br>


## Estimador Puntual

Dada una v.a. $\hspace{0.1cm}\mathcal{X}\sim D(\theta)\hspace{0.1cm}$ y una m.a.s. $\hspace{0.1cm}(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ de $\hspace{0.1cm}X$, 

Un estimador puntual para el parametro $\hspace{0.1cm}\theta\hspace{0.1cm}$ es un estadistico $\hspace{0.1cm}\widehat{\theta}(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ que se propone para estimar $\theta$


<br>


## Estimación Puntual

Dada una v.a. $\hspace{0.1cm}\mathcal{X}\sim D(\theta)\hspace{0.1cm}$ , una m.a.s. $\hspace{0.1cm}(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ de $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ y un estadistico $\hspace{0.1cm}\widehat{\theta}(\mathcal{X}_1,...,\mathcal{X}_n)$

Si  $\hspace{0.1cm}X=(x_1,...,x_n)\hspace{0.1cm}$ es una muestra de observaciones  de $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ , entonces:

$\widehat{\theta}(X) = \widehat{\theta}(x_1,...,x_n)\hspace{0.1cm}$ es una estimación puntual del parametro $\hspace{0.1cm}\theta \\$



**Observaciones:**

Un estimador puntual es una v.a. y una estimación puntual un número.





## Propiedades básicas de los estimadores

Dada una v.a. $\hspace{0.1cm}\mathcal{X}\sim D(\theta)\hspace{0.1cm}$ , una m.a.s. $\hspace{0.1cm}(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ de $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ y un estimador $\hspace{0.1cm}\widehat{\theta}(\mathcal{X}_1,...,\mathcal{X}_n)$


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

$$ECM(\widehat{\theta}) = E[ (\widehat{\theta} - \theta)^2] = E[Sesgo(\widehat{\theta})^2]$$


<br>




# Métodos de Remuestreo


## Estimacion del sesgo y varianza por Jacknife

Tenemos una v.a. $\hspace{0.1cm}\mathcal{X}\sim D(\theta)\hspace{0.1cm}$ , una m.a.s. $\hspace{0.1cm}(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ de $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ y un estimador $\hspace{0.1cm}\widehat{\theta}(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ del parametro $\hspace{0.1cm}\theta$


Pero además tenemos una muestra de observaciones $\hspace{0.1cm}X=(x_1,...,x_n)\hspace{0.08cm}$   de la variable de interés $\hspace{0.08cm}\mathcal{X}$ , por lo que tenemos la estimación  $\hspace{0.1cm}\widehat{\theta}(X)=\widehat{\theta}(x_1,...,x_n)\hspace{0.1cm}$ del parámetro $\hspace{0.08cm} \theta$


Se define $\hspace{0.1cm}X_{(r)}\hspace{0.1cm}$ como la muestra que contiene todos los valores de $\hspace{0.1cm}X\hspace{0.1cm}$ excepto $\hspace{0.1cm}x_{r}$

Es decir:



$$X_{(r)} = (\hspace{0.05cm}x_{1}\hspace{0.05cm},\hspace{0.05cm} x_{2}\hspace{0.05cm},..,\hspace{0.05cm} x_{r-1}\hspace{0.05cm},\hspace{0.05cm}x_{r+1}\hspace{0.05cm} ,..,\hspace{0.05cm} x_{n}\hspace{0.05cm})$$  

para  $\hspace{0.2cm} r=1,...,n$

 

Se define la replica $r$-esima del estimador $\widehat{\theta}$ como:

$$\widehat{\theta}_{(r)} = \widehat{\theta}(X_{(r)})= \widehat{\theta}(\hspace{0.05cm}x_{1}\hspace{0.05cm},\hspace{0.05cm} x_{2}\hspace{0.05cm},..,\hspace{0.05cm} x_{r-1}\hspace{0.05cm},\hspace{0.05cm}x_{r+1}\hspace{0.05cm} ,..,\hspace{0.05cm} x_{n}\hspace{0.05cm})$$


<br>

### Estimación Jacknife del sesgo


El **estimador Jacknife** del **sesgo** del estimador $\widehat{\theta}$ se define como:

$$\widehat{Sesgo}(\widehat{\theta})_{Jack} =  (n-1) \cdot \left(   \dfrac{1}{n} \cdot \sum_{r=1}^{n} \widehat{\theta}_{(r)} - \widehat{\theta} \right)$$



Donde:

$$\widehat{\theta} = \widehat{\theta}(X) = \widehat{\theta}(x_1,...,x_n)$$


<br>

### Estimación Jacknife de la varianza

La **estimación Jacknife** de la **varianza** del estimador $\widehat{\theta}$ se define como:


$$\widehat{ Var}(\widehat{\theta})_{Jack} =  \dfrac{n-1}{n} \cdot \sum_{r=1}^{n} \left( \widehat{\theta}_{(r)} - \dfrac{1}{n} \sum_{r=1}^{n} \widehat{\theta}_{(r)}  \right)^2$$



<br>

El **estimador Jacknife** del **error estandar** del estimador $\widehat{\theta}$ se define como:

$$\widehat{ s.e.}(\widehat{\theta})_{Jack} = \sqrt{ \dfrac{n-1}{n} \cdot \sum_{r=1}^{n} \left( \widehat{\theta}_{(r)} - \dfrac{1}{n} \sum_{r=1}^{n} \widehat{\theta}_{(r)}  \right)^2}$$

<br>

**Observación:**

El Jacknife funciona bien cuando el estimador es suave (smooth). 

Un estimador es suave cuando ante pequeños cambios en la muestra de datos genera pequeños cambios en el estimador.

Ejemplo de estimador suave es el estimador plug-in de la media poblacional, es decir la media muestral.

Ejemplo de estimador no suave es el estimador plug-in de la mediana poblacional, es decir la mediana muestral


 


<br>

### Estimación Jacknife  de un parametro con corrección de sesgo


$$
\widehat{\theta}_{Jack} \hspace{0.2cm}=\hspace{0.2cm} \widehat{\theta} \hspace{0.1cm}-\hspace{0.1cm} \widehat{Sesgo}(\widehat{\theta})_{Jack} \ \hspace{0.2cm}=\hspace{0.2cm} \widehat{\theta} -  (n-1) \cdot \left(    \dfrac{1}{n} \cdot \sum_{r=1}^{n} \widehat{\theta}_{(r)}
 - \widehat{\theta} \right) \hspace{0.2cm}=\hspace{0.2cm}   n\cdot \widehat{\theta} - (n-1)\cdot  \dfrac{1}{n} \cdot \sum_{r=1}^{n} \widehat{\theta}_{(r)} \\
$$

Donde:

$$\widehat{\theta} = \widehat{\theta}(X) = \widehat{\theta}(x_1,...,x_n)$$



<br>



## Estimación del sesgo , varianza y error cuadratico medio de un estimador por Bootstrap


Tenemos una v.a. $\hspace{0.1cm}\mathcal{X}\sim D(\theta)\hspace{0.1cm}$ , una m.a.s. $\hspace{0.1cm}(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ de $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ y un estimador $\hspace{0.1cm}\widehat{\theta}(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ del parametro $\hspace{0.1cm}\theta$


Pero además tenemos una muestra de observaciones $\hspace{0.1cm}X=(x_1,...,x_n)\hspace{0.08cm}$   de la variable de interés $\hspace{0.08cm}\mathcal{X}$ , por lo que tenemos la estimación $\hspace{0.1cm}\widehat{\theta}(X)=\widehat{\theta}(x_1,...,x_n)\hspace{0.1cm}$ del parametro $\hspace{0.1cm}\theta$ 


Una muestra Bootstrap  de $\hspace{0.1cm}X\hspace{0.1cm}$ se define como una **muestra aleatoria con reemplazamiento** de $\hspace{0.1cm}X$


Tenemos $B$ muestras Bootstrap de $\hspace{0.1cm}X\hspace{0.1cm}$ :

$$X_{(1)},X_{(2)},...,X_{(B)}$$


Se define la replica Bootstap $b$-esima del estimador $\hspace{0.1cm}\widehat{\theta}$ como:


$$\widehat{\theta}_{(b)} = \widehat{\theta}(X_{(b)})$$



<br>



### Estimación Bootstrap del sesgo de un estimador




$$\widehat{Sesgo}(\widehat{\theta})_{Boot} =  \dfrac{1}{B} \cdot \sum_{b=1}^{B} \left( \widehat{\theta}_{(b)}  - \widehat{\theta} \right) = \dfrac{1}{B} \cdot \sum_{b=1}^{B}  \widehat{\theta}_{(b)}  - \widehat{\theta}$$


Donde:


$$\widehat{\theta} = \widehat{\theta}(X) = \widehat{\theta}(x_1,...,x_n)$$


<br>


### Estimación Bootstrap de la varianza de un estimador


$$\widehat{Var}(\widehat{\theta})_{Boot} =  \dfrac{1}{B-1} \cdot \sum_{b=1}^{B} \left( \widehat{\theta}_{(b)}  - \dfrac{1}{B} \cdot \sum_{b=1}^{B} \widehat{\theta}_{(b)} \right) \\$$



$$\widehat{s.e.}(\widehat{\theta})_{Boot} =  \sqrt{ \dfrac{1}{B-1} \cdot \sum_{b=1}^{B} \left( \widehat{\theta}_{(b)}  - \dfrac{1}{B} \cdot \sum_{b=1}^{B} \widehat{\theta}_{(b)} \right) }$$


<br>


### Estimación Bootstrap del error cuadratico medio de un estimador

$$\widehat{Sesgo}(\widehat{\theta})_{Boot} =  \dfrac{1}{B} \cdot \sum_{b=1}^{B} \left( \widehat{\theta}_{(b)}  - \widehat{\theta} \right)^2 = \dfrac{1}{B} \cdot \sum_{b=1}^{B}  \left( \widehat{\theta}_{(b)}^2  + \widehat{\theta}^2 + 2\cdot \widehat{\theta}_{(b)} \cdot \widehat{\theta} \right)$$


Donde:


$$\widehat{\theta} = \widehat{\theta}(X) = \widehat{\theta}(x_1,...,x_n)$$


<br>

### Estimador Bootstrap  de un parametro con corrección de sesgo



