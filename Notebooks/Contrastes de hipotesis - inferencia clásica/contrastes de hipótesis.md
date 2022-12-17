---
title: 'Introducción a los contrastes de hipótesis'
author: 'Fabio Scielzo Ortiz'
date: '25/12/22'
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


$\hspace{0.3cm}$ **Si utilizas este artículo, cítalo !!**

$\hspace{0.5cm}$ Scielzo Ortiz, F. (2022). Introducción a los contrastes de hipótesis. link.

</p>
 
</p></span>
</div>


***Se recomienda abrir el artículo en un ordenador o en una tablet.***
 
 
<br>


<br>




# Metodología de los contrastes de hipótesis <a class="anchor" id="1"></a>


## Hipótesis estadística


Una hipótesis estadística es una afirmación respecto a una
característica de una o varias variables estadisticas medidas sobre una población.

Esta hipótesis puede ser cierta o no. La mejor manera de averiguar si
una hipótesis es cierta o no sería examinar toda la población. Como en
general esto no es factible, se toma una muestra aleatoria de la
población y se realiza un contraste de hipótesis.




**Ejemplos:**

- La edad media de la población humana es de más de 40 años.

- En la poblacion de los leones, menos del 50% son hembras.

- Menos de un 2% de los hombres tiene los ojos verdes.

- La proporción de aprobados en selectividad por parte de alumnos de
centros privados es menor que en el caso de los alumnos de centros
públicos.



<br>

## Contraste o test de hipótesis



Un contraste de hipótesis es un procedimiento formal para rechazar o no una hipótesis estadística planteada sobre una variable a nivel poblacional, utilizando para
ello información de la variable a nivel muestral.


Se aceptará una hipótesis estadística cuando dicha hipotesis se cumpla a nivel muestral de una manera significativa, es decir, no vale con que se cumpla estrictamente, sino que tiene que cumplirse de un modo lo suficientemente notable. Este punto es clave en los contrastes de hipótesis en particular, y en la inferencia estadística en general.

Cuanto mayor sea la evidencia muestral (evidencia en los datos) a favor de una hipótesis estadística, mas "fácil" será aceptar dicha hipótesis a nivel población. Y cuanto menor sea la evidencia muestral, más "dificil" será aceptar la hipoteisis a nivel poblacional.



La hipoteis a contrastar puede ser referente a una variable medida en una población, o varias variables medidas en la misma población, o varias variables medidas en distintas poblaciones, o una variable medida en distintas poblaciones.


<br>

## Hipotesis Nula y Alternativa



La hipótesis nula, $H_0$, es la hipótesis por defecto.

-   $H_0$ se mantiene, a no ser que los datos indiquen su falsedad.

-   $H_0$ nunca se considera probada.

-   $H_0$ se rechaza si la muestra de datos proporciona suficiente
    evidencia de que es falsa.

La hipótesis alternativa, $H_1$, es habitualmente la que el investigador
quiere demostrar como cierta.

-   Cuando se rechaza $H_0$, se admite que $H_1$ es cierta.

-   Si no se especifica $H_1$ de manera explícita, se considera definida
    implícitamente como la negacion de $H_0$

En un contraste de hipótesis no se trata de juzgar cuál de las dos
hipótesis, $H_0$ ó $H_1$, es más verosímil, sino de decidir si la
muestra proporciona o no suficiente evidencia como para rechazar $H_0$
en favor de $H_1$. Y cuando se rechaza $H_0$, se admite que $H_1$ es
cierta.


<br>

## Tipos de contrastes de hipotesis



Un contraste de hipótesis puede ser:

1.  Relativo a una única variable estadistica $X_k$, de la que se tiene
    una muestra.

-   Relativo a más de una variable, por ejemplo:

    -   Dos variables independientes, $X_k$ e $X_r$ , de las que se
        tienen dos muestras.

    -   Una variable bivariante, $(X_k , X_r)$, de la que se tiene una
        muestra pareada

2.  Paramétrico: Se asume un modelo paramétrico sobre la distribucion de
    la variable, por ejemplo, se asume que $X_k \sim N(\mu , \sigma )$

3.  No paramétrico: No se asume ningún modelo paramétrico sobre la
    distribución de la variable.


<br>

## Errores de tipo I y de tipo II


Para cualquier decisión que se tome, hay cuatro posibilidades:

|  Condición ---\>  |  $H_0$ es cierta   |   $H_0$ es falsa    |
|:-----------------:|:------------------:|:-------------------:|
|  Rechazar $H_0$   | ***Error Tipo I*** |  Decision Correcta  |
| No Rechazar $H_0$ | Decisión Correcta  | ***Error Tipo II*** |

Lo ideal sería encontrar un test que hiciese mínima las probabilidades
de ambos errores. Sin embargo, esto no es posible, ya que la reducción
de la probabilidad de un tipo de error hace que aumente la probabilidad
del otro tipo de error.

