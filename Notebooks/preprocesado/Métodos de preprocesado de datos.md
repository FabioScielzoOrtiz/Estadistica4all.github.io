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

En este artículo nos centraremos en tres tipos de escalado: escalado estandar, normalización (0,1) y normalización (a,b). En cualquier caso, hay mas procedimientos que aquí no será explorados, por lo que para ver una lista más amplia se recomienda, por ejemplo, ver la documentación sobre este tema de la libreria   [sklearn](https://scikit-learn.org/stable/modules/preprocessing.html)


<br>

## Escalado estandar


 
Dada la variable estadística $\hspace{0.1cm} X_j=(x_{1j},...,x_{nj})^t$

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

Dada la variable estadística $\hspace{0.1cm} X_j=(x_{1j},...,x_{nj})^t$

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


Dada la variable estadística $\hspace{0.1cm}X_j=(x_{1j},...,x_{nj})^t$

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






# Recodificación estandar de variables categoricas




# Categorización de variables cuantitativas



# Dummificación de variables categoricas



