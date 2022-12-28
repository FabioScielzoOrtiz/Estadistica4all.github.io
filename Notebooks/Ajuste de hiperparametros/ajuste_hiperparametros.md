---
title: 'Ajuste de hiper-parametros'
author: 'Fabio Scielzo Ortiz'
date: '4/1/23'
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

$\hspace{0.3cm}$ **Si utilizas este artículo, por favor, cítalo:** 

$\hspace{0.5cm}$ Scielzo Ortiz, F. (2022). El algoritmo KNN. [Link](http://estadistica4all.com/Articulos/KNN.html)


</p>
 
</p></span>
</div>


***Se recomienda abrir el artículo en un ordenador o en una tablet.***
 
 
 
 
 <br>
 
 
 
En un modelos de aprendizaje estadistico un hiper-parametro es un parametro del modelo que no es estimado por el modelo cuando este es entrenado. Es un parametro al que hay que asignarle un valor a priori del entrenamiento del modelo. 
 
Los algoritmos de ajuste de hiper-parametros son una familia de algoritmos cuyo proposito es seleccionar un valor óptimo para los hiper-parametros de un modelo dado.

En este artículo nos centraremos en el algoritmo Grid Search (busqueda en rejilla o cuadricula).
 

<br>

# Grid search


Tenemos un modelo de aprendizaje estadístico $M$, el cual tiene $r$ hiper-parametros $h_1,...,h_r$, cuyos campos de variancion son $R(h_1),...,R(h_r)$, respectivamente. 

Usaremos la notación $M(h) = M(h_1,...,h_r)$ para hacer explicitos los hiper-parametros del modelo. Donde $h=(h_1,...,h_r)$ es el vector de hiper-parametros del modelo. 

Se define el espacion de busqueda $S$ como un subconjunto del conjunto de posibles combinaciones de valores de los hiper-parametros:


$$S \subset R(h_1)x...xR(h_r)$$


El algortimo grid search tienen los siguientes pasos:


- Para cada $s=(s_1,...,s_r) \in S$

    - Se valida $M(h=s)=M(h_1=s_1,...,h_r=s_r)$ usando algún algoritmo de validación de modelos de aprendizaje estadístico. Con ello se obtiene un valor de una métrica de validacion para la combinacion de hiper-parametros $s=(s_1,...,s_r)$. 


- Tras el paso anterior se obtienen $\# S$ valores de la metrica de validacion calculada aplicando cierto algoritmo de validación.+

    Si la métrica usada fuera el $ECM$, entonces se obtienen:
    
    $$\lbrace ECM(M(h=s))_{test}^*  / s\in S \rbrace$$




- Se selecciona el vector de hiper-parametros $s=(s_1,...,s_r) \in S$ con el que se obtiene un mejor valor de la métrica de validacion. Si la metrica es de error, se selecciona el $s$ con el que se obtiene menor valor de la metrica. Si la metrica es de acierto, se seleciona el $s$ con el que se obtiene mayor valor de la metrica.

 Si la metrica usado fuera el $ECM$, que es una metrica de error, entonces el vector de hiper-parametros seleccionado seria $s^*$, donde:
 
 $$s^* = arg \underset{s \in S}{Min} ECM(M(h=s))_{test}^*$$

 Si la metrica usado fuera la $TA$, que es una métrica de acierto, entonces el vector de hiper-parametros seleccionado seria $s^*$, donde:
 
 $$s^* = arg \underset{s \in S}{Max} TA(M(h=s))_{test}^*$$


<br>

# Random grid search
 
 
 
 
 
 
 
 
 
 
 
 
