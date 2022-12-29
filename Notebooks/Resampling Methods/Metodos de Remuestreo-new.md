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




# Variables aleatorias i.i.d. <a class="anchor" id="1"></a>


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


## Jacknife en `Python`


```python
def Jacknife(Variable , estimator_function, q=0.75):

#######################################################

    def Jacknife_sample(X , r):

            X_sample_r = np.delete(X, r)

            return(X_sample_r)


    if estimator_function == np.quantile :  estimation = estimator_function(Variable , q=q)

    else :  estimation = estimator_function(Variable)

        
    replicas_estimador = []

    for r in range(0, len(Variable)):

        if estimator_function == np.quantile :  Jack_estimation = estimator_function( Jacknife_sample(Variable, r) , q=q )

        else :  Jack_estimation = estimator_function( Jacknife_sample(Variable, r) )

        replicas_estimador.append( Jack_estimation )

    
    n = len(Variable)

    sesgo = (n-1) * ( np.mean( replicas_estimador ) - estimation )

    estimacion_sesgo_corregido = estimation - sesgo

    standard_error = np.sqrt( ((n-1)/n) * sum( (replicas_estimador - np.mean( replicas_estimador ))**2 ) )


#######################################################
    
    return(sesgo, estimacion_sesgo_corregido, standard_error)
```


```python
import numpy as np
```

```python
np.random.seed(123)

X = np.random.normal(loc=10, scale=15, size=50)
```


```python
np.median(X)
```

8.23916733155832


```python
sesgo, estimacion_sesgo_corregido, standard_error = Jacknife(X , estimator_function=np.median , q=0.75)
```

```python
sesgo
```

    8.704148513061227e-14


```python
estimacion_sesgo_corregido
```

    8.239167331558233


```python
standard_error
```

    2.381386940718188
 
<br>


```python
np.mean(X)
```


```python
sesgo, estimacion_sesgo_corregido, standard_error = Jacknife(X , estimator_function=np.mean)
```


```python
sesgo
```

    -8.704148513061227e-14

```python
estimacion_sesgo_corregido
```

    10.199071616256864

```python
standard_error
```
      
    2.5491917443460235
 
 
<br> 
 
```python
np.std(X)
``` 
 
```python
sesgo, estimacion_sesgo_corregido, standard_error = Jacknife(X , estimator_function=np.std)
``` 

```python
sesgo
``` 

    -0.26116994703598806

```python
estimacion_sesgo_corregido
``` 

    18.105512157458175

```python
standard_error
``` 

    1.6795955569730596



<br>


```python
np.quantile(X , q=0.75)
``` 

    23.835596841535178

```python
sesgo, estimacion_sesgo_corregido, standard_error = Jacknife(X , np.quantile, q=0.75)
``` 


```python
sesgo
``` 

    -0.14962568429344003
    

```python
estimacion_sesgo_corregido
``` 

    23.98522252582862
    
    
```python
standard_error
``` 

    0.9375849844484524

<br>

```python
import scipy

from scipy.stats import  kurtosis
``` 

```python
kurtosis(X)
``` 

    -0.37420768292897266


```python
sesgo, estimacion_sesgo_corregido, standard_error = Jacknife(X , estimator_function=kurtosis) 
``` 


```python
sesgo
``` 

    -0.03624894442748883

```python
estimacion_sesgo_corregido 
``` 

    -0.33795873850148384

```python
standard_error 
``` 

    0.3609496287814513

```python
from scipy.stats import  skew
``` 



```python
skew(X) 
``` 
    
    0.025587358812510053



```python
sesgo, estimacion_sesgo_corregido, standard_error = Jacknife(X , estimator_function=skew) 
``` 



```python
sesgo 
``` 

    0.021610720628010085

```python
estimacion_sesgo_corregido 
``` 

    0.0039766381844999685

```python
standard_error 
``` 


    0.27115376266443825
    
    
    
    
 

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

