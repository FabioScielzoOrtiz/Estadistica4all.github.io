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



La hipótesis nula, $\hspace{0.1cm} H_0 \hspace{0.1cm}$, es la hipótesis por defecto.

-   $H_0\hspace{0.1cm}$ se mantiene, a no ser que los datos indiquen su falsedad.

-   $H_0\hspace{0.1cm}$ nunca se considera probada.

-   $H_0\hspace{0.1cm}$ se rechaza si la muestra de datos proporciona suficiente
    evidencia de que es falsa.

La hipótesis alternativa, $\hspace{0.1cm}H_1\hspace{0.1cm}$, es habitualmente la que el investigador
quiere demostrar como cierta.

-   Cuando se rechaza $\hspace{0.1cm}H_0\hspace{0.1cm}$, se acepta que $\hspace{0.1cm}H_1\hspace{0.1cm}$ es cierta.

-   Si no se especifica $\hspace{0.1cm}H_1\hspace{0.1cm}$ de manera explícita, se considera definida
    implícitamente como la negacion de $\hspace{0.1cm}H_0$

> En un contraste de hipótesis no se trata de juzgar cuál de las dos
hipótesis, $\hspace{0.1cm}H_0\hspace{0.1cm}$ ó $\hspace{0.1cm}H_1\hspace{0.1cm}$, es más verosímil, sino de decidir si la
muestra proporciona o no suficiente evidencia como para rechazar $\hspace{0.1cm}H_0\hspace{0.1cm}$
en favor de $\hspace{0.1cm}H_1\hspace{0.1cm}$. Y cuando se rechaza $\hspace{0.1cm}H_0\hspace{0.1cm}$, se admite que $\hspace{0.1cm}H_1\hspace{0.1cm}$ es
cierta.


<br>

## Tipos de contrastes de hipotesis


Un contraste de hipótesis puede ser:

-  Relativo a **una única variable** estadistica $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$, de la que se tiene  una muestra $\hspace{0.1cm} X=(x_1,...,x_n)$ $\\[0.5cm]$

-   Relativo a **más de una variable** estadística, por ejemplo:

    -   Dos variables **independientes**, $\hspace{0.1cm}\mathcal{X}_1\hspace{0.1cm}$ y $\hspace{0.1cm}\mathcal{X}_2\hspace{0.1cm}$ , de las que se tienen dos muestras $\hspace{0.1cm}X_1=(x_{11},...,x_{n1})\hspace{0.1cm}$ y $\hspace{0.1cm}X_2=(x_{12},...,x_{n2})\\$.

    -   Dos variables **dependientes**, $\hspace{0.1cm}\mathcal{X}_1\hspace{0.1cm}$ y $\hspace{0.1cm}\mathcal{X}_2\hspace{0.1cm}$ , de las que se tienen dos muestras. $\\[0.5cm]$
    
-  **Paramétrico**: Se asume un modelo paramétrico sobre la distribucion de probabilidad de la variable, por ejemplo, se asume que $\hspace{0.1cm}\mathcal{X} \sim N(\mu , \sigma )$ $\\[0.5cm]$

-  **No paramétrico**: No se asume ningún modelo paramétrico sobre la
    distribución de la variable. $\\[0.5cm]$
    
- Basado en métodos de **remuestreo**: ejemplos de este tipo de contrastes son los basados en  bootstrap y los basados en permutaciones.


<br>



## Errores de tipo I y de tipo II


Para cualquier decisión que se tome, hay cuatro posibilidades:

 
|                   |  $H_0$ es cierta   |   $H_0$ es falsa    |
|:-----------------:|:------------------:|:-------------------:|
|  Rechazar $H_0$   | **Error Tipo I** |  Decision Correcta  |
| No Rechazar $H_0$ | Decisión Correcta  | **Error Tipo II** |



Lo ideal sería encontrar un test que hiciese mínima las probabilidades
de ambos errores. Sin embargo, esto no es posible, ya que la reducción
de la probabilidad de un tipo de error hace que aumente la probabilidad
del otro tipo de error.

Como se considera que el error más grave es el de tipo I, se le impondrá
una cota, $\alpha$, llamada **nivel de significación**, (normalmente 0.01, 0.05 ó 0.1):



