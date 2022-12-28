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

Este algoritmo usa a su vez algoritmos y métricas de validación, por ello es altamente recomendable leer el articulo que tenemos en el blog sobre [algoritmos de validacion de modelos de aprendizaje supervisado](). Además también está en camino un articulo sobre algoritmos de validación de modelos de aprendizaje no supervisado,
 

<br>

# Grid search


Tenemos un modelo de aprendizaje estadístico $\hspace{0.1cm} M \hspace{0.1cm}$, el cual tiene $\hspace{0.1cm}r\hspace{0.1cm}$ hiper-parametros $\hspace{0.1cm}h_1,...,h_r\hspace{0.1cm}$, cuyos campos de variancion son $\hspace{0.1cm}R(h_1),...,R(h_r)\hspace{0.1cm}$, respectivamente. 

Usaremos la notación $\hspace{0.1cm}M(h) = M(h_1,...,h_r)\hspace{0.1cm}$ para hacer explicitos los hiper-parametros del modelo. Donde $\hspace{0.1cm}h=(h_1,...,h_r)\hspace{0.1cm}$ es el vector de hiper-parametros del modelo. 

Se define el espacion de busqueda $\hspace{0.1cm}S\hspace{0.1cm}$ como un subconjunto del conjunto de posibles combinaciones de valores de los hiper-parametros:


$$S \hspace{0.1cm} \subseteq \hspace{0.1cm} R(h_1)\hspace{0.1cm}\text{x}...\text{x}\hspace{0.1cm}R(h_r)$$

<br>


El algortimo grid search tienen los siguientes pasos:



<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>


- Para cada $\hspace{0.1cm}s=(s_1,...,s_r)\hspace{0.1cm} \in \hspace{0.1cm} S$

    - Se valida $M(h=s)\hspace{0.05cm}=\hspace{0.05cm}M(h_1=s_1,...,h_r=s_r)\hspace{0.15cm}$ usando algún **algoritmo de validación** de modelos de aprendizaje estadístico. Con ello se obtiene un valor de una **métrica de validacion** para la combinacion de hiper-parametros $\hspace{0.1cm} s=(s_1,...,s_r)\\$


- Tras el paso anterior se obtienen $\hspace{0.15cm}\#\hspace{0.05cm} S\hspace{0.15cm}$ valores de la metrica de validacion calculada aplicando cierto algoritmo de validación.

    - Si, por ejemplo, la métrica usada fuera el $\hspace{0.1cm}ECM\hspace{0.1cm}$, entonces se obtienen:
    
    $$\left\lbrace \hspace{0.1cm} ECM(\hspace{0.05cm}M(h=s)\hspace{0.05cm})_{test}^* \hspace{0.15cm} / \hspace{0.15cm}  s\in S \hspace{0.1cm} \right\rbrace\\$$




- Se selecciona el vector de hiper-parametros $\hspace{0.1cm}s=(s_1,...,s_r) \in S\hspace{0.1cm}$ con el que se obtiene un mejor valor de la métrica de validacion. Si la metrica es de error, se selecciona el $\hspace{0.1cm}s\hspace{0.1cm}$ con el que se obtiene menor valor de la metrica. Si la metrica es de acierto, se seleciona el $\hspace{0.1cm}s\hspace{0.1cm}$ con el que se obtiene mayor valor de la metrica. $\\[0.5cm]$

    - Si, por ejemplo,  la métrica usado fuera el $\hspace{0.1cm}ECM\hspace{0.1cm}$, que es una métrica de error, entonces el vector de hiper-parámetros seleccionado seria $\hspace{0.1cm}s^*\hspace{0.1cm}$, donde:
 
    $$s^* \hspace{0.2cm}=\hspace{0.2cm} arg\hspace{0.25cm} \underset{s \in S}{Min}\hspace{0.25cm} ECM( \hspace{0.05cm} M(h=s) \hspace{0.05cm} )_{test}^* \\$$

    - Si, por ejemplo, la métrica usado fuera la $\hspace{0.1cm}TA\hspace{0.1cm}$, que es una métrica de acierto, entonces el vector de hiper-parámetros seleccionado seria $\hspace{0.1cm}s^*\hspace{0.1cm}$, donde:
 
    $$s^* \hspace{0.2cm}=\hspace{0.2cm} arg\hspace{0.25cm} \underset{s \in S}{Max}\hspace{0.25cm} TA\left( \hspace{0.05cm} M(h=s) \hspace{0.05cm}\right)_{test}^*$$


</p>
 
</p></span>
</div>


<br>

**¿ Cómo definir $\hspace{0.1cm}S\hspace{0.1cm}$ ?**

Lo ideal es que $\hspace{0.1cm}S \hspace{0.1cm} = \hspace{0.1cm} R(h_1)\hspace{0.1cm}\text{x}...\text{x}\hspace{0.1cm}R(h_r)\hspace{0.1cm}$, pero cuando el numero de hiper-parametros es demasiado alto, o estos tienen campos de variacion grandes, esto no es factible en la practica. Por ello se suelen seguir dos vías más eficientes:

- Se toma $\hspace{0.1cm}S\hspace{0.1cm}$ como un subconjunto estricto de  las posibles combinaciones de hiper-parametros , es decir, $\hspace{0.1cm}S \hspace{0.1cm} \subset \hspace{0.1cm} R(h_1)\hspace{0.1cm}\text{x}...\text{x}\hspace{0.1cm}R(h_r)$

La definición de $\hspace{0.1cm}S\hspace{0.1cm}$ en este contexto puede ser determinista, el usuario define las combinaciones de hiper-parametros que se van a considetar. O bien aleatoria, es decir, se escogen aleatoriamente las combinaciones de hiper-parametros que definirán a $\hspace{0.1cm}S\hspace{0.1cm}$

Si la definición de $\hspace{0.1cm}S\hspace{0.1cm}$ es aleatoria, el algoritmo suele denominarse random grid search, o simplemente random search.

<br>

<br>


# Grid search programado en `Python` <a class="anchor" id="1"></a>  






<br>

<br>

# Bibliografia

- Aler Mur, Ricardo. (2022). *Metodología: evaluación de modelos.* [Presentación de PowerPoint]. Aula Global UC3M.
 
 
 
<br> 
 
 
 
 
 