## Bootstrap en `Python`

 
```python
def Bootstrap(Variable , B, estimator_function, q=0.75, random_seed=123 ):

#######################################################

    np.random.seed(random_seed)

#######################################################


    def Bootstrap_sample(X):

            from sklearn.utils import resample

            sample = resample( X, n_samples=len(X))

            return sample


    if estimator_function == np.quantile : estimation = estimator_function(Variable , q)
            
    else:  estimation = estimator_function(Variable)


    replicas_estimador = []

    for b in range(0, B):

        if estimator_function == np.quantile : estimation_Boot = estimator_function(Bootstrap_sample(Variable) , q=q)
            
        else:  estimation_Boot = estimator_function(Bootstrap_sample(Variable))

        replicas_estimador.append( estimation_Boot )

    
    sesgo = np.mean( replicas_estimador ) - estimation

    estimacion_sesgo_corregido = estimation - sesgo

    standard_error = np.std( replicas_estimador ) 


#######################################################

    return sesgo , estimacion_sesgo_corregido , standard_error, replicas_estimador
```
 
```python
np.median(X)
```

    8.23916733155832

```python
sesgo , estimacion_sesgo_corregido , standard_error, replicas_estimador = Bootstrap(X , B=20000, estimator_function=np.median)
```

```python
sesgo
```

    0.4499295142913571

```python
estimacion_sesgo_corregido
```

    7.789237817266963

```python
standard_error
```


    3.7580290713770914



<br>


```python
np.mean(X)
```

```python
sesgo , estimacion_sesgo_corregido , standard_error, replicas_estimador = Bootstrap(X , B=20000, estimator_function=np.mean)
```



```python
sesgo
```

    0.02044617187141995

```python
estimacion_sesgo_corregido
```

    10.178625444385357

```python
standard_error
```

    2.5121071650105433


<br>


```python
np.std(X)
```


    17.844342210422187

```python
sesgo , estimacion_sesgo_corregido , standard_error, replicas_estimador = Bootstrap(X , B=20000, estimator_function=np.std)
```

```python
replicas_estimador[0:10]
```

```
[17.290069166352062,
 17.734700491052042,
 18.091905056508867,
 19.296946848609828,
 16.371718686759674,
 17.889036386608268,
 16.84496188781967,
 18.60024334635148,
 20.188328416078278,
 19.38523325913237]
```

```python
sesgo
```

    -0.24900263565758252


```python
estimacion_sesgo_corregido
```

    18.09334484607977

```python
standard_error
```

    1.6154115156505968



<br>



```python
np.quantile(X, q=0.75)
```

    23.835596841535178

```python
sesgo , estimacion_sesgo_corregido , standard_error, replicas_estimador = Bootstrap(X , B=20000, estimator_function=np.quantile, q=0.75)
```

```python
sesgo
```

    -1.006032620023607

```python
estimacion_sesgo_corregido
```

    24.841629461558785

```python
standard_error
```

    3.4665427821179793
    
<br>



```python
skew(X)
```

    0.025587358812510053

```python
sesgo , estimacion_sesgo_corregido , standard_error, replicas_estimador = Bootstrap(X , B=20000, estimator_function=skew)
```



```python
sesgo
```

    0.019212954042191917

```python
estimacion_sesgo_corregido
```
    
    0.006374404770318136

```python
standard_error
```

    0.253427740069774


<br>

```python
kurtosis(X)
```

    -0.37420768292897266

```python
sesgo , estimacion_sesgo_corregido , standard_error, replicas_estimador = Bootstrap(X , B=20000, estimator_function=kurtosis)
```



```python
sesgo
```

    -0.022470288214714473


```python
estimacion_sesgo_corregido
```

    -0.3517373947142582

```python
standard_error
```

    0.35103721258189574

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






## Intervalo de confianza cuantil-bootstrap en `Python`