$$
P\left(\hspace{0.1cm}\text{Rechazar} \ H_0  \mid H_0 \ \text{cierta} \hspace{0.1cm}\right) \hspace{0.1cm} = \hspace{0.1cm} P \left(\hspace{0.1cm} \text{Error   tipo  I} \hspace{0.01cm}\right) \ \hspace{0.05cm}\leq\hspace{0.05cm} \ \alpha
$$


<br>

## Potencia de un contraste


La probabilidad de cometer un error de tipo II es:

$$
\beta\hspace{0.1cm}=\hspace{0.1cm}P(\hspace{0.1cm} \text{Error  Tipo  II} \hspace{0.1cm}) \hspace{0.1cm}=\hspace{0.1cm} P (\hspace{0.1cm} \text{No  Rechazar} \ H_0 \mid H_0
\text{falsa} \hspace{0.1cm}) \\
$$

La potencia de un contraste es la probabilidad de NO cometer un error de
tipo II:

$$
\text{Potencia} \hspace{0.1cm}=\hspace{0.1cm} P(\hspace{0.1cm} \text{No Error Tipo  II} \hspace{0.1cm}) \hspace{0.1cm}=\hspace{0.1cm} 1 - \beta  \hspace{0.1cm}=\hspace{0.1cm} P(\hspace{0.1cm} \text{Rechazar} \ H_0 \mid H_0 \ \text{falsa} \hspace{0.1cm}) \\
$$

<br>

**Observaciones:**

-   La potencia de un contraste disminuye cuando $\alpha$ disminuye.

     -    Si  $\hspace{0.2cm}\downarrow \alpha \hspace{0.25cm} \Rightarrow \hspace{0.25cm} \uparrow \beta \hspace{0.25cm}\Rightarrow\hspace{0.25cm}  \downarrow ( 1 - \beta ) \\$
  
  

-   La **potencia** de un contraste **aumenta** cuanto **mayor** es el **tamaño de la muestra**. $\\[0.5cm]$

-   La **potencia** de un contraste **aumenta** cuanto **mayor** es la **diferencia** entre **$\hspace{0.1cm} H_0\hspace{0.1cm}$** y la **realidad**. 
    
    
<br>



## Metodología del contraste



- Es necesario desarrollar una **regla de decisión** para rechazar $\hspace{0.1cm}H_0 \\$ 



- Las reglas de decisión se se basan en un **estadistico de contraste**, que es una medida de discrepancia entre los datos observados y $\hspace{0.1cm}H_0\hspace{0.1cm}$ , de modo que cuando la discrepancia entre los datos y $H_0$ sea grande, y además favorable a $H_1$, se rechace $\hspace{0.1cm}H_0\hspace{0.1cm}$ en favor de $\hspace{0.1cm}H_1.\hspace{0.1cm}$ También tienen en cuenta el nivel de significación $\hspace{0.1cm}\alpha\hspace{0.1cm}$ fijado. $\\[0.5cm]$

- La regla de decisión tiene que ser tal que $\hspace{0.1cm}P(\hspace{0.1cm} \text{Rechazar} \ H_0 \hspace{0.1cm}|\hspace{0.1cm} H_0 \hspace{0.1cm}) \hspace{0.1cm}\leq\hspace{0.1cm} \alpha$ $\\[0.5cm]$

     - Por tanto, es necesario conocer $\hspace{0.1cm}P(\hspace{0.1cm} \text{Rechazar} \ H_0 \hspace{0.1cm}|\hspace{0.1cm} H_0 \hspace{0.1cm})\hspace{0.1cm}$ , y para ello se necesitará conocer la distribucion de probabilidad del estadistico del contraste. $\\[0.5cm]$


<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 5px; border-radius: 2px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>

$\hspace{0.25cm}$ Los pasos para resolver un contraste de hipótesis son los siguientes: 

$\hspace{0.25cm}$ 1. Plantear las hipótesis nula, $\hspace{0.1cm}H_0\hspace{0.1cm}$, y alternativa, $\hspace{0.1cm}H_1\hspace{0.1cm}$   

$\hspace{0.25cm}$ 2. Definir un estadístico de contraste cuya distribución sea conocida cuando $\hspace{0.1cm}H_0\hspace{0.1cm}$ es cierta.  

