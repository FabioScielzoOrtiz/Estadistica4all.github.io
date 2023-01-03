---
title: ''
author: ''
date: ''
output:
  pdf_document:
    includes:
      in_header: "wrap-code.tex"
      before_body: portada4.sty
    toc_depth: 6
    number_sections: yes
  html_document:
    toc_depth: '6'
    df_print: paged
header_includes:
- \usepackage{longtable}
- \usepackage{lscape}
geometry: left=3cm,right=3cm,top=2cm,bottom=2cm
institute: Universidad Carlos III de Madrid
documentclass: article
papersize: a4
linestrech: 1.5
fontsize: 11pt
urlcolor: blue
---




# Variables aleatorias i.i.d. <a class="anchor" id="1"></a>


<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>

$\hspace{0.25cm}\mathcal{X}_1,...,\mathcal{X}_n\hspace{0.1cm}$ son variables aleatorias mutuamente independientes e idénticamente distribuidas  *(i.i.d.)* $\hspace{0.3cm}\Leftrightarrow$

- $\hspace{0.1cm}$ $\mathcal{X}_1,...,\mathcal{X}_n\hspace{0.08cm}$ son mutuamente independientes , es decir:

$$\hspace{0.08cm} P(\mathcal{X}_1=x_1,...,\mathcal{X}_n=x_n) \hspace{0.1cm}=\hspace{0.1cm} \prod_{i=1}^n P(\mathcal{X}_i=x_i) \\$$

$\hspace{0.7cm}$ Lo que implica que también son independientes dos a dos , es decir, $\hspace{0.12cm} \mathcal{X}_i \perp \mathcal{X}_j \hspace{0.12cm} , \hspace{0.12cm} \forall i\neq j \\$

- $\hspace{0.1cm}$ $\mathcal{X}_1,...,\mathcal{X}_n\hspace{0.12cm}$ tienen la misma distribución de probabilidad, es decir, $\hspace{0.12cm}\mathcal{X}_i \sim F( \cdot ) \hspace{0.15cm}, \hspace{0.1cm} \forall i=1,...,n$ 



</p>
 
</p></span>
</div>

$\hspace{0.4cm}$ Donde $\hspace{0.08cm}F( \cdot )\hspace{0.08cm}$ es una distribucion de probabilidad con parametros no especificados. $\\[0.5cm]$




Usaremos la siguiente notación: $\\[0.2cm]$


$$(\mathcal{X}_1,...,\mathcal{X}_n) \underset{i.i.d.}{\sim} F(\cdot) \hspace{0.3cm} \Leftrightarrow
\left\lbrace\begin{array}{l}   \hspace{0.12cm}\mathcal{X}_1,...,\mathcal{X}_n \hspace{0.2cm} \text{son mutuamente independientes} \\[0.1cm] 
\hspace{0.12cm}\mathcal{X}_i \sim F(\cdot) \hspace{0.12cm} , \hspace{0.12cm} \forall i=1,...,n    \end{array}\right. \\[1cm]$$



<br>

# Muestra Aleatoria Simple

 

Sea $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ una v.a. tal que $\hspace{0.1cm}\mathcal{X} \sim F(\cdot)$ 


$\mathcal{X}_1,...,\mathcal{X}_n \hspace{0.1cm}$ es una muestra aleatoria simple de tamaño $n$ de $\mathcal{X}$ $\hspace{0.2cm}\Leftrightarrow\hspace{0.2cm}$ $(\mathcal{X}_1,...,\mathcal{X}_n) \underset{i.i.d.}{\sim} F(\cdot) \\$

 

**Observación:**

Una m.a.s. de una v.a. $\mathcal{X}$ es un vector de v.a.'s mutuamente independientes y que se distribuyen probabilisticamente igual que la v.a. $\mathcal{X}$


<br>

# Muestra de Observaciones


 

Sea $\hspace{0.12cm}\mathcal{X}\hspace{0.12cm}$ una v.a. tal que $\hspace{0.12cm}\mathcal{X} \sim F(\cdot)$ 


 $X=(x_1,...,x_n)\hspace{0.12cm}$ es una muestra de $\hspace{0.08cm}n\hspace{0.08cm}$ observaciones de la v.a. $\mathcal{X}$ $\hspace{0.2cm}\Leftrightarrow\hspace{0.2cm}$ $x_i \in Im(\mathcal{X}) \hspace{0.12cm} ,\hspace{0.12cm} \forall i\in \lbrace 1,...,n \rbrace$ $\hspace{0.2cm}\Leftrightarrow\hspace{0.2cm}$ $x_i$ es una realización de la v.a. $\mathcal{X}$  , $\hspace{0.12cm}\forall i\in \lbrace 1,...,n \rbrace \\$


 
Donde:

$Im(\mathcal{X})\hspace{0.1cm}$ es la imagen de $\mathcal{X}$, es decir, su campo de variación.



\newpage


**Observaciones:**

- Una muestra de observaciones de una v.a. es un vector de números, no son v.a.'s. 

- Si $\hspace{0.08cm} X=(x_1,...,x_n)\hspace{0.08cm}$ es una muestra de $\hspace{0.08cm}n\hspace{0.08cm}$ observaciones de $\hspace{0.08cm}\mathcal{X}\sim F(\cdot)$ , entonces $\hspace{0.08cm}x_i\hspace{0.08cm}$ es una observacion que ha sido generada por la distribución de probabilidad $\hspace{0.08cm}F(\cdot)\hspace{0.08cm}$, es decir, $\hspace{0.08cm}x_i\hspace{0.08cm}$ puede verse como un numero aleatorio generado en base a la distribución de probabilidad $\hspace{0.08cm} F(\cdot)$ 

- Si $\hspace{0.08cm}X=(x_1,...,x_n)\hspace{0.08cm}$ es una muestra de $\hspace{0.08cm}n\hspace{0.08cm}$ observaciones de $\mathcal{X}\sim F(\cdot)$ , entonces:


    -- $P(\mathcal{X}= x_i)$ es la probabilidad de  observar $x_i$ al extraer una muestra de observaciones de $\mathcal{X}$ $\\[0.2cm]$


- Si $\hspace{0.08cm}(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.08cm}$ es una muestra aleatoria simple (m.a.s.) de tamaño $\hspace{0.08cm}n\hspace{0.08cm}$ de $\hspace{0.08cm}\mathcal{X}\sim F(\cdot)\hspace{0.08cm}$ , entonces:

    -- $P(\mathcal{X}_1 = x_1 , ..., \mathcal{X}_n=x_n)\hspace{0.08cm}$ es la probabilidad de obtener como valores $\hspace{0.08cm}(x_1,...,x_n)\hspace{0.08cm}$ al extraer una muestra de observaciones de $\hspace{0.08cm}\mathcal{X}\\$

 


# Estadístico