```python
def cuantil_boot_interval(Variable1, Variable2, alpha, estimator , B,  q=0.75, random_seed=123):

    from itertools import chain 

######################################################################

    np.random.seed(random_seed)

######################################################################

    def Bootstrap_sample(Variable):

        from sklearn.utils import resample

        sample = resample( Variable, n_samples=len(Variable))

        return sample

######################################################################

    replicas_estimador = []


    if estimator == 'mean':

        for b in range(0, B):

            replicas_estimador.append( np.mean( Bootstrap_sample(Variable1) ) )

        estimation = np.mean(Variable1)

######################################################################
#     
    if estimator == 'median':

        for b in range(0, B):

            replicas_estimador.append( np.median( Bootstrap_sample(Variable1) ) )

        estimation = np.median(Variable1)

######################################################################

    if estimator == 'std':

        for b in range(0, B):

            replicas_estimador.append( np.std( Bootstrap_sample(Variable1) ) )

        estimation = np.std(Variable1)

######################################################################

    if estimator == 'skewness':

        from scipy.stats import skew

        for b in range(0, B):

            replicas_estimador.append( skew( Bootstrap_sample(Variable1) ) )

        estimation = skew(Variable1)

######################################################################

    if estimator == 'kurtosis':

        from scipy.stats import kurtosis

        for b in range(0, B):

            replicas_estimador.append( kurtosis( Bootstrap_sample(Variable1) ) )

        estimation = kurtosis(Variable1)

######################################################################

    if estimator == 'quantile':

        for b in range(0, B):

            replicas_estimador.append( np.quantile( Bootstrap_sample(Variable1) , q=q ) )

        estimation = np.quantile(Variable1 , q=q)

######################################################################

    if estimator == 'proportion': # Variable1 debe ser una variable categorica **binaria**.

        for b in range(0, B):

            replicas_estimador.append( np.mean( Bootstrap_sample(Variable1) ) )

        estimation = np.mean(Variable1)



######################################################################

######################################################################

    replicas_estimador_1 , replicas_estimador_2 = [] , []

    
    if estimator == 'mean_diff':

        for b in range(0, B):

            replicas_estimador_1.append( np.mean( Bootstrap_sample(Variable1) ) )

            replicas_estimador_2.append( np.mean( Bootstrap_sample(Variable2) ) )
        
        replicas_estimador_diff = np.array(replicas_estimador_1) - np.array(replicas_estimador_2)

        estimation = np.mean(Variable1) - np.mean(Variable2)      

######################################################################

    if estimator == 'median_diff':

        for b in range(0, B):

            replicas_estimador_1.append( np.median( Bootstrap_sample(Variable1) ) )

            replicas_estimador_2.append( np.median( Bootstrap_sample(Variable2) ) )
        
        replicas_estimador_diff = np.array(replicas_estimador_1) - np.array(replicas_estimador_2)

        estimation = np.median(Variable1) - np.median(Variable2)      

######################################################################

    if estimator == 'std_diff':

        for b in range(0, B):

            replicas_estimador_1.append( np.std( Bootstrap_sample(Variable1) ) )

            replicas_estimador_2.append( np.std( Bootstrap_sample(Variable2) ) )
        
        replicas_estimador_diff = np.array(replicas_estimador_1) - np.array(replicas_estimador_2)

        estimation = np.std(Variable1) - np.std(Variable2)      

######################################################################

    if estimator == 'quantile_diff':

        for b in range(0, B):

            replicas_estimador_1.append( np.quantile( Bootstrap_sample(Variable1), q=q) )

            replicas_estimador_2.append( np.quantile( Bootstrap_sample(Variable2), q=q ) )
        
        replicas_estimador_diff = np.array(replicas_estimador_1) - np.array(replicas_estimador_2)

        estimation = np.quantile(Variable1, q=q) - np.quantile(Variable2, q=q)      

######################################################################

    if estimator == 'skewness_diff':

        from scipy.stats import skew

        for b in range(0, B):

            replicas_estimador_1.append( skew( Bootstrap_sample(Variable1) ) )

            replicas_estimador_2.append( skew( Bootstrap_sample(Variable2) ) )
        
        replicas_estimador_diff = np.array(replicas_estimador_1) - np.array(replicas_estimador_2)

        estimation = skew(Variable1) - skew(Variable2)      

######################################################################

    if estimator == 'kurtosis_diff':

        from scipy.stats import kurtosis

        for b in range(0, B):

            replicas_estimador_1.append( kurtosis( Bootstrap_sample(Variable1) ) )

            replicas_estimador_2.append( kurtosis( Bootstrap_sample(Variable2) ) )
        
        replicas_estimador_diff = np.array(replicas_estimador_1) - np.array(replicas_estimador_2)

        estimation = kurtosis(Variable1) - kurtosis(Variable2)   

######################################################################

    if estimator == 'proportion_diff': # Variable1 y Variable2 deben ser variables categoricas **binarias**.

        for b in range(0, B): 

            replicas_estimador_1.append( np.mean( Bootstrap_sample(Variable1) ) )

            replicas_estimador_2.append( np.mean( Bootstrap_sample(Variable2) ) )
        
        replicas_estimador_diff = np.array(replicas_estimador_1) - np.array(replicas_estimador_2)

        estimation = np.mean(Variable1) - np.mean(Variable2)       

######################################################################
######################################################################

    if estimator in ['mean','median','std','quantile','kurtosis','skewness','proportion']:

        L1_1 = np.quantile( replicas_estimador  , q=alpha/2)

        L2_1 = np.quantile( replicas_estimador  , q=1-alpha/2)

        interval = [L1_1 , L2_1]

######################################################################

    if estimator in ['mean_diff','median_diff','std_diff','quantile_diff','kurtosis_diff','skewness_diff', 'proportion_diff']:
   
        L1_2 = np.quantile( replicas_estimador_diff  , q=alpha/2)

        L2_2 = np.quantile( replicas_estimador_diff  , q=1-alpha/2)

        interval = [L1_2 , L2_2]

######################################################################
######################################################################

    return interval , estimation
```

