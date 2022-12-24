---
title: 'Inferencia basada en remuestreo'
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

$\hspace{0.4cm}$ Donde $\hspace{0.08cm}F( \cdot )\hspace{0.08cm}$ es una distribucion de probabilidad con parametros no especificados. $\\[0.5cm]$




Usaremos la siguiente notación: $\\[0.4cm]$


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

Una m.a.s. de una v.a. $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ es un vector de v.a.'s mutuamente independientes y que se distribuyen probabilisticamente igual que la v.a. $\hspace{0.1cm}\mathcal{X}$


<br>

# Muestra de Observaciones


<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>

$\hspace{0.25cm}$  Sea $\hspace{0.12cm}\mathcal{X}\hspace{0.12cm}$ una v.a. tal que $\hspace{0.12cm}\mathcal{X} \sim F(\cdot)$ 


$\hspace{0.25cm}$ $X=(x_1,...,x_n)\hspace{0.12cm}$ es una muestra de $\hspace{0.08cm}n\hspace{0.08cm}$ observaciones de la v.a. $\hspace{0.12cm}\mathcal{X}$ $\hspace{0.2cm}\Leftrightarrow\hspace{0.2cm}$ $x_i \in Im(\mathcal{X}) \hspace{0.12cm} ,\hspace{0.12cm} \forall i\in \lbrace 1,...,n \rbrace$ $\hspace{0.2cm}\Leftrightarrow\hspace{0.2cm}$ $x_i$ es una realización de la v.a. $\hspace{0.12cm}\mathcal{X}$  , $\hspace{0.12cm}\forall i\in \lbrace 1,...,n \rbrace \\$


</p>
 
</p></span>
</div>

Donde:

$Im(\mathcal{X})\hspace{0.1cm}$ es la imagen de $\hspace{0.1cm}\mathcal{X}$$\hspace{0.1cm}$  , es decir, su campo de variación.

<br>

**Observaciones:**

- Una muestra de observaciones de una v.a. es un vector de números, no son v.a.'s. $\\[0.6cm]$

- Si $\hspace{0.08cm} X=(x_1,...,x_n)\hspace{0.08cm}$ es una muestra de $\hspace{0.08cm}n\hspace{0.08cm}$ observaciones de $\hspace{0.08cm}\mathcal{X}\sim F(\cdot)$ , entonces $\hspace{0.08cm}x_i\hspace{0.08cm}$ es una observacion que ha sido generada por la distribución de probabilidad $\hspace{0.08cm}F(\cdot)\hspace{0.08cm}$, es decir, $\hspace{0.08cm}x_i\hspace{0.08cm}$ puede verse como un numero aleatorio generado en base a la distribución de probabilidad $\hspace{0.08cm} F(\cdot)$ $\\[0.6cm]$

- Si $\hspace{0.08cm}X=(x_1,...,x_n)\hspace{0.08cm}$ es una muestra de $\hspace{0.08cm}n\hspace{0.08cm}$ observaciones de $\mathcal{X}\sim F(\cdot)$ , entonces:


    - $P(\mathcal{X}= x_i)$ es la probabilidad de  observar $x_i$ al extraer una muestra de observaciones de $\mathcal{X}$ $\\[0.6cm]$


- Si $\hspace{0.08cm}(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.08cm}$ es una muestra aleatoria simple (m.a.s.) de tamaño $\hspace{0.08cm}n\hspace{0.08cm}$ de $\hspace{0.08cm}\mathcal{X}\sim F(\cdot)\hspace{0.08cm}$ , entonces:

    -  $P(\mathcal{X}_1 = x_1 , ..., \mathcal{X}_n=x_n)\hspace{0.08cm}$ es la probabilidad de obtener como valores $\hspace{0.08cm}(x_1,...,x_n)\hspace{0.08cm}$ al extraer una muestra de observaciones de $\hspace{0.08cm}\mathcal{X}$


<br>


# Estadístico