$\hspace{0.25cm}$ 3. Fijar un nivel de significación, $\hspace{0.1cm}\alpha\hspace{0.1cm}$ y determinar la regla de decisión.  

$\hspace{0.25cm}$ 4. Tomar una muestra de datos y calcular el valor del estadístico de contraste. Luego aplicar la regla de decisión.

</p>
 
</p></span>
</div>

<br>




## p-valor


<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 5px; border-radius: 2px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>

$\hspace{0.25cm}$ El p-valor es la probabilidad de encontrar igual o más evidencia en favor de $\hspace{0.1cm}H_1\hspace{0.1cm}$  que la aportada por la muestra considerada, bajo el supuesto de que $\hspace{0.1cm}H_0\hspace{0.1cm}$ es cierta. 




$\hspace{0.25cm}$ $\text{pvalor} \hspace{0.1cm}=\hspace{0.1cm} P(\hspace{0.1cm}$ Observar igual o mas evidencia a favor de $\hspace{0.1cm}H_1$ de la ya observada en la muestra $\hspace{0.1cm}$|$\hspace{0.1cm}$ $\hspace{0.1cm}H_0\hspace{0.1cm}$ cierta$\hspace{0.1cm})$

</p>
 
</p></span>
</div>



<br>

**Observaciones:**

- El p-valor no se fija a priori, sino que depende de los datos. $\\[0.5cm]$

- Usando el p-valor como regla de decisión se puede resolver el contraste para cualquier $\hspace{0.1cm}\alpha\hspace{0.1cm}$:  

  - Si \ $\hspace{0.1cm}\text{pvalor} < \alpha\hspace{0.1cm}$ \ $\hspace{0.1cm}\Rightarrow\hspace{0.1cm}$ \ $\text{Rechazar}$ $H_0$ $\\[0.5cm]$
      
  - Si \ $\hspace{0.1cm}\text{pvalor} \geq  \alpha\hspace{0.1cm}$  \ $\hspace{0.1cm}\Rightarrow\hspace{0.1cm}$ \ $\text{No  Rechazar}$ $H_0 \\$
       
       
- El p-valor es el  menor nivel de significación  para el que se puede rechazar $\hspace{0.1cm}H_0\hspace{0.1cm}$ en favor de $H_1$ , dada la evidencia aportada por la muestra disponible. $\\[0.5cm]$

- El p-valor se puede interpretar como una medida de la evidencia a favor de $\hspace{0.1cm}H_1\hspace{0.1cm}$. De modo que cuanto menor es el p-valor mayor es la evidencia a favor de $H_1$ $\\[0.5cm]$




**Intuición del p-valor**

Si el pvalor es muy alto, entonces bajo $\hspace{0.1cm}H_0\hspace{0.1cm}$ es muy probable observar una evidencia igual o mayor a la que ya se ha observado a favor de $\hspace{0.1cm}H_1\hspace{0.1cm}$. Luego, se ha observado un suceso que es *normal* bajo $\hspace{0.1cm}H_0\hspace{0.1cm}$, lo cual no da indicios en contra de $\hspace{0.1cm}H_0\hspace{0.1cm}$. 

Si el pvalor es muy bajo, entonces bajo $\hspace{0.1cm}H_0\hspace{0.1cm}$ es muy poco probable observar una evidencia igual o mayor a la que ya se ha observado a favor de $\hspace{0.1cm}H_1\hspace{0.1cm}$. Luego, se ha observado un suceso que es favorable a $\hspace{0.1cm}H_1\hspace{0.1cm}$ y muy *raro* bajo $\hspace{0.1cm}H_0\hspace{0.1cm}$, lo cual indicaría que $\hspace{0.1cm}H_0\hspace{0.1cm}$ es falsa y $\hspace{0.1cm}H_1\hspace{0.1cm}$ cierta.  $\\[0.5cm]$




<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 5px; border-radius: 2px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>

$\hspace{0.25cm}$ Los **pasos para resolver un contraste de hipótesis utilizando el p-valor** son:

$\hspace{0.25cm}$ 1. Plantear la hipótesis nula, $\hspace{0.1cm}H_0\hspace{0.1cm}$, y alternativa, $\hspace{0.1cm}H_1\hspace{0.1cm}$.  

$\hspace{0.25cm}$ 2. Definir un estadístico de contraste cuya distribución sea conocida si $\hspace{0.1cm}H_0\hspace{0.1cm}$ es cierta.  

$\hspace{0.25cm}$ 3. Fijar un nivel de significación $\hspace{0.1cm}\alpha\hspace{0.1cm}$ 

$\hspace{0.25cm}$ 4. Calcular el  $\text{pvalor}$. 

$\hspace{0.25cm}$ 5. Aplicar la siguiente regla de decisión:

 $\hspace{1cm}$  Si \ $\hspace{0.1cm}\text{pvalor} < \alpha\hspace{0.1cm}$ \ $\hspace{0.1cm}\Rightarrow\hspace{0.1cm}$ \ $\text{Rechazar}$ $H_0$
      
  $\hspace{1cm}$   Si \ $\hspace{0.1cm}\text{pvalor} \geq  \alpha\hspace{0.1cm}$  \ $\hspace{0.1cm}\Rightarrow\hspace{0.1cm}$ \ $\text{No  Rechazar}$ $H_0$



</p>
 
</p></span>
</div>





<br>

<br>



# Contraste de medias

## Supuestos

- Tenemos una v.a. $\hspace{0.1cm}\mathcal{X} \sim N(\mu , \sigma)$

- Tenemos una muestra aleatoria simple $\hspace{0.1cm}\mathcal{X}_1,...,\mathcal{X}_n\hspace{0.1cm}$  de la v.a. $\hspace{0.1cm}\mathcal{X} \\$





## Contraste

$$
H_0 : \mu = \mu_0 \\
H_1 : \mu \neq \mu_0
$$

<br>

## Estadistico del contraste