<br>

**Para la media**

```python
interval , estimation = cuantil_boot_interval(Variable1=X, Variable2='no', alpha=0.05, estimator='mean' , B=20000, random_seed=123)
```

```python
interval
```

    [5.274553626813773, 15.146375204290525]

```python
estimation
```

    10.199071616256777

```python
def CI_Mean(Variable , alpha=0.05):

    n = len(Variable)

    t_alpha_medios = scipy.stats.t.ppf( 1 - alpha/2 , df=n-1)

    X_mean = Variable.mean()

    X_cuasi_var = Variable.std()**2 
    
    # std() esta definida por defecto como la cuasi-desviacion-tipica

    L1 = X_mean - t_alpha_medios * np.sqrt(X_cuasi_var/n)

    L2 = X_mean + t_alpha_medios * np.sqrt(X_cuasi_var/n)

    interval = [L1 , L2]

    return interval , X_mean
```


```python
interval , X_mean = CI_Mean(X , alpha=0.05)
```


```python
interval
```

    [5.127765678327374, 15.27037755418618]



<br>

**Para la desviación típica**


```python
interval , estimation = cuantil_boot_interval(Variable1=X, Variable2='no', alpha=0.05, estimator='std' , B=20000, random_seed=123)
```


```python
interval
```

    [14.427214668666169, 20.756590926218593]


```python
estimation
```

    17.844342210422187


```python
def CI_Variance(Variable , alpha=0.05):

    n = len(Variable)

    chi_alpha_medios = scipy.stats.chi2.ppf( 1 - alpha/2 , df=n-1)

    chi_1_alpha_medios = scipy.stats.chi2.ppf(alpha/2 , df=n-1)

    X_cuasi_var = Variable.std()**2 

    X_var = ( (n-1)/n )*X_cuasi_var
    
    # std() esta definida por defecto como la cuasi-desviacion-tipica

    L1 =  (n*X_var) / chi_alpha_medios

    L2 = (n*X_var) / chi_1_alpha_medios

    interval = [L1 , L2]

    return interval , X_var 
```


