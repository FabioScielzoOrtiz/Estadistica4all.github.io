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




$\mathcal{X}_1,...,\mathcal{X}_n$ son variables aleatorias mutuamente independientes e idénticamente distribuidas  *(i.i.d.)* $\hspace{0.3cm}\Leftrightarrow$

- $\mathcal{X}_1,...,\mathcal{X}_n\hspace{0.08cm}$ son mutuamente independientes , es decir:

\vspace{-0.5cm}

$$P(\mathcal{X}_1=x_1,...,\mathcal{X}_n=x_n) \hspace{0.1cm}=\hspace{0.1cm} \prod_{i=1}^n P(\mathcal{X}_i=x_i)$$

Lo que implica que también son independientes dos a dos , es decir, $\hspace{0.05cm} \mathcal{X}_i \perp \mathcal{X}_j \hspace{0.12cm} , \hspace{0.12cm} \forall i\neq j$

-  $\mathcal{X}_1,...,\mathcal{X}_n\hspace{0.12cm}$ tienen la misma distribución de probabilidad, es decir, $\hspace{0.12cm}\mathcal{X}_i \sim F( \cdot ) \hspace{0.15cm}, \hspace{0.1cm} \forall i\in \lbrace 1,...,n\rbrace$ 


    Donde $\hspace{0.08cm}F( \cdot )\hspace{0.08cm}$ es una distribucion de probabilidad con parametros no especificados. 




Usaremos la siguiente notación: 


$$(\mathcal{X}_1,...,\mathcal{X}_n) \underset{i.i.d.}{\sim} F(\cdot) \hspace{0.3cm} \Leftrightarrow
\left\lbrace\begin{array}{l}   \hspace{0.12cm}\mathcal{X}_1,...,\mathcal{X}_n \hspace{0.2cm} \text{son mutuamente independientes} \\[0.1cm] 
\hspace{0.12cm}\mathcal{X}_i \sim F(\cdot) \hspace{0.12cm} , \hspace{0.12cm} \forall i=1,...,n    \end{array}\right. \\[1cm]$$



<br>

# Muestra Aleatoria Simple

 

Sea $\mathcal{X}$ una v.a. tal que $\mathcal{X} \sim F(\cdot)$ 


$\mathcal{X}_1,...,\mathcal{X}_n \hspace{0.1cm}$ es una muestra aleatoria simple de tamaño $n$ de $\mathcal{X}$ $\hspace{0.2cm}\Leftrightarrow\hspace{0.2cm}$ $(\mathcal{X}_1,...,\mathcal{X}_n) \underset{i.i.d.}{\sim} F(\cdot) \\$

 

**Observación:**

Una m.a.s de una v.a $\mathcal{X}$ es un vector de v.a.'s mutuamente independientes y que se distribuyen probabilisticamente igual que la v.a $\mathcal{X}$


<br>

# Muestra de Observaciones


 

Sea $\mathcal{X}$ una v.a. tal que $\mathcal{X} \sim F(\cdot)$ 


 $X=(x_1,...,x_n)\hspace{0.05cm}$ es una muestra de $\hspace{0.08cm}n\hspace{0.08cm}$ observaciones de la v.a. $\mathcal{X}\hspace{0.12cm}  \Leftrightarrow$ $\\[0.2cm] \Leftrightarrow\hspace{0.2cm}$ $x_i \in Im(\mathcal{X}) \hspace{0.12cm} ,\hspace{0.12cm} \forall i\in \lbrace 1,...,n \rbrace$ 
 
$\Leftrightarrow\hspace{0.2cm}$ $x_i$ es una realización de la v.a. $\mathcal{X}$  , $\hspace{0.12cm}\forall i\in \lbrace 1,...,n \rbrace \\$


 
Donde:

$Im(\mathcal{X})\hspace{0.1cm}$ es la imagen de $\mathcal{X}$, es decir, su campo de variación.



\newpage


**Observaciones:**

- Una muestra de observaciones de una v.a. es un vector de números, no son v.a.'s. 

- Si $\hspace{0.08cm} X=(x_1,...,x_n)\hspace{0.08cm}$ es una muestra de $\hspace{0.08cm}n\hspace{0.08cm}$ observaciones de $\hspace{0.08cm}\mathcal{X}\sim F(\cdot)$ , entonces $\hspace{0.08cm}x_i\hspace{0.08cm}$ es una observación que ha sido generada por la distribución de probabilidad $\hspace{0.08cm}F(\cdot)\hspace{0.08cm}$, es decir, $\hspace{0.08cm}x_i\hspace{0.08cm}$ puede verse como un numero aleatorio generado en base a la distribución de probabilidad $\hspace{0.08cm} F(\cdot)$ 

- Si $\hspace{0.08cm}X=(x_1,...,x_n)\hspace{0.08cm}$ es una muestra de $\hspace{0.08cm}n\hspace{0.08cm}$ observaciones de $\mathcal{X}\sim F(\cdot)$ , entonces:


    -- $P(\mathcal{X}= x_i)$ es la probabilidad de  observar $x_i$ al extraer una muestra de observaciones de $\mathcal{X}$ $\\[0.2cm]$


- Si $\hspace{0.08cm}(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.08cm}$ es una muestra aleatoria simple (m.a.s.) de tamaño $\hspace{0.08cm}n\hspace{0.08cm}$ de $\hspace{0.08cm}\mathcal{X}\sim F(\cdot)\hspace{0.08cm}$ , entonces:

    -- $P(\mathcal{X}_1 = x_1 , ..., \mathcal{X}_n=x_n)\hspace{0.08cm}$ es la probabilidad de obtener como valores $\hspace{0.08cm}(x_1,...,x_n)\hspace{0.08cm}$ al extraer una muestra de observaciones de $\hspace{0.08cm}\mathcal{X}\\$

 


# Estadístico