El estadistico de este contraste está basado en el teorema de Gosset, que fue ilustrado en el artículo de [intervalos de confianza](http://estadistica4all.com/Articulos/Intervalos-de-confianza.html#intervalo-de-confianza-para-la-media-con-varianza-desconocida): $\\[0.5cm]$ 

$$
\mathcal{T}_{exp} \hspace{0.1cm}=\hspace{0.1cm} \dfrac{\overline{\mathcal{X}} - \mu}{ \sqrt{\dfrac{n}{n-1} \cdot s_n^2 / n}} \sim t_{n-1} \\
$$


Por tanto, el estadístico del contraste bajo $\hspace{0.1cm} H_0\hspace{0.1cm}$ es: $\\[0.5cm]$

$$
\mathcal{T}_{exp | H_0} \hspace{0.1cm}=\hspace{0.1cm} \dfrac{\overline{\mathcal{X}} - \mu_0}{ \sqrt{\dfrac{n}{n-1} \cdot S_n^2 / n}} \sim t_{n-1} \\
$$


Donde:


- $\overline{\mathcal{X}} \hspace{0.1cm}=\hspace{0.1cm} \dfrac{1}{n} \sum_{i=1}^n \mathcal{X}_i \\$

- $S_n^2 \hspace{0.1cm}=\hspace{0.1cm} \dfrac{1}{n} \sum_{i=1}^n \mathcal{X}_i - \overline{\mathcal{X}}$



<br>


**Observación:**

Dada una muestra de observaciones $\hspace{0.1cm}X=(x_1,...,x_n)\hspace{0.1cm}$ de la variable $\hspace{0.1cm}\mathcal{X} \\$


$$
t_{exp | H_0} = \dfrac{\overline{X} - \mu_0}{ \sqrt{\dfrac{n}{n-1} \cdot S(X)^2 / n}} \\
$$


es una **realización muestral** de la v.a. $\hspace{0.1cm}\mathcal{T}_{exp | H_0} \\$



Donde:


- $\overline{X} \hspace{0.1cm}=\hspace{0.1cm} \dfrac{1}{n} \sum_{i=1}^n x_i \\$

- $S(X)^2 \hspace{0.1cm}=\hspace{0.1cm} \dfrac{1}{n} \sum_{i=1}^n x_i - \overline{X}$


<br>



## p-valor


- Caso  $\hspace{0.15cm}H_0: \mu = \mu_0\hspace{0.15cm}   \text{vs}  \hspace{0.15cm} H_1: \mu > \mu_0 \\$  
  

    $$\text{pvalor} \hspace{0.1cm} =\hspace{0.1cm} P \left( \mathcal{T}_{exp|H_0} \hspace{0.1cm}>\hspace{0.1cm} t_{exp|H_0} \right) \hspace{0.1cm}=\hspace{0.1cm} P \left( t_{n-1} > \dfrac{\overline{X} - \mu_0}{ \sqrt{\dfrac{n}{n-1} \cdot S(X)^2 / n}} \right) \\[2cm]$$ 





- Caso  $\hspace{0.15cm}H_0: \mu = \mu_0\hspace{0.25cm}   \text{vs}  \hspace{0.25cm} H_1: \mu < \mu_0 \\$


    $$\text{pvalor} \hspace{0.1cm} =\hspace{0.1cm} P \left( \mathcal{T}_{exp|H_0} \hspace{0.1cm}>\hspace{0.1cm} t_{exp|H_0} \right) \hspace{0.1cm}=\hspace{0.1cm} P \left( t_{n-1} > \dfrac{\overline{X} - \mu_0}{ \sqrt{\dfrac{n}{n-1} \cdot S(X)^2 / n}} \right) \\[2cm]$$ 



-  Caso $\hspace{0.15cm}H_0: \mu = \mu_0\hspace{0.25cm}   \text{vs}  \hspace{0.25cm} H_1: \mu \neq \mu_0 \\$
  
  
    $$\text{pvalor} \hspace{0.1cm} =\hspace{0.1cm} P \left(  \mathcal{T}_{exp|H_0}  \hspace{0.1cm}>\hspace{0.1cm} | t_{exp|H_0} | \right) + P \left(  \mathcal{T}_{exp|H_0}  \hspace{0.1cm}<\hspace{0.1cm} - | t_{exp|H_0} | \right) \hspace{0.1cm}=\hspace{0.1cm} 
     P \left(  \mathcal{T}_{exp|H_0}  \hspace{0.1cm}>\hspace{0.1cm} | t_{exp|H_0} | \right) + P \left(  \mathcal{T}_{exp|H_0}  \hspace{0.1cm} >\hspace{0.1cm}  | t_{exp|H_0} | \right) \\[1cm]
     \hspace{0.1cm}=\hspace{0.1cm} 
    2 \cdot  P \left(  \mathcal{T}_{exp|H_0}  \hspace{0.1cm}>\hspace{0.1cm} | t_{exp|H_0} | \right)   \hspace{0.1cm}=\hspace{0.1cm} 2 \cdot P \left( t_{n-1} > | \dfrac{\overline{X} - \mu_0}{ \sqrt{\dfrac{n}{n-1} \cdot S(X)^2 / n}} | \right)$$
    
  





<br>

## Regla de decisión


### Basada en el estadistico del contraste


Para un nivel de significación $\hspace{0.1cm} \alpha$ : $\\[0.5cm]$


---

- Caso  $\hspace{0.15cm}H_0: \mu = \mu_0\hspace{0.15cm}   \text{vs}  \hspace{0.15cm}H_1: \mu > \mu_0 \\$


    $$\text{Rechazar} \hspace{0.1cm} H_0  \hspace{0.25cm} \Leftrightarrow \hspace{0.25cm} t_{exp|H_0} \hspace{0.1cm} >\hspace{0.1cm} t_{\alpha}^{n-1} \hspace{0.25cm} \Leftrightarrow \hspace{0.25cm} \dfrac{\overline{X} - \mu_0}{ \sqrt{\dfrac{n}{n-1} \cdot S(X)^2 / n}} \hspace{0.1cm} >\hspace{0.1cm} t_{\alpha}^{n-1} \hspace{0.25cm} \Leftrightarrow \hspace{0.25cm}  \overline{X} \hspace{0.1cm} >\hspace{0.1cm} \mu_0 + t_{\alpha}^{n-1} \cdot \sqrt{\dfrac{n}{n-1} \cdot S(X)^2 / n}$$



    Donde: $\hspace{0.1cm}  \hspace{0.1cm} P(t_{n-1} \hspace{0.1cm} >\hspace{0.1cm}  t_{n-1}^{\alpha})\hspace{0.1cm} =\hspace{0.1cm}  \alpha \\$ 

 
---
 
- Caso  $\hspace{0.15cm}H_0: \mu = \mu_0\hspace{0.25cm}   \text{vs}  \hspace{0.25cm} H_1: \mu < \mu_0 \\$

     $$ \text{Rechazar} \hspace{0.1cm} H_0  \hspace{0.25cm} \Leftrightarrow \hspace{0.25cm} t_{exp|H_0} \hspace{0.1cm} < \hspace{0.1cm} t_{\alpha}^{n-1} \hspace{0.25cm} \Leftrightarrow \hspace{0.25cm} \dfrac{\overline{X} - \mu_0}{ \sqrt{\dfrac{n}{n-1} \cdot S(X)^2 / n}} \hspace{0.1cm} < \hspace{0.1cm} t_{\alpha}^{n-1} \hspace{0.25cm} \Leftrightarrow \hspace{0.25cm}  \overline{X} \hspace{0.1cm} < \hspace{0.1cm} \mu_0 + t_{\alpha}^{n-1} \cdot \sqrt{\dfrac{n}{n-1} \cdot S(X)^2 / n} \\$$

 
---


-  Caso $\hspace{0.15cm}H_0: \mu = \mu_0\hspace{0.25cm}   \text{vs}  \hspace{0.25cm} H_1: \mu \neq \mu_0 \\$




    $$ \text{Rechazar} \hspace{0.1cm} H_0  \hspace{0.25cm} \Leftrightarrow \hspace{0.25cm} t_{exp|H_0} \hspace{0.1cm} > \hspace{0.1cm} t_{\alpha/2}^{n-1}  \hspace{0.2cm} \vee \hspace{0.2cm}    t_{exp|H_0} \hspace{0.1cm} < \hspace{0.1cm} t_{1-\alpha/2}^{n-1}  \hspace{0.25cm} \Leftrightarrow \hspace{0.25cm}  \overline{X} \hspace{0.1cm} > \hspace{0.1cm} \mu_0 + t_{\alpha/2}^{n-1} \cdot \sqrt{\dfrac{n}{n-1} \cdot S(X)^2 / n} \hspace{0.2cm} \vee \hspace{0.2cm}  \overline{X} \hspace{0.1cm} < \hspace{0.1cm} \mu_0 - t_{\alpha/2}^{n-1} \cdot \sqrt{\dfrac{n}{n-1} \cdot S(X)^2 / n}\\$$



    Donde se ha usado la propiedad de simetría de la distribución t-student, por la cual $\hspace{0.2cm}t_{1-\alpha/2}^{n-1} \hspace{0.1cm}=\hspace{0.1cm} - t_{\alpha/2}^{n-1}$


<br>


### Basada en el p-valor









<br>



## Contraste en `Python`










 

\

### p-valor
\

- Caso \  $H_0: \mu = \mu_0$  \ vs \ $H_1: \mu > \mu_0$
  
  \

    - $pvalor=P \left( \underset{  \ v.a. \ \sim \ t_{n-1}}{\underbrace{t_{exp|H_0}}} > \underset{  \ observacion}{\underbrace{t_{exp|H_0}}} \right) = P \left( t_{n-1} > \dfrac{\overline{X_{k,g}} - \mu_0}{S(X_{k,g})/\sqrt{n}} \right)$ 

\

- Caso \ $H_0: \mu = \mu_0$ \ vs  \ $H_1: \mu <  \mu_0$

  \
   - $pvalor=P \left( \underset{  \ v.a. \ \sim \ t_{n-1}}{\underbrace{t_{exp|H_0}}} < \underset{  \ observacion}{\underbrace{t_{exp|H_0}}} \right) = P \left( t_{n-1} < \dfrac{\overline{X_{k,g}} -     \mu_0}{S(X_{k,g})/\sqrt{n}} \right)$ 


\

- Caso $H_0: \mu = \mu_0$ vs  $H_1: \mu  \neq  \mu_0$
  
  \
     - $pvalor=P \left( \mid \underset{\ v.a.\ \sim \ t_{n-1}}{\underbrace{t_{exp|H_0}}} \mid \ > \underset{  \ observacion}{\underbrace{\mid t_{exp|H_0} \mid}} \right) =  P \left(  \underset{  \ v.a.}{\underbrace{t_{exp|H_0}}}  \ > \underset{  \ observacion}{\underbrace{\mid t_{exp|H_0} \mid}} \right) + P \left(  \underset{  \ v.a.}{\underbrace{t_{exp|H_0}}}  \ <  - \underset{ observacion}{\underbrace{\mid t_{exp|H_0} \mid}} \right) \\ \\ \\ \underset{simetria \ t}{\underbrace{=}}  P \left(  t_{n-1}  \ > \underset{  \ observacion}{\underbrace{\mid t_{exp|H_0} \mid}} \right) +P \left(  t_{n-1}  \ > \underset{  \ observacion}{\underbrace{\mid t_{exp|H_0} \mid}} \right) = 2 \cdot P \left( t_{n-1} > \left|      \dfrac{\overline{X_{k,g}} - \mu_0}{S(X_{k,g})/ \sqrt{n} } \right| \right)$ 

\

\

### Regla de decisión

\

#### Basada en el estadistico del contraste

\

Para un nivel de significación $\alpha$ : 

\

- Caso \  $H_0: \mu = \mu_0$  \ vs \ $H_1: \mu > \mu_0$

\

\begin{equation*}
Rechazar H_0  \ \Leftrightarrow \  \underset{  \ observacion}{\underbrace{t_{exp|H_0}}}  > t_{n-1}^{\alpha} \ \ \Leftrightarrow \ \ \dfrac{\overline{X_{k,g}} - \mu_0}{S(X_{k,g})/\sqrt{n}} > t_{n-1}^{\alpha} \ \ \Leftrightarrow \ \  \overline{X_{k,g}} > \mu_0 + t_{n-1}^{\alpha} \cdot S(X_{k,g})/\sqrt{n}
\end{equation*}

\

Donde: \ \ $P(t_{n-1} > t_{n-1}^{\alpha}) = \alpha$


\
\

- Caso \  $H_0: \mu = \mu_0$  \ vs \ $H_1: \mu < \mu_0$

\

\begin{equation*}
Rechazar H_0 \ \Leftrightarrow \ t_{exp | H_0} < t_{n-1}^{1-\alpha} \ \ \Leftrightarrow \ \ \dfrac{\overline{X_{k,g}} - \mu_0}{S(X_{k,g})/\sqrt{n}} < t_{n-1}^{1-\alpha} \ \ \Leftrightarrow \ \  \overline{X_{k,g}} < \mu_0 + t_{n-1}^{1-\alpha} \cdot S(X_{k,g})/\sqrt{n}
\end{equation*}

\
\

-  Caso \  $H_0: \mu = \mu_0$  \ vs \ $H_1: \mu \neq \mu_0$

\

\begin{equation*}
Rechazar H_0 \ \Leftrightarrow \ t_{exp | H_0} >  t_{n-1}^{\alpha/2} \ \ ó \ \ t_{exp | H_0} <  t_{n-1}^{1-\alpha/2} \ \Leftrightarrow \ \ \overline{X_{k,g}} > \mu_0 + t_{n-1}^{\alpha/2} \cdot S(X_{k,g})/\sqrt{n} \ \ ó \ \  \overline{X_{k,g}} < \mu_0 + t_{n-1}^{1-\alpha/2} \cdot S(X_{k,g})/\sqrt{n}
\end{equation*}


\

**Observaciones:**



- Las reglas de decision en los contrastes de hipotesis son conservadoras, en el sentido de que, por ejemplo, en el caso  \  $H_0: \mu = \mu_0$  \ vs \ $H_1: \mu > \mu_0$ \ se rechazará $H_0$ en favor de $H_1$  cuando $\overline{X_{k,g}}$ sea **suficientemente** mayor que $\mu_0$ , no vale que sea simplemente mayor que $\mu_0$.
Este hecho se extrapola a todos los contrastes de hipotesis, y es importante tenerlo presente.


\

-  $P(Error \ Tipo \ I)=P(Rechazar \ H_0 \ | \ H_0) =  \alpha$ en todos los casos, veamoslo:

\

   - Caso \  $H_0: \mu = \mu_0$  \ vs \ $H_1: \mu > \mu_0$

\

\begin{equation*}
P(RH_0 | H_0)=P( \underset{  \ v.a \ \sim \ t_{n-1}}{\underbrace{t_{exp|H_0}}}  > t_{n-1}^{\alpha})=P(t_{n-1} > t_{n-1}^\alpha)=\alpha
\end{equation*}

\

   - Caso \  $H_0: \mu = \mu_0$  \ vs \ $H_1: \mu < \mu_0$


\

\begin{equation*}
P(RH_0 | H_0)=P( \underset{  \ v.a \ \sim \ t_{n-1}}{\underbrace{t_{exp|H_0}}}  < t_{n-1}^{1-\alpha})=P(t_{n-1} < t_{n-1}^{1-\alpha})=\alpha
\end{equation*}

\

   - Caso \  $H_0: \mu = \mu_0$  \ vs \ $H_1: \mu \neq \mu_0$

\

\begin{equation*}
P(RH_0 | H_0)=P(\underset{  \ v.a \ \sim \ t_{n-1}}{\underbrace{t_{exp|H_0}}}  > t_{n-1}^{\alpha/2} \ \ ó \ \ \underset{  \ v.a \ \sim \ t_{n-1}}{\underbrace{t_{exp|H_0}}}  < t_{n-1}^{1-\alpha/2}) =P(t_{n-1} > t_{n-1}^{ \alpha/2} \ \ ó \ \ t_{n-1} < t_{n-1}^{1-\alpha/2})= \\ = P(t_{n-1} > t_{n-1}^{ \alpha/2})+P(t_{n-1} < t_{n-1}^{1-\alpha/2})=\alpha/2 + \alpha/2 =\alpha
\end{equation*}

\

#### Basada en el p-valor

\begin{equation*}
Rechazar \ H_0 \ \Leftrightarrow \ pvalor < \alpha
\end{equation*}


\

**Observación:**

La regla de decisión basada en el p-valor se deduce de la regla de decision basada en el estadistico del contraste, veamoslo:

\

- Caso \  $H_0: \mu = \mu_0$  \ vs \ $H_1: \mu > \mu_0$

\

\begin{equation*}
pvalor < \alpha \ \Leftrightarrow \ \  P(t_{n-1} > t_{exp|H0}) < \alpha \ \ \Leftrightarrow \ \ t_{exp|H0} > t_{n-1}^{\alpha} \ \ \Leftrightarrow \ \ Rechazar \ H_0
 \end{equation*}


\


- Caso \  $H_0: \mu = \mu_0$  \ vs \ $H_1: \mu < \mu_0$

\

\begin{equation*}
pvalor < \alpha \ \Leftrightarrow \ \  P(t_{n-1} < t_{exp|H0}) < \alpha \ \ \Leftrightarrow \ \ t_{exp|H0} < t_{n-1}^{1-\alpha} \ \ \Leftrightarrow \ \ Rechazar \ H_0
 \end{equation*}


\

- Caso \  $H_0: \mu = \mu_0$  \ vs \ $H_1: \mu \neq \mu_0$

\

\begin{equation*}
pvalor < \alpha \ \Leftrightarrow \ \  2\cdot P(t_{n-1} < \mid t_{exp|H0} \mid ) < \alpha  \ \Leftrightarrow \    P(t_{n-1} < \mid t_{exp|H0} \mid )  < \alpha/2 \ \ \Leftrightarrow \ \ \mid  t_{exp|H0}\mid > t_{n-1}^{\alpha/2} \ \ \Leftrightarrow \ \ \\  t_{exp|H0} >  t_{n-1}^{\alpha/2} \ \ ò \ \ t_{exp|H0} <  - t_{n-1}^{\alpha/2} \ \ \Leftrightarrow \ \   t_{exp|H0} >  t_{n-1}^{\alpha/2} \ \ ò \ \ t_{exp|H0} <   t_{n-1}^{1-\alpha/2}    \ \ \Leftrightarrow \ \ Rechazar \ H_0
 \end{equation*}


\











