```python
interval , X_var = CI_Variance(Variable=X , alpha=0.05)
```


```python
np.sqrt(interval)
```

    array([14.90598594, 22.23643012])

 
 
 
<br>

**Para la mediana**

```python
interval , estimation = cuantil_boot_interval(Variable1=X, Variable2='no', alpha=0.05, estimator='median' , B=20000, random_seed=123)
```

```python
interval
```

    [2.4028635430970975, 15.99323919612726]



```python
estimation
```

    8.23916733155832


<br>


**Para la asimetría**


```python
interval , estimation = cuantil_boot_interval(Variable1=X, Variable2='no', alpha=0.05, estimator='skewness' , B=20000, random_seed=123)
```

```python
interval
```

    [-0.43998686459545305, 0.5624134382838676]


```python
estimation
```

    0.025587358812510053



<br>

**Para la curtosis**

```python
interval , estimation = cuantil_boot_interval(Variable1=X, Variable2='no', alpha=0.05, estimator='kurtosis' , B=20000, random_seed=123)
```

```python
interval 
```
      
    [-0.9952663071794702, 0.38601833503542765]



```python
estimation
```
 
    -0.37420768292897266



<br>

**Para los cuantiles**

```python
interval , estimation = cuantil_boot_interval(Variable1=X, Variable2='no', alpha=0.05, estimator='quantile' , B=20000, random_seed=123, q=0.75)
```

```python
interval
```

    [15.078835764997024, 28.98904388058301]

 
```python
estimation
``` 
 
    23.835596841535178
 


<br>

**Para la proporción**


```python
X_dummy = np.random.uniform(low=0 , high=1, size=50).round()
```

```python
interval , estimation = cuantil_boot_interval(Variable1=X_dummy, Variable2='no', alpha=0.05, estimator='proportion' , B=20000, random_seed=123)
```

```python
interval
```

    [0.46, 0.74]

```python
estimation
```

    0.6


<br>


**Para la diferencia de medias**

```python
np.random.seed(123)

X_1 = np.random.normal(loc=10, scale=15, size=50)

X_2 = np.random.normal(loc=13, scale=15, size=100)
```

```python
interval , estimation = cuantil_boot_interval(Variable1=X_1, Variable2=X_2, alpha=0.05, estimator='mean_diff' , B=20000,  q=0.75, random_seed=123)
```

```python
interval
```

    [-9.788335434742939, 1.810648408844556]


```python
estimation
```

    -4.001757444976697



```python
def CI_Mean_Diference(Variable1 , Variable2 , alpha=0.05):

    X1 = Variable1
    X2 = Variable2

    n1 = len(X1) 
    n2 = len(X2)   

    X1_mean = X1.mean()
    X2_mean = X2.mean()

    X1_cuasi_var = X1.std()**2 
    X2_cuasi_var = X2.std()**2 

    X1_var = ( (n1-1)/n1 )*X1_cuasi_var
    X2_var = ( (n2-1)/n2 )*X2_cuasi_var

    v = ( X1_var/n1 + X2_var/n2 )**2 / ( (X1_var/n1)**2 / (n1-1)  + (X2_var/n2)**2 / (n2-1)  )

    t_alpha_medios = scipy.stats.chi.ppf( 1 - alpha/2 , df=v)
  
  
    L1 =  (X1_mean - X2_mean) - t_alpha_medios * np.sqrt(X1_var/n1 + X2_var/n2)

    L2 =  (X1_mean - X2_mean) + t_alpha_medios * np.sqrt(X1_var/n1 + X2_var/n2)

    interval = [L1 , L2]

    return interval , (X1_mean - X2_mean)  
```

```python
interval , estimation = CI_Mean_Diference(Variable1=X_1 , Variable2=X_2 , alpha=0.05) 
```

```python
interval
```

    [-35.535058586780195, 27.531543696826805]


```python
estimation
```

    -4.001757444976697


<br>

**Para la diferencia de medianas**


