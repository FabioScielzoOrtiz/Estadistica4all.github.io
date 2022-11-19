---
title: 'Métodos de preprocesado de datos'
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




> More articles in my blog:   $\hspace{0.1cm}$   [Estadistica4all](https://fabioscielzoortiz.github.io/Estadistica4all.github.io/)


<br>

El objetivo del preprocesado de datos es la obtención de un conjunto de datos que sea útil para la extracción de conocimiento.  

Podríamos definir el preprocesado de datos como un conjunto de operaciones o tareas que se aplican sobre datos, y que permiten transformarlos de un modo tal que puedan ser utilizados para entrenar algoritmos estadisticos o de machine learning.

En este articulo nos vamos a centrar en algunas de estas tareas, pero la lista aqui expuesta puede ampliarse considerablemente.


<br>

# Escalado de variables

Escalar una variable es aplicarle una transformación con el objetivo de conseguir que la variable transformada tenga ciertas propiedades que no tenia la variable original (la variable sin transformar).

En este artículo nos centraremos en tres tipos de escalado: escalado estandar, normalización (0,1) y normalización (a,b). En cualquier caso, hay mas procedimientos que aquí no será explorados, por lo que para ver una lista más amplia se recomienda, por ejemplo, ver la documentación sobre este tema de la libreria   [`sklearn`](https://scikit-learn.org/stable/modules/preprocessing.html)


<br>

## Escalado estandar


 
Dada la muestra de una  variable estadística $\hspace{0.1cm} X_j=(x_{1j},...,x_{nj})^t$

La versión escalada estandar de $\hspace{0.1cm} X_j\hspace{0.1cm}$ es la siguiente variable: $\\[1cm]$

$$X_j^{std} \hspace{0.1cm} =\hspace{0.1cm} \dfrac{X_j - \mu(X_j)}{\sigma(X_j)} \\$$

donde:

$\hspace{0.1cm}\mu(X_j) \hspace{0.1cm} =\hspace{0.1cm} \dfrac{1}{n} \cdot \sum_{i=1}^n x_{ij}$

$\hspace{0.1cm}\sigma(X_j) \hspace{0.1cm} =\hspace{0.1cm} \dfrac{1}{n} \cdot \sum_{i=1}^n (x_{ij} - \overline{x}_j )^2 \\[1cm]$



**Propiedades :**


- $\hspace{0.2cm} \mu( X_j^{\hspace{0.07cm}std} ) \hspace{0.1cm} =\hspace{0.1cm} 0 \\[0.8cm]$


- $\hspace{0.2cm} \sigma^2( X_j^{\hspace{0.07cm}std} ) \hspace{0.1cm} =\hspace{0.1cm} 1 \\$



**Demostraciones :** 

- $\hspace{0.1cm} \mu(X_j ^{\hspace{0.07cm}std} ) \hspace{0.1cm} =\hspace{0.1cm} \mu \left( \dfrac{X_j - \mu(X_j)}{\sigma(X_j)} \right) \hspace{0.1cm} =\hspace{0.1cm} \dfrac{1}{\sigma(X_j)} \cdot \mu( \hspace{0.08cm} X_j - \mu(X_j) \hspace{0.08cm} ) \hspace{0.1cm} =\hspace{0.1cm} \dfrac{1}{\sigma(X_j)} \cdot [ \hspace{0.08cm}  \mu(X_j) - \mu \left( \hspace{0.08cm} \mu(X_j) \hspace{0.08cm} \right) \hspace{0.08cm} ] = \dfrac{1}{\sigma(X_j)} \cdot [ \hspace{0.08cm}  \mu(X_j) -  \mu(X_j)  \hspace{0.08cm} ] \hspace{0.1cm} =\hspace{0.1cm} \dfrac{1}{\sigma(X_j)} \cdot  0 = 0 \\[0.8cm]$

- $\hspace{0.1cm} \sigma^2( X_j^{\hspace{0.07cm}std} ) \hspace{0.1cm} =\hspace{0.1cm}  \sigma^2\left( \dfrac{X_j - \mu(X_j)}{\sigma(X_j)} \right) \hspace{0.1cm} =\hspace{0.1cm} \dfrac{1}{\sigma(X_j)^2} \cdot \sigma^2( \hspace{0.08cm} X_j - \mu(X_j)   \hspace{0.08cm} ) \hspace{0.1cm} =\hspace{0.1cm}  \dfrac{1}{\sigma^2(X_j)} \cdot \sigma^2( \hspace{0.08cm} X_j   \hspace{0.08cm} ) = 1$


<br>


## Normalización (0,1)

Dada la muestra de una  variable estadística $\hspace{0.1cm} X_j=(x_{1j},...,x_{nj})^t$

La versión normalizada $\hspace{0.1cm}(0,1)\hspace{0.1cm}$ de $\hspace{0.1cm}X_j\hspace{0.1cm}$ es la siguiente variable: $\\[1cm]$

$$X_j^{norm(0,1)} = \dfrac{X_j - Min(X_j)}{Max(X_j) - Min(X_j)} \\$$



**Propiedades :**

- $\hspace{0.2cm} Max \left(X_j^{norm(a,b)} \right) \hspace{0.1cm}=\hspace{0.1cm} 1 \\[0.8cm]$

- $\hspace{0.2cm} Min \left( X_j^{norm(a,b)} \right) \hspace{0.1cm}=\hspace{0.1cm} 0 \\$


**Demostraciones :**

- $\hspace{0.1cm} Max \left( X_j^{norm(0,1)} \right) \hspace{0.1cm} = \hspace{0.1cm} \dfrac{ Max(X_j) - Min(X_j)}{Max(X_j) - Min(X_j)} \hspace{0.1cm}=\hspace{0.1cm} 1 \\[0.8cm]$

- $\hspace{0.1cm} Min \left( X_j^{norm(0,1)} \right) \hspace{0.1cm}=\hspace{0.1cm} \dfrac{ Min(X_j) - Min(X_j)}{Max(X_j) - Min(X_j)} \hspace{0.1cm}=\hspace{0.1cm} 0$


<br>


## Normalización (a,b)


Dada la muestra de una variable estadística $\hspace{0.1cm}X_j=(x_{1j},...,x_{nj})^t$

La versión normalizada $\hspace{0.1cm}(a,b)\hspace{0.1cm}$ de $\hspace{0.1cm}X_j\hspace{0.1cm}$ es la siguiente variable:

$$X_j^{norm(a,b)} = X_j^{norm(0,1)} \cdot (b - a) + a \\$$


**Propiedades :**

- $\hspace{0.2cm} Max \left(X_j^{norm(a,b)} \right) = b \\[0.8cm]$

- $\hspace{0.2cm} Min \left( X_j^{norm(a,b)} \right) = a \\$



**Demostraciones :**

- $\hspace{0.1cm} Max \left(X_j^{norm(a,b)} \right) = Max \left(X_j^{norm(0,1)} \right)\cdot (a-b)+b= 1\cdot (b-a)+a = b \\[0.8cm]$

- $\hspace{0.1cm} Min \left(X_j^{norm(a,b)} \right) = Min \left(X_j^{norm(0,1)} \right)\cdot (a-b)+b= 0\cdot (b-a)+a = a$



<br>

# Imputación de valores faltantes 




<br>

# Recodificación estandar de variables categoricas

Dada la muestra de una variable estadística categórica $\hspace{0.1cm}X_j=(x_{1j},...,x_{nj})^t\hspace{0.1cm}$ con $\hspace{0.1cm}k\hspace{0.1cm}$ categorias tal que su recorrido (campo de variación) es $\hspace{0.1cm}\Gamma( X_j) = \lbrace g_1, g_2 , ..., g_k \rbrace$ ;


La recodficación a formato estándar de  $\hspace{0.1cm}X_j\hspace{0.1cm}$ consiste en obtener una nueva variable $\hspace{0.1cm}X_j^{recod}\hspace{0.1cm}$ definida como :

$$x_{ij}^{recod} =  \left\lbrace\begin{array}{l} 0 \hspace{0.3cm} ,  \text{ si} \hspace{0.2cm} x_{ij} = g_1 \\ 
1 \hspace{0.3cm} , \hspace{0.15cm} \text{si} \hspace{0.2cm} x_{ij} = g_2 \\
... \\ 
k-1  \hspace{0.3cm}  ,\text{ si} \hspace{0.2cm} x_{ij} = g_1 \end{array}\right.
$$


**Observación :**

$\hspace{0.1cm}\Gamma( X_j^{recod}) = \lbrace 0,1,..., k-1 \rbrace$ 





<br>


# Categorización de variables cuantitativas

Dada una muestra de una variable estadistica cuantitativa $\hspace{0.1cm}X_j=(x_{1j},...,x_{nj})^t\hspace{0.1cm}$ ;


La categorización de $X_j$ consisiste en obtener una nueva variable $X_j^{cat}$ definida como:


$$x_{ij}^{cat} =  \left\lbrace\begin{array}{l} 0 \hspace{0.3cm} ,  \text{ si} \hspace{0.2cm} x_{ij} \in [L_0 , L_1) \\ 
1 \hspace{0.3cm} , \hspace{0.15cm} \text{si} \hspace{0.2cm} x_{ij} \in [L_1 , L_2)  \\
... \\ 
k-1  \hspace{0.3cm}  ,\text{ si} \hspace{0.2cm} x_{ij} \in [L_{k-1} , L_k) \end{array}\right.
$$



donde:

$[L_0 , L_1), [L_1 , L_2), \dots , [L_{k-1} , L_k)$ son denominados intervalos de categorizacioón de $X_j$ , y son una serie de intervalos con las siguientes propiedades:

- Son disjuntos dos a dos, es decir, no comparten elementos.

- Cada observacion de la muestra $X_j$ pertenece a un intervalo.

- Tienen la misma amplitud.


Como consecuencia:

- Cada elemento de $X_j$ pertenece a un único intervalo.


The categorized version of a quantitative variable $X_k$ is another
variable $X_k^{cat}$ that is categorical, and that takes values ​​depending on
the observations of $X_k$.


The idea is the following:

Given a quantitative variable $X_k$ ,

You have to define the **categorization intervals** of $X_k$, which are a series of intervals
$[L_{1},L_{2}), [L_{2}, L_{3}),..., [L_{\lambda},L_{\lambda+1})$ , such that:

- They are disjoint two by two (they don't share elements).

- Each observation/value of $X_k$ belongs to some interval.

- They have the same amplitude (same size).


Once the categorization intervals of $X_k$ have been defined, the following rule is applied to define $X_k^{cat}$

$$
x^{cat}_{ik} = \left\lbrace\begin{array}{l} 0, \text{ if $x_{ik} \in [L_{1},L_{2})$} \\ 1, \text{ if $x_{ik} \in [L_{2},L_{3}) $}
\\ ...
\\ \lambda, \text{ if $x_{ik} \in [L_{\lambda},L_{\lambda+1}) $} \end{array}\right.
$$


Definitely:

$$
x_{ik} \in [L_{r}, L_{r+1}] \ \Leftrightarrow \ x_{ik}^{cat} = r-1
$$

for  $\hspace{0.1cm} r=1,...,\lambda > 0$



Where:

$[L_{r}, L_{r+1}]$ is the $r$-th interval of the categorization intervals of $X_k$


There are different rules to define the categorization intervals
of a quantitative variable. In this paper we will see the rules of the
median, mean, quartiles and Scott.



**Observaciones :**

$X^{cat}_j\hspace{0.1cm}$ es la versión categorica de la variable cuantitativa $\hspace{0.1cm}X_j$



<br>

# Dummificación de variables categoricas



