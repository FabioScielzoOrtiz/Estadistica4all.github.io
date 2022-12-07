---
title: 'Intervalos de Confianza'
author: 'Fabio Scielzo Ortiz'
date: '26/11/22'
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



>Más articulos en     [Estadistica4all](https://fabioscielzoortiz.github.io/Estadistica4all.github.io/)

***Se recomienda abrir el artículo en un ordenador o en una tablet.***
 
 
 <br>
 
 
# Variables aleatorias i.i.d.

$\mathcal{X}_1,...,\mathcal{X}_n\hspace{0.1cm}$ son variables aleatorias mutuamente independientes e identicamente distribuidas  (i.i.d.) $\hspace{0.3cm}\Leftrightarrow$

$1)\hspace{0.12cm}$ $\hspace{0.1cm} \mathcal{X}_1,...,\mathcal{X}_n\hspace{0.08cm}$ son mutuamente independientes , es decir:

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

Sea $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ una v.a. tal que $\hspace{0.1cm}\mathcal{X} \sim F(\cdot)$ 


$(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ es una muestra aleatoria simple (m.a.s.) de tamaño $\hspace{0.08cm}n\hspace{0.08cm}$ de $\hspace{0.1cm}\mathcal{X}$ $\hspace{0.2cm}\Leftrightarrow\hspace{0.2cm}$ $(X_1,...,X_n) \underset{i.i.d.}{\sim} X(\cdot) \\$

**Observación:**

Una m.a.s. de una v.a. es un vector de v.a.'s


<br>

# Muestra de Observaciones


Sea $\hspace{0.12cm}\mathcal{X}\hspace{0.12cm}$ una v.a. tal que $\hspace{0.12cm}\mathcal{X} \sim F(\cdot)$ 


$X=(x_1,...,x_n)\hspace{0.12cm}$ es una muestra de $\hspace{0.08cm}n\hspace{0.08cm}$ observaciones de la v.a. $\hspace{0.12cm}\mathcal{X}$ $\hspace{0.2cm}\Leftrightarrow\hspace{0.2cm}$ $x_i \in Im(\mathcal{X}) \hspace{0.12cm} ,\hspace{0.12cm} \forall i\in \lbrace 1,...,n \rbrace$ $\hspace{0.2cm}\Leftrightarrow\hspace{0.2cm}$ $x_i$ es una realización de la v.a. $\hspace{0.12cm}\mathcal{X}$  , $\hspace{0.12cm}\forall i\in \lbrace 1,...,n \rbrace \\$

Donde:

$Im(\mathcal{X})$ es la imagen de $\mathcal{X}$ , es decir, su campo de variación.


**Observación:**

$1)\hspace{0.2cm}$ Una muestra de observaciones de una v.a. es un vector de números, no son v.a.'s. $\\[0.4cm]$

$2)\hspace{0.2cm}$ Si $\hspace{0.08cm} X=(x_1,...,x_n)\hspace{0.08cm}$ es una muestra de $\hspace{0.08cm}n\hspace{0.08cm}$ observaciones de $\hspace{0.08cm}\mathcal{X}\sim F(\cdot)$ , entonces $\hspace{0.08cm}x_i\hspace{0.08cm}$ es una observacion que ha sido generada por la distribución de probabilidad $\hspace{0.08cm}F(\cdot)\hspace{0.08cm}$, es decir, $\hspace{0.08cm}x_i\hspace{0.08cm}$ puede verse como un numero aleatorio generado en base a la distribución de probabilidad $\hspace{0.08cm} F(\cdot)$ $\\[0.4cm]$

$3)\hspace{0.2cm}$ Si $\hspace{0.08cm}X=(x_1,...,x_n)\hspace{0.08cm}$ es una muestra de $\hspace{0.08cm}n\hspace{0.08cm}$ observaciones de $\mathcal{X}\sim F(\cdot)$ , entonces:


$P(\mathcal{X}= x_i)$ es la probabilidad de  observar $x_i$ al extraer una muestra de observaciones de $\mathcal{X}$ $\\[0.4cm]$


$4)\hspace{0.2cm}$ Si $\hspace{0.08cm}(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.08cm}$ es una muestra aleatoria simple (m.a.s.) de tamaño $\hspace{0.08cm}n\hspace{0.08cm}$ de $\hspace{0.08cm}\mathcal{X}\sim F(\cdot)\hspace{0.08cm}$ , entonces:

$P(\mathcal{X}_1 = x_1 , ..., \mathcal{X}_n=x_n)\hspace{0.08cm}$ es la probabilidad de obtener como valores $\hspace{0.08cm}(x_1,...,x_n)\hspace{0.08cm}$ al extraer una muestra de observaciones de $\hspace{0.08cm}\mathcal{X}$


<br>


# Estadístico



$T\hspace{0.1cm}$ es un estadístico de una m.a.s $\hspace{0.1cm}(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ de la v.a. $\hspace{0.1cm}\mathcal{X}\sim F(\theta)$ $\hspace{0.25cm}\Leftrightarrow\hspace{0.25cm}$ $T\hspace{0.1cm}$ es una función de la m.a.s que no depende  del parámetro $\hspace{0.1cm}\theta$


Por tanto:

- $T(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ es un estadístico. $\\[0.7cm]$

**Observaciones:**

- $\hspace{0.12cm}T(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ es una v.a. al ser una función de v.a.'s $\\[0.8cm]$

- Dada una muestra de observaciones $\hspace{0.1cm}(x_1 ,..., x_n)\hspace{0.1cm}$ de  la v.a. $\hspace{0.1cm}\mathcal{X} \sim D(\theta)$ 

$\hspace{0.6cm} T(x_1,...,x_n)\hspace{0.1cm}$ es una observación de la v.a. $\hspace{0.1cm}T(\mathcal{X}_1,...,\mathcal{X}_n) \\$


- Dadas $\hspace{0.1cm}B\hspace{0.1cm}$ muestras de observaciones $\hspace{0.1cm}(x_1^1 , ..., x_n^1) ,...,(x_1^B,...,x_n^B)\hspace{0.1cm}$ de la v.a. $\hspace{0.1cm}\mathcal{X} \sim D(\theta)$ 

     - $T(x_1^1 , ..., x_n^1) ,..., T(x_1^B,...,x_n^B)\hspace{0.1cm}$ es una muestra de observaciones de la v.a. $\hspace{0.1cm}T(\mathcal{X}_1,...,\mathcal{X}_n)$


<br>

## Ejemplos de estadisticos


Sea $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ una v.a. tal que $\hspace{0.1cm}\mathcal{X} \sim D(\theta)\hspace{0.1cm}$ , y sea $\hspace{0.1cm}(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ una m.a.s. de $\hspace{0.1cm} \mathcal{X} \\$


- **Media muestral**

$$T(\mathcal{X}_1,...,\mathcal{X}_n) = \overline{\mathcal{X}} = \dfrac{1}{n} \sum_{i=1}^n \mathcal{X}_i \\$$


- **Varianza muestral**

$$T(\mathcal{X}_1,...,\mathcal{X}_n) = S^2 = \dfrac{1}{n} \sum_{i=1}^n (\mathcal{X}_i - \overline{\mathcal{X}})^2 \\$$


- **Cuasi-Varianza muestral**

$$T(\mathcal{X}_1,...,\mathcal{X}_n) = S^2 = \dfrac{1}{n-1} \sum_{i=1}^n (\mathcal{X}_i - \overline{X})^2 \\$$




<br>


# Estimador Puntual

Dada una v.a. $\hspace{0.1cm}\mathcal{X}\sim D(\theta)\hspace{0.1cm}$ y una m.a.s. $\hspace{0.1cm}(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ de $\hspace{0.1cm}X$, 

Un estimador puntual para el parametro $\hspace{0.1cm}\theta\hspace{0.1cm}$ es un estadistico $\hspace{0.1cm}\widehat{\theta}(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ que se propone para estimar $\hspace{0.1cm}\theta$


<br>


# Estimación Puntual

Dada una v.a. $\hspace{0.1cm}\mathcal{X}\sim D(\theta)\hspace{0.1cm}$ , una m.a.s. $\hspace{0.1cm}(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ de $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ y un estadistico $\hspace{0.1cm}\widehat{\theta}(\mathcal{X}_1,...,\mathcal{X}_n)$

Si  $\hspace{0.1cm}X=(x_1,...,x_n)\hspace{0.1cm}$ es una muestra de observaciones  de $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ , entonces:

- $\widehat{\theta}(X) = \widehat{\theta}(x_1,...,x_n)\hspace{0.1cm}$ es una estimación puntual del parametro $\hspace{0.1cm}\theta \\$



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




<br>

<br>




# Métodos de estimacion puntual

## Método de los momentos


<br>


### Momentos de una v.a.

Momento de orden $\hspace{0.1cm} k\hspace{0.1cm}$ de la v.a. $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$  es $\hspace{0.1cm}E[\mathcal{X}^k]$


<br>


### Momentos muestrales

Momento de orden $\hspace{0.1cm}k\hspace{0.1cm}$ de la m.a.s. $\hspace{0.1cm}(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ de la v.a. $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ es $\hspace{0.1cm}\dfrac{1}{n} \cdot \sum_{i=1}^n \mathcal{X}_i^k$


<br>


### El método de los momentos

Dada una v.a. $\hspace{0.1cm}\mathcal{X}\sim F(\theta_1,...,\theta_h)\hspace{0.1cm}$ y una m.a.s. $\hspace{0.1cm}(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ de $\hspace{0.1cm}X$, 

Se quieren estimar los parametros $\hspace{0.1cm}\theta_1,...,\theta_h$ 

El método de los momentos consiste en resolver para $\hspace{0.1cm}\theta_1,...,\theta_h\hspace{0.1cm}$ el siguiente sistema de ecuaciones: $\\[0.7cm]$

$$\left\lbrace\begin{array}{l}   
 E[\mathcal{X}] = \dfrac{1}{n} \cdot \sum_{i=1}^n \mathcal{X}_i    \\[0.1cm] 
 E[\mathcal{X}^2] = \dfrac{1}{n} \cdot \sum_{i=1}^n \mathcal{X}_i^2    \\[0.1cm]
  ...   \\[0.1cm]
E[\mathcal{X}^h] = \dfrac{1}{n} \cdot \sum_{i=1}^n \mathcal{X}_i^h
\end{array}\right.$$

<br>



Si solución del sistema para $\hspace{0.1cm}(\theta_1,...,\theta_h)\hspace{0.1cm}$ es   $\hspace{0.1cm}\left( \hspace{0.05cm} T_1(\mathcal{X}_1,...,\mathcal{X}_n),...,T_h(\mathcal{X}_1,...,\mathcal{X}_n) \hspace{0.05cm} \right)\hspace{0.1cm}$ , entonces: $\\[0.6cm]$

- Los estimadores de los parámetros $\hspace{0.1cm}(\theta_1,...,\theta_h)\hspace{0.1cm}$ por el método de los momentos son:



$$\widehat{\theta}_1 \hspace{0.1cm} =\hspace{0.1cm} T_1(\mathcal{X}_1,...,\mathcal{X}_n)$$

$$\dots$$

$$\widehat{\theta}_h \hspace{0.1cm}=\hspace{0.1cm} T_h(\mathcal{X}_1,...,\mathcal{X}_n)$$

<br>

- Por tanto, dada una muestra de observaciones  $\hspace{0.1cm}X=(x_1,...,x_n)$ de $\mathcal{X}\hspace{0.1cm}$ , las estimaciones de los parametros $\hspace{0.1cm}(\theta_1,...,\theta_h)\hspace{0.1cm}$ por el método de los momentos son:


$$\widehat{\theta}_1 \hspace{0.1cm}=\hspace{0.1cm} T_1(x_1,...,x_n)$$


$$\dots$$

$$\widehat{\theta}_h \hspace{0.1cm} =\hspace{0.1cm} T_h(x_1,...,x_n) \\$$





**Observación:**

Los momentos $\hspace{0.1cm}E[X]\hspace{0.05cm},\hspace{0.05cm} E[X^2]\hspace{0.05cm},...,\hspace{0.05cm} E[X^h]\hspace{0.1cm}$ dependen generalmente de los parametros a estimar $\hspace{0.1cm}\widehat{\theta}_1\hspace{0.05cm},...,\hspace{0.05cm}\widehat{\theta}_h$


<br>



### Ejemplo: v.a. con distribución normal

Tenemos la siguiente v.a. $\hspace{0.15cm} X \sim N(\mu , \sigma^2)$.

El problema consiste en estimar los parametros de la distribución $\hspace{0.1cm}\mu\hspace{0.1cm}$ y $\hspace{0.1cm}\sigma^2\hspace{0.1cm}$ a partir de una muestra de observaciones de la v.a.



Estimaremos los parametros $\hspace{0.1cm}(\mu , \sigma^2)\hspace{0.1cm}$ usando el **métodos de los momentos**.


$$E[X]= \mu$$

$$E[X^2]= \mu^2 + \sigma^2$$


Siguiendo el método de los momentos debemos resolver en $\hspace{0.1cm}\mu\hspace{0.1cm}$ y $\hspace{0.1cm}\sigma^2\hspace{0.1cm}$ el siguiente sistema de ecuaciones:

$$\mu = \dfrac{1}{n} \cdot \sum_{i=1}^n \mathcal{X}_i$$

$$\mu^2 + \sigma^2 = \dfrac{1}{n} \cdot \sum_{i=1}^n \mathcal{X}_i^k \\$$



La solución del sistema en $\hspace{0.1cm}\mu\hspace{0.1cm}$ y $\hspace{0.1cm}\sigma^2\hspace{0.1cm}$ , respectivamente,  es: 

$$\overline{\mathcal{X}_n} = \dfrac{1}{n} \sum_{i=1}^n \mathcal{X}_i$$

$$S_n^2 = \dfrac{1}{n} \sum_{i=1}^n (\mathcal{X}_i - \overline{\mathcal{X}_n})^2 \\$$


Notese que $\hspace{0.1cm}\overline{\mathcal{X}_n}\hspace{0.1cm}$ y $\hspace{0.1cm}S_n^2\hspace{0.1cm}$ son la media  y la varianza muestral de la m.a.s.  $\hspace{0.1cm}\mathcal{X}_1,...,\mathcal{X}_n\hspace{0.1cm}$ , respectivamente. $\\[0.6cm]$


Por tanto, dada una v.a. $\hspace{0.1cm}\mathcal{X} \sim N(\mu , \sigma^2)\hspace{0.1cm}$, los ***estimadores*** por el **método de los momentos** de los parametros $\hspace{0.1cm}\mu\hspace{0.1cm}$ y $\hspace{0.1cm}\sigma^2\hspace{0.1cm}$ son:


$$\widehat{\mu} \hspace{0.1cm}=\hspace{0.1cm} \overline{\mathcal{X}_n} = \dfrac{1}{n} \sum_{i=1}^n \mathcal{X}_i$$

$$\widehat{\sigma}^2 \hspace{0.1cm}=\hspace{0.1cm} S_n^2 = \dfrac{1}{n} \sum_{i=1}^n (\mathcal{X}_i - \overline{\mathcal{X}_n})^2\\$$


Por lo que dada una muestra $\hspace{0.1cm}X=(x_1,...,x_n)\hspace{0.1cm}$ de $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$, las ***estimaciones*** de $\hspace{0.1cm}\mu\hspace{0.1cm}$ y $\hspace{0.1cm}\sigma^2\hspace{0.1cm}$ por el **método de los momentos** son:

$$\widehat{\mu} \hspace{0.1cm}=\hspace{0.1cm} \overline{X} = \dfrac{1}{n} \sum_{i=1}^n x_i$$

$$\widehat{\sigma}^2 \hspace{0.1cm}=\hspace{0.1cm} S^2(X) = \dfrac{1}{n} \sum_{i=1}^n (x_i - \overline{X})^2$$



<br>

### Justificación al método de los momentos






<br>


### Observaciones al método de los momentos





<br>


## Método de Máxima Verosimilitud

### Función de Verosimilitud

Dada una v.a. $\hspace{0.1cm} \mathcal{X} \sim F(\theta)\hspace{0.1cm}$ y una m.a.s. $\hspace{0.1cm}(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ de $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ y una muestra de observaciones $\hspace{0.1cm}X=(x_1,...,x_n)\hspace{0.1cm}$  de $\hspace{0.1cm}\mathcal{X}\\$


La función de verosimilitud de la m.a.s. $\hspace{0.1cm}(\mathcal{X}_1,..., \mathcal{X}_n)\hspace{0.1cm}$ es una función  tal que: $\\[0.7cm]$



$$\mathcal{L}_{\mathcal{X}_1,..., \mathcal{X}_n}(x_1,...,x_n) \hspace{0.1cm}=\hspace{0.1cm} f_{\mathcal{X}_1,...,\mathcal{X}_n}(x_1,...,x_n\hspace{0.1cm}|\hspace{0.1cm} \theta) \hspace{0.25cm} , \hspace{0.25cm} \forall\hspace{0.1cm} (x_1,...,x_n)\in \mathbb{R}^n \\$$


Donde: 

$f_{\mathcal{X}_1,...,\mathcal{X}_n}\hspace{0.1cm}$ es la función de densidad o de probabilidad **conjunta** para las v.a.'s $\hspace{0.1cm}\mathcal{X}_1,...,\mathcal{X}_n \\$



**Observaciones:**


- Como  la m.a.s. $\hspace{0.1cm}(\mathcal{X}_1,..., \mathcal{X}_n)\hspace{0.1cm}$ son v.a.'s independientes , entonces : 

    - $\mathcal{L}_{\mathcal{X}_1,..., \mathcal{X}_n}(x_1,...,x_n) \hspace{0.1cm}=\hspace{0.1cm} f_{\mathcal{X}_1,...,\mathcal{X}_n}(x_1,...,x_n\hspace{0.1cm}|\hspace{0.1cm} \theta) \hspace{0.1cm}=\hspace{0.1cm} \prod_{i=1}^n f_{\mathcal{X}_i}(x_i \hspace{0.1cm}|\hspace{0.1cm} \theta) \\[0.8cm]$




- Como  la m.a.s. $\hspace{0.1cm}(\mathcal{X}_1,..., \mathcal{X}_n)\hspace{0.1cm}$ son v.a.'s identicamente disstribuidas a $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ , es decir, siguen la misma distribución que $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$, se tiene que $\hspace{0.1cm}f_{\mathcal{X}_i}=f_{X}=f_{F(\theta)} , \forall i=1,...,n\hspace{0.1cm}$ , por lo tanto : $\\[0.6cm]$

    - $\mathcal{L}_{\mathcal{X}_1,..., \mathcal{X}_n}(x_1,...,x_n \hspace{0.1cm}|\hspace{0.1cm} \theta) \hspace{0.1cm}=\hspace{0.1cm} f_{\mathcal{X}_1,...,\mathcal{X}_n}(x_1,...,x_n | \theta) \hspace{0.1cm}=\hspace{0.1cm}  \prod_{i=1}^n f_{\mathcal{X}}(x_i \hspace{0.1cm}|\hspace{0.1cm} \theta)\\$
    
    
    
    
    -  Puesto que al ser $\hspace{0.1cm}(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ identicamente distribuidas a $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ , se cumple que  $\hspace{0.1cm}f_{\mathcal{X}_i} \hspace{0.1cm}=\hspace{0.1cm} f_{\mathcal{X}}\hspace{0.1cm}=\hspace{0.1cm}f_{F(\theta)} \hspace{0.2cm},\hspace{0.2cm} \forall i \in \lbrace 1,...,n \rbrace$


<br>

### Método de Máxima Verosimilitud


Dada una v.a. $\hspace{0.1cm}\mathcal{X}\sim F(\theta)\hspace{0.1cm}$ y una m.a.s. $\hspace{0.1cm}(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ de $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ y una muestra de observaciones $\hspace{0.1cm}X=(x_1,...,x_n)\hspace{0.1cm}$    de $\hspace{0.1cm}\mathcal{X} \\$


La estimación del parámetro $\hspace{0.1cm} \theta\hspace{0.1cm}$ por el método de máxima verosimilitud se denomina estimación máximo-verosímil, y se define como sigue:

$$\widehat{\theta}_{MV} \hspace{0.15cm}=\hspace{0.15cm} arg \hspace{0.15cm} \underset{\theta}{Max} \hspace{0.15cm} \mathcal{L}_{\mathcal{X}_1,..., \mathcal{X}_n}(x_1,...,x_n \hspace{0.1cm} | \hspace{0.1cm} \theta) 
\hspace{0.15cm}=\hspace{0.15cm} arg \hspace{0.15cm} \underset{\theta}{Max} \hspace{0.15cm}
f_{\mathcal{X}_1,...,\mathcal{X}_n}(x_1,...,x_n \hspace{0.1cm}|\hspace{0.1cm} \theta)
\hspace{0.15cm}=\hspace{0.15cm} arg \hspace{0.15cm} \underset{\theta}{Max} \hspace{0.15cm} \prod_{i=1}^n f_{\mathcal{X}}(x_i \hspace{0.1cm}|\hspace{0.1cm} \theta) \\$$



**Observacion:**

La idea del método de estimación por máxima verosimilitud es, dada una muestra de observaciones (unos datos) de una variable de interes que tiene cierta función de densidad o de probabilidad dependiente de un parametro desconocido, estimar el parametro desconocido con aquel valor del parametro que maximiza la funcion de probabilidad o densidad conjunta de la muestra, es decir, que maximiza la probabilidad de obtener la muestra de observaciones que se ha extraido, es decir, que hace más verosimil los datos disponibles.

Siempre bajo el supuesto de que conocemos la distribucion de probabilidad de la variable de interes, y por tanto se puede calcular la probabilidad de extraer aleatoriamente cierta muestra de observaciones de esa variable.



<br>


### Ejemplo: v.a. con distribución normal

Tenemos la siguiente v.a. $\hspace{0.15cm} \mathcal{X} \sim N(\mu , \sigma^2)$.

El problema consiste en estimar los parametros de la distribución $\hspace{0.1cm}\mu\hspace{0.1cm}$ y $\hspace{0.1cm}\sigma^2\hspace{0.1cm}$ a partir de una muestra de observaciones de la v.a.



Estimaremos los parametros $\hspace{0.1cm}(\mu , \sigma^2)\hspace{0.1cm}$ usando el **método de máxima verosimilitud**.


La función de verosimilitud de una m.a.s $\hspace{0.1cm}(\mathcal{X}_1,...,\mathcal{X}_n)$ de $\mathcal{X}\sim N(\mu , \sigma^2)$ es:


$$
\mathcal{L}_{\mathcal{X}_1,..., \mathcal{X}_n}(x_1,...,x_n \hspace{0.1cm}|\hspace{0.1cm} \mu , \sigma^2) \hspace{0.1cm}=\hspace{0.1cm} f_{\mathcal{X}_1,...,\mathcal{X}_n}(x_1,...,x_n | \mu , \sigma^2) \hspace{0.1cm}=\hspace{0.1cm}  \prod_{i=1}^n f_{\mathcal{X}}(x_i \hspace{0.1cm}|\hspace{0.1cm} \mu , \sigma^2) 
 \hspace{0.1cm}=\hspace{0.1cm} \\
 =\hspace{0.1cm}  \prod_{i=1}^n  \dfrac{1}{\sqrt{2\cdot \pi \cdot \sigma^2}} \cdot exp \left\lbrace  -\dfrac{1}{2} \cdot \dfrac{(x_i - \mu)^2}{\sigma^2} \right\rbrace
\hspace{0.1cm}=\hspace{0.1cm} \left( \dfrac{1}{\sqrt{2\cdot \pi \cdot \sigma^2}}\right)^2 \cdot exp \left\lbrace -\dfrac{1}{2} \cdot \sum_{i=1}^n \dfrac{(x_i - \mu)^2}{\sigma^2} \right\rbrace \\[1cm]
$$


Para todo $(x_1,...,x_n)\in \mathbb{R}^n$


Por tanto, dada una muestra de observaciones $\hspace{0.1cm}X=(x_1,...,x_n)\hspace{0.1cm}$ de $\hspace{0.1cm}\mathcal{X}\sim N(\mu, \sigma^2)\hspace{0.1cm}$,las ***estimaciones*** **máximo-verosímiles** de los parametros $\hspace{0.1cm}\mu\hspace{0.1cm}$ y $\hspace{0.1cm}\sigma^2\hspace{0.1cm}$ son:

$$\left(\widehat{\mu} \hspace{0.1cm},\hspace{0.1cm} \widehat{\sigma}^2 \right) \hspace{0.15cm}=\hspace{0.15cm} arg \hspace{0.15cm} \underset{\left(\mu , \sigma^2 \right)}{Max} \hspace{0.15cm}  \left( \dfrac{1}{\sqrt{2\cdot \pi \cdot \sigma^2}}\right)^2 \cdot exp \left\lbrace -\dfrac{1}{2} \cdot \sum_{i=1}^n \dfrac{(x_i - \mu)^2}{\sigma^2} \right\rbrace$$

 
Resolviendo el problema de optimización se obtienen las siguientes expresiones:

$$\widehat{\mu} = \overline{X} = \dfrac{1}{n} \sum_{i=1}^n x_i$$

$$\widehat{\sigma}^2 = S^2(X) = \dfrac{1}{n} \sum_{i=1}^n (x_i - \overline{X})^2 \\$$


Por lo que,  dada una v.a. $\hspace{0.1cm}\mathcal{X} \sim N(\mu , \sigma^2)\hspace{0.1cm}$,  los ***estimadores*** **maximo-verosimiles** de los parametros $\hspace{0.1cm}\mu\hspace{0.1cm}$ y $\hspace{0.1cm}\sigma^2\hspace{0.1cm}$ son:

$$\widehat{\mu} = \overline{\mathcal{X}_n} = \dfrac{1}{n} \sum_{i=1}^n \mathcal{X}_i$$

$$\widehat{\sigma}^2 = S^2_n = \dfrac{1}{n} \sum_{i=1}^n (x_i - \overline{\mathcal{X}_n})^2 \\$$







 
<br>
 
### Principio de invarianza

Dada una funcion $\hspace{0.1cm} T\hspace{0.1cm}$ del parametro $\hspace{0.1cm}\theta$ $\hspace{0.1cm}\Rightarrow \hspace{0.1cm}T(\theta)$

Si $\hspace{0.1cm}\widehat{\theta}_{MV}\hspace{0.1cm}$ es el estimador máximo-verosímil del parametro $\hspace{0.1cm}\theta\hspace{0.1cm}$ , entonces:

- $\hspace{0.1cm} T(\widehat{\theta}_{MV})\hspace{0.1cm}$ es el estimador máximo-verosimil de $\hspace{0.1cm}T(\theta)$
 
 
 <br>
 

# Estimación por intervalos de confianza <a class="anchor" id="1"></a>

 
Dada una v.a. $\hspace{0.1cm} \mathcal{X} \sim F(\theta)\hspace{0.1cm}$ y una m.a.s. $\hspace{0.1cm}(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ de $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$  y dada una constante $\hspace{0.1cm}\alpha \in (0,1) \\$
 
 Un intervalo de confianza $\hspace{0.1cm}1-\alpha\hspace{0.1cm}$ para el parámetro $\hspace{0.1cm}\theta\hspace{0.1cm}$ es un intervalo $\hspace{0.1cm}[ L_1(\mathcal{X}_1,...,\mathcal{X}_n) \hspace{0.1cm},\hspace{0.1cm} L_2(\mathcal{X}_1,...,\mathcal{X}_n) ]$ tal que: $\\[0.7cm]$
 
 $$P(L_1 \leq \theta  \leq L_2) = 1- \alpha$$

 

**Observaciones:**
 
- $L_1\hspace{0.1cm}$ y $\hspace{0.1cm}L_2\hspace{0.1cm}$ son estadisticos de  la m.a.s. $\hspace{0.1cm}(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ de $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ , y por tanto son variables aleatorias. $\\[0.6cm]$
 
 
 
- Para cada muestra de observaciones $\hspace{0.1cm}X=(x_1,...,x_n)\hspace{0.1cm}$ de $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ se tiene un intervalo de confianza concreto $\hspace{0.1cm}(L_1(x_1,...,x_n) , L_2(x_1,...,x_n))$ $\\[0.6cm]$
 
 
 
- No es correcto decir que la probabilidad de que el parametro pertenezca al intervalo de confianza es $1-\alpha$ , ya que el parametro no es una v.a. , y solo puede hablarse de probabilidad con v.a's (adoptando la perspectiva frecuentista).  $\\[0.6cm]$

- Si es correcto decir que la probabilidad de que el intervalo de confianza contenga al parametro es $1-\alpha$ , puesto que el intervalo de confianza si es una v.a. al ser sus extremos v.a's.
 
<br> 
 
## Interpretación frecuentista de los intervalos de confianza

 
Dada una v.a. $\hspace{0.1cm} \mathcal{X} \sim F(\theta)\hspace{0.1cm}$ y una m.a.s. $\hspace{0.1cm}(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ de $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$

Dado un intervalo de confianza $\hspace{0.1cm}[ L_1(\mathcal{X}_1,...,\mathcal{X}_n) \hspace{0.1cm},\hspace{0.1cm} L_2(\mathcal{X}_1,...,\mathcal{X}_n) ]\hspace{0.1cm}$ para el parámetro $\hspace{0.1cm}\theta\\$


 
- Si se toma un número **grande** $\hspace{0.1cm}B \hspace{0.1cm}$ de muestras de observaciones $\hspace{0.1cm}X^1=(x^1_1,...,x^1_n)\hspace{0.1cm},...,\hspace{0.1cm}X^B=(x^B_1,...,x^B_n)\hspace{0.1cm}$ de $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm} \\$

    - Se obtienen $\hspace{0.1cm}B\hspace{0.1cm}$ realizaciones del intervalo de confianza (intervalos concretos) $\hspace{0.1cm}[L_1(x_1^1,...,x_n^1),L_2(x_1^1,...,x_n^1)]\hspace{0.1cm},...,\hspace{0.1cm} [L_1(x_1^B,...,x_n^B),L_2(x_1^B,...,x_n^B)]\hspace{0.1cm}\\$ 

    - La proporción de los intervalos que  que contienen a $\hspace{0.1cm}\theta\hspace{0.1cm}$ es aproximadamente $\hspace{0.1cm} 1-\alpha$ 


<br>


## Método pivotal

El método pivotal es un método para la construcción de intervalos de confianza.

Es un método general para encontrar $\hspace{0.1cm}L_1(\mathcal{X}_1,...,\mathcal{X}_n)$ y $L_2(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ tales que: 

$$\hspace{0.1cm}P(L_1(\mathcal{X}_1,...,\mathcal{X}_n) < \theta  < L_2(\mathcal{X}_1,...,\mathcal{X}_n))=1-\alpha$$


El método consiste en encontrar una función $\hspace{0.1cm}\Upsilon\hspace{0.1cm}$ de la m.a.s. $\hspace{0.1cm}(\mathcal{X}_1,...,\mathcal{X}_n))\hspace{0.1cm}$ y del parámetro $\theta$ con distribucion de probabilidad conocida y no dependiente de $\hspace{0.1cm}\theta\hspace{0.1cm}$ , llamada cantidad pivotal:

$\Upsilon(\mathcal{X}_1,...,\mathcal{X}_n), \theta)\hspace{0.1cm}$ tiene que ser una v.a. con distribución conocida y que no depende de $\hspace{0.1cm}\theta\hspace{0.1cm}$ de tal manera que pueden determinarse un par de números $\hspace{0.1cm}a, b\in \mathbb{R}\hspace{0.1cm}$ tales que

$$P(a \leq \Upsilon(\mathcal{X}_1,...,\mathcal{X}_n, \theta) \leq b) =1-\alpha$$

Se tiene que transformar la última expresion para aislar el parametro $\hspace{0.1cm}\theta\hspace{0.1cm}$ de forma que se llegue a la siguiente expresión:

$$P(g_1( a, \mathcal{X}_1,...,\mathcal{X}_n) )  \leq  \theta \leq g_2(b, \mathcal{X}_1,...,\mathcal{X}_n) ) = 1-\alpha$$


Donde: $\hspace{0.1cm}g_1\hspace{0.1cm}$ y $\hspace{0.1cm}g_2\hspace{0.1cm}$ son funciones dependientes de $\hspace{0.1cm}a,\mathcal{X}_1,...,\mathcal{X}_n\hspace{0.1cm}$ y $\hspace{0.1cm}b, \mathcal{X}_1,...,\mathcal{X}_n\hspace{0.1cm}$ , respectivamente.

<br>
 
 
## Intervalo de confianza para la proporción 
 
Una variable categorica binaria  $\mathcal{X}$ puede modelarse como una variable aleatoria Bernoulli(p), donde $p=P(\mathcal{X} = 1)$ y $1-p = P(\mathcal{X}=0)$


Queremos obtener un intervalo de confianza para $p$, que puede interpretarse como la proporción de individuos de la poblacion para los que $\mathcal{X}=1$ 


Para ello vamos a apoyarnos en el teorema de distribucion de la media muestral y en el teorema central del limite (TCL) y en el método pivotal.

<br>

### Teorema de distribución de la media muestral




### Teorema central del límite

El TCL dice lo siguiente:

Si tenemos una v.a. $\mathcal{X}$ y una m.a.s $\mathcal{X}_1,...,\mathcal{X}_n de \mathcal{X}$ , entonces:

$$\dfrac{\overline{\mathcal{X}_n} - E[\overline{\mathcal{X}_n}]}{\sqrt{Var(\overline{\mathcal{X}_n})}} = \dfrac{\overline{\mathcal{X}_n} - E[\mathcal{X}]}{\sqrt{Var(\mathcal{X})/n}} \underset{d}{\rightarrow} N(0,1)$$

Usando la definicion de convergencia en distribución tenemos lo siguiente:


Si $W_n = \dfrac{\overline{\mathcal{X}_n} - E[\mathcal{X}]}{\sqrt{Var(\mathcal{X})/n}}$

$$\underset{n \rightarrow \infty}{lim} F_{W_n}  = F_{N(0,1)}(x) , \forall x\in \mathbb{R}$$


 
## Intervalo de confianza para la media



## Intervalo de confianza para la varianza
 
 
 
 