```python
interval , estimation = cuantil_boot_interval(Variable1=X_1, Variable2=X_2, alpha=0.05, estimator='median_diff' , B=20000,  q=0.75, random_seed=123)
```

```python
interval
```

    [-13.881285812364158, 3.1918214145850397]



```python
estimation
```

    -6.812252818435496

 

<br>


**Para la diferencia de desviaciones típicas**

```python
interval , estimation = cuantil_boot_interval(Variable1=X_1, Variable2=X_2, alpha=0.05, estimator='std_diff' , B=20000,  q=0.75, random_seed=123)
```

```python
interval
```

    [-1.440066276291272, 5.750492255040537]


```python
estimation
```

    2.297921770341434


 
<br>

**Para la diferencia de cuantiles**

```python
interval , estimation = cuantil_boot_interval(Variable1=X_1, Variable2=X_2, alpha=0.05, estimator='quantile_diff' , B=20000,  q=0.75, random_seed=123)
```

```python
interval
```

    [-12.249938782339909, 4.819498365231816]


```python
estimation
```

    -1.2929002407485939


 

<br>

**Para la diferencia de kurtosis**

```python
interval , estimation = cuantil_boot_interval(Variable1=X_1, Variable2=X_2, alpha=0.05, estimator='kurtosis_diff' , B=20000,  q=0.75, random_seed=123)
```

```python
interval
```

     [-0.504742036075702, 1.1320430654741647]


```python
estimation
```

    0.2817371126835462

 

<br>

**Para la diferencia de asimetrías**

```python
interval , estimation = cuantil_boot_interval(Variable1=X_1, Variable2=X_2, alpha=0.05, estimator='skewness_diff' , B=20000,  q=0.75, random_seed=123)
```

```python
interval
```

    [-0.5445430937619894, 0.6394836839729549]


```python
estimation
```

    0.019079758603481104

 
<br>

**Para la diferencia de proporciones**

```python
np.random.seed(123)

X_dummy_1 = np.random.uniform(low=0 , high=1, size=40).round()

X_dummy_2 = np.random.uniform(low=0 , high=1, size=300).round()
```

```python
interval , estimation = cuantil_boot_interval(Variable1=X_dummy_1, Variable2=X_dummy_2, alpha=0.05, estimator='proportion_diff' , B=20000,  q=0.75, random_seed=123)
```

```python
interval
```

    [-0.22499999999999998, 0.10666666666666663]



```python
estimation
```

    -0.06
    
<br>

## Intervalos BCa en `Python`


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

## Contraste bootstrap en `Python`















<br>

<br>

# Bootstrap en Regresión Lineal 

## Botstrap en Regresión Lineal basado en residuos

Tenemos un modelo de regresión lineal:

$$y_i = \beta\cdot x_i + \varepsilon_i \hspace{0.25cm} , \hspace{0.25cm} \forall \hspace{0.1cm} i \in \lbrace 1,...,n \rbrace\\$$

El modelo de regresión lineal estimado por mínimos cuadrados ordinarios es:

$$y_i = \widehat{\beta}\cdot x_i  \hspace{0.25cm} , \hspace{0.25cm} \forall \hspace{0.1cm} i \in \lbrace 1,...,n \rbrace\\$$

Donde:

$$\widehat{\beta} = (X \cdot X^t)^{-1} \cdot X^t \cdot y\\$$


Recordemos que en el modelo de regresión lineal los residuos estimados del modelo son:


$$\widehat{\varepsilon} = (\widehat{\varepsilon}_1,...,\widehat{\varepsilon}_n)^t\\$$

Donde:

$$\widehat{\varepsilon}_i \hspace{0.1cm}=\hspace{0.1cm} y_i - \widehat{\beta}\cdot x_i  \hspace{0.25cm} , \hspace{0.25cm} \forall \hspace{0.1cm} i \in \lbrace 1,...,n \rbrace\\$$

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



## Regresión lineal bootstrap en `Python`












<br>

<br>

 

# Estimación bootstrap de la varianza de las predicciones de un modelo de aprendizaje supervisado