<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>
$\hspace{0.25cm}$ $T\hspace{0.1cm}$ es un estadístico de una m.a.s $\hspace{0.1cm}(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ de la v.a. $\hspace{0.1cm}\mathcal{X}\sim F(\theta)$ $\hspace{0.25cm}\Leftrightarrow\hspace{0.25cm}$ $T\hspace{0.1cm}$ es una función de la m.a.s que no depende  del parámetro $\hspace{0.1cm}\theta$




</p>
 
</p></span>
</div>

Por tanto:

- $T(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ es un estadístico.  $\\[0.4cm]$


 

**Observaciones:**

- $\hspace{0.12cm}T(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ es una v.a. al ser una función de v.a.'s $\\[0.8cm]$

- Dada una muestra de observaciones $\hspace{0.1cm}(x_1 ,..., x_n)\hspace{0.1cm}$ de  la v.a. $\hspace{0.1cm}\mathcal{X} \sim D(\theta)$ 

$\hspace{0.6cm} T(x_1,...,x_n)\hspace{0.1cm}$ es una observación de la v.a. $\hspace{0.1cm}T(\mathcal{X}_1,...,\mathcal{X}_n) \\$


- Dadas $\hspace{0.1cm}B\hspace{0.1cm}$ muestras de observaciones $\hspace{0.1cm}(x_1^1 , ..., x_n^1)\hspace{0.1cm} ,...,\hspace{0.1cm}(x_1^B,...,x_n^B)\hspace{0.2cm}$ de la v.a. $\hspace{0.1cm}\mathcal{X} \sim D(\theta)$ 

     - $\hspace{0.1cm}T(x_1^1 , ..., x_n^1) \hspace{0.1cm},...,\hspace{0.1cm} T(x_1^B,...,x_n^B)\hspace{0.2cm}$ es una muestra de observaciones de la v.a. $\hspace{0.1cm}T(\mathcal{X}_1,...,\mathcal{X}_n)$


<br>

## Ejemplos de estadisticos


Sea $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ una v.a. tal que $\hspace{0.1cm}\mathcal{X} \sim D(\theta)\hspace{0.1cm}$ , y sea $\hspace{0.1cm}(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ una m.a.s. de $\hspace{0.1cm} \mathcal{X} \\$


- **Media muestral**

$$T(\mathcal{X}_1,...,\mathcal{X}_n) = \overline{\mathcal{X}} = \dfrac{1}{n} \sum_{i=1}^n \mathcal{X}_i \\[1cm]$$


- **Varianza muestral**

$$T(\mathcal{X}_1,...,\mathcal{X}_n) = S^2 = \dfrac{1}{n} \sum_{i=1}^n (\mathcal{X}_i - \overline{\mathcal{X}})^2 \\[1cm]$$


- **Cuasi-Varianza muestral**

$$T(\mathcal{X}_1,...,\mathcal{X}_n) = S^2 = \dfrac{1}{n-1} \sum_{i=1}^n (\mathcal{X}_i - \overline{X})^2 \\$$





<br>


# Estimador Puntual

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

$\hspace{0.25cm}$ Dada una v.a. $\hspace{0.1cm}\mathcal{X}\sim D(\theta)\hspace{0.1cm}$ y una m.a.s. $\hspace{0.1cm}(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ de $\hspace{0.1cm}\mathcal{X}$, 

$\hspace{0.25cm}$ Un estimador puntual para el parametro $\hspace{0.1cm}\theta\hspace{0.1cm}$ es un estadistico $\hspace{0.1cm}\widehat{\theta}(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ que se propone para estimar $\hspace{0.1cm}\theta$

</p>
 
</p></span>
</div>

<br>


# Estimación Puntual

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

$\hspace{0.25cm}$ Dada una v.a. $\hspace{0.1cm}\mathcal{X}\sim D(\theta)\hspace{0.1cm}$ , una m.a.s. $\hspace{0.1cm}(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ de $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ y un estadistico $\hspace{0.1cm}\widehat{\theta}(\mathcal{X}_1,...,\mathcal{X}_n)$

$\hspace{0.25cm}$ Si  $\hspace{0.1cm}X=(x_1,...,x_n)\hspace{0.1cm}$ es una muestra de observaciones  de $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ , entonces:

- $\hspace{0.1cm}$$\widehat{\theta}(X) = \widehat{\theta}(x_1,...,x_n)\hspace{0.1cm}$ es una estimación puntual del parametro $\hspace{0.1cm}\theta \\$

</p>
 
</p></span>
</div>


**Observaciones:**

Un estimador puntual es una v.a. y una estimación puntual un número.


<br>

# Propiedades básicas de los estimadores

Dada una v.a. $\hspace{0.1cm}\mathcal{X}\sim D(\theta)\hspace{0.1cm}$ , una m.a.s. $\hspace{0.1cm}(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ de $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ y un estimador $\hspace{0.1cm}\widehat{\theta}(\mathcal{X}_1,...,\mathcal{X}_n)$


<br>

## Sesgo

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

$\hspace{0.25cm}$ El sesgo del estimador $\widehat{\theta}$ se define como:

$$Sesgo(\widehat{\theta}) = E \left[ \hspace{0.05cm} \widehat{\theta} \hspace{0.05cm} \right]- \theta$$


</p>
 
</p></span>
</div>

<br>

## Varianza 

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

$\hspace{0.25cm}$ La varianza del estimador $\widehat{\theta}$ se define como:

$$Var(\widehat{\theta}) = E \left[ \hspace{0.05cm} \left( \widehat{\theta} - E [ \hspace{0.05cm} \widehat{\theta} \hspace{0.05cm}  ] \right)^2 \hspace{0.05cm} \right]$$


$\hspace{0.25cm}$ El error estandar (desviación típica) del estimador $\widehat{\theta}$ se define como:

$$s.e.(\widehat{\theta}) = \sqrt{Var(\widehat{\theta})}$$


</p>
 
</p></span>
</div>

<br>

## Error Cuadratico Medio


<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

$\hspace{0.25cm}$ El error cuadratico medio del estimador $\widehat{\theta}$ se define como:

$$ECM(\widehat{\theta}) = E\left[\hspace{0.1cm} (\widehat{\theta} - \theta)^2 \hspace{0.1cm} \right] $$


</p>
 
</p></span>
</div>


**Propiedades**

- $ECM(\widehat{\theta}) = Var(\hat{\theta} ) + Sesgo(\widehat{\theta})^2$

<br>

<br>









# Estimacion del sesgo y varianza por Jacknife

Tenemos una v.a. $\hspace{0.1cm}\mathcal{X}\sim D(\theta)\hspace{0.1cm}$ , una m.a.s. $\hspace{0.1cm}(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ de $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ y un estimador $\hspace{0.1cm}\widehat{\theta}(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ del parametro $\hspace{0.1cm}\theta$


Además tenemos una muestra de observaciones $\hspace{0.1cm}X=(x_1,...,x_n)\hspace{0.1cm}$   de la variable de interés $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ , por lo que tenemos la estimación  $\hspace{0.1cm}\widehat{\theta}(X)=\widehat{\theta}(x_1,...,x_n)\hspace{0.1cm}$ del parámetro $\hspace{0.1cm} \theta \\$



<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

$\hspace{0.25cm}$ Se define $\hspace{0.1cm}X_{(r)}\hspace{0.1cm}$ como la muestra que contiene todos los valores de $\hspace{0.1cm}X\hspace{0.1cm}$ excepto $\hspace{0.1cm}x_{r}$

$\hspace{0.25cm}$ Es decir:


$$X_{(r)} = (\hspace{0.05cm}x_{1}\hspace{0.05cm},\hspace{0.05cm} x_{2}\hspace{0.05cm},..,\hspace{0.05cm} x_{r-1}\hspace{0.05cm},\hspace{0.05cm}x_{r+1}\hspace{0.05cm} ,..,\hspace{0.05cm} x_{n}\hspace{0.05cm})$$  

$\hspace{0.35cm}$ para  $\hspace{0.2cm} r=1,...,n \\$

 

$\hspace{0.25cm}$ Se define la replica $\hspace{0.1cm}r$-esima del estimador $\hspace{0.1cm}\widehat{\theta}\hspace{0.1cm}$ como: $\\[0.5cm]$

$$\widehat{\theta}_{(r)} = \widehat{\theta}(X_{(r)})= \widehat{\theta}(\hspace{0.05cm}x_{1}\hspace{0.05cm},\hspace{0.05cm} x_{2}\hspace{0.05cm},..,\hspace{0.05cm} x_{r-1}\hspace{0.05cm},\hspace{0.05cm}x_{r+1}\hspace{0.05cm} ,..,\hspace{0.05cm} x_{n}\hspace{0.05cm})$$


</p>
 
</p></span>
</div>


<br>

## Estimación Jacknife del sesgo

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

$\hspace{0.25cm}$ La **estimación Jacknife** del **sesgo** del estimador $\hspace{0.1cm}\widehat{\theta}\hspace{0.1cm}$ se define como: $\\[0.5cm]$

$$\widehat{Sesgo}(\widehat{\theta})_{Jack} \hspace{0.1cm}=\hspace{0.1cm}  (n-1) \cdot \left(   \dfrac{1}{n} \cdot \sum_{r=1}^{n} \widehat{\theta}_{(r)} \hspace{0.1cm} -\hspace{0.1cm} \widehat{\theta}(X) \right)$$



$\hspace{0.25cm}$ Donde:

$$\widehat{\theta}(X) \hspace{0.1cm}=\hspace{0.1cm} \widehat{\theta}(x_1,...,x_n)$$

$$\widehat{\theta}_{(r)} = \widehat{\theta}(X_{(r)})= \widehat{\theta}(\hspace{0.05cm}x_{1}\hspace{0.05cm},\hspace{0.05cm} x_{2}\hspace{0.05cm},..,\hspace{0.05cm} x_{r-1}\hspace{0.05cm},\hspace{0.05cm}x_{r+1}\hspace{0.05cm} ,..,\hspace{0.05cm} x_{n}\hspace{0.05cm})$$


</p>
 
</p></span>
</div>



<br>



## Estimación Jacknife de la varianza

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

$\hspace{0.25cm}$ La **estimación Jacknife** de la **varianza** del estimador $\widehat{\theta}$ se define como: $\\[0.2cm]$


$$\widehat{ Var}(\widehat{\theta})_{Jack} \hspace{0.1cm}= \hspace{0.1cm} \dfrac{n-1}{n} \cdot \sum_{r=1}^{n} \left( \widehat{\theta}_{(r)} \hspace{0.1cm}-\hspace{0.1cm} \dfrac{1}{n} \sum_{r=1}^{n} \widehat{\theta}_{(r)}  \right)^2$$

$\hspace{0.25cm}$ Donde:

 
$$\widehat{\theta}_{(r)} = \widehat{\theta}(X_{(r)})= \widehat{\theta}(\hspace{0.05cm}x_{1}\hspace{0.05cm},\hspace{0.05cm} x_{2}\hspace{0.05cm},..,\hspace{0.05cm} x_{r-1}\hspace{0.05cm},\hspace{0.05cm}x_{r+1}\hspace{0.05cm} ,..,\hspace{0.05cm} x_{n}\hspace{0.05cm})$$

</p>
 
</p></span>
</div>



<br>


<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

$\hspace{0.25cm}$ La **estimación Jacknife** del **error estandar** del estimador $\widehat{\theta}$ se define como: $\\[0.2cm]$

$$\widehat{ s.e.}(\widehat{\theta})_{Jack} \hspace{0.1cm}=\hspace{0.1cm} \sqrt{ \widehat{ Var}(\widehat{\theta})_{Jack} \hspace{0.1cm}}$$


</p>
 
</p></span>
</div>


<br>


**Observación:**

El Jacknife funciona bien cuando el estimador es suave (smooth). 

Un estimador es suave cuando ante pequeños cambios en la muestra de datos genera pequeños cambios en el estimador.

Ejemplo de estimador suave es el estimador plug-in de la media poblacional, es decir la media muestral.

Ejemplo de estimador no suave es el estimador plug-in de la mediana poblacional, es decir la mediana muestral


 


<br>

## Estimación Jacknife de un parametro con corrección de sesgo


Tenemos una v.a. $\hspace{0.1cm}\mathcal{X}\sim D(\theta)\hspace{0.1cm}$ , una m.a.s. $\hspace{0.1cm}(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ de $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ y un estimador $\hspace{0.1cm}\widehat{\theta}(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ del parametro $\hspace{0.1cm}\theta$


Además tenemos una muestra de observaciones $\hspace{0.1cm}X=(x_1,...,x_n)\hspace{0.1cm}$   de la variable de interés $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ , por lo que tenemos la estimación  $\hspace{0.1cm}\widehat{\theta}(X)=\widehat{\theta}(x_1,...,x_n)\hspace{0.1cm}$ del parámetro $\hspace{0.1cm} \theta \\[0.5cm]$



<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

$\hspace{0.25cm}$ La **estimación Jacknife con sesgo corregido** del parametro $\hspace{0.1cm} \theta\hspace{0.1cm}$ se define como: $\\[0.5cm]$

$$
\widehat{\theta}_{Jack} \hspace{0.2cm}=\hspace{0.2cm} \widehat{\theta}(X) \hspace{0.1cm}-\hspace{0.1cm} \widehat{Sesgo}(\widehat{\theta})_{Jack} \ \hspace{0.2cm}=\hspace{0.2cm} \widehat{\theta}(X) -  (n-1) \cdot \left(    \dfrac{1}{n} \cdot \sum_{r=1}^{n} \widehat{\theta}_{(r)}
 - \widehat{\theta} \right) \hspace{0.2cm}=\hspace{0.2cm}   n\cdot \widehat{\theta}(X) - (n-1)\cdot  \dfrac{1}{n} \cdot \sum_{r=1}^{n} \widehat{\theta}_{(r)} \\
$$

$\hspace{0.25cm}$ Donde:

$$\widehat{\theta} \hspace{0.1cm} =\hspace{0.1cm} \widehat{\theta}(X)\hspace{0.1cm} =\hspace{0.1cm} \widehat{\theta}(x_1,...,x_n)$$

$$\widehat{\theta}_{(r)} = \widehat{\theta}(X_{(r)})= \widehat{\theta}(\hspace{0.05cm}x_{1}\hspace{0.05cm},\hspace{0.05cm} x_{2}\hspace{0.05cm},..,\hspace{0.05cm} x_{r-1}\hspace{0.05cm},\hspace{0.05cm}x_{r+1}\hspace{0.05cm} ,..,\hspace{0.05cm} x_{n}\hspace{0.05cm})$$

</p>
 
</p></span>
</div>

<br>


## Estimación Jacknife del sesgo en `Python`


## Estimación Jacknife de la desviación típica en `Python`


## Estimación Jacknife del error cuadratico medio en `Python`


## Estimación Jacknife con sesgo correguido en `Python`




<br>

<br>


# Estimación del sesgo , varianza y error cuadratico medio de un estimador por Bootstrap


Tenemos una v.a. $\hspace{0.1cm}\mathcal{X}\sim D(\theta)\hspace{0.1cm}$ , una m.a.s. $\hspace{0.1cm}(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ de $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ y un estimador $\hspace{0.1cm}\widehat{\theta}(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ del parametro $\hspace{0.1cm}\theta$


Además tenemos una muestra de observaciones $\hspace{0.1cm}X=(x_1,...,x_n)\hspace{0.1cm}$   de la variable de interés $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ , por lo que tenemos la estimación $\hspace{0.1cm}\widehat{\theta}(X)=\widehat{\theta}(x_1,...,x_n)\hspace{0.1cm}$ del parametro $\hspace{0.1cm}\theta\\$ 


<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>


$\hspace{0.25cm}$ Una **muestra bootstrap**  de $\hspace{0.1cm}X=(x_1,...,x_n)\hspace{0.1cm}$ se define como una **muestra aleatoria con reemplazamiento** de tamaño $\hspace{0.1cm}n\hspace{0.1cm}$ de $\hspace{0.1cm}X$ 


$\hspace{0.25cm}$ Tenemos $\hspace{0.1cm}B\hspace{0.1cm}$ muestras bootstrap de $\hspace{0.1cm}X\hspace{0.1cm}$ : $\\[0.5cm]$

$$X_{(1)},X_{(2)},...,X_{(B)} \\$$


$\hspace{0.25cm}$ Se define la replica bootstap $\hspace{0.1cm}b$-esima del estimador $\hspace{0.1cm}\widehat{\theta}$ como: $\\[0.5cm]$


$$\widehat{\theta}_{(b)} = \widehat{\theta}(X_{(b)})$$

</p>
 
</p></span>
</div>


<br>

<br>


## Estimación bootstrap del sesgo de un estimador


<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>


$\hspace{0.25cm}$ La **estimación bootstrap** del **sesgo** del estimador $\hspace{0.1cm}\widehat{\theta}\hspace{0.1cm}$ se define como: $\\[0.5cm]$


$$\widehat{Sesgo}(\widehat{\theta})_{Boot} \hspace{0.12cm} =\hspace{0.12cm}  \dfrac{1}{B} \cdot \sum_{b=1}^{B} \left( \widehat{\theta}_{(b)}  - \widehat{\theta}(X) \right) \hspace{0.12cm}=\hspace{0.12cm}  \dfrac{1}{B} \cdot \sum_{b=1}^{B}  \widehat{\theta}_{(b)}  \hspace{0.1cm} -\hspace{0.1cm} \widehat{\theta}(X)$$


$\hspace{0.25cm}$ Donde:

$$\widehat{\theta}_{(b)} = \widehat{\theta}(X_{(b)})$$

$$\widehat{\theta}(X) \hspace{0.12cm} =\hspace{0.12cm}  \widehat{\theta}(x_1,...,x_n)\\$$




</p>
 
</p></span>
</div>


**Observación:**

La estimación bootstrap del sesgo del estimador $\hspace{0.12cm}\widehat{\theta}\hspace{0.12cm}$ es la media del vector de replicas bootstrap $\hspace{0.12cm}(\widehat{\theta}_{(1)},\widehat{\theta}_{(2)},...,\widehat{\theta}_{(B)})\hspace{0.12cm}$ menos la estimación $\widehat{\theta}(X)$



<br>


## Estimación bootstrap de la varianza de un estimador


<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>


$\hspace{0.25cm}$ La **estimación Bootstrap** de la **varianza** del estimador $\hspace{0.1cm}\widehat{\theta}\hspace{0.1cm}$ se define como: $\\[0.5cm]$

$$\widehat{Var}(\widehat{\theta})_{Boot} \hspace{0.12cm} =\hspace{0.12cm}   \dfrac{1}{B-1} \cdot \sum_{b=1}^{B} \left( \widehat{\theta}_{(b)}  \hspace{0.1cm}-\hspace{0.1cm} \dfrac{1}{B} \cdot \sum_{b=1}^{B} \widehat{\theta}_{(b)} \right)^2 \\[0.8cm]$$

$\hspace{0.25cm}$ Donde:


 
$$\widehat{\theta}_{(b)} = \widehat{\theta}(X_{(b)})$$


</p>
 
</p></span>
</div>




<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>


$\hspace{0.25cm}$ La **estimación bootstrap** de la **desviación típica** del estimador $\hspace{0.1cm}\widehat{\theta}\hspace{0.1cm}$ se define como: $\\[0.5cm]$

$$\widehat{s.e.}(\widehat{\theta})_{Boot} \hspace{0.12cm} =\hspace{0.12cm}   \sqrt{ \widehat{Var}(\widehat{\theta})_{Boot}   }\\$$


</p>
 
</p></span>
</div>



**Observación:**

La estimación bootstrap de la varianza del estimador $\hspace{0.12cm}\widehat{\theta}\hspace{0.12cm}$ es la cuasi-varianza del vector de replicas bootstrap $\hspace{0.12cm}(\widehat{\theta}_{(1)},\widehat{\theta}_{(2)},...,\widehat{\theta}_{(B)})$


<br>


## Estimación bootstrap del error cuadratico medio de un estimador

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>


$\hspace{0.25cm}$ La **estimación Bootstrap** del **error cuadrático medio** del estimador $\hspace{0.1cm}\widehat{\theta}\hspace{0.1cm}$ se define como: $\\[0.5cm]$

$$\widehat{ECM}(\widehat{\theta})_{Boot} \hspace{0.12cm} =\hspace{0.12cm}   \dfrac{1}{B} \cdot \sum_{b=1}^{B} \left( \widehat{\theta}_{(b)}  - \widehat{\theta}(X) \right)^2\\$$


$\hspace{0.25cm}$ Donde:

$$\widehat{\theta}_{(b)} = \widehat{\theta}(X_{(b)})$$

$$\widehat{\theta}(X) \hspace{0.12cm} =\hspace{0.12cm}  \widehat{\theta}(x_1,...,x_n)\\$$


</p>
 
</p></span>
</div>



<br>

## Estimación bootstrap  de un parametro con corrección de sesgo

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

$\hspace{0.25cm}$ La **estimación Bootstrap con sesgo corregido** del parametro $\hspace{0.1cm} \theta\hspace{0.1cm}$ se define como: $\\[0.5cm]$

$$
\widehat{\theta}_{Boot} \hspace{0.2cm}=\hspace{0.2cm} \widehat{\theta}(X) \hspace{0.1cm}-\hspace{0.1cm} \widehat{Sesgo}(\widehat{\theta})_{Boot} \ \hspace{0.2cm}=\hspace{0.2cm}  \widehat{\theta}(X) \hspace{0.1cm} -\hspace{0.1cm}\hspace{0.1cm} \dfrac{1}{B} \cdot \sum_{b=1}^{B} \left( \widehat{\theta}_{(b)}  - \widehat{\theta}(X) \right) \\
$$

$\hspace{0.25cm}$ Donde:

$$\widehat{\theta}_{(b)} = \widehat{\theta}(X_{(b)})$$

$$\widehat{\theta}(X)\hspace{0.1cm} =\hspace{0.1cm} \widehat{\theta}(x_1,...,x_n)$$



</p>
 
</p></span>
</div>


<br>

<br>

## Estimación bootstrap del sesgo en `Python`


## Estimación bootstrap de la desviación típica en `Python`


## Estimación bootstrap del error cuadratico medio en `Python`


## Estimación bootstrap con sesgo correguido en `Python`


<br>


# Fundamentos del Bootstrap

## La función de distribución  

Dada una v.a. $\hspace{0.1cm}\mathcal{X}\sim D(\theta)\hspace{0.1cm}$ y una m.a.s. $\hspace{0.1cm}(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ de $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$  

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

La **función de distribución** de la v.a. $\mathcal{X}$ es : $\\[0.7cm]$

$$F_{X}(z) = P(X \leq z)  \hspace{0.2cm}, \hspace{0.2cm}\forall z \in \mathbb{R} \\$$

</p>
 
</p></span>
</div>


**Observación:**

La función de distribución de la v.a. $\mathcal{X}$ coincide con las funciones de distribución de las v.a's $\mathcal{X}_1,...,\mathcal{X}_n \\$ , porque tienen la misma distribución de probabilidad.

$$F_{X}(z) = F_{X_i}(z) \hspace{0.2cm}, \hspace{0.2cm}\forall z \in \mathbb{R} \hspace{0.2cm},\hspace{0.2cm} \forall i \in \lbrace 1,...,n \rbrace$$


<br>



## La función de distribución empírica

Dada una v.a. $\hspace{0.1cm}\mathcal{X}\sim D(\theta)\hspace{0.1cm}$


<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

$\hspace{0.25cm}$  La función de distribución empírica basada en una m.a.s. $\hspace{0.1cm}(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ de $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ se define como:


$$\widehat{F}_n(z) \hspace{0.1cm} = \hspace{0.1cm} \dfrac{1}{n} \sum_{i=1}^n  I(\mathcal{X}_i \geq z) $$

$\hspace{0.25cm}$  donde:

$$I(X_i \geq z) =  \left\lbrace\begin{array}{l}   \hspace{0.12cm} 1 \hspace{0.2cm},\hspace{0.3cm} \text{si} \hspace{0.3cm} X_i \geq z \\[0.1cm] 
\hspace{0.12cm} 0 \hspace{0.2cm},\hspace{0.3cm} \text{si} \hspace{0.3cm} X_i > z \\[0.1cm] 
\end{array}\right.$$

$\hspace{0.35cm}$  para $\hspace{0.1cm} z\in \mathbb{R}$

</p>
 
</p></span>
</div>


**Observaciones:**

- $\widehat{F}_n(z)\hspace{0.1cm}$ es una v.a. $\\[0.5cm]$

- $\widehat{F}_n(z)\hspace{0.1cm}$ es usada como estimador de $\hspace{0.1cm}F_X(z)$

<br>



### Porpiedades de la función de distribución empírica como v.a.

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

$\hspace{0.2cm}$ Algunas propiedades de la distribución empírica como variable aleatoria:

- $\hspace{0.2cm} I(X_i \geq z) \hspace{0.2cm}\sim\hspace{0.2cm} Bernoulli\left( p \right) \hspace{0.2cm} ,\hspace{0.2cm}  \text{con}\hspace{0.2cm} \hspace{0.2cm} p=F_X(z)=P(X<z)\\[0.8cm]$

- $\hspace{0.2cm}  \sum_{i=1}^n  I(X_i \geq z) \hspace{0.2cm}\sim\hspace{0.2cm} Binomial(n , p  ) \hspace{0.2cm} ,\hspace{0.2cm}  \text{con}\hspace{0.2cm} \hspace{0.2cm} p=F_X(z)=P(X<z) \\[0.8cm]$

- $\hspace{0.2cm} \widehat{F}_n(z) \hspace{0.1cm} = \hspace{0.1cm}   \dfrac{1}{n} \sum_{i=1}^n  I(X_i \geq z) \hspace{0.2cm}\sim\hspace{0.2cm}  \dfrac{1}{n} \cdot Binomial(n , p  ) \hspace{0.2cm} ,\hspace{0.2cm}  \text{con}\hspace{0.2cm} \hspace{0.2cm} p\hspace{0.1cm}=\hspace{0.1cm}F_X(z)\hspace{0.1cm}=\hspace{0.1cm}P(X<z) \\[0.8cm]$


- $E\left[ \widehat{F}_n(z)  \right] \hspace{0.1cm}=\hspace{0.1cm}  E \left[ \dfrac{1}{n} \cdot Binomial(n , p  ) \right] \hspace{0.1cm}=\hspace{0.1cm} \dfrac{1}{n} \cdot n \cdot  p  \hspace{0.1cm}=\hspace{0.1cm} p \hspace{0.1cm}=\hspace{0.1cm} F_X(z)=P(X<z) \\[0.8cm]$


- $Var\left[ \widehat{F}_n(z)  \right] \hspace{0.1cm}=\hspace{0.1cm} Var \left[ \dfrac{1}{n} \cdot Binomial(n , p  ) \right]\hspace{0.1cm}=\hspace{0.1cm} \dfrac{1}{n^2} \cdot n \cdot  p \cdot (1-p) \hspace{0.1cm}=\hspace{0.1cm} \dfrac{1}{n} \cdot  F_X(z)\cdot (1- F_X(z))  \hspace{0.1cm}=\hspace{0.1cm} F_X(z)=P(X<z) \\[0.8cm]$


</p>
 
</p></span>
</div>

<br>


## Función de distribución empírica como estimación de la funcion de distribución


<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>



$\hspace{0.25cm}$ Si tenemos una muestra de observaciones $\hspace{0.1cm}X=(x_1,...,x_n)\hspace{0.1cm}$   de la variable de interés $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$  


$\hspace{0.25cm}$ Tenemos la siguiente **estimación** de la función de distribución de $\mathcal{X}$ a través de la funcion de distribución emprica:

$$\widehat{F}_n(z) \hspace{0.1cm}=\hspace{0.1cm} \dfrac{1}{n} \sum_{i=1}^n  I(x_i \geq z) \hspace{0.1cm} = \hspace{0.1cm} \dfrac{\# \lbrace \hspace{0.1cm}  i=1,..,n\hspace{0.1cm}  / \hspace{0.1cm}  x_i \geq z\hspace{0.1cm}  \rbrace}{n}\\$$


$\hspace{0.35cm}$ para $\hspace{0.1cm} z\in \mathbb{R} \\$

</p>
 
</p></span>
</div>






**Propiedades de la función de distribución empírica como estimación**

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

- $\hspace{0.2cm} \widehat{F}_n(z) \hspace{0.1cm}=\hspace{0.1cm} Q(X , z)$

$\hspace{0.25cm}$ Donde: $\hspace{0.2cm} Q(X , z)\hspace{0.1cm}$  es el cuantil de orden $\hspace{0.1cm}z\hspace{0.1cm}$ de $\hspace{0.1cm}X=(x_1,...,x_n) \\$



- Si se ordena la muestra $\hspace{0.1cm}X=(x_1,...,x_n)\hspace{0.1cm}$ de menor a mayor $x_{(1)}\hspace{0.1cm}<\hspace{0.1cm}x_{(2)}\hspace{0.1cm}<...<\hspace{0.1cm}x_{(n)}\hspace{0.1cm}$ , entonces: $\\[0.6cm]$



$$\hspace{0.2cm} \widehat{F}_n(z) = \left\lbrace\begin{array}{l}   \hspace{0.12cm} 0 \hspace{0.2cm},\hspace{0.3cm} \text{si} \hspace{0.3cm} z < x_{(1)} \\[0.1cm] 
\hspace{0.12cm} 1/n   \hspace{0.2cm},\hspace{0.3cm} \text{si} \hspace{0.3cm} z = x_{(1)}  \\[0.1cm] 
\hspace{0.12cm} 1/n   \hspace{0.2cm},\hspace{0.3cm} \text{si} \hspace{0.3cm}  x_{(1)} \leq z < x_{(2)} \\[0.1cm] 
\hspace{0.12cm} 2/n   \hspace{0.2cm},\hspace{0.3cm} \text{si} \hspace{0.3cm}  z = x_{(2)} \\[0.1cm] 
\hspace{0.12cm} 2/n   \hspace{0.2cm},\hspace{0.3cm} \text{si} \hspace{0.3cm}  x_{(2)} \leq z < x_{(3)} \\[0.1cm]
\dots \\[0.15cm]
\hspace{0.12cm} (n-1)/n   \hspace{0.2cm},\hspace{0.3cm} \text{si} \hspace{0.3cm}   z = x_{(n-1)} \\[0.1cm]
\hspace{0.12cm} (n-1)/n   \hspace{0.2cm},\hspace{0.3cm} \text{si} \hspace{0.3cm}   x_{(n-1)} \leq z < x_{(n)} \\[0.1cm] 
\hspace{0.12cm} 1   \hspace{0.2cm},\hspace{0.3cm} \text{si} \hspace{0.3cm}   z \geq x_{(n)}
\end{array}\right.$$

</p>
 
</p></span>
</div>


<br>

## Ley debil de los grandes números

La ley debil de los grandes números afirma lo siguiente:

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

$\hspace{0.25cm}$ Dada una v.a. $\hspace{0.1cm}\mathcal{X}\sim D(\theta)\hspace{0.1cm}$ tal que $\hspace{0.1cm}E[\mathcal{X}]=\mu\hspace{0.1cm}$

$\hspace{0.25cm}$ Si $\widehat{F}_n(z)$ es la función de distribución empirica basada en la m.a.s. $\hspace{0.1cm}(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ de $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ , se cumple que:

$$\dfrac{1}{n} \sum_{i=1}^n \mathcal{X}_i \hspace{0.25cm}\underset{p}{\rightarrow}\hspace{0.25cm} E[X]=\mu$$

</p>
 
</p></span>
</div>


**Observación:**

$$E[X]=E[X_i] \hspace{0.25cm},\hspace{0.25 cm} \forall i \in \lbrace 1,...,n \rbrace$$



<br>

---

Podemos aplicar la ley de los grandes números a la distribución empirica:

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

$\hspace{0.25cm}$ Como $\hspace{0.15cm}I(\mathcal{X}_i \geq z) \sim Bernoulli(p)\hspace{0.15cm}$ , con $\hspace{0.15cm}E\left[I(\mathcal{X}_i \geq z)\right]\hspace{0.1cm} =\hspace{0.1cm} p\hspace{0.1cm}=\hspace{0.1cm}F_X(z)\hspace{0.1cm}=\hspace{0.1cm}P(X \leq z)\\$

$\hspace{0.25cm}$Aplicando la ley debil de los grandes números tenemos lo siguiente:


$$\widehat{F}_n(z) \hspace{0.1cm} = \hspace{0.1cm} \dfrac{1}{n} \sum_{i=1}^n  I(\mathcal{X}_i \geq z) \hspace{0.25cm}\underset{p}{\rightarrow} \hspace{0.25cm} p=F_X(z) \\$$

$\hspace{0.25cm}$En conclusión:

$$\widehat{F}_n(z) \hspace{0.25cm}\underset{p}{\rightarrow} \hspace{0.25cm} F_X(z)\\$$



$\hspace{0.25cm}$ Usando la definición de convergencia en probabilidad, se tiene que: $\\[0.5cm]$


$$\underset{n\rightarrow \infty}{lim} \hspace{0.1cm} P\left( \hspace{0.1cm} | \widehat{F}_n(z) - F_X(z) |\hspace{0.1cm} \leq \varepsilon \right) \hspace{0.1cm}=\hspace{0.1cm} 1 \hspace{0.25cm},\hspace{0.25cm} \forall \varepsilon > 0 \\$$

</p>
 
</p></span>
</div>



Pero se cumple un resultado más fuerte aun, el **teorema de Glivenko-Cantelli**.

## Teorema de Glivenko-Cantelli

Dada una v.a. $\hspace{0.1cm}\mathcal{X}\sim D(\theta)\hspace{0.15cm}$ tal que $\hspace{0.15cm}E[\mathcal{X}]=\mu\hspace{0.1cm}\\$ 


<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>


$\hspace{0.25cm}$ Si $\hspace{0.1cm}\widehat{F}_n(z)\hspace{0.1cm}$ es la función de distribución empirica basada en la m.a.s. $\hspace{0.1cm}(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ de $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ , se cumple que: $\\[0.5cm]$

$$sup \left\lbrace \hspace{0.1cm}\left|\hspace{0.1cm} \widehat{F}_n(z)  - F_X(z)\hspace{0.1cm} \right| \hspace{0.15cm}  / \hspace{0.15cm} z \in \mathbb{R} \hspace{0.1cm}\right\rbrace \hspace{0.25cm}\underset{p}{\rightarrow} \hspace{0.25cm} 0\\$$

</p>
 
</p></span>
</div>



## ***Falta hilar esto con la justificacion del bootstrap***



<br>




<br>



# Intervalos de confianza basados en bootstrap

Es recomendable leer previamente la entrada sobre intervalos de confianza del blog [Estadistica4all](http://estadistica4all.com/), principalmente para fijar conceptos e ideas.

Las desviaciones típicas o errores estándar se pueden usar para calcular intervalos de confianza aproximados para los parametros de interés.



## Intervalos cuantil-bootstrap

Primero vamos a fijar una vez mas el contexto en el que no estamos moviendo, puesto que es importante recordarlo:


Tenemos una v.a. $\hspace{0.1cm}\mathcal{X}\sim D(\theta)\hspace{0.1cm}$ , una m.a.s. $\hspace{0.1cm}(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ de $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ y un estimador $\hspace{0.1cm}\widehat{\theta}(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ del parametro $\hspace{0.1cm}\theta$


Además tenemos una muestra de observaciones $\hspace{0.1cm}X=(x_1,...,x_n)\hspace{0.1cm}$   de la variable de interés $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ , por lo que tenemos la estimación $\hspace{0.1cm}\widehat{\theta}(X)=\widehat{\theta}(x_1,...,x_n)\hspace{0.1cm}$ del parametro $\hspace{0.1cm}\theta\\$ 





<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>


$\hspace{0.25cm}$ Tenemos $\hspace{0.1cm}B\hspace{0.1cm}$ muestras bootstrap (aleatorias y con reemplazamiento) de $\hspace{0.1cm}X\hspace{0.1cm}$ : $\\[0.5cm]$

$$X_{(1)},X_{(2)},...,X_{(B)} \\$$


- Se calcula para $b\in \lbrace 1,...,B \rbrace$ la replica bootstrap $\hspace{0.1cm}b$-esima del estimador $\hspace{0.1cm}\widehat{\theta}$ como: $\\[0.5cm]$


$$\widehat{\theta}_{(b)} = \widehat{\theta}(X_{(b)}) \\$$


$\hspace{0.25cm}$ Asi que se tiene:

$$\widehat{\theta}_{boot} = \left(\widehat{\theta}_{(1)},...,\widehat{\theta}_{(B)} \right)$$




 
 
- Sea $\hspace{0.1cm}Q(\alpha \hspace{0.05cm} ,  \hspace{0.05cm} \widehat{\theta}_{boot})\hspace{0.1cm}$  el cuantil de orden $\hspace{0.1cm}\alpha\hspace{0.1cm}$ de la variable $\hspace{0.15cm}\widehat{\theta}_{boot}$ 

    Por tanto, se cumple lo siguiente: $\\[0.4cm]$

    $$\dfrac{\# \hspace{0.15cm} \left\lbrace \hspace{0.1cm}  b = 1,...,B \hspace{0.25cm} / \hspace{0.25cm} \widehat{\theta}_{(b)} \hspace{0.05cm} \leq \hspace{0.05cm} Q(\alpha \hspace{0.05cm} , \hspace{0.05cm} \widehat{\theta}_{boot}) \hspace{0.1cm}  \right\rbrace \hspace{0.1cm} }{B}  \hspace{0.15cm} = \hspace{0.15cm} \alpha \\$$


    - El intervalo cuantil-bootstrap para el parametro $\hspace{0.1cm}\theta\hspace{0.1cm}$ a un nivel $\hspace{0.1cm} 1-\alpha\hspace{0.1cm}$ es :

$$\left[ \hspace{0.1cm} Q(\alpha/2 \hspace{0.1cm} , \hspace{0.1cm} \widehat{\theta}_{boot}) \hspace{0.2cm} ;  \hspace{0.2cm} Q(1-\alpha/2 \hspace{0.1cm} , \hspace{0.1cm} \widehat{\theta}_{boot}) \hspace{0.1cm} \right] \\$$


</p>
 
</p></span>
</div>




Los intervalos cuantil-bootstrap pueden conducir a estimaciones del intervalo de confianza algo erráticas cuando el estimador del parametro de interés es sesgado.

Se pueden considerar una versión mejorada del intervalo cuantil-bootstrap llamada BCa, abreviatura que procede de sesgo-corregido (bias-corrected) y acelerado (accelerated).


<br>

## Intervalo BCa-bootstrap


En la determinación de los intervalos BCa-bootstrap juegan un rol central dos cantidades: $\hspace{0.25cm} \Rightarrow \hspace{0.25cm} \hat{z}_0\hspace{0.1cm}$ y $\hspace{0.1cm}\hat{a}$


$\hat{z}_0\hspace{0.1cm}$ se introduce para corregir el sesgo del estimador $\hat{\theta}$

 

$\hat{z}_0\hspace{0.1cm}$ se define como


$$\hat{z}_0 \hspace{0.1cm}=\hspace{0.1cm} F^{-1}_{N(0,1)} \left(  \dfrac{\# \hspace{0.15cm} \left\lbrace \hspace{0.1cm}  b = 1,...,B \hspace{0.25cm} / \hspace{0.25cm} \widehat{\theta}_{(b)} \hspace{0.05cm} \leq \hspace{0.05cm}  \hat{\theta}(X) \hspace{0.1cm}  \right\rbrace \hspace{0.1cm} }{B}  \right)$$



Aclaremos esto un poco:


Si $\hspace{0.1cm}\rho\hspace{0.1cm}$ es la proporción de replicas bootstrap del estimador $\hspace{0.1cm}\hat{\theta}_{(1)},...,\hat{\theta}_{(B)}\hspace{0.1cm}$ que son menores o iguales que la estimacion $\hspace{0.1cm}\hat{\theta}(X)\hspace{0.1cm}$  , entonces:

 
$$\rho \hspace{0.1cm}=\hspace{0.1cm}  \dfrac{ \# \hspace{0.1cm} \left\lbrace \hspace{0.1cm}  b = 1,...,B \hspace{0.25cm} / \hspace{0.25cm} \widehat{\theta}_{(b)} \hspace{0.05cm} \leq \hspace{0.05cm}  \hat{\theta}(X) \hspace{0.1cm}  \right\rbrace \hspace{0.1cm} }{B}$$


Por tanto:

$$\hat{z}_0 \hspace{0.1cm}=\hspace{0.1cm} F^{-1}_{N(0,1)} ( \hspace{0.05cm}\rho\hspace{0.05cm} ) \hspace{0.3cm}\Rightarrow\hspace{0.3cm} F_{N(0,1)}(\hat{z}_0) \hspace{0.1cm}=\hspace{0.1cm} P\left( \hspace{0.1cm}N(0,1) \leq \hat{z}_0\hspace{0.1cm} \right) \hspace{0.1cm} =\hspace{0.1cm} \rho$$


En conclusión:

$\hat{z}_0\hspace{0.1cm}$ es el cuantil de orden $\hspace{0.1cm}\rho\hspace{0.1cm}$ de la distribucion $\hspace{0.1cm}N(0,1)\hspace{0.3cm}$ $\Rightarrow\hspace{0.3cm}$ $\hat{z}_0 \hspace{0.1cm} = \hspace{0.1cm} Q\left(\hspace{0.1cm}\rho \hspace{0.1cm},\hspace{0.1cm} N(0,1)\hspace{0.1cm}\right)$


 

<br>

---

<br>


La segunda cantidad, $\hspace{0.1cm}\hat{a}\hspace{0.1cm}$, denominada aceleración, corrige el caso en el que el error estandar del estimador del parametro de interés $\hspace{0.1cm}s.e.(\hat{\theta})\hspace{0.1cm}$ no sea constante, y se define en términos de estimaciones Jacknife.


Recordemos el contexto Jacknife:

$\hspace{0.25cm}$ Se define $\hspace{0.1cm}X_{(r)}\hspace{0.1cm}$ como la muestra que contiene todos los valores de la muestra $\hspace{0.1cm}X=(x_1,...,x_n)\hspace{0.1cm}$ del la variable aleatoria de interés $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ excepto el valor $\hspace{0.1cm}x_{r}$

$\hspace{0.25cm}$ Es decir:


$$X_{(r)} = (\hspace{0.05cm}x_{1}\hspace{0.05cm},\hspace{0.05cm} x_{2}\hspace{0.05cm},..,\hspace{0.05cm} x_{r-1}\hspace{0.05cm},\hspace{0.05cm}x_{r+1}\hspace{0.05cm} ,..,\hspace{0.05cm} x_{n}\hspace{0.05cm})$$  

$\hspace{0.35cm}$ para  $\hspace{0.2cm} r=1,...,n \\$

 

$\hspace{0.25cm}$ Se define la replica $\hspace{0.1cm}r$-esima del estimador $\hspace{0.1cm}\widehat{\theta}\hspace{0.1cm}$ como: $\\[0.5cm]$

$$\widehat{\theta}_{(r)} = \widehat{\theta}(X_{(r)})= \widehat{\theta}(\hspace{0.05cm}x_{1}\hspace{0.05cm},\hspace{0.05cm} x_{2}\hspace{0.05cm},..,\hspace{0.05cm} x_{r-1}\hspace{0.05cm},\hspace{0.05cm}x_{r+1}\hspace{0.05cm} ,..,\hspace{0.05cm} x_{n}\hspace{0.05cm})\\$$


Teniendo todo esto en cuenta, $\hspace{0.1cm}\hat{a}\hspace{0.1cm}$ se define como sigue:

$$\hat{a} \hspace{0.1cm} = \hspace{0.1cm} \dfrac{ \sum_{r=1}^n \left( \hspace{0.1cm} \hat{\theta}_{(\cdot)} - \hat{\theta}_{(r)}  \right)^3   }{ 6 \cdot \left[ \sum_{r=1}^n \left( \hspace{0.1cm} \hat{\theta}_{(\cdot)} - \hat{\theta}_{(r)}  \right)^2 \right]^{3/2}  }$$


Donde:

 $$\hat{\theta}_{(\cdot)} = \frac{1}{n} \cdot \sum_{r=1}^n \hat{\theta}_{(r)} \\$$




<br>

---

<br>


<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

$\hspace{0.25cm}$ El intervalo BCa-bootstrap de nivel $\hspace{0.1cm} 1-\alpha\hspace{0.1cm}$ es: $\\[0.5cm]$


$$\left[ \hspace{0.1cm}Q(\alpha_1 \hspace{0.1cm} ,\hspace{0.1cm}  \hat{\theta}_{boot})   \hspace{0.2cm}  ; \hspace{0.2cm}   Q(\alpha_2 \hspace{0.1cm} ,\hspace{0.1cm}  \hat{\theta}_{boot})  \hspace{0.1cm} \right] \\$$

$\hspace{0.25cm}$ Donde:

$$\alpha_1 \hspace{0.1cm}=\hspace{0.1cm} F_{N(0,1)}\left( \hat{z}_0 + \dfrac{\hat{z}_0 + z_{1-\alpha/2} }{1 - \hat{a}\cdot(\hat{z}_0 + z_{1-\alpha/2} )} \right)$$

$$\alpha_2 \hspace{0.1cm}=\hspace{0.1cm} F_{N(0,1)}\left( \hat{z}_0 + \dfrac{\hat{z}_0 + z_{\alpha/2} }{1 - \hat{a}\cdot(\hat{z}_0 + z_{\alpha/2} )} \right) \\$$


$\hspace{0.25cm}$Teniendo en cuenta que:



- $z_{\alpha}$ el valor tal que $P(N(0,1) \leq z_{\alpha}) = \alpha\\[0.5cm]$



- $\hat{a} \hspace{0.1cm} = \hspace{0.1cm} \dfrac{ \sum_{r=1}^n \left( \hspace{0.1cm} \hat{\theta}_{(\cdot)} - \hat{\theta}_{(r)}  \right)^3   }{ 6 \cdot \left[ \sum_{r=1}^n \left( \hspace{0.1cm} \hat{\theta}_{(\cdot)} - \hat{\theta}_{(r)}  \right)^2 \right]^{3/2}  } \\[0.5cm]$

- $\hat{z}_0  \hspace{0.1cm} = \hspace{0.1cm} Q\left(\hspace{0.1cm}\rho \hspace{0.1cm},\hspace{0.1cm} N(0,1)\hspace{0.1cm}\right) \\[0.5cm]$

- $\rho \hspace{0.1cm}=\hspace{0.1cm}  \dfrac{ \# \hspace{0.1cm} \left\lbrace \hspace{0.1cm}  b = 1,...,B \hspace{0.25cm} / \hspace{0.25cm} \widehat{\theta}_{(b)} \hspace{0.05cm} \leq \hspace{0.05cm}  \hat{\theta}(X) \hspace{0.1cm}  \right\rbrace \hspace{0.1cm} }{B} \\[0.3cm]$


</p>
 
</p></span>
</div>

<br>

Si $\hspace{0.1cm}\hat{z}_0 = \hat{a} = 0\hspace{0.1cm}$ , entonces: 

$$\alpha_1 \hspace{0.1cm} = \hspace{0.1cm} F_{N(0,1)}(z_{1-\alpha/2}) \hspace{0.1cm} = \hspace{0.1cm} \alpha/2$$

$$\alpha_2 \hspace{0.1cm} = \hspace{0.1cm} F_{N(0,1)}(z_{\alpha/2}) \hspace{0.1cm}=\hspace{0.1cm} 1- \alpha/2 \\$$



Por lo que en este caso particular el intervalo BCa coincide con el intervalo percentil.

El valor de $\hat{z}_0$ traslada el intervalo a la derecha o a la izquierda, y $\hat{a}$ hace que sea más ancho o más estrecho.


Con este intervalo se recomienda usar $B \geq 1000$.


<br>






## Intervalo de confianza bootstrap para la media de una poblacion


Aplicar en python



## Intervalo de confianza bootstrap para la diferencia de medias de dos poblacion



## Intervalo de confianza bootstrap para la varianza de una poblacion




## Intervalo de confianza bootstrap para la diferencia de varianzas de dos poblacion



## Intervalo de confianza bootstrap para la mediana de una poblacion



## Intervalo de confianza bootstrap para la diferencia de medianas de dos poblaciones







<br>

<br>

# Contrastes de hipotesis basados en bootstrap


El contexto en el que nos vamos a mover en esta sección tiene alguna particularidad.

El siguiente procedimiento puede aplicarse, en principio, a cualquier tipo de contraste de hipótesis. Es recomendable leer previamente la entrada sobre contrastes de hipótesis del blog [Estadistica4all](http://estadistica4all.com/), principalmente para fijar conceptos e ideas.

La idea es estimar mediante técnicas bootstrap el **p-valor** del contraste.

Para ello debemos disponer del estadístico del contraste bajo $\hspace{0.1cm}H_0 \hspace{0.25cm} \Rightarrow \hspace{0.25cm} \mathcal{T}_{exp|H_0}$ 


Un estadístico de contraste es una variable aleatoria que se puede interpretar como una medida de discrepancia entre $\hspace{0.1cm}H_0\hspace{0.1cm}$ y los datos observados, y además se conoce su distribución de probabilidad bajo $\hspace{0.1cm}H_0$. 

Sirve, por tanto, para medir la discrepancia que hay entre los datos obtenidos y la $\hspace{0.1cm}H_0\hspace{0.1cm}$, y permite cuantificar la probabilidad de cometer error de tipo I, es decir, rechazar $\hspace{0.1cm}H_0\hspace{0.1cm}$ cuando es cierta. El cual es el error que se considera más relevante y por ello se le impone una cota superior $\hspace{0.1cm}\alpha\hspace{0.1cm}$, denominada **nivel de significación**.





$\mathcal{T}_{exp|H_0}\hspace{0.1cm}$ es una función de m.a.s de las variables aleatorias de interés (que pueden ser varias), por lo que es un estadístico, y por tanto una v.a.


Si se dispone de unas muestras de observaciones de las variable aleatorias de interés, se puede obtener una realización muestral del estadístico $\hspace{0.1cm}\mathcal{T}_{exp|H_0}\hspace{0.1cm}$, a la cual denotaremos por $\hspace{0.1cm}T_{exp|H_0}$.

Así que  $\hspace{0.1cm}\mathcal{T}_{exp|H_0}\hspace{0.1cm}$ es el estadístico de contraste como v.a. y $\hspace{0.1cm}\mathcal{T}_{exp|H_0}\hspace{0.1cm}$ es el valor observado del esadistico de contraste a partir de las muestras de observaciones de las variables aleatorias de interés.




## Estimación bootstrap del p-valor


La resolución bootstrap de contrastes de hipotesis pasa por estimar el **p-valor** del contraste del siguiente modo:


- Se obtienen $\hspace{0.1cm}B\hspace{0.1cm}$ muestras bootstrap (aleatoria y con reemplazamiento) de cada una de las muestras de observaciones disponibles de las v.a's de interés.  


- Se calcula para $\hspace{0.1cm} b\in \lbrace 1,...,B \rbrace\hspace{0.1cm}$ la replica bootstrap $\hspace{0.1cm}b$-esima del **estadistico de contraste** $\hspace{0.25cm} \Rightarrow \hspace{0.25cm} T_{exp|H_0}^{(b)} \\$

 

Notese que $\hspace{0.1cm}T_{exp|H_0}^{(b)}\hspace{0.1cm}$ es un valor concreto, no una variable aleatoria. De hecho es la realización muestral del estadistico de contraste $\hspace{0.1cm}\mathcal{T}_{exp|H_0}\hspace{0.1cm}$ (que es una v.a.) para las muestras de observaciones disponibles de las v.a's de interés.  

Asi que se tiene:

$$T_{boot} = \left( T_{exp|H_0}^{(1)} \hspace{0.05cm},\hspace{0.05cm} T_{exp|H_0}^{(2)} \hspace{0.05cm},\dots ,\hspace{0.05cm} T_{exp|H_0}^{(B)} \right)$$


- Se estima el **p-valor** del contraste con el ASL (achieved significance level), cuya definición depende del tipo de contraste se este considerando.

Si el contraste es de cola derecha:

$$ASL = \dfrac{\#\hspace{0.1cm} \left\lbrace \hspace{0.1cm} b=1,...,B \hspace{0.2cm} / \hspace{0.2cm} T_{exp|H_0}^{(b)} \hspace{0.1cm} \geq \hspace{0.1cm} T_{exp|H_0}  \hspace{0.1cm} \right\rbrace}{B}$$


Si el contraste es cola izquierda:

$$ASL = \dfrac{\#\hspace{0.1cm} \left\lbrace \hspace{0.1cm} b=1,...,B \hspace{0.2cm} / \hspace{0.2cm} T_{exp|H_0}^{(b)} \hspace{0.1cm} \leq \hspace{0.1cm} T_{exp|H_0}  \hspace{0.1cm} \right\rbrace}{B}$$



Si el contraste es de dos colas, en general, aunque no siempre:

$$ASL = \dfrac{\#\hspace{0.1cm} \left\lbrace \hspace{0.1cm} b=1,...,B \hspace{0.2cm} / \hspace{0.2cm} T_{exp|H_0}^{(b)} \hspace{0.1cm} \geq \hspace{0.1cm} \left| T_{exp|H_0} \right| \hspace{0.1cm} \right\rbrace}{B} \hspace{0.1cm} + \hspace{0.1cm} \dfrac{\#\hspace{0.1cm} \left\lbrace \hspace{0.1cm} b=1,...,B \hspace{0.2cm} / \hspace{0.2cm} T_{exp|H_0}^{(b)} \hspace{0.1cm} \leq \hspace{0.1cm} - \left| T_{exp|H_0} \right| \hspace{0.1cm} \right\rbrace}{B}$$




 
Donde:

$T_{exp|H_0}(X)\hspace{0.1cm}$ es la realización muestral del estadístico del contrate $\hspace{0.1cm}\mathcal{T}_{exp|H_0}\hspace{0.1cm}$   para las muestras disponibles de las v.a's de interés.

 

<br>




Con el **ASL** estamos estimando el **p-valor**, que es la probabilidad de que bajo $H_0$ se encuentre evidencia igual o más contraria a $H_0$  y favorable a $H_1$ que la ya observada en la muestra original. Si esta porbabilidad es **alta**, se ha observado un suceso muy frecuente bajo $H_0$, lo cual no es indicativo de que $H_0$ sea falsa, por tanto no se rechaza $H_0$. Si por el contrario el p-valor es **bajo**, entonces se ha observado un suceso atipico (poco frecuente) bajo $H_0$, lo cual se interpreta como indicios de que $H_0$ es falsa, por tanto se rechaza $H_0$ y se acepta $H_1$. 

Siguiendo lo anterior, la regla de decisión basada en el p-valor establece que si el p-valor es suficentemente bajo podemos rechazar $H_0$ en favor de $H_1$


Para un nivel de significación $\alpha$, la regla de decisión basada en el p-valor es la siguiente:

$$\text{Rechazar} \hspace{0.1cm} H_0  \hspace{0.1cm} \Leftrightarrow  \hspace{0.1cm} \text{pvalor} < \alpha \\$$

Si estimamos el p-valor con el ASL,  tenemos la siguiente regla de dedcision, para un nivel de significación $\alpha$ :


$$\text{Rechazar} \hspace{0.1cm} H_0  \hspace{0.1cm} \Leftrightarrow  \hspace{0.1cm} ASL < \alpha$$





<br>


## Contraste bootstrap para la media de una poblacion

Partimos de los siguientes elementos:

- Tenemos una v.a. $\hspace{0.1cm}\mathcal{X} \\$

- Tenemos una muestra aleatoria simple $\hspace{0.1cm}\mathcal{X}_1,...,\mathcal{X}_n\hspace{0.1cm}$  de la v.a. $\hspace{0.1cm}\mathcal{X}\\$

- Tenemos una muestra de observaciones $\hspace{0.1cm}X=(x_1,...,x_n)\hspace{0.1cm}$ de $\hspace{0.1cm}\mathcal{X} \\$



### Contraste 

$$
H_0 : \mu = \mu_0 \hspace{1.5cm}  H_0 : \mu = \mu_0 \hspace{1.5cm} H_0 : \mu = \mu_0 \\
H_1 : \mu \neq \mu_0 \hspace{1.5cm}  H_1 : \mu > \mu_0  \hspace{1.5cm} H_1 : \mu < \mu_0 \\
$$


### Estadistico del contraste

Estadistico como función de la m.a.s. 

$$\mathcal{T}_{exp|H_0} \hspace{0.1cm}=\hspace{0.1cm} \dfrac{\overline{\mathcal{X}} - \mu_0}{ \sqrt{\dfrac{n}{n-1} \cdot s_n^2 / n}}$$

Observación: $\hspace{0.1cm}\mathcal{T}_{exp|H_0}\hspace{0.1cm}$ es una v.a.


Estadistico como función de la muestra de observaciones 

$$T_{exp|H_0} \hspace{0.1cm}=\hspace{0.1cm} \dfrac{\overline{X} - \mu_0}{ \sqrt{\dfrac{n}{n-1} \cdot S(X)^2 / n}}$$

Observación: $\hspace{0.1cm}T_{exp|H_0}\hspace{0.1cm}$ es una realizacion de la v.a. $\hspace{0.1cm}\mathcal{T}_{exp|H_0}$


### Estimación bootstrap del pvalor 

El ASL (achived significance level) es una estimación bootstrap del pvalor de un contraste de hipótesis. 

Nuestra propuesta para su cálculo es la siguiente:


- Se obtienen $\hspace{0.1cm}B\hspace{0.1cm}$ muestras bootstrap (aleatoria y con reemplazamiento) de la muestra de observaciones $\hspace{0.1cm}X\hspace{0.1cm}$ de la v.a. de interés $\hspace{0.1cm}\mathcal{X} \hspace{0.25cm} \Rightarrow \hspace{0.25cm} X_{(b)}\\$  


- Se calcula para $\hspace{0.1cm} b\in \lbrace 1,...,B \rbrace\hspace{0.1cm}$ la replica bootstrap $\hspace{0.1cm}b$-esima del **estadistico de contraste**: $\\[0.5cm]$ 

    $$T_{exp|H_0}^{(b)} = T_{exp|H_0}(X_{(b)}) =  \dfrac{\overline{X}_{(b)} - \mu_0}{\hspace{0.1cm} \sqrt{\dfrac{n}{n-1} \cdot S(X_{(b)})^2 / n} \hspace{0.1cm}}\\[1cm]$$

    - Donde:

        - $\overline{X}_{(b)}\hspace{0.1cm}$ es la media  de $\hspace{0.1cm}X_{(b)} \\$

        - $S(X_{(b)})^2\hspace{0.1cm}$ es la varianza de  $\hspace{0.1cm}X_{(b)} \\[1.5cm]$



- Caso $H_0 : \mu = \mu_0  \hspace{0.25cm} \text{vs}  \hspace{0.25cm} H_1 : \mu > \mu_0\\$

$$ASL =  \dfrac{\#\hspace{0.1cm} \left\lbrace \hspace{0.1cm} b=1,...,B \hspace{0.2cm} / \hspace{0.2cm} T_{exp|H_0}^{(b)} \hspace{0.1cm} \geq \hspace{0.1cm} T_{exp|H_0}  \hspace{0.1cm} \right\rbrace}{B} \\[1.2cm]$$



- Caso $H_0 : \mu = \mu_0  \hspace{0.25cm} \text{vs}  \hspace{0.25cm} H_1 : \mu < \mu_0\\$

$$ASL = \dfrac{\#\hspace{0.1cm} \left\lbrace \hspace{0.1cm} b=1,...,B \hspace{0.2cm} / \hspace{0.2cm} T_{exp|H_0}^{(b)} \hspace{0.1cm} \leq \hspace{0.1cm} T_{exp|H_0}  \hspace{0.1cm} \right\rbrace}{B}\\[1.2cm]$$



- Caso $H_0 : \mu = \mu_0  \hspace{0.25cm} \text{vs}  \hspace{0.25cm} H_1 : \mu \neq \mu_0\\$

$$ASL = \dfrac{\#\hspace{0.1cm} \left\lbrace \hspace{0.1cm} b=1,...,B \hspace{0.2cm} / \hspace{0.2cm} T_{exp|H_0}^{(b)} \hspace{0.1cm} \geq \hspace{0.1cm} \left| T_{exp|H_0} \right| \hspace{0.1cm} \right\rbrace}{B} \hspace{0.15cm} + \hspace{0.15cm} \dfrac{\#\hspace{0.1cm} \left\lbrace \hspace{0.1cm} b=1,...,B \hspace{0.2cm} / \hspace{0.2cm} T_{exp|H_0}^{(b)} \hspace{0.1cm} \leq \hspace{0.1cm} - \left| T_{exp|H_0} \right| \hspace{0.1cm} \right\rbrace}{B}$$






<br>

## Contraste bootstrap para las medias de dos poblacion



## Contraste bootstrap para la varianza de una poblacion




## Contraste bootstrap para las varianzas de dos poblacion



## Contraste bootstrap para la mediana de una poblacion



## Contraste bootstrap para la mediana de dos poblaciones


<br>

<br>

# Contrastes de hipotesis basados en permutaciones <a class="anchor" id="1"></a>  


<br>

<br>

# Bootstrap en Regresión Lineal 

## Botstrap en Regresión Lineal basado en residuos

Tenemos un modelo de regresión lineal:

$$y_i = \beta\cdot x_i + \varepsilon_i \forall i \in \lbrace 1,...,n \rbrace\\$$

El modelo de regresión lineal estimado por mínimos cuadrados ordinarios es:

$$y_i = \widehat{\beta}\cdot x_i  \forall i \in \lbrace 1,...,n \rbrace\\$$

Donde:

$$\widehat{\beta} = (X \cdot X^t)^{-1} \cdot X^t \cdot y$$


Recordemos que en el modelo de regresión lineal los residuos estimados del modelo son:


$$\widehat{\varepsilon} = (\widehat{\varepsilon}_1,...,\widehat{\varepsilon}_n)^t\\$$

Donde:

$$\widehat{\varepsilon}_i = y_i - \widehat{\beta}\cdot x_i  \forall i \in \lbrace 1,...,n \rbrace\\$$

Se toma una muestra aleatoria con reemplazamiento de los residuos estimados del modelo: $\\[0.5cm]$


$$\widehat{\varepsilon}^* = (\widehat{\varepsilon}_1^*,...,\widehat{\varepsilon}_n^*)^t\\$$


Donde:


$$\forall j \in  \lbrace 1,...,n \rbrace  \hspace{0.25cm} , \hspace{0.25cm} \exists \hspace{0.1cm} i \in \lbrace 1,...,n \rbrace \hspace{0.25cm} , \hspace{0.25cm} \widehat{\varepsilon}_j^* = \widehat{\varepsilon}_i$$


Las respuestas bootstrap se generan como:

$$y_i^* = x_i \cdot \widehat{\beta} + \varepsilon_i^*  \hspace{0.25cm} , \hspace{0.25cm} \forall j \in  \lbrace 1,...,n \rbrace$$



La estimación bootstrap de $\hspace{0.1cm} \beta\hspace{0.1cm} $ es:


$$\widehat{\beta}\hspace{0.05cm}^* = (X^t \cdot X)^{-1} \cdot X^t \cdot y^* \\$$

Donde:

$$y\hspace{0.05cm}^* = (y_1^* ,..., y_n^*)^t \\$$


La estimación de la varianza de los coeficientes bootstrap es:


$$Var(\widehat{\beta}_j^*) \hspace{0.1cm}=\hspace{0.1cm} \widehat{\sigma}^2_* \cdot q_{jj} \\$$

Donde:

$$q_{jj} \hspace{0.1cm}=\hspace{0.1cm} diag (X^t\cdot X)^{-1} [j+1]$$

$$\widehat{\sigma}^2_* \hspace{0.1cm}=\hspace{0.1cm} Var(\varepsilon_i^*) \hspace{0.1cm}=\hspace{0.1cm} \dfrac{1}{n-p-1} \cdot \sum_{i=1}^n \varepsilon_i^*$$





<br>


## Botstrap en Regresión Lineal basado en pares


Este método consiste en remuestrar con reemplazamiento los pares $z_i = (x_i , y_i)\\$




$\hspace{0.25cm}$ En este caso la muestra bootstrap es la siguiente:

$$z^* = \lbrace  (x_1^* , y_1^*) ,..., (x_n^* , y_n^*)      \rbrace$$

$\hspace{0.25cm}$ Donde:


$$\forall j \in  \lbrace 1,...,n \rbrace  \hspace{0.25cm} , \hspace{0.25cm} \exists \hspace{0.1cm} i \in \lbrace 1,...,n \rbrace \hspace{0.25cm} , \hspace{0.25cm} x_j^* = x_i$$

$$\forall j \in  \lbrace 1,...,n \rbrace  \hspace{0.25cm} , \hspace{0.25cm} \exists \hspace{0.1cm} i \in \lbrace 1,...,n \rbrace \hspace{0.25cm} , \hspace{0.25cm} y_j^* = y_i$$





El modelo de regresión lineal en este caso es:

$$y_i^* = \beta\cdot x_i^* + \varepsilon_i \hspace{0.25cm} , \hspace{0.25cm}\forall i \in \lbrace 1,...,n \rbrace\\$$

El modelo de regresión lineal estimado por mínimos cuadrados ordinarios es:

$$y_i^* = \widehat{\beta}\cdot x_i^*  \hspace{0.25cm} , \hspace{0.25cm}\forall i \in \lbrace 1,...,n \rbrace\\$$

Donde la estimación de minimos cuadrados ordinarios del vector de coeficientes es:

$$\widehat{\beta} = (X^* \cdot {X^*}^{t})^{-1} \cdot {X^*}^{t} \cdot Y^*$$



En este caso:

$$X^* = (x_{1}^* , x_{2}^* , ..., x_{n}^* )^t$$
 
$$Y^* = (y_1^* , ..., y_n^*)^t$$



<br>


# Bootstrap en series temporales