<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
 
 $T\hspace{0.1cm}$ es un estadístico de una m.a.s $\hspace{0.1cm}(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ de la v.a. $\hspace{0.1cm}\mathcal{X}\sim F(\theta)$ $\hspace{0.25cm}\Leftrightarrow\hspace{0.25cm}$ $T\hspace{0.1cm}$ es una función de la m.a.s que no depende  del parámetro $\hspace{0.1cm}\theta$

 

Por tanto:

- $T(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ es un estadístico.  


\vspace{0.2cm}

**Observaciones:**

- $T(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ es una v.a. al ser una función de v.a.'s 

- Dada una muestra de observaciones $\hspace{0.1cm}(x_1 ,..., x_n)\hspace{0.1cm}$ de  la v.a. $\hspace{0.1cm}\mathcal{X} \sim D(\theta)$ 

    -- $T(x_1,...,x_n)\hspace{0.1cm}$ es una observación de la v.a. $\hspace{0.1cm}T(\mathcal{X}_1,...,\mathcal{X}_n) \\$


- Dadas $\hspace{0.1cm}B\hspace{0.1cm}$ muestras de observaciones $\hspace{0.1cm}(x_1^1 , ..., x_n^1)\hspace{0.1cm} ,...,\hspace{0.1cm}(x_1^B,...,x_n^B)\hspace{0.2cm}$ de la v.a. $\hspace{0.1cm}\mathcal{X} \sim D(\theta)$ 

     -- $T(x_1^1 , ..., x_n^1) \hspace{0.1cm},...,\hspace{0.1cm} T(x_1^B,...,x_n^B)\hspace{0.2cm}$ es una muestra de observaciones de la v.a. $\hspace{0.1cm}T(\mathcal{X}_1,...,\mathcal{X}_n)$


\newpage

## Ejemplos de estadisticos


Sea $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ una v.a. tal que $\hspace{0.1cm}\mathcal{X} \sim D(\theta)\hspace{0.1cm}$ , y sea $\hspace{0.1cm}(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ una m.a.s. de $\hspace{0.1cm} \mathcal{X} \\$


- **Media muestral**

$$T(\mathcal{X}_1,...,\mathcal{X}_n) = \overline{\mathcal{X}} = \dfrac{1}{n} \sum_{i=1}^n \mathcal{X}_i \\[1cm]$$


- **Varianza muestral**

$$T(\mathcal{X}_1,...,\mathcal{X}_n) = S^2 = \dfrac{1}{n} \sum_{i=1}^n (\mathcal{X}_i - \overline{\mathcal{X}})^2 \\[1cm]$$


- **Cuasi-Varianza muestral**

$$T(\mathcal{X}_1,...,\mathcal{X}_n) = S^2 = \dfrac{1}{n-1} \sum_{i=1}^n (\mathcal{X}_i - \overline{X})^2 \\$$




\vspace{0.2cm}


# Estimador Puntual

 
$\hspace{0.25cm}$ Dada una v.a. $\hspace{0.1cm}\mathcal{X}\sim D(\theta)\hspace{0.1cm}$ y una m.a.s. $\hspace{0.1cm}(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ de $\hspace{0.1cm}\mathcal{X}$, 

$\hspace{0.25cm}$ Un estimador puntual para el parametro $\hspace{0.1cm}\theta\hspace{0.1cm}$ es un estadistico $\hspace{0.1cm}\widehat{\theta}(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ que se propone para estimar $\hspace{0.1cm}\theta$

 



\vspace{0.2cm}


# Estimación Puntual
 

$\hspace{0.25cm}$ Dada una v.a. $\hspace{0.1cm}\mathcal{X}\sim D(\theta)\hspace{0.1cm}$ , una m.a.s. $\hspace{0.1cm}(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ de $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ y un estadistico $\hspace{0.1cm}\widehat{\theta}(\mathcal{X}_1,...,\mathcal{X}_n)$

$\hspace{0.25cm}$ Si  $\hspace{0.1cm}X=(x_1,...,x_n)\hspace{0.1cm}$ es una muestra de observaciones  de $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ , entonces:

- $\hspace{0.1cm}$$\widehat{\theta}(X) = \widehat{\theta}(x_1,...,x_n)\hspace{0.1cm}$ es una estimación puntual del parametro $\hspace{0.1cm}\theta$

\vspace{0.2cm}


**Observaciones:**

Un estimador puntual es una v.a. y una estimación puntual un número.



\newpage

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






\newpage





# Estimación del sesgo y varianza por Jacknife

Tenemos una v.a. $\mathcal{X}\sim D(\theta)$ , una m.a.s. $(\mathcal{X}_1,...,\mathcal{X}_n)$ de $\mathcal{X}$ y un estimador $\widehat{\theta}(\mathcal{X}_1,...,\mathcal{X}_n)$ del parámetro $\theta$


Además tenemos una muestra de observaciones $\hspace{0.1cm}X=(x_1,...,x_n)\hspace{0.1cm}$   de la variable de interés $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ , por lo que tenemos la estimación  $\widehat{\theta}(X)=\widehat{\theta}(x_1,...,x_n)\hspace{0.1cm}$ del parámetro $\theta \\$


 

$\hspace{0.25cm}$ Se define $\hspace{0.1cm}X_{(r)}\hspace{0.1cm}$ como la muestra que contiene todos los valores de $\hspace{0.1cm}X\hspace{0.1cm}$ excepto $\hspace{0.1cm}x_{r}$

$\hspace{0.25cm}$ Es decir:


$$X_{(r)} = (\hspace{0.05cm}x_{1}\hspace{0.05cm},\hspace{0.05cm} x_{2}\hspace{0.05cm},..,\hspace{0.05cm} x_{r-1}\hspace{0.05cm},\hspace{0.05cm}x_{r+1}\hspace{0.05cm} ,..,\hspace{0.05cm} x_{n}\hspace{0.05cm})$$  

$\hspace{0.35cm}$ para  $\hspace{0.2cm} r=1,...,n \\$

 

$\hspace{0.25cm}$ Se define la replica $\hspace{0.1cm}r$-esima del estimador $\hspace{0.1cm}\widehat{\theta}\hspace{0.1cm}$ como: $\\[0.5cm]$

$$\widehat{\theta}_{(r)} = \widehat{\theta}(X_{(r)})= \widehat{\theta}(\hspace{0.05cm}x_{1}\hspace{0.05cm},\hspace{0.05cm} x_{2}\hspace{0.05cm},..,\hspace{0.05cm} x_{r-1}\hspace{0.05cm},\hspace{0.05cm}x_{r+1}\hspace{0.05cm} ,..,\hspace{0.05cm} x_{n}\hspace{0.05cm})$$


 
 
\vspace{0.3cm}




## Estimación Jacknife del sesgo

 

$\hspace{0.25cm}$ La **estimación Jacknife** del **sesgo** del estimador $\hspace{0.1cm}\widehat{\theta}\hspace{0.1cm}$ se define como: $\\[0.5cm]$

$$\widehat{Sesgo}(\widehat{\theta})_{Jack} \hspace{0.1cm}=\hspace{0.1cm}  (n-1) \cdot \left(   \dfrac{1}{n} \cdot \sum_{r=1}^{n} \widehat{\theta}_{(r)} \hspace{0.1cm} -\hspace{0.1cm} \widehat{\theta}(X) \right)$$



$\hspace{0.25cm}$ Donde:

$$\widehat{\theta}(X) \hspace{0.1cm}=\hspace{0.1cm} \widehat{\theta}(x_1,...,x_n)$$

$$\widehat{\theta}_{(r)} = \widehat{\theta}(X_{(r)})= \widehat{\theta}(\hspace{0.05cm}x_{1}\hspace{0.05cm},\hspace{0.05cm} x_{2}\hspace{0.05cm},..,\hspace{0.05cm} x_{r-1}\hspace{0.05cm},\hspace{0.05cm}x_{r+1}\hspace{0.05cm} ,..,\hspace{0.05cm} x_{n}\hspace{0.05cm})$$


 

\newpage



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


\vspace{0.25cm}

**Observación:**

El Jacknife funciona bien cuando el estimador es suave (smooth). 

Un estimador es suave cuando ante pequeños cambios en la muestra de datos genera pequeños cambios en el estimador.

Ejemplo de estimador suave es el estimador plug-in de la media poblacional, es decir la media muestral.

Ejemplo de estimador no suave es el estimador plug-in de la mediana poblacional, es decir la mediana muestral


 


\newpage



## Estimación Jacknife de un parametro con corrección de sesgo


Tenemos una v.a. $\hspace{0.1cm}\mathcal{X}\sim D(\theta)\hspace{0.1cm}$ , una m.a.s. $\hspace{0.1cm}(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ de $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ y un estimador $\hspace{0.1cm}\widehat{\theta}(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ del parametro $\hspace{0.1cm}\theta$


Además tenemos una muestra de observaciones $\hspace{0.1cm}X=(x_1,...,x_n)\hspace{0.1cm}$   de la variable de interés $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ , por lo que tenemos la estimación  $\hspace{0.1cm}\widehat{\theta}(X)=\widehat{\theta}(x_1,...,x_n)\hspace{0.1cm}$ del parámetro $\hspace{0.1cm} \theta \\[0.5cm]$


 
$\hspace{0.25cm}$ La **estimación Jacknife con sesgo corregido** del parametro $\hspace{0.1cm} \theta\hspace{0.1cm}$ se define como: $\\[0.5cm]$

$$
\widehat{\theta}_{Jack} \hspace{0.2cm}=\hspace{0.2cm} \widehat{\theta}(X) \hspace{0.1cm}-\hspace{0.1cm} \widehat{Sesgo}(\widehat{\theta})_{Jack} \ \hspace{0.2cm}=\hspace{0.2cm} \widehat{\theta}(X) -  (n-1) \cdot \left(    \dfrac{1}{n} \cdot \sum_{r=1}^{n} \widehat{\theta}_{(r)}
 - \widehat{\theta} \right) \hspace{0.2cm}=\hspace{0.2cm}   n\cdot \widehat{\theta}(X) - (n-1)\cdot  \dfrac{1}{n} \cdot \sum_{r=1}^{n} \widehat{\theta}_{(r)} \\
$$

$\hspace{0.25cm}$ Donde:

$$\widehat{\theta} \hspace{0.1cm} =\hspace{0.1cm} \widehat{\theta}(X)\hspace{0.1cm} =\hspace{0.1cm} \widehat{\theta}(x_1,...,x_n)$$

$$\widehat{\theta}_{(r)} = \widehat{\theta}(X_{(r)})= \widehat{\theta}(\hspace{0.05cm}x_{1}\hspace{0.05cm},\hspace{0.05cm} x_{2}\hspace{0.05cm},..,\hspace{0.05cm} x_{r-1}\hspace{0.05cm},\hspace{0.05cm}x_{r+1}\hspace{0.05cm} ,..,\hspace{0.05cm} x_{n}\hspace{0.05cm})$$

 

\newpage


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


\newpage

```python
import numpy as np
```

```python
np.random.seed(123)

X = np.random.normal(loc=10, scale=15, size=50)
```

\vspace{0.4cm}

**Jacknife para la mediana:**

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
 

\vspace{0.4cm}


**Jacknife para la media:**


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
 
 
\vspace{0.4cm}


**Jacknife para la desviación típica:**
 
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



\vspace{0.4cm}

 

**Jacknife para los cuantiless:**

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

\vspace{0.4cm}



**Jacknife para la curtosis:**

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



\vspace{0.4cm}


**Jacknife para la asimetria:**

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
    
    
    

\newpage



# Estimación del sesgo , varianza y error cuadratico medio de un estimador por Bootstrap


Tenemos una v.a. $\mathcal{X}\sim D(\theta)$ , una m.a.s. $\mathcal{X}_1,...,\mathcal{X}_n)$ de $\mathcal{X}$ y un estimador $\widehat{\theta}(\mathcal{X}_1,...,\mathcal{X}_n)$ del parámetro $\theta$


Además tenemos una muestra de observaciones $X=(x_1,...,x_n)$   de la variable de interés $\mathcal{X}$ , por lo que tenemos la estimación $\hspace{0.1cm}\widehat{\theta}(X)=\widehat{\theta}(x_1,...,x_n)\hspace{0.1cm}$ del parametro $\theta\\$ 





Una **muestra bootstrap**  de $X=(x_1,...,x_n)\hspace{0.1cm}$ se define como una **muestra aleatoria con reemplazamiento** de tamaño $n$ de $X$ 


Tenemos $B$ muestras bootstrap de $X$ : 

$$X_{(1)},X_{(2)},...,X_{(B)} \\$$


Se define la replica bootstap $\hspace{0.1cm}b$-esima del estimador $\hspace{0.1cm}\widehat{\theta}$ como: 

$$\widehat{\theta}_{(b)} = \widehat{\theta}(X_{(b)})$$




\vspace{0.3cm}


## Estimación bootstrap del sesgo de un estimador


 

$\hspace{0.25cm}$ La **estimación bootstrap** del **sesgo** del estimador $\hspace{0.1cm}\widehat{\theta}\hspace{0.1cm}$ se define como: $\\[0.5cm]$


$$\widehat{Sesgo}(\widehat{\theta})_{Boot} \hspace{0.12cm} =\hspace{0.12cm}  \dfrac{1}{B} \cdot \sum_{b=1}^{B} \left( \widehat{\theta}_{(b)}  - \widehat{\theta}(X) \right) \hspace{0.12cm}=\hspace{0.12cm}  \dfrac{1}{B} \cdot \sum_{b=1}^{B}  \widehat{\theta}_{(b)}  \hspace{0.1cm} -\hspace{0.1cm} \widehat{\theta}(X)$$


$\hspace{0.25cm}$ Donde:

$$\widehat{\theta}_{(b)} = \widehat{\theta}(X_{(b)})$$

$$\widehat{\theta}(X) \hspace{0.12cm} =\hspace{0.12cm}  \widehat{\theta}(x_1,...,x_n)\\$$



\vspace{0.2cm}

**Observación:**

La estimación bootstrap del sesgo del estimador $\hspace{0.12cm}\widehat{\theta}\hspace{0.12cm}$ es la media del vector de replicas bootstrap $\hspace{0.12cm}(\widehat{\theta}_{(1)},\widehat{\theta}_{(2)},...,\widehat{\theta}_{(B)})\hspace{0.12cm}$ menos la estimación $\widehat{\theta}(X)$



\newpage


## Estimación bootstrap de la varianza de un estimador


 

$\hspace{0.25cm}$ La **estimación Bootstrap** de la **varianza** del estimador $\hspace{0.1cm}\widehat{\theta}\hspace{0.1cm}$ se define como: $\\[0.5cm]$

$$\widehat{Var}(\widehat{\theta})_{Boot} \hspace{0.12cm} =\hspace{0.12cm}   \dfrac{1}{B-1} \cdot \sum_{b=1}^{B} \left( \widehat{\theta}_{(b)}  \hspace{0.1cm}-\hspace{0.1cm} \dfrac{1}{B} \cdot \sum_{b=1}^{B} \widehat{\theta}_{(b)} \right)^2 \\[0.8cm]$$

$\hspace{0.25cm}$ Donde:


 
$$\widehat{\theta}_{(b)} = \widehat{\theta}(X_{(b)})$$

 
 

 
La **estimación bootstrap** de la **desviación típica** del estimador $\hspace{0.1cm}\widehat{\theta}\hspace{0.1cm}$ se define como: $\\[0.5cm]$

$$\widehat{s.e.}(\widehat{\theta})_{Boot} \hspace{0.12cm} =\hspace{0.12cm}   \sqrt{ \widehat{Var}(\widehat{\theta})_{Boot}   }\\$$


 
\vspace{0.2cm}


**Observación:**

La estimación bootstrap de la varianza del estimador $\hspace{0.12cm}\widehat{\theta}\hspace{0.12cm}$ es la cuasi-varianza del vector de replicas bootstrap $\hspace{0.12cm}(\widehat{\theta}_{(1)},\widehat{\theta}_{(2)},...,\widehat{\theta}_{(B)})$



\vspace{0.3cm}



## Estimación bootstrap del error cuadratico medio de un estimador

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>


$\hspace{0.25cm}$ La **estimación Bootstrap** del **error cuadrático medio** del estimador $\hspace{0.1cm}\widehat{\theta}\hspace{0.1cm}$ se define como: $\\[0.5cm]$

$$\widehat{ECM}(\widehat{\theta})_{Boot} \hspace{0.12cm} =\hspace{0.12cm}   \dfrac{1}{B} \cdot \sum_{b=1}^{B} \left( \widehat{\theta}_{(b)}  - \widehat{\theta}(X) \right)^2\\$$


$\hspace{0.25cm}$ Donde:

$$\widehat{\theta}_{(b)} = \widehat{\theta}(X_{(b)})$$

$$\widehat{\theta}(X) \hspace{0.12cm} =\hspace{0.12cm}  \widehat{\theta}(x_1,...,x_n)\\$$




\newpage



## Estimación bootstrap  de un parametro con corrección de sesgo
 

$\hspace{0.25cm}$ La **estimación Bootstrap con sesgo corregido** del parametro $\hspace{0.1cm} \theta\hspace{0.1cm}$ se define como: $\\[0.5cm]$

$$
\widehat{\theta}_{Boot} \hspace{0.2cm}=\hspace{0.2cm} \widehat{\theta}(X) \hspace{0.1cm}-\hspace{0.1cm} \widehat{Sesgo}(\widehat{\theta})_{Boot} \ \hspace{0.2cm}=\hspace{0.2cm}  \widehat{\theta}(X) \hspace{0.1cm} -\hspace{0.1cm}\hspace{0.1cm} \dfrac{1}{B} \cdot \sum_{b=1}^{B} \left( \widehat{\theta}_{(b)}  - \widehat{\theta}(X) \right) \\
$$

$\hspace{0.25cm}$ Donde:

$$\widehat{\theta}_{(b)} = \widehat{\theta}(X_{(b)})$$

$$\widehat{\theta}(X)\hspace{0.1cm} =\hspace{0.1cm} \widehat{\theta}(x_1,...,x_n)$$



 
\vspace{0.3cm}

## Número de muestras bootstrap posibles










\newpage






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


\newpage



**Bootstrap para la mediana:**
 
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



\vspace{0.4cm}

**Bootstrap para la media:**


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


\newpage


**Bootstrap para la desviación típica:**

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



 

\newpage


**Bootstrap para los cuantiles:**

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
    


\vspace{0.4cm}


**Bootstrap para la asimetría:**

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


\newpage


**Bootstrap para la curtosis:**

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





\newpage




# Fundamentos del Bootstrap

## La función de distribución  

Dada una v.a. $\mathcal{X}\sim D(\theta)$ y una m.a.s. $(\mathcal{X}_1,...,\mathcal{X}_n)$ de $\mathcal{X}$  

 

La **función de distribución** de la v.a. $\mathcal{X}$ es : $\\[0.7cm]$

$$F_{X}(z) = P(X \leq z)  \hspace{0.2cm}, \hspace{0.2cm}\forall z \in \mathbb{R}$$

 
\vspace{0.3cm}



**Observación:**

La función de distribución de la v.a. $\mathcal{X}$ coincide con las funciones de distribución de las v.a's $\mathcal{X}_1,...,\mathcal{X}_n \\$ , porque tienen la misma distribución de probabilidad.

$$F_{X}(z) = F_{X_i}(z) \hspace{0.2cm}, \hspace{0.2cm}\forall z \in \mathbb{R} \hspace{0.2cm},\hspace{0.2cm} \forall i \in \lbrace 1,...,n \rbrace$$




\vspace{0.3cm}




## La función de distribución empírica

Dada una v.a. $\hspace{0.1cm}\mathcal{X}\sim D(\theta)\hspace{0.1cm}$


<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
cmpan>

$\hspace{0.25cm}$  La función de distribución empírica basada en una m.a.s. $\hspace{0.1cm}(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ de $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ se define como:


$$\widehat{F}_n(z) \hspace{0.1cm} = \hspace{0.1cm} \dfrac{1}{n} \sum_{i=1}^n  I(\mathcal{X}_i \geq z) $$

$\hspace{0.25cm}$  donde:

$$I(X_i \geq z) =  \left\lbrace\begin{array}{l}   \hspace{0.12cm} 1 \hspace{0.2cm},\hspace{0.3cm} \text{si} \hspace{0.3cm} X_i \geq z \\[0.1cm] 
\hspace{0.12cm} 0 \hspace{0.2cm},\hspace{0.3cm} \text{si} \hspace{0.3cm} X_i > z \\[0.1cm] 
\end{array}\right.$$

$\hspace{0.35cm}$  para $\hspace{0.1cm} z\in \mathbb{R}$

</p>
 
 
\vspace{0.3cm}


**Observaciones:**

- $\widehat{F}_n(z)\hspace{0.1cm}$ es una v.a. $\\[0.5cm]$

- $\widehat{F}_n(z)\hspace{0.1cm}$ es usada como estimador de $\hspace{0.1cm}F_X(z)$




\newpage



### Porpiedades de la función de distribución empírica como v.a.

 

$\hspace{0.2cm}$ Algunas propiedades de la distribución empírica como variable aleatoria:

- $\hspace{0.2cm} I(X_i \geq z) \hspace{0.2cm}\sim\hspace{0.2cm} Bernoulli\left( p \right) \hspace{0.2cm} ,\hspace{0.2cm}  \text{con}\hspace{0.2cm} \hspace{0.2cm} p=F_X(z)=P(X<z)\\[0.2cm]$

- $\hspace{0.2cm}  \sum_{i=1}^n  I(X_i \geq z) \hspace{0.2cm}\sim\hspace{0.2cm} Binomial(n , p  ) \hspace{0.2cm} ,\hspace{0.2cm}  \text{con}\hspace{0.2cm} \hspace{0.2cm} p=F_X(z)=P(X<z) \\[0.2cm]$

- $\hspace{0.2cm} \widehat{F}_n(z) \hspace{0.1cm} = \hspace{0.1cm}   \dfrac{1}{n} \sum_{i=1}^n  I(X_i \geq z) \hspace{0.2cm}\sim\hspace{0.2cm}  \dfrac{1}{n} \cdot Binomial(n , p  )\\$

    $\hspace{0.2cm} \text{donde}\hspace{0.2cm} p\hspace{0.1cm}=\hspace{0.1cm}F_X(z)\hspace{0.1cm}=\hspace{0.1cm}P(X<z) \\[0.2cm]$


- $E\left[ \widehat{F}_n(z)  \right] \hspace{0.1cm}=\hspace{0.1cm}  E \left[ \dfrac{1}{n} \cdot Binomial(n , p  ) \right] \hspace{0.1cm}=\hspace{0.1cm} \dfrac{1}{n} \cdot n \cdot  p  \hspace{0.1cm}=\hspace{0.1cm} p \hspace{0.1cm}=\hspace{0.1cm} F_X(z)=P(X<z) \\[0.2cm]$


- $Var\left[ \widehat{F}_n(z)  \right] \hspace{0.1cm}=\hspace{0.1cm} Var \left[ \dfrac{1}{n} \cdot Binomial(n , p  ) \right]\hspace{0.1cm}=\hspace{0.1cm} \dfrac{1}{n^2} \cdot n \cdot  p \cdot (1-p) = \\[0.25cm] \hspace{0.1cm}=\hspace{0.1cm} \dfrac{1}{n} \cdot  F_X(z)\cdot (1- F_X(z))  \hspace{0.1cm}=\hspace{0.1cm} F_X(z)=P(X<z) \\[0.2cm]$


</p>
 
</p></span>
</div>

<br>

\newpage


## Función de distribución empírica como estimación de la funcion de distribución



$\hspace{0.25cm}$ Si tenemos una muestra de observaciones $\hspace{0.1cm}X=(x_1,...,x_n)\hspace{0.1cm}$   de la variable de interés $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$  


$\hspace{0.25cm}$ Tenemos la siguiente **estimación** de la función de distribución de $\mathcal{X}$ a través de la funcion de distribución emprica:

$$\widehat{F}_n(z) \hspace{0.1cm}=\hspace{0.1cm} \dfrac{1}{n} \sum_{i=1}^n  I(x_i \geq z) \hspace{0.1cm} = \hspace{0.1cm} \dfrac{\# \lbrace \hspace{0.1cm}  i=1,..,n\hspace{0.1cm}  / \hspace{0.1cm}  x_i \geq z\hspace{0.1cm}  \rbrace}{n} \hspace{0.3cm} , \hspace{0.3cm} z\in \mathbb{R}\\$$


 

\vspace{0.35cm}
 


**Propiedades de la función de distribución empírica como estimación**

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

- $\widehat{F}_n(z) \hspace{0.1cm}=\hspace{0.1cm} Q(X , z)\\$

    Donde: $\hspace{0.2cm} Q(X , z)\hspace{0.1cm}$  es el cuantil de orden $\hspace{0.1cm}z\hspace{0.1cm}$ de $\hspace{0.1cm}X=(x_1,...,x_n) \\$



- Si se ordena la muestra $\hspace{0.1cm}X=(x_1,...,x_n)\hspace{0.1cm}$ de menor a mayor $x_{(1)}\hspace{0.1cm}<\hspace{0.1cm}x_{(2)}\hspace{0.1cm}<...<\hspace{0.1cm}x_{(n)}\hspace{0.1cm}$ , entonces: 


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

 

\newpage

## Ley debil de los grandes números

La ley debil de los grandes números afirma lo siguiente:

Dada una v.a. $\hspace{0.1cm}\mathcal{X}\sim D(\theta)\hspace{0.1cm}$ tal que $\hspace{0.1cm}E[\mathcal{X}]=\mu\hspace{0.1cm}$

Si $\widehat{F}_n(z)$ es la función de distribución empirica basada en la m.a.s. $\hspace{0.1cm}(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ de $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ , se cumple que:

$$\dfrac{1}{n} \sum_{i=1}^n \mathcal{X}_i \hspace{0.25cm}\underset{p}{\rightarrow}\hspace{0.25cm} E[X]=\mu$$


\vspace{0.25cm}


**Observación:** $E[X]=E[X_i] \hspace{0.25cm},\hspace{0.25 cm} \forall i \in \lbrace 1,...,n \rbrace$



 \vspace{1cm}
 
Podemos aplicar la ley de los grandes números a la distribución empirica:

  Como $\hspace{0.15cm}I(\mathcal{X}_i \geq z) \sim Bernoulli(p)\hspace{0.15cm}$ , con $\hspace{0.15cm}E\left[I(\mathcal{X}_i \geq z)\right]\hspace{0.1cm} =\hspace{0.1cm} p\hspace{0.1cm}=\hspace{0.1cm}F_X(z)\hspace{0.1cm}=\hspace{0.1cm}P(X \leq z)\\$

 Aplicando la ley debil de los grandes números tenemos lo siguiente:


$$\widehat{F}_n(z) \hspace{0.1cm} = \hspace{0.1cm} \dfrac{1}{n} \sum_{i=1}^n  I(\mathcal{X}_i \geq z) \hspace{0.25cm}\underset{p}{\rightarrow} \hspace{0.25cm} p=F_X(z) \\$$

 En conclusión:

$$\widehat{F}_n(z) \hspace{0.25cm}\underset{p}{\rightarrow} \hspace{0.25cm} F_X(z)\\$$



  Usando la definición de convergencia en probabilidad, se tiene que: $\\[0.5cm]$


$$\underset{n\rightarrow \infty}{lim} \hspace{0.1cm} P\left( \hspace{0.1cm} | \widehat{F}_n(z) - F_X(z) |\hspace{0.1cm} \leq \varepsilon \right) \hspace{0.1cm}=\hspace{0.1cm} 1 \hspace{0.25cm},\hspace{0.25cm} \forall \varepsilon > 0 \\$$

 
\vspace{0.55cm}

Pero se cumple un resultado más fuerte aun, el **teorema de Glivenko-Cantelli**.

## Teorema de Glivenko-Cantelli

Dada una v.a. $\mathcal{X}\sim D(\theta)$ tal que $E[\mathcal{X}]=\mu \\$ 

Si $\widehat{F}_n(z)$ es la función de distribución empirica basada en la m.a.s. $(\mathcal{X}_1,...,\mathcal{X}_n)$ de $\mathcal{X}$ , se cumple que: 

$$sup \left\lbrace \hspace{0.1cm}\left|\hspace{0.1cm} \widehat{F}_n(z)  - F_X(z)\hspace{0.1cm} \right| \hspace{0.15cm}  / \hspace{0.15cm} z \in \mathbb{R} \hspace{0.1cm}\right\rbrace \hspace{0.25cm}\underset{p}{\rightarrow} \hspace{0.25cm} 0\\$$



\newpage

### Demostración del teorema de Glivenko-Cantelli










 
\newpage
 


# Intervalos de confianza basados en bootstrap

Las desviaciones típicas o errores estándar se pueden usar para calcular intervalos de confianza aproximados para los parametros de interés.



## Intervalos cuantil-bootstrap con una población

Primero vamos a fijar una vez mas el contexto en el que no estamos moviendo, puesto que es importante recordarlo:


Tenemos una v.a. $\mathcal{X}\sim D(\theta)$ , una m.a.s. $(\mathcal{X}_1,...,\mathcal{X}_n)$ de $\mathcal{X}$ y un estimador $\widehat{\theta}(\mathcal{X}_1,...,\mathcal{X}_n)$ del parámetro $\theta$


Además tenemos una muestra de observaciones $X=(x_1,...,x_n)$   de la variable de interés $\mathcal{X}$ , por lo que tenemos la estimación $\widehat{\theta}(X)=\widehat{\theta}(x_1,...,x_n)$ del parámetro $\theta$ 



\vspace{0.25cm}


- Se obtienen $B$ muestras bootstrap (aleatorias y con reemplazamiento) de $X$ :

$$X_{(1)},X_{(2)},...,X_{(B)} \\$$


- Se calcula para $b\in \lbrace 1,...,B \rbrace$ la replica bootstrap $\hspace{0.1cm}b$-esima del estimador $\hspace{0.1cm}\widehat{\theta}$ como: 


$$\widehat{\theta}_{(b)} = \widehat{\theta}(X_{(b)}) \\$$


Asi que se tiene:

$$\widehat{\theta}_{boot} = \left(\widehat{\theta}_{(1)},...,\widehat{\theta}_{(B)} \right)$$


\vspace{1.5cm}
 
Sea $\hspace{0.1cm}Q(\alpha \hspace{0.05cm} ,  \hspace{0.05cm} \widehat{\theta}_{boot})\hspace{0.1cm}$  el cuantil de orden $\hspace{0.1cm}\alpha\hspace{0.1cm}$ de la variable $\hspace{0.15cm}\widehat{\theta}_{boot}$ , entonces se cumple lo siguiente:


$$\dfrac{\# \hspace{0.15cm} \left\lbrace \hspace{0.1cm}  b = 1,...,B \hspace{0.25cm} / \hspace{0.25cm} \widehat{\theta}_{(b)} \hspace{0.05cm} \leq \hspace{0.05cm} Q(\alpha \hspace{0.05cm} , \hspace{0.05cm} \widehat{\theta}_{boot}) \hspace{0.1cm}  \right\rbrace \hspace{0.1cm} }{B}  \hspace{0.15cm} = \hspace{0.15cm} \alpha$$


\vspace{0.35cm}

- El intervalo cuantil-bootstrap para el parámetro $\theta$ a un nivel $1-\alpha$ es : 

    $$IC(\theta )_{1-\alpha}^{boot} \hspace{0.1cm} = \hspace{0.1cm} \left[ \hspace{0.1cm} Q(\alpha/2 \hspace{0.1cm} , \hspace{0.1cm} \widehat{\theta}_{boot}) \hspace{0.2cm} ;  \hspace{0.2cm} Q(1-\alpha/2 \hspace{0.1cm} , \hspace{0.1cm} \widehat{\theta}_{boot}) \hspace{0.1cm} \right] \\[1cm]$$




 

\newpage


## Intervalos cuantil-bootstrap con dos poblaciones



Tenemos dos v.a's $\mathcal{X}_1\sim D_1(\theta_1)$ y $\mathcal{X}_2\sim D_2(\theta_2)$ , una m.a.s. $(\mathcal{X}_{11},...,\mathcal{X}_{n_1 1})$ de $\mathcal{X}_1$ , otra  m.a.s. $(\mathcal{X}_{12},...,\mathcal{X}_{n_2 2})$ de $\mathcal{X}_2$ y un par de estimadores $\widehat{\theta}_1(\mathcal{X}_{11},...,\mathcal{X}_{n_1 1})$ y $\widehat{\theta}_2(\mathcal{X}_{12},...,\mathcal{X}_{n_2 2})$ de los parámetros $\theta_1$ y  $\theta_2$, respectivamente.


Además tenemos una muestras de observaciones $X_1=(x_{11},...,x_{n_1 1})$   de la v.a.  $\mathcal{X}_1$ y otra $X_1=(x_{11},...,x_{n_1 1})$  de  $\mathcal{X}_2$, por lo que tenemos las estimaciones $\widehat{\theta}_1(X_1)=\widehat{\theta}_1(x_{1 1},...,x_{n_1 1})$ de los parámetros $\theta_1$ y  $\theta_2$ , respectivamente.





 

- Se obtienen $\hspace{0.1cm}B\hspace{0.1cm}$ muestras bootstrap (aleatorias y con reemplazamiento) de $\hspace{0.1cm}X_1\hspace{0.1cm}$ y $\hspace{0.1cm}X_2\hspace{0.1cm}$:  

$$X_{1(1)},X_{1(2)},...,X_{1(B)}$$

$$X_{2(1)},X_{2(2)},...,X_{2(B)} \\$$




- Se calcula para $b\in \lbrace 1,...,B \rbrace$ la replica bootstrap $\hspace{0.1cm}b$-esima de los estimadores $\hspace{0.1cm}\widehat{\theta}_1$ y $\hspace{0.1cm}\widehat{\theta}_2$ como: 


    $$\widehat{\theta}_{1(b)} = \widehat{\theta}(X_{1(b)})$$

    $$\widehat{\theta}_{2(b)} = \widehat{\theta}(X_{2(b)}) \\$$


    Así que se tiene:

    $$\widehat{\theta}_{1 \hspace{0.05cm},\hspace{0.05cm} boot} = \left(\widehat{\theta}_{1(1)},...,\widehat{\theta}_{1(B)} \right)$$

    $$\widehat{\theta}_{2 \hspace{0.05cm},\hspace{0.05cm} boot} = \left(\widehat{\theta}_{2(1)},...,\widehat{\theta}_{2(B)} \right)\\$$


\vspace{0.35cm}
 
 
Sea $\hspace{0.1cm}Q(\alpha \hspace{0.05cm} ,  \hspace{0.05cm} \widehat{\theta}_{1 \hspace{0.05cm},\hspace{0.05cm} boot} - \widehat{\theta}_{2 \hspace{0.05cm},\hspace{0.05cm} boot} )\hspace{0.1cm}$  el cuantil de orden $\hspace{0.1cm}\alpha\hspace{0.1cm}$ de la variable $\hspace{0.15cm} \widehat{\theta}_{1 \hspace{0.05cm},\hspace{0.05cm} boot} - \widehat{\theta}_{2 \hspace{0.05cm},\hspace{0.05cm} boot}\\$ 





Por tanto, se cumple lo siguiente: 


$$\dfrac{\# \hspace{0.15cm} \left\lbrace \hspace{0.1cm}  b = 1,...,B \hspace{0.25cm} / \hspace{0.25cm} \widehat{\theta}_{1(b)} - \widehat{\theta}_{2(b)} \hspace{0.05cm} \leq \hspace{0.05cm} Q(\alpha \hspace{0.05cm} , \hspace{0.05cm}  \widehat{\theta}_{1 \hspace{0.05cm},\hspace{0.05cm} boot} - \widehat{\theta}_{2 \hspace{0.05cm},\hspace{0.05cm} boot}) \hspace{0.1cm}  \right\rbrace \hspace{0.1cm} }{B}  \hspace{0.15cm} = \hspace{0.15cm} \alpha \\$$
    
    
\vspace{0.35cm}

- El intervalo cuantil-bootstrap para la diferencia de parametros $\hspace{0.1cm}\theta_1 - \theta_2\hspace{0.1cm}$ a un nivel $\hspace{0.1cm} 1-\alpha \hspace{0.1cm}$ es : 

    $$IC(\theta_1 - \theta_2 )_{1-\alpha}^{boot} \hspace{0.1cm} = \hspace{0.1cm} \left[ \hspace{0.1cm} Q(\alpha/2 \hspace{0.1cm} , \hspace{0.1cm}  \widehat{\theta}_{1 \hspace{0.05cm},\hspace{0.05cm} boot} - \widehat{\theta}_{2 \hspace{0.05cm},\hspace{0.05cm} boot}) \hspace{0.2cm} ;  \hspace{0.2cm} Q(1-\alpha/2 \hspace{0.1cm} , \hspace{0.1cm}  \widehat{\theta}_{1 \hspace{0.05cm},\hspace{0.05cm} boot} - \widehat{\theta}_{2 \hspace{0.05cm},\hspace{0.05cm} boot}) \hspace{0.1cm} \right]$$


 

Los intervalos cuantil-bootstrap pueden conducir a estimaciones del intervalo de confianza algo erráticas cuando el estimador del parametro de interés es sesgado.

Se pueden considerar una versión mejorada del intervalo cuantil-bootstrap llamada BCa, abreviatura que procede de sesgo-corregido (bias-corrected) y acelerado (accelerated).


<br>

## Intervalo BCa-bootstrap


En la determinación de los intervalos BCa-bootstrap juegan un rol central dos cantidades: $\hspace{0.25cm} \Rightarrow \hspace{0.25cm} \hat{z}_0\hspace{0.1cm}$ y $\hspace{0.1cm}\hat{a}$


$\hat{z}_0\hspace{0.1cm}$ se introduce para corregir el sesgo del estimador $\hat{\theta}$

 \vspace{0.35cm}

$\hat{z}_0\hspace{0.1cm}$ se define como :


$$\hat{z}_0 \hspace{0.1cm}=\hspace{0.1cm} F^{-1}_{N(0,1)} \left(  \dfrac{\# \hspace{0.15cm} \left\lbrace \hspace{0.1cm}  b = 1,...,B \hspace{0.25cm} / \hspace{0.25cm} \widehat{\theta}_{(b)} \hspace{0.05cm} \leq \hspace{0.05cm}  \hat{\theta}(X) \hspace{0.1cm}  \right\rbrace \hspace{0.1cm} }{B}  \right) \\$$


\vspace{0.35cm}


Aclaremos esto un poco:


Si $\hspace{0.1cm}\rho\hspace{0.1cm}$ es la proporción de replicas bootstrap del estimador $\hspace{0.1cm}\hat{\theta}_{(1)},...,\hat{\theta}_{(B)}\hspace{0.1cm}$ que son menores o iguales que la estimacion $\hspace{0.1cm}\hat{\theta}(X)\hspace{0.1cm}$  , entonces:

 
$$\rho \hspace{0.1cm}=\hspace{0.1cm}  \dfrac{ \# \hspace{0.1cm} \left\lbrace \hspace{0.1cm}  b = 1,...,B \hspace{0.25cm} / \hspace{0.25cm} \widehat{\theta}_{(b)} \hspace{0.05cm} \leq \hspace{0.05cm}  \hat{\theta}(X) \hspace{0.1cm}  \right\rbrace \hspace{0.1cm} }{B}$$


\vspace{0.35cm}


Por tanto:

$$\hat{z}_0 \hspace{0.1cm}=\hspace{0.1cm} F^{-1}_{N(0,1)} ( \hspace{0.05cm}\rho\hspace{0.05cm} ) \hspace{0.3cm}\Rightarrow\hspace{0.3cm} F_{N(0,1)}(\hat{z}_0) \hspace{0.1cm}=\hspace{0.1cm} P\left( \hspace{0.1cm}N(0,1) \leq \hat{z}_0\hspace{0.1cm} \right) \hspace{0.1cm} =\hspace{0.1cm} \rho$$

\vspace{0.35cm}


En conclusión:

$\hat{z}_0\hspace{0.1cm}$ es el cuantil de orden $\hspace{0.1cm}\rho\hspace{0.1cm}$ de la distribucion $\hspace{0.1cm}N(0,1)\hspace{0.3cm}$ $\Rightarrow\hspace{0.3cm}$ $\hat{z}_0 \hspace{0.1cm} = \hspace{0.1cm} Q\left(\hspace{0.1cm}\rho \hspace{0.1cm},\hspace{0.1cm} N(0,1)\hspace{0.1cm}\right)$


 

\newpage


La segunda cantidad, $\hspace{0.1cm}\hat{a}\hspace{0.1cm}$, denominada aceleración, corrige el caso en el que el error estandar del estimador del parámetro de interés $\hspace{0.1cm}s.e.(\hat{\theta})\hspace{0.1cm}$ no sea constante, y se define en términos de estimaciones Jacknife.

\vspace{0.35cm}

Recordemos el contexto Jacknife:

$\hspace{0.25cm}$ Se define $\hspace{0.1cm}X_{(r)}\hspace{0.1cm}$ como la muestra que contiene todos los valores de la muestra $\hspace{0.1cm}X=(x_1,...,x_n)\hspace{0.1cm}$ del la variable aleatoria de interés $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ excepto el valor $\hspace{0.1cm}x_{r}$

$\hspace{0.25cm}$ Es decir:


$$X_{(r)} = (\hspace{0.05cm}x_{1}\hspace{0.05cm},\hspace{0.05cm} x_{2}\hspace{0.05cm},..,\hspace{0.05cm} x_{r-1}\hspace{0.05cm},\hspace{0.05cm}x_{r+1}\hspace{0.05cm} ,..,\hspace{0.05cm} x_{n}\hspace{0.05cm})$$  

$\hspace{0.35cm}$ para  $\hspace{0.2cm} r=1,...,n \\$

\vspace{0.35cm} 

Se define la replica $\hspace{0.1cm}r$-esima del estimador $\hspace{0.1cm}\widehat{\theta}\hspace{0.1cm}$ como: $\\[0.5cm]$

$$\widehat{\theta}_{(r)} = \widehat{\theta}(X_{(r)})= \widehat{\theta}(\hspace{0.05cm}x_{1}\hspace{0.05cm},\hspace{0.05cm} x_{2}\hspace{0.05cm},..,\hspace{0.05cm} x_{r-1}\hspace{0.05cm},\hspace{0.05cm}x_{r+1}\hspace{0.05cm} ,..,\hspace{0.05cm} x_{n}\hspace{0.05cm})\\$$



\vspace{0.35cm}

Teniendo todo esto en cuenta, $\hspace{0.1cm}\hat{a}\hspace{0.1cm}$ se define como sigue:

$$\hat{a} \hspace{0.1cm} = \hspace{0.1cm} \dfrac{ \sum_{r=1}^n \left( \hspace{0.1cm} \hat{\theta}_{(\cdot)} - \hat{\theta}_{(r)}  \right)^3   }{ 6 \cdot \left[ \sum_{r=1}^n \left( \hspace{0.1cm} \hat{\theta}_{(\cdot)} - \hat{\theta}_{(r)}  \right)^2 \right]^{3/2}  }$$


donde:

 $$\hat{\theta}_{(\cdot)} = \frac{1}{n} \cdot \sum_{r=1}^n \hat{\theta}_{(r)} \\$$



\vspace{0.35cm}


El intervalo BCa-bootstrap de nivel $\hspace{0.1cm} 1-\alpha\hspace{0.1cm}$ es: $\\[0.5cm]$


$$\left[ \hspace{0.1cm}Q(\alpha_1 \hspace{0.1cm} ,\hspace{0.1cm}  \hat{\theta}_{boot})   \hspace{0.2cm}  ; \hspace{0.2cm}   Q(\alpha_2 \hspace{0.1cm} ,\hspace{0.1cm}  \hat{\theta}_{boot})  \hspace{0.1cm} \right] \\$$


donde:

$$\alpha_1 \hspace{0.1cm}=\hspace{0.1cm} F_{N(0,1)}\left( \hat{z}_0 + \dfrac{\hat{z}_0 + z_{1-\alpha/2} }{1 - \hat{a}\cdot(\hat{z}_0 + z_{1-\alpha/2} )} \right)$$

$$\alpha_2 \hspace{0.1cm}=\hspace{0.1cm} F_{N(0,1)}\left( \hat{z}_0 + \dfrac{\hat{z}_0 + z_{\alpha/2} }{1 - \hat{a}\cdot(\hat{z}_0 + z_{\alpha/2} )} \right) \\$$




\newpage


Teniendo en cuenta que:


- $z_{\alpha}$ el valor tal que $P(N(0,1) \leq z_{\alpha}) = \alpha\\[0.5cm]$



- $\hat{a} \hspace{0.1cm} = \hspace{0.1cm} \dfrac{ \sum_{r=1}^n \left( \hspace{0.1cm} \hat{\theta}_{(\cdot)} - \hat{\theta}_{(r)}  \right)^3   }{ 6 \cdot \left[ \sum_{r=1}^n \left( \hspace{0.1cm} \hat{\theta}_{(\cdot)} - \hat{\theta}_{(r)}  \right)^2 \right]^{3/2}  } \\[0.5cm]$

- $\hat{z}_0  \hspace{0.1cm} = \hspace{0.1cm} Q\left(\hspace{0.1cm}\rho \hspace{0.1cm},\hspace{0.1cm} N(0,1)\hspace{0.1cm}\right) \\[0.5cm]$

- $\rho \hspace{0.1cm}=\hspace{0.1cm}  \dfrac{ \# \hspace{0.1cm} \left\lbrace \hspace{0.1cm}  b = 1,...,B \hspace{0.25cm} / \hspace{0.25cm} \widehat{\theta}_{(b)} \hspace{0.05cm} \leq \hspace{0.05cm}  \hat{\theta}(X) \hspace{0.1cm}  \right\rbrace \hspace{0.1cm} }{B} \\[0.3cm]$




\vspace{0.4cm}



Si $\hspace{0.1cm}\hat{z}_0 = \hat{a} = 0\hspace{0.1cm}$ , entonces: 

$$\alpha_1 \hspace{0.1cm} = \hspace{0.1cm} F_{N(0,1)}(z_{1-\alpha/2}) \hspace{0.1cm} = \hspace{0.1cm} \alpha/2$$

$$\alpha_2 \hspace{0.1cm} = \hspace{0.1cm} F_{N(0,1)}(z_{\alpha/2}) \hspace{0.1cm}=\hspace{0.1cm} 1- \alpha/2 \\$$



\vspace{0.4cm}


Por lo que en este caso particular el intervalo BCa coincide con el intervalo percentil.

El valor de $\hat{z}_0$ traslada el intervalo a la derecha o a la izquierda, y $\hat{a}$ hace que sea más ancho o más estrecho.


Con este intervalo se recomienda usar $B \geq 1000$.



\newpage




## Intervalos cuantil-bootstrap en `Python`


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

    if estimator in ['mean','median','std','quantile','kurtosis',
    'skewness','proportion']:

        L1_1 = np.quantile( replicas_estimador  , q=alpha/2)

        L2_1 = np.quantile( replicas_estimador  , q=1-alpha/2)

        interval = [L1_1 , L2_1]

######################################################################

    if estimator in ['mean_diff','median_diff','std_diff','quantile_diff',
    'kurtosis_diff','skewness_diff', 'proportion_diff']:
   
        L1_2 = np.quantile( replicas_estimador_diff  , q=alpha/2)

        L2_2 = np.quantile( replicas_estimador_diff  , q=1-alpha/2)

        interval = [L1_2 , L2_2]

######################################################################
######################################################################

    return interval , estimation
```



\newpage



**Intervalo para la media:**

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
    
    
\vspace{0.3cm}    
    
    
Comparación con el intervalo de confianza clásico frecuentista:

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



\newpage


**Intervalo para la desviación típica:**


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



\vspace{0.3cm}

Comparación con el intervalo de confianza clásico frecuentista:

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

 
 
 
\newpage

**Intervalo para la mediana:**

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


\vspace{0.35cm}



**Intervalo para el coeficiente de asimetria:**


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



\vspace{0.35cm}


**Intervalo para el coeficiente de curtosis:**

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



\newpage


**Intervalo para los cuantiles:**

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
 


\vspace{0.35cm}


**Intervalo para la proporción:**


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


\vspace{0.35cm}



**Intervalo para la diferencia de medias:**

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


 



Comparación con el intervalo de confianza clásico frecuentista:

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


\newpage


**Intervalo para la diferencia de medianas:**


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

 

\vspace{0.35cm}



**Intervalo para la diferencia de desviaciones típicas:**

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


 
\vspace{0.35cm}


**Intervalo para la diferencia de cuantiles:**

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


 

\newpage


**Intervalo para la diferencia de curtosis:**

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

 

\vspace{0.35cm}

**Intervalo para la diferencia de asimetría:**

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

 
\vspace{0.35cm}


**Intervalo para la diferencia de proporciones:**

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
    
    
    
    
\vspace{1cm}





## Intervalos BCa en `Python`


```python
def BCa_boot_interval(Variable, estimator_function, B, alpha, random_seed, q=0.75):

    np.random.seed(random_seed)


    def Bootstrap_sample(Variable):

        from sklearn.utils import resample

        sample = resample( Variable, n_samples=len(Variable))

        return sample


    def Jacknife_sample(X , r):

            X_sample_r = np.delete(X, r)

            return(X_sample_r)



    z_1_alpha_medios = scipy.stats.norm.ppf(q=alpha/2, loc=0, scale=1)

    z_alpha_medios = scipy.stats.norm.ppf(q=1-alpha/2, loc=0, scale=1)

##################################################################################

    if estimator_function == np.quantile:  estimation = estimator_function(Variable, q=q)

    else :  estimation = estimator_function(Variable)

    replicas_boot_estimador = []

    for b in range(0, B):

        replicas_boot_estimador.append( np.mean( Bootstrap_sample(Variable) ) )


    replicas_boot_estimador = np.array(replicas_boot_estimador)


    rho = sum( replicas_boot_estimador <= estimation ) / B

    z_0 = scipy.stats.norm.ppf(q=rho, loc=0, scale=1)

    ###################################

    replicas_jack_estimador = []

    for r in range(0, len(Variable)):

        if estimator_function == np.quantile :  Jack_estimation = estimator_function( Jacknife_sample(Variable, r) , q=q )

        else :  Jack_estimation = estimator_function( Jacknife_sample(Variable, r) )

        replicas_jack_estimador.append( Jack_estimation )

    replicas_jack_estimador = np.array(replicas_jack_estimador)


    a_numerator = sum( (np.mean(replicas_jack_estimador) - replicas_jack_estimador )**3 )

    a_denominator = sum( (np.mean(replicas_jack_estimador) - replicas_jack_estimador )**2 )

    a_denominator = 6*a_denominator**(3/2)

    a = a_numerator / a_denominator


    x_1 = z_0 + (z_0 + z_1_alpha_medios)/(1-a*(z_0 + z_1_alpha_medios))

    x_2 = z_0 + (z_0 + z_alpha_medios)/(1-a*(z_0 + z_alpha_medios))


    alpha_1 = scipy.stats.norm.cdf(x=x_1, loc=0, scale=1)

    alpha_2 = scipy.stats.norm.cdf(x=x_2, loc=0, scale=1)


#########################################################################################################

    L1 = np.quantile( replicas_boot_estimador  , q=alpha_1)

    L2 = np.quantile( replicas_boot_estimador  , q=alpha_2)

    interval = [L1,L2]

    return interval , estimation
```


```python
np.random.seed(123)

X = np.random.normal(loc=10, scale=15, size=50)
```

```python
interval , estimation = BCa_boot_interval(Variable=X, estimator_function=np.mean, B=200000, alpha=0.05, random_seed=123)
```

```python
interval
```

    [5.262399300501412, 15.148561429340479]


```python
estimation
```

    10.199071616256777


```python
interval , estimation = BCa_boot_interval(Variable=X, estimator_function=np.median, B=200000, alpha=0.05, random_seed=123)
```

```python
interval
```

    [1.1580146455412295, 11.197676226492618]


```python
estimation
```

    8.23916733155832

```python
interval , estimation = BCa_boot_interval(Variable=X, estimator_function=np.std, B=200000, alpha=0.05, random_seed=123)
```

```python
interval
```

    [20.774957571314236, 21.430372642336394]


```python
estimation
```

    17.844342210422187

```python
interval , estimation = BCa_boot_interval(Variable=X, estimator_function=np.quantile , B=200000, alpha=0.05, random_seed=123, q=0.6)
```

```python
interval
```

    [14.014587566665833, 21.42972709983565]


```python
estimation
```

    14.584180220264427



```python
interval , estimation = BCa_boot_interval(Variable=X, estimator_function=np.quantile , B=200000, alpha=0.05, random_seed=123, q=0.3)
```


```python
interval
```

    [-0.6003612573539066, -0.600281655451849]


```python
estimation
```

    0.23654135251192027
    
    
```python
interval , estimation = BCa_boot_interval(Variable=X, estimator_function=skew , B=200000, alpha=0.05, random_seed=123, q=0.5)
```

```python
interval
```

    [-0.6003612573539066, -0.6003362491509903]

```python
estimation
```

    0.025587358812510053



```python
interval , estimation = BCa_boot_interval(Variable=X, estimator_function=kurtosis , B=200000, alpha=0.05, random_seed=123, q=0.5)
```

```python
interval
```
     
    [-0.6003612573539066, -0.6003597491211978]

```python
estimation
```

    -0.37420768292897266

    

\newpage


# Contrastes de hipotesis basados en bootstrap

Existen múltiples aproximaciones a los contrastes de hipótesis desde una perspectiva bootstrap. En este caso nos aproximaremos usando los intervalos cuantil-bootstrap, por simplicidad.

Vamos a diferenciar contrastes de hipótesis sobre una población y sobre dos poblaciones.




## Contraste de hipótesis sobre una población


Tenemos una v.a. $\hspace{0.1cm}\mathcal{X}\sim D(\theta)\hspace{0.05cm}$ , una m.a.s. $\hspace{0.1cm}(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ de $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ y un estimador $\hspace{0.1cm}\widehat{\theta}(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ del parámetro $\hspace{0.1cm}\theta$


Además tenemos una muestra de observaciones $\hspace{0.1cm}X=(x_1,...,x_n)\hspace{0.1cm}$   de la variable de interés $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ , por lo que tenemos la estimación $\hspace{0.1cm}\widehat{\theta}(X)=\widehat{\theta}(x_1,...,x_n)\hspace{0.1cm}$ del parámetro $\hspace{0.1cm}\theta .\\$ 


Se quieren resolver los siguientes contrastes:  

$$
H_0: \theta = \theta_0  \hspace{1.5cm} H_0: \theta = \theta_0  \hspace{1.5cm}  H_0: \theta = \theta_0$$
\vspace{-0.15cm}
$$H_1: \theta \neq \theta_0 \hspace{1.5cm}  H_1: \theta < \theta_0  \hspace{1.5cm}   H_1: \theta > \theta_0
$$

\vspace{0.3cm}

La regla de decisión  para resolver estos contrastes  basada en los intervalos cuantil-bootstrap  es la siguiente:

Para un nivel de significación $\hspace{0.12cm}\alpha$, partimos del intervalo cuantil-bootstrap del parametro $\theta$ para un nivel de confianza $\hspace{0.12cm}1 -\alpha$ $\hspace{0.25cm}\Rightarrow\hspace{0.25cm}$ $IC(\theta )_{1-\alpha}^{boot} = [ L1 , L2]$ 


- Caso $H_0: \theta = \theta_0 \hspace{0.25cm} \text{vs} \hspace{0.25cm} H_1: \theta \neq \theta_0$

    $$\text{Rechazar} \hspace{0.12cm} H_0  \hspace{0.25cm}  \Leftrightarrow \hspace{0.25cm} \theta_0 \notin IC(\theta )_{1-\alpha}^{boot}$$
    
    
    
\vspace{0.35cm}



- Caso $H_0: \theta = \theta_0 \hspace{0.25cm} \text{vs} \hspace{0.25cm} H_1: \theta < \theta_0$

    $$\text{Rechazar} \hspace{0.12cm} H_0  \hspace{0.25cm}  \Leftrightarrow \hspace{0.25cm} IC(\theta )_{1-\alpha}^{boot} \hspace{0.1 cm}<<\hspace{0.1 cm} \theta_0  \hspace{0.25cm}  \Leftrightarrow \hspace{0.25cm}  L2 \hspace{0.1 cm}<\hspace{0.1 cm} \theta_0$$
    


\vspace{0.35cm}



- Caso $H_0: \theta = \theta_0 \hspace{0.25cm} \text{vs} \hspace{0.25cm} H_1: \theta > \theta_0$

    $$\text{Rechazar} \hspace{0.12cm} H_0  \hspace{0.25cm}  \Leftrightarrow \hspace{0.25cm} IC(\theta )_{1-\alpha}^{boot} \hspace{0.1 cm}>>\hspace{0.1 cm} \theta_0  \hspace{0.25cm}  \Leftrightarrow \hspace{0.25cm}  L1 \hspace{0.1 cm} > \hspace{0.1 cm} \theta_0$$


 
\newpage

 

## Contraste de hipótesis sobre dos poblaciones




Tenemos dos v.a's $\hspace{0.1cm}\mathcal{X}_1\sim D_1(\theta_1)\hspace{0.1cm}$ y $\hspace{0.1cm}\mathcal{X}_2\sim D_2(\theta_2)\hspace{0.1cm}$ , una m.a.s. $\hspace{0.1cm}(\mathcal{X}_{11},...,\mathcal{X}_{n_1 1})\hspace{0.1cm}$ de $\hspace{0.1cm}\mathcal{X}_1\hspace{0.1cm}$ , otra  m.a.s. $\hspace{0.1cm}(\mathcal{X}_{12},...,\mathcal{X}_{n_2 2})\hspace{0.1cm}$ de $\hspace{0.1cm}\mathcal{X}_2\hspace{0.1cm}$ y un par de estimadores $\hspace{0.1cm}\widehat{\theta}_1(\mathcal{X}_{11},...,\mathcal{X}_{n_1 1})\hspace{0.1cm}$ y $\hspace{0.1cm}\widehat{\theta}_2(\mathcal{X}_{12},...,\mathcal{X}_{n_2 2})\hspace{0.1cm}$ de los parámetros $\hspace{0.1cm}\theta_1\hspace{0.1cm}$ y  $\hspace{0.1cm}\theta_2\hspace{0.1cm}$, respectivamente.


Además tenemos una muestras de observaciones $\hspace{0.1cm}X_1=(x_{11},...,x_{n_1 1})\hspace{0.1cm}$   de la v.a.  $\hspace{0.1cm}\mathcal{X}_1\hspace{0.1cm}$ y otra $\hspace{0.1cm}X_1=(x_{11},...,x_{n_1 1})\hspace{0.1cm}$  de  $\hspace{0.1cm}\mathcal{X}_2\hspace{0.1cm}$, por lo que tenemos las estimaciones $\hspace{0.1cm}\widehat{\theta}_1(X_1)=\widehat{\theta}_1(x_{1 1},...,x_{n_1 1})\hspace{0.1cm}$ de los parámetros $\hspace{0.1cm}\theta_1\hspace{0.1cm}$ y  $\hspace{0.1cm}\theta_2\hspace{0.1cm}$ , respectivamente.





Se quieren resolver los siguientes contrastes: 

$$
H_0: \theta_1 = \theta_2  \hspace{1.5cm} H_0: \theta_1 = \theta_2  \hspace{1.5cm}  H_0: \theta_1 = \theta_2$$
\vspace{-0.1cm}
$$H_1: \theta_1 \neq \theta_2 \hspace{1.5cm}  H_1: \theta_1 < \theta_2  \hspace{1.5cm}   H_1: \theta_1 > \theta_2
$$

\vspace{0.35cm}


La regla de decisión  para resolver estos contrastes  basada en los intervalos cuantil-bootstrap  es la siguiente:

Para un nivel de significación $\hspace{0.12cm}\alpha$.

Partimos del intervalo cuantil-bootstrap de la diferencia de parámetros $\theta_1 - \theta_2$ para un nivel de confianza $\hspace{0.12cm}1 -\alpha$ $\hspace{0.25cm}\Rightarrow\hspace{0.25cm}$ $IC(\theta_1 - \theta_2 )_{1-\alpha}^{boot} = [ L1 , L2]$ 


- Caso $H_0: \theta_1 = \theta_2 \hspace{0.25cm} \text{vs} \hspace{0.25cm} H_1: \theta_1 \neq \theta_2$

    $$\text{Rechazar} \hspace{0.12cm} H_0  \hspace{0.25cm}  \Leftrightarrow \hspace{0.25cm} 0 \notin IC(\theta_1 - \theta_2 )_{1-\alpha}^{boot}$$
    
\vspace{0.3cm}


- Caso $H_0: \theta_1 = \theta_2 \hspace{0.25cm} \text{vs} \hspace{0.25cm} H_1: \theta_1 < \theta_2$

    $$\text{Rechazar} \hspace{0.12cm} H_0  \hspace{0.25cm}  \Leftrightarrow \hspace{0.25cm} IC(\theta_1 - \theta_2 )_{1-\alpha}^{boot} \hspace{0.1 cm}<<\hspace{0.1 cm} 0 \hspace{0.25cm}  \Leftrightarrow \hspace{0.25cm}  L2 \hspace{0.1 cm}<\hspace{0.1 cm} 0$$

\vspace{0.3cm}

- Caso $H_0: \theta_1 = \theta_2 \hspace{0.25cm} \text{vs} \hspace{0.25cm} H_1: \theta_1 > \theta_2$

    $$\text{Rechazar} \hspace{0.12cm} H_0  \hspace{0.25cm}  \Leftrightarrow \hspace{0.25cm} IC(\theta_1 - \theta_2 )_{1-\alpha}^{boot} \hspace{0.1 cm}>>\hspace{0.1 cm} 0 \hspace{0.25cm}  \Leftrightarrow \hspace{0.25cm}  L1 \hspace{0.1 cm} > \hspace{0.1 cm} 0$$



\newpage



## Contrastes de hipotesis bootstrap en `Python`



```python
def bootstrap_cuantil_test(Variable1, Variable2, estimator, H1_type, theta_0,  alpha , B, random_seed, q):


    interval , estimation = cuantil_boot_interval(Variable1=Variable1, Variable2=Variable2, alpha=alpha, estimator=estimator , B=B, random_seed=random_seed, q=q)

    
    if estimator in ['mean','median','std','quantile','kurtosis','skewness','proportion']:


        if H1_type == 'greater':

            if interval[0] > theta_0 : result = 'Reject H0: theta = theta_0  -->  Accept H1: theta > theta_0'

            else : result = 'Not reject H0: theta = theta_0  -->  Not accept H1: theta > theta_0'


        if H1_type == 'less':

            if interval[1] < theta_0 : result = 'Reject H0: theta = theta_0  -->  Accept H1: theta < theta_0'

            else : result = 'Not reject H0: theta = theta_0  -->  Not accept H1: theta < theta_0'

        
        if H1_type == 'two.sided':

            if (interval[1] < theta_0)  | (interval[0] > theta_0) : result = 'Reject H0: theta = theta_0  -->  Accept H1: theta =/= theta_0'

            else : result = 'Not reject H0: theta = theta_0  -->  Not accept H1: theta =/= theta_0'

    

    if estimator in ['mean_diff','median_diff','std_diff','quantile_diff',
    'kurtosis_diff','skewness_diff', 'proportion_diff']:


        if H1_type == 'greater':

            if interval[0] > 0 : result = 'Reject H0: theta_1 = theta_2  -->  Accept H1: theta_1 > theta_2'

            else : result = 'Not reject H0: theta_1 = theta_2 -->  Not accept H1: theta_1 > theta_2'


        if H1_type == 'less':

            if interval[1] < 0 : result = 'Reject H0: theta_1 = theta_2  -->  Accept H1: theta_1 < theta_2'

            else : result = 'Not reject H0: theta_1 = theta_2  -->  Not accept H1: theta_1 < theta_2'

        
        if H1_type == 'two.sided':

            if (interval[1] < 0)  | (interval[0] >  0)  : result = 'Reject H0: theta_1 = theta_2  -->  Accept H1: theta_1 =/= theta_2'

            else : result = 'Not reject H0: theta_1 = theta_2  -->  Not accept H1: theta_1 =/= theta_2'



    return result , interval
```

\vspace{0.3cm}

```python
np.random.seed(123)

X_1 = np.random.normal(loc=62, scale=25, size=150)

X_2 = np.random.normal(loc=80, scale=25, size=150)
```

\vspace{0.3cm}



**Contraste para la media de una población:**


```python
np.mean(X_1)
```

    63.44484985484652

\vspace{0.3cm}

```python
resultado , intervalo = bootstrap_cuantil_test(Variable1=X_1, Variable2='no', estimator='mean', H1_type='greater', theta_0=50,  alpha=0.05 , B=1000, random_seed=123, q='no')
```

```python
resultado
```

    'Reject H0: theta = theta_0  -->  Accept H1: theta > theta_0'

```python
intervalo
```

    [59.300517176372914, 68.0853420655662]

\vspace{0.3cm}


```python
resultado , intervalo = bootstrap_cuantil_test(Variable1=X_1, Variable2='no', estimator='mean', H1_type='greater', theta_0=60,  alpha=0.05 , B=1000, random_seed=123, q='no')
```

```python
resultado
```

    'Not reject H0: theta = theta_0  -->  Not accept H1: theta > theta_0'


\vspace{0.3cm}


```python
bootstrap_cuantil_test(Variable1=X_1, Variable2='no', estimator='mean', H1_type='two.sided', theta_0=60,  alpha=0.05 , B=1000, random_seed=123, q='no')
```

```python
resultado
```

    'Not reject H0: theta = theta_0  -->  Not accept H1: theta =/= theta_0'
 
 
 
\vspace{0.3cm}

**Contraste para la mediana de una población:**



```python


```


```python

resultado , intervalo =
```

```python
resultado
```


```python
intervalo
```


\newpage


**Contraste para la desviación típica de una población:**

```python
np.std(X_1)
```

    27.258568783722534

```python
resultado , intervalo = bootstrap_cuantil_test(Variable1=X_1, Variable2='no', estimator='std', H1_type='less', theta_0=30,  alpha=0.05 , B=1000, random_seed=123, q='no')
```


```python
resultado
```

     'Reject H0: theta = theta_0  -->  Accept H1: theta < theta_0'

```python
intervalo
```

     [24.53136884527364, 29.84312683035364]
     



```python
resultado , intervalo = bootstrap_cuantil_test(Variable1=X_1, Variable2='no', estimator='std', H1_type='less', theta_0=26,  alpha=0.05 , B=1000, random_seed=123, q='no')
```



```python
resultado
```

    'Not reject H0: theta = theta_0  -->  Not accept H1: theta < theta_0'

 

\vspace{0.5cm}

**Contraste para los cuantiles de una población:**


```python
np.quantile(X_1, q=0.6)
```

    70.37736516880977


\vspace{0.3cm}

```python
resultado , intervalo = bootstrap_cuantil_test(Variable1=X_1, Variable2='no', estimator='quantile', H1_type='greater', theta_0=50,  alpha=0.05 , B=1000, random_seed=123, q=0.6)
```


```python
resultado
```

    'Reject H0: theta = theta_0  -->  Accept H1: theta > theta_0'

```python
intervalo
```

    [65.5777835208156, 76.34514656012644]



\vspace{0.5cm}

**Contraste para la curtosis de una población:**

```python
kurtosis(X_1)
```

    -0.4799399747044939



```python
resultado , intervalo = bootstrap_cuantil_test(Variable1=X_1, Variable2='no', estimator='kurtosis', H1_type='less', theta_0=0,  alpha=0.05 , B=1000, random_seed=123, q='no')
```


```python
resultado
```

    'Reject H0: theta = theta_0  -->  Accept H1: theta < theta_0'

```python
intervalo
```

    [-0.8726641157248832, -0.03722884140184115]





\vspace{0.5cm}

**Contraste para la asimetría de una población:**

```python
skew(X_1)
```
 
    0.0030735881326157516


```python
resultado , intervalo = bootstrap_cuantil_test(Variable1=X_1, Variable2='no', estimator='skewness', H1_type='two.sided', theta_0=0,  alpha=0.05 , B=1000, random_seed=123, q='no')
```

```python
resultado
```

    'Not reject H0: theta = theta_0  -->  Not accept H1: theta =/= theta_0'

```python
intervalo
```

    [-0.26701282609616306, 0.27862278159471443]


\vspace{0.5cm}


**Contraste para la media de dos poblaciones:**

```python
np.mean(X_1)
```

    63.44484985484652


```python
np.mean(X_2)
```

    77.09585348416586
    
    
\vspace{0.3cm}

```python
resultado , intervalo = bootstrap_cuantil_test(Variable1=X_1, Variable2=X_2, estimator='mean_diff', H1_type='greater', theta_0='no',  alpha=0.05 , B=1000, random_seed=123, q='no')
```

```python
resultado
```

    'Not reject H0: theta_1 = theta_2 -->  Not accept H1: theta_1 > theta_2'

```python
intervalo
```

    [-19.673858833181058, -7.98554491914148]
    
    
\vspace{0.3cm}


```python
resultado , intervalo = bootstrap_cuantil_test(Variable1=X_1, Variable2=X_2, estimator='mean_diff', H1_type='less', theta_0='no',  alpha=0.05 , B=1000, random_seed=123, q='no')
```

```python
resultado
```

    'Reject H0: theta_1 = theta_2  -->  Accept H1: theta_1 < theta_2'

 

\vspace{0.5cm}


**Contraste para la desviación típica de dos poblaciones:**


```python
np.std(X_1)
```

    27.258568783722534


```python
np.std(X_2)
```

    23.76463767935987
    

\vspace{0.3cm}
    
```python
resultado , intervalo = bootstrap_cuantil_test(Variable1=X_1, Variable2=X_2, estimator='std_diff', H1_type='greater', theta_0='no',  alpha=0.05 , B=1000, random_seed=123, q='no')
```
    
```python
resultado
```

    'Not reject H0: theta_1 = theta_2 -->  Not accept H1: theta_1 > theta_2'
 
```python
intervalo
```

    [-0.4051994934727355, 7.849597038849807]


\vspace{0.3cm}



```python
resultado , intervalo = bootstrap_cuantil_test(Variable1=X_1, Variable2=X_2, estimator='std_diff', H1_type='two.sided', theta_0='no',  alpha=0.05 , B=1000, random_seed=123, q='no')
```

```python
resultado
```

    'Not reject H0: theta_1 = theta_2  -->  Not accept H1: theta_1 =/= theta_2'


\newpage

**Contraste para la mediana de dos poblaciones:**


```python
np.median(X_1)
```

    62.99540261926173

```python
np.median(X_2)
```

    77.7284396794982

```python
resultado , intervalo = bootstrap_cuantil_test(Variable1=X_1, Variable2=X_2, estimator='median_diff', H1_type='less', theta_0='no',  alpha=0.05 , B=1000, random_seed=123, q='no')
```

```python
resultado
```

     'Reject H0: theta_1 = theta_2  -->  Accept H1: theta_1 < theta_2'

```python
intervalo
```

    [-23.9186359851631, -7.0611603691117395]
 
 
 

\newpage

**Contraste para la curtosis de dos poblaciones:**

 

```python
kurtosis(X_1)
```

    -0.4799399747044939

```python
kurtosis(X_2)
```

     0.6321922906256292

```python
bootstrap_cuantil_test(Variable1=X_1, Variable2=X_2, estimator='kurtosis_diff', H1_type='less', theta_0='no',  alpha=0.05 , B=1000, random_seed=123, q='no')
```
```python
resultado
```

    'Not reject H0: theta_1 = theta_2  -->  Not accept H1: theta_1 < theta_2'


```python
intervalo
```

    [-2.145917163300932, 0.03602423829734017]



\vspace{0.5cm}

```python
bootstrap_cuantil_test(Variable1=X_1, Variable2=X_2, estimator='kurtosis_diff', H1_type='less', theta_0='no',  alpha=0.1 , B=1000, random_seed=123, q='no')
```

```python
resultado
```

    'Reject H0: theta_1 = theta_2  -->  Accept H1: theta_1 < theta_2'


```python
intervalo
```

    [-1.9699920673146376, -0.10952260840217383]





\vspace{0.5cm}

**Contraste para los cuantiles de dos poblaciones:**

```python
np.quantile(X_1, 0.70)
```

    79.99489543995588


```python
np.quantile(X_2, 0.70)
```

    87.39568341964177

\vspace{0.3cm}

```python
resultado , intervalo = bootstrap_cuantil_test(Variable1=X_1, Variable2=X_2, estimator='quantile_diff', H1_type='less', theta_0='no',  alpha=0.05 , B=1000, random_seed=123, q=0.70)
```


```python
resultado
```

    'Reject H0: theta_1 = theta_2  -->  Accept H1: theta_1 < theta_2'

```python
intervalo
```

    [-17.07794746423375, -1.5905138337254294]





\vspace{0.5cm}

**Contraste para la asimetría de dos poblaciones:**


```python
skew(X_1)
```

    0.0030735881326157516


```python
skew(X_2)
```

    -0.026878668133587646


\vspace{0.3cm}



```python
resultado , intervalo = bootstrap_cuantil_test(Variable1=X_1, Variable2=X_2, estimator='skewness_diff', H1_type='two.sided', theta_0='no',  alpha=0.05 , B=1000, random_seed=123, q='no')
```


```python
resultado
```

    'Not reject H0: theta_1 = theta_2  -->  Not accept H1: theta_1 =/= theta_2'


```python
intervalo
```

    [-0.5568062631492594, 0.6399990949904947]



\vspace{0.3cm}


```python
resultado , intervalo = bootstrap_cuantil_test(Variable1=X_1, Variable2=X_2, estimator='skewness_diff', H1_type='greater', theta_0='no',  alpha=0.05 , B=1000, random_seed=123, q='no')
```

```python
resultado
```

    'Not reject H0: theta_1 = theta_2 -->  Not accept H1: theta_1 > theta_2'

 





\newpage






# Bootstrap en Regresión Lineal 



## Botstrap en Regresión Lineal basado en residuos

Tenemos un modelo de regresión lineal:

$$y_i =  x_i^t \cdot \beta + \varepsilon_i \hspace{0.25cm} , \hspace{0.25cm} \forall \hspace{0.1cm} i \in \lbrace 1,...,n \rbrace\\[0.25cm]$$

donde  $\hspace{0.15cm} x_i \in \mathbb{R}^{p+1} \hspace{0.15cm} , \hspace{0.15cm}  \varepsilon_i \in \mathbb{R} \hspace{0.15cm} , \hspace{0.15cm}  y_i \in \mathbb{R} \\$

El modelo de regresión lineal estimado por mínimos cuadrados ordinarios es:

$$\hat{y}_i =  x_i^t  \cdot \widehat{\beta} \hspace{0.25cm} , \hspace{0.25cm} \forall \hspace{0.1cm} i \in \lbrace 1,...,n \rbrace\\$$

Donde:

$$\widehat{\beta} = (X \cdot X^t)^{-1} \cdot X^t \cdot y\\$$

\vspace{0.25cm}

Recordemos que en el modelo de regresión lineal los residuos estimados del modelo son:  


$$\widehat{\varepsilon} = (\widehat{\varepsilon}_1,...,\widehat{\varepsilon}_n)^t\\$$

donde:

$$\widehat{\varepsilon}_i \hspace{0.1cm}=\hspace{0.1cm} y_i - x_i^t  \cdot \widehat{\beta} \hspace{0.1cm}=\hspace{0.1cm} y_i - \hat{y}_i \hspace{0.25cm} , \hspace{0.25cm} \forall \hspace{0.1cm} i \in \lbrace 1,...,n \rbrace\\$$

Se toman $\hspace{0.1cm}B\hspace{0.1cm}$  muestras *bootstrap* (aleatorias y con reemplazamiento) del vector de residuos estimados $\hspace{0.1cm}\hat{\varepsilon}\hspace{0.1cm}$ del modelo:  


$$\widehat{\varepsilon}_{(1)}\hspace{0.05cm},....,\hspace{0.05cm}\widehat{\varepsilon}_{(B)}\\$$

\vspace{0.25cm}

Se generan  $\hspace{0.1cm}B\hspace{0.1cm}$  replicas *bootstrap* de las respuestas del siguiente modo:  


$$Y_{(b)} \hspace{0.1cm} = \hspace{0.1cm} X \cdot \widehat{\beta} \hspace{0.05cm} + \hspace{0.05cm} \varepsilon_{(b)}
\hspace{0.25cm} , \hspace{0.25cm} \forall   \hspace{0.15cm} b \in  \lbrace 1,...,B \rbrace \\$$


Para cada  $\hspace{0.1cm} b \in  \lbrace 1,...,B \rbrace\hspace{0.1cm}$

Se entrenan el modelo de regresion lineal $\hspace{0.1cm} M \hspace{0.1cm}$ con la muestra $\hspace{0.1cm}\left(X, Y_{(b)}\right)\hspace{0.1cm}$ de los predictores y la respuesta $\hspace{0.25cm}\Rightarrow\hspace{0.25cm}$  $\widehat{M}_{(b)}$

Se obtienen así $\hspace{0.1cm} B\hspace{0.1cm}$ modelos de regresión lineal entrenados $\hspace{0.1cm}\widehat{M}_{(1)}\hspace{0.05cm},...,\hspace{0.05cm}\widehat{M}_{(B)}\hspace{0.1cm}$, que son las replicas bootstrap del modelo inicial (el entrenado con los datos iniciales).

Podemos usar estos modelos para obtener intervalos de confianza bootstrap de los coeficientes betas y de otros parámetros como el coeficiente de determinación (R-cuadrado).




<br>



### Intervalo de confianza bootstrap para los coeficientes betas


Para cada modelo $\hspace{0.1cm} M_{(b)} \hspace{0.1cm}$ se tiene la estimación $\hspace{0.1cm} \widehat{\beta}_{(b)} \hspace{0.1cm}$ del vector de coeficientes betas, y con ello se tiene la estimación $\hspace{0.1cm}\widehat{\beta}_{j(b)}\hspace{0.1cm}$ del coeficiente   $\hspace{0.1cm}\beta_j\hspace{0.1cm}$, para cada predictor. 

\vspace{0.25cm}

Así que para cada estimador $\hspace{0.1cm}\widehat{\beta}_j\hspace{0.1cm}$ se tiene   un vector de replicas bootstrap: $\hspace{0.1cm} \widehat{\beta}_{j \hspace{0.05cm} , \hspace{0.05cm} boot} \hspace{0.1cm} = \hspace{0.1cm} \left( \widehat{\beta}_{j(1)} \hspace{0.05cm} , \hspace{0.05cm} \widehat{\beta}_{j(2)} \hspace{0.05cm},...,\hspace{0.05cm} \widehat{\beta}_{j(B)} \right) \hspace{0.25cm} , \hspace{0.25cm} \forall \hspace{0.1cm} j \in \lbrace 0,1,...,p\rbrace$

\vspace{0.25cm}

Se puede usar la filosofía de los intervalos cuantil-bootstrap para obtener el intervalos bootstrap para los coeficientes betas del modelo: 


$$IC(\beta_j)_{1-\alpha}^{boot} \hspace{0.1cm} =\hspace{0.1cm} \left[ \hspace{0.1cm} Q \left( \hspace{0.1cm} \alpha/2 \hspace{0.1cm} , \hspace{0.1cm} \widehat{\beta}_{j \hspace{0.05cm} , \hspace{0.05cm}boot} \hspace{0.1cm} \right) \hspace{0.1cm} , \hspace{0.1cm}  Q \left( \hspace{0.1cm} 1-\alpha/2 \hspace{0.1cm} , \hspace{0.1cm} \widehat{\beta}_{j \hspace{0.05cm} , \hspace{0.05cm}boot} \hspace{0.1cm} \right)  \hspace{0.1cm} \right]$$


\vspace{0.5cm}


### Intervalo de confianza bootstrap para los coeficientes betas


Para cada modelo $\hspace{0.1cm} M_{(b)} \hspace{0.1cm}$ se tiene la estimación $\hspace{0.1cm} R^2_{adj\hspace{0.05cm} (b)} \hspace{0.1cm}$ del coeficiente de determinación ajustado. 

\vspace{0.25cm}

Así que para el estimador $\hspace{0.1cm}R^2_{adj \hspace{0.05cm} , \hspace{0.05cm} boot}\hspace{0.1cm}$ se tiene   un vector de replicas bootstrap: $\hspace{0.1cm} R^2_{adj \hspace{0.05cm} , \hspace{0.05cm} boot} \hspace{0.1cm} = \hspace{0.1cm} \left(  R^2_{adj\hspace{0.05cm} (1)} \hspace{0.05cm} , \hspace{0.05cm}  R^2_{adj\hspace{0.05cm} (2)} \hspace{0.05cm},...,\hspace{0.05cm}  R^2_{adj\hspace{0.05cm} (B)} \right) \hspace{0.25cm} , \hspace{0.25cm} \forall \hspace{0.1cm} j \in \lbrace 0,1,...,p\rbrace$

\vspace{0.25cm}

Se puede usar la filosofía de los intervalos cuantil-bootstrap para obtener el intervalos bootstrap para los coeficientes betas del modelo: 


$$IC(R^2_{adj})_{1-\alpha}^{boot} \hspace{0.1cm} =\hspace{0.1cm} \left[ \hspace{0.1cm} Q \left( \hspace{0.1cm} \alpha/2 \hspace{0.1cm} , \hspace{0.1cm} R^2_{adj \hspace{0.05cm} , \hspace{0.05cm} boot} \hspace{0.1cm} \right) \hspace{0.1cm} , \hspace{0.1cm}  Q \left( \hspace{0.1cm} 1-\alpha/2 \hspace{0.1cm} , \hspace{0.1cm} R^2_{adj \hspace{0.05cm} , \hspace{0.05cm} boot} \hspace{0.1cm} \right)  \hspace{0.1cm} \right]$$



\newpage

## Botstrap en Regresión Lineal basado en pares


En este caso se obtienen $\hspace{0.1cm} B\hspace{0.1cm}$ muestras bootstrap (aleatorias y con reemplazamiento) de las observaciones de los predictores y la respuesta $\hspace{0.1cm}\left( X , Y \right) = \left( \hspace{0.1cm} (x_i , y_i)  \hspace{0.15cm} / \hspace{0.15cm} i \in \lbrace 1,...,n \rbrace \hspace{0.1cm} \right)$ 

Con ello se obtienen las siguientes $\hspace{0.1cm}B\hspace{0.1cm}$ muestras:

$$\left(X , Y \right)_{(1)} \hspace{0.05cm} ,..., \hspace{0.05cm} \left(X , Y \right)_{(B)}$$
 
 \vspace{0.25cm}
 
Para cada $\hspace{0.1cm} b \in \lbrace 1,...,B \rbrace$

Se entrena el modelo de regresión lineal $\hspace{0.1cm}M\hspace{0.1cm}$ con la muestra  $\hspace{0.1cm}\left(X , Y \right)_{(b)}\hspace{0.1cm}$ de los predictores y la respueta $\hspace{0.25cm} \Rightarrow \hspace{0.25cm} \widehat{M}_{(b)}$


Se obtienen así $\hspace{0.1cm} B\hspace{0.1cm}$ modelos de regresión lineal entrenados $\hspace{0.1cm}\widehat{M}_{(1)}\hspace{0.05cm},...,\hspace{0.05cm}\widehat{M}_{(B)}\hspace{0.1cm}$, que son las replicas bootstrap del modelo inicial (el entrenado con los datos iniciales).

Podemos usar estos modelos para obtener intervalos de confianza bootstrap de los coeficientes betas y de otros parámetros como el coeficiente de determinación (R-cuadrado).




\vspace{0.25cm}



### Intervalo de confianza bootstrap para los coeficientes betas


Para cada modelo $\hspace{0.1cm} M_{(b)} \hspace{0.1cm}$ se tiene la estimación $\hspace{0.1cm} \widehat{\beta}_{(b)} \hspace{0.1cm}$ del vector de coeficientes betas, y con ello se tiene la estimación $\hspace{0.1cm}\widehat{\beta}_{j(b)}\hspace{0.1cm}$ del coeficiente   $\hspace{0.1cm}\beta_j\hspace{0.1cm}$, para cada predictor. 

\vspace{0.25cm}

Así que para cada estimador $\hspace{0.1cm}\widehat{\beta}_j\hspace{0.1cm}$ se tiene   un vector de replicas bootstrap: $\hspace{0.1cm} \widehat{\beta}_{j \hspace{0.05cm} , \hspace{0.05cm} boot} \hspace{0.1cm} = \hspace{0.1cm} \left( \widehat{\beta}_{j(1)} \hspace{0.05cm} , \hspace{0.05cm} \widehat{\beta}_{j(2)} \hspace{0.05cm},...,\hspace{0.05cm} \widehat{\beta}_{j(B)} \right) \hspace{0.25cm} , \hspace{0.25cm} \forall \hspace{0.1cm} j \in \lbrace 0,1,...,p\rbrace$

\vspace{0.25cm}

Se puede usar la filosofía de los intervalos cuantil-bootstrap para obtener el intervalos bootstrap para los coeficientes betas del modelo:


$$IC(\beta_j)_{1-\alpha}^{boot} \hspace{0.1cm} =\hspace{0.1cm} \left[ \hspace{0.1cm} Q \left( \hspace{0.1cm} \alpha/2 \hspace{0.1cm} , \hspace{0.1cm} \widehat{\beta}_{j \hspace{0.05cm} , \hspace{0.05cm}boot} \hspace{0.1cm} \right) \hspace{0.1cm} , \hspace{0.1cm}  Q \left( \hspace{0.1cm} 1-\alpha/2 \hspace{0.1cm} , \hspace{0.1cm} \widehat{\beta}_{j \hspace{0.05cm} , \hspace{0.05cm}boot} \hspace{0.1cm} \right)  \hspace{0.1cm} \right]$$


\vspace{0.25cm}


### Intervalo de confianza bootstrap para los coeficientes betas


Para cada modelo $\hspace{0.1cm} M_{(b)} \hspace{0.1cm}$ se tiene la estimación $\hspace{0.1cm} R^2_{adj\hspace{0.05cm} (b)} \hspace{0.1cm}$ del coeficiente de determinación ajustado. 

\vspace{0.25cm}

Así que para el estimador $\hspace{0.1cm}R^2_{adj \hspace{0.05cm} , \hspace{0.05cm} boot}\hspace{0.1cm}$ se tiene   un vector de replicas bootstrap: $\hspace{0.1cm} R^2_{adj \hspace{0.05cm} , \hspace{0.05cm} boot} \hspace{0.1cm} = \hspace{0.1cm} \left(  R^2_{adj\hspace{0.05cm} (1)} \hspace{0.05cm} , \hspace{0.05cm}  R^2_{adj\hspace{0.05cm} (2)} \hspace{0.05cm},...,\hspace{0.05cm}  R^2_{adj\hspace{0.05cm} (B)} \right) \hspace{0.25cm} , \hspace{0.25cm} \forall \hspace{0.1cm} j \in \lbrace 0,1,...,p\rbrace$

\vspace{0.25cm}

Se puede usar la filosofía de los intervalos cuantil-bootstrap para obtener el intervalos bootstrap para los coeficientes betas del modelo:  


$$IC(R^2_{adj})_{1-\alpha}^{boot} \hspace{0.1cm} =\hspace{0.1cm} \left[ \hspace{0.1cm} Q \left( \hspace{0.1cm} \alpha/2 \hspace{0.1cm} , \hspace{0.1cm} R^2_{adj \hspace{0.05cm} , \hspace{0.05cm} boot} \hspace{0.1cm} \right) \hspace{0.1cm} , \hspace{0.1cm}  Q \left( \hspace{0.1cm} 1-\alpha/2 \hspace{0.1cm} , \hspace{0.1cm} R^2_{adj \hspace{0.05cm} , \hspace{0.05cm} boot} \hspace{0.1cm} \right)  \hspace{0.1cm} \right]$$


 
 


\newpage



## Regresión lineal bootstrap en `Python`


```python
import pandas as pd
```



```python
Data = pd.read_csv('House_Price_Regression.csv')

Data = Data.loc[:, ['latitude', 'longitude', 'price', 'size_in_m_2','no_of_bedrooms', 'no_of_bathrooms', 'quality_recode']]

Data.head()
```
```
    latitude  longitude    price  size_in_m_2  no_of_bedrooms  
0  25.113208  55.138932  2700000   100.242337               1   
1  25.106809  55.151201  2850000   146.972546               2   
2  25.063302  55.137728  1150000   181.253753               3   
3  25.227295  55.341761  2850000   187.664060               2   
4  25.114275  55.139764  1729200    47.101821               0   

   no_of_bathrooms  quality_recode  
0                2             2.0  
1                2             2.0  
2                5             2.0  
3                3             1.0  
4                1             2.0 
```

\vspace{0.25cm}

```python
Data['quality_recode'] = Data['quality_recode'].astype('category')
```

\vspace{0.25cm}

```python
import sklearn

from sklearn.linear_model import LinearRegression
```

\vspace{0.25cm}

```python
X = Data[['size_in_m_2', 'longitude', 'latitude', 'no_of_bedrooms', 'no_of_bathrooms', 'quality_recode']]
Y = Data['price']
```
\vspace{0.25cm}

```python
X.head()
```
```
   size_in_m_2  longitude   latitude  no_of_bedrooms  no_of_bathrooms  
0   100.242337  55.138932  25.113208               1                2   
1   146.972546  55.151201  25.106809               2                2   
2   181.253753  55.137728  25.063302               3                5   
3   187.664060  55.341761  25.227295               2                3   
4    47.101821  55.139764  25.114275               0                1   

  quality_recode  
0            2.0  
1            2.0  
2            2.0  
3            1.0  
4            2.0  
```

\vspace{0.25cm}

```python
Y.head()
```

```
0    2700000
1    2850000
2    1150000
3    2850000
4    1729200
Name: price, dtype: int64
```

\vspace{0.25cm}

```python
def varcharProcessing(X, varchar_process = "dummy_dropfirst"):
    
    dtypes = X.dtypes

    if varchar_process == "drop":   
        X = X.drop(columns = dtypes[dtypes == np.object].index.tolist())

    elif varchar_process == "dummy":
        X = pd.get_dummies(X,drop_first=False)

    elif varchar_process == "dummy_dropfirst":
        X = pd.get_dummies(X,drop_first=True)

    else: 
        X = pd.get_dummies(X,drop_first=True)
    
    X["intercept"] = 1
    cols = X.columns.tolist()
    cols = cols[-1:] + cols[:-1]
    X = X[cols]
    
    return X
```

\vspace{0.25cm}

```python
X = varcharProcessing(X, varchar_process = "dummy_dropfirst")

X.head()
```


```
   intercept  size_in_m_2  longitude   latitude  no_of_bedrooms  
0          1   100.242337  55.138932  25.113208               1   
1          1   146.972546  55.151201  25.106809               2   
2          1   181.253753  55.137728  25.063302               3   
3          1   187.664060  55.341761  25.227295               2   
4          1    47.101821  55.139764  25.114275               0   

   no_of_bathrooms  quality_recode_1.0  quality_recode_2.0  quality_recode_3.0  
0                2                   0                   1                   0  
1                2                   0                   1                   0  
2                5                   0                   1                   0  
3                3                   1                   0                   0  
4                1                   0                   1                   0 
```

\vspace{0.25cm}

```python
def boot_interval_linear_regression(X, Y, method, parameter, j, B, alpha) :

    model_b_list , beta_hat_j_boot, R_2_adj_boot = [] , [] , []

    n = len(X)
    
    p = X.shape[1] - 1  # Si X no contiene el intercept --> p = X.shape[1]

    model = LinearRegression().fit(X, Y)

    residuals = Y - model.predict(X) 

    def Bootstrap_sample(X):

        from sklearn.utils import resample

        sample = resample( X, n_samples=len(X))

        return sample

    
    beta_hat = np.concatenate( ( np.array([model.intercept_]) , model.coef_[1:len(X)]) )

#######################################################################

    if method == 'residuals':

        if parameter == 'beta' :

            for b in range(0, B):
 
                residuals_b = Bootstrap_sample(residuals)

                Y_b = X.to_numpy() @ beta_hat + residuals_b

                model_b = LinearRegression().fit(X, Y_b) 

                beta_hat_j_boot.append( model_b.coef_[j] )
 
 
            L1 = np.quantile( beta_hat_j_boot  , q=alpha/2)

            L2 = np.quantile( beta_hat_j_boot  , q=1-alpha/2)

            interval = [L1,L2]

#######################################################################

        elif parameter == 'adj_R2' :

            for b in range(0, B):
 
                residuals_b = Bootstrap_sample(residuals)

                Y_b = X.to_numpy() @ beta_hat + residuals_b

                model_b = LinearRegression().fit(X, Y_b) 

                R_2_adj_boot.append( 1 - (1 - model_b.score(X , Y_b))*( (n-1) / (n-p-1) ) )
 
 
            L1 = np.quantile( R_2_adj_boot  , q=alpha/2)

            L2 = np.quantile( R_2_adj_boot  , q=1-alpha/2)

            interval = [L1,L2]

#######################################################################
       
    if method == 'pairs' :

        X_Y = pd.concat([X,Y], axis=1)

        if parameter == 'beta' :

            for b in range(0, B):
 
                X_Y_b = Bootstrap_sample(X_Y)

                X = X_Y_b.iloc[: , 0:(X_Y_b.shape[1]-1)]

                Y = X_Y_b.iloc[: , X_Y_b.shape[1]-1]

                model_b = LinearRegression().fit(X, Y) 

                beta_hat_j_boot.append( model_b.coef_[j] )
 
 
            L1 = np.quantile( beta_hat_j_boot  , q=alpha/2)

            L2 = np.quantile( beta_hat_j_boot  , q=1-alpha/2)

            interval = [L1,L2]

#######################################################################

        elif parameter == 'adj_R2' :

            for b in range(0, B):

                X_Y_b = Bootstrap_sample(X_Y)

                X = X_Y_b.iloc[: , 0:(X_Y_b.shape[1]-1)]

                Y = X_Y_b.iloc[: , X_Y_b.shape[1]-1]
 
                model_b = LinearRegression().fit(X, Y) 

                R_2_adj_boot.append( 1 - (1 - model_b.score(X , Y))*( (n-1) / (n-p-1) ) )
 
 
            L1 = np.quantile( R_2_adj_boot  , q=alpha/2)

            L2 = np.quantile( R_2_adj_boot  , q=1-alpha/2)

            interval = [L1,L2]

#######################################################################

    return interval
```


\vspace{0.35cm}

**Intervalo de confianza para los coeficientes beta del modelo de regresión lineal:**


```python
boot_interval_linear_regression(X=X, Y=Y, method='residuals', parameter='beta', j=1, B=500, alpha=0.05) 
```

    [34457.35430762553, 37169.50119078313]


\vspace{0.25cm}

```python
boot_interval_linear_regression(X=X, Y=Y, method='pairs', parameter='beta', j=1, B=500, alpha=0.05) 
```

    [29306.688429798087, 40389.149018568656]


\vspace{0.25cm}

```python
boot_interval_linear_regression(X=X, Y=Y, method='residuals', parameter='beta', j=2, B=500, alpha=0.05) 
```

    [-2949083.96469503, -297017.35523746273]

\vspace{0.25cm}

```python
boot_interval_linear_regression(X=X, Y=Y, method='pairs', parameter='beta', j=2, B=500, alpha=0.05) 
```

    [-2906726.4973525056, -394604.81858878786]

\vspace{0.35cm}


Calculamos los intervalos de confianza para los coeficientes betas del modelo de regresión lineal con la libería `statmodels`

```python
import statsmodels.api as sm
```


```python
model_SM = sm.OLS(Y , X).fit()
```

```python
model_SM.conf_int(alpha=0.05)
```
```
                                0             1
intercept           -1.204625e+08 -2.999117e+06
size_in_m_2          3.424446e+04  3.708364e+04
longitude           -3.031978e+06 -3.223444e+05
latitude             4.583358e+06  7.646506e+06
no_of_bedrooms      -9.991120e+05 -6.742539e+05
no_of_bathrooms     -1.910590e+05  7.681737e+04
quality_recode_1.0  -6.448764e+05 -3.634981e+04
quality_recode_2.0  -4.884944e+05  8.730549e+04
quality_recode_3.0  -5.140369e+05  3.903336e+05
```

\vspace{0.35cm}


**Intervalo de confianza para el coeficiente de determinación ajustado:**

```python 
boot_interval_linear_regression(X=X, Y=Y, method='residuals', parameter='adj_R2', j='none', B=500, alpha=0.05) 
```

     [0.6536518705306413, 0.7417060490432771]

\vspace{0.25cm}

```python
boot_interval_linear_regression(X=X, Y=Y, method='pairs', parameter='adj_R2', j='none', B=500, alpha=0.05) 
```

     [0.6248263646856418, 0.7629699519613915]

\vspace{0.25cm}

```python
model_SM.rsquared_adj
```

     0.6965926130210288 
 



\newpage
 

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


\newpage


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




\newpage

# Bibliografía





<br>