Consideraremos que una estimacion de la varianza de las predicciones de un modelo de regresion (variable respuesta cuantitativa) $M$ es:

$$\dfrac{1}{h} \sum_{i=1}^{h} \widehat{Var}(\hat{y}_i)$$ 

Cálculo de $\widehat{Var}(\hat{y}_i)$ por remuestreo (en algunos modelos no habra expresiones cerradas para este estimacion, por eso veo interesante un procedimiento general que no dependa del modelo usado):

Tenemos una muestra inicial de predictores y de la respuesta $(X,Y)=(X_1,...,X_p, Y)$ con $n$ filas (observaciones)

Tomamos $B$ muestras bootstrap (muestras aleatorias con reemplazamiento) de $(X,Y)$:

$$(X,Y)_1 ,...,(X,Y)_B$$


Entrenamos el modelo $M$ con cada una de las $B$ muestras bootstrap , asi obtenemos $B$ modelos entrenados diferentes $M_1,..,.M_B$

Notese que el modelo $M_r$ ha sido entrenado con la muestra train de observaciones $(X,Y)_r$

Con cada uno de los $B$ modelos entrenados  $M_1,..,.M_B$ obtener la prediccion de test de la respuesta, es decir $\widehat{Y}^{test}$ , usando una misma muestra fija de test de los predictores $(X_1^{test},...,X_p^{test})$, asi se obtienen $B$ vectores de predcciones de la respuesta $(\widehat{Y}^{test}_1 ,...,\widehat{Y}^{test}_B)$  y con ellos se obtienen $B$ predicciones de la respuesta para la $i$-esima observacion de test de los predictores $x_i^{test} = (x_{i1}^{test} ,..., x_{ip}^{test})^t$  , esto es, se obtiene $\hat{y}_{i}^{boot}=( \hat{y}_{i1}^{test} , ...,\hat{y}_{iB}^{test})$ ,  para $i=1,...,h$


Notese que:

$\widehat{Y}^{test}_r$ es el vector con las predicciones de la respuesta que el modelo entrenado $M_r$ genera usando la muestra test de observaciones de los predictores $(X_1^{test},...,X_p^{test})$ , , para $r=1,...,B$

$\hat{y}_{ir}^{test}$ es la prediccion  de la variable respuesta que el modelo entrenado $M_r$ genera usando la observacion  test de los predictores $x_i^{test}=(x_{i1}^{test} ,..., x_{ip}^{test})^t$ , para $r=1,...,B$

$\hat{y}_{i}^{boot}=( \hat{y}_{i1}^{test} , ...,\hat{y}_{iB}^{test})$ es la prediccion de la respuesta para la observacion de test $x_i^{test}$ hecha por los distintos modelos $M_1,...,M_B$ entrenados. 


Estimamos ${Var}(\hat{y}_i)$ como la varianza de  $\hat{y}_{i}^{boot}=( \hat{y}_{i1}^{test} , ...,\hat{y}_{iB}^{test})$

$$ \widehat{Var}(\hat{y}_i) = \dfrac{1}{B} \sum_{r=1}^{B} \left( {y}_{ir}^{test} - \overline{\hat{y}_{i}^{boot}} \right)^2   $$

Repetimos el proceso con cada $i=1,...,h$, donde $h$ es el tamaño de la muestra de test.

Asi obtenderemos: $\hspace{0.2cm} \widehat{Var}(\hat{y}_1),\widehat{Var}(\hat{y}_2),..., \widehat{Var}(\hat{y}_h)$

Promediamos y obtenimos asi una estimacion de la varianza de las predcciones del modelo:

$$ \dfrac{1}{h} \sum_{i=1}^{h} \widehat{Var}(\hat{y}_i) $$  


<br>

<br>


# Estimación bootstrap del sesgo de las predicciones de un modelo de aprendizaje supervisado

Consideraremos que una estimacion del sesgo de las predicciones de un modelo de regresion (variable respuesta cuantitativa) $M$ es:

