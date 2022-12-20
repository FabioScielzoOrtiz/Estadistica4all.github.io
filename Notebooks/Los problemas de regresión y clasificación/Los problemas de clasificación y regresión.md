---
title: 'Los problemas de regresión y clasificación'
author: 'Fabio Scielzo Ortiz'
date: '20/12/22'
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


$\hspace{0.3cm}$ **Si utilizas este artículo, por favor, cítalo:** $\hspace{0.1cm}$ [Fabio Scielzo Ortiz](http://estadistica4all.com/autores/autores.html)

</p>
 
</p></span>
</div>


***Se recomienda abrir el artículo en un ordenador o en una tablet.***
 
 
<br>



Podríamos decir que la ciencia de datos es la ciencia que trata de resolver problemas prácticos usando datos como materia prima, y técnicas estadístico-matemáticas y tecnologías informáticas como herramientas auxiliares.

Dos de los problemas más relevantes que intenta resolver la ciencia de datos son los de **regresión** y **clasificación**.

A continuación vamos a hacer un breve planteamiento teorico de estos problemas.


 
<br>
 
# Problema de regresión


Un problema de **regresión**  es un problema estadístico que consiste en predecir una variable respuesta **cuantitativa** usando para ello **información**  de unas **variables predictoras** y de la propia variable **respuesta**.

 
<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>

- Tenemos $\hspace{0.1cm} p\hspace{0.1cm}$ predictores $\hspace{0.1cm}(\mathcal{X}_1 ,...,\mathcal{X}_p)\hspace{0.1cm}$ y una respuesta **cuantitativa** $\hspace{0.1cm}\mathcal{Y} \\$



- Tenemos una **muestra** de tamaño $\hspace{0.1cm}n\hspace{0.1cm}$ de los $\hspace{0.1cm}p\hspace{0.1cm}$ predictores $\hspace{0.1cm}X_1,...,X_p\hspace{0.1cm}$ y de la respuesta  $\hspace{0.1cm}Y \\$

$$D=[X_1,...,X_p,Y]=\begin{pmatrix}
    x_{11}&x_{12}&...&x_{1p}& y_1\\
    x_{21}&x_{22}&...&x_{2p} & y_2\\
    ... &...& ...& .... & ...\\
    x_{n1}&x_{n2}&...&x_{np}& y_n
    \end{pmatrix} = \begin{pmatrix}
    x_{1}& y_1\\
    x_{2}& y_2 \\
     ...&... \\
     x_{n} & y_n
    \end{pmatrix} \\[1.5cm]$$



- La solución estadística al problema de regresión pasa por proponer un modelo o algoritmo que sea capaz de usar la información muestral disponible $\hspace{0.1cm}D\hspace{0.1cm}$ de los predictores y la respuesta para predecir los valores de la respuesta para cada vector de observaciones de los predictores que se considere.


</p>
 
</p></span>
</div>

<br>


# Problema de clasificación supervisada



Un problema de **clasificación supervisada**  es un problema estadistico que consiste en predecir una variable respuesta **categorica** usando para ello **información**   de unas **variables predictoras** y de la propia variable **respuesta**.


<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>

- Tenemos $\hspace{0.1cm}p\hspace{0.1cm}$ predictores  $\hspace{0.1cm}(\mathcal{X}_1 ,...,\mathcal{X}_p)\hspace{0.1cm}$ y una variable respuesta **categorica** $\hspace{0.1cm}\mathcal{Y}\hspace{0.1cm}$ sobre los que disponemos una muestra de datos.


- Tenemos una **muestra** de tamaño $\hspace{0.1cm}n\hspace{0.1cm}$ de los $\hspace{0.1cm}p\hspace{0.1cm}$ **predictores** $\hspace{0.1cm}X_1,...,X_p\hspace{0.1cm}$  y de la **respuesta**.

$\hspace{0.25cm}$ Por tanto tenemos la siguiente matriz de datos: $\\[0.8cm]$

$$D=[X_1,...,X_p, Y]=\begin{pmatrix}
    x_{11}&x_{12}&...&x_{1p}&y_1 \\
    x_{21}&x_{22}&...&x_{2p}&y_2 \\
    ... &...& ...&...&...\\
    x_{n1}&x_{n2}&...&x_{np}&y_n
    \end{pmatrix} = \begin{pmatrix}
    x_{1} & y_1\\
    x_{2}  & y_2\\
     ... & ...\\
     x_{n} & y_n
    \end{pmatrix} \\[1.5cm]$$
    


- La solución estadística al problema de regresión pasa por proponer un modelo o algoritmo que sea capaz usar la información muestral disponible $\hspace{0.1cm}D\hspace{0.1cm}$ de los predictores y la respuesta para predecir los valores de la respuesta para cada vector de observaciones de los predictores que se considere.
 


</p>
 
</p></span>
</div>


<br>



# Problema de clasificación no supervisada




Un problema de clasificación no supervisada  es un problema estadístico que consiste en predecir una variable respuesta **categorica** usando para ello **informacion** exclusivamente de unas **variables predictoras**, puesto que **no se tienen datos sobre la respuesta** (esta es la diferencia entre la clasificación no supervisada y la supervisada). 

A los problemas de clasificación no supervisada tambien se les conoce como problemas de **clustering**.$\\[1cm]$

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>

- Tenemos $\hspace{0.1cm}p\hspace{0.1cm}$ predictores  $\hspace{0.1cm}(\mathcal{X}_1 ,...,\mathcal{X}_p)\hspace{0.1cm}$ y una variable respuesta **categorica** $\hspace{0.1cm}\mathcal{Y}\hspace{0.1cm}$ sobre la que **no disponemos ninguna muestra de datos**.


- Tenemos una **muestra** de tamaño $\hspace{0.1cm}n\hspace{0.1cm}$ de los $\hspace{0.1cm}p\hspace{0.1cm}$ **predictores** $\hspace{0.1cm}X_1,...,X_p\hspace{0.1cm}$  pero **no tenemos muestra de la respuesta** (elemento diferencial de la clasificación no supervisada), tampoco conocemos su recorrido, es decir, las categorias que la definen.

$\hspace{0.25cm}$ Por tanto tenemos la siguiente matriz de datos: $\\[0.8cm]$

$$D=[X_1,...,X_p]=\begin{pmatrix}
    x_{11}&x_{12}&...&x_{1p} \\
    x_{21}&x_{22}&...&x_{2p} \\
    ... &...& ...&...\\
    x_{n1}&x_{n2}&...&x_{np}
    \end{pmatrix} = \begin{pmatrix}
    x_{1} \\
    x_{2}  \\
     ...\\
     x_{n} 
    \end{pmatrix}\\[1.5cm]$$
    

 

- La solución estadística al problema de regresión pasa por proponer un modelo o algoritmo que sea capaz usar la información muestral disponible $\hspace{0.1cm}D\hspace{0.1cm}$ de los predictores para predecir los valores de la respuesta para cada vector de observaciones de los predictores que se considere.
 
</p>
 
</p></span>
</div>

<br>


# Clasificacion semi-supervisada



  Un problema de clasificación no supervisada  es un problema estadistico que consiste en predecir una variable respuesta **categorica** usando para ello **información** de unas **variables predictoras** y de la propia **respuesta**, pero en este caso la **muestra de la que disponemos sobre la respuesta contiene mucho valores faltantes**.

 
<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>

- Tenemos $\hspace{0.1cm}p\hspace{0.1cm}$ predictores  $\hspace{0.1cm}(\mathcal{X}_1 ,...,\mathcal{X}_p)\hspace{0.1cm}$ y una variable respuesta **categorica** $\hspace{0.1cm}\mathcal{Y}\hspace{0.1cm}$ sobre la que disponemos ninguna muestra de datos con bastantes valores faltantes.


- Tenemos una muestra de tamaño $\hspace{0.1cm}n\hspace{0.1cm}$ de los $\hspace{0.1cm}p\hspace{0.1cm}$ predictores $\hspace{0.1cm}\mathcal{X}_1,...,\mathcal{X}_p\hspace{0.1cm}$ y de la respuesta $\mathcal{\hspace{0.1cm}Y\hspace{0.1cm}}$ , pero la muestra de la respuesta contiene muchos valores faltantes. 


$\hspace{0.25cm}$ Por tanto tenemos la siguiente matriz de datos: $\\[0.8cm]$

$$D=[X_1,...,X_p]=\begin{pmatrix}
    x_{11}&x_{12}&...&x_{1p} & y_1\\
    x_{21}&x_{22}&...&x_{2p} & y_2\\
    ... &...& ...&...& ...\\
    x_{n1}&x_{n2}&...&x_{np} & y_n
    \end{pmatrix} = \begin{pmatrix}
    x_{1} & y_1\\
    x_{2} & y_2 \\
     ... & ...\\
     x_{n} & y_n
    \end{pmatrix}\\[1.5cm]$$
    
$\hspace{1cm}$ Donde: $\hspace{0.1cm}y_i = NA\hspace{0.1cm}$ , para muchos $\hspace{0.1cm}i\in \lbrace 1,...,n\rbrace \\$
 

- La solución estadística al problema de clasificación semi-supervisada pasa por proponer un modelo o algoritmo que sea capaz usar la información muestral disponible $\hspace{0.1cm}D\hspace{0.1cm}$ de los predictores y de la respuesta para predecir los valores de la respuesta para cada vector de observaciones de los predictores que se considere.

</p>
 
</p></span>
</div>


<br>

# ¿ Regresión no supervisada ?

Es fácil extrapolar el problema de clasificación no supervisada al caso de regresión, solo hay que modificar la condición de que la respuesta es categórica a que es cuantitativa.

No presentamos teóricamente este problema puesto que no tiene soluciones estandarizadas, como si lo tienen los otros problemas aquí presentados, debido a su mayor complejidad. 
















