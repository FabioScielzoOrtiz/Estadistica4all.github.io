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


<div class="warning" style='background-color:#FCF2EC; color: #000000; border-left: solid #FE9554 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>


$\hspace{0.3cm}$ **Más artículos:    $\hspace{0.1cm}$ [Estadistica4all](https://fabioscielzoortiz.github.io/Estadistica4all.github.io/)**

$\hspace{0.3cm}$ **Autor:** $\hspace{0.1cm}$ [Fabio Scielzo Ortiz](http://estadistica4all.com/autores/autores.html)

</p>
 
</p></span>
</div>


***Se recomienda abrir el artículo en un ordenador o en una tablet.***
 
 
 <br>
 
 
# Variables aleatorias i.i.d.


<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>

$\hspace{0.25cm}\mathcal{X}_1,...,\mathcal{X}_n\hspace{0.1cm}$ son variables aleatorias mutuamente independientes e identicamente distribuidas  *(i.i.d.)* $\hspace{0.3cm}\Leftrightarrow$

- $\hspace{0.1cm}$ $\mathcal{X}_1,...,\mathcal{X}_n\hspace{0.08cm}$ son mutuamente independientes , es decir:

$$\hspace{0.08cm} P(\mathcal{X}_1=x_1,...,\mathcal{X}_n=x_n) \hspace{0.1cm}=\hspace{0.1cm} \prod_{i=1}^n P(\mathcal{X}_i=x_i) \\$$

$\hspace{0.7cm}$ Lo que implica que también son independientes dos a dos , es decir, $\hspace{0.12cm} \mathcal{X}_i \perp \mathcal{X}_j \hspace{0.12cm} , \hspace{0.12cm} \forall i\neq j \\$

- $\hspace{0.1cm}$ $\mathcal{X}_1,...,\mathcal{X}_n\hspace{0.12cm}$ tienen la misma distribución de probabilidad, es decir, $\hspace{0.12cm}\mathcal{X}_i \sim F( \cdot ) \hspace{0.15cm}, \hspace{0.1cm} \forall i=1,...,n$ 



</p>
 
</p></span>
</div>

$\hspace{0.4cm}$ Donde $\hspace{0.08cm}F( \cdot )\hspace{0.08cm}$ es una distribucion de probabilidad con parametros no especificados.




<br>


Usaremos la siguiente notación: $\\[0.6cm]$


$$(\mathcal{X}_1,...,\mathcal{X}_n) \underset{i.i.d.}{\sim} F(\cdot) \hspace{0.3cm} \Leftrightarrow
\left\lbrace\begin{array}{l}   \hspace{0.12cm}\mathcal{X}_1,...,\mathcal{X}_n \hspace{0.2cm} \text{son mutuamente independientes} \\[0.1cm] 
\hspace{0.12cm}\mathcal{X}_i \sim F(\cdot) \hspace{0.12cm} , \hspace{0.12cm} \forall i=1,...,n    \end{array}\right. \\[1cm]$$



<br>

# Muestra Aleatoria Simple

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>

$\hspace{0.25cm}$ Sea $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ una v.a. tal que $\hspace{0.1cm}\mathcal{X} \sim F(\cdot)$ 


$\hspace{0.25cm}$ $\mathcal{X}_1,...,\mathcal{X}_n \hspace{0.1cm}$ es una muestra aleatoria simple (m.a.s.) de tamaño $\hspace{0.08cm}n\hspace{0.08cm}$ de $\hspace{0.1cm}\mathcal{X}$ $\hspace{0.2cm}\Leftrightarrow\hspace{0.2cm}$ $(\mathcal{X}_1,...,\mathcal{X}_n) \underset{i.i.d.}{\sim} F(\cdot) \\$

</p>
 
</p></span>
</div>

**Observación:**

Una m.a.s. de una v.a. $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ es un vector de v.a.'s independientes y que se distribuyen probabilisticamente igual que la v.a. $\hspace{0.1cm}\mathcal{X}$


<br>

# Muestra de Observaciones


Sea $\hspace{0.12cm}\mathcal{X}\hspace{0.12cm}$ una v.a. tal que $\hspace{0.12cm}\mathcal{X} \sim F(\cdot)$ 


$X=(x_1,...,x_n)\hspace{0.12cm}$ es una muestra de $\hspace{0.08cm}n\hspace{0.08cm}$ observaciones de la v.a. $\hspace{0.12cm}\mathcal{X}$ $\hspace{0.2cm}\Leftrightarrow\hspace{0.2cm}$ $x_i \in Im(\mathcal{X}) \hspace{0.12cm} ,\hspace{0.12cm} \forall i\in \lbrace 1,...,n \rbrace$ $\hspace{0.2cm}\Leftrightarrow\hspace{0.2cm}$ $x_i$ es una realización de la v.a. $\hspace{0.12cm}\mathcal{X}$  , $\hspace{0.12cm}\forall i\in \lbrace 1,...,n \rbrace \\$

Donde:

$Im(\mathcal{X})$ es la imagen de $\mathcal{X}$ , es decir, su campo de variación.


**Observaciones:**

- Una muestra de observaciones de una v.a. es un vector de números, no son v.a.'s. $\\[0.6cm]$

- Si $\hspace{0.08cm} X=(x_1,...,x_n)\hspace{0.08cm}$ es una muestra de $\hspace{0.08cm}n\hspace{0.08cm}$ observaciones de $\hspace{0.08cm}\mathcal{X}\sim F(\cdot)$ , entonces $\hspace{0.08cm}x_i\hspace{0.08cm}$ es una observacion que ha sido generada por la distribución de probabilidad $\hspace{0.08cm}F(\cdot)\hspace{0.08cm}$, es decir, $\hspace{0.08cm}x_i\hspace{0.08cm}$ puede verse como un numero aleatorio generado en base a la distribución de probabilidad $\hspace{0.08cm} F(\cdot)$ $\\[0.6cm]$

- Si $\hspace{0.08cm}X=(x_1,...,x_n)\hspace{0.08cm}$ es una muestra de $\hspace{0.08cm}n\hspace{0.08cm}$ observaciones de $\mathcal{X}\sim F(\cdot)$ , entonces:


    - $P(\mathcal{X}= x_i)$ es la probabilidad de  observar $x_i$ al extraer una muestra de observaciones de $\mathcal{X}$ $\\[0.6cm]$


- Si $\hspace{0.08cm}(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.08cm}$ es una muestra aleatoria simple (m.a.s.) de tamaño $\hspace{0.08cm}n\hspace{0.08cm}$ de $\hspace{0.08cm}\mathcal{X}\sim F(\cdot)\hspace{0.08cm}$ , entonces:

    -  $P(\mathcal{X}_1 = x_1 , ..., \mathcal{X}_n=x_n)\hspace{0.08cm}$ es la probabilidad de obtener como valores $\hspace{0.08cm}(x_1,...,x_n)\hspace{0.08cm}$ al extraer una muestra de observaciones de $\hspace{0.08cm}\mathcal{X}$


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
 
Una variable categorica binaria  $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ puede modelarse como una variable aleatoria Bernoulli(p), donde $\hspace{0.1cm}p=P(\mathcal{X} = 1)\hspace{0.1cm}$ y $\hspace{0.1cm}1-p = P(\mathcal{X}=0)$


Queremos obtener un intervalo de confianza para $\hspace{0.1cm}p\hspace{0.1cm}$, que puede interpretarse como la proporción de individuos de la poblacion para los que $\hspace{0.1cm}\mathcal{X}=1$ 


Para ello vamos a apoyarnos en el teorema de esperanza-varianza de la media muestral y en el teorema central del limite (TCL) y en el método pivotal.

<br>

### Distribución Bernoulli

Dada una v.a. $\mathcal{X}$, la distribución bbernoulli se define del siguiente modo: $\\[0.6cm]$

$$\mathcal{X} \sim Bernoulli(p) \hspace{0.2cm} \Leftrightarrow  \hspace{0.2cm} P(X=x) =p^x (1-p)^x \cdot I(x \in \lbrace 0,1 \rbrace ) \\$$


**Observaciones:**

- Las v.a. $\hspace{0.1cm} Bernoulli(p)\hspace{0.1cm}$ se usan para modelar experimentos aleatorios con dos únicos resultados dicotomicos (exito-fracaso)
 tales que la probabilidad del exito es $\hspace{0.1cm}p\hspace{0.1cm}$ y la del fracoso $\hspace{0.1cm}1-p$.
 
 A este tipo de experimentos aleatorios se les llama experimentos tipo Bernoulli.
 
- Si $\hspace{0.1cm}\mathcal{X} \sim Bernoulli(p)\hspace{0.1cm}$ , entonces:

    - $\mathcal{X}\hspace{0.1cm}$ puede interpretarse como el nº de exitos obtenidos tras realizar una vez un experimento tipo Bernoulli (notese que este nº solo puede ser 0 o 1),  con probabilidad de exito $\hspace{0.1cm}p \\$




**Propiedades**

- $P(\mathcal{X}=1)=p \\$

- $P(\mathcal{X}=0)=1-p \\$

- $E[\mathcal{X}]=p \\$

- $Var(\mathcal{X})= p\cdot (1-p)  \\$

- $F_\mathcal{X}(x) = \left\lbrace\begin{array}{l} 1 \hspace{0.25cm}  , \hspace{0.25cm}  \text{si} \hspace{0.25cm} x\geq 1 \\ 0 \hspace{0.25cm}  , \hspace{0.25cm}  \text{si} \hspace{0.25cm} x < 0 \\ 1-p \hspace{0.25cm}  , \hspace{0.25cm}  \text{si} \hspace{0.25cm} x\in [0 , 1) \end{array}\right.$


<br>


### Distribución Binomial

Dada una v.a. $\hspace{0.1cm} \mathcal{X}\hspace{0.1cm}$, la distribución binomial se define del siguiente modo:


$$\mathcal{X} \sim Binomial(n,p) \hspace{0.2cm} \Leftrightarrow  \hspace{0.2cm}  P(X=x) =\binom{n}{x} \cdot p^x (1-p)^x \cdot I(x\in\lbrace 0,1,...,n \rbrace ) \\$$


**Observaciones:**


- Si $\mathcal{X} \sim Binomial(p)$ , entonces:

    - $\mathcal{X}$ puede interpretarse como el nº de exitos obtenidos tras realizar $n$ veces un experimento tipo Bernoulli  con probabilidad de exito $p$, notese que este número solo puede ser $0,1,...,n \\$


<br>

**Propiedades** 

- Si $\hspace{0.1cm} \mathcal{X}_1,...,\mathcal{X}_n\hspace{0.1cm}$ son v.a. independientes tales que $\hspace{0.1cm}\mathcal{X}_i \sim Bernoulli(p)$ , $i =1,...,n\hspace{0.1cm}$ , entonces:

$$\mathcal{X}_1 + ... + \mathcal{X}_n \sim Binomial (n, p) \\$$


- $Binomial(n=1, p) = Bernoulli(p) \\$


- $E[\mathcal{X}]=n\cdot p \\$


- $Var(\mathcal{X}) = n \cdot p \cdot (1-p) \\$


- Para $\hspace{0.1cm}x\geq n$ 

$$F_\mathcal{X}(x) = \sum_{z\in \lbrace 0,1,...,x\rbrace} \binom{n}{z} \cdot p^z \cdot (1-p)^{n-z}$$







<br>


### Teorema de esperanza-varianza de la media muestral

Si tenemos una v.a. $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ y una m.a.s $\hspace{0.1cm}\mathcal{X}_1,...,\mathcal{X}_n\hspace{0.1cm}$ de $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ , entonces: $\\[0.5cm]$

$$E\left[\overline{\mathcal{X}_n}\right] \hspace{0.1cm}=\hspace{0.1cm} E[\mathcal{X}]\\$$

$$Var\left(\overline{\mathcal{X}_n}\right) \hspace{0.1cm}=\hspace{0.1cm} Var(\mathcal{X})/n \\$$

Donde:

$\hspace{0.35cm}\overline{\mathcal{X}_n} = \dfrac{1}{n} \cdot \sum_{i=1}^n \mathcal{X}_i$

<br>



### Teorema central del límite

El TCL dice lo siguiente:

Si tenemos una v.a. $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ y una m.a.s $\hspace{0.1cm}\mathcal{X}_1,...,\mathcal{X}_n\hspace{0.1cm}$ de $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ , entonces: $\\[0.5cm]$

$$\dfrac{\overline{\mathcal{X}_n} - E\left[\overline{\mathcal{X}_n}\right]}{\sqrt{Var\left(\overline{\mathcal{X}_n}\right)}} = \dfrac{\overline{\mathcal{X}_n} - E\left[\mathcal{X}\right]}{\sqrt{Var(\mathcal{X})/n}} \hspace{0.1cm}\underset{d}{\rightarrow}\hspace{0.1cm} N(0,1)\\$$

Usando la definicion de convergencia en distribución tenemos lo siguiente: $\\[0.5cm]$



$$\underset{n \rightarrow \infty}{lim} \hspace{0.1cm} F_{W_n}(x) \hspace{0.1cm} =\hspace{0.1cm} F_{N(0,1)}(x) \hspace{0.25cm} , \hspace{0.25cm} \forall x\in \mathbb{R}$$

Donde:

 $$W_n = \dfrac{\overline{\mathcal{X}_n} - E[\mathcal{X}]}{\sqrt{Var(\mathcal{X})/n}}$$
 
<br> 
 
### Teorema de Moivre-Laplace

Este teorema es un caso particular del TCL para v.a`s Binomiales.


Si tenemos una v.a. $\hspace{0.1cm}\mathcal{X}\sim Binomial(k,p)\hspace{0.1cm}$ y una m.a.s $\hspace{0.1cm}\mathcal{X}_1,...,\mathcal{X}_n\hspace{0.1cm}$ de $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ , entonces: $\\[0.5cm]$

 
 
 
$$\dfrac{\overline{\mathcal{X}_n} - E\left[\overline{\mathcal{X}_n}\right]}{\sqrt{Var\left(\overline{\mathcal{X}_n}\right)}} \hspace{0.1cm}=\hspace{0.1cm} \dfrac{\overline{\mathcal{X}_n} - E\left[\mathcal{X}\right]}{\sqrt{Var(\mathcal{X})/n}} \hspace{0.1cm}= \hspace{0.1cm}
\dfrac{\overline{\mathcal{X}_n} - k\cdot p}{\sqrt{k\cdot p\cdot(1-p)/n}}\hspace{0.15cm}\underset{d}{\rightarrow}\hspace{0.15cm} N(0,1)\\$$
 
 
 
Donde:


$\hspace{0.25cm} E[Binomial(k,p)] \hspace{0.1cm}=\hspace{0.1cm} k\cdot p$

$\hspace{0.25cm} Var(Binomial(k,p)) \hspace{0.1cm}=\hspace{0.1cm} k\cdot p \cdot (1-p)$
 
 
<br>
 
Para el caso concreto de una $\hspace{0.1cm}Bernouilli(p)=Binomial(k=1,p)\hspace{0.1cm}$ se tiene lo siguiente:
 
 
 
$$\dfrac{\overline{\mathcal{X}_n} - E\left[\overline{\mathcal{X}_n}\right]}{\sqrt{Var\left(\overline{\mathcal{X}_n}\right)}} \hspace{0.1cm}=\hspace{0.1cm} \dfrac{\overline{\mathcal{X}_n} - E\left[\mathcal{X}\right]}{\sqrt{Var(\mathcal{X})/n}} \hspace{0.1cm}= \hspace{0.1cm}
\dfrac{\overline{\mathcal{X}_n} - p}{\sqrt{ p\cdot(1-p)/n}} \hspace{0.15cm}\underset{d}{\rightarrow}\hspace{0.15cm} N(0,1)\\$$ 
 
 




<br>

### Intervalo de confianza para la proporción

La anterior cantidad:

$$\Upsilon(\mathcal{X}_1,...,\mathcal{X}_n, p) \hspace{0.1cm}=\hspace{0.1cm} \dfrac{\overline{\mathcal{X}_n} - p}{\sqrt{ p\cdot(1-p)/n}}$$


es una cantidad pivotal , puesto que contienen al parámetro de interés, en este caso $\hspace{0.1cm}\theta = p\hspace{0.1cm}$ , y su distribución de probabilidad es conocida y no depende de dicho parámetro , es una $\hspace{0.1cm}N(0,1)\hspace{0.1cm}$, aproximadamente.
 
 
 
Siguiendo el método pivotal hay que encontrar los valores $\hspace{0.1cm}a,b \in \mathbb{R}\hspace{0.1cm}$ tales que: $\\[0.6cm]$

$$P\left( \hspace{0.1cm}a \hspace{0.1cm}< \hspace{0.1cm} \dfrac{\overline{\mathcal{X}_n} - p}{\sqrt{ p\cdot(1-p)/n}}  \hspace{0.1cm}<\hspace{0.1cm} b \hspace{0.1cm}\right) = 1-\alpha \\$$


 
Siguiendo los anteriores resultados:


$$P\left( \hspace{0.1cm} a \hspace{0.1cm}<\hspace{0.1cm} \dfrac{\overline{\mathcal{X}_n} - p}{\sqrt{ p\cdot(1-p)/n}} \hspace{0.1cm} <\hspace{0.1cm} b\hspace{0.1cm} \right) \hspace{0.1cm}\approx\hspace{0.1cm} P\left( a < N(0,1)  < b \right) \\$$



Teniendo en cuenta las propiedades de la distribución normal: $\\[0.6cm]$

$$P\left( z_{1-\alpha/2} < N(0,1)  < z_{\alpha/2} \right) = P\left( -z_{\alpha/2} < N(0,1)  < z_{\alpha/2} \right) = 1-\alpha \\$$
 
 
Donde:


$z_{\alpha/2}\hspace{0.1cm}$ es el valor tal que $\hspace{0.1cm}P(N(0,1)>z_{\alpha/2}) = \alpha/2 \\$ 



Por tanto:


$$P\left( \hspace{0.1cm} -z_{\alpha/2} \hspace{0.1cm}<\hspace{0.1cm} \dfrac{\overline{\mathcal{X}_n} - p}{\sqrt{ p\cdot(1-p)/n}} \hspace{0.1cm} <\hspace{0.1cm} z_{\alpha/2}\hspace{0.1cm} \right) \hspace{0.1cm}\approx\hspace{0.1cm} 1-\alpha \\[0.7cm]$$





Siguiendo el método pivotal ahora tenemos que aislar el parametro $\theta=p$. Operando un poco se llega a lo siguiente: $\\[0.6cm]$


$$P\left( \hspace{0.1cm} \overline{\mathcal{X}_n} -z_{\alpha/2} \cdot \sqrt{p(1-p)/n}\hspace{0.1cm}<\hspace{0.1cm}  p \hspace{0.1cm} <\hspace{0.1cm} \overline{\mathcal{X}_n} + z_{\alpha/2}\cdot \sqrt{p(1-p)/n}\hspace{0.1cm} \right) \hspace{0.1cm}\approx\hspace{0.1cm} 1-\alpha \\[0.7cm]$$



Pero la anterior expresión tienen un problema, dependen ambos lados de la desigualdad de $p$ , que es el parámetro desconocido. Una solución a esto es la siguiente.

Como $\overline{\mathcal{X}_n}$ es un estimador de $p$ que es insesgado, consistente y de minima varianza, es un muy buen estimador de $p$ , por tanto podemos estimar $p$ con $\overline{\mathcal{X}_n}$ en la anterior expresion. Asi llegamos a la siguiente expresión: $\\[0.7cm]$



$$P\left( \hspace{0.1cm} \overline{\mathcal{X}_n} -z_{\alpha/2} \cdot \sqrt{\overline{\mathcal{X}_n}(1-\overline{\mathcal{X}_n})/n}\hspace{0.1cm}<\hspace{0.1cm}  p \hspace{0.1cm} <\hspace{0.1cm} \overline{\mathcal{X}_n} + z_{\alpha/2}\cdot \sqrt{\overline{\mathcal{X}_n}(1-\overline{\mathcal{X}_n})/n}\hspace{0.1cm} \right) \hspace{0.1cm}\approx\hspace{0.1cm} 1-\alpha \\[0.7cm]$$


Por tanto, tenemos el siguiente intervalo de confianza a un nivel aproximado $\hspace{0.1cm} 1-\alpha\hspace{0.1cm}$ para el parametro $\hspace{0.1cm} p \hspace{0.1cm}\\$

$$IC(p)_{1-\alpha} \hspace{0.1cm}=\hspace{0.1cm} \left[ \hspace{0.1cm} \overline{\mathcal{X}_n} \hspace{0.1cm}\pm\hspace{0.1cm} z_{\alpha/2} \cdot \sqrt{\overline{\mathcal{X}_n}(1-\overline{\mathcal{X}_n})/n} \hspace{0.1cm} \right] \\[0.9cm]$$


Dada una muestra $\hspace{0.1cm}X=(x_1,...,x_n)\hspace{0.1cm}$ de la v.a. $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ , tenemos la siguiente realización del intervalo de confianza: $\\[0.6cm]$


$$IC(p)_{1-\alpha} \hspace{0.1cm}=\hspace{0.1cm} \left[ \hspace{0.1cm} \overline{X} \hspace{0.1cm}\pm\hspace{0.1cm} z_{\alpha/2} \cdot \sqrt{\overline{X}\cdot (1-\overline{X})/n} \hspace{0.1cm} \right]$$


Donde:

$\hspace{0.45cm} \overline{X} = \dfrac{1}{n} \sum_{i=1}^n x_i$





<br>

## Intervalo de confianza para la proporción en `Python`



Cargamos los datos con los que vamos a trabajar:

```python
import numpy as np
import pandas as pd
```

```python
Data = pd.read_csv('House_Price_Regression.csv')
```

```python
Data.head()
```

```python

```


```python

```


```python

```

```python

```


```python

```


```python

```


```python

```


```python

```


```python

```










<br>
 
## Intervalo de confianza para la media con varianza conocida

Una variable cuantitativa  $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ puede modelarse como una variable aleatoria $N(\mu , \sigma^2)$, donde $\hspace{0.1cm}\mu=E[\mathcal{X}]\hspace{0.2cm}$ y $\hspace{0.2cm}\sigma^2 = Var(\mathcal{X})$, que pueden interpretarse respectivamente como la media y varianza poblacional de la variable $\hspace{0.1cm}\mathcal{X}$

Queremos obtener un intervalo de confianza para $\hspace{0.1cm} \mu \hspace{0.1cm}$, bajo el supuesto de que $\hspace{0.1cm}\sigma^2\hspace{0.1cm}$ es conocido.



Para ello vamos a apoyarnos en el teorema de distribucion de la media muestral  y en el método pivotal.


<br>


### Distribución Normal


$$\mathcal{X} \sim N(\mu, \sigma^2) \hspace{0.2cm} \Leftrightarrow \hspace{0.2cm} f_\mathcal{X}(x) = \dfrac{1}{\sqrt{ 2\pi \cdot \sigma^2} } \cdot exp \left( \dfrac{-1}{2} \cdot \dfrac{(x- \mu)^2}{\sigma^2}  \right) \\$$


Donde : $\hspace{0.1cm} \mu \in \mathbb{R} \hspace{0.1cm}$ y $\hspace{0.1cm} \sigma^2 > 0 \\$


**Propiedades**

- $\hspace{0.1cm}E[\mathcal{X}]=\mu \\$

- $\hspace{0.1cm}Var(\mathcal{X})=\sigma^2 \\$

- $\hspace{0.1cm}\mathcal{X}\cdot a \sim N(\mu \cdot a , a^2 \cdot \sigma^2) \\$

- $\hspace{0.1cm}\mathcal{X}\cdot b + a \sim N( b\cdot \mu + a , b^2 \cdot \sigma^2) \\$

- Si $\hspace{0.1cm}\mathcal{X}_i \sim N(\mu_i , \sigma_i^2)\hspace{0.1cm}$ , para $\hspace{0.1cm}i \in \lbrace 1,...,n\rbrace \hspace{0.1cm}$ , entonces:

$$\mathcal{X}_1 + ...+ \mathcal{X}_n \sim N(\mu_1 +...+ \mu_n , \sigma_1^2 + ...+ \sigma_n^2) \\$$

- Si $\hspace{0.1cm}\mathcal{X}_i \sim N(\mu_i , \sigma_i^2)\hspace{0.1cm}$ , para $\hspace{0.1cm}i \in \lbrace 1,...,n\rbrace \hspace{0.1cm}$ , entonces:

$$\hspace{0.25cm}a_1\cdot \mathcal{X}_1 + ...+ a_n \cdot \mathcal{X}_n \sim N(a_1 \cdot \mu_1 +...+ a_n \cdot \mu_n \hspace{0.1cm},\hspace{0.1cm} a_1^2 \cdot \sigma_1^2 + ...+ a_n^2 \cdot \sigma_n^2) \\$$

- $\hspace{0.1cm}\dfrac{\hspace{0.15cm} \mathcal{X} - \mu \hspace{0.15cm}}{\sqrt{\sigma^2}} \hspace{0.1cm}\sim\hspace{0.1cm} N(0,1)$





<br>

### Teorema de distribución de la media muestral

Si tenemos una v.a. $\hspace{0.1cm}\mathcal{X}\sim N(\mu , \sigma^2)\hspace{0.1cm}$ y una m.a.s $\hspace{0.1cm}\mathcal{X}_1,...,\mathcal{X}_n\hspace{0.1cm}$ de $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ , entonces: $\\[0.5cm]$


$$\overline{ \mathcal{X}_n } \sim N(\mu \hspace{0.1cm},\hspace{0.1cm} \sigma^2/n)$$

Por tanto:


$$\dfrac{\hspace{0.2cm} \overline{ \mathcal{X}_n } - \mu \hspace{0.2cm}}{ \sqrt{\sigma^2 / n}  } \hspace{0.1cm}\sim\hspace{0.1cm} N(0,1)$$




<br>

### Intervalo de confianza para la media con varianza conocida


La anterior cantidad:

$$\Upsilon(\mathcal{X}_1,...,\mathcal{X}_n, \mu) \hspace{0.1cm}=\hspace{0.1cm} \dfrac{\hspace{0.1cm} \overline{ \mathcal{X}_n } - \mu \hspace{0.1cm}}{ \sqrt{\sigma^2 / n}  } \hspace{0.1cm} \sim \hspace{0.1cm} N(0,1)$$


es una cantidad pivotal, puesto que contienen al parametro de interés, en este caso $\hspace{0.1cm} \theta = \mu\hspace{0.1cm}$, y su distribución de probabilidad es conocida y no depende de dicho parámetro, es una $\hspace{0.1cm}N(0,1)$.


Siguiendo el método pivotal hay que encontrar los valores $\hspace{0.1cm} a,b \in \mathbb{R}\hspace{0.1cm}$ tales que:




$$P\left( \hspace{0.1cm}a \hspace{0.1cm}< \hspace{0.1cm} \dfrac{\hspace{0.1cm} \overline{ \mathcal{X}_n } - \mu \hspace{0.1cm}}{ \sqrt{\sigma^2 / n}  }  \hspace{0.1cm}<\hspace{0.1cm} b \hspace{0.1cm}\right) = 1-\alpha \\$$


 
Siguiendo los anteriores resultados:


$$P\left( \hspace{0.1cm} a \hspace{0.1cm}<\hspace{0.1cm} \dfrac{\hspace{0.1cm} \overline{ \mathcal{X}_n } - \mu \hspace{0.1cm}}{ \sqrt{\sigma^2 / n}  } \hspace{0.1cm} <\hspace{0.1cm} b\hspace{0.1cm} \right) \hspace{0.1cm}=\hspace{0.1cm} P\left( a < N(0,1)  < b \right) \\$$



Teniendo en cuenta las propiedades de la distribución normal: $\\[0.6cm]$

$$P\left( z_{1-\alpha/2} < N(0,1)  < z_{\alpha/2} \right) = P\left( -z_{\alpha/2} < N(0,1)  < z_{\alpha/2} \right) = 1-\alpha \\$$
 
 
Donde:


$z_{\alpha/2}\hspace{0.1cm}$ es el valor tal que $\hspace{0.1cm}P(N(0,1)>z_{\alpha/2}) = \alpha/2 \\$ 



Por tanto:


$$P\left( \hspace{0.1cm} -z_{\alpha/2} \hspace{0.1cm}<\hspace{0.1cm} \hspace{0.1cm} \dfrac{\hspace{0.1cm} \overline{ \mathcal{X}_n } - \mu \hspace{0.1cm}}{ \sqrt{\sigma^2 / n}  }  \hspace{0.1cm} <\hspace{0.1cm} z_{\alpha/2}\hspace{0.1cm} \right) \hspace{0.1cm} = \hspace{0.1cm} 1-\alpha \\[1cm]$$





Siguiendo el método pivotal ahora tenemos que aislar el parametro $\theta=\mu$. Operando un poco se llega a lo siguiente: $\\[0.6cm]$


$$P\left( \hspace{0.1cm} \overline{\mathcal{X}_n} -z_{\alpha/2} \cdot \sqrt{\sigma^2 / n}\hspace{0.1cm}<\hspace{0.1cm}  \mu \hspace{0.1cm} <\hspace{0.1cm} \overline{\mathcal{X}_n} + z_{\alpha/2}\cdot \sqrt{\sigma^2 / n}\hspace{0.1cm} \right) \hspace{0.1cm}=\hspace{0.1cm} 1-\alpha \\[0.7cm]$$



 

Por tanto, tenemos el siguiente intervalo de confianza a un nivel  $\hspace{0.1cm} 1-\alpha\hspace{0.1cm}$ para el parametro $\hspace{0.1cm} \mu \hspace{0.1cm}\\$

$$IC(\mu)_{1-\alpha} \hspace{0.1cm}=\hspace{0.1cm} \left[ \hspace{0.1cm} \overline{\mathcal{X}_n} \hspace{0.1cm}\pm\hspace{0.1cm} z_{\alpha/2} \cdot \sqrt{\sigma^2 / n} \hspace{0.1cm} \right] \\[0.9cm]$$


Dada una muestra $\hspace{0.1cm}X=(x_1,...,x_n)\hspace{0.1cm}$ de la v.a. $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ , tenemos la siguiente realización del intervalo de confianza: $\\[0.6cm]$


$$IC(\mu)_{1-\alpha} \hspace{0.1cm}=\hspace{0.1cm} \left[ \hspace{0.1cm} \overline{X} \hspace{0.1cm}\pm\hspace{0.1cm} z_{\alpha/2} \cdot \sqrt{\sigma^2 / n} \hspace{0.1cm} \right]$$


Donde:

$\hspace{0.45cm} \overline{X} = \dfrac{1}{n} \sum_{i=1}^n x_i$



El problema es que en la práctica $\hspace{0.1cm}\sigma^2\hspace{0.1cm}$ no es conocido, por ello se utiliza el intervalo de confianza de la siguiente sección.








<br>

## Intervalo de confianza para la media con varianza desconocida




Una variable cuantitativa  $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ puede modelarse como una variable aleatoria $N(\mu , \sigma^2)$, donde $\hspace{0.1cm}\mu=E[\mathcal{X}]\hspace{0.1cm}$ y $\hspace{0.1cm}\sigma^2 = Var(\mathcal{X})$, que pueden interpretarse respectivamente como la media y varianza poblacional de la variable $\hspace{0.1cm}\mathcal{X}$

Queremos obtener un intervalo de confianza para $\hspace{0.1cm} \mu \hspace{0.1cm}$, teniendo en cuenta que $\hspace{0.1cm}\sigma^2\hspace{0.1cm}$ es desconocido.



Para ello vamos a apoyarnos en el teorema de Gosset  y en el método pivotal.



<br>

### Distribución t-student


$$\mathcal{X} \sim t_n \Leftrightarrow f_X(x) = \dfrac{\Gamma\left(\dfrac{n+1}{2}\right)}{\sqrt{n\cdot \pi \hspace{0.1cm}} \cdot \Gamma(n/2)} \cdot \left(1 + \dfrac{x^2}{n}\right)^{-1/2 \cdot (n+1)} \cdot I( x\in \mathbb{R} ) \\$$



**Propiedades** 

- $E[\mathcal{X}] = 0 \\$

- $Var[\mathcal{X}] = \dfrac{n}{n-2}$ , si $\hspace{0.1cm} n>2 \\$

- Si $\hspace{0.1cm}\mathcal{Z} \sim N(0,1)\hspace{0.1cm}$ y $\hspace{0.1cm}\mathcal{X}\sim \chi_n^2\hspace{0.1cm}$ y son independientes , entonces:

$$\dfrac{\mathcal{Z}}{\sqrt{\mathcal{X}/n}} \sim t_n$$




<br>

### Teorema de Gosset


Dada una v.a. $\hspace{0.1cm}\mathcal{X}\sim N(\mu, \sigma^2)\hspace{0.1cm}$, y dada una m.a.s $\hspace{0.1cm}\mathcal{X}_1,...,\mathcal{X}_n\hspace{0.1cm}$ de $\hspace{0.1cm}\mathcal{X}$ 


$$\dfrac{\hspace{0.15cm} \overline{\mathcal{X}_n} - \mu \hspace{0.15cm}}{\sqrt{\dfrac{n}{n-1} S_n^2/n \hspace{0.1cm}} } \hspace{0.1cm}\sim\hspace{0.1cm} t_{n-1}$$

Donde:

- $\overline{\mathcal{X}_n} = \dfrac{1}{n} \cdot \sum_{i=1}^n \mathcal{X}_i \\$

- $S_n^2 = \dfrac{1}{n} \cdot \sum_{i=1}^n (\mathcal{X}_i - \overline{\mathcal{X}_n} )^2$



<br>


### Intervalo de confianza para la media con varianza desconocida



La anterior cantidad:

$$\Upsilon(\mathcal{X}_1,...,\mathcal{X}_n, \mu) \hspace{0.1cm}=\hspace{0.1cm} \dfrac{\hspace{0.15cm} \overline{\mathcal{X}_n} - \mu \hspace{0.15cm}}{\sqrt{\dfrac{n}{n-1} S_n^2/n \hspace{0.1cm}} } \hspace{0.1cm}\sim\hspace{0.1cm} t_{n-1}$$


es una cantidad pivotal, puesto que contienen al parametro de interés, en este caso $\hspace{0.1cm} \theta = \mu\hspace{0.1cm}$, y su distribución de probabilidad es conocida y no depende de dicho parámetro, es una $\hspace{0.1cm} t_{n-1}$.


Siguiendo el método pivotal hay que encontrar los valores $\hspace{0.1cm} a,b \in \mathbb{R}\hspace{0.1cm}$ tales que:




$$P\left( \hspace{0.1cm}a \hspace{0.1cm}< \hspace{0.1cm} \dfrac{\hspace{0.15cm} \overline{\mathcal{X}_n} - \mu \hspace{0.15cm}}{\sqrt{\dfrac{n}{n-1} S_n^2/n \hspace{0.1cm}} }  \hspace{0.1cm}<\hspace{0.1cm} b \hspace{0.1cm}\right) = 1-\alpha \\$$


 
Siguiendo los anteriores resultados:


$$P\left( \hspace{0.1cm} a \hspace{0.1cm}<\hspace{0.1cm} \dfrac{\hspace{0.15cm} \overline{\mathcal{X}_n} - \mu \hspace{0.15cm}}{\sqrt{\dfrac{n}{n-1} S_n^2/n \hspace{0.1cm}} } \hspace{0.1cm} <\hspace{0.1cm} b\hspace{0.1cm} \right) \hspace{0.1cm}=\hspace{0.1cm} P\left( a < t_{n-1}  < b \right) \\$$



Teniendo en cuenta las propiedades de la distribución t-student: $\\[0.6cm]$

$$P\left( t_{1-\alpha/2} < t_{n-1}  < t_{\alpha/2} \right) = P\left( -t_{\alpha/2} < t_{n-1}  < t_{\alpha/2} \right) = 1-\alpha \\$$
 
 
Donde:


$t_{\alpha/2}\hspace{0.1cm}$ es el valor tal que $\hspace{0.1cm}P(t_{n-1}>t_{\alpha/2}) = \alpha/2 \\$ 



Por tanto:


$$P\left( \hspace{0.1cm} -t^{n-1}_{\alpha/2} \hspace{0.1cm}<\hspace{0.1cm}   \dfrac{\hspace{0.15cm} \overline{\mathcal{X}_n} - \mu \hspace{0.15cm}}{\sqrt{\dfrac{n}{n-1} S_n^2/n \hspace{0.1cm}} }  \hspace{0.1cm} <\hspace{0.1cm} t^{n-1}_{\alpha/2}\hspace{0.1cm} \right) \hspace{0.1cm} = \hspace{0.1cm} 1-\alpha \\[1cm]$$





Siguiendo el método pivotal ahora tenemos que aislar el parametro $\theta=\mu$. Operando un poco se llega a lo siguiente: $\\[0.6cm]$


$$P\left( \hspace{0.1cm} \overline{\mathcal{X}_n} -t^{n-1}_{\alpha/2} \cdot \sqrt{\dfrac{n}{n-1} S_n^2/n}\hspace{0.1cm}<\hspace{0.1cm}  \mu \hspace{0.1cm} <\hspace{0.1cm} \overline{\mathcal{X}_n} + t^{n-1}_{\alpha/2}\cdot \sqrt{\dfrac{n}{n-1} S_n^2/n}\hspace{0.1cm} \right) \hspace{0.1cm}=\hspace{0.1cm} 1-\alpha \\[0.7cm]$$



 

Por tanto, tenemos el siguiente intervalo de confianza a un nivel  $\hspace{0.1cm} 1-\alpha\hspace{0.1cm}$ para el parametro $\hspace{0.1cm} \mu \hspace{0.1cm}\\$

$$IC(\mu)_{1-\alpha} \hspace{0.1cm}=\hspace{0.1cm} \left[ \hspace{0.1cm} \overline{\mathcal{X}_n} \hspace{0.1cm}\pm\hspace{0.1cm} t^{n-1}_{\alpha/2} \cdot \sqrt{\dfrac{n}{n-1} S_n^2/n} \hspace{0.1cm} \right] \\[0.9cm]$$


Dada una muestra $\hspace{0.1cm}X=(x_1,...,x_n)\hspace{0.1cm}$ de la v.a. $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ , tenemos la siguiente realización del intervalo de confianza: $\\[0.6cm]$


$$IC(\mu)_{1-\alpha} \hspace{0.1cm}=\hspace{0.1cm} \left[ \hspace{0.1cm} \overline{X} \hspace{0.1cm}\pm\hspace{0.1cm} t^{n-1}_{\alpha/2} \cdot \sqrt{\dfrac{n}{n-1} S(X)^2/n} \hspace{0.1cm} \right]$$


Donde:

$\hspace{0.45cm} \overline{X} = \dfrac{1}{n} \sum_{i=1}^n x_i$

$\hspace{0.45cm} S(X)^2 = \dfrac{1}{n} \sum_{i=1}^n (x_i - \overline{X})^2$


<br>


## Intervalo de confianza para la media con varianza desconocida en `Python`


```python

```


```python

```


```python

```

```python

```


```python

```


```python

```


```python

```


```python

```


```python

```








<br>

## Intervalo de confianza para la varianza
 


Una variable cuantitativa  $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ puede modelarse como una variable aleatoria $N(\mu , \sigma^2)$, donde $\hspace{0.1cm}\mu=E[\mathcal{X}]\hspace{0.1cm}$ y $\hspace{0.1cm}\sigma^2 = Var(\mathcal{X})$, que pueden interpretarse respectivamente como la media y varianza poblacional de la variable $\hspace{0.1cm}\mathcal{X}$

Queremos obtener un intervalo de confianza para $\hspace{0.1cm} \sigma^2 \hspace{0.1cm}$, teniendo en cuenta que $\hspace{0.1cm}\sigma^2\hspace{0.1cm}$ es desconocido.



Para ello vamos a apoyarnos en el teorema de Fisher  y en el método pivotal.



<br>

### Distribución chi-cuadrado


$$\mathcal{X} \sim \chi^2_n \hspace{0.2cm} \Leftrightarrow \hspace{0.2cm} f_\mathcal{X}(x) = \dfrac{1}{\Gamma(n/2)} \cdot (1/2)^{n/2} \cdot x^{n/2 - 1}\cdot e^{-x/2} \cdot I(x>0)\\$$



**Propiedades** 

- $\chi^2_n = Gamma(\alpha = n/2 , \lambda = 1/2) \\$

- Si $\mathcal{Z}\sim N(0,1) \Rightarrow \mathcal{Z}^2 \sim \chi_1^2 \\$

- Si $\mathcal{Z}_1 , ..., \mathcal{Z}_n$ es una m.a.s de $\mathcal{Z} \sim N(0,1)$ $\Rightarrow \mathcal{Z}_1^2 + ... + \mathcal{Z}_n^2 \sim \chi_n^2 \\$

- $E[\mathcal{X}] = \dfrac{\alpha}{\lambda} = \dfrac{n/2}{1/2} = n \\$

- $Var[\mathcal{X}] = \dfrac{\alpha}{\lambda^2}=\dfrac{n/2}{(1/2)^2} = 2n \\$

- $\chi^2_n + \chi^2_r = \chi^2_{n+r} \hspace{0.2cm}$ , siempre que sean independientes los sumandos.





<br>

### Teorema de Fisher


Dada una v.a. $\hspace{0.1cm}\mathcal{X}\sim N(\mu, \sigma^2)\hspace{0.1cm}$, y dada una m.a.s $\hspace{0.1cm}\mathcal{X}_1,...,\mathcal{X}_n\hspace{0.1cm}$ de $\hspace{0.1cm}\mathcal{X}$ 


$$\dfrac{\hspace{0.15cm} n\cdot S^2_n \hspace{0.15cm}}{ \sigma^2 \hspace{0.1cm} } \hspace{0.1cm}\sim\hspace{0.1cm} \chi^2_{n-1}$$

Donde:

- $\overline{\mathcal{X}_n} = \dfrac{1}{n} \cdot \sum_{i=1}^n \mathcal{X}_i \\$

- $S_n^2 = \dfrac{1}{n} \cdot \sum_{i=1}^n (\mathcal{X}_i - \overline{\mathcal{X}_n} )^2$



<br>


### Intervalo de confianza para la media con varianza desconocida



La anterior cantidad:

$$\Upsilon(\mathcal{X}_1,...,\mathcal{X}_n, \sigma^2) \hspace{0.1cm}=\hspace{0.1cm} \dfrac{\hspace{0.15cm} n\cdot S^2_n \hspace{0.15cm}}{ \sigma^2 \hspace{0.1cm} } \hspace{0.1cm}\sim\hspace{0.1cm} \chi^2_{n-1}$$


es una cantidad pivotal, puesto que contienen al parametro de interés, en este caso $\hspace{0.1cm} \theta = \sigma^2 \hspace{0.1cm}$, y su distribución de probabilidad es conocida y no depende de dicho parámetro, es una $\hspace{0.1cm} \chi^2_{n-1}$.


Siguiendo el método pivotal hay que encontrar los valores $\hspace{0.1cm} a,b \in \mathbb{R}\hspace{0.1cm}$ tales que:




$$P\left( \hspace{0.1cm}a \hspace{0.1cm}< \hspace{0.1cm}  \dfrac{\hspace{0.15cm} n\cdot S^2_n \hspace{0.15cm}}{ \sigma^2 \hspace{0.1cm} } \hspace{0.1cm}<\hspace{0.1cm} b \hspace{0.1cm}\right) = 1-\alpha \\$$


 
Siguiendo los anteriores resultados:


$$P\left( \hspace{0.1cm} a \hspace{0.1cm}<\hspace{0.1cm}  \dfrac{\hspace{0.15cm} n\cdot S^2_n \hspace{0.15cm}}{ \sigma^2 \hspace{0.1cm} } \hspace{0.1cm} <\hspace{0.1cm} b\hspace{0.1cm} \right) \hspace{0.1cm}=\hspace{0.1cm} P\left( a < \chi^2_{n-1}  < b \right) \\$$



Teniendo en cuenta las propiedades de la distribución chi-cuadrado: $\\[0.6cm]$

$$P\left( \chi^{n-1}_{1-\alpha/2} < \chi^2_{n-1}  < \chi^{n-1}_{\alpha/2} \right)  = 1-\alpha \\$$
 
 
Donde:


$\chi^{n-1}_{\alpha/2}\hspace{0.1cm}$ es el valor tal que $\hspace{0.1cm}P(\chi^2_{n-1}> \chi^{n-1}_{\alpha/2}) = \alpha/2 \\$ 



Por tanto:


$$P\left( \hspace{0.1cm}  \chi^{n-1}_{1-\alpha/2} \hspace{0.1cm}<\hspace{0.1cm}  \dfrac{\hspace{0.15cm} n\cdot S^2_n \hspace{0.15cm}}{ \sigma^2 \hspace{0.1cm} }  \hspace{0.1cm} <\hspace{0.1cm} \chi^{n-1}_{\alpha/2}\hspace{0.1cm} \right) \hspace{0.1cm} = \hspace{0.1cm} 1-\alpha \\[1cm]$$




Siguiendo el método pivotal ahora tenemos que aislar el parametro $\hspace{0.1cm}\theta=\sigma^2\hspace{0.1cm}$. Operando un poco se llega a lo siguiente: $\\[0.6cm]$


$$P\left( \hspace{0.1cm}  \dfrac{n \cdot S_n^2}{\chi^{n-1}_{\alpha/2}}   \hspace{0.1cm}<\hspace{0.1cm}  \sigma^2 \hspace{0.1cm} <\hspace{0.1cm}      \dfrac{n \cdot S_n^2}{\chi^{n-1}_{1-\alpha/2}}        \hspace{0.1cm} \right) \hspace{0.1cm}=\hspace{0.1cm} 1-\alpha \\[0.7cm]$$



 

Por tanto, tenemos el siguiente intervalo de confianza a un nivel  $\hspace{0.1cm} 1-\alpha\hspace{0.1cm}$ para el parametro $\hspace{0.1cm} \sigma^2  \hspace{0.1cm}\\$

$$IC(\sigma^2)_{1-\alpha} \hspace{0.1cm}=\hspace{0.1cm} \left[ \hspace{0.1cm} \dfrac{n \cdot S_n^2}{\chi^{n-1}_{\alpha/2}} \hspace{0.15cm},\hspace{0.15cm} \dfrac{n \cdot S_n^2}{\chi^{n-1}_{1-\alpha/2}}     \hspace{0.1cm} \right] \\[0.9cm]$$


Dada una muestra $\hspace{0.1cm}X=(x_1,...,x_n)\hspace{0.1cm}$ de la v.a. $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ , tenemos la siguiente realización del intervalo de confianza: $\\[0.6cm]$


$$IC(\sigma^2)_{1-\alpha} \hspace{0.1cm}=\hspace{0.1cm} \left[ \hspace{0.1cm} \dfrac{n \cdot S(X)^2}{\chi^{n-1}_{\alpha/2}} \hspace{0.15cm},\hspace{0.15cm} \dfrac{n \cdot S_n^2}{\chi^{n-1}_{1-\alpha/2}}     \hspace{0.1cm} \right] \\[0.9cm]$$

Donde:


$\hspace{0.45cm} S(X)^2 = \dfrac{1}{n} \sum_{i=1}^n (x_i - \overline{X})^2$



INDICAR QUE PARA n GRANDE NO FUNCIONA BIEN. DE HECHO SI n --> infinito LOS EXTREMOS DEL INTERVALO SON INFINITOS


<br>


## Intervalo de confianza para la varianza en `Python`


```python

```


```python

```


```python

```

```python

```


```python

```


```python

```


```python

```


```python

```


```python

```





 
 
<br>
 

 
## Intervalo de confianza para la diferencia de medias con muestras independientes y varianzas iguales




Un par de variables cuantitativas  $\hspace{0.1cm}\mathcal{X}_1\hspace{0.1cm}$ , $\hspace{0.1cm}\mathcal{X}_2\hspace{0.1cm}$ pueden modelarse como un par de variables aleatorias **independientes** $\hspace{0.1cm} N(\mu_1 , \sigma_1^2)\hspace{0.1cm}$ y $\hspace{0.1cm}N(\mu_2 , \sigma_2^2)\hspace{0.1cm}$, donde $\hspace{0.1cm}\mu_1=E[\mathcal{X}_1]\hspace{0.1cm}$ , $\hspace{0.1cm}\mu_2=E[\mathcal{X}_2]\hspace{0.1cm}$, $\hspace{0.1cm}\sigma_1^2=E[\mathcal{X}_1]\hspace{0.1cm}$ y $\hspace{0.1cm}\sigma_2^2 = Var(\mathcal{X}_2)$, que pueden interpretarse respectivamente como la media y varianza poblacional de las variables $\hspace{0.1cm}\mathcal{X}_1\hspace{0.1cm}$ y $\hspace{0.1cm}\mathcal{X}_2$

Queremos obtener un intervalo de confianza para $\hspace{0.1cm} \mu_1 - \mu_2 \hspace{0.1cm}$, teniendo en cuenta que $\hspace{0.1cm}\sigma_1^2\hspace{0.1cm}$ y $\hspace{0.1cm}\sigma_2^2\hspace{0.1cm}$ son desconocidas pero iguales $\hspace{0.1cm}\sigma^2 = \sigma_1^2=\sigma_2^2$ y las v.a's $\hspace{0.1cm}\mathcal{X}_1 \sim N(\mu_1,\sigma_1^2)\hspace{0.1cm}$ y $\hspace{0.1cm}\mathcal{X}_2\sim N(\mu_2 , \sigma_2^2)\hspace{0.1cm}$ son **independientes**.



Para ello vamos a apoyarnos en el teorema de Gosset aumentado  y en el método pivotal.



<br>

### Teorema de Gosset aumentado


Dada un par de v.a's **independientes** $\hspace{0.1cm}\mathcal{X}_1\sim N(\mu_1, \sigma_1^2)\hspace{0.1cm}$ y $\hspace{0.1cm}\mathcal{X}_2\sim N(\mu_2, \sigma_2^2)\hspace{0.1cm}$, y dada un par de m.a.s $\hspace{0.1cm}\mathcal{X}_{11},...,\mathcal{X}_{n1}\hspace{0.1cm}$ y $\hspace{0.1cm}\mathcal{X}_{12},...,\mathcal{X}_{n2}\hspace{0.1cm}$ de $\hspace{0.1cm}\mathcal{X}_1$ y  $\hspace{0.1cm}\mathcal{X}_2$, respectivamente.


$$\dfrac{\hspace{0.15cm} \overline{\mathcal{X}}_1 - \overline{\mathcal{X}}_2 - (\mu_1 - \mu_2) \hspace{0.15cm}}{ \sqrt{S_p^2 \cdot \left(\dfrac{1}{n_1} + \dfrac{1}{n_2}\right)} \hspace{0.1cm} } \hspace{0.1cm}\sim\hspace{0.1cm} t_{n_1  n_2 -2}$$

Donde:

- $\overline{\mathcal{X}_1} = \dfrac{1}{n} \cdot \sum_{i=1}^n \mathcal{X}_{i1} \\$

- $\overline{\mathcal{X}_2} = \dfrac{1}{n} \cdot \sum_{i=1}^n \mathcal{X}_{i2} \\$

- $S_p^2 = \dfrac{(n_1-1)\cdot S_1^2 + (n_2-1)\cdot S_2^2}{n_1 + n_2 -2} \\$

- $S_1^2 = \dfrac{1}{n} \cdot \sum_{i=1}^n (\mathcal{X}_{i1} - \overline{\mathcal{X}_1})^2 \\$

- $S_2^2 = \dfrac{1}{n} \cdot \sum_{i=1}^n (\mathcal{X}_{i2} - \overline{\mathcal{X}_2})^2$


<br>


### Intervalo de confianza para la diferencia de medias con varianzas desconocidas



La anterior cantidad:

$$\Upsilon(\mathcal{X}_1,...,\mathcal{X}_n, \sigma^2) \hspace{0.1cm}=\hspace{0.1cm} \dfrac{\hspace{0.15cm} \overline{\mathcal{X}}_1 - \overline{\mathcal{X}}_2 - (\mu_1 - \mu_2) \hspace{0.15cm}}{ \sqrt{S_p^2 \cdot \left(\dfrac{1}{n_1} + \dfrac{1}{n_2}\right)} \hspace{0.1cm} } \hspace{0.1cm}\sim\hspace{0.1cm} t_{n_1 +  n_2 -2}$$


es una cantidad pivotal, puesto que contienen al parametro de interés, en este caso $\hspace{0.1cm} \theta = \mu_1 - \mu_2 \hspace{0.1cm}$, y su distribución de probabilidad es conocida y no depende de dicho parámetro, es una $\hspace{0.1cm} t_{n_1 + n_2 -2}$.


Siguiendo el método pivotal hay que encontrar los valores $\hspace{0.1cm} a,b \in \mathbb{R}\hspace{0.1cm}$ tales que:




$$P\left( \hspace{0.1cm} a \hspace{0.1cm} < \hspace{0.1cm}  \dfrac{\hspace{0.15cm} \overline{\mathcal{X}}_1 - \overline{\mathcal{X}}_2 - (\mu_1 - \mu_2) \hspace{0.15cm}}{ \sqrt{S_p^2 \cdot \left(\dfrac{1}{n_1} + \dfrac{1}{n_2}\right)}}<\hspace{0.1cm} b \hspace{0.1cm}\right) = 1-\alpha \\$$


 
Siguiendo los anteriores resultados:


$$P\left( \hspace{0.1cm} a \hspace{0.1cm}<\hspace{0.1cm}  \dfrac{\hspace{0.15cm} \overline{\mathcal{X}}_1 - \overline{\mathcal{X}}_2 - (\mu_1 - \mu_2) \hspace{0.15cm}}{ \sqrt{S_p^2 \cdot \left(\dfrac{1}{n_1} + \dfrac{1}{n_2}\right)}} \hspace{0.1cm} <\hspace{0.1cm} b\hspace{0.1cm} \right) \hspace{0.1cm}=\hspace{0.1cm} P\left( a < t_{n_1 +n_2 -2}  < b \right) \\$$



Teniendo en cuenta las propiedades de la distribución chi-cuadrado: $\\[0.6cm]$

$$P\left( t^{n_1+n_2-2}_{1-\alpha/2} < t_{n_1+n_2-2}  < t^{n_1+n_2-2}_{\alpha/2} \right)  = 1-\alpha \\$$
 
 
Donde:


$t^{n_1+n_2-2}_{\alpha/2}\hspace{0.1cm}$ es el valor tal que $\hspace{0.1cm}P(t_{n_1+n_2-2}> t^{n_1+n_2-2}_{\alpha/2}) = \alpha/2 \\$ 



Por tanto:


$$P\left( \hspace{0.1cm}  t^{n_1+n_2-2}_{1-\alpha/2} \hspace{0.1cm}<\hspace{0.1cm}  \dfrac{\hspace{0.15cm} \overline{\mathcal{X}}_1 - \overline{\mathcal{X}}_2 - (\mu_1 - \mu_2) \hspace{0.15cm}}{ \sqrt{S_p^2 \cdot \left(\dfrac{1}{n_1} + \dfrac{1}{n_2}\right)}}  \hspace{0.1cm} <\hspace{0.1cm} t^{n_1+n_2-2}_{\alpha/2}\hspace{0.1cm} \right) \hspace{0.1cm} = \hspace{0.1cm} 1-\alpha \\[1cm]$$




Siguiendo el método pivotal ahora tenemos que aislar el parametro $\hspace{0.1cm}\theta=\mu_1 - \mu_2 \hspace{0.1cm}$. Operando un poco se llega a lo siguiente: $\\[0.6cm]$


$$P\left( \hspace{0.1cm}    \overline{\mathcal{X}}_1 - \overline{\mathcal{X}}_2 -  t^{n_1+n_2-2}_{\alpha/2} \cdot \sqrt{S_p^2 \cdot \left(\dfrac{1}{n_1} + \dfrac{1}{n_2}\right)}  \hspace{0.1cm}<\hspace{0.1cm}  \mu_1 - \mu_2 \hspace{0.1cm} <\hspace{0.1cm}      \overline{\mathcal{X}}_1 - \overline{\mathcal{X}}_2 +  t^{n_1+n_2-2}_{\alpha/2} \cdot \sqrt{S_p^2 \cdot \left(\dfrac{1}{n_1} + \dfrac{1}{n_2}\right)}         \hspace{0.1cm} \right) \hspace{0.1cm}=\hspace{0.1cm} 1-\alpha \\[0.7cm]$$



 

Por tanto, tenemos el siguiente intervalo de confianza a un nivel  $\hspace{0.1cm} 1-\alpha\hspace{0.1cm}$ para el parametro $\hspace{0.1cm} \mu_1 - \mu_2  \hspace{0.1cm}\\$

$$IC(\mu_1 - \mu_2)_{1-\alpha} \hspace{0.1cm}=\hspace{0.1cm} \left[ \hspace{0.1cm} \overline{\mathcal{X}}_1 - \overline{\mathcal{X}}_2 \pm  t^{n_1+n_2-2}_{\alpha/2} \cdot \sqrt{S_p^2 \cdot \left(\dfrac{1}{n_1} + \dfrac{1}{n_2}\right)}      \hspace{0.1cm} \right] \\[0.9cm]$$


Dadas dos muestras $\hspace{0.1cm}X_1=(x_{11},...,x_{n1})\hspace{0.1cm}$ y $\hspace{0.1cm}X_2=(x_{12},...,x_{n2})\hspace{0.1cm}$ de las v.a's $\hspace{0.1cm}\mathcal{X}_1\hspace{0.1cm}$ y $\hspace{0.1cm}\mathcal{X}_2\hspace{0.1cm}$  , respectivamente,  tenemos la siguiente realización del intervalo de confianza: $\\[0.6cm]$


$$IC(\mu_1 - \mu_2)_{1-\alpha} \hspace{0.1cm}=\hspace{0.1cm} \left[ \hspace{0.1cm} \overline{X}_1 - \overline{X}_2 \pm  t^{n_1+n_2-2}_{\alpha/2} \cdot \sqrt{S(X)_p^2 \cdot \left(\dfrac{1}{n_1} + \dfrac{1}{n_2}\right)}    \hspace{0.1cm} \right] \\[0.9cm]$$

Donde:

$\overline{X}_1 = \dfrac{1}{n} \cdot \sum_{i=1}^n x_{i1}$

$\overline{X}_2 = \dfrac{1}{n} \cdot \sum_{i=1}^n x_{i2}$

$S(X_1)^2 = \dfrac{1}{n}\cdot \sum_{i=1}^n (x_{i1}- \overline{X}_1)^2$

$S(X_2)^2 = \dfrac{1}{n}\cdot \sum_{i=1}^n (x_{i2} - \overline{X}_2)^2$

$\hspace{0.45cm} S(X)_p^2 = \dfrac{(n_1-1)\cdot S(X_1)^2 + (n_2-1)\cdot S(X_2)^2}{n_1 + n_2 -2}$

<br>

## Intervalo de confianza para la diferencia de medias con muestras independientes y varianzas no necesariamente iguales.


Si no suponemos que las varianzas $\sigma_1^2$ y $\sigma_2^2$ son iguales, entonces la cantidad pivotal sigue siendo la misma que en el apartado anterior, con distribución t-student pero con otros grados de libertad:



$$\dfrac{\hspace{0.15cm} \overline{\mathcal{X}}_1 - \overline{\mathcal{X}}_2 - (\mu_1 - \mu_2) \hspace{0.15cm}}{ \sqrt{S_p^2 \cdot \left(\dfrac{1}{n_1} + \dfrac{1}{n_2}\right)} \hspace{0.1cm} } \hspace{0.1cm}\sim\hspace{0.1cm} t_{v}$$


$$v=\dfrac{(S_1^2 / n_1 + S_2^2/n_2 )^2}{\dfrac{(S_1^2 / n_1)^2}{n_1-1} + \dfrac{( S_2^2/n_2 )^2}{n_2-1}} $$

Por lo que el intervalo de confianza para $\mu_1-\mu_2$, con varianzas desconocidas pero no necesariamente iguales, a un nivel $1-\alpha$ es:

$$IC(\mu_1 - \mu_2)_{1-\alpha} \hspace{0.1cm}=\hspace{0.1cm} \left[ \hspace{0.1cm} \overline{\mathcal{X}}_1 - \overline{\mathcal{X}}_2 \pm  t^{v}_{\alpha/2} \cdot \sqrt{S_p^2 \cdot \left(\dfrac{1}{n_1} + \dfrac{1}{n_2}\right)}      \hspace{0.1cm} \right] \\[0.9cm]$$



$$v=\dfrac{(S_1^2 / n_1 + S_2^2/n_2 )^2}{\dfrac{(S_1^2 / n_1)^2}{n_1-1} + \dfrac{( S_2^2/n_2 )^2}{n_2-1}} $$

Dadas dos muestras $\hspace{0.1cm}X_1=(x_{11},...,x_{n1})\hspace{0.1cm}$ y $\hspace{0.1cm}X_2=(x_{12},...,x_{n2})\hspace{0.1cm}$ de las v.a's $\hspace{0.1cm}\mathcal{X}_1\hspace{0.1cm}$ y $\hspace{0.1cm}\mathcal{X}_2\hspace{0.1cm}$  , respectivamente,  tenemos la siguiente realización del intervalo de confianza: $\\[0.6cm]$


$$IC(\mu_1 - \mu_2)_{1-\alpha} \hspace{0.1cm}=\hspace{0.1cm} \left[ \hspace{0.1cm} \overline{X}_1 - \overline{X}_2 \pm  t^{v}_{\alpha/2} \cdot \sqrt{S(X)_p^2 \cdot \left(\dfrac{1}{n_1} + \dfrac{1}{n_2}\right)}    \hspace{0.1cm} \right] \\[0.9cm]$$

$$v=\dfrac{(S(X_1)^2 / n_1 + S(X_2)^2/n_2 )^2}{\dfrac{(S(X_1)^2 / n_1)^2}{n_1-1} + \dfrac{( S(X_2)^2/n_2 )^2}{n_2-1}} $$

<br>




## Intervalo de confianza para la diferencia de medias con muestras dependientes (pareadas)

 
 


Un par de variables cuantitativas  $\hspace{0.1cm}\mathcal{X}_1\hspace{0.1cm}$ , $\hspace{0.1cm}\mathcal{X}_2\hspace{0.1cm}$ pueden modelarse como un par de variables aleatorias **no necesariamente independientes** $\hspace{0.1cm} N(\mu_1 , \sigma_1^2)\hspace{0.1cm}$ y $\hspace{0.1cm}N(\mu_2 , \sigma_2^2)\hspace{0.1cm}$, donde $\hspace{0.1cm}\mu_1=E[\mathcal{X}_1]\hspace{0.1cm}$ , $\hspace{0.1cm}\mu_2=E[\mathcal{X}_2]\hspace{0.1cm}$, $\hspace{0.1cm}\sigma_1^2=E[\mathcal{X}_1]\hspace{0.1cm}$ y $\hspace{0.1cm}\sigma_2^2 = Var(\mathcal{X}_2)$, que pueden interpretarse respectivamente como la media y varianza poblacional de las variables $\hspace{0.1cm}\mathcal{X}_1\hspace{0.1cm}$ y $\hspace{0.1cm}\mathcal{X}_2$

Queremos obtener un intervalo de confianza para $\hspace{0.1cm} \mu_1 - \mu_2 \hspace{0.1cm}$, teniendo en cuenta que $\hspace{0.1cm}\sigma_1^2\hspace{0.1cm}$ y $\hspace{0.1cm}\sigma_2^2\hspace{0.1cm}$ son desconocidas y las v.a. $\hspace{0.1cm}\mathcal{X}_1 \sim N(\mu_1 , \sigma_1^2) \hspace{0.1cm}$  y $\hspace{0.1cm}\mathcal{X}_2\sim N(\mu_2, \sigma_2^2\hspace{0.1cm}$ **no son independientes**.



Para ello vamos a apoyarnos en el teorema de Gosset   y en el método pivotal.



<br>

### Teorema de Gosset

Tenemos dos v.a's $\hspace{0.1cm}\mathcal{X}_1 \sim N(\mu_1 , \sigma_1^2) \hspace{0.1cm}$  y $\hspace{0.1cm}\mathcal{X}_2\sim N(\mu_2, \sigma_2^2\hspace{0.1cm}$ .

Tenemos una m.a.s $\hspace{0.1cm}\mathcal{X}_{11},...,\mathcal{X}_{n1}$ de $\mathcal{X}_{1}$
y otra m.a.s. $\hspace{0.1cm}\mathcal{X}_{12},...,\mathcal{X}_{n2}$ de $\mathcal{X}_{2}$

Sea $D_i = \mathcal{X}_{i1} -\mathcal{X}_{i2}$ , entonces $D_i \sim N(\mu_D , \sigma_D^2)$

Donde:

$E[D_i] = E[\mathcal{X}_{i1} -\mathcal{X}_{i2}] = E[ N(\mu_1, \sigma_1^2) - N(\mu_2, \sigma_2^2)] =  E[ N(\mu_1, \sigma_1^2)] - E[ N(\mu_2, \sigma_2^2)] = \mu_1 - \mu_2 = \mu_D$

$Var(D_i) = Var[\mathcal{X}_{i1} -\mathcal{X}_{i2}] = Var[ N(\mu_1, \sigma_1^2) - N(\mu_2, \sigma_2^2)] =  Var[ N(\mu_1, \sigma_1^2)] - Var[ N(\mu_2, \sigma_2^2)] - 2\cdot Cov(N(\mu_1, \sigma_1^2) , N(\mu_2, \sigma_2^2))= \sigma_1^2 - \sigma_2^2 - 2\cdot \sigma_{12} = \sigma_D^2$


$D_1,...,D_n$ es una m.a.s de $D\sim N(\mu_D , \sigma_D^2)$, por lo que puede aplicarse le el teorema de Gosset, obteniendose que:

$$\dfrac{\overline{D} - \mu_D}{\sqrt{\dfrac{n}{n-1}\cdot S_D^2 / n}} \sim t_{n-1}$$


Donde:

$\overline{D} = \dfrac{1}{n} \sum_{i=1}^n D_i$

$S_D^2 = \dfrac{1}{n} \sum_{i=1}^n (D_i - \overline{D})^2$





 


<br>


### Intervalo de confianza para la diferencia de medias con muestras dependientes pareadas



La anterior cantidad:

$$\Upsilon(\mathcal{X}_1,...,\mathcal{X}_n, \sigma^2) \hspace{0.1cm}=\hspace{0.1cm} \dfrac{\overline{D} - \mu_D}{\sqrt{\dfrac{n}{n-1}\cdot S_D^2 / n}} \sim t_{n-1}$$


es una cantidad pivotal, puesto que contienen al parametro de interés, en este caso $\hspace{0.1cm} \theta = \mu_1 - \mu_2 \hspace{0.1cm}$, y su distribución de probabilidad es conocida y no depende de dicho parámetro, es una $\hspace{0.1cm} t_{n-1}$.


Siguiendo el método pivotal hay que encontrar los valores $\hspace{0.1cm} a,b \in \mathbb{R}\hspace{0.1cm}$ tales que:




$$P\left( \hspace{0.1cm} a \hspace{0.1cm} < \hspace{0.1cm}   \dfrac{\overline{D} - \mu_D}{\sqrt{\dfrac{n}{n-1}\cdot S_D^2 / n}} \hspace{0.1cm} <\hspace{0.1cm} b \hspace{0.1cm}\right) = 1-\alpha \\$$


 
Siguiendo los anteriores resultados:


$$P\left( \hspace{0.1cm} a \hspace{0.1cm}<\hspace{0.1cm}  \dfrac{\overline{D} - \mu_D}{\sqrt{\dfrac{n}{n-1}\cdot S_D^2 / n}} \hspace{0.1cm} <\hspace{0.1cm} b\hspace{0.1cm} \right) \hspace{0.1cm}=\hspace{0.1cm} P\left( a < t_{n  -1}  < b \right) \\$$



Teniendo en cuenta las propiedades de la distribución t-student: $\\[0.6cm]$

$$P\left( t^{n-1}_{1-\alpha/2} < t_{n-1}  < t^{n-1}_{\alpha/2} \right) = P\left( -t^{n-1}_{\alpha/2} < t_{n-1}  < t^{n-1}_{\alpha/2} \right) = 1-\alpha \\$$
 
 
Donde:


$t^{n-1}_{\alpha/2}\hspace{0.1cm}$ es el valor tal que $\hspace{0.1cm}P(t_{n-1}> t^{n-1}_{\alpha/2}) = \alpha/2 \\$ 



Por tanto:


$$P\left( \hspace{0.1cm}  -t^{n-1}_{\alpha/2} \hspace{0.1cm}<\hspace{0.1cm}  
\dfrac{\overline{D} - \mu_D}{\sqrt{\dfrac{n}{n-1}\cdot S_D^2 / n}}
\hspace{0.1cm} <\hspace{0.1cm} t^{n-1}_{\alpha/2}\hspace{0.1cm} \right) \hspace{0.1cm} = \hspace{0.1cm} 1-\alpha \\[1cm]$$




Siguiendo el método pivotal ahora tenemos que aislar el parametro $\hspace{0.1cm}\theta=\mu_1 - \mu_2 \hspace{0.1cm}$. Operando un poco se llega a lo siguiente: $\\[0.6cm]$



$$P\left( \hspace{0.1cm}    
\overline{D} - t^{n-1}_{\alpha/2}\cdot \sqrt{\dfrac{n}{n-1}\cdot S_D^2 / n}
\hspace{0.1cm}<\hspace{0.1cm}  \mu_1 - \mu_2 \hspace{0.1cm} <\hspace{0.1cm}      
\overline{D} + t^{n-1}_{\alpha/2}\cdot \sqrt{\dfrac{n}{n-1}\cdot S_D^2 / n}
\hspace{0.1cm} \right) \hspace{0.1cm}=\hspace{0.1cm} 1-\alpha \\[0.7cm]$$



 

Por tanto, tenemos el siguiente intervalo de confianza a un nivel  $\hspace{0.1cm} 1-\alpha\hspace{0.1cm}$ para el parametro $\hspace{0.1cm} \mu_1 - \mu_2  \hspace{0.1cm}\\$

$$IC(\mu_1 - \mu_2)_{1-\alpha} \hspace{0.1cm}=\hspace{0.1cm} \left[ \hspace{0.1cm} \\overline{D} \pm t^{n-1}_{\alpha/2}\cdot \sqrt{\dfrac{n}{n-1}\cdot S_D^2 / n}
     \hspace{0.1cm} \right] \\[0.9cm]$$


Dadas dos muestras $\hspace{0.1cm}X_1=(x_{11},...,x_{n1})\hspace{0.1cm}$ y $\hspace{0.1cm}X_2=(x_{12},...,x_{n2})\hspace{0.1cm}$ de las v.a's $\hspace{0.1cm}\mathcal{X}_1\hspace{0.1cm}$ y $\hspace{0.1cm}\mathcal{X}_2\hspace{0.1cm}$  , respectivamente,  tenemos la muestra D=(d_1,...,d_n) , donde $d_i = x_{i1}-x_{i2}$ , y con ello la siguiente realización del intervalo de confianza: $\\[0.6cm]$


$$IC(\mu_1 - \mu_2)_{1-\alpha} \hspace{0.1cm}=\hspace{0.1cm} \left[ \hspace{0.1cm} \overline{D} \pm t^{n-1}_{\alpha/2}\cdot \sqrt{\dfrac{n}{n-1}\cdot S(D)^2 / n}
   \hspace{0.1cm} \right] \\[0.9cm]$$

Donde:

$\overline{D} = \dfrac{1}{n} \cdot \sum_{i=1}^n d_{i}$


$S(D)^2 = \dfrac{1}{n}\cdot \sum_{i=1}^n (d_i - \overline{D})^2$


<br>

 
 
 
## Intervalo de confianza para el cociente de varianzas



Un par de variables cuantitativas  $\hspace{0.1cm}\mathcal{X}_1\hspace{0.1cm}$ , $\hspace{0.1cm}\mathcal{X}_2\hspace{0.1cm}$ pueden modelarse como un par de variables aleatorias **independientes** $\hspace{0.1cm} N(\mu_1 , \sigma_1^2)\hspace{0.1cm}$ y $\hspace{0.1cm}N(\mu_2 , \sigma_2^2)\hspace{0.1cm}$, donde $\hspace{0.1cm}\mu_1=E[\mathcal{X}_1]\hspace{0.1cm}$ , $\hspace{0.1cm}\mu_2=E[\mathcal{X}_2]\hspace{0.1cm}$, $\hspace{0.1cm}\sigma_1^2=E[\mathcal{X}_1]\hspace{0.1cm}$ y $\hspace{0.1cm}\sigma_2^2 = Var(\mathcal{X}_2)$, que pueden interpretarse respectivamente como la media y varianza poblacional de las variables $\hspace{0.1cm}\mathcal{X}_1\hspace{0.1cm}$ y $\hspace{0.1cm}\mathcal{X}_2$

Queremos obtener un intervalo de confianza para $\hspace{0.1cm} \dfrac{\sigma_1^2}{\sigma_2^2} \hspace{0.1cm}$, teniendo en cuenta que $\hspace{0.1cm}\sigma_1^2\hspace{0.1cm}$ y $\hspace{0.1cm}\sigma_2^2\hspace{0.1cm}$ son desconocidas y no necesariamente iguales y las v.a's $\hspace{0.1cm}\mathcal{X}_1 \sim N(\mu_1,\sigma_1^2)\hspace{0.1cm}$ y $\hspace{0.1cm}\mathcal{X}_2\sim N(\mu_2 , \sigma_2^2)\hspace{0.1cm}$ son **independientes**.



Para ello vamos a apoyarnos en el teorema de Fisher  y en el método pivotal.



<br>

### Distribución de Fisher





<br>

### Teorema de Fisher

Dadas un par de v.a's **independientes**  $\hspace{0.1cm}\mathcal{X}_1\sim N(\mu_1, \sigma_1^2)\hspace{0.1cm}$ y $\hspace{0.1cm}\mathcal{X}_2\sim N(\mu_2, \sigma_2^2)\hspace{0.1cm}$, y  un par de m.a.s $\hspace{0.1cm}\mathcal{X}_{11},...,\mathcal{X}_{n1}\hspace{0.1cm}$ y $\hspace{0.1cm}\mathcal{X}_{12},...,\mathcal{X}_{n2}\hspace{0.1cm}$ de $\hspace{0.1cm}\mathcal{X}_1$ y  $\hspace{0.1cm}\mathcal{X}_2$, respectivamente, se cumple lo siguiente:


$$\dfrac{S_2^2 / \sigma_2^2}{S_1^2 / \sigma_1^2} \sim F_{n_2-1 , n_1-1}$$





Donde:


- $S_1^2 = \dfrac{1}{n} \cdot \sum_{i=1}^n (\mathcal{X}_{i1} - \overline{\mathcal{X}_1})^2 \\$

- $S_2^2 = \dfrac{1}{n} \cdot \sum_{i=1}^n (\mathcal{X}_{i2} - \overline{\mathcal{X}_2})^2$

- $\overline{\mathcal{X}_1} = \dfrac{1}{n} \cdot \sum_{i=1}^n \mathcal{X}_{i1} \\$

- $\overline{\mathcal{X}_2} = \dfrac{1}{n} \cdot \sum_{i=1}^n \mathcal{X}_{i2} \\$

<br>


### Intervalo de confianza para el cociente de varianzas


La anterior cantidad:

$$\Upsilon(\mathcal{X}_1,...,\mathcal{X}_n, \sigma^2) \hspace{0.1cm}=\hspace{0.1cm} \dfrac{S_2^2 / \sigma_2^2}{S_1^2 / \sigma_1^2} \sim F_{n_2-1 , n_1-1}$$


es una cantidad pivotal, puesto que contienen al parametro de interés, en este caso $\hspace{0.1cm} \theta = \sigma_1^2 / \sigma_2^2 \hspace{0.1cm}$, y su distribución de probabilidad es conocida y no depende de dicho parámetro, es una $\hspace{0.1cm} F_{n_2-1 , n_1-1}$.


Siguiendo el método pivotal hay que encontrar los valores $\hspace{0.1cm} a,b \in \mathbb{R}\hspace{0.1cm}$ tales que:




$$P\left( \hspace{0.1cm} a \hspace{0.1cm} < \hspace{0.1cm}  \dfrac{S_2^2 / \sigma_2^2}{S_1^2 / \sigma_1^2}  \hspace{0.1cm}<\hspace{0.1cm} b \hspace{0.1cm}\right) = 1-\alpha \\$$


 
Siguiendo los anteriores resultados:


$$P\left( \hspace{0.1cm} a \hspace{0.1cm}<\hspace{0.1cm}  \dfrac{S_2^2 / \sigma_2^2}{S_1^2 / \sigma_1^2} \hspace{0.1cm} <\hspace{0.1cm} b\hspace{0.1cm} \right) \hspace{0.1cm}=\hspace{0.1cm} P\left( a < F_{n_2-1 , n_1-1}  < b \right) \\$$



Teniendo en cuenta las propiedades de la distribución chi-cuadrado: $\\[0.6cm]$

$$P\left( F^{n_2-1 , n_1-1}_{1-\alpha/2} < F^{n_2-1 , n_1-1}  < F^{n_2-1 , n_1-1}_{\alpha/2} \right)  = 1-\alpha \\$$
 
 
Donde:


$F^{n_2-1 , n_1-1}_{\alpha/2} \hspace{0.1cm}$ es el valor tal que $\hspace{0.1cm}P(F_{n_2-1 , n_1-1}> F^{n_2-1 , n_1-1}_{\alpha/2}) = \alpha/2 \\$ 



Por tanto:


$$P\left( \hspace{0.1cm}  F^{n_2-1 , n_1-1}_{1-\alpha/2} \hspace{0.1cm}<\hspace{0.1cm}  
\dfrac{S_2^2 / \sigma_2^2}{S_1^2 / \sigma_1^2}
\hspace{0.1cm} <\hspace{0.1cm} F^{n_2-1 , n_1-1}_{\alpha/2}\hspace{0.1cm} \right) \hspace{0.1cm} = \hspace{0.1cm} 1-\alpha \\[1cm]$$




Siguiendo el método pivotal ahora tenemos que aislar el parametro $\hspace{0.1cm}\theta=\sigma_1^2 / \sigma_2^2 \hspace{0.1cm}$. Operando un poco se llega a lo siguiente: $\\[0.6cm]$


$$P\left( \hspace{0.1cm}     \dfrac{S_1^2}{S_2^2} \cdot   F^{n_2-1 , n_1-1}_{1-\alpha/2} \hspace{0.1cm}<\hspace{0.1cm} \dfrac{\sigma_1^2}{\sigma_2^2} \hspace{0.1cm} <\hspace{0.1cm}       \dfrac{S_1^2}{S_2^2} \cdot   F^{n_2-1 , n_1-1}_{\alpha/2}        \hspace{0.1cm} \right) \hspace{0.1cm}=\hspace{0.1cm} 1-\alpha \\[0.7cm]$$



 

Por tanto, tenemos el siguiente intervalo de confianza a un nivel  $\hspace{0.1cm} 1-\alpha\hspace{0.1cm}$ para el parametro $\hspace{0.1cm} \sigma_1^2/\sigma_2^2 \hspace{0.1cm}\\$

$$IC(\dfrac{\sigma_1^2}{\sigma_2^2})_{1-\alpha} \hspace{0.1cm}=\hspace{0.1cm} \left[ \hspace{0.1cm} \dfrac{S_1^2}{S_2^2} \cdot   F^{n_2-1 , n_1-1}_{1-\alpha/2} \hspace{0.1cm} , \hspace{0.1cm}  \dfrac{S_1^2}{S_2^2} \cdot   F^{n_2-1 , n_1-1}_{\alpha/2}     \hspace{0.1cm} \right] \\[0.9cm]$$


Dadas dos muestras $\hspace{0.1cm}X_1=(x_{11},...,x_{n1})\hspace{0.1cm}$ y $\hspace{0.1cm}X_2=(x_{12},...,x_{n2})\hspace{0.1cm}$ de las v.a's $\hspace{0.1cm}\mathcal{X}_1\hspace{0.1cm}$ y $\hspace{0.1cm}\mathcal{X}_2\hspace{0.1cm}$  , respectivamente,  tenemos la siguiente realización del intervalo de confianza: $\\[0.6cm]$


$$IC(\dfrac{\sigma_1^2}{\sigma_2^2})_{1-\alpha} \hspace{0.1cm}=\hspace{0.1cm} \left[ \hspace{0.1cm} \dfrac{S(X_1)^2}{S(X_2)^2} \cdot   F^{n_2-1 , n_1-1}_{1-\alpha/2} \hspace{0.1cm} , \hspace{0.1cm}  \dfrac{S(X_1)^2}{S(X_2)^2} \cdot   F^{n_2-1 , n_1-1}_{\alpha/2}     \hspace{0.1cm} \right] \\[0.9cm]$$

Donde:



$S(X_1)^2 = \dfrac{1}{n}\cdot \sum_{i=1}^n (x_{i1}- \overline{X}_1)^2$

$S(X_2)^2 = \dfrac{1}{n}\cdot \sum_{i=1}^n (x_{i2} - \overline{X}_2)^2$

$\overline{X}_1 = \dfrac{1}{n} \cdot \sum_{i=1}^n x_{i1}$

$\overline{X}_2 = \dfrac{1}{n} \cdot \sum_{i=1}^n x_{i2}$



<br>


  
## Intervalo de confianza para la diferencia de proporciones
 

Un par de variables categoricas binarias  $\hspace{0.1cm}\mathcal{X}_1\hspace{0.1cm}$ , $\hspace{0.1cm}\mathcal{X}_2\hspace{0.1cm}$ pueden modelarse como un par de variables aleatorias **independientes** $\hspace{0.1cm} Bernoulli(p_1)\hspace{0.1cm}$ y $\hspace{0.1cm}Bernoulli(p_2)\hspace{0.1cm}$, donde $\hspace{0.1cm}p_1=P(\mathcal{X}_1 = 1) =E[\mathcal{X}_1]\hspace{0.1cm}$ , $\hspace{0.1cm}p_2=P(\mathcal{X}_2=1)=E[\mathcal{X}_2]\hspace{0.1cm}$, que pueden interpretarse respectivamente como la proporcion de individuos de la población para los que $\mathcal{X}_1=1$ y $\mathcal{X}_2=1$, respectivamente.


Queremos obtener un intervalo de confianza para $\hspace{0.1cm} p_1 - p_2 \hspace{0.1cm}$



Para ello vamos a apoyarnos en el teorema de Moivre-Laplace  y en el método pivotal.




<br>

### Teorema Moivre-Laplace

Dadas un par de v.a's **independientes**  $\hspace{0.1cm}\mathcal{X}_1\sim Bernoulli(p_1)\hspace{0.1cm}$ y $\hspace{0.1cm}\mathcal{X}_2\sim Bernoulli(p_2)\hspace{0.1cm}$, y  un par de m.a.s $\hspace{0.1cm}\mathcal{X}_{11},...,\mathcal{X}_{n_1 1}\hspace{0.1cm}$ y $\hspace{0.1cm}\mathcal{X}_{12},...,\mathcal{X}_{n_2 2}\hspace{0.1cm}$ de $\hspace{0.1cm}\mathcal{X}_1$ y  $\hspace{0.1cm}\mathcal{X}_2$, respectivamente, se cumple lo siguiente:

$$\overline{\mathcal{X}_1} = \dfrac{1}{n_1} \cdot \sum_{i=1}^n \mathcal{X}_{i1} \sim Binomial(n,p_1)$$

$$\overline{\mathcal{X}_2} = \dfrac{1}{n_2} \cdot \sum_{i=1}^n \mathcal{X}_{i2} \sim Binomial(n,p_2)$$

Entonces:


$$E[ \overline{\mathcal{X}_1} - \overline{\mathcal{X}_2}  ] = p_1 - p_2$$

Como las v.a. son mutuamente independientes :

$$Cov(\overline{\mathcal{X}_1} , \overline{\mathcal{X}_2}) = 0$$

$$Var(\overline{\mathcal{X}_1} - \overline{\mathcal{X}_2}) = Var(\overline{\mathcal{X}_1}) + Var(\overline{\mathcal{X}_2}) - 2Cov(\overline{\mathcal{X}_1} , \overline{\mathcal{X}_2}) = Var(\overline{\mathcal{X}_1}) + Var(\overline{\mathcal{X}_2}) = \dfrac{p_1(1-p_1)}{n_1} + \dfrac{p_2(1-p_2)}{n_2}$$

Por tanto, aplicando el TCL tenemos lo siguiente:


$$\dfrac{(\overline{\mathcal{X}_1} - \overline{\mathcal{X}_2}) - (p_1 - p_2)}{\sqrt{\dfrac{p_1(1-p_1)}{n_1} + \dfrac{p_2(1-p_2)}{n_2}}} \uderset{d}{\rightarrow} N(0,1)$$



 
<br>


### Intervalo de confianza para la diferencia de proporciones


La anterior cantidad:

$$\Upsilon(\mathcal{X}_1,...,\mathcal{X}_n, p_1-p_2) \hspace{0.1cm}=\hspace{0.1cm} \dfrac{(\overline{\mathcal{X}_1} - \overline{\mathcal{X}_2}) - (p_1 - p_2)}{\sqrt{\dfrac{p_1(1-p_1)}{n_1} + \dfrac{p_2(1-p_2)}{n_2}}} \uderset{d}{\rightarrow} N(0,1)$$


es una cantidad pivotal, puesto que contienen al parametro de interés, en este caso $\hspace{0.1cm} \theta = p_1 - p_2 \hspace{0.1cm}$, y su distribución de probabilidad es conocida y no depende de dicho parámetro, es una $\hspace{0.1cm} N(0,1)$.


Siguiendo el método pivotal hay que encontrar los valores $\hspace{0.1cm} a,b \in \mathbb{R}\hspace{0.1cm}$ tales que:




$$P\left( \hspace{0.1cm} a \hspace{0.1cm} < \hspace{0.1cm}  \dfrac{(\overline{\mathcal{X}_1} - \overline{\mathcal{X}_2}) - (p_1 - p_2)}{\sqrt{\dfrac{p_1(1-p_1)}{n_1} + \dfrac{p_2(1-p_2)}{n_2}}}   \hspace{0.1cm}<\hspace{0.1cm} b \hspace{0.1cm}\right) = 1-\alpha \\$$


 
Siguiendo los anteriores resultados:


$$P\left( \hspace{0.1cm} a \hspace{0.1cm}<\hspace{0.1cm}  \dfrac{(\overline{\mathcal{X}_1} - \overline{\mathcal{X}_2}) - (p_1 - p_2)}{\sqrt{\dfrac{p_1(1-p_1)}{n_1} + \dfrac{p_2(1-p_2)}{n_2}}}  \hspace{0.1cm} <\hspace{0.1cm} b\hspace{0.1cm} \right) \hspace{0.1cm}=\hspace{0.1cm} P\left( a < F_{n_2-1 , n_1-1}  < b \right) \\$$



Teniendo en cuenta las propiedades de la distribución normal: $\\[0.6cm]$

$$P\left( z_{1-\alpha/2} < N(0,1)  < z_{\alpha/2} \right)  = P\left( -z_{\alpha/2} < N(0,1)  < z_{\alpha/2} \right)  =1-\alpha \\$$
 
 
Donde:


$z_{\alpha/2} \hspace{0.1cm}$ es el valor tal que $\hspace{0.1cm}P(N(0,1) > z_{\alpha/2}) = \alpha/2 \\$ 



Por tanto:


$$P\left( \hspace{0.1cm}  -z_{\alpha/2} \hspace{0.1cm}<\hspace{0.1cm}  
\dfrac{(\overline{\mathcal{X}_1} - \overline{\mathcal{X}_2}) - (p_1 - p_2)}{\sqrt{\dfrac{p_1(1-p_1)}{n_1} + \dfrac{p_2(1-p_2)}{n_2}}}
\hspace{0.1cm} <\hspace{0.1cm} z_{\alpha/2}\hspace{0.1cm} \right) \hspace{0.1cm} = \hspace{0.1cm} 1-\alpha \\[1cm]$$




Siguiendo el método pivotal ahora tenemos que aislar el parametro $\hspace{0.1cm}\theta=p_1-p_2 \hspace{0.1cm}$. Operando un poco se llega a lo siguiente: $\\[0.6cm]$


$$P\left( \hspace{0.1cm}  (\overline{\mathcal{X}_1} - \overline{\mathcal{X}_2}) - z_{\alpha/2}\cdot \sqrt{\dfrac{p_1(1-p_1)}{n_1} + \dfrac{p_2(1-p_2)}{n_2}}
\hspace{0.1cm}<\hspace{0.1cm} p_1-p_2 \hspace{0.1cm} <\hspace{0.1cm}       
(\overline{\mathcal{X}_1} - \overline{\mathcal{X}_2}) + z_{\alpha/2}\cdot \sqrt{\dfrac{p_1(1-p_1)}{n_1} + \dfrac{p_2(1-p_2)}{n_2}}
\hspace{0.1cm} \right) \hspace{0.1cm}=\hspace{0.1cm} 1-\alpha \\[0.7cm]$$


Como en la práctica se desconocen $p_1$ y $p_2$ , para obtener un intervalo de confianza que pueda ser usado en la práctica debemos estimarlas en ambos lados de la desigualdad. Se estiman como $\overline{\mathcal{X}_1}$ y $\overline{\mathcal{X}_2}$ , respectivamente.
 

Por tanto, tenemos el siguiente intervalo de confianza a un nivel  $\hspace{0.1cm} 1-\alpha\hspace{0.1cm}$ para el parametro $\hspace{0.1cm} p_1 - p_2 \hspace{0.1cm}\\$

$$IC(p_1 - p_2)_{1-\alpha} \hspace{0.1cm}=\hspace{0.1cm} \left[ \hspace{0.1cm} (\overline{\mathcal{X}_1} - \overline{\mathcal{X}_2}) \pm z_{\alpha/2}\cdot \sqrt{\dfrac{\overline{\mathcal{X}_1}(1-\overline{\mathcal{X}_1})}{n_1} + \dfrac{\overline{\mathcal{X}_2}(1-\overline{\mathcal{X}_2})}{n_2}}     \hspace{0.1cm} \right] \\[0.9cm]$$


Dadas dos muestras $\hspace{0.1cm}X_1=(x_{11},...,x_{n1})\hspace{0.1cm}$ y $\hspace{0.1cm}X_2=(x_{12},...,x_{n2})\hspace{0.1cm}$ de las v.a's $\hspace{0.1cm}\mathcal{X}_1\hspace{0.1cm}$ y $\hspace{0.1cm}\mathcal{X}_2\hspace{0.1cm}$  , respectivamente,  tenemos la siguiente realización del intervalo de confianza: $\\[0.6cm]$


$$IC(p_1 - p_2)_{1-\alpha} \hspace{0.1cm}=\hspace{0.1cm} \left[ \hspace{0.1cm} (\overline{X}_1 - \overline{X}_2) \pm z_{\alpha/2}\cdot \sqrt{\dfrac{\overline{X}_1(1-\overline{X}_1)}{n_1} + \dfrac{\overline{X}_2(1-\overline{X}_2)}{n_2}}     \hspace{0.1cm} \right] \\[0.9cm]$$

Donde:





$\overline{X}_1 = \dfrac{1}{n} \cdot \sum_{i=1}^n x_{i1}$

$\overline{X}_2 = \dfrac{1}{n} \cdot \sum_{i=1}^n x_{i2}$



 








<br>