<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
 
 $T\hspace{0.1cm}$ es un estadístico de una m.a.s $\hspace{0.1cm}(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ de la v.a. $\hspace{0.1cm}\mathcal{X}\sim F(\theta)$ $\hspace{0.25cm}\Leftrightarrow\hspace{0.25cm}$ $T\hspace{0.1cm}$ es una función de la m.a.s que no depende  del parámetro $\hspace{0.1cm}\theta$

 \vspace{0.2cm}

Por tanto:

 \vspace{-0.2cm}


- $T(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ es un estadístico.  


\vspace{0.2cm}

**Observaciones:**

- $T(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ es una v.a. al ser una función de v.a.'s 

- Dada una muestra de observaciones $(x_1 ,..., x_n)$ de  la v.a $\mathcal{X} \sim D(\theta)$ 

    -- $T(x_1,...,x_n)$ es una observación de la v.a. $T(\mathcal{X}_1,...,\mathcal{X}_n)$


- Dadas $B$ muestras de observaciones $(x_1^1 , ..., x_n^1) ,...,(x_1^B,...,x_n^B)$ de la v.a $\mathcal{X} \sim D(\theta)$ 

     -- $T(x_1^1 , ..., x_n^1) ,..., T(x_1^B,...,x_n^B)$ es una muestra de observaciones de la v.a. $T(\mathcal{X}_1,...,\mathcal{X}_n)$


\newpage

## Ejemplos de estadisticos


Sea $\mathcal{X}$ una v.a. tal que $\mathcal{X} \sim D(\theta)$ , y sea $(\mathcal{X}_1,...,\mathcal{X}_n)$ una m.a.s. de $\mathcal{X} \\$


- **Media muestral**

\vspace{-0.7cm}


$$T(\mathcal{X}_1,...,\mathcal{X}_n) = \overline{\mathcal{X}} = \dfrac{1}{n} \sum_{i=1}^n \mathcal{X}_i$$


\vspace{0.4cm}

- **Varianza muestral**

\vspace{-0.7cm}


$$T(\mathcal{X}_1,...,\mathcal{X}_n) = S^2_n = \dfrac{1}{n} \sum_{i=1}^n (\mathcal{X}_i - \overline{\mathcal{X}})^2$$

\vspace{0.4cm}

- **Cuasi-Varianza muestral**

\vspace{-0.7cm}

$$T(\mathcal{X}_1,...,\mathcal{X}_n) = S^2_{n-1} = \dfrac{1}{n-1} \sum_{i=1}^n (\mathcal{X}_i - \overline{X})^2$$




\vspace{0.2cm}


# Estimador Puntual

 
Dada una v.a. $\mathcal{X}\sim D(\theta)$ y una m.a.s. $(\mathcal{X}_1,...,\mathcal{X}_n)$ de $\mathcal{X}$, 

Un estimador puntual para el parámetro $\theta$ es un estadístico $\widehat{\theta}(\mathcal{X}_1,...,\mathcal{X}_n)$ que se propone para estimar $\theta$

 



\vspace{0.2cm}


# Estimación Puntual
 

$\hspace{0.25cm}$ Dada una v.a. $\hspace{0.1cm}\mathcal{X}\sim D(\theta)\hspace{0.1cm}$ , una m.a.s. $\hspace{0.1cm}(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ de $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ y un estadístico $\hspace{0.1cm}\widehat{\theta}(\mathcal{X}_1,...,\mathcal{X}_n)$

$\hspace{0.25cm}$ Si  $\hspace{0.1cm}X=(x_1,...,x_n)\hspace{0.1cm}$ es una muestra de observaciones  de $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ , entonces:

- $\hspace{0.1cm}$$\widehat{\theta}(X) = \widehat{\theta}(x_1,...,x_n)\hspace{0.1cm}$ es una estimación puntual del parámetro $\hspace{0.1cm}\theta$

\vspace{0.2cm}


**Observaciones:**

Un estimador puntual es una v.a. y una estimación puntual un número.



\newpage

# Propiedades básicas de los estimadores

Dada una v.a. $\mathcal{X}\sim D(\theta)$ , una m.a.s. $(\mathcal{X}_1,...,\mathcal{X}_n)$ de $\mathcal{X}$ y un estimador $\widehat{\theta}(\mathcal{X}_1,...,\mathcal{X}_n)$


 

## Sesgo

 

$\hspace{0.25cm}$ El sesgo del estimador $\widehat{\theta}$ se define como:

$$Sesgo(\widehat{\theta}) = E \left[ \hspace{0.05cm} \widehat{\theta} \hspace{0.05cm} \right]- \theta$$


\vspace{0.3cm}




## Varianza 

 

$\hspace{0.25cm}$ La varianza del estimador $\widehat{\theta}$ se define como:

$$Var(\widehat{\theta}) = E \left[ \hspace{0.05cm} \left( \widehat{\theta} - E [ \hspace{0.05cm} \widehat{\theta} \hspace{0.05cm}  ] \right)^2 \hspace{0.05cm} \right]$$


$\hspace{0.25cm}$ El error estandar (desviación típica) del estimador $\widehat{\theta}$ se define como:

$$s.e.(\widehat{\theta}) = \sqrt{Var(\widehat{\theta})}$$


\vspace{0.3cm}

## Error Cuadratico Medio


El error cuadrático medio del estimador $\widehat{\theta}$ se define como:

$$ECM(\widehat{\theta}) = E\left[\hspace{0.1cm} (\widehat{\theta} - \theta)^2 \hspace{0.1cm} \right] $$


 

**Propiedades**

- $ECM(\widehat{\theta}) = Var(\hat{\theta} ) + Sesgo(\widehat{\theta})^2$






\newpage





# Estimación del sesgo y varianza por Jacknife

Tenemos una v.a. $\mathcal{X}\sim D(\theta)$ , una m.a.s. $(\mathcal{X}_1,...,\mathcal{X}_n)$ de $\mathcal{X}$ y un estimador $\widehat{\theta}(\mathcal{X}_1,...,\mathcal{X}_n)$ del parámetro $\theta$


Además tenemos una muestra de observaciones $\hspace{0.1cm}X=(x_1,...,x_n)\hspace{0.1cm}$   de la variable de interés $\mathcal{X}$ , por lo que tenemos la estimación  $\widehat{\theta}(X)=\widehat{\theta}(x_1,...,x_n)$ del parámetro $\theta \\$


 

 Se define $X_{(r)}$ como la muestra que contiene todos los valores de $X$ excepto $x_{r}$

Es decir:


$$X_{(r)} = (\hspace{0.05cm}x_{1}\hspace{0.05cm},\hspace{0.05cm} x_{2}\hspace{0.05cm},..,\hspace{0.05cm} x_{r-1}\hspace{0.05cm},\hspace{0.05cm}x_{r+1}\hspace{0.05cm} ,..,\hspace{0.05cm} x_{n}\hspace{0.05cm}) \hspace{0.25cm} , \hspace{0.25cm} \forall r\in \lbrace 1,..., \rbrace$$  

 
 

Se define la replica $r$-esima del estimador $\hspace{0.1cm}\widehat{\theta}\hspace{0.1cm}$ como:  

$$\widehat{\theta}_{(r)} = \widehat{\theta}(X_{(r)})= \widehat{\theta}(\hspace{0.05cm}x_{1}\hspace{0.05cm},\hspace{0.05cm} x_{2}\hspace{0.05cm},..,\hspace{0.05cm} x_{r-1}\hspace{0.05cm},\hspace{0.05cm}x_{r+1}\hspace{0.05cm} ,..,\hspace{0.05cm} x_{n}\hspace{0.05cm})$$


 
 
\vspace{1cm}




## Estimación Jacknife del sesgo

 

 La **estimación Jacknife** del **sesgo** del estimador $\widehat{\theta}$ se define como: 

$$\widehat{Sesgo}(\widehat{\theta})_{Jack} \hspace{0.1cm}=\hspace{0.1cm}  (n-1) \cdot \left(   \dfrac{1}{n}  \sum_{r=1}^{n} \widehat{\theta}_{(r)} \hspace{0.1cm} -\hspace{0.1cm} \widehat{\theta}(X) \right)$$



donde:

$$\widehat{\theta}(X) \hspace{0.1cm}=\hspace{0.1cm} \widehat{\theta}(x_1,...,x_n)$$

\vspace{-0.3cm}

$$\widehat{\theta}_{(r)} = \widehat{\theta}(X_{(r)})= \widehat{\theta}(\hspace{0.05cm}x_{1}\hspace{0.05cm},\hspace{0.05cm} x_{2}\hspace{0.05cm},..,\hspace{0.05cm} x_{r-1}\hspace{0.05cm},\hspace{0.05cm}x_{r+1}\hspace{0.05cm} ,..,\hspace{0.05cm} x_{n}\hspace{0.05cm})$$


 

\newpage



## Estimación Jacknife de la varianza

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

$\hspace{0.25cm}$ La **estimación Jacknife** de la **varianza** del estimador $\widehat{\theta}$ se define como:  


$$\widehat{ Var}(\widehat{\theta})_{Jack} \hspace{0.1cm}= \hspace{0.1cm} \dfrac{n-1}{n} \cdot \sum_{r=1}^{n} \left( \widehat{\theta}_{(r)} \hspace{0.1cm}-\hspace{0.1cm} \dfrac{1}{n} \sum_{r=1}^{n} \widehat{\theta}_{(r)}  \right)^2$$

$\hspace{0.25cm}$ donde:

 
$$\widehat{\theta}_{(r)} = \widehat{\theta}(X_{(r)})= \widehat{\theta}(\hspace{0.05cm}x_{1}\hspace{0.05cm},\hspace{0.05cm} x_{2}\hspace{0.05cm},..,\hspace{0.05cm} x_{r-1}\hspace{0.05cm},\hspace{0.05cm}x_{r+1}\hspace{0.05cm} ,..,\hspace{0.05cm} x_{n}\hspace{0.05cm})$$

</p>
 
</p></span>
</div>



\vspace{0.5cm}



<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

$\hspace{0.25cm}$ La **estimación Jacknife** del **error estandar** del estimador $\widehat{\theta}$ se define como:  

$$\widehat{ s.e.}(\widehat{\theta})_{Jack} \hspace{0.1cm}=\hspace{0.1cm} \sqrt{ \widehat{ Var}(\widehat{\theta})_{Jack} \hspace{0.1cm}}$$


</p>
 
</p></span>
</div>


<br>


\vspace{0.5cm}

**Observación:**

El Jacknife funciona bien cuando el estimador es suave (smooth). 

Un estimador es suave cuando ante pequeños cambios en la muestra de datos genera pequeños cambios en el estimador.

Ejemplo de estimador suave es el estimador plug-in de la media poblacional, es decir la media muestral.

Ejemplo de estimador no suave es el estimador plug-in de la mediana poblacional, es decir la mediana muestral.


 


\newpage



## Estimación Jacknife de un parámetro con corrección de sesgo


Tenemos una v.a $\mathcal{X}\sim D(\theta)$ , una m.a.s $(\mathcal{X}_1,...,\mathcal{X}_n)$ de $\mathcal{X}$ y un estimador $\widehat{\theta}(\mathcal{X}_1,...,\mathcal{X}_n)$ del parámetro $\theta$


Además tenemos una muestra de observaciones $X=(x_1,...,x_n)$   de la variable de interés $\mathcal{X}$ , por lo que tenemos la estimación  $\widehat{\theta}(X)=\widehat{\theta}(x_1,...,x_n)$ del parámetro $\theta \\[0.5cm]$


 
  La **estimación Jacknife con sesgo corregido** del parámetro $\theta$ se define como:  

$$
\widehat{\theta}_{Jack} \hspace{0.1cm}=\hspace{0.1cm} \widehat{\theta}(X) \hspace{0.1cm}-\hspace{0.1cm} \widehat{Sesgo}(\widehat{\theta})_{Jack} \ \hspace{0.1cm}=\hspace{0.1cm} \widehat{\theta}(X) -  (n-1) \cdot \left(    \dfrac{1}{n} \cdot \sum_{r=1}^{n} \widehat{\theta}_{(r)}
 - \widehat{\theta} \right) \hspace{0.1cm}=\hspace{0.1cm}   n  \widehat{\theta}(X) \hspace{0.05cm} -\hspace{0.05cm} (n-1)  \dfrac{1}{n}  \sum_{r=1}^{n} \widehat{\theta}_{(r)} \\
$$

donde:

$$\widehat{\theta} \hspace{0.1cm} =\hspace{0.1cm} \widehat{\theta}(X)\hspace{0.1cm} =\hspace{0.1cm} \widehat{\theta}(x_1,...,x_n)$$

\vspace{-0.3cm}

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



# Estimación del sesgo, varianza y error cuadratico medio de un estimador por Bootstrap


Tenemos una v.a $\mathcal{X}\sim D(\theta)$ , una m.a.s $\mathcal{X}_1,...,\mathcal{X}_n)$ de $\mathcal{X}$ y un estimador $\widehat{\theta}(\mathcal{X}_1,...,\mathcal{X}_n)$ del parámetro $\theta$


Además tenemos una muestra de observaciones $X=(x_1,...,x_n)$   de la variable de interés $\mathcal{X}$ , por lo que tenemos la estimación $\widehat{\theta}(X)=\widehat{\theta}(x_1,...,x_n)$ del parametro $\theta\\$ 





Una **muestra bootstrap**  de $X=(x_1,...,x_n)$ se define como una **muestra aleatoria con reemplazamiento** de tamaño $n$ de $X$ 


Tenemos $B$ muestras bootstrap de $X$ : 

$$X_{(1)},X_{(2)},...,X_{(B)} \\$$

\vspace{0.2cm}


Se define la replica bootstap $\hspace{0.1cm}b$-esima del estimador $\hspace{0.1cm}\widehat{\theta}$ como: 

$$\widehat{\theta}_{(b)} = \widehat{\theta}(X_{(b)})$$




\vspace{0.3cm}


## Estimación bootstrap del sesgo de un estimador


 

 La **estimación bootstrap** del **sesgo** del estimador $\hspace{0.1cm}\widehat{\theta}\hspace{0.1cm}$ se define como: $\\[0.5cm]$


$$\widehat{Sesgo}(\widehat{\theta})_{Boot} \hspace{0.12cm} =\hspace{0.12cm}  \dfrac{1}{B} \cdot \sum_{b=1}^{B} \left( \widehat{\theta}_{(b)}  - \widehat{\theta}(X) \right) \hspace{0.12cm}=\hspace{0.12cm}  \dfrac{1}{B} \cdot \sum_{b=1}^{B}  \widehat{\theta}_{(b)}  \hspace{0.1cm} -\hspace{0.1cm} \widehat{\theta}(X)$$


donde:

$$\widehat{\theta}_{(b)} = \widehat{\theta}(X_{(b)})$$

\vspace{-0.2cm}

$$\widehat{\theta}(X) \hspace{0.12cm} =\hspace{0.12cm}  \widehat{\theta}(x_1,...,x_n)\\$$



\vspace{0.3cm}

**Observación:**

La estimación bootstrap del sesgo del estimador $\hspace{0.12cm}\widehat{\theta}\hspace{0.12cm}$ es la media del vector de replicas bootstrap $\hspace{0.12cm}(\widehat{\theta}_{(1)},\widehat{\theta}_{(2)},...,\widehat{\theta}_{(B)})\hspace{0.12cm}$ menos la estimación $\widehat{\theta}(X)$



\newpage


## Estimación bootstrap de la varianza de un estimador


 

$\hspace{0.25cm}$ La **estimación Bootstrap** de la **varianza** del estimador $\hspace{0.1cm}\widehat{\theta}\hspace{0.1cm}$ se define como: $\\[0.5cm]$

$$\widehat{Var}(\widehat{\theta})_{Boot} \hspace{0.12cm} =\hspace{0.12cm}   \dfrac{1}{B-1} \cdot \sum_{b=1}^{B} \left( \widehat{\theta}_{(b)}  \hspace{0.1cm}-\hspace{0.1cm} \dfrac{1}{B} \cdot \sum_{b=1}^{B} \widehat{\theta}_{(b)} \right)^2 \\[0.8cm]$$

donde:

\vspace{-0.4cm}
 
$$\widehat{\theta}_{(b)} = \widehat{\theta}(X_{(b)})$$

 
\vspace{0.7cm}
 

 
La **estimación bootstrap** de la **desviación típica** del estimador $\hspace{0.1cm}\widehat{\theta}\hspace{0.1cm}$ se define como:  

$$\widehat{s.e.}(\widehat{\theta})_{Boot} \hspace{0.12cm} =\hspace{0.12cm}   \sqrt{ \widehat{Var}(\widehat{\theta})_{Boot}   }\\$$


 
\vspace{0.4cm}


**Observación:**

La estimación bootstrap de la varianza del estimador $\hspace{0.12cm}\widehat{\theta}\hspace{0.12cm}$ es la cuasi-varianza del vector de replicas bootstrap $\hspace{0.12cm}(\widehat{\theta}_{(1)},\widehat{\theta}_{(2)},...,\widehat{\theta}_{(B)})$



\vspace{0.5cm}



## Estimación bootstrap del error cuadratico medio de un estimador

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>


$\hspace{0.25cm}$ La **estimación Bootstrap** del **error cuadrático medio** del estimador $\hspace{0.1cm}\widehat{\theta}\hspace{0.1cm}$ se define como:  

$$\widehat{ECM}(\widehat{\theta})_{Boot} \hspace{0.12cm} =\hspace{0.12cm}   \dfrac{1}{B} \cdot \sum_{b=1}^{B} \left( \widehat{\theta}_{(b)}  - \widehat{\theta}(X) \right)^2\\$$


donde:

$$\widehat{\theta}_{(b)} = \widehat{\theta}(X_{(b)})$$

\vspace{-0.3cm}

$$\widehat{\theta}(X) \hspace{0.12cm} =\hspace{0.12cm}  \widehat{\theta}(x_1,...,x_n)\\$$




\newpage



## Estimación bootstrap  de un parametro con corrección de sesgo
 

$\hspace{0.25cm}$ La **estimación Bootstrap con sesgo corregido** del parametro $\hspace{0.1cm} \theta\hspace{0.1cm}$ se define como:

$$
\widehat{\theta}_{Boot} \hspace{0.2cm}=\hspace{0.2cm} \widehat{\theta}(X) \hspace{0.1cm}-\hspace{0.1cm} \widehat{Sesgo}(\widehat{\theta})_{Boot} \ \hspace{0.2cm}=\hspace{0.2cm}  \widehat{\theta}(X) \hspace{0.1cm} -\hspace{0.1cm}\hspace{0.1cm} \dfrac{1}{B} \cdot \sum_{b=1}^{B} \left( \widehat{\theta}_{(b)}  - \widehat{\theta}(X) \right) \\
$$

donde:

$$\widehat{\theta}_{(b)} = \widehat{\theta}(X_{(b)})$$

\vspace{-0.2cm}

$$\widehat{\theta}(X)\hspace{0.1cm} =\hspace{0.1cm} \widehat{\theta}(x_1,...,x_n)$$



 
\vspace{0.5cm}

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

 

La **función de distribución** de la v.a. $\mathcal{X}$ es : 

$$F_{X}(z) = P(X \leq z)  \hspace{0.2cm}, \hspace{0.2cm}\forall z \in \mathbb{R}$$

 
\vspace{0.3cm}



**Observación:**

La función de distribución de la v.a. $\mathcal{X}$ coincide con las funciones de distribución de las v.a's $\mathcal{X}_1,...,\mathcal{X}_n \\$ , porque tienen la misma distribución de probabilidad.

$$F_{X}(z) = F_{X_i}(z) \hspace{0.2cm}, \hspace{0.2cm}\forall z \in \mathbb{R} \hspace{0.2cm},\hspace{0.2cm} \forall i \in \lbrace 1,...,n \rbrace$$




\vspace{0.3cm}




## La función de distribución empírica

Dada una v.a. $\mathcal{X}\sim D(\theta)\hspace{0.1cm}$


 

 La función de distribución empírica basada en una m.a.s. $\hspace{0.1cm}(\mathcal{X}_1,...,\mathcal{X}_n)\hspace{0.1cm}$ de $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ se define como:


$$\widehat{F}_n(z) \hspace{0.1cm} = \hspace{0.1cm} \dfrac{1}{n} \sum_{i=1}^n  I(\mathcal{X}_i \geq z) $$

   donde:

$$I(X_i \geq z) =  \left\lbrace\begin{array}{l}   \hspace{0.12cm} 1 \hspace{0.2cm},\hspace{0.3cm} \text{si} \hspace{0.3cm} X_i \geq z \\[0.1cm] 
\hspace{0.12cm} 0 \hspace{0.2cm},\hspace{0.3cm} \text{si} \hspace{0.3cm} X_i > z \\[0.1cm] 
\end{array}\right.$$

   para $\hspace{0.1cm} z\in \mathbb{R}$

  
 
\vspace{0.7cm}


**Observaciones:**

- $\widehat{F}_n(z)\hspace{0.1cm}$ es una v.a.  

- $\widehat{F}_n(z)\hspace{0.1cm}$ es usada como estimador de $\hspace{0.1cm}F_X(z)$




\newpage



### Porpiedades de la función de distribución empírica como v.a.

 

 Algunas propiedades de la distribución empírica como variable aleatoria:

- $\hspace{0.2cm} I(X_i \geq z) \hspace{0.2cm}\sim\hspace{0.2cm} Bernoulli\left( p \right) \hspace{0.2cm} ,\hspace{0.2cm}  \text{con}\hspace{0.2cm} \hspace{0.2cm} p=F_X(z)=P(X<z)\\[0.2cm]$

- $\hspace{0.2cm}  \sum_{i=1}^n  I(X_i \geq z) \hspace{0.2cm}\sim\hspace{0.2cm} Binomial(n , p  ) \hspace{0.2cm} ,\hspace{0.2cm}  \text{con}\hspace{0.2cm} \hspace{0.2cm} p=F_X(z)=P(X<z) \\[0.2cm]$

- $\hspace{0.2cm} \widehat{F}_n(z) \hspace{0.1cm} = \hspace{0.1cm}   \dfrac{1}{n} \sum_{i=1}^n  I(X_i \geq z) \hspace{0.2cm}\sim\hspace{0.2cm}  \dfrac{1}{n} \cdot Binomial(n , p  )\\$

    $\hspace{0.2cm} \text{donde}\hspace{0.2cm} p\hspace{0.1cm}=\hspace{0.1cm}F_X(z)\hspace{0.1cm}=\hspace{0.1cm}P(X<z) \\[0.2cm]$


- $E\left[ \widehat{F}_n(z)  \right] \hspace{0.1cm}=\hspace{0.1cm}  E \left[ \dfrac{1}{n} \cdot Binomial(n , p  ) \right] \hspace{0.1cm}=\hspace{0.1cm} \dfrac{1}{n}  n   p  \hspace{0.1cm}=\hspace{0.1cm} p \hspace{0.1cm}=\hspace{0.1cm} F_X(z)=P(X<z) \\[0.2cm]$


- $Var\left[ \widehat{F}_n(z)  \right] \hspace{0.1cm}=\hspace{0.1cm} Var \left[ \dfrac{1}{n} \cdot Binomial(n , p  ) \right]\hspace{0.1cm}=\hspace{0.1cm} \dfrac{1}{n^2}  n   p  (1-p) = \\[0.25cm] \hspace{0.1cm}=\hspace{0.1cm} \dfrac{1}{n}  F_X(z) (1- F_X(z))  \hspace{0.1cm}=\hspace{0.1cm} F_X(z)=P(X<z) \\[0.2cm]$


 

\newpage


## Función de distribución empírica como estimación de la función de distribución



 Si tenemos una muestra de observaciones $\hspace{0.1cm}X=(x_1,...,x_n)\hspace{0.1cm}$   de la variable de interés $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$  


  Tenemos la siguiente **estimación** de la función de distribución de $\mathcal{X}$ a través de la función de distribución emprica:

$$\widehat{F}_n(z) \hspace{0.1cm}=\hspace{0.1cm} \dfrac{1}{n} \sum_{i=1}^n  I(x_i \geq z) \hspace{0.1cm} = \hspace{0.1cm} \dfrac{\# \lbrace \hspace{0.1cm}  i=1,..,n\hspace{0.1cm}  / \hspace{0.1cm}  x_i \geq z\hspace{0.1cm}  \rbrace}{n} \hspace{0.3cm} , \hspace{0.3cm} z\in \mathbb{R}\\$$


 

\vspace{0.5cm}
 


**Propiedades de la función de distribución empírica como estimación**

 

- $\widehat{F}_n(z) = Q(X , z)\\$

    Donde $Q(X , z)$  es el cuantil de orden $z$ de $X=(x_1,...,x_n) \\$



- Si se ordena la muestra $X=(x_1,...,x_n)$ de menor a mayor $x_{(1)}<\hspace{0.1cm}x_{(2)}<...<x_{(n)}\hspace{0.1cm}$ , entonces: 


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

Dada una v.a. $\mathcal{X}\sim D(\theta)$ tal que $E[\mathcal{X}]=\mu$

Si $\widehat{F}_n(z)$ es la función de distribución empírica basada en la m.a.s. $(\mathcal{X}_1,...,\mathcal{X}_n)$ de $\mathcal{X}$ , se cumple que:

$$\dfrac{1}{n} \sum_{i=1}^n \mathcal{X}_i \hspace{0.15cm}\underset{p}{\rightarrow}\hspace{0.15cm} E[X]=\mu$$


\vspace{0.3cm}


**Observación:** $E[X]=E[X_i] \hspace{0.25cm},\hspace{0.25 cm} \forall i \in \lbrace 1,...,n \rbrace$



 \vspace{1cm}
 
Podemos aplicar la ley de los grandes números a la distribución empírica:

  Como $\hspace{0.1cm}I(\mathcal{X}_i \geq z) \sim Bernoulli(p)\hspace{0.1cm}$ , con $\hspace{0.1cm}E\left[I(\mathcal{X}_i \geq z)\right]\hspace{0.05cm} =\hspace{0.05cm} p\hspace{0.05cm}=\hspace{0.05cm}F_X(z)\hspace{0.05cm}=\hspace{0.05cm}P(X \leq z)\\$

 Aplicando la ley debil de los grandes números tenemos lo siguiente:


$$\widehat{F}_n(z) \hspace{0.1cm} = \hspace{0.1cm} \dfrac{1}{n} \sum_{i=1}^n  I(\mathcal{X}_i \geq z) \hspace{0.25cm}\underset{p}{\rightarrow} \hspace{0.25cm} p=F_X(z) \\$$

 En conclusión:

$$\widehat{F}_n(z) \hspace{0.15cm}\underset{p}{\rightarrow} \hspace{0.15cm} F_X(z)$$

\vspace{0.25cm}


  Usando la definición de convergencia en probabilidad, se tiene que:  


$$\underset{n\rightarrow \infty}{lim} \hspace{0.1cm} P\left( \hspace{0.1cm} | \widehat{F}_n(z) - F_X(z) |\hspace{0.1cm} \leq \varepsilon \right) \hspace{0.1cm}=\hspace{0.1cm} 1 \hspace{0.25cm},\hspace{0.25cm} \forall \varepsilon > 0 \\$$

 
\vspace{0.55cm}

Pero se cumple un resultado más fuerte aun, el **teorema de Glivenko-Cantelli**.



## Teorema de Glivenko-Cantelli

Dada una v.a. $\mathcal{X}\sim D(\theta)$ tal que $E[\mathcal{X}]=\mu \\$ 

Si $\widehat{F}_n(z)$ es la función de distribución empírica basada en la m.a.s. $(\mathcal{X}_1,...,\mathcal{X}_n)$ de $\mathcal{X}$ , se cumple que: 

$$sup \left\lbrace \hspace{0.1cm}\left|\hspace{0.1cm} \widehat{F}_n(z)  - F_X(z)\hspace{0.1cm} \right| \hspace{0.15cm}  : \hspace{0.15cm} z \in \mathbb{R} \hspace{0.1cm}\right\rbrace \hspace{0.15cm}\underset{p}{\rightarrow} \hspace{0.15cm} 0\\$$




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

\vspace{-0.25cm}

$$X_{(1)},X_{(2)},...,X_{(B)} \\$$


- Se calcula para $b\in \lbrace 1,...,B \rbrace$ la replica bootstrap $\hspace{0.1cm}b$-esima del estimador $\hspace{0.1cm}\widehat{\theta}$ como: 

\vspace{-0.25cm}

$$\widehat{\theta}_{(b)} = \widehat{\theta}(X_{(b)}) \\$$


Asi que se tiene:

\vspace{-0.25cm}


$$\widehat{\theta}_{boot} = \left(\widehat{\theta}_{(1)},...,\widehat{\theta}_{(B)} \right)$$


\vspace{1cm}
 
Sea $\hspace{0.1cm}Q(\alpha \hspace{0.05cm} ,  \hspace{0.05cm} \widehat{\theta}_{boot})\hspace{0.1cm}$  el cuantil de orden $\hspace{0.1cm}\alpha\hspace{0.1cm}$ de la variable $\hspace{0.15cm}\widehat{\theta}_{boot}$ , entonces se cumple lo siguiente:


$$\dfrac{\# \hspace{0.15cm} \left\lbrace \hspace{0.1cm}  b = 1,...,B \hspace{0.25cm} / \hspace{0.25cm} \widehat{\theta}_{(b)} \hspace{0.05cm} \leq \hspace{0.05cm} Q(\alpha \hspace{0.05cm} , \hspace{0.05cm} \widehat{\theta}_{boot}) \hspace{0.1cm}  \right\rbrace \hspace{0.1cm} }{B}  \hspace{0.15cm} = \hspace{0.15cm} \alpha$$


\vspace{0.25cm}

- El intervalo cuantil-bootstrap para el parámetro $\theta$ a un nivel $1-\alpha$ es : 

    $$IC(\theta )_{1-\alpha}^{boot} \hspace{0.1cm} = \hspace{0.1cm} \left[ \hspace{0.1cm} Q(\alpha/2 \hspace{0.1cm} , \hspace{0.1cm} \widehat{\theta}_{boot}) \hspace{0.2cm} ;  \hspace{0.2cm} Q(1-\alpha/2 \hspace{0.1cm} , \hspace{0.1cm} \widehat{\theta}_{boot}) \hspace{0.1cm} \right] \\[1cm]$$




 

\newpage


## Intervalos cuantil-bootstrap con dos poblaciones



Tenemos dos v.a's $\mathcal{X}_1\sim D_1(\theta_1)$ y $\mathcal{X}_2\sim D_2(\theta_2)$ , una m.a.s. $(\mathcal{X}_{11},...,\mathcal{X}_{n_1 1})$ de $\mathcal{X}_1$ , otra  m.a.s. $(\mathcal{X}_{12},...,\mathcal{X}_{n_2 2})$ de $\mathcal{X}_2$ y un par de estimadores $\widehat{\theta}_1(\mathcal{X}_{11},...,\mathcal{X}_{n_1 1})$ y $\widehat{\theta}_2(\mathcal{X}_{12},...,\mathcal{X}_{n_2 2})$ de los parámetros $\theta_1$ y  $\theta_2$, respectivamente.


Además tenemos una muestras de observaciones $X_1=(x_{11},...,x_{n_1 1})$   de la v.a.  $\mathcal{X}_1$ y otra $X_1=(x_{11},...,x_{n_1 1})$  de  $\mathcal{X}_2$, por lo que tenemos las estimaciones $\widehat{\theta}_1(X_1)=\widehat{\theta}_1(x_{1 1},...,x_{n_1 1})$ de los parámetros $\theta_1$ y  $\theta_2$ , respectivamente.





 

- Se obtienen $B$ muestras bootstrap (aleatorias y con reemplazamiento) de $X_1$ y $X_2$:  
\vspace{-0.35cm}


$$X_{1(1)},X_{1(2)},...,X_{1(B)}$$

$$X_{2(1)},X_{2(2)},...,X_{2(B)} \\$$




- Se calcula para $b\in \lbrace 1,...,B \rbrace$ la replica bootstrap $\hspace{0.1cm}b$-esima de los estimadores $\hspace{0.1cm}\widehat{\theta}_1$ y $\hspace{0.1cm}\widehat{\theta}_2$ como: 


\vspace{-0.25cm}

  $$\widehat{\theta}_{1(b)} = \widehat{\theta}(X_{1(b)})$$

  $$\widehat{\theta}_{2(b)} = \widehat{\theta}(X_{2(b)}) \\$$


- Así que se tiene:

  $$\widehat{\theta}_{1 \hspace{0.05cm},\hspace{0.05cm} boot} = \left(\widehat{\theta}_{1(1)},...,\widehat{\theta}_{1(B)} \right)$$

  $$\widehat{\theta}_{2 \hspace{0.05cm},\hspace{0.05cm} boot} = \left(\widehat{\theta}_{2(1)},...,\widehat{\theta}_{2(B)} \right)\\$$


\vspace{0.45cm}
 
 
Sea $\hspace{0.1cm}Q(\alpha \hspace{0.05cm} ,  \hspace{0.05cm} \widehat{\theta}_{1 \hspace{0.05cm},\hspace{0.05cm} boot} - \widehat{\theta}_{2 \hspace{0.05cm},\hspace{0.05cm} boot} )\hspace{0.1cm}$  el cuantil de orden $\hspace{0.1cm}\alpha\hspace{0.1cm}$ de la variable $\hspace{0.15cm} \widehat{\theta}_{1 \hspace{0.05cm},\hspace{0.05cm} boot} - \widehat{\theta}_{2 \hspace{0.05cm},\hspace{0.05cm} boot}\\$ 





Por tanto, se cumple lo siguiente: 


$$\dfrac{\# \hspace{0.15cm} \left\lbrace \hspace{0.1cm}  b = 1,...,B \hspace{0.25cm} / \hspace{0.25cm} \widehat{\theta}_{1(b)} - \widehat{\theta}_{2(b)} \hspace{0.05cm} \leq \hspace{0.05cm} Q(\alpha \hspace{0.05cm} , \hspace{0.05cm}  \widehat{\theta}_{1 \hspace{0.05cm},\hspace{0.05cm} boot} - \widehat{\theta}_{2 \hspace{0.05cm},\hspace{0.05cm} boot}) \hspace{0.1cm}  \right\rbrace \hspace{0.1cm} }{B}  \hspace{0.15cm} = \hspace{0.15cm} \alpha \\$$
    
    
\vspace{0.35cm}

- El intervalo cuantil-bootstrap para la diferencia de parametros $\hspace{0.1cm}\theta_1 - \theta_2\hspace{0.1cm}$ a un nivel $\hspace{0.1cm} 1-\alpha \hspace{0.1cm}$ es : 

\vspace{-0.3cm}

$$IC(\theta_1 - \theta_2 )_{1-\alpha}^{boot} \hspace{0.1cm} = \hspace{0.1cm} \left[ \hspace{0.1cm} Q(\alpha/2 \hspace{0.1cm} , \hspace{0.1cm}  \widehat{\theta}_{1 \hspace{0.05cm},\hspace{0.05cm} boot} - \widehat{\theta}_{2 \hspace{0.05cm},\hspace{0.05cm} boot}) \hspace{0.2cm} ;  \hspace{0.2cm} Q(1-\alpha/2 \hspace{0.1cm} , \hspace{0.1cm}  \widehat{\theta}_{1 \hspace{0.05cm},\hspace{0.05cm} boot} - \widehat{\theta}_{2 \hspace{0.05cm},\hspace{0.05cm} boot}) \hspace{0.1cm} \right] \\$$


 

Los intervalos cuantil-bootstrap pueden conducir a estimaciones del intervalo de confianza algo erráticas cuando el estimador del parametro de interés es sesgado.

Se pueden considerar una versión mejorada del intervalo cuantil-bootstrap llamada BCa, abreviatura que procede de sesgo-corregido (bias-corrected) y acelerado (accelerated).


\newpage

## Intervalo BCa-bootstrap


En la determinación de los intervalos BCa-bootstrap juegan un rol central dos cantidades: $\hspace{0.15cm} \Rightarrow \hspace{0.15cm} \hat{z}_0\hspace{0.1cm}$ y $\hspace{0.1cm}\hat{a}$


$\hat{z}_0$ se introduce para corregir el sesgo del estimador $\hat{\theta}$

 \vspace{0.35cm}

$\hat{z}_0\hspace{0.1cm}$ se define como :


$$\hat{z}_0 \hspace{0.1cm}=\hspace{0.1cm} F^{-1}_{N(0,1)} \left(  \dfrac{\# \hspace{0.15cm} \left\lbrace \hspace{0.1cm}  b = 1,...,B \hspace{0.25cm} / \hspace{0.25cm} \widehat{\theta}_{(b)} \hspace{0.05cm} \leq \hspace{0.05cm}  \hat{\theta}(X) \hspace{0.1cm}  \right\rbrace \hspace{0.1cm} }{B}  \right) \\$$


\vspace{0.35cm}


Aclaremos esto un poco.


Si $\hspace{0.05cm}\rho\hspace{0.05cm}$ es la proporción de replicas bootstrap del estimador $\hat{\theta}_{(1)},...,\hat{\theta}_{(B)}$ que son menores o iguales que la estimacion $\hat{\theta}(X)$  , entonces:

 
$$\rho \hspace{0.1cm}=\hspace{0.1cm}  \dfrac{ \# \hspace{0.1cm} \left\lbrace \hspace{0.1cm}  b = 1,...,B \hspace{0.25cm} / \hspace{0.25cm} \widehat{\theta}_{(b)} \hspace{0.05cm} \leq \hspace{0.05cm}  \hat{\theta}(X) \hspace{0.1cm}  \right\rbrace \hspace{0.1cm} }{B}$$


\vspace{0.35cm}


Por tanto:

$$\hat{z}_0 \hspace{0.1cm}=\hspace{0.1cm} F^{-1}_{N(0,1)} ( \hspace{0.05cm}\rho\hspace{0.05cm} ) \hspace{0.15cm}\Rightarrow\hspace{0.15cm} F_{N(0,1)}(\hat{z}_0) \hspace{0.1cm}=\hspace{0.1cm} P\left( \hspace{0.1cm}N(0,1) \leq \hat{z}_0\hspace{0.1cm} \right) \hspace{0.1cm} =\hspace{0.1cm} \rho$$

\vspace{0.35cm}


En conclusión:

$\hat{z}_0\hspace{0.05cm}$ es el cuantil de orden $\hspace{0.05cm}\rho\hspace{0.05cm}$ de la distribucion $\hspace{0.05cm}N(0,1)\hspace{0.15cm}$ $\Rightarrow\hspace{0.15cm}$ $\hat{z}_0 \hspace{0.1cm} = \hspace{0.1cm} Q\left(\hspace{0.1cm}\rho \hspace{0.1cm},\hspace{0.1cm} N(0,1)\hspace{0.1cm}\right)$


 

\vspace{1cm}


La segunda cantidad, $\hspace{0.1cm}\hat{a}\hspace{0.1cm}$, denominada aceleración, corrige el caso en el que el error estandar del estimador del parámetro de interés $\hspace{0.1cm}s.e.(\hat{\theta})\hspace{0.1cm}$ no sea constante, y se define en términos de estimaciones Jacknife.

\vspace{0.35cm}

Recordemos el contexto Jacknife:

$\hspace{0.25cm}$ Se define $\hspace{0.1cm}X_{(r)}\hspace{0.1cm}$ como la muestra que contiene todos los valores de la muestra $\hspace{0.1cm}X=(x_1,...,x_n)\hspace{0.1cm}$ del la variable aleatoria de interés $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ excepto el valor $\hspace{0.1cm}x_{r}$

$\hspace{0.25cm}$ Es decir:

\vspace{-0.25cm}

$$X_{(r)} = (\hspace{0.05cm}x_{1}\hspace{0.05cm},\hspace{0.05cm} x_{2}\hspace{0.05cm},..,\hspace{0.05cm} x_{r-1}\hspace{0.05cm},\hspace{0.05cm}x_{r+1}\hspace{0.05cm} ,..,\hspace{0.05cm} x_{n}\hspace{0.05cm})$$  

$\hspace{0.35cm}$ para  $\hspace{0.2cm} r=1,...,n \\$

\vspace{0.35cm} 

Se define la replica $\hspace{0.1cm}r$-esima del estimador $\hspace{0.1cm}\widehat{\theta}\hspace{0.1cm}$ como:  

\vspace{-0.25cm}

$$\widehat{\theta}_{(r)} = \widehat{\theta}(X_{(r)})= \widehat{\theta}(\hspace{0.05cm}x_{1}\hspace{0.05cm},\hspace{0.05cm} x_{2}\hspace{0.05cm},..,\hspace{0.05cm} x_{r-1}\hspace{0.05cm},\hspace{0.05cm}x_{r+1}\hspace{0.05cm} ,..,\hspace{0.05cm} x_{n}\hspace{0.05cm})\\$$



\vspace{0.35cm}

Teniendo todo esto en cuenta, $\hspace{0.1cm}\hat{a}\hspace{0.1cm}$ se define como sigue:

$$\hat{a} \hspace{0.1cm} = \hspace{0.1cm} \dfrac{ \sum_{r=1}^n \left( \hspace{0.1cm} \hat{\theta}_{(\cdot)} - \hat{\theta}_{(r)}  \right)^3   }{ 6 \cdot \left[ \sum_{r=1}^n \left( \hspace{0.1cm} \hat{\theta}_{(\cdot)} - \hat{\theta}_{(r)}  \right)^2 \right]^{3/2}  }$$


donde:

 $$\hat{\theta}_{(\cdot)} = \frac{1}{n} \cdot \sum_{r=1}^n \hat{\theta}_{(r)} \\$$



\vspace{0.35cm}


El intervalo BCa-bootstrap de nivel $\hspace{0.1cm} 1-\alpha\hspace{0.1cm}$ es: 


$$\left[ \hspace{0.1cm}Q(\alpha_1 \hspace{0.1cm} ,\hspace{0.1cm}  \hat{\theta}_{boot})   \hspace{0.2cm}  ; \hspace{0.2cm}   Q(\alpha_2 \hspace{0.1cm} ,\hspace{0.1cm}  \hat{\theta}_{boot})  \hspace{0.1cm} \right] \\$$


donde:

- $\alpha_1 \hspace{0.1cm}=\hspace{0.1cm} F_{N(0,1)}\left( \hat{z}_0 + \dfrac{\hat{z}_0 + z_{1-\alpha/2} }{1 - \hat{a}\cdot(\hat{z}_0 + z_{1-\alpha/2} )} \right)\\$

- $\alpha_2 \hspace{0.1cm}=\hspace{0.1cm} F_{N(0,1)}\left( \hat{z}_0 + \dfrac{\hat{z}_0 + z_{\alpha/2} }{1 - \hat{a}\cdot(\hat{z}_0 + z_{\alpha/2} )} \right) \\$



- $z_{\alpha}$ el valor tal que $P(N(0,1) \leq z_{\alpha}) = \alpha\\$



- $\hat{a} \hspace{0.1cm} = \hspace{0.1cm} \dfrac{ \sum_{r=1}^n \left( \hspace{0.1cm} \hat{\theta}_{(\cdot)} - \hat{\theta}_{(r)}  \right)^3   }{ 6 \cdot \left[ \sum_{r=1}^n \left( \hspace{0.1cm} \hat{\theta}_{(\cdot)} - \hat{\theta}_{(r)}  \right)^2 \right]^{3/2}  } \\$

- $\hat{z}_0  \hspace{0.1cm} = \hspace{0.1cm} Q\left(\hspace{0.1cm}\rho \hspace{0.1cm},\hspace{0.1cm} N(0,1)\hspace{0.1cm}\right) \\$

- $\rho \hspace{0.1cm}=\hspace{0.1cm}  \dfrac{ \# \hspace{0.1cm} \left\lbrace \hspace{0.1cm}  b = 1,...,B \hspace{0.25cm} / \hspace{0.25cm} \widehat{\theta}_{(b)} \hspace{0.05cm} \leq \hspace{0.05cm}  \hat{\theta}(X) \hspace{0.1cm}  \right\rbrace \hspace{0.1cm} }{B} \\$




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
    
    
    
    
\vspace{0.5cm}





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

#################################################################

    if estimator_function == np.quantile:  estimation = estimator_function(Variable, q=q)

    else :  estimation = estimator_function(Variable)

    replicas_boot_estimador = []

    for b in range(0, B):

        replicas_boot_estimador.append( np.mean( Bootstrap_sample(Variable) ) )


    replicas_boot_estimador = np.array(replicas_boot_estimador)


    rho = sum( replicas_boot_estimador <= estimation ) / B

    z_0 = scipy.stats.norm.ppf(q=rho, loc=0, scale=1)

#################################################################

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


#################################################################

    L1 = np.quantile( replicas_boot_estimador  , q=alpha_1)

    L2 = np.quantile( replicas_boot_estimador  , q=alpha_2)

    interval = [L1,L2]

    return interval , estimation
```
\vspace{0.25cm}


**Intervalo para la media:**

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

\vspace{0.25cm}

**Intervalo para la mediana:**

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

\vspace{0.25cm}

**Intervalo para la desviación típica:**

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
    
    
Como puede verse el intervalo no incluye a la estimación. Es posible que haya algún defecto en la función programada.

\vspace{0.25cm}


**Intervalo para los cuantiles:**

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


\vspace{0.25cm}


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
    
    
Como puede verse el intervalo no incluye a la estimación. Es posible que haya algún defecto en la función programada.

    
\vspace{0.25cm}

**Intervalo para la asimetría:**

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
    
Como puede verse el intervalo no incluye a la estimación. Es posible que haya algún defecto en la función programada.


\vspace{0.25cm}

**Intervalo para la curtosis:**

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

Como puede verse el intervalo no incluye a la estimación. Es posible que haya algún defecto en la función programada.  
  
  
    
    
    

\newpage




# Contrastes de hipótesis basados en bootstrap

Existen múltiples aproximaciones a los contrastes de hipótesis desde una perspectiva bootstrap. En este caso nos aproximaremos usando los intervalos cuantil-bootstrap, por simplicidad.

Vamos a diferenciar contrastes de hipótesis sobre una población y sobre dos poblaciones.




## Contraste de hipótesis sobre una población


Tenemos una v.a. $\mathcal{X}\sim D(\theta)$ , una m.a.s. $(\mathcal{X}_1,...,\mathcal{X}_n)$ de $\mathcal{X}$ y un estimador $\widehat{\theta}(\mathcal{X}_1,...,\mathcal{X}_n)$ del parámetro $\theta$


Además tenemos una muestra de observaciones $X=(x_1,...,x_n)$   de la variable de interés $\mathcal{X}$ , por lo que tenemos la estimación $\widehat{\theta}(X)=\widehat{\theta}(x_1,...,x_n)$ del parámetro $\theta$. 


Se quieren resolver los siguientes contrastes:  

$$
H_0: \theta = \theta_0  \hspace{0.5cm} H_0: \theta = \theta_0  \hspace{0.5cm}  H_0: \theta = \theta_0$$
\vspace{-0.25cm}
$$H_1: \theta \neq \theta_0 \hspace{0.5cm}  H_1: \theta < \theta_0  \hspace{0.5cm}   H_1: \theta > \theta_0
$$

\vspace{0.3cm}

La regla de decisión  para resolver estos contrastes  basada en los intervalos cuantil-bootstrap  es la siguiente:

Para un nivel de significación $\alpha$, partimos del intervalo cuantil-bootstrap del parametro $\theta$ para un nivel de confianza $1 -\alpha$ $\hspace{0.15cm}\Rightarrow\hspace{0.15cm}$ $IC(\theta )_{1-\alpha}^{boot} = [ L1 , L2]$ 


- Caso $H_0: \theta = \theta_0 \hspace{0.25cm} \text{vs} \hspace{0.25cm} H_1: \theta \neq \theta_0$

    $$\text{Rechazar} \hspace{0.12cm} H_0  \hspace{0.25cm}  \Leftrightarrow \hspace{0.25cm} \theta_0 \notin IC(\theta )_{1-\alpha}^{boot}$$
    
    
    
\vspace{0.2cm}



- Caso $H_0: \theta = \theta_0 \hspace{0.25cm} \text{vs} \hspace{0.25cm} H_1: \theta < \theta_0$

    $$\text{Rechazar} \hspace{0.12cm} H_0  \hspace{0.25cm}  \Leftrightarrow \hspace{0.25cm} IC(\theta )_{1-\alpha}^{boot} \hspace{0.1 cm}<<\hspace{0.1 cm} \theta_0  \hspace{0.25cm}  \Leftrightarrow \hspace{0.25cm}  L2 \hspace{0.1 cm}<\hspace{0.1 cm} \theta_0$$
    


\vspace{0.2cm}



- Caso $H_0: \theta = \theta_0 \hspace{0.25cm} \text{vs} \hspace{0.25cm} H_1: \theta > \theta_0$

    $$\text{Rechazar} \hspace{0.12cm} H_0  \hspace{0.25cm}  \Leftrightarrow \hspace{0.25cm} IC(\theta )_{1-\alpha}^{boot} \hspace{0.1 cm}>>\hspace{0.1 cm} \theta_0  \hspace{0.25cm}  \Leftrightarrow \hspace{0.25cm}  L1 \hspace{0.1 cm} > \hspace{0.1 cm} \theta_0$$


 
\newpage

 

## Contraste de hipótesis sobre dos poblaciones




Tenemos dos v.a's $\mathcal{X}_1\sim D_1(\theta_1)$ y $\mathcal{X}_2\sim D_2(\theta_2)$ , una m.a.s. $(\mathcal{X}_{11},...,\mathcal{X}_{n_1 1})$ de $\mathcal{X}_1$ , otra  m.a.s. $(\mathcal{X}_{12},...,\mathcal{X}_{n_2 2})$ de $\mathcal{X}_2$ y un par de estimadores $\widehat{\theta}_1(\mathcal{X}_{11},...,\mathcal{X}_{n_1 1})$ y $\widehat{\theta}_2(\mathcal{X}_{12},...,\mathcal{X}_{n_2 2})$ de los parámetros $\theta_1$ y  $\theta_2$, respectivamente.


Además tenemos una muestras de observaciones $X_1=(x_{11},...,x_{n_1 1})$   de la v.a.  $\mathcal{X}_1$ y otra $X_1=(x_{11},...,x_{n_1 1})$  de  $\mathcal{X}_2$, por lo que tenemos las estimaciones $\widehat{\theta}_1(X_1)=\widehat{\theta}_1(x_{1 1},...,x_{n_1 1})$ de los parámetros $\theta_1$ y  $\theta_2$ , respectivamente.





Se quieren resolver los siguientes contrastes: 

$$
H_0: \theta_1 = \theta_2  \hspace{0.5cm} H_0: \theta_1 = \theta_2  \hspace{0.5cm}  H_0: \theta_1 = \theta_2$$
\vspace{-0.2cm}
$$H_1: \theta_1 \neq \theta_2 \hspace{0.5cm}  H_1: \theta_1 < \theta_2  \hspace{0.5cm}   H_1: \theta_1 > \theta_2
$$

\vspace{0.35cm}


La regla de decisión  para resolver estos contrastes  basada en los intervalos cuantil-bootstrap  es la siguiente:

Para un nivel de significación $\alpha$.

Partimos del intervalo cuantil-bootstrap de la diferencia de parámetros $\theta_1 - \theta_2$ para un nivel de confianza $1 -\alpha$ $\hspace{0.15cm}\Rightarrow\hspace{0.15cm}$ $IC(\theta_1 - \theta_2 )_{1-\alpha}^{boot} = [ L1 , L2]$ 


- Caso $H_0: \theta_1 = \theta_2 \hspace{0.25cm} \text{vs} \hspace{0.25cm} H_1: \theta_1 \neq \theta_2$

    $$\text{Rechazar} \hspace{0.12cm} H_0  \hspace{0.25cm}  \Leftrightarrow \hspace{0.25cm} 0 \notin IC(\theta_1 - \theta_2 )_{1-\alpha}^{boot}$$
    
\vspace{0.2cm}


- Caso $H_0: \theta_1 = \theta_2 \hspace{0.25cm} \text{vs} \hspace{0.25cm} H_1: \theta_1 < \theta_2$

    $$\text{Rechazar} \hspace{0.12cm} H_0  \hspace{0.25cm}  \Leftrightarrow \hspace{0.25cm} IC(\theta_1 - \theta_2 )_{1-\alpha}^{boot} \hspace{0.1 cm}<<\hspace{0.1 cm} 0 \hspace{0.25cm}  \Leftrightarrow \hspace{0.25cm}  L2 \hspace{0.1 cm}<\hspace{0.1 cm} 0$$

\vspace{0.2cm}

- Caso $H_0: \theta_1 = \theta_2 \hspace{0.25cm} \text{vs} \hspace{0.25cm} H_1: \theta_1 > \theta_2$

    $$\text{Rechazar} \hspace{0.12cm} H_0  \hspace{0.25cm}  \Leftrightarrow \hspace{0.25cm} IC(\theta_1 - \theta_2 )_{1-\alpha}^{boot} \hspace{0.1 cm}>>\hspace{0.1 cm} 0 \hspace{0.25cm}  \Leftrightarrow \hspace{0.25cm}  L1 \hspace{0.1 cm} > \hspace{0.1 cm} 0$$



\newpage



## Contrastes de hipotesis bootstrap en `Python`



```python
def bootstrap_cuantil_test(Variable1, Variable2, estimator, H1_type, theta_0,  alpha , B, random_seed, q):


    interval , estimation = cuantil_boot_interval(Variable1=Variable1, Variable2=Variable2, alpha=alpha, estimator=estimator , B=B, random_seed=random_seed, q=q)

    
    if estimator in ['mean','median','std','quantile','kurtosis',
    
    'skewness','proportion']:


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

\vspace{0.35cm}



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


\newpage


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





\newpage

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

\vspace{0.3cm}

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

import sklearn

from sklearn.linear_model import LinearRegression
```



```python
Data = pd.read_csv('House_Price_Regression.csv')

Data = Data.loc[:, ['latitude', 'longitude', 'price', 'size_in_m_2','no_of_bedrooms', 'no_of_bathrooms', 'quality_recode']]

Data['quality_recode'] = Data['quality_recode'].astype('category')

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
X = Data[['size_in_m_2', 'longitude', 'latitude', 'no_of_bedrooms', 'no_of_bathrooms', 'quality_recode']]
Y = Data['price']
```
 

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


\vspace{0.5cm}

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

\newpage


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

\vspace{0.5cm}


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

\vspace{-0.4cm}

$$\dfrac{1}{h} \sum_{i=1}^{h} \widehat{Var}(\hat{y}_i)$$ 

Cálculo de $\widehat{Var}(\hat{y}_i)$ por remuestreo (en algunos modelos no habra expresiones cerradas para este estimacion, por eso veo interesante un procedimiento general que no dependa del modelo usado):

Tenemos una muestra inicial de predictores y de la respuesta $(X,Y)=(X_1,...,X_p, Y)$ con $n$ filas (observaciones)

Tomamos $B$ muestras bootstrap (muestras aleatorias con reemplazamiento) de $(X,Y)$:

\vspace{-0.4cm}

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

\vspace{-0.4cm}

$$\dfrac{1}{h} \sum_{i=1}^{h} \widehat{Var}(\hat{y}_i)$$  


\newpage


# Estimación bootstrap del sesgo de las predicciones de un modelo de aprendizaje supervisado

Consideraremos que una estimacion del sesgo de las predicciones de un modelo de regresion (variable respuesta cuantitativa) $M$ es:

\vspace{-0.4cm}

$$\dfrac{1}{h} \sum_{i=1}^{h} \widehat{Sesgo}(\hat{y}_i)$$ 


Cálculo de $\widehat{Sesgo}(\hat{y}_i)$ por remuestreo (en algunos modelos no habra expresiones cerradas para este estimacion, por eso veo interesante un procedimiento general que no dependa del modelo usado):

Tenemos una muestra inicial de predictores y de la respuesta $(X,Y)=(X_1,...,X_p, Y)$ con $n$ filas (observaciones)

Tomamos $B$ muestras bootstrap (muestras aleatorias con reemplazamiento) de $(X,Y)$:

\vspace{-0.4cm}

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

\vspace{-0.4cm}
$$\widehat{Sesgo}(\hat{y}_i) = \left( \dfrac{1}{h} \sum_{r=1}^{B}  \hat{y}_{ir}^{test}    \right)- y_i^{test}$$

Repetimos el proceso con cada $i=1,...,h$, donde $h$ es el tamaño de la muestra de test.

Asi obtenderemos: $\hspace{0.2cm} \widehat{Sesgo}(\hat{y}_1),\widehat{Sesgo}(\hat{y}_2),..., \widehat{Sesgo}(\hat{y}_h)$

Promediamos y obtenimos asi una estimacion de la varianza de las predcciones del modelo:

\vspace{-0.4cm}
$$ \dfrac{1}{h} \sum_{i=1}^{h} \widehat{Sesgo}(\hat{y}_i) $$  



\newpage


# Tareas parte 1


## Ejercicio 1

Supongamos que tienes una muestra de tamaño 25 que ha sido obtenida cuando ejecutas:
```{r, eval=FALSE}
rpois(25,10)
```
Utiliza el jackknife para estimar el error de muestreo y el sesgo de la estimación de:

1. La varianza muestral.
2. La media recortada (trimmed) al 20%.
3. La mediana.


\vspace{0.3cm}


**Varianza muestral:**

**Forma 1:**

```python
set.seed(100428853) # Semilla para reproductibilidad de este ejercicio

numero_observaciones<-25 # numero observaciones 

n<-1:numero_observaciones # Secuencia del 1 a número de observaciones

muestra<-rpois(25,10) # Creación de muestra

data<-data.frame(n,muestra) # Creación data.frame con el vector n y la muestra de la poisson

theta_gorro<-var(muestra) # Varianza muestral (estadístico de interés)

library(ggplot2)
library(ggthemes)

ggplot(data, aes(x=n,y=muestra))+
  geom_point(colour = 4, show.legend = FALSE)+
  theme_stata()+
  ggtitle("Gráfico dispersión de la muestra poisson") # Gráfico de dispersión de los datos.

jackknife<-sapply(n, function(i) with(data[-i,], var(muestra))) # Aplicación del jackknife
jackknife

(Sesgo_jack<-(numero_observaciones-1)*(mean(jackknife)-theta_gorro)) # Sesgo de la estimación con jackknife

Error_muestreo <- sqrt((numero_observaciones-1)*mean((jackknife - mean(jackknife))^2)) # Error de muestreo

Error_muestreo 
```


    
![Gráfico de dispersión de la muestra poisson](p1.png)
    

\vspace{0.35cm}


```python
cat("Se puede ver como tenemos un sesgo de:",Sesgo_jack," y un error de muestreo de:",Error_muestreo)
```

Se puede ver como tenemos un sesgo de: 0  y un error de muestreo de: 2.547805


\vspace{0.3cm}

**Forma 2:**

```python
theta_jackknife=numeric(numero_observaciones) # theta va a ser númerico

for(i in 1:numero_observaciones){
  theta_jackknife[i] = var(muestra[-i]) # Bucle que nos calcula las varianzas muestrales en cada muestra jackknife
}

(Sesgo_jack=(numero_observaciones-1)*(mean(theta_jackknife)-theta_gorro)) # Calculamos el sesgo

Error_muestreo <- sqrt((numero_observaciones-1)*mean((theta_jackknife - mean(theta_jackknife))^2)) # Calculamos el error de muestreo

Error_muestreo
```


```python
cat("Como era de esperar, sale un sesgo de:",Sesgo_jack," y un error de muestreo de:",Error_muestreo)
```

Como era de esperar, sale un sesgo de: 0  y un error de muestreo de: 2.547805


\newpage

**Forma 3:**


```python
library(bootstrap) # Cargamos librería

numero_observaciones<-25 # Numero observaciones

data<-as.matrix(cbind(n,muestra)) # Matriz de datos

theta<-var(muestra) # Varianza de muestra

fun_aux = function(nmuestra,data){
  var(data[nmuestra,2]) #función auxiliar
}

jack = jackknife(1:numero_observaciones,fun_aux,data) # jackknife

jack

Estadis_correg_bias = theta - jack$jack.bias # Estadístico corregido por el sesgo

Estadis_correg_bias
```

```python
cat("El error de muestreo es: ",jack$jack.se,", el sesgo es: ",jack$jack.bias," y el estadístico corregido por el sesgo es:",Estadis_correg_bias, "que es igual a la media de los valores jackknife al ser el sesgo igual a 0 (en este caso).")
```

El error de muestreo es:  2.547805 , el sesgo es:  0  y el estadístico corregido por el sesgo es: 10.47667 que es igual a la media de los valores jackknife al ser el sesgo igual a 0 (en este caso).



\newpage


**Media recortada:**

**Forma 1:**

```python
set.seed(100428853) # Semilla para reproductibilidad de este ejercicio

numero_observaciones<-25 # numero observaciones 

n<-1:numero_observaciones # Secuencia del 1 a número de observaciones

muestra<-rpois(25,10) # Creación de muestra

data<-data.frame(n,muestra) # Creación data.frame con el vector n y la muestra de la poisson

theta_gorro<-mean(muestra, trim = 0.2) # Media recortada al 20% (estadístico de interés)

jackknife<-sapply(n, function(i) with(data[-i,], mean(muestra, trim = 0.2))) # Aplicación del jackknife

jackknife

(Sesgo_jack<-(numero_observaciones-1)*(mean(jackknife)-theta_gorro)) # Sesgo de la estimación con jackknife

Error_muestreo <- sqrt((numero_observaciones-1)*mean((jackknife - mean(jackknife))^2)) # Error de muestreo

Error_muestreo
```


```python
cat("Se puede ver como tenemos un sesgo de:",Sesgo_jack," y un error de muestreo de:",Error_muestreo)
```

Se puede ver como tenemos un sesgo de: 0.56  y un error de muestreo de: 0.7931582


\newpage

**Forma 2:**

```python
theta_jackknife=numeric(numero_observaciones) # theta va a ser númerico
for(i in 1:numero_observaciones){
  theta_jackknife[i] = mean(muestra[-i],trim = 0.2) # Bucle que nos calcula las medias recortadas en cada muestra jackknife
}

(Sesgo_jack=(numero_observaciones-1)*(mean(theta_jackknife)-theta_gorro)) # Calculamos el sesgo

Error_muestreo <- sqrt((numero_observaciones-1)*mean((theta_jackknife - mean(theta_jackknife))^2)) # Calculamos el error de muestreo

Error_muestreo
```

```python
cat("Como era de esperar, sale un sesgo de:",Sesgo_jack," y un error de muestreo de:",Error_muestreo)
```

Como era de esperar, sale un sesgo de: 0.56  y un error de muestreo de: 0.7931582



\vspace{0.34cm}

**Forma 3.**


```python
library(bootstrap) # Cargamos librería

numero_observaciones<-25 # Numero observaciones

data<-as.matrix(cbind(n,muestra)) # Matriz de datos

theta<-mean(muestra, trim = 0.2) # Media recortada

fun_aux = function(nmuestra,data){
  mean(data[nmuestra,2],trim=0.2) #función auxiliar
}

jack = jackknife(1:numero_observaciones,fun_aux,data) # jackknife

jack

Estadis_correg_bias = theta - jack$jack.bias # Estadístico corregido por el sesgo

Estadis_correg_bias
```

```python
cat("El error de muestreo es: ",jack$jack.se,", el sesgo es: ",jack$jack.bias," y el estadístico corregido por el sesgo es:",Estadis_correg_bias)
```

El error de muestreo es:  0.7931582 , el sesgo es:  0.56  y el estadístico corregido por el sesgo es: 9.706667





\newpage

**Mediana:**

**Forma 1:**


```python
set.seed(100428853) # Semilla para reproductibilidad de este ejercicio
numero_observaciones<-25 # numero observaciones 

n<-1:numero_observaciones # Secuencia del 1 a número de observaciones

muestra<-rpois(25,10) # Creación de muestra

data<-data.frame(n,muestra) # Creación data.frame con el vector n y la muestra de la poisson

theta_gorro<-median(muestra) # Mediana (estadístico de interés)

jackknife<-sapply(n, function(i) with(data[-i,], median(muestra))) # Aplicación del jackknife

jackknife

(Sesgo_jack<-(numero_observaciones-1)*(mean(jackknife)-theta_gorro)) # Sesgo de la estimación con jackknife

Error_muestreo <- sqrt((numero_observaciones-1)*mean((jackknife - mean(jackknife))^2)) # Error de muestreo

Error_muestreo 
```

```python
cat("Se puede ver como tenemos un sesgo de:",Sesgo_jack," y un error de muestreo de:",Error_muestreo)
```

Se puede ver como tenemos un sesgo de: 6.24  y un error de muestreo de: 1.223765







\vspace{0.5cm}


**Forma 2.**

```python
theta_jackknife=numeric(numero_observaciones) # theta va a ser númerico
for(i in 1:numero_observaciones){
  theta_jackknife[i] = median(muestra[-i]) # Bucle que nos calcula las medianas en cada muestra jackknife
}

(Sesgo_jack=(numero_observaciones-1)*(mean(theta_jackknife)-theta_gorro)) # Calculamos el sesgo

Error_muestreo <- sqrt((numero_observaciones-1)*mean((theta_jackknife - mean(theta_jackknife))^2)) # Calculamos el error de muestreo

Error_muestreo
```

```python
cat("Como era de esperar, sale un sesgo de:",Sesgo_jack," y un error de muestreo de:",Error_muestreo)
```

Como era de esperar, sale un sesgo de: 6.24  y un error de muestreo de: 1.223765





\vspace{0.4cm}

**Forma 3.**

```python
library(bootstrap) # Cargamos librería

numero_observaciones<-25 # Numero observaciones

data<-as.matrix(cbind(n,muestra)) # Matriz de datos

theta<-median(muestra) # Mediana

fun_aux = function(nmuestra,data){
  median(data[nmuestra,2]) #función auxiliar
}

jack = jackknife(1:numero_observaciones,fun_aux,data) # jackknife

jack

Estadis_correg_bias = theta - jack$jack.bias # Estadístico corregido por el sesgo

Estadis_correg_bias
```



```python
cat("El error de muestreo es: ",jack$jack.se,", el sesgo es: ",jack$jack.bias," y el estadístico corregido por el sesgo es:",Estadis_correg_bias)
```
El error de muestreo es:  1.223765 , el sesgo es:  6.24  y el estadístico corregido por el sesgo es: 3.76


\newpage


## Ejercicio 2.

Se consideran dos variables: en la primera se recogen 4 tipos diferentes de tratamientos y en la segunda se recogen los valores obtenidos de productividad.
Los datos simulados son:


```python
set.seed(100428853)

grupos = c(rep("A",6), rep("B",6), rep("C",6), rep("D",6))

invento = c(rgamma(6,8,2),rgamma(6,7.5,2),rgamma(6,10,3),rgamma(6,4,1.5))

misdatos = data.frame(tratamiento=grupos, productividad=invento)

misdatos
```

Estudia si el factor tratamiento es significativo mediante dos procedimientos ANOVA: uno por permutaciones y otro mediante ANOVA estándar. Compara y explica los resultados y cuáles son las condiciones que han de cumplirse en ambos casos.
Haz un estudio post-hoc de los tratamientos por parejas de niveles del factor, tanto con el modelo clásico como en el de permutaciones. Compara y explica los resultados.

\vspace{0.3cm}


```python
set.seed(100428853)
grupos = c(rep("A",6), rep("B",6), rep("C",6), rep("D",6))
invento = c(rgamma(6,8,2),rgamma(6,7.5,2),rgamma(6,10,3),rgamma(6,4,1.5))
misdatos = data.frame(tratamiento=grupos, productividad=invento)
knitr::kable(head(misdatos))
```
```
tratamiento	    productividad
    A	             3.891097
    A	             3.508428
    A	             2.969455
    A	             5.837342
    A	             4.178984
    A              5.942017
```



\newpage


**ANOVA tradicional**


```python
misdatos$tratamiento<-as.factor(misdatos$tratamiento) # Convertir a factor

ANOVA<-aov(productividad~tratamiento,data=misdatos) # ANOVA

summary(ANOVA) # Resumen del anova

library(gplots)

plotmeans(productividad ~ tratamiento, data= misdatos,xlab="tratamiento", ylab="productividad",main="Mean Plot\nwith 95% CI") # Gráfico de las medias con intervalo de confianza al 95%

TukeyHSD(ANOVA) # Test de Tukey HSD

plot(TukeyHSD(ANOVA)) # Gráfico de las diferencias entre grupos

pairwise.t.test(misdatos$productividad, misdatos$tratamiento, p.adjust.method = "bonferroni") # Análisis post-hoc Bonferroni.
```

![](p2.png)


![](p3.png)


\vspace{0.4cm}

```
            Df Sum Sq Mean Sq F value Pr(>F)
tratamiento  3   8.97   2.990   1.641  0.212
Residuals   20  36.44   1.822               
  Tukey multiple comparisons of means
    95% family-wise confidence level

Fit: aov(formula = productividad ~ tratamiento, data = misdatos)

$tratamiento
          diff       lwr       upr     p adj
B-A -1.1305813 -3.311771 1.0506087 0.4841387
C-A -0.4138374 -2.595027 1.7673525 0.9504948
D-A -1.5735024 -3.754692 0.6076876 0.2143195
C-B  0.7167438 -1.464446 2.8979338 0.7946766
D-B -0.4429212 -2.624111 1.7382688 0.9403282
D-C -1.1596650 -3.340855 1.0215250 0.4627329


	Pairwise comparisons using t tests with pooled SD 

data:  misdatos$productividad and misdatos$tratamiento 

  A    B    C   
B 0.97 -    -   
C 1.00 1.00 -   
D 0.34 1.00 0.91

P value adjustment method: bonferroni 
```

\newpage

A la vista de los resultados anteriores, podemos ver que los tratamientos no son significativos, es decir, el tratamiento no influye en la productividad.
Recordatorio: Lo que estamos contrastando en el ANOVA es:

$$H_{0}:\mu_{A}=\mu_{B}=\mu_{C}=\mu_{D}$$


Además vistos los gráficos no parece haber diferencias entre los grupos, y lo comprobamos con los test de Tukey y Bonferroni que nos arrojan los mismos resultados, es decir, técnicamente, no podemos rechazar la hipótesis nula de igualdad de medias, por lo que estadísticamente, las medias de los 4 grupos son iguales.


Comprobación de supuestos:

Los supuestos que deben cumplirse son:

1. Normalidad. Cada muestra se extrajo de una población distribuida normalmente.

2. Varianzas iguales. Las varianzas de las poblaciones de las que provienen las muestras son iguales.

3. Independencia, las observaciones de cada grupo son independientes entre sí y las observaciones dentro de los grupos se obtuvieron mediante una muestra aleatoria.


**Normalidad:**


```python
# Histograma de la productividad
ggplot(misdatos,aes(x=productividad, fill = 4))+
  geom_histogram(bins = 5, show.legend = FALSE, colour="black")+
  theme_stata()+
  ggtitle("Histograma de la productividad")
# Densidades de la productividad por grupos
library(ggridges)
ggplot(misdatos, aes(x = productividad, y = tratamiento, fill = stat(x))) +
  geom_density_ridges_gradient() +
  scale_fill_viridis_c(name = "productividad", option = "C")+
  theme_stata()+
  ggtitle("Densidades de la productividad por grupo")
# Grafico QQ.
resid<-data.frame(residuos=as.vector(ANOVA$residuals))
ggplot(resid, aes(sample = residuos,)) +geom_qq(colour="blue")+ 
  stat_qq_line(colour="black")+
  ggtitle("Gráfico QQ de los residuos")+
  theme_stata()
# Test de shapiro-wilk para los residuos
shapiro.test(ANOVA$residuals)
# Test de Kolmogorov-Smirnov-Lilliefors
library(nortest)
lillie.test(ANOVA$residuals)
# Test de Jarque-Bera
library(tseries)
jarque.bera.test(ANOVA$residuals)
```


![](p4.png)


![](p5.png)


![](p6.png)

```python
	Shapiro-Wilk normality test

data:  ANOVA$residuals
W = 0.93474, p-value = 0.1245


	Lilliefors (Kolmogorov-Smirnov) normality test

data:  ANOVA$residuals
D = 0.18459, p-value = 0.0337


	Jarque Bera Test

data:  ANOVA$residuals
X-squared = 2.4272, df = 2, p-value = 0.2971
```

Podemos decir que se cumple el supuesto de normalidad necesario para aplicar el ANOVA. Salvo en el Lilliefors que no se cumple, los residuos son normales.


\newpage


**Homocedasticidad**

```python
# Boxplot por grupos
ggplot(misdatos,aes(x=tratamiento,y=productividad,fill=tratamiento))+
  stat_boxplot(geom = "errorbar",width = 0.15)+
  geom_boxplot()+
  geom_jitter(position = position_jitter(0.2))+
  stat_summary(fun = "mean", geom = "point", shape = 8,size = 2, color = "white")+ 
  theme_stata()+
  ggtitle("Boxplot de productividad por grupos según tratamiento")
# Test de Bartlett
bartlett.test(productividad~tratamiento,data = misdatos)
```


![](p7.png)


```python
Bartlett test of homogeneity of variances

data:  productividad by tratamiento
Bartlett's K-squared = 1.1431, df = 3, p-value = 0.7667
```

No podemos rechazar la hipótesis nula de igualdad varianzas en los grupos. Por lo tanto se cumple el segundo de los supuestos necesarios para la validez del ANOVA tradicional. Es decir, las varianzas de los grupos son estadísticamente iguales.


\vspace{0.3cm}


**Independencia.**

Viendo que son datos aleatorios podemos concluir que sí son independientes, por lo que los tres supuestos se cumplen y el análisis es válido.

\newpage

**ANOVA con permutaciones**

En estadística, la prueba de Kruskal-Wallis es un método no paramétrico para probar si un grupo de datos proviene de la misma población. Intuitivamente, es idéntico al ANOVA con los datos reemplazados por categorías. Es una extensión de la prueba de la U de Mann-Whitney para 3 o más grupos.

Ya que es una prueba no paramétrica, la prueba de Kruskal-Wallis no asume normalidad en los datos, en oposición al tradicional ANOVA. Sí asume, bajo la hipótesis nula, que los datos vienen de la misma distribución. Una forma común en que se viola este supuesto es con datos heterocedásticos.

```python
# Número posible de permutaciones
choose(24,6)
library(coin)
# Anova no parámetrico.
kruskal_test(productividad ~ as.factor(tratamiento), data = misdatos, distribution=approximate(nresample = 1000))
# Post-hoc 1
pairwise.wilcox.test(misdatos$productividad, misdatos$tratamiento, p.adjust.method = "bonferroni")
# Post-hoc2
library(FSA)
dunnTest(productividad ~ as.factor(tratamiento), data = misdatos, method="bonferroni")
```



```python
Comparison        Z         P.unadj      P.adj     
 A - B     	  1.6329932	  0.10247043	 0.6148226	
 A - C     	  0.6123724  	0.54029137	 1.0000000	
 B - C	      1.0206207  	0.30743417	 1.0000000	
 A - D	      2.0004166	  0.04545529   0.2727318	
 B - D	      0.3674235	  0.71330317	 1.0000000	
 C - D	      1.3880442	  0.16512359	 0.9907415	
```


Como dijimos antes, no es necesario la normalidad en este test, pero sí que habría que ver si son las varianzas iguales, pero como ya se hizo en el apartado anterior, podemos ver que las varianzas entre los grupos son iguales. Por lo tanto llegamos a que este test también es válido para este problema. Como la evidencia de que las medias de los grupos son iguales es muy fuerte, tanto con el test de wilcox y como con el de dunn, nos sale lo mismo.


\vspace{0.3cm}

```python
# Tabla de resultados del ejercicio
Resultado_final<-data.frame(SIG=c("No","No"), DIF=c("No","No"), NOR=c("Si","No necesario"), VAR=c("Si","Si"), IND=c("Si","Si"))
colnames(Resultado_final)<-c("Significatividad tratamiento","Diferencia entre grupos","Normalidad","Homocedasticidad","Independencia")
rownames(Resultado_final)<-c("ANOVA tradicional","ANOVA no paramétrico")
knitr::kable(Resultado_final)
```


![](p8.png)
 

Por lo tanto podemos concluir este ejercicio diciendo que en este caso, nos da igual utilizar uno u otro.


\vspace{0.3cm}

## Ejercicio 3

Simula una muestra aleatoria simple de 100 de una v.a. X con distribución gamma de parámetros a = 10, b = 5.

1. Calcula la asimetría muestral de la muestra y el error estándar del estimador, mediante un bootstrap.

2. Calcula el coeficiente de variación muestral de la muestra y el error estÃ¡ndar del estimador, mediante un procedimiento bootstrap.

3. Programa ambos procedimientos mediante un programa escrito en Rcpp.

```python
set.seed(100428853) # Semilla
Datos<-rgamma(100,10,5) # Creación de datos
B=2000 # Número de réplicas
```

\vspace{0.3cm}

**Asimetría**

**Forma 1**

```python
# Función para la asimetría
moment_skewness <- function(x) {
  n <- length(x)
  mean_x <- mean(x)
  sd_x <- sd(x)
  z <- (x - mean_x) / sd_x
  mean(z^3)
}

moment_skewness(Datos) # Asimetría muestral
sd(replicate(B,moment_skewness(sample(Datos,replace = TRUE)))) # Error estándar bootstrap
```


    [1] 0.4573946

    [1] 0.1853091
    
    
\vspace{0.3cm}    
    
**Forma 2**

```python
library(moments)
skewness(Datos) # Asimetría muestral
sd(replicate(B,skewness(sample(Datos,replace=TRUE)))) # Error estándar bootstrap
```

    [1] 0.4643423
    
    [1] 0.186493


\vspace{0.3cm}      

**Forma 3.**
 
```python
library(bootstrap)
bootskew<-bootstrap(Datos,B,skewness) # Aplicación bootstrap
sd(bootskew$thetastar) # Error estándar bootstrap
```

   
    [1]  0.1828968


\vspace{0.3cm}

**Forma 4.**

```python
# Aplicación bootstrap con librería boot
library(boot)
n=length(Datos)
# Función auxiliar
funskew = function(data, i, n){
  cosa = data[i]
  skewness(cosa[1:n])
}

resultado = boot(Datos, funskew, R=2000, n=n)
resultado
```

```
ORDINARY NONPARAMETRIC BOOTSTRAP


Call:
boot(data = Datos, statistic = funskew, R = 2000, n = n)


Bootstrap Statistics :
     original      bias    std. error
t1* 0.4643423 -0.01547586   0.1847539
```

Aunque los resultados no son exactamente iguales en todas las formas, lo cierto es que la asimetría muestral está en torno a 0.46 y su error sobre 0.19.


\newpage

```python
plot(resultado, t0=resultado$t0, nclass = 10) # Plot réplicas bootstrap
```

![](p9.png)

Podemos ver como el histograma de las réplicas bootstrap es bastante simétrico en torno al valor muestral original y podemos ver que además estas réplicas son normales ya que se ajustan muy bien al qqplot salvo en las colas.


\vspace{0.3cm}


**Coeficiente de variación**

**Forma 1**


```python
set.seed(100428853) # Semilla
cv=function(data){ # Función que calcula el coeficiente de variación
  sd(data)/mean(data)*100
} 
cv(Datos) # Aplicación de cv a la muestra
sd(replicate(B,cv(sample(Datos,replace=TRUE)))) # Error estándar bootstrap
```

    [1] 34.84712
    
    [1] 2.191089


\vspace{0.3cm}


**Forma 2**

```python
library(bootstrap)
bootcv<-bootstrap(Datos,B,cv) # Aplicación bootstrap
sd(bootcv$thetastar) # Error estándar bootstrap
```

    [1] 2.255368
    
\newpage

**Forma 3.**

```python 
library(boot)
n=length(Datos)
# Función auxiliar
funcv = function(data, i, n){
  cosa = data[i]
  sd(cosa[1:n])/mean(cosa[1:n])*100
} 

resultado = boot(Datos, funcv, R=2000, n=n) # Aplicación bootstrap
resultado
```
```
ORDINARY NONPARAMETRIC BOOTSTRAP


Call:
boot(data = Datos, statistic = funcv, R = 2000, n = n)


Bootstrap Statistics :
    original     bias    std. error
t1* 34.84712 -0.2148447     2.26003
```

Aunque los resultados no son exactamente iguales en todas las formas, lo cierto es que el coeficiente de variación muestral es 34.8 y su error sobre 2.2.



```python
plot(resultado, t0=resultado$t0, nclass = 10) # Plot de las réplicas bootstrap
```


![](p10.png)


Podemos ver como el histograma de las réplicas bootstrap es bastante simétrico en torno al valor muestral original y podemos ver que además estas réplicas son normales ya que se ajustan muy bien al qqplot salvo en las colas. Exactamente igual que pasó con la asimetría.


\vspace{0.3cm}


## Ejercicio 4

Simula una población artificial consistente en 1000 observaciones de una distribución normal de media 0 y varianza = 10 y otra población X2 con 1000 observaciones de una distribución normal de media 0 y varianza = 2. Se trata de estudiar el cociente de ambas que dan lugar a una distribución $Z=X1/X2$

Considera, a continuación una muestra de tamaño 200 de Z, digamos $z=z_{1},...,z_{200}$

Calcula la mediana muestral de z muestral y el error estándar del estimado mediante un procedimiento de bootstrap paramétrico.

```python
# Creación de datos
set.seed(100428853)
X1<-rnorm(1000,0,10)
X2<-rnorm(1000,0,2)
Z<-X1/X2

muestra<-sample(Z, size = 200, replace = FALSE) # muestreo
n<-length(muestra) # tamaño de la muestra

B<-2000 # número réplicas
library(boot)
# Función generadora
ran.gen.cauchy<-function(data,mle){
  out<-rcauchy(n,mle)
  out
}
# Estadístico de interés
statistic<-function(data){
  median(data)
}
set.seed(100428853)
# Bootstrap paramétrico
res.boot<-boot(muestra,statistic,R=B,sim = "parametric", ran.gen = ran.gen.cauchy, mle = median(muestra))
# Intervalos de confianza
boot.ci(res.boot, type = "norm")
boot.ci(res.boot, type = "basic")
boot.ci(res.boot, type = "perc")
# Gráfico réplicas bootstrap
plot(res.boot, nclass = 10)
```

![](p11.png)


Hemos sacado también los intervalos de confianza según distintos métodos para la mediana mediante un proceso de remuestreo bootstrap. Además se puede ver como el histograma es muy simétrico y además, en el qqplot podemos ver como las replicas bootstrap son normales.

\vspace{0.3cm}

## Ejercicio 5

Se quiere determinar si las clases de repaso tienen un efecto significativo en el resultado de los exámenes finales. Para ello, un conjunto de estudiantes se reparte al azar en dos grupos (uno que asiste a clases de repaso y otro que no) y se evalúa su conocimiento en un examen.

Los datos simulados son:
```python
# Generación datos
set.seed(100428853)
grupos = c(rep("clases repaso",21), rep("control",21))
invento = c(rnorm(21,62,2), rnorm(21,51.5,2))
misdatos = data.frame(trata=grupos, productividad=invento)
knitr::kable(head(misdatos))
```

```
    trata	       productividad
clases repaso	      62.20418
clases repaso	      61.64129
clases repaso	      63.62980
clases repaso	      63.35761
clases repaso	      64.71284
clases repaso	      62.60961
```

¿Existe una diferencia significativa en el promedio entre ambos grupos?

Usa para resolverlo un test clásico de la t-student y un test de permutaciones.
Contrasta normalidad de los datos mediante los test de Shapiro-Wilks y de Jarque-Bera. Muestra los correspondientes QQ-plots y explica como se pueden interpretar.
Muestra histogramas múltiples, diagramas de caja múltiples y gráficos de densidad múltiples.
Calcula y compara los p-valores obtenidos mediante el test t-student y el de permutaciones.



```python
# Boxplot por grupos
ggplot(misdatos,aes(x=grupos,y=invento,fill=grupos))+
  stat_boxplot(geom = "errorbar",width = 0.15)+
  geom_boxplot()+
  geom_jitter(position = position_jitter(0.2))+
  stat_summary(fun = "mean", geom = "point", shape = 8,size = 2, color = "white")+ 
  theme_stata()+
  ggtitle("Boxplot por grupos según si asiste o no a clases de repaso")
# Densidades por grupos
ggplot(data=misdatos, aes(x=invento, fill=grupos))+
  geom_density(colour="black")+
  theme_stata()+
  ggtitle("Densidades por grupos según si asiste o no a clases de repaso")
# Histograma por grupos
ggplot(data=misdatos, aes(x=invento, fill=grupos))+
  geom_histogram(bins = 15,colour="black")+
  theme_stata()+
  ggtitle("Histograma por grupos según si asiste o no a clases de repaso")
```


![](p12.png) 

![](p13.png) 

![](p14.png) 

A la vista de los anteriores gráficos parece claro que hay diferencias entre los dos grupos.


\vspace{0.3cm}


**Estadísticos media y varianza de cada uno de los grupos:**

```python
tapply(misdatos$productividad,misdatos$trata, mean) # Medias por grupos
tapply(misdatos$productividad,misdatos$trata, sd) # Desviaciones típicas por grupos
```
```
clases repaso       control 
     62.24549      51.50000 
clases repaso       control 
     2.007912      2.206692 
```

\newpage

**Contraste de igualdad de varianzas:**

```python
bartlett.test(misdatos$productividad~misdatos$trata) # Test de bartlet
var.test(misdatos$productividad[misdatos$trata=="clases repaso"],misdatos$productividad[misdatos$trata=="control"]) # Test de la F
```

```
	Bartlett test of homogeneity of variances

data:  misdatos$productividad by misdatos$trata
Bartlett's K-squared = 0.17362, df = 1, p-value = 0.6769


	F test to compare two variances

data:  misdatos$productividad[misdatos$trata == "clases repaso"] and

misdatos$productividad[misdatos$trata == "control"]

F = 0.82795, num df = 20, denom df = 20, p-value = 0.677
alternative hypothesis: true ratio of variances is not equal to 1
95 percent confidence interval:
 0.335954 2.040478
sample estimates:
ratio of variances 
         0.8279535 
```

No podemos rechazar la hipótesis nula de igualdad de varianzas entre los grupos.


```python
# Test de Shapiro-Wilks para los datos en general y por grupos (Estos son los que de verdad nos interesan)
shapiro.test(misdatos$productividad) 
shapiro.test(misdatos$productividad[misdatos$trata=="clases repaso"])
shapiro.test(misdatos$productividad[misdatos$trata=="control"])
```

```
	Shapiro-Wilk normality test

data:  misdatos$productividad
W = 0.89589, p-value = 0.001087


	Shapiro-Wilk normality test

data:  misdatos$productividad[misdatos$trata == "clases repaso"]
W = 0.97097, p-value = 0.7544


	Shapiro-Wilk normality test

data:  misdatos$productividad[misdatos$trata == "control"]
W = 0.96175, p-value = 0.5521
```


Podemos ver como los datos en sí no son normales, pero cada uno de los grupos sí que lo son.


```python
# Test de Jarque Bera para los datos en general y por grupos (Estos son los que de verdad nos interesan)
jarque.bera.test(misdatos$productividad)
jarque.bera.test(misdatos$productividad[misdatos$trata=="clases repaso"])
jarque.bera.test(misdatos$productividad[misdatos$trata=="control"])
```

```
	Jarque Bera Test

data:  misdatos$productividad
X-squared = 4.3135, df = 2, p-value = 0.1157


	Jarque Bera Test

data:  misdatos$productividad[misdatos$trata == "clases repaso"]
X-squared = 0.83715, df = 2, p-value = 0.658


	Jarque Bera Test

data:  misdatos$productividad[misdatos$trata == "control"]
X-squared = 0.77118, df = 2, p-value = 0.68
```

Nos sale exactamente lo mismo que con el Shapiro-Wilk salvo que ahora todos los datos juntos sin distinción por grupos sí que es normal. Aunque tiene sentido ya que los datos en general tienen una forma relativamente simétrica.

\vspace{0.3cm}

T-Student test:

```python
# Test de la t-student
t.test(misdatos$productividad~misdatos$trata,var.equal=TRUE)
```
```
Two Sample t-test

data:  misdatos$productividad by misdatos$trata
t = 16.505, df = 40, p-value < 2.2e-16
alternative hypothesis: true difference in means between group clases repaso and group control is not equal to 0
95 percent confidence interval:
  9.429668 12.061312
sample estimates:
mean in group clases repaso       mean in group control 
                   62.24549                    51.50000 
```

Podemos ver que se puede rechazar la igualdad de medias, por lo tanto la media en las puntuaciones no son iguales según si asisten o no a clases de repaso.

\vspace{0.3cm}

Contraste de permutaciones:

Un hecho a tener en cuenta es que el muestreo no ha sido aleatorio, ya que se ha basado en voluntarios. Una vez obtenidos los voluntarios, sí que se han dividido al azar entre repaso y control.
```python
# Diferencia de medias.
dif_obs<-mean(misdatos$productividad[misdatos$trata=="clases repaso"])-mean(misdatos$productividad[misdatos$trata=="control"])
dif_obs
```

    [1] 10.74549

Determinar si la diferencia observada es significativa es equivalente a preguntarse cómo de probable es obtener esta diferencia si las clases de repaso no tienen efecto y los estudiantes se han asignado de forma aleatoria en cada grupo.

Para obtener la probabilidad exacta, se requiere calcular todas las posibles permutaciones en las que 42 personas pueden repartirse en dos grupos y calcular la diferencia de medias para cada una.


```python
# Número de permutaciones posibles
choose(42,2)
```

    [1] 861
    
    
El número de permutaciones posibles es de 861.

```python
# Distribución exacta de permutaciones
distribucion_permutaciones<-rep(NA,861)
n_control<-length(misdatos$productividad[misdatos$trata=="control"])
n_repaso<-length(misdatos$productividad[misdatos$trata=="clases repaso"])
for(i in 1:861){
  datos_aleatorizados<-sample(misdatos$productividad)
  distribucion_permutaciones[i]<-mean(datos_aleatorizados[1:n_control])-mean(datos_aleatorizados[n_control+1:n_repaso])
}
# Gráfico de la distribución de las permutaciones.
library(ggplot2)
qplot(distribucion_permutaciones, geom = "blank")+geom_line(aes(y=..density..),stat = "density",colour="cadetblue4")+geom_histogram(aes(y=..density..),alpha=0.7, fill="firebrick3",colour="black",bins = 25)+geom_vline(xintercept = mean(distribucion_permutaciones))+geom_vline(xintercept = dif_obs,colour="gold2")+geom_vline(xintercept = -dif_obs,colour="gold2")+labs(title = "Distribución exacta de permutaciones", x="Diferencia de medias")+theme_stata()
```    
    
    
![](p15.png)     
    
    
```python
summary(distribucion_permutaciones) # Resumen numérico de la distribución de permutaciones
sd(distribucion_permutaciones) # Desviación típica de la distribución de permutaciones
```
    
```
Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
-5.02614 -1.11697  0.04259  0.05696  1.21818  5.16530 
[1] 1.789423
```


```python
pvalor<-(sum(abs(distribucion_permutaciones)>abs(dif_obs)))/861 # Calculo del p-valor
pvalor
```

    [1] 0
    


A la vista de los resultados anteriores podemos ver como el hecho de asistir o no a clases de repaso sí que influye en las posteriores calificaciones del examen. En media, los que asisten a clases de repaso obtienen mejores notas que los que no.

En este caso, da igual utilizar un procedimiento u otro porque los resultados son los mismos.


\newpage



## Tareas parte 2








\newpage

# Bibliografía







<br>