Como se considera que el error más grave es el de tipo I, se le impondrá
una cota, $\alpha$, llamada nivel de significación, (normalmente 0.05 ó
0.01):



\begin{equation*}
P(Rechazar \ H_0  \mid H_0 \ cierta) = Pr(Error \  tipo \ I) \ \leq \ \alpha
\end{equation*}


<br>

## Potencia de un contraste


La probabilidad de cometer un error de tipo II es:

\begin{equation*}
\beta=P( Error \ Tipo \ II ) = P ( No \ Rechazar \ H_0 \mid H_0
falsa )
\end{equation*}

La potencia de un contraste es la probabilidad de NO cometer un error de
tipo II:

\begin{equation*}
Potencia = P( No \ Error \ Tipo \ II) = 1 - \beta  = P(Rechazar \ H_0 \mid H_0 \ falsa)
\end{equation*}



-   La potencia de un contraste disminuye cuando $\alpha$ disminuye.

     -    Si \ $\downarrow \alpha \ \Rightarrow \ \uparrow \beta               \  \Rightarrow \ \downarrow 1 - \beta$
  
  

-   La **potencia** de un contraste **aumenta** cuanto **mayor** es el **tamaño de la muestra**. 

-   La **potencia** de un contraste **aumenta** cuanto **mayor** es la **diferencia** entre **$H_0$** y la **realidad**. 
    
<br>

## Metodología del contraste



- Es necesario desarrollar una **regla de decisión** para rechazar $H_0$ 



- Las reglas de decisión se se basan en un **estadistico de contraste**, que es una medida de discrepancia entre los datos observados y $H_0$ , de modo que cuando la discrepancia sea suficiente grande se rechace $H_0$ en favor de $H_1$. También tienen en cuenta el nivel de significación $\alpha$ fijado.

- La regla de decisión tiene que ser tal que $P( Rechazar \ H_0 | H_0 ) \leq \alpha$ 

     - Por tanto, es necesario conocer $P( Rechazar \ H_0 | H_0 )$ , y para ello se necesitará conocer la distribucion de probabilidad del estadistico del contraste.



Los pasos para resolver un contraste de hipótesis son: 

1. Plantear las hipótesis nula, $H_0$, y alternativa, $H_1$. 

2. Definir un estadístico de contraste cuya distribución sea conocida cuando $H_0$ es cierta. 

3. Fijar un nivel de significación, $\alpha$, (normalmente 0.05 ó 0.01) y determinar la regla de decisión. 

4. Tomar una muestra de datos y calcular el valor del estadístico de contraste. Luego aplicar la regla de decisión.

<br>

## p-valor



El p-valor es la probabilidad de encontrar una
discrepancia entre $H_0$ y $H_1$  mayor o igual que la observada en los datos, bajo el supuesto de que $H_0$ es cierta. 




$pvalor=P($Observar igual o mas evidencia a favor de $H_1$ de la ya observada en la muestra | $H_0$ cierta$)$



- El p-valor no se fija a priori, sino que depende de los datos.

- Usando el p-valor como regla de decisión se puede resolver el contraste para cualquier $\alpha$:  

  - Si \ $pvalor < \alpha$ \ $\Rightarrow$ \ $Rechazar$ $H_0$
      
  - Si \ $pvalor \geq  \alpha$  \ $\Rightarrow$ \ $No \ Rechazar$ $H_0$
       
       
- El p-valor es el  menor nivel de significación  para el que se puede rechazar $H_0$ , para la evidencia disponible.

- El p-valor se puede interpretar como una medida de la evidencia a favor de $H_1$.




**Intuición del p-valor**

Si el pvalor es muy alto, entonces bajo $H_0$ es muy probable observar una evidencia igual o mayor a la que ya se ha observado a favor de $H_1$. Luego, se ha observado un suceso que es "normal" bajo $H_0$, lo cual no da indicios en contra de $H_0$. 

Si el pvalor es muy bajo, entonces bajo $H_0$ es muy poco probable observar una evidencia igual o mayor a la que ya se ha observado a favor de $H_1$. Luego, se ha observado un suceso que es muy "raro" bajo $H_0$, lo cual indicaria que $H_0$ no ha ocurrido (indicios contra $H_0$). 




Los **pasos para resolver un contraste de hipótesis utilizando el p-valor** son:

1. Plantear la hipótesis nula, $H_0$, y alternativa, $H_1$. 

2. Definir un estadístico de contraste cuya distribución sea conocida si $H_0$ es cierta. 

3. Fijar un nivel de significación $\alpha$ 

4. Calcular el p-valor. Si este es suficientemente pequeño (menor que $\alpha$), rechazar $H_0$.







<br>

<br>



# Contraste de ---

## Contraste


## Estadistico del contraste

## Regla de decisión

## Contraste en `Python`
















