$$\dfrac{1}{h} \sum_{i=1}^{h} \widehat{Sesgo}(\hat{y}_i)$$ 


Cálculo de $\widehat{Sesgo}(\hat{y}_i)$ por remuestreo (en algunos modelos no habra expresiones cerradas para este estimacion, por eso veo interesante un procedimiento general que no dependa del modelo usado):

Tenemos una muestra inicial de predictores y de la respuesta $(X,Y)=(X_1,...,X_p, Y)$ con $n$ filas (observaciones)

Tomamos $B$ muestras bootstrap (muestras aleatorias con reemplazamiento) de $(X,Y)$:

$$(X,Y)_1 ,...,(X,Y)_B$$


Entrenamos el modelo $M$ con cada una de las $B$ muestras bootstrap , asi obtenemos $B$ modelos entrenados diferentes $M_1,..,.M_B$

Notese que el modelo $M_r$ ha sido entrenado con la muestra train de observaciones $(X,Y)_r$

Con cada uno de los $B$ modelos entrenados  $M_1,..,.M_B$ obtener la prediccion de test de la respuesta, es decir $\widehat{Y}^{test}$ , usando una misma muestra fija de test de los predictores $(X_1^{test},...,X_p^{test})$, asi se obtienen $B$ vectores de predcciones de la respuesta $(\widehat{Y}^{test}_1 ,...,\widehat{Y}^{test}_B)$  y con ellos se obtienen $B$ predicciones de la respuesta para la $i$-esima observacion de test de los predictores $x_i^{test} = (x_{i1}^{test} ,..., x_{ip}^{test})^t$  , esto es, se obtiene $\hat{y}_{i}^{boot}=( \hat{y}_{i1}^{test} , ...,\hat{y}_{iB}^{test})$ ,  para $i=1,...,h$

Notese que:

$\widehat{Y}^{test}_r$ es el vector con las predicciones de la respuesta que el modelo entrenado $M_r$ genera usando la muestra test de observaciones de los predictores $(X_1^{test},...,X_p^{test})$ , , para $r=1,...,B$

$\hat{y}_{ir}^{test}$ es la prediccion  de la variable respuesta que el modelo entrenado $M_r$ genera usando la observacion  test de los predictores $x_i^{test}=(x_{i1}^{test} ,..., x_{ip}^{test})^t$ , para $r=1,...,B$

$\hat{y}_{i}^{boot}=( \hat{y}_{i1}^{test} , ...,\hat{y}_{iB}^{test})$ es la prediccion de la respuesta para la observacion de test $x_i^{test}$ hecha por los distintos modelos $M_1,...,M_B$ entrenados. 

Notese que sabemos que $y_i^{test}$ es el verdadero valor de la respuesta en la muestra de test para la observacion $x_i^{test}$ 



Estimamos ${Sesgo}(\hat{y}_i)$ como la diferencia entre la media de  $\hat{y}_{i}^{boot}=( \hat{y}_{i1}^{test} , ...,\hat{y}_{iB}^{test})$ y el verdadero valor $y_i^{test}$ de la respuesta en la muestra de test para  la observacion de test $x_i^{test}$

$$\widehat{Sesgo}(\hat{y}_i) = \left( \dfrac{1}{h} \sum_{r=1}^{B}  \hat{y}_{ir}^{test}    \right)- y_i^{test}$$

Repetimos el proceso con cada $i=1,...,h$, donde $h$ es el tamaño de la muestra de test.

Asi obtenderemos: $\hspace{0.2cm} \widehat{Sesgo}(\hat{y}_1),\widehat{Sesgo}(\hat{y}_2),..., \widehat{Sesgo}(\hat{y}_h)$

Promediamos y obtenimos asi una estimacion de la varianza de las predcciones del modelo:

$$ \dfrac{1}{h} \sum_{i=1}^{h} \widehat{Sesgo}(\hat{y}_i) $$  


<br>

----

<br>

# Bibliografía





<br>





