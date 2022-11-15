---
title: 'Distancias Estadísticas'
author: 'Fabio Scielzo Ortiz'
date: '13/11/22'
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
 



> More articles in my blog:   $\hspace{0.1cm}$   [Estadistica4all](https://fabioscielzoortiz.github.io/Estadistica4all.github.io/)

<br>

El concepto de distancia entre observaciones de variables estadisticas tiene un papel relevante en muchas tecnicas y modelos estadistico tales como KNN, PCA, MDS, Clustering , Regresión  y Clasificacion (supervisada). Es por ello de especial relevancia para todo cientifico de datos saber que son las distancias estadisticas, que tipos hay y como implementarlas.



<br>


# Data-set de trabaji


## Carga de los datos en  `Python` <a class="anchor" id="1"></a>



```python
import numpy as np
```


```python
np.random.seed(123)

# Quantitative

X1 = np.random.normal(loc=10, scale=15, size=50)
X2 = np.random.normal(loc=10, scale=15, size=50)
X3 = np.random.normal(loc=10, scale=15, size=50)
X4 = np.random.normal(loc=10, scale=15, size=50)

# Binary Categorical / Dummies ( categories: 0,1)

X5 = np.random.uniform(low=0.0, high=1.0, size=50).round()
X6 = np.random.uniform(low=0.0, high=1.0, size=50).round() 
X7 = np.random.uniform(low=0.0, high=1.0, size=50).round() 


# Multiple categorical

X8 = np.random.uniform(low=0, high=4, size=50).round()   # categories: 0,1,2,3,4
X9 = np.random.uniform(low=0, high=3, size=50).round()   # categories: 0,1,2,3
X10 = np.random.uniform(low=0, high=5, size=50).round()  # categories: 0,1,2,3,4,5
```


```python
import pandas as pd
```


```python
Data_set_Python = pd.DataFrame({'X1': X1 , 'X2': X2, 'X3': X3 , 'X4': X4 , 'X5': X5 , 
                         'X6': X6 , 'X7': X7 , 'X8': X8 , 'X9': X9 , 'X10': X10 })
```



<br>



## Carga de los datos en  `R`


```python
import rpy2

%load_ext rpy2.ipython

import rpy2.robjects as robjects
```

    c:\Users\Usuario\AppData\Local\Programs\Python\Python310\lib\site-packages\rpy2\robjects\packages.py:366: UserWarning: The symbol 'quartz' is not in this R namespace/package.
      warnings.warn(
    


```r
%%R

# Quantitative

X1 <- c(-6.28445905,  24.9601817 ,  14.24467747, -12.59442071,
         1.32099622,  34.77154806, -26.40018865,   3.56631057,
        28.98904388,  -3.00110603,  -0.18329227,   8.57936547,
        32.37084439,   0.41647005,   3.34027061,   3.48473087,
        43.08895124,  42.80179133,  25.06080847,  15.79279599,
        21.06052864,  32.36098042,  -4.03750803,  27.63743567,
        -8.80821002,   0.43372746,  23.60657794, -11.4302105 ,
         7.8989692 ,  -2.92632344,   6.16570944, -31.97883658,
       -16.57299657,  -0.49815852,  23.91193648,   7.39546476,
        10.04268874,  20.32334067,  -3.19304515,  14.25440986,
        -2.08049777, -15.91504241,   4.13650309,  18.60708794,
        15.07883576,   9.82254258,  45.88547899,  16.1936824 ,
        24.68104009,  43.57215008)

X2 <- c(-9.41127985,  -5.58182315,  36.15568338,  -1.97094103,
        10.44524845,  26.03973954,  23.36059587,  36.32329273,
        32.43466206,  26.04089005,  -1.59063071,  21.92294002,
        14.71407992,  -9.8939819 ,  31.2594857 ,  22.10854802,
        10.68235121,   6.50361909,  -7.97451717,  12.9928611 ,
        17.02658679,  -2.46732476,  27.43306074,  -6.4580457 ,
       -21.84650525,  25.59590636,   3.94950943,   8.10955622,
        -2.56275084, -14.08944141,  28.82856062,  -0.33303476,
        34.91428732,  22.10962279,   5.2786278 ,  -6.28853602,
        -0.9869298 ,  -8.18784697,  41.30670039,  12.46661845,
        27.25308314,  -9.01028074,  12.71552694,  27.66792908,
         4.97483857,  25.46671688,  -6.26851868, -10.45207317,
        15.69100918,   4.31235348)

X3 <- c(19.63082034, -19.66831897,  20.68396953,  48.97455891,
         9.63061028,  10.51213193,  12.69324227, -17.92963566,
        16.3921996 , -14.08114616,   3.58480603,  28.64304324,
        -1.02825434,  17.51873484,  25.19108581,  14.18111284,
       -10.56422705,   5.01287087,  39.39117014, -20.37568644,
         5.86320979,   1.71837893,  11.81121045,  21.22323426,
        34.13036452,   5.94651412,  22.18511995,  17.49610217,
        17.11520947,   1.54114103,  -4.95982203,  -6.50064669,
        -1.34655814,  14.82529864,  21.4142409 ,  14.85203272,
         1.76567356,  37.08955165,  32.78298435,   4.68999831,
        -2.35147109,  11.95322431,  29.00947968,  14.99147466,
        18.34823057,   6.81879817,  16.84406343,  33.16816677,
         6.40496828,  12.14961599)

X4 <- c(13.80724715,  14.25588034, -11.17833314, -18.15302984,
        -5.29482606,  12.51913443,  18.30784249,   2.0398816 ,
        30.65886224,   7.85236039,  10.30473997,   7.09054194,
        12.01040189,  20.56711111,  19.98480157,  -3.47634411,
        32.85495665,  -6.42539686,  11.18840521,   5.8840514 ,
        -5.73487516,   8.87319118,  -1.1122066 ,  11.09360865,
        16.04628942,  32.07894053,  14.61076328,   0.8316199 ,
         4.12570284,  12.09967159,  11.40191244,  31.89383902,
        30.93029395,   4.61596111,   1.77036808, -28.35581906,
         1.7661938 ,  -4.67086559,   4.67763313,  15.87376364,
        12.65788494,   9.55047989,  12.99373167,   8.1082334 ,
        12.95528399, -38.46582512,   5.96059765,   8.33723918,
         4.88107426,   6.73080607)



# Binary Categorical / Dummies ( categories: 0,1)

X5 <- c(0., 1., 1., 0., 0., 1., 1., 1., 0., 0., 1., 0., 0., 0., 1., 0., 1.,
       1., 0., 0., 1., 0., 0., 1., 1., 1., 0., 0., 1., 0., 1., 0., 0., 0.,
       0., 0., 0., 1., 0., 0., 0., 0., 1., 0., 1., 0., 1., 0., 1., 0.)

X6 <- c(0., 1., 0., 1., 1., 1., 1., 1., 0., 1., 0., 1., 0., 1., 1., 1., 0.,
       1., 0., 1., 0., 0., 0., 1., 0., 1., 1., 0., 1., 1., 0., 0., 0., 1.,
       1., 1., 1., 1., 0., 0., 1., 0., 0., 0., 0., 1., 0., 1., 1., 1.)    

X7 <- c(1., 1., 0., 0., 0., 1., 0., 0., 1., 1., 0., 1., 0., 0., 0., 0., 1.,
       1., 1., 1., 0., 0., 0., 0., 0., 0., 1., 0., 1., 0., 1., 0., 0., 1.,
       1., 0., 1., 1., 1., 1., 0., 1., 1., 0., 1., 0., 1., 0., 0., 1.) 



# Multiple categorical

X8 <- c(3., 3., 3., 1., 2., 3., 3., 0., 0., 1., 4., 2., 1., 1., 1., 2., 1.,
       3., 2., 1., 4., 1., 4., 0., 3., 2., 2., 0., 0., 1., 4., 2., 1., 2.,
       1., 1., 1., 3., 2., 1., 4., 3., 1., 4., 4., 2., 3., 2., 1., 0.) 

X9 <- c(1., 1., 1., 1., 3., 0., 2., 1., 1., 1., 3., 1., 0., 3., 3., 1., 2.,
       0., 0., 3., 1., 2., 3., 1., 0., 0., 2., 3., 1., 1., 2., 3., 2., 1.,
       2., 0., 0., 2., 1., 2., 1., 1., 3., 0., 2., 0., 2., 1., 0., 2.)       
        
X10 <- c(4., 3., 0., 1., 2., 1., 4., 1., 3., 5., 5., 1., 0., 5., 4., 5., 2.,
       4., 1., 2., 4., 1., 4., 2., 2., 2., 5., 3., 4., 4., 5., 2., 2., 3.,
       2., 5., 2., 2., 3., 2., 5., 0., 1., 2., 1., 1., 4., 3., 0., 5.)        
```


```r
%%R

Data_set_R <- cbind(X1,X2,X3,X4,X5,X6,X7,X8,X9,X10)
```



<br>



#  Definición formal de Distancia  <a class="anchor" id="3"></a>

Es un concepto que permite expresar una medida de distancia entre un par de elementos cualesquiera.


Dada un conjunto cualquiera $\hspace{0.1cm}A$


## Casi-métrica <a class="anchor" id="1"></a>

Denominamos casi-metrica o disimilaridad a cualquier función $\hspace{0.1cm}\delta : A \hspace{0.05cm}x\hspace{0.05cm} A \rightarrow \mathbb{R}\hspace{0.1cm}$ que tiene las siguientes propiedades:


1) $\hspace{0.25cm}\delta (i,j) \geq 0 \hspace{0.45cm} \forall i,j \in A \\$

2) $\hspace{0.25cm}\delta (i,i) = 0 \hspace{0.45cm} \forall i \in  A \\$

3) $\hspace{0.25cm}\delta (i,j) = \delta (j, i) \hspace{0.45cm} \forall i,j \in A$


<br>

## Semi-métrica <a class="anchor" id="6"></a>


Es denominada **semi-métrica**  a toda disimilaridad (casi-métrica) que tiene la propiedad siguiente (desigualdad triangular):



4) $\hspace{0.25cm} \delta (i,j) \hspace{0.1 cm}\leq \hspace{0.1 cm} \delta (i,k) + \delta (k,j) \hspace{0.45cm} \forall i,j,k \in A$


<br>


## Métrica <a class="anchor" id="7"></a>


Se denomina **metrica**  a toda semi-metrica que tiene la siguiente propiedad:

5) $\hspace{0.25cm} \delta (i,j)=0 \hspace{0.15cm}\Leftrightarrow\hspace{0.15cm} i=j \hspace{0.45cm} \forall i,j \in A$



<br>



## Distancia <a class="anchor" id="9"></a>

Una **distancia** es una metrica o semi-metrica
 
<br>

Expresandolo de otra manera:

Sea $\hspace{0.1cm}\delta : A \hspace{0.05cm}x\hspace{0.05cm} A \rightarrow \mathbb{R}\hspace{0.1cm}$

$\delta$ es una distancia si y solo si : 

Cumple las siguientes cuatro propiedades:

1) $\hspace{0.25cm}\delta (i,j) \geq 0 \hspace{0.45cm} \forall i,j \in A \\$

2) $\hspace{0.25cm}\delta (i,i) = 0 \hspace{0.45cm} \forall i \in  A \\$

3) $\hspace{0.25cm}\delta (i,j) = \delta (j, i) \hspace{0.45cm} \forall i,j \in A \\$

4) $\hspace{0.25cm} \delta (i,j) \hspace{0.1 cm}\leq \hspace{0.1 cm} \delta (i,k) + \delta (k,j) \hspace{0.45cm} \forall i,j,k \in A$


o bien, cumple las cuatro anteriores y además la siguiente propiedad:

5) $\hspace{0.25cm} \delta (i,j)=0 \hspace{0.15cm}\Leftrightarrow\hspace{0.15cm} i=j \hspace{0.45cm} \forall i,j \in A \\$


<br>

## Matriz de distancias <a class="anchor" id="10"></a>



Dada una distanccia $\delta$ definida sobre el conjutno  $\hspace{0.1cm} A=\lbrace a_1,...,a_n\rbrace$ 

Se define la matriz de distancias $\delta$ sobre $A$ como: $\\[0.7cm]$


$$
D(\delta , A) = \begin{pmatrix}
0 & \delta_{12}&...&\delta_{1n}\\
\delta_{21} & 0&...&\delta_{2n}\\
...&...&...&...\\
\delta_{n1}& \delta_{n2}&...& 0\\
\end{pmatrix}
$$


Donde:
 
$\delta_{ir} = \delta(a_i,a_r) \hspace{0.45cm} \forall i,r \in A$

$\delta_{ir}\hspace{0.1cm}$ puede interpretarse como la distancia $\hspace{0.1cm}\delta\hspace{0.1cm}$ entre el par de elementos $\hspace{0.1cm}(a_i,a_r)\hspace{0.1cm}$ de $\hspace{0.1cm}A$


<br>

Tambien es relevante en algunas técnicas estadisticas la matrid de cuadrados de las distancias: $\\[0.7cm]$



$$
D(\delta , A)^{(2)}= 
\begin{pmatrix}
0 & \delta^2_{12}&...&\delta^2_{1n}\\
\delta^2_{21} & 0&...&\delta^2_{2n}\\
...&...&...&...\\
\delta^2_{n1}& \delta^2_{n2}&...& 0\\
\end{pmatrix} \\[2cm]
$$





No debe confundirse con  $\hspace{0.1cm} D^2=D\cdot D$





<br>



# Distancias con variables estadísticas cuantitativas <a class="anchor" id="11"></a>

Dada una muestra de $n$  elementos/individuos $\hspace{0.1cm}\Omega = \lbrace e_1,e_2,...,e_n \rbrace$ 

Dada una serie de variables estadisticas **cuantitativas** $\hspace{0.1cm}\mathcal{X}_1,...,\mathcal{X}_p$

Para cada variable cuantitativa $\mathcal{X}_j$ tenemos una muestra de $n$ observaciones $X_j$  basada en la muestra de $n$ individuos $\hspace{0.1cm}\Omega$

 
Es decir, tenemos lo siguiente:

- $\hspace{0.1cm}X_j=(x_{j1},...,x_{jn})^t$ , para $j=1,...,p \\$

- $\hspace{0.1cm}x_{ji}\hspace{0.1cm}$ es la observación de la variable $\hspace{0.1cm}\mathcal{X}_j\hspace{0.1cm}$ para el individuo $\hspace{0.1cm}e_i\hspace{0.1cm}$ de la muestra $\hspace{0.1cm}\Omega$ , para $\hspace{0.1cm}j=1,...,p\hspace{0.1cm}$ y $\hspace{0.1cm}i=1,...,n \\$

Por tanto

- $\hspace{0.1cm}X_j=(x_{j1},...,x_{jn})^t\hspace{0.1cm}$ es el vector con las observaciones de l avariable para los individuos de la meustra $\Omega$  , para $j=1,...,p \\$

- $\hspace{0.1cm}x_i = (x_{1i} , x_{2i} ,..., x_{pi})^t\hspace{0.1cm}$ es el vector con las observaciones de las variables  $\hspace{0.1cm}\mathcal{X}_1,...,\mathcal{X}_p\hspace{0.1cm}$ para el individuo $\hspace{0.1cm}e_i\hspace{0.1cm}$ de $\hspace{0.1cm}\Omega$ , para $\hspace{0.1cm}i=1,...,n$



<br>


## Distancia Euclidea <a class="anchor" id="12"></a>


La distancia Euclidea entre el par de observaciones $\hspace{0.1cm}(x_i , x_r)\hspace{0.1cm}$ de las variables cuantitativas $\hspace{0.1cm}\mathcal{X}_1,...,\mathcal{X}_p\hspace{0.1cm}$ se define como: $\\[0.5cm]$


$$
\delta(i,r)_{Euclidea} = \delta(x_i,x_r)_{Euclidea} =\sqrt{\sum_{k=1}^{p} (x_{ik} - x_{rk})\hspace{0.05cm}^2 \hspace{0.1cm} }  \hspace{0.1cm}=\hspace{0.1cm} \sqrt{(x_i - x_r)\hspace{0.05cm}^t\cdot (x_i - x_r)\hspace{0.1cm}} \hspace{0.1cm}=\hspace{0.1cm} \sqrt{ \text{sum} \left( \hspace{0.05cm} (x_i - x_r)^2  \hspace{0.05cm} \right) \hspace{0.1cm} } \\[0.6cm]
$$


$$
\delta^2(i,r)_{Euclidea} = \delta^2(x_i,x_r)_{Euclidea} \hspace{0.1cm}=\hspace{0.1cm} \sum_{k=1}^{p} (x_{ik} - x_{jk})\hspace{0.05cm}^2 \hspace{0.1cm}=\hspace{0.1cm} (x_i - x_j)\hspace{0.05cm}^t\cdot (x_i - x_j) \hspace{0.1cm}=\hspace{0.1cm} \text{sum} \left( \hspace{0.05cm} (x_i - x_j)^2 \hspace{0.05cm} \right) \\
$$




para $i,r = 1,...,n$


<br>









<br>
 
**Observaciones:**


$\delta(i,r)_{Euclidea}$ puede interpretarse como la distancia Euclidea entre el par de individuos $(e_i , e_r)$ respecto de las variables estadisticas  $\mathcal{X}_1,...,\mathcal{X}_p$  

Nos da una medida de distancia entre individuos basada en datos de esos individuos sobre variables estadisticas.  




<br>


**Distancia Euclidea entre vectores**

La distancia Euclidea no se circusncribe solamente al campo de la estadística, una definicion mas general que contiene a la anteriormente dada es la siguiente:

Dados dos vectores  $v=(v_1,...,v_n)^t$ y $w=(w_1,...,w_n)^t$ de $\mathbb{R}^n$

La distancia Euclidea entre esos vectores es:

$$
\delta^2(v,w)_{Euclidean} \hspace{0.07cm}=\hspace{0.07cm}  sum( (v-w)^2)  \hspace{0.07cm}=\hspace{0.07cm}  \sum_{i=1}^{n} (v_{i} - w_{i})\hspace{0.05cm}^2   
$$



Asi que $\hspace{0.1cm} \delta(x_i,x_r)_{Euclidea}\hspace{0.1cm}$ es la distancia Euclidea entre los vectores (de observaciones) $\hspace{0.1cm} x_i=(x_{i1},x_{i2},...,x_{ip})\hspace{0.1cm}$ y $\hspace{0.1cm} x_r=(x_{r1},x_{r2},...,x_{rp})\hspace{0.1cm}$ de las variables estadisticas $\hspace{0.1cm} \mathcal{X}_1,...,\mathcal{X}_p$


<br>



**Desventajas de la distancia Euclidea** <a class="anchor" id="13"></a>


 
Aunque es una de las distancias mas usadas en la práctica, en muchos casos no es la más adecuada desde un punto de vista estadistico por las siguientes razones: 

-  Asume que las variables están incorreladas y tienen varianza uno. 

-  No es invariante ante cambios de escala de las variables.


 
Vamos a ver que significa esto último:

Si cambiamos la escala de las variables, es decir, aplicamos la siguiente transformación sobre las variables:

$$a\cdot \mathcal{X}_j + b$$ 

con $a\neq 1$ y $b\neq 0$

Ahora las observaciones de los elementos $i$ y $r$ son $a\cdot x_i + b$ y $a\cdot x_r + b$

Por lo que la distancia Euclidea entre el par de observaciones de los elementos $i$ y $r$ es:

$$
\delta^2(i, r) = \delta^2(a\cdot x_i + b, a\cdot x_r + b)_{Euclidea} = a^2 \cdot (x_i - x_r)^t\cdot (x_i - x_r)
$$

<br>

**Ventajas de la distancia Euclidea**

- Facilidad de cálculo

- Facilidad de interpretación geométrica. Dados dos puntos en un espacio de dos o tres dimensiones, la distancia Euclidea entre ese par de puntos es la longitud del segmento que los une. Es una distancia fácil de visualizar e intuitiva.


<br>




### Euclidean Distance in `R` <a class="anchor" id="14"></a>


```r
%%R 

Dist_Euclidea_R <- function(i,j, Quantitative_Data_set){

Quantitative_Data_set=as.matrix(Quantitative_Data_set)  
  
Dist_Euclidea = sum( (Quantitative_Data_set[i,] - Quantitative_Data_set[j,])^2 )

Dist_Euclidea = sqrt(Dist_Euclidea)

return(Dist_Euclidea)

}
```


```r
%%R

library(tidyverse)

Data_set_R <- as.data.frame(Data_set_R)

Quantitative_Data_R <- Data_set_R %>% select(1:4)
```
    


```r
%%R 

Dist_Euclidea_R(1,2, Quantitative_Data_R)
```

    [1] 50.35391
    



<br>



### Euclidean Distance in `Python` <a class="anchor" id="15"></a>



```python
def Dist_Euclidea_Python(i, j, Quantitative_Data_set):

    Quantitative_Data_set = Quantitative_Data_set.to_numpy()

    Dist_Euclidea = ( ( Quantitative_Data_set[i-1, ] - Quantitative_Data_set[j-1, ] )**2 ).sum()

    Dist_Euclidea = np.sqrt(Dist_Euclidea)

    return Dist_Euclidea
```


```python
Quantitative_Data_Python = Data_set_Python.iloc[ : , [0,1,2,3] ] 
```


```python
Dist_Euclidea_Python(1, 2, Quantitative_Data_Python)
```




    50.35390686386084





<br>



### Euclidean Distance Matrix in `R` <a class="anchor" id="16"></a>


```r
%%R

Dist_Euclidea_Matrix_R <- function( Quantitative_Data_set ){
  
  Quantitative_Data_set=as.matrix(Quantitative_Data_set)
  
  M <- matrix(NA, ncol =dim(Quantitative_Data_set)[1] , nrow=dim(Quantitative_Data_set)[1] )
  
  for(i in 1:dim(Quantitative_Data_set)[1] ){
    for(j in 1:dim(Quantitative_Data_set)[1]){
    
      M[i,j]=Dist_Euclidea_R(i,j, Quantitative_Data_set)
  
   }
  }
  return(M)
}
```


```r
%%R

Dist_Euclidea_Matrix_R(Quantitative_Data_R)[1:10,1:10]
```

              [,1]     [,2]     [,3]     [,4]     [,5]     [,6]     [,7]     [,8]
     [1,]  0.00000 50.35391 55.88544 44.47121 30.28231 55.01982 39.33222 61.13876
     [2,] 50.35391  0.00000 64.28101 84.76773 45.34684 44.83372 67.37388 48.64144
     [3,] 55.88544 64.28101  0.00000 54.98164 31.38217 34.47783 52.43096 42.18753
     [4,] 44.47121 84.76773 54.98164  0.00000 45.39912 73.81242 58.97470 81.31139
     [5,] 30.28231 45.34684 31.38217 45.39912  0.00000 40.99075 38.75224 38.57564
     [6,] 55.01982 44.83372 34.47783 73.81242 40.99075  0.00000 61.54206 44.70198
     [7,] 39.33222 67.37388 52.43096 58.97470 38.75224 61.54206  0.00000 47.62804
     [8,] 61.13876 48.64144 42.18753 81.31139 38.57564 44.70198 47.62804  0.00000
     [9,] 57.35650 55.05364 44.72150 79.73168 50.86690 20.92743 57.58937 51.56037
    [10,] 49.39225 43.05869 44.39039 74.35722 31.57531 45.31425 37.16027 14.05185
              [,9]    [,10]
     [1,] 57.35650 49.39225
     [2,] 55.05364 43.05869
     [3,] 44.72150 44.39039
     [4,] 79.73168 74.35722
     [5,] 50.86690 31.57531
     [6,] 20.92743 45.31425
     [7,] 57.58937 37.16027
     [8,] 51.56037 14.05185
     [9,]  0.00000 50.12994
    [10,] 50.12994  0.00000
    


```r
%%R

Dist_Euclidea_Matrix_R(Quantitative_Data_R)[1,2]
```

    [1] 50.35391
    


```r
%%R

Dist_Euclidea_Matrix_R(Quantitative_Data_R)[5,3]
```

    [1] 31.38217
    



<br>



### Euclidean Distance Matrix in `Python` <a class="anchor" id="17"></a>


```python
def Dist_Euclidea_Matrix_Python( Quantitative_Data_set ):

    M = np.zeros((Quantitative_Data_set.shape[0] , Quantitative_Data_set.shape[0]))

    for i in range(0 , Quantitative_Data_set.shape[0]):
        for j in range(0 , Quantitative_Data_set.shape[0]):

            M[i,j]=Dist_Euclidea_Python(i+1,j+1, Quantitative_Data_set)
                 
    return M
```


 


```python
Dist_Euclidea_Matrix_Python(Quantitative_Data_Python)
```




    array([[ 0.        , 50.35390686, 55.88543575, 44.47121042, 30.28230619,
            55.0198165 , 39.33222296, 61.13875643, 57.35650319, 49.39224756,
            19.18668603, 36.45683618, 50.06287534,  9.76176818, 42.61250194,
            37.64782144, 64.1564009 , 57.32179616, 37.17418244, 51.50386721,
            44.92383319, 43.43833526, 40.57450703, 34.19526501, 19.39727407,
            42.32909321, 32.85049264, 22.50294156, 18.65831141, 19.06081274,
            47.19933709, 41.86399342, 52.95147825, 33.684141  , 35.71670108,
            44.692872  , 28.3142343 , 36.82009972, 53.27475603, 33.58550615,
            42.97081537, 13.03742629, 26.20711906, 45.25990645, 25.80158224,
            66.12512498, 52.92367433, 26.82407183, 42.9370094 , 52.72631243],
           [50.35390686,  0.        , 64.28100719, 84.76773428, 45.34683551,
            44.83371544, 67.37388444, 48.6414443 , 55.05364378, 43.05869447,
            34.70508944, 58.39668596, 28.6240421 , 45.20726822, 62.20843455,
            51.84754056, 31.96851235, 38.74606183, 59.1875643 , 22.35280172,
            39.72199341, 23.46989799, 56.19597349, 41.11027296, 65.59228669,
            50.4715655 , 42.94781526, 55.43572387, 41.90284275, 36.1182387 ,
            41.97370265, 61.27060276, 63.07664266, 51.9392045 , 44.30251635,
            57.58845657, 29.30960502, 60.06637365, 76.38075584, 32.19169089,
            45.95384888, 52.00577911, 56.03159566, 48.83648924, 40.6943939 ,
            68.3688932 , 42.89878088, 54.1044858 , 34.93300177, 38.90125738],
           [55.88543575, 64.28100719,  0.        , 54.98163803, 31.38216703,
            34.47783324, 52.4309611 , 42.18752564, 44.72149983, 44.39038925,
            48.85544352, 25.1349437 , 42.39620719, 57.70253837, 33.67987385,
            20.36433753, 66.30432249, 44.30493658, 53.98790262, 50.15908015,
            25.7228365 , 50.81037734, 24.29763794, 49.91619051, 69.40947427,
            48.89412591, 42.33454579, 40.00233232, 42.26505327, 61.05513266,
            35.86680901, 77.86048533, 56.65466196, 26.42776544, 34.85757618,
            46.66370093, 43.84852476, 48.11225507, 26.98897872, 39.35473221,
            38.00742631, 58.78335325, 36.1278142 , 22.25867797, 39.50731648,
            32.72093332, 55.76236247, 52.08449226, 31.4565573 , 47.62006684],
        
            ...
            
           [52.72631243, 38.90125738, 47.62006684, 71.89885378, 44.42672192,
            24.2015702 , 73.43900208, 59.59810046, 39.92596416, 57.71055582,
            45.11665913, 42.50635583, 20.86134129, 47.79647956, 51.87003366,
            45.07791714, 35.20227636, 15.14641555, 35.43457945, 43.6538202 ,
            29.38259587, 16.88356842, 53.5058316 , 21.70901233, 63.22910366,
            54.7258579 , 23.69727394, 55.70514994, 36.75985004, 51.40134777,
            48.11276668, 81.91789635, 72.94983858, 47.65046423, 22.31360358,
            51.57039595, 35.84383931, 38.06258869, 63.13094801, 32.63834398,
            53.44018266, 61.02628764, 44.1504566 , 34.33235655, 29.82406403,
            60.47889042, 11.82951411, 37.57564225, 22.86417126,  0.        ]])




Cuidado con la salida de las matrices en `Python`

Cada array representa una fila, y cada elemento dentro de un array esta asociado a una columnas. De modo que el elemento 3 del aray 5 es el elemento de la fila 5 y columna 3 de la matriz de distancias.


<br>



```python
Dist_Euclidea_Matrix_Python(Quantitative_Data_Python)[1,2]
```




    64.28100718719624




```python
Dist_Euclidea_Matrix_Python(Quantitative_Data_Python)[5,3]
```




    73.81241882537256





<br>

<br>



##  Distancia de Minkowski <a class="anchor" id="18"></a>


La distancia de Minkowski de parametro $\hspace{0.1cm} q=1,2,3,... \hspace{0.1cm}$ entre el par de observaciones (x_i , x_r) de las variables estadisticas $\hspace{0.1cm} \mathcal{X}_1,. ..,\mathcal{X}_k\hspace{0.1cm}$  se define como: $\\[0.5cm]$


$$
\delta_q(i,r)_{Minkow} = \delta_q(x_i,x_r)_{Minkow} \hspace{0.1cm} = \hspace{0.1cm}  \left( \sum_{k=1}^{p}  \mid x_{ik} - x_{jk} \mid  ^q  \right)^{(1/q)} \hspace{0.1cm} = \hspace{0.1cm} \text{sum} \left( \hspace{0.1cm} \mid x_i - x_j \mid  ^q \hspace{0.1cm}\right)^{(1/q)}    
$$

<br>



**Distancia Minkowski entre vectores**


La distancia de Minkowski puede definirse de un modo mas general no sujeto al contexto estadistico.

Dados dos vectores $\hspace{0.1cm} v=(v_1,...,v_n)^t\hspace{0.1cm}$ y $\hspace{0.1cm} w=(w_1,...,w_n)^t\hspace{0.1cm}$ de $\hspace{0.1cm}\mathbb{R}^2 \\$



La distancia de Minkowski entre  esos vectores se define como:

$$
\delta_q(v,w)_{Minkowski} \hspace{0.07cm}=\hspace{0.07cm}  sum \left( \hspace{0.1cm} \mid v - w \mid  ^q \hspace{0.1cm}\right)^{(1/q)}  \hspace{0.07cm}=\hspace{0.07cm}  \left( \sum_{i=1}^{n}  \mid v_{i } - w_{i} \mid  ^q  \right)^{(1/q)} $$


Asi que $\hspace{0.1cm} \delta_q(x_i,x_r)_{Minkowski}\hspace{0.1cm}$ es la distancia de Minkowski entre los vectores (de observaciones) $\hspace{0.1cm} x_i=(x_{i1},x_{i2},...,x_{ip})\hspace{0.1cm}$ y $\hspace{0.1cm} x_r=(x_{r1},x_{r2},...,x_{rp})\hspace{0.1cm}$ de las variables estadisticas $\hspace{0.1cm} \mathcal{X}_1,...,\mathcal{X}_p$


<br>


**Desventajas de la distancia de Minkowski**


1) Asume que las variables son incorreladas y tienen varianza uno.

2) No es invariante ante cambios de escala (cambios en las unidades de medida) de las variables.

3) Es dificilmente euclideanizable.




<br>



### Casos particulares de la distancia de Minkowski <a class="anchor" id="20"></a>

<br>

**Distancia Euclidea** 


\begin{gather*}
 \delta_2(i,j)_{Minkowski }=\delta (i,j)_{Euclidea }   \hspace{1cm} (q=2) \\
 \end{gather*}
 


<br>

**Distancia Manhattan**



\begin{gather*}
 \delta_1(i,j)_{Minkowski } \hspace{0.1cm}=\hspace{0.1cm} \sum_{k=1}^{p}  \mid x_{ik} - x_{jk}  \mid  \hspace{0.1cm}=\hspace{0.1cm}  sum \left( \hspace{0.1cm} \mid x_i - x_j \mid \hspace{0.1cm} \right) \hspace{1cm} (q=1) \\
 \end{gather*}



<br>

**Distancia Dominante** <a class="anchor" id="23"></a>



\begin{gather*}
 \delta_{\infty}(i,j)_{Minkowski } \hspace{0.1cm}=\hspace{0.1cm} max \lbrace  \hspace{0.1cm} \mid x_{i1} - x_{j1} \mid \hspace{0.1cm},...,\hspace{0.1cm} \mid x_{ip} - x_{jp} \mid \hspace{0.1cm}  \rbrace \hspace{0.1cm}=\hspace{0.1cm} max \left( \mid x_i - x_j \mid \right) \hspace{1cm} (q\rightarrow \infty) 
 \end{gather*}


<br>

<br>



### Distancia de Minkowski in `R` <a class="anchor" id="24"></a>


```r
%%R

Dist_Minkowski_R <- function(i,j, q , Quantitative_Data_set){
  
Quantitative_Data_set=as.matrix(Quantitative_Data_set)  

Dist_Minkowski = ( sum( ( abs(Quantitative_Data_set[i,] - Quantitative_Data_set[j,]) )^q ) )^(1/q)
  
return(Dist_Minkowski)
}
```

<br>

Casos particulares:


**Distancia Euclidea** $\hspace{0.1cm} (q=2)$


```r
%%R

Dist_Minkowski_R(1,2, q=2, Quantitative_Data_R)
```

    [1] 50.35391
    

<br>

**Distancia Manhattan** $\hspace{0.1cm} (q=1)$


```r
%%R

Dist_Minkowski_R(1,2, q=1, Quantitative_Data_R)
```

    [1] 74.82187
    



<br>



### Distancia de Minkowski in `Python` <a class="anchor" id="25"></a>


```python
def Dist_Minkowski_Python(i,j, q , Quantitative_Data_set):

    Quantitative_Data_set = Quantitative_Data_set.to_numpy()

    Dist_Minkowski = ( ( ( abs( Quantitative_Data_set[i-1, ] - Quantitative_Data_set[j-1, ] ) )**q ).sum() )**(1/q)

    return Dist_Minkowski
```


<br>

Casos Particulares:

**Euclidean Distance** $\hspace{0.1cm} (q=2)$


```python
Dist_Minkowski_Python(1,2, 2 , Quantitative_Data_Python)
```




    50.35390686386084


<br>

**Manhattan Distance** $\hspace{0.1cm} (q=1)$


```python
Dist_Minkowski_Python(1,2, 1 , Quantitative_Data_Python)
```




    74.821869942812





<br>



### Matriz de distancias de Minkowski en `R` <a class="anchor" id="26"></a>


```r
%%R

Dist_Minkowski_Matrix_R <- function(q , Quantitative_Data_set ){
  
  Quantitative_Data_set=as.matrix(Quantitative_Data_set)
  
  M<-matrix(NA, ncol =dim(Quantitative_Data_set)[1] , nrow=dim(Quantitative_Data_set)[1] )
  
  for(i in 1:dim(Quantitative_Data_set)[1] ){
    for(j in 1:dim(Quantitative_Data_set)[1]){
    
  M[i,j]=Dist_Minkowski_R(i,j, q , Quantitative_Data_set)
  
   }
  }
 return(M)
}
```


```r
%%R

Dist_Minkowski_Matrix_R(q=2 , Quantitative_Data_R)[1:10,1:10]
```

              [,1]     [,2]     [,3]     [,4]     [,5]     [,6]     [,7]     [,8]
     [1,]  0.00000 50.35391 55.88544 44.47121 30.28231 55.01982 39.33222 61.13876
     [2,] 50.35391  0.00000 64.28101 84.76773 45.34684 44.83372 67.37388 48.64144
     [3,] 55.88544 64.28101  0.00000 54.98164 31.38217 34.47783 52.43096 42.18753
     [4,] 44.47121 84.76773 54.98164  0.00000 45.39912 73.81242 58.97470 81.31139
     [5,] 30.28231 45.34684 31.38217 45.39912  0.00000 40.99075 38.75224 38.57564
     [6,] 55.01982 44.83372 34.47783 73.81242 40.99075  0.00000 61.54206 44.70198
     [7,] 39.33222 67.37388 52.43096 58.97470 38.75224 61.54206  0.00000 47.62804
     [8,] 61.13876 48.64144 42.18753 81.31139 38.57564 44.70198 47.62804  0.00000
     [9,] 57.35650 55.05364 44.72150 79.73168 50.86690 20.92743 57.58937 51.56037
    [10,] 49.39225 43.05869 44.39039 74.35722 31.57531 45.31425 37.16027 14.05185
              [,9]    [,10]
     [1,] 57.35650 49.39225
     [2,] 55.05364 43.05869
     [3,] 44.72150 44.39039
     [4,] 79.73168 74.35722
     [5,] 50.86690 31.57531
     [6,] 20.92743 45.31425
     [7,] 57.58937 37.16027
     [8,] 51.56037 14.05185
     [9,]  0.00000 50.12994
    [10,] 50.12994  0.00000
    



<br>



### Matriz de distancias de Minkowski en  `Python` <a class="anchor" id="27"></a>


```python
def Dist_Minkowski_Matrix_Python(q , Quantitative_Data_set):

    M = np.zeros((Quantitative_Data_set.shape[0] , Quantitative_Data_set.shape[0]))

    for i in range(0 , Quantitative_Data_set.shape[0]):
        for j in range(0 , Quantitative_Data_set.shape[0]):

            M[i,j] = Dist_Minkowski_Python(i+1,j+1, q, Quantitative_Data_set)
                 
    return M
```

<br>

```python
Dist_Minkowski_Matrix_Python(2 , Quantitative_Data_Python)
```



```
array([[ 0.        , 50.35390686, 55.88543575, 44.47121042, 30.28230619,
            55.0198165 , 39.33222296, 61.13875643, 57.35650319, 49.39224756,
            19.18668603, 36.45683618, 50.06287534,  9.76176818, 42.61250194,
            37.64782144, 64.1564009 , 57.32179616, 37.17418244, 51.50386721,
            44.92383319, 43.43833526, 40.57450703, 34.19526501, 19.39727407,
            42.32909321, 32.85049264, 22.50294156, 18.65831141, 19.06081274,
            47.19933709, 41.86399342, 52.95147825, 33.684141  , 35.71670108,
            44.692872  , 28.3142343 , 36.82009972, 53.27475603, 33.58550615,
            42.97081537, 13.03742629, 26.20711906, 45.25990645, 25.80158224,
            66.12512498, 52.92367433, 26.82407183, 42.9370094 , 52.72631243],
           [50.35390686,  0.        , 64.28100719, 84.76773428, 45.34683551,
            44.83371544, 67.37388444, 48.6414443 , 55.05364378, 43.05869447,
            34.70508944, 58.39668596, 28.6240421 , 45.20726822, 62.20843455,
            51.84754056, 31.96851235, 38.74606183, 59.1875643 , 22.35280172,
            39.72199341, 23.46989799, 56.19597349, 41.11027296, 65.59228669,
            50.4715655 , 42.94781526, 55.43572387, 41.90284275, 36.1182387 ,
            41.97370265, 61.27060276, 63.07664266, 51.9392045 , 44.30251635,
            57.58845657, 29.30960502, 60.06637365, 76.38075584, 32.19169089,
            45.95384888, 52.00577911, 56.03159566, 48.83648924, 40.6943939 ,
            68.3688932 , 42.89878088, 54.1044858 , 34.93300177, 38.90125738],
          
            
    ...
           
           [52.72631243, 38.90125738, 47.62006684, 71.89885378, 44.42672192,
            24.2015702 , 73.43900208, 59.59810046, 39.92596416, 57.71055582,
            45.11665913, 42.50635583, 20.86134129, 47.79647956, 51.87003366,
            45.07791714, 35.20227636, 15.14641555, 35.43457945, 43.6538202 ,
            29.38259587, 16.88356842, 53.5058316 , 21.70901233, 63.22910366,
            54.7258579 , 23.69727394, 55.70514994, 36.75985004, 51.40134777,
            48.11276668, 81.91789635, 72.94983858, 47.65046423, 22.31360358,
            51.57039595, 35.84383931, 38.06258869, 63.13094801, 32.63834398,
            53.44018266, 61.02628764, 44.1504566 , 34.33235655, 29.82406403,
            60.47889042, 11.82951411, 37.57564225, 22.86417126,  0.        ]])

```



<br>



### Distancia Dominante en `R` <a class="anchor" id="28"></a>


```r
%%R

Dist_Dominant_R <- function(i,j, Quantitative_Data_set){
  
  Quantitative_Data_set=as.matrix(Quantitative_Data_set)  

  Dist_Dominante =  max( abs(Quantitative_Data_set[i,] - Quantitative_Data_set[j,]) )
  
return(Dist_Dominante)
}
```


```r
%%R

Dist_Dominant_R(1,2, Quantitative_Data_R)
```

    [1] 39.29914
    



<br>



### Distancia Dominante en `Python` <a class="anchor" id="29"></a>


```python
def Dist_Dominant_Python(i, j, Quantitative_Data_set):

    Quantitative_Data_set = Quantitative_Data_set.to_numpy()

    Dist_Dominante = ( abs(Quantitative_Data_set[i-1,] - Quantitative_Data_set[j-1,]) ).max()

    return Dist_Dominante
```


```python
Dist_Dominant_Python(1, 2, Quantitative_Data_Python)
```




    39.299139311884204





<br>


### Matriz de distancias dominantes en `R` <a class="anchor" id="30"></a>


```r
%%R

Dist_Dominant_Matrix_R <- function( Quantitative_Data_set ){
  
  Quantitative_Data_set=as.matrix(Quantitative_Data_set)
  
  M<-matrix(NA, ncol =dim(Quantitative_Data_set)[1] , nrow=dim(Quantitative_Data_set)[1] )
  
  for(i in 1:dim(Quantitative_Data_set)[1] ){
    for(j in 1:dim(Quantitative_Data_set)[1]){
    
       M[i,j]=Dist_Dominant_R(i,j,  Quantitative_Data_set)
  
   }
  }
 return(M)
}
```


```r
%%R

Dist_Dominant_Matrix_R(Quantitative_Data_R)[1:10,1:10]
```

              [,1]     [,2]     [,3]     [,4]     [,5]     [,6]     [,7]     [,8]
     [1,]  0.00000 39.29914 45.56696 31.96028 19.85653 41.05601 32.77188 45.73457
     [2,] 39.29914  0.00000 41.73751 68.64288 29.29893 31.62156 51.36037 41.90512
     [3,] 45.56696 41.73751  0.00000 38.12662 25.71043 23.69747 40.64487 38.61361
     [4,] 31.96028 68.64288 38.12662  0.00000 39.34395 47.36597 36.46087 66.90419
     [5,] 19.85653 29.29893 25.71043 39.34395  0.00000 33.45055 27.72118 27.56025
     [6,] 41.05601 31.62156 23.69747 47.36597 33.45055  0.00000 61.17174 31.20524
     [7,] 32.77188 51.36037 40.64487 36.46087 27.72118 61.17174  0.00000 30.62288
     [8,] 45.73457 41.90512 38.61361 66.90419 27.56025 31.20524 30.62288  0.00000
     [9,] 41.84594 38.01649 41.83720 48.81189 35.95369 18.13973 55.38923 34.32184
    [10,] 35.45217 31.62271 34.76512 63.05571 23.71176 37.77265 26.77439 10.28240
              [,9]    [,10]
     [1,] 41.84594 35.45217
     [2,] 38.01649 31.62271
     [3,] 41.83720 34.76512
     [4,] 48.81189 63.05571
     [5,] 35.95369 23.71176
     [6,] 18.13973 37.77265
     [7,] 55.38923 26.77439
     [8,] 34.32184 10.28240
     [9,]  0.00000 31.99015
    [10,] 31.99015  0.00000
    



<br>



### Matriz de distancias dominantes en `Python` <a class="anchor" id="31"></a>


```python
def Dist_Dominant_Matrix_Python(Quantitative_Data_set):

    M = np.zeros((Quantitative_Data_set.shape[0] , Quantitative_Data_set.shape[0]))

    for i in range(0 , Quantitative_Data_set.shape[0]):
        for j in range(0 , Quantitative_Data_set.shape[0]):

            M[i,j] = Dist_Dominant_Python(i+1,j+1, Quantitative_Data_set)
                 
    return M
```


```python
Dist_Dominant_Matrix_Python(Quantitative_Data_Python)
```




    array([[ 0.        , 39.29913931, 45.56696322, 31.96027699, 19.8565283 ,
            41.05600711, 32.77187572, 45.73457258, 41.8459419 , 35.45216989,
            16.04601431, 31.33421986, 38.65530344,  6.75986396, 40.67076554,
            31.51982787, 49.37341029, 49.08625038, 31.34526752, 40.00650678,
            27.34498769, 38.64543947, 36.84434058, 33.92189472, 14.49954418,
            35.00718621, 29.89103699, 17.52083607, 14.18342825, 18.08967931,
            38.23984047, 26.13146703, 44.32556717, 31.52090264, 30.19639553,
            42.16306621, 17.86514678, 26.60779972, 50.71798024, 21.8778983 ,
            36.66436299,  9.63058336, 22.12680679, 37.07920893, 21.36329481,
            52.27307227, 52.16993804, 22.47814145, 30.96549914, 49.85660913],
           [39.29913931,  0.        , 41.73750653, 68.64287788, 29.29892925,
            31.62156269, 51.36037035, 41.90511588, 38.01648521, 31.6227132 ,
            25.14347397, 48.31136222, 20.29590307, 37.18705382, 44.85940478,
            33.84943181, 18.59907631, 24.68118984, 59.05948911, 18.57468426,
            25.53152876, 21.3866979 , 33.01488389, 40.89155323, 53.79868349,
            31.17772952, 41.85343892, 37.16442115, 36.78352844, 27.88650514,
            34.41038377, 56.93901828, 41.53317827, 34.49361761, 41.08255987,
            42.6116994 , 21.43399253, 56.75787062, 52.45130333, 24.35831728,
            32.83490629, 40.87522411, 48.67779865, 34.65979363, 38.01654955,
            52.72170546, 36.5123824 , 52.83648574, 26.07328725, 31.81793496],
          
            ...
            
           [49.85660913, 31.81793496, 31.8433299 , 56.16657079, 42.25115386,
            21.72738606, 69.97233873, 40.00583951, 28.12230857, 46.57325611,
            43.75544235, 34.99278461, 13.17787033, 43.15568003, 40.23187947,
            40.08741921, 26.12415058, 13.15620293, 27.24155415, 32.52530243,
            22.51162144, 11.21116966, 47.6096581 , 15.93471441, 52.38036009,
            43.13842261, 19.96557214, 55.00236058, 35.67318088, 46.49847352,
            37.40644064, 75.55098666, 60.14514665, 44.0703086 , 19.6602136 ,
            36.17668532, 33.52946134, 24.93993566, 46.76519522, 29.31774022,
            45.65264785, 59.48719249, 39.43564698, 24.96506214, 28.49331431,
            45.19663119, 10.58087216, 27.37846767, 18.89110999,  0.        ]])





<br>



## Distancia de Canberra  <a class="anchor" id="32"></a>



La distancia de Canberraentre el par de observaciones $\hspace{0.1cm}(x_i , x_r)\hspace{0.1cm}$ de las variables estadisticas $\hspace{0.1cm} \mathcal{X}_1,. ..,\mathcal{X}_k\hspace{0.1cm}$  se define como: $\\[0.5cm]$



\begin{gather*}
\delta(i,j)_{Canberra} = \delta(x_i,x_j)_{Canberra}\hspace{0.1cm}= \hspace{0.1cm} \sum_{k=1}^{p} \dfrac{\mid x_{ik} - x_{jk} \mid}{\mid x_{ik} \mid + \mid x_{jk} \mid}  \hspace{0.1cm}= \hspace{0.1cm} sum \left( \dfrac{\mid x_i - x_j \mid }{ \mid x_i \mid + \mid x_j \mid} \right)
 \end{gather*}


<br>

** Distancia Canberra:**

La distancia de Canberra se puede definir de forma más general no sujeta a un contexto estadístico.

Dados dos vectores $\hspace{0.07cm}v=(v_1,...,v_n)^t\hspace{0.07cm}$ y $\hspace{0.07cm}w=(w_1,...,w_n)^t$ de $\hspace{0.07cm}\mathbb{R}^2$



La distancia Canberra entre esos dos vectores es:

$$
\delta (v,w)_{Canberra}  \hspace{0.07cm}=\hspace{0.07cm}  sum \left( \dfrac{ \mid v-w \mid }{\mid v \mid + \mid w \mid} \right)  \hspace{0.07cm}=\hspace{0.07cm}  \sum_{i=1}^{n} \dfrac{ \mid v_i - w_i \mid }{\mid v_i \mid + \mid w_i \mid} \\
$$


Asi que $\hspace{0.1cm} \delta_q(x_i,x_r)_{Minkowski}\hspace{0.1cm}$ es la distancia de Minkowski entre los vectores (de observaciones) $\hspace{0.1cm} x_i=(x_{i1},x_{i2},...,x_{ip})\hspace{0.1cm}$ y $\hspace{0.1cm} x_r=(x_{r1},x_{r2},...,x_{rp})\hspace{0.1cm}$ de las variables estadisticas $\hspace{0.1cm} \mathcal{X}_1,...,\mathcal{X}_p$



<br>

**Desventajas de la distancia de Canberra**

1) Asumen que las variables son incorreladas y tienen varianza uno.



**Ventajas de la distancia de Canberra**

1) Es invariante ante cambios de escala (cambios en las unidades de medida) de las variables.



<br>



### Canberra Distance in `R` <a class="anchor" id="33"></a>


```r
%%R

Dist_Canberra_R <- function(i,j,   Quantitative_Data_set){

Quantitative_Data_set=as.matrix(Quantitative_Data_set)  

Dist_Canberra =   sum( abs(Quantitative_Data_set[i,] - Quantitative_Data_set[j,])/(abs(Quantitative_Data_set[i,])+ abs(Quantitative_Data_set[j,])) ) 
  
return(Dist_Canberra)
}
```


```r
%%R

Dist_Canberra_R(1,2, Quantitative_Data_R)
```

    [1] 2.271401
    



<br>



### Canberra Distance in `Python` <a class="anchor" id="34"></a>


```python
def Dist_Canberra_Python(i,j, Quantitative_Data_set):

    Quantitative_Data_set = Quantitative_Data_set.to_numpy()

    numerator =  abs( Quantitative_Data_set[i-1, ] - Quantitative_Data_set[j-1, ] )

    denominator =  ( abs(Quantitative_Data_set[i-1, ]) + abs(Quantitative_Data_set[j-1, ]) )
       
    numerator=np.array([numerator], dtype=float)

    denominator=np.array([denominator], dtype=float)

    # The following code is to eliminate zero division problems

    Dist_Canberra = ( np.divide( numerator , denominator , out=np.zeros_like(numerator), where=denominator!=0) ).sum() 

    return Dist_Canberra
```


```python
Dist_Canberra_Python(1,2, Quantitative_Data_Python)
```




    2.2714011238550422





<br>




### Canberra Distances Matrix in `R` <a class="anchor" id="35"></a>


```r
%%R

Dist_Canberra_Matrix_R <- function( Quantitative_Data_set ){
  
  Quantitative_Data_set=as.matrix(Quantitative_Data_set)
  
  M <- matrix(NA, ncol =dim(Quantitative_Data_set)[1] , nrow=dim(Quantitative_Data_set)[1] )
  
  for(i in 1:dim(Quantitative_Data_set)[1] ){
    for(j in 1:dim(Quantitative_Data_set)[1]){
    
  M[i,j]=Dist_Canberra_R(i,j,  Quantitative_Data_set)
  
   }
  }
 return(M)
}
```


```r
%%R

Dist_Canberra_Matrix_R(Quantitative_Data_R)[1:10,1:10]
```

              [,1]     [,2]     [,3]     [,4]     [,5]      [,6]     [,7]     [,8]
     [1,] 0.000000 2.271401 3.026123 2.415632 3.341754 2.3514434 1.970214 3.742555
     [2,] 2.271401 0.000000 3.273321 3.478087 3.899472 2.2291216 3.124432 2.545852
     [3,] 3.026123 3.273321 0.000000 2.643922 2.103762 1.9074860 2.454391 2.601851
     [4,] 2.415632 3.478087 2.643922 0.000000 3.219714 3.6465720 2.942378 4.000000
     [5,] 3.341754 3.899472 2.103762 3.219714 0.000000 2.3979854 2.519236 3.012739
     [6,] 2.351443 2.229122 1.907486 3.646572 2.397985 0.0000000 1.336006 2.698629
     [7,] 1.970214 3.124432 2.454391 2.942378 2.519236 1.3360055 0.000000 3.016687
     [8,] 3.742555 2.545852 2.601851 4.000000 3.012739 2.6986294 3.016687 0.000000
     [9,] 2.468881 2.439881 1.511044 3.498455 2.685481 0.8387234 1.542040 2.712695
    [10,] 2.628528 2.455193 3.162626 3.615132 3.427440 2.2291056 2.249779 1.872681
               [,9]    [,10]
     [1,] 2.4688808 2.628528
     [2,] 2.4398814 2.455193
     [3,] 1.5110440 3.162626
     [4,] 3.4984546 3.615132
     [5,] 2.6854815 3.427440
     [6,] 0.8387234 2.229106
     [7,] 1.5420401 2.249779
     [8,] 2.7126951 1.872681
     [9,] 0.0000000 2.701545
    [10,] 2.7015450 0.000000
    



<br>




### Canberra Distances Matrix in `Python` <a class="anchor" id="36"></a>


```python
def Dist_Canberra_Matrix_Python(Quantitative_Data_set):

    M = np.zeros((Quantitative_Data_set.shape[0] , Quantitative_Data_set.shape[0]))

    for i in range(0 , Quantitative_Data_set.shape[0]):
        for j in range(0 , Quantitative_Data_set.shape[0]):

            M[i,j] = Dist_Canberra_Python(i+1,j+1, Quantitative_Data_set)
                 
    return M
```


```python
Dist_Canberra_Matrix_Python(Quantitative_Data_Python)
```




    array([[0.        , 2.27140112, 3.02612315, 2.41563242, 3.34175397,
            2.35144336, 1.97021427, 3.74255505, 2.4688808 , 2.62852805,
            2.49059882, 2.50809694, 3.06959756, 1.2785115 , 2.3068633 ,
            3.16117705, 3.40820424, 3.59317208, 1.52220832, 3.4023704 ,
            3.54003272, 2.64114513, 2.46638558, 1.33405285, 0.90974886,
            2.93321284, 2.08935924, 2.23435946, 2.18028251, 1.48398078,
            3.09541511, 2.9989188 , 2.83286184, 2.49147232, 2.81615389,
            2.33748768, 3.4183086 , 2.37732022, 2.07101008, 2.68394653,
            2.5459975 , 0.88091472, 2.22317059, 2.39404391, 2.06560516,
            3.48439346, 1.67377591, 1.55580616, 2.98562112, 2.57995549],
           [2.27140112, 0.        , 3.27332082, 3.4780875 , 3.89947207,
            2.22912162, 3.12443178, 2.54585179, 2.4398814 , 2.45519252,
            2.71733421, 2.82407231, 2.11538526, 2.42705311, 2.93125554,
            3.75498389, 1.96233654, 3.26329826, 1.29906823, 1.65829792,
            3.08473692, 1.74877024, 4.        , 1.24842438, 2.65207363,
            3.35049805, 2.04016487, 3.88976041, 2.44101241, 2.51430196,
            2.31227638, 2.77275933, 3.24086299, 3.51080968, 2.80051517,
            2.60239997, 2.90521679, 2.29165403, 3.50588853, 2.32670219,
            2.84579667, 2.43260601, 2.7619899 , 2.42071154, 2.29458934,
            3.43520568, 1.76363472, 1.77873131, 2.49550291, 2.63014358],
            
            
            ...
            
           [2.57995549, 2.63014358, 2.55405167, 3.60246119, 2.47238025,
            1.20112892, 2.17258364, 3.17128413, 1.75488057, 2.79276297,
            2.75412859, 1.77258961, 1.97590548, 2.66889894, 2.4605071 ,
            2.60261091, 2.09033025, 1.62734819, 2.04701958, 2.03667789,
            2.29312012, 2.03712312, 2.74243973, 1.74042381, 2.88393624,
            2.68784014, 1.00263349, 2.2660972 , 2.1027074 , 3.05997975,
            2.74943481, 3.65147609, 3.42269063, 1.95915283, 1.25160947,
            2.80988089, 2.95588017, 2.87036285, 2.45011743, 1.84042975,
            3.03246511, 2.18133303, 2.04723434, 1.32934474, 1.07657876,
            2.62349139, 1.24845969, 2.02851116, 1.31452152, 0.        ]])





<br>




## Distancia de Karl Pearson  <a class="anchor" id="37"></a>

 
La distancia de Karl Pearson entre el par de observaciones $(x_i,x_r)$ de las variables estadisticas $\mathcal{X}_1,...,\mathcal{X}_p$ se define como: $\\[0.5cm]$

$$
\delta(i,r)_{KP} \hspace{0.05cm} =\hspace{0.05cm} \delta(x_i,x_r)_{KP} \hspace{0.1cm}=\hspace{0.1cm} \sqrt{ \sum_{k=1}^{p} \hspace{0.08cm} \dfrac{1}{s\hspace{0.03cm}^2_k} \cdot ( x_{ik} - x_{rk} )\hspace{0.03cm}^2 } \hspace{0.1cm} =\hspace{0.1cm} \sqrt{(x_i - x_r)\hspace{0.03cm}^t \cdot S_0^{-1} \cdot (x_i - x_r )}  \hspace{0.1cm} = \hspace{0.1cm} \sqrt{  sum \left( \hspace{0.07cm} \left(  \dfrac{ x_i - x_r  }{ \overrightarrow{s}   }\right)^2 \hspace{0.07cm} \right)} \\[0.8cm]
$$
  
$$
\delta^2(i,r)_{KP} \hspace{0.05cm}=\hspace{0.05cm}  \delta(x_i,x_r)_{KP}  \hspace{0.1cm}=\hspace{0.1cm} \sum_{k=1}^{p}  \hspace{0.08cm} \dfrac{1}{s\hspace{0.03cm}^2_k} \cdot  ( x_{ik} - x_{rk} )\hspace{0.03cm}^2 \hspace{0.1cm} = \hspace{0.1cm} (x_i - x_r)\hspace{0.03cm}^t \cdot S_0^{-1} \cdot (x_i - x_r)   \hspace{0.1cm} = \hspace{0.1cm} sum \left( \hspace{0.07cm} \left(  \dfrac{ x_i - x_r  }{ \overrightarrow{s}   }\right)^2 \hspace{0.07cm} \right) \\[0.6cm]
$$



Donde:
 
 $S_0 = \text{diag}(s_1 ^2 ,..., s_p ^2)$
 
 $s_k ^2\hspace{0.08cm}$ es la varianza de la muestra $\hspace{0.08cm}X_k\hspace{0.08cm}$ , es decir, $\hspace{0.08cm} s_k ^2 = \dfrac{1}{n}\cdot \sum_{i=1}^n ( x_{ik} - \overline{X}_k )^2$

 $\overrightarrow{s} = ( s_1 ,..., s_p )$



<br>



**Observación:**

Con la distancia de Karl Pearson, el peso que se le da a la diferencia entre las observaciones de una variable para un par de  individuos decrece cuanto mayor es la varianza de la variable, y aumenta cuanto menor es la varianza.

Es decir, si la variable $\hspace{0.08cm}\mathcal{X}_k\hspace{0.08cm}$ tiene mucha varianza muestral, es decir, mucha $\hspace{0.08cm}s_k ^2\hspace{0.08cm}$ , entonces $\hspace{0.08cm}(x_{ik} - x_{rk})\hspace{0.08cm}$ tiene muy poco peso en la distancia de Pearson. Cuanto menor sea la varianza, mas peso tendrá, y a la inversa.



<br>


**Desventajas**
 
1) Asume que las variables estan incorreladas y tienen varianza uno.




**Ventajas**

1) La distancia de Pearson es invariante ante cambios de escala (cambios en las unidades de medida).




<br>




#### Pearson Distance in `R` <a class="anchor" id="38"></a>


```r
%%R

Dist_Pearson_R <- function(i,j, Quantitative_Data_set){

Quantitative_Data_set=as.matrix(Quantitative_Data_set)  
  
Dist_Pearson = sum( ((Quantitative_Data_set[i,] - Quantitative_Data_set[j,])^2)/diag(cov(Quantitative_Data_set)) ) 

Dist_Pearson = sqrt(Dist_Pearson)

return( Dist_Pearson )
}
```


```r
%%R

Dist_Pearson_R(1,2, Quantitative_Data_R)
```

    [1] 3.112755
    



<br>




#### Pearson Distance in `Python` <a class="anchor" id="39"></a>


```python
def Dist_Pearson_Python(i, j, Quantitative_Data_set):

    Quantitative_Data_set = Quantitative_Data_set.to_numpy()

    Dist_Pearson = ( ( Quantitative_Data_set[i-1, ] - Quantitative_Data_set[j-1, ] )**2 / np.var(Quantitative_Data_Python.to_numpy() , axis=0, ddof=1) ).sum()

    # np.var(Quantitative_Data_Python.to_numpy() , axis=0, ddof=1)  calcula la cuasi-varianza (ddof=1) por columnas (axis=0)

    Dist_Pearson = np.sqrt(Dist_Pearson)

    return Dist_Pearson
```


```python
Dist_Pearson_Python(1, 2, Quantitative_Data_Python)
```




    3.1127552054306986





<br>




#### Pearson Distance Matrix in `R` <a class="anchor" id="40"></a>


```r
%%R

Dist_Pearson_Matrix_R <- function( Quantitative_Data_set ){
  
  Quantitative_Data_set=as.matrix(Quantitative_Data_set)
  
  M<-matrix(NA, ncol =dim(Quantitative_Data_set)[1] , nrow=dim(Quantitative_Data_set)[1] )
  
  for(i in 1:dim(Quantitative_Data_set)[1] ){
    for(j in 1:dim(Quantitative_Data_set)[1]){
    
  M[i,j]=Dist_Pearson_R(i,j,  Quantitative_Data_set)
  
   }
  }
 return(M)
}
```


```r
%%R

Dist_Pearson_Matrix_R(Quantitative_Data_R)[1:10,1:10]
```

              [,1]     [,2]     [,3]     [,4]     [,5]     [,6]     [,7]      [,8]
     [1,] 0.000000 3.112755 3.547553 3.066054 2.011176 3.224333 2.386857 3.8910984
     [2,] 3.112755 0.000000 4.177840 5.489200 2.898739 2.841462 3.990835 2.9955236
     [3,] 3.547553 4.177840 0.000000 3.392456 1.941028 2.255526 3.249619 2.7690344
     [4,] 3.066054 5.489200 3.392456 0.000000 2.949829 4.606760 3.961906 5.2731237
     [5,] 2.011176 2.898739 1.941028 2.949829 0.000000 2.460189 2.444760 2.4775568
     [6,] 3.224333 2.841462 2.255526 4.606760 2.460189 0.000000 3.426500 2.7300081
     [7,] 2.386857 3.990835 3.249619 3.961906 2.444760 3.426500 0.000000 2.9709441
     [8,] 3.891098 2.995524 2.769034 5.273124 2.477557 2.730008 2.970944 0.0000000
     [9,] 3.480684 3.551576 3.162818 5.192758 3.348337 1.462445 3.258870 3.3775867
    [10,] 3.152730 2.570858 2.898238 4.891168 2.077519 2.664770 2.315938 0.8839344
              [,9]     [,10]
     [1,] 3.480684 3.1527300
     [2,] 3.551576 2.5708579
     [3,] 3.162818 2.8982378
     [4,] 5.192758 4.8911681
     [5,] 3.348337 2.0775192
     [6,] 1.462445 2.6647698
     [7,] 3.258870 2.3159381
     [8,] 3.377587 0.8839344
     [9,] 0.000000 3.1664429
    [10,] 3.166443 0.0000000
    



<br>




#### Pearson Distance Matrix in `Python` <a class="anchor" id="41"></a>


```python
def Dist_Pearson_Matrix_Python(Quantitative_Data_set):

    M = np.zeros((Quantitative_Data_set.shape[0] , Quantitative_Data_set.shape[0]))

    for i in range(0 , Quantitative_Data_set.shape[0]):
        for j in range(0 , Quantitative_Data_set.shape[0]):

            M[i,j] = Dist_Pearson_Python(i+1,j+1, Quantitative_Data_set)
                 
    return M
```


```python
Dist_Pearson_Matrix_Python(Quantitative_Data_Python)
```




    array([[0.        , 3.11275521, 3.54755307, 3.06605427, 2.0111755 ,
            3.22433312, 2.38685702, 3.89109837, 3.48068378, 3.15272998,
            1.2327125 , 2.2470448 , 2.94788998, 0.63124268, 2.64435459,
            2.41249275, 3.85722343, 3.38535513, 2.17794449, 3.26071449,
            2.79568825, 2.50739623, 2.5844437 , 1.90386099, 1.24257151,
            2.72399308, 1.86255996, 1.47280383, 1.14882692, 1.2403834 ,
            2.95588632, 2.64563481, 3.36552558, 2.11542827, 2.10076775,
            3.17133764, 1.79601957, 2.29948959, 3.33503   , 2.03054531,
            2.7046437 , 0.79640872, 1.61301797, 2.7327908 , 1.48762823,
            4.53384449, 2.96169368, 1.58205611, 2.55905853, 2.97982428],
           
            ...
            
           [2.97982428, 2.46682348, 2.92460987, 4.35149596, 2.53507687,
            1.4983999 , 4.14401454, 3.58782965, 2.60565206, 3.38439989,
            2.53151313, 2.47622953, 1.30184395, 2.76402082, 3.07134479,
            2.59455741, 2.4410632 , 1.07183535, 2.21928612, 2.68488766,
            1.78020653, 1.02713182, 3.05941211, 1.29685735, 3.68925951,
            3.31903298, 1.40923475, 3.10998208, 2.05918042, 2.93149516,
            2.82726474, 4.74043972, 4.31305295, 2.69300729, 1.30033462,
            3.31124141, 2.03972901, 2.37025207, 3.72206602, 1.89204776,
            3.08698287, 3.40837885, 2.54644847, 2.0161511 , 1.6937921 ,
            4.01137204, 0.73863292, 2.24861292, 1.32547297, 0.        ]])





<br>




## Distancia de Mahalanobis  <a class="anchor" id="42"></a>

La distancia de Mahalanobis entre el par de observaciones $(x_i,x_r)$ de las variables estadisticas $\mathcal{X}_1,...,\mathcal{X}_p$ se define como: $\\[0.5cm]$

 
$$
\delta^2(i,j)_{Maha} \hspace{0.08cm}= \hspace{0.08cm} (x_i - x_j)\hspace{0.03cm}^t \cdot S^{-1} \cdot (x_i - x_j ) \\[0.6cm]
$$

 $$
 \delta(i,j)_{Maha} \hspace{0.08cm}= \hspace{0.08cm}\sqrt{(x_i - x_j)\hspace{0.03cm}^t \cdot S^{-1} \cdot (x_i - x_j ) }   \\[0.6cm]
$$


Donde:

$S \hspace{0.08cm}$ es la matriz de covarianzas de la matriz de datos $\hspace{0.08cm}X=(X_1,...,X_p)$


<br>


**Ventajas**

La distancia de Mahalanobis es adecuada como distancia estadística por las siguientes razones: 

1) Es invariante ante cambios de escala (cambios en las unidades de medida) de las variables.

2) Tiene en cuenta la correlación entre las variables. No aumenta al incrementar el número de variables observadas. Solo aumenta cuando estas nuevas variables no estan correladas con las anteriores. Asi que solo cuando las nuevas variables no son redundantes con respecto a la infromacion provista por las anteriores, la distancia de Mahalanobis aumentará.

<br>

***Observaciones***

1) The Euclidean distance is equal to the Mahalanobis distance when $\hspace{0.1cm} S=I$

2) The Karl Pearson distance is equal to the Mahalanobis distance when $\hspace{0.1cm} S=\text{diag}(s_1^2 ,..., s_p^2)$



<br>




#### Mahalanobis Distance in `R` <a class="anchor" id="43"></a>


```r
%%R

Dist_Mahalanobis_R <- function(i,j,   Quantitative_Data_set){
  
Quantitative_Data_set=as.matrix(Quantitative_Data_set)  

Dist_Mahalanobis  =    t( Quantitative_Data_set[i,] - Quantitative_Data_set[j,] )  %*% solve(cov(Quantitative_Data_set)) %*% ( Quantitative_Data_set[i,] - Quantitative_Data_set[j,] ) 
  
Dist_Mahalanobis <- sqrt(Dist_Mahalanobis)

return( Dist_Mahalanobis )
}
```


```r
%%R

Dist_Mahalanobis_R(1,2, Quantitative_Data_R)
```

             [,1]
    [1,] 3.065756
    



<br>




#### Mahalanobis Distance in `Python` <a class="anchor" id="44"></a>


```python
def Dist_Mahalanobis_Python(i, j, Quantitative_Data_set):

    Quantitative_Data_set = Quantitative_Data_set.to_numpy()

    # All the columns of Quantitative_Data_set must be type = 'float' or 'int' (specially not 'object'), in other case we will find 
    # dimensional problems when Python compute   x @ S_inv @ x.T

    x = (Quantitative_Data_set[i-1, ] - Quantitative_Data_set[j-1, ])

    x = np.array([x]) # necessary step to transpose a 1D array

    S_inv = np.linalg.inv( np.cov(Quantitative_Data_set , rowvar=False) ) # inverse of covariance matrix

    Dist_Maha = np.sqrt( x @ S_inv @ x.T )  # x @ S_inv @ x.T = np.matmul( np.matmul(x , S_inv) , x.T )

    Dist_Maha = float(Dist_Maha)

    return Dist_Maha
```


```python
Dist_Mahalanobis_Python(1, 2, Quantitative_Data_Python)
```




    3.0657555948686936





<br>




#### Mahalanobis Distance Matrix in `R` <a class="anchor" id="45"></a>


```r
%%R

Dist_Mahalanobis_Matrix_R <- function( Quantitative_Data_set ){
  
  Quantitative_Data_set=as.matrix(Quantitative_Data_set)
  
  M<-matrix(NA, ncol =dim(Quantitative_Data_set)[1] , nrow=dim(Quantitative_Data_set)[1] )
  
  for(i in 1:dim(Quantitative_Data_set)[1] ){
    for(j in 1:dim(Quantitative_Data_set)[1]){
    
  M[i,j]=Dist_Mahalanobis_R(i,j,  Quantitative_Data_set)
  
   }
  }
  
 return(M)
}
```


```r
%%R

Dist_Mahalanobis_Matrix_R(Quantitative_Data_R)[1:10,1:10]
```

              [,1]     [,2]     [,3]     [,4]     [,5]     [,6]     [,7]      [,8]
     [1,] 0.000000 3.065756 3.659457 2.911593 2.028289 3.313878 2.253666 3.6675947
     [2,] 3.065756 0.000000 4.436090 5.245863 2.881512 3.354759 4.104878 2.9974192
     [3,] 3.659457 4.436090 0.000000 3.164140 2.185135 2.240367 3.213737 2.7465299
     [4,] 2.911593 5.245863 3.164140 0.000000 2.706227 4.320227 3.470171 4.7088505
     [5,] 2.028289 2.881512 2.185135 2.706227 0.000000 2.697824 2.405110 2.1860227
     [6,] 3.313878 3.354759 2.240367 4.320227 2.697824 0.000000 3.431404 2.9277000
     [7,] 2.253666 4.104878 3.213737 3.470171 2.405110 3.431404 0.000000 2.9839682
     [8,] 3.667595 2.997419 2.746530 4.708851 2.186023 2.927700 2.983968 0.0000000
     [9,] 3.748082 4.311350 3.234364 4.978094 3.769488 1.577960 3.479996 3.8924861
    [10,] 2.930631 2.564855 2.959137 4.364786 1.807781 2.922094 2.380072 0.8814192
              [,9]     [,10]
     [1,] 3.748082 2.9306312
     [2,] 4.311350 2.5648551
     [3,] 3.234364 2.9591366
     [4,] 4.978094 4.3647858
     [5,] 3.769488 1.8077812
     [6,] 1.577960 2.9220938
     [7,] 3.479996 2.3800718
     [8,] 3.892486 0.8814192
     [9,] 0.000000 3.7528693
    [10,] 3.752869 0.0000000
    



<br>




#### Mahalanobis Distance Matrix in `Python` <a class="anchor" id="46"></a>


```python
def Dist_Mahalanobis_Matrix_Python(Quantitative_Data_set):

    M = np.zeros((Quantitative_Data_set.shape[0] , Quantitative_Data_set.shape[0]))

    for i in range(0 , Quantitative_Data_set.shape[0]):
        for j in range(0 , Quantitative_Data_set.shape[0]):

            M[i,j] = Dist_Mahalanobis_Python(i+1,j+1, Quantitative_Data_set)
                 
    return M
```


```python
Dist_Mahalanobis_Matrix_Python(Quantitative_Data_Python)
```




    array([[0.        , 3.06575559, 3.65945678, 2.91159323, 2.02828882,
            3.31387783, 2.2536659 , 3.6675947 , 3.74808193, 2.93063116,
            1.20777713, 2.48924638, 2.86494136, 0.63744005, 2.92199743,
            2.43287692, 3.68741867, 3.3598746 , 2.31702225, 3.1452949 ,
            2.78518099, 2.45834183, 2.57188489, 1.9361286 , 1.16208643,
            2.60123211, 2.0085199 , 1.48198231, 1.14724136, 1.38300327,
            2.75642098, 2.44253703, 3.04833307, 2.1301019 , 2.1528517 ,
            3.24154747, 1.82217706, 2.21775338, 3.62872004, 1.94193856,
            2.49822145, 0.90434336, 1.86265239, 2.83403814, 1.56739763,
            4.61260177, 2.9518337 , 1.59849624, 2.5369823 , 2.99682363],
           [3.06575559, 0.        , 4.43609031, 5.24586333, 2.8815118 ,
            3.35475863, 4.10487849, 2.9974192 , 4.31135044, 2.56485509,
            2.07776841, 4.09745691, 2.12327037, 2.88009606, 4.45812274,
            3.43374003, 2.4125535 , 2.56302348, 4.01420404, 1.3951464 ,
            2.72827177, 1.60001479, 3.64219098, 2.79561475, 3.98995513,
            3.52946946, 3.10850847, 3.4010338 , 2.66080375, 2.05758269,
            2.73123324, 3.47404815, 3.95190752, 3.43178787, 3.04218663,
            3.68803333, 1.8239665 , 3.84311551, 5.26323693, 2.30340147,
            2.90529163, 2.99770507, 3.87176616, 3.52540537, 2.85688533,
            4.65050417, 2.80129999, 3.5254465 , 2.50016053, 2.69734064],
            
            ...
            
           [2.99682363, 2.69734064, 2.9336163 , 4.16519135, 2.61653857,
            1.473196  , 4.01652656, 3.44619088, 2.7042963 , 3.28980179,
            2.63911787, 2.49434219, 1.16892187, 2.7702455 , 3.09804015,
            2.57530536, 2.20392346, 1.18068456, 2.15129206, 2.77883055,
            1.82686142, 1.16573092, 3.00970777, 1.26774315, 3.63220222,
            3.11869355, 1.41203872, 3.11916253, 2.09166124, 3.15895906,
            2.6424331 , 4.71328699, 4.01615843, 2.63627118, 1.26926797,
            3.52221651, 2.24580273, 2.18635429, 3.77902074, 1.7971082 ,
            2.92216261, 3.51650149, 2.53526236, 1.98068595, 1.66707395,
            4.18425128, 0.67961767, 2.1516245 , 1.28303147, 0.        ]])





<br>

<br>



# Distancias con variables estadisticas categoricas <a class="anchor" id="47"></a>

## Similaridad <a class="anchor" id="48"></a>

Es un concepto que expresa la proximidad o similaridad entre un par de elementos cualesquiera.


Dado un conjunto cualquiera $\hspace{0.1cm}A$



Se denomina similaridad a toda función $\hspace{0.1cm} \phi : A \text{x} A \rightarrow \mathbb{R}\hspace{0.1cm}$   such that:

1) $\hspace{0.2cm} \phi(i , r) \in [0,1] \hspace{0.45cm}  \forall i,r \in A \\$

2) $\hspace{0.2cm} \phi(i, i) = 1  \hspace{0.45cm}  \forall i,r \in A \\$

3)  $\hspace{0.2cm} \phi(i , r) = \phi(r, i)  \hspace{0.45cm}  \forall i,r \in A$

 

<br>


## Matriz de Similaridades  <a class="anchor" id="49"></a>

Dada una similaridad $s$ definida sobre el conjunto $A=\lbrace a_1 ,..., a_n \rbrace$

Se define la matriz de similaridades $\phi$ sobre $A$ como:
Definimos la matriz de similaridades 

$$
\mathcal{S}= \begin{pmatrix}
\phi_{11} &\phi_{12}&...&\phi_{1n}\\
\phi_{21} & \phi_{22}&...&\phi_{2n}\\
...&...&...&...\\
\phi_{n1}& \phi_{n2}&...& \phi_{nn}\\
\end{pmatrix} \\
$$



Donde:

$\phi_{ir} = \phi(a_i , a_r) \hspace{0.45cm}  \forall i, j =1,...,n$




## Pasar de similaridad a distancia  <a class="anchor" id="50"></a>

 
Las siguientes transformaciones nos permiten pasar de una similaridad a una distancia:

1) $\hspace{0.25cm} \phi_{ir}=1- \phi_{ir} \\$


2) $\hspace{0.25cm} \phi_{ir}=\sqrt{1-\phi_{ir}} \\$

3) Gower transformation: $\hspace{0.25cm} \phi^2_{ir} = \phi_{ii} + \phi_{jj} - 2\cdot \phi_{ij}$



<br>




# Similaridades con variables categoricas binarias <a class="anchor" id="51"></a>

Dada una muestra de $n$  elementos/individuos $\hspace{0.1cm}\Omega = \lbrace e_1,e_2,...,e_n \rbrace$ 

Dada una serie de variables estadisticas **categóricas binarias** $\hspace{0.1cm}\mathcal{X}_1,...,\mathcal{X}_p$

Para cada variable binaria $\mathcal{X}_j$ tenemos una muestra de $n$ observaciones $X_j$  basada en la muestra de $n$ individuos $\hspace{0.1cm}\Omega$

 
Es decir, tenemos lo siguiente:

- $\hspace{0.1cm}X_j=(x_{j1},...,x_{jn})^t$ , para $j=1,...,p \\$

- $\hspace{0.1cm}x_{ji}\hspace{0.1cm}$ es la observación de la variable $\hspace{0.1cm}\mathcal{X}_j\hspace{0.1cm}$ para el individuo $\hspace{0.1cm}e_i\hspace{0.1cm}$ de la muestra $\hspace{0.1cm}\Omega$ , para $\hspace{0.1cm}j=1,...,p\hspace{0.1cm}$ y $\hspace{0.1cm}i=1,...,n \\$



Por tanto:

- $\hspace{0.1cm}X_j=(x_{j1},...,x_{jn})^t\hspace{0.1cm}$ es el vector con las observaciones de la variable para los individuos de la muestra $\Omega$  , para $j=1,...,p \\$

- $\hspace{0.1cm}x_i = (x_{1i} , x_{2i} ,..., x_{pi})^t\hspace{0.1cm}$ es el vector con las observaciones de las variables  $\hspace{0.1cm}\mathcal{X}_1,...,\mathcal{X}_p\hspace{0.1cm}$ para el individuo $\hspace{0.1cm}e_i\hspace{0.1cm}$ de $\hspace{0.1cm}\Omega$ , para $\hspace{0.1cm}i=1,...,n$



<br>



Los principales coeficientes de similaridad involucran algunos de los siguientes parametros:

 - $\hspace{0.2cm} a_{ir}\hspace{0.1cm}=\hspace{0.1cm}$ nº de variables binarias $\hspace{0.1cm}\mathcal{X}_j\hspace{0.1cm}$ tales que $\hspace{0.1cm} x_{ij} = x_{rj}=1 \\$ 
 
  
 $$\hspace{0.2cm} a_{ir} \hspace{0.15cm} = \hspace{0.15cm} \#\hspace{0.1cm} \lbrace \hspace{0.1cm}  j= 1,..,p \hspace{0.15cm}/\hspace{0.15cm} x_{ij}=x_{rj}=1  \hspace{0.1cm}  \rbrace \\[0.5cm]$$

 - $\hspace{0.2cm} b_{ir}\hspace{0.1cm}=\hspace{0.1cm}$ nº de variables binarias  $\hspace{0.1cm}\mathcal{X}_j\hspace{0.1cm}$ tales que $\hspace{0.1cm}x_{ij} =0\hspace{0.15cm}$ y $\hspace{0.15cm}x_{rj}=1 \\$ 


 $$\hspace{0.2cm} b_{ir} \hspace{0.15cm} = \hspace{0.15cm} \#\hspace{0.1cm} \lbrace \hspace{0.1cm}  j= 1,..,p \hspace{0.15cm}/\hspace{0.15cm} x_{ij}=0 \hspace{0.2cm}\text{y}\hspace{0.2cm} x_{rj}=1  \hspace{0.1cm}  \rbrace \\[0.5cm]$$


 - $\hspace{0.2cm} c_{ir}\hspace{0.1cm}=\hspace{0.1cm}$ nº  de variables binarias $\hspace{0.1cm}\mathcal{X}_j\hspace{0.1cm}$ tales que $\hspace{0.1cm}x_{ij} =1\hspace{0.15cm}$ y $\hspace{0.15cm}x_{rj}=0 \\$


 $$\hspace{0.2cm} c_{ir} \hspace{0.15cm} = \hspace{0.15cm} \#\hspace{0.1cm} \lbrace \hspace{0.1cm}  j= 1,..,p \hspace{0.15cm}/\hspace{0.15cm} x_{ij}=1 \hspace{0.2cm}\text{y}\hspace{0.2cm} x_{rj}=0  \hspace{0.1cm}  \rbrace \\[0.5cm]$$



 - $\hspace{0.2cm} d_{ij}\hspace{0.1cm}=\hspace{0.1cm}$ nº  de variables binarias $\hspace{0.1cm}\mathcal{X}_j\hspace{0.1cm}$ tales que $\hspace{0.1cm}x_{ij} =0 \hspace{0.15cm}$ y $\hspace{0.15cm}x_{rj}=0 \\$
 
 $$\hspace{0.2cm} d_{ir} \hspace{0.15cm} = \hspace{0.15cm} \#\hspace{0.1cm} \lbrace \hspace{0.1cm}  j= 1,..,p \hspace{0.15cm}/\hspace{0.15cm} x_{ij}=0 \hspace{0.2cm}\text{y}\hspace{0.2cm} x_{rj}=0  \hspace{0.1cm}  \rbrace \\[0.5cm]$$
 
 

 **Observación:**

$\hspace{0.2cm} a_{ij} + b_{ij} + c_{ij} +d_{ij} =p$




<br>




## Matrices con los parametros a, b, c y d <a class="anchor" id="52"></a>




Dada una matriz de datos $\hspace{0.05cm}X=(X_1,...,X_p)\hspace{0.05cm}$  de  variables  **categoricas binarias**

Dadas las matrices $\hspace{0.1cm} a=(a_{ir})_{i,r=1:n}\hspace{0.1cm}$ ,  $\hspace{0.1cm}b=(b_{ir})_{i,r=1:n}\hspace{0.1cm}$,  $\hspace{0.1cm}c=(c_{ir})_{i,r=1:n}\hspace{0.1cm}$ y  $\hspace{0.1cm}d=(d_{ir})_{i,r=1:n}$ 

Estas matrices pueden expresarse del siguiente modo: $\\[0.4cm]$


- $a = X\cdot X^t \\$

- $b=(\overrightarrow{1}_{nxp} - X)\cdot X\hspace{0.03cm}^t\\$

- $c=b\hspace{0.03cm}^t \\$

- $d=(\overrightarrow{1}_{nxp} - X)\cdot(\overrightarrow{1}_{nxp} - X)\hspace{0.03cm}^t \\$



  




<br>




### Calculo las matrices a, b , c y d en `R`   <a class="anchor" id="53"></a>


```r
%%R

Binary_Data <- Data_set_R %>% select(5:7)

Binary_Data <- as.matrix(Binary_Data)
```


```r
%%R

head(Binary_Data)
```

         X5 X6 X7
    [1,]  0  0  1
    [2,]  1  1  1
    [3,]  1  0  0
    [4,]  0  1  0
    [5,]  0  1  0
    [6,]  1  1  1
    




```r
%%R

a = Binary_Data %*% t(Binary_Data)

unos<- rep(1, dim(Binary_Data)[2])

Ones_Matrix <- matrix( rep(unos, dim(Binary_Data)[1]), ncol=dim(Binary_Data)[2]) #Matriz de unos de tamano nxp

b = (Ones_Matrix-Binary_Data)%*%t(Binary_Data)

c = t(b)

d = (Ones_Matrix - Binary_Data)%*%t(Ones_Matrix - Binary_Data) 
```


```r
%%R

a[1:10,1:10]
```

          [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9] [,10]
     [1,]    1    1    0    0    0    1    0    0    1     1
     [2,]    1    3    1    1    1    3    2    2    1     2
     [3,]    0    1    1    0    0    1    1    1    0     0
     [4,]    0    1    0    1    1    1    1    1    0     1
     [5,]    0    1    0    1    1    1    1    1    0     1
     [6,]    1    3    1    1    1    3    2    2    1     2
     [7,]    0    2    1    1    1    2    2    2    0     1
     [8,]    0    2    1    1    1    2    2    2    0     1
     [9,]    1    1    0    0    0    1    0    0    1     1
    [10,]    1    2    0    1    1    2    1    1    1     2
    


```r
%%R

b[1:10,1:10]
```

          [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9] [,10]
     [1,]    0    2    1    1    1    2    2    2    0     1
     [2,]    0    0    0    0    0    0    0    0    0     0
     [3,]    1    2    0    1    1    2    1    1    1     2
     [4,]    1    2    1    0    0    2    1    1    1     1
     [5,]    1    2    1    0    0    2    1    1    1     1
     [6,]    0    0    0    0    0    0    0    0    0     0
     [7,]    1    1    0    0    0    1    0    0    1     1
     [8,]    1    1    0    0    0    1    0    0    1     1
     [9,]    0    2    1    1    1    2    2    2    0     1
    [10,]    0    1    1    0    0    1    1    1    0     0
    


```r
%%R

c[1:10,1:10]
```

          [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9] [,10]
     [1,]    0    0    1    1    1    0    1    1    0     0
     [2,]    2    0    2    2    2    0    1    1    2     1
     [3,]    1    0    0    1    1    0    0    0    1     1
     [4,]    1    0    1    0    0    0    0    0    1     0
     [5,]    1    0    1    0    0    0    0    0    1     0
     [6,]    2    0    2    2    2    0    1    1    2     1
     [7,]    2    0    1    1    1    0    0    0    2     1
     [8,]    2    0    1    1    1    0    0    0    2     1
     [9,]    0    0    1    1    1    0    1    1    0     0
    [10,]    1    0    2    1    1    0    1    1    1     0
    


```r
%%R

d[1:10,1:10]
```

          [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9] [,10]
     [1,]    2    0    1    1    1    0    0    0    2     1
     [2,]    0    0    0    0    0    0    0    0    0     0
     [3,]    1    0    2    1    1    0    1    1    1     0
     [4,]    1    0    1    2    2    0    1    1    1     1
     [5,]    1    0    1    2    2    0    1    1    1     1
     [6,]    0    0    0    0    0    0    0    0    0     0
     [7,]    0    0    1    1    1    0    1    1    0     0
     [8,]    0    0    1    1    1    0    1    1    0     0
     [9,]    2    0    1    1    1    0    0    0    2     1
    [10,]    1    0    0    1    1    0    0    0    1     1
    



<br>




### Calculo las matrices a, b , c y d en   `Python`   <a class="anchor" id="54"></a>


```python
Binary_Data_Py = Data_set_Python.iloc[ : , 4:7]
```


```python
Binary_Data_Py.head()
```




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
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>X5</th>
      <th>X6</th>
      <th>X7</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>3</th>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
    </tr>
  </tbody>
</table>
</div>






```python
X = Binary_Data_Py

a = X @ X.T

n = X.shape[0]

p = X.shape[1]

ones_matrix = np.ones((n, p)) 

b = (ones_matrix - X) @ X.T

c = b.T

d = (ones_matrix - X) @ (ones_matrix - X).T
```


```python
a.iloc[0:10 , 0:10]
```




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
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>0</th>
      <th>1</th>
      <th>2</th>
      <th>3</th>
      <th>4</th>
      <th>5</th>
      <th>6</th>
      <th>7</th>
      <th>8</th>
      <th>9</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>1.0</td>
      <td>3.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>3.0</td>
      <td>2.0</td>
      <td>2.0</td>
      <td>1.0</td>
      <td>2.0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>3</th>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
    </tr>
    <tr>
      <th>5</th>
      <td>1.0</td>
      <td>3.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>3.0</td>
      <td>2.0</td>
      <td>2.0</td>
      <td>1.0</td>
      <td>2.0</td>
    </tr>
    <tr>
      <th>6</th>
      <td>0.0</td>
      <td>2.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>2.0</td>
      <td>2.0</td>
      <td>2.0</td>
      <td>0.0</td>
      <td>1.0</td>
    </tr>
    <tr>
      <th>7</th>
      <td>0.0</td>
      <td>2.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>2.0</td>
      <td>2.0</td>
      <td>2.0</td>
      <td>0.0</td>
      <td>1.0</td>
    </tr>
    <tr>
      <th>8</th>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
    </tr>
    <tr>
      <th>9</th>
      <td>1.0</td>
      <td>2.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>2.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>2.0</td>
    </tr>
  </tbody>
</table>
</div>




```python
b.iloc[0:10 , 0:10]
```




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
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>0</th>
      <th>1</th>
      <th>2</th>
      <th>3</th>
      <th>4</th>
      <th>5</th>
      <th>6</th>
      <th>7</th>
      <th>8</th>
      <th>9</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>0.0</td>
      <td>2.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>2.0</td>
      <td>2.0</td>
      <td>2.0</td>
      <td>0.0</td>
      <td>1.0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>1.0</td>
      <td>2.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>2.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>2.0</td>
    </tr>
    <tr>
      <th>3</th>
      <td>1.0</td>
      <td>2.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>2.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>1.0</td>
      <td>2.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>2.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
    </tr>
    <tr>
      <th>5</th>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>6</th>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
    </tr>
    <tr>
      <th>7</th>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
    </tr>
    <tr>
      <th>8</th>
      <td>0.0</td>
      <td>2.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>2.0</td>
      <td>2.0</td>
      <td>2.0</td>
      <td>0.0</td>
      <td>1.0</td>
    </tr>
    <tr>
      <th>9</th>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
  </tbody>
</table>
</div>




```python
c.iloc[0:10 , 0:10]
```




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
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>0</th>
      <th>1</th>
      <th>2</th>
      <th>3</th>
      <th>4</th>
      <th>5</th>
      <th>6</th>
      <th>7</th>
      <th>8</th>
      <th>9</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2.0</td>
      <td>0.0</td>
      <td>2.0</td>
      <td>2.0</td>
      <td>2.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>2.0</td>
      <td>1.0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
    </tr>
    <tr>
      <th>3</th>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>5</th>
      <td>2.0</td>
      <td>0.0</td>
      <td>2.0</td>
      <td>2.0</td>
      <td>2.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>2.0</td>
      <td>1.0</td>
    </tr>
    <tr>
      <th>6</th>
      <td>2.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>2.0</td>
      <td>1.0</td>
    </tr>
    <tr>
      <th>7</th>
      <td>2.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>2.0</td>
      <td>1.0</td>
    </tr>
    <tr>
      <th>8</th>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>9</th>
      <td>1.0</td>
      <td>0.0</td>
      <td>2.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
    </tr>
  </tbody>
</table>
</div>




```python
d.iloc[0:10 , 0:10]
```




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
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>0</th>
      <th>1</th>
      <th>2</th>
      <th>3</th>
      <th>4</th>
      <th>5</th>
      <th>6</th>
      <th>7</th>
      <th>8</th>
      <th>9</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>2.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>2.0</td>
      <td>1.0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>1.0</td>
      <td>0.0</td>
      <td>2.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>3</th>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>2.0</td>
      <td>2.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>2.0</td>
      <td>2.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
    </tr>
    <tr>
      <th>5</th>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>6</th>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>7</th>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>8</th>
      <td>2.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>2.0</td>
      <td>1.0</td>
    </tr>
    <tr>
      <th>9</th>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
    </tr>
  </tbody>
</table>
</div>





<br>

<br>



## Similaridad de Sokal <a class="anchor" id="55"></a>

El coeficiente de similaridad de Sokal (o simplemente la similaridad de Sokal) entre el par de observaciones $\hspace{0.1cm}(x_i , x_r)\hspace{0.1cm}$ de las variables binarias $\hspace{0.1cm}\mathcal{X}_1,..., \mathcal{X}_p\hspace{0.1cm}$ se define como: $\\[0.4cm]$



\begin{gather*}
\phi (i,r)_{Sokal}  =\dfrac{a_{ir}+d_{ir} }{ a_{ir} + b_{ir} + c_{ir} +d_{ir}} = \dfrac{a_{ir}+d_{ir}}{p} 
\end{gather*}


<br>


## Distancia de Sokal   <a class="anchor" id="56"></a>


Podemos obtener la distancia de Sokal entre el par de observaciones $\hspace{0.1cm}(x_i , x_r)\hspace{0.1cm}$ de las variables binarias $\hspace{0.1cm}\mathcal{X}_1,..., \mathcal{X}_p\hspace{0.1cm}$ como sigue:  $\\[0.4cm]$



\begin{gather*}
\delta(i,r)_{Sokal} = \sqrt{\phi(i,i)_{Sokal} + \phi(r,r)_{Sokal} - 2\cdot \phi(i,r)_{Sokal} }
\end{gather*}





<br>


###  Similaridad de Sokal en `R` <a class="anchor" id="57"></a>



```r
%%R

Sokal_Similarity_R <- function(i,j,   Binary_Data_Matrix){
  
  Binary_Data_Matrix=as.matrix(Binary_Data_Matrix)

  
  a= Binary_Data_Matrix %*% t(Binary_Data_Matrix)
  
  Ones <- rep(1, dim(Binary_Data_Matrix)[2])

  #Matriz de unos de tamano nxp :
  Ones_Matrix <- matrix( rep(Ones, dim(Binary_Data_Matrix)[1]), ncol=dim(Binary_Data_Matrix)[2]) 
  
  b=(Ones_Matrix-Binary_Data_Matrix)%*%t(Binary_Data_Matrix)
  
  c= t(b)
  
  d= (Ones_Matrix - Binary_Data_Matrix)%*%t(Ones_Matrix -     
      Binary_Data_Matrix) 


Sokal_Similarity  = (a[i,j] + d[i,j]) /  dim(Binary_Data_Matrix)[2] 
  
return(Sokal_Similarity)
}
```


```r
%%R

Sokal_Similarity_R(1, 2, Binary_Data)
```

    [1] 0.3333333
    


```r
%%R

Sokal_Similarity_R(7,8, Binary_Data)
```

    [1] 1
    



 



###  Similaridad de Sokal en `Python` <a class="anchor" id="587"></a>



```python
X = Binary_Data_Py.to_numpy()

a = X @ X.T

n = X.shape[0]

p = X.shape[1]

ones_matrix = np.ones((n, p)) 

b = (ones_matrix - X) @ X.T

c = b.T

d = (ones_matrix - X) @ (ones_matrix - X).T
```


```python
def Sokal_Similarity_Py(i, j):

    if a[i-1,j-1] + d[i-1,j-1] == 0 :

        Sokal_Similarity = 0

        
    else :

        Sokal_Similarity = (a[i-1,j-1] + d[i-1,j-1]) / p
        

    return Sokal_Similarity
```


```python
Sokal_Similarity_Py(1, 2)
```




    0.3333333333333333




```python
Sokal_Similarity_Py(7, 8)
```




    1.0





<br>



###  Matriz de similaridades de Sokal en `R` <a class="anchor" id="59"></a>



```r
%%R

Sokal_Similarity_Matrix <- function( Binary_Data_Matrix ){
  
  Binary_Data_Matrix=as.matrix(Binary_Data_Matrix)

  M<-matrix(NA, ncol =dim(Binary_Data_Matrix)[1] , nrow=dim(Binary_Data_Matrix)[1] )
  
  for(i in 1:dim(Binary_Data_Matrix)[1] ){
    for(j in 1:dim(Binary_Data_Matrix)[1]){
    
  M[i,j]=Sokal_Similarity_R(i,j,  Binary_Data_Matrix)
  
   }
  }
 return(M)
}
```


```r
%%R

Sokal_Similarity_Matrix(Binary_Data)[1:10,1:10]
```

               [,1]      [,2]      [,3]      [,4]      [,5]      [,6]      [,7]
     [1,] 1.0000000 0.3333333 0.3333333 0.3333333 0.3333333 0.3333333 0.0000000
     [2,] 0.3333333 1.0000000 0.3333333 0.3333333 0.3333333 1.0000000 0.6666667
     [3,] 0.3333333 0.3333333 1.0000000 0.3333333 0.3333333 0.3333333 0.6666667
     [4,] 0.3333333 0.3333333 0.3333333 1.0000000 1.0000000 0.3333333 0.6666667
     [5,] 0.3333333 0.3333333 0.3333333 1.0000000 1.0000000 0.3333333 0.6666667
     [6,] 0.3333333 1.0000000 0.3333333 0.3333333 0.3333333 1.0000000 0.6666667
     [7,] 0.0000000 0.6666667 0.6666667 0.6666667 0.6666667 0.6666667 1.0000000
     [8,] 0.0000000 0.6666667 0.6666667 0.6666667 0.6666667 0.6666667 1.0000000
     [9,] 1.0000000 0.3333333 0.3333333 0.3333333 0.3333333 0.3333333 0.0000000
    [10,] 0.6666667 0.6666667 0.0000000 0.6666667 0.6666667 0.6666667 0.3333333
               [,8]      [,9]     [,10]
     [1,] 0.0000000 1.0000000 0.6666667
     [2,] 0.6666667 0.3333333 0.6666667
     [3,] 0.6666667 0.3333333 0.0000000
     [4,] 0.6666667 0.3333333 0.6666667
     [5,] 0.6666667 0.3333333 0.6666667
     [6,] 0.6666667 0.3333333 0.6666667
     [7,] 1.0000000 0.0000000 0.3333333
     [8,] 1.0000000 0.0000000 0.3333333
     [9,] 0.0000000 1.0000000 0.6666667
    [10,] 0.3333333 0.6666667 1.0000000
    



<br>



###  Matriz de similaridades de Sokal en `Python` <a class="anchor" id="59"></a>


```python
def Sim_Sokal_Matrix_Python(Binary_Data_set):

    M = np.zeros((Binary_Data_set.shape[0] , Binary_Data_set.shape[0]))

    for i in range(0 , Binary_Data_set.shape[0]):
        for j in range(0 , Binary_Data_set.shape[0]):
 
            M[i,j] = Sokal_Similarity_Py(i+1, j+1)
                
    return M
```


```python
Sim_Sokal_Matrix_Python(Binary_Data_Py)
```




    array([[1.        , 0.33333333, 0.33333333, 0.33333333, 0.33333333,
            0.33333333, 0.        , 0.        , 1.        , 0.66666667,
            0.33333333, 0.66666667, 0.66666667, 0.33333333, 0.        ,
            0.33333333, 0.66666667, 0.33333333, 1.        , 0.66666667,
            0.33333333, 0.66666667, 0.66666667, 0.        , 0.33333333,
            0.        , 0.66666667, 0.66666667, 0.33333333, 0.33333333,
            0.66666667, 0.66666667, 0.66666667, 0.66666667, 0.66666667,
            0.33333333, 0.66666667, 0.33333333, 1.        , 1.        ,
            0.33333333, 1.        , 0.66666667, 0.66666667, 0.66666667,
            0.33333333, 0.66666667, 0.33333333, 0.        , 0.66666667],
           [0.33333333, 1.        , 0.33333333, 0.33333333, 0.33333333,
            1.        , 0.66666667, 0.66666667, 0.33333333, 0.66666667,
            0.33333333, 0.66666667, 0.        , 0.33333333, 0.66666667,
            0.33333333, 0.66666667, 1.        , 0.33333333, 0.66666667,
            0.33333333, 0.        , 0.        , 0.66666667, 0.33333333,
            0.66666667, 0.66666667, 0.        , 1.        , 0.33333333,
            0.66666667, 0.        , 0.        , 0.66666667, 0.66666667,
            0.33333333, 0.66666667, 1.        , 0.33333333, 0.33333333,
            0.33333333, 0.33333333, 0.66666667, 0.        , 0.66666667,
            0.33333333, 0.66666667, 0.33333333, 0.66666667, 0.66666667],
           [0.33333333, 0.33333333, 1.        , 0.33333333, 0.33333333,
            0.33333333, 0.66666667, 0.66666667, 0.33333333, 0.        ,
            1.        , 0.        , 0.66666667, 0.33333333, 0.66666667,
            0.33333333, 0.66666667, 0.33333333, 0.33333333, 0.        ,
            1.        , 0.66666667, 0.66666667, 0.66666667, 1.        ,
            0.66666667, 0.        , 0.66666667, 0.33333333, 0.33333333,
            0.66666667, 0.66666667, 0.66666667, 0.        , 0.        ,
            0.33333333, 0.        , 0.33333333, 0.33333333, 0.33333333,
            0.33333333, 0.33333333, 0.66666667, 0.66666667, 0.66666667,
            0.33333333, 0.66666667, 0.33333333, 0.66666667, 0.        ],
            
                ...
   
           [0.66666667, 0.66666667, 0.        , 0.66666667, 0.66666667,
            0.66666667, 0.33333333, 0.33333333, 0.66666667, 1.        ,
            0.        , 1.        , 0.33333333, 0.66666667, 0.33333333,
            0.66666667, 0.33333333, 0.66666667, 0.66666667, 1.        ,
            0.        , 0.33333333, 0.33333333, 0.33333333, 0.        ,
            0.33333333, 1.        , 0.33333333, 0.66666667, 0.66666667,
            0.33333333, 0.33333333, 0.33333333, 1.        , 1.        ,
            0.66666667, 1.        , 0.66666667, 0.66666667, 0.66666667,
            0.66666667, 0.66666667, 0.33333333, 0.33333333, 0.33333333,
            0.66666667, 0.33333333, 0.66666667, 0.33333333, 1.        ]])





<br>



###  Distancia de Sokal en `R` <a class="anchor" id="61"></a>


```r
%%R

Dist_Sokal_R <- function(i,j,   Binary_Data){

Binary_Data=as.matrix(Binary_Data)
  
Dist_Sokal  = sqrt( Sokal_Similarity_R(i,i,   Binary_Data) + Sokal_Similarity_R(j,j,   Binary_Data) - 2*Sokal_Similarity_R(i,j,   Binary_Data)  )
  
return( Dist_Sokal )
}
```


```r
%%R

Dist_Sokal_R(1, 2, Binary_Data)
```

    [1] 1.154701
    



<br>



### Distancia de Sokal en `Python` <a class="anchor" id="62"></a>


```python
def Dist_Sokal_Python(i, j):

    dist_Sokal = np.sqrt( 2 - 2*Sokal_Similarity_Py(i,j) )

    return dist_Sokal    
```


```python
Dist_Sokal_Python(1,2)
```




    1.1547005383792517





<br>



###  Matriz de distancias de Sokal en `R` <a class="anchor" id="63"></a>


```r
%%R

Dist_Sokal_Matrix_R <- function( Binary_Data ){
  
  Binary_Data=as.matrix(Binary_Data)

  M<-matrix(NA, ncol =dim(Binary_Data)[1] , nrow=dim(Binary_Data)[1] )
  
  for(i in 1:dim(Binary_Data)[1] ){
    for(j in 1:dim(Binary_Data)[1]){
    
  M[i,j]=Dist_Sokal_R(i,j,  Binary_Data)
  
   }
  }
 return(M)
}
```


```r
%%R

Dist_Sokal_Matrix_R(Binary_Data)[1:10,1:10]
```

               [,1]      [,2]      [,3]      [,4]      [,5]      [,6]      [,7]
     [1,] 0.0000000 1.1547005 1.1547005 1.1547005 1.1547005 1.1547005 1.4142136
     [2,] 1.1547005 0.0000000 1.1547005 1.1547005 1.1547005 0.0000000 0.8164966
     [3,] 1.1547005 1.1547005 0.0000000 1.1547005 1.1547005 1.1547005 0.8164966
     [4,] 1.1547005 1.1547005 1.1547005 0.0000000 0.0000000 1.1547005 0.8164966
     [5,] 1.1547005 1.1547005 1.1547005 0.0000000 0.0000000 1.1547005 0.8164966
     [6,] 1.1547005 0.0000000 1.1547005 1.1547005 1.1547005 0.0000000 0.8164966
     [7,] 1.4142136 0.8164966 0.8164966 0.8164966 0.8164966 0.8164966 0.0000000
     [8,] 1.4142136 0.8164966 0.8164966 0.8164966 0.8164966 0.8164966 0.0000000
     [9,] 0.0000000 1.1547005 1.1547005 1.1547005 1.1547005 1.1547005 1.4142136
    [10,] 0.8164966 0.8164966 1.4142136 0.8164966 0.8164966 0.8164966 1.1547005
               [,8]      [,9]     [,10]
     [1,] 1.4142136 0.0000000 0.8164966
     [2,] 0.8164966 1.1547005 0.8164966
     [3,] 0.8164966 1.1547005 1.4142136
     [4,] 0.8164966 1.1547005 0.8164966
     [5,] 0.8164966 1.1547005 0.8164966
     [6,] 0.8164966 1.1547005 0.8164966
     [7,] 0.0000000 1.4142136 1.1547005
     [8,] 0.0000000 1.4142136 1.1547005
     [9,] 1.4142136 0.0000000 0.8164966
    [10,] 1.1547005 0.8164966 0.0000000
    



<br>



###  Matriz de distancias de Sokal en `Python` <a class="anchor" id="63"></a>


```python
def Dist_Sokal_Matrix_Python(Binary_Data_set):

    M = np.zeros((Binary_Data_set.shape[0] , Binary_Data_set.shape[0]))

    for i in range(0 , Binary_Data_set.shape[0]):
        for j in range(0 , Binary_Data_set.shape[0]):

            M[i,j] = Dist_Sokal_Python(i+1, j+1)
                 
    return M
```


```python
Dist_Sokal_Matrix_Python(Binary_Data_Py)
```




    array([[0.        , 1.15470054, 1.15470054, 1.15470054, 1.15470054,
            1.15470054, 1.41421356, 1.41421356, 0.        , 0.81649658,
            1.15470054, 0.81649658, 0.81649658, 1.15470054, 1.41421356,
            1.15470054, 0.81649658, 1.15470054, 0.        , 0.81649658,
            1.15470054, 0.81649658, 0.81649658, 1.41421356, 1.15470054,
            1.41421356, 0.81649658, 0.81649658, 1.15470054, 1.15470054,
            0.81649658, 0.81649658, 0.81649658, 0.81649658, 0.81649658,
            1.15470054, 0.81649658, 1.15470054, 0.        , 0.        ,
            1.15470054, 0.        , 0.81649658, 0.81649658, 0.81649658,
            1.15470054, 0.81649658, 1.15470054, 1.41421356, 0.81649658],
           [1.15470054, 0.        , 1.15470054, 1.15470054, 1.15470054,
            0.        , 0.81649658, 0.81649658, 1.15470054, 0.81649658,
            1.15470054, 0.81649658, 1.41421356, 1.15470054, 0.81649658,
            1.15470054, 0.81649658, 0.        , 1.15470054, 0.81649658,
            1.15470054, 1.41421356, 1.41421356, 0.81649658, 1.15470054,
            0.81649658, 0.81649658, 1.41421356, 0.        , 1.15470054,
            0.81649658, 1.41421356, 1.41421356, 0.81649658, 0.81649658,
            1.15470054, 0.81649658, 0.        , 1.15470054, 1.15470054,
            1.15470054, 1.15470054, 0.81649658, 1.41421356, 0.81649658,
            1.15470054, 0.81649658, 1.15470054, 0.81649658, 0.81649658],
           [1.15470054, 1.15470054, 0.        , 1.15470054, 1.15470054,
            1.15470054, 0.81649658, 0.81649658, 1.15470054, 1.41421356,
            0.        , 1.41421356, 0.81649658, 1.15470054, 0.81649658,
            1.15470054, 0.81649658, 1.15470054, 1.15470054, 1.41421356,
            0.        , 0.81649658, 0.81649658, 0.81649658, 0.        ,
            0.81649658, 1.41421356, 0.81649658, 1.15470054, 1.15470054,
            0.81649658, 0.81649658, 0.81649658, 1.41421356, 1.41421356,
            1.15470054, 1.41421356, 1.15470054, 1.15470054, 1.15470054,
            1.15470054, 1.15470054, 0.81649658, 0.81649658, 0.81649658,
            1.15470054, 0.81649658, 1.15470054, 0.81649658, 1.41421356],
            
            ...
            
           [0.81649658, 0.81649658, 1.41421356, 0.81649658, 0.81649658,
            0.81649658, 1.15470054, 1.15470054, 0.81649658, 0.        ,
            1.41421356, 0.        , 1.15470054, 0.81649658, 1.15470054,
            0.81649658, 1.15470054, 0.81649658, 0.81649658, 0.        ,
            1.41421356, 1.15470054, 1.15470054, 1.15470054, 1.41421356,
            1.15470054, 0.        , 1.15470054, 0.81649658, 0.81649658,
            1.15470054, 1.15470054, 1.15470054, 0.        , 0.        ,
            0.81649658, 0.        , 0.81649658, 0.81649658, 0.81649658,
            0.81649658, 0.81649658, 1.15470054, 1.15470054, 1.15470054,
            0.81649658, 1.15470054, 0.81649658, 1.15470054, 0.        ]])





<br>

<br>
 



## Similaridad de Jaccard  <a class="anchor" id="65"></a>

El coeficiente de similaridad de Jaccard (o simplemente la similaridad de Sokal) entre el par de observaciones $\hspace{0.1cm}(x_i , x_r)\hspace{0.1cm}$ de las variables binarias $\hspace{0.1cm}\mathcal{X}_1,..., \mathcal{X}_p\hspace{0.1cm}$ se define como: $\\[0.4cm]$


\begin{gather*}
\phi(i,r)_{Jaccard}  = \dfrac{a_{ir} }{a_{ir} + b_{ir}+ c_{ir}} 
\end{gather*}


<br>


## Distancia de Jaccard    <a class="anchor" id="66"></a>


Podemos obtener la distancia de Jaccard entre el par de observaciones $\hspace{0.1cm}(x_i , x_r)\hspace{0.1cm}$ de las variables binarias $\hspace{0.1cm}\mathcal{X}_1,..., \mathcal{X}_p\hspace{0.1cm}$ como sigue:  $\\[0.4cm]$

\begin{gather*}
\delta(i,r)_{Jaccard} = \sqrt{\phi(i,i)_{Jaccard} + \phi(r,r)_{Jaccard} - 2\cdot \phi(i,r)_{Jaccard} }
\end{gather*}




<br>



### Similaridad de Jaccard en `R` <a class="anchor" id="67"></a>


```r
%%R

Jaccard_Similarity_R <- function(i,j,   Binary_Data_Matrix){
  
  Binary_Data_Matrix=as.matrix(Binary_Data_Matrix)
  
  a= Binary_Data_Matrix %*% t(Binary_Data_Matrix)
  
  Ones <- rep(1, dim(Binary_Data_Matrix)[2])

  #Matriz de unos de tamano nxp :
  Ones_Matrix <- matrix( rep(Ones, dim(Binary_Data_Matrix)[1]), ncol=dim(Binary_Data_Matrix)[2]) 
  
  b=(Ones_Matrix-Binary_Data_Matrix)%*%t(Binary_Data_Matrix)
  
  c= t(b)
  
  d= (Ones_Matrix - Binary_Data_Matrix)%*%t(Ones_Matrix -     
      Binary_Data_Matrix) 


Similaridad_Jaccard  = a[i,j]/(a[i,j] + b[i,j] + c[i,j])
  
return(Similaridad_Jaccard)
}
```


```r
%%R

Jaccard_Similarity_R(1,2, Binary_Data)
```

    [1] 0.3333333
    


```r
%%R

Jaccard_Similarity_R(8,9, Binary_Data)
```

    [1] 0
    



<br>



### Similaridad de Jaccard en `Python` <a class="anchor" id="67"></a>


```python
X = Binary_Data_Py.to_numpy()

a = X @ X.T

n = X.shape[0]

p = X.shape[1]

ones_matrix = np.ones((n, p)) 

b = (ones_matrix - X) @ X.T

c = b.T

d = (ones_matrix - X) @ (ones_matrix - X).T
```


```python
def Jaccard_Similarity_Py(i, j):

    if a[i-1,j-1] == 0 :

        Jaccard_Similarity = 0

    else :

        Jaccard_Similarity = a[i-1,j-1] / (a[i-1,j-1] + b[i-1,j-1] + c[i-1,j-1])


    return Jaccard_Similarity
```


```python
Jaccard_Similarity_Py(1, 2)
```




    0.3333333333333333




```python
Jaccard_Similarity_Py(8, 9)
```




    0.0





<br>


### Matriz de similaridades de Jaccard en `R` <a class="anchor" id="67"></a>


```r
%%R
Sim_Jaccard_Matrix_R <- function( Binary_Data_set ){
  
 Binary_Data_set=as.matrix(Binary_Data_set)

  
  M<-matrix(NA, ncol =dim(Binary_Data_set)[1] , nrow=dim(Binary_Data_set)[1] )
  
  for(i in 1:dim(Binary_Data_set)[1] ){
    for(j in 1:dim(Binary_Data_set)[1]){
    
  M[i,j]=Jaccard_Similarity_R(i,j,  Binary_Data_set)
  
   }
  }
 return(M)
}
```


```r
%%R

Sim_Jaccard_Matrix_R(Binary_Data)[1:10 , 1:10]
```

               [,1]      [,2]      [,3]      [,4]      [,5]      [,6]      [,7]
     [1,] 1.0000000 0.3333333 0.0000000 0.0000000 0.0000000 0.3333333 0.0000000
     [2,] 0.3333333 1.0000000 0.3333333 0.3333333 0.3333333 1.0000000 0.6666667
     [3,] 0.0000000 0.3333333 1.0000000 0.0000000 0.0000000 0.3333333 0.5000000
     [4,] 0.0000000 0.3333333 0.0000000 1.0000000 1.0000000 0.3333333 0.5000000
     [5,] 0.0000000 0.3333333 0.0000000 1.0000000 1.0000000 0.3333333 0.5000000
     [6,] 0.3333333 1.0000000 0.3333333 0.3333333 0.3333333 1.0000000 0.6666667
     [7,] 0.0000000 0.6666667 0.5000000 0.5000000 0.5000000 0.6666667 1.0000000
     [8,] 0.0000000 0.6666667 0.5000000 0.5000000 0.5000000 0.6666667 1.0000000
     [9,] 1.0000000 0.3333333 0.0000000 0.0000000 0.0000000 0.3333333 0.0000000
    [10,] 0.5000000 0.6666667 0.0000000 0.5000000 0.5000000 0.6666667 0.3333333
               [,8]      [,9]     [,10]
     [1,] 0.0000000 1.0000000 0.5000000
     [2,] 0.6666667 0.3333333 0.6666667
     [3,] 0.5000000 0.0000000 0.0000000
     [4,] 0.5000000 0.0000000 0.5000000
     [5,] 0.5000000 0.0000000 0.5000000
     [6,] 0.6666667 0.3333333 0.6666667
     [7,] 1.0000000 0.0000000 0.3333333
     [8,] 1.0000000 0.0000000 0.3333333
     [9,] 0.0000000 1.0000000 0.5000000
    [10,] 0.3333333 0.5000000 1.0000000
    



<br>



### Matriz de similaridades de Jaccard en `Python` <a class="anchor" id="67"></a>


```python
def Sim_Jaccard_Matrix_Python(Binary_Data_set):

    M = np.zeros((Binary_Data_set.shape[0] , Binary_Data_set.shape[0]))

    for i in range(0 , Binary_Data_set.shape[0]):
        for j in range(0 , Binary_Data_set.shape[0]):

            M[i,j] =  Jaccard_Similarity_Py(i+1, j+1)
                 
    return M
```


```python
Sim_Jaccard_Matrix_Python(Binary_Data_Py)
```



    array([[1.        , 0.33333333, 0.        , 0.        , 0.        ,
            0.33333333, 0.        , 0.        , 1.        , 0.5       ,
            0.        , 0.5       , 0.        , 0.        , 0.        ,
            0.        , 0.5       , 0.33333333, 1.        , 0.5       ,
            0.        , 0.        , 0.        , 0.        , 0.        ,
            0.        , 0.5       , 0.        , 0.33333333, 0.        ,
            0.5       , 0.        , 0.        , 0.5       , 0.5       ,
            0.        , 0.5       , 0.33333333, 1.        , 1.        ,
            0.        , 1.        , 0.5       , 0.        , 0.5       ,
            0.        , 0.5       , 0.        , 0.        , 0.5       ],
           [0.33333333, 1.        , 0.33333333, 0.33333333, 0.33333333,
            1.        , 0.66666667, 0.66666667, 0.33333333, 0.66666667,
            0.33333333, 0.66666667, 0.        , 0.33333333, 0.66666667,
            0.33333333, 0.66666667, 1.        , 0.33333333, 0.66666667,
            0.33333333, 0.        , 0.        , 0.66666667, 0.33333333,
            0.66666667, 0.66666667, 0.        , 1.        , 0.33333333,
            0.66666667, 0.        , 0.        , 0.66666667, 0.66666667,
            0.33333333, 0.66666667, 1.        , 0.33333333, 0.33333333,
            0.33333333, 0.33333333, 0.66666667, 0.        , 0.66666667,
            0.33333333, 0.66666667, 0.33333333, 0.66666667, 0.66666667],
           [0.        , 0.33333333, 1.        , 0.        , 0.        ,
            0.33333333, 0.5       , 0.5       , 0.        , 0.        ,
            1.        , 0.        , 0.        , 0.        , 0.5       ,
            0.        , 0.5       , 0.33333333, 0.        , 0.        ,
            1.        , 0.        , 0.        , 0.5       , 1.        ,
            0.5       , 0.        , 0.        , 0.33333333, 0.        ,
            0.5       , 0.        , 0.        , 0.        , 0.        ,
            0.        , 0.        , 0.33333333, 0.        , 0.        ,
            0.        , 0.        , 0.5       , 0.        , 0.5       ,
            0.        , 0.5       , 0.        , 0.5       , 0.        ],
           [0.        , 0.33333333, 0.        , 1.        , 1.        ,
            0.33333333, 0.5       , 0.5       , 0.        , 0.5       ,
            0.        , 0.5       , 0.        , 1.        , 0.5       ,
            1.        , 0.        , 0.33333333, 0.        , 0.5       ,
            0.        , 0.        , 0.        , 0.5       , 0.        ,
            0.5       , 0.5       , 0.        , 0.33333333, 1.        ,
            0.        , 0.        , 0.        , 0.5       , 0.5       ,
            1.        , 0.5       , 0.33333333, 0.        , 0.        ,
            1.        , 0.        , 0.        , 0.        , 0.        ,
            1.        , 0.        , 1.        , 0.5       , 0.5       ],
          
            ...
           
           [0.5       , 0.66666667, 0.        , 0.5       , 0.5       ,
            0.66666667, 0.33333333, 0.33333333, 0.5       , 1.        ,
            0.        , 1.        , 0.        , 0.5       , 0.33333333,
            0.5       , 0.33333333, 0.66666667, 0.5       , 1.        ,
            0.        , 0.        , 0.        , 0.33333333, 0.        ,
            0.33333333, 1.        , 0.        , 0.66666667, 0.5       ,
            0.33333333, 0.        , 0.        , 1.        , 1.        ,
            0.5       , 1.        , 0.66666667, 0.5       , 0.5       ,
            0.5       , 0.5       , 0.33333333, 0.        , 0.33333333,
            0.5       , 0.33333333, 0.5       , 0.33333333, 1.        ]])





<br>



### Distancia de Jaccard en `R` <a class="anchor" id="71"></a>


```r
%%R

Dist_Jaccard_R <- function(i,j,   Binary_Data_set){

Binary_Data_set=as.matrix(Binary_Data_set)
  
Dist_Jaccard  = sqrt( Jaccard_Similarity_R(i,i,   Binary_Data_set) + Jaccard_Similarity_R(j,j,   Binary_Data_set) - 2*Jaccard_Similarity_R(i,j,   Binary_Data_set)  )
  
return( Dist_Jaccard )
}
```


```r
%%R

Dist_Jaccard_R(1,2, Binary_Data) 
```

    [1] 1.154701
    



<br>



### Distancia de Jaccard  en `Python` <a class="anchor" id="72"></a>


```python
def Dist_Jaccard_Python(i, j):

    dist_Jaccard = np.sqrt( Jaccard_Similarity_Py(i,i) + Jaccard_Similarity_Py(j,j) - 2*Jaccard_Similarity_Py(i,j) )

    return dist_Jaccard
```


```python
Dist_Jaccard_Python(1, 2)
```




    1.1547005383792517





<br>



### Matriz de distancias de Jaccard en `R` <a class="anchor" id="73"></a>


```r
%%R

Dist_Jaccard_Matrix_R <- function( Binary_Data_set ){
  
 Binary_Data_set=as.matrix(Binary_Data_set)

  
  M<-matrix(NA, ncol =dim(Binary_Data_set)[1] , nrow=dim(Binary_Data_set)[1] )
  
  for(i in 1:dim(Binary_Data_set)[1] ){
    for(j in 1:dim(Binary_Data_set)[1]){
    
  M[i,j]=Dist_Jaccard_R(i,j,  Binary_Data_set)
  
   }
  }
 return(M)
}
```


```r
%%R

Dist_Jaccard_Matrix_R(Binary_Data)[1:10 , 1:10]
```

              [,1]      [,2]     [,3]     [,4]     [,5]      [,6]      [,7]
     [1,] 0.000000 1.1547005 1.414214 1.414214 1.414214 1.1547005 1.4142136
     [2,] 1.154701 0.0000000 1.154701 1.154701 1.154701 0.0000000 0.8164966
     [3,] 1.414214 1.1547005 0.000000 1.414214 1.414214 1.1547005 1.0000000
     [4,] 1.414214 1.1547005 1.414214 0.000000 0.000000 1.1547005 1.0000000
     [5,] 1.414214 1.1547005 1.414214 0.000000 0.000000 1.1547005 1.0000000
     [6,] 1.154701 0.0000000 1.154701 1.154701 1.154701 0.0000000 0.8164966
     [7,] 1.414214 0.8164966 1.000000 1.000000 1.000000 0.8164966 0.0000000
     [8,] 1.414214 0.8164966 1.000000 1.000000 1.000000 0.8164966 0.0000000
     [9,] 0.000000 1.1547005 1.414214 1.414214 1.414214 1.1547005 1.4142136
    [10,] 1.000000 0.8164966 1.414214 1.000000 1.000000 0.8164966 1.1547005
               [,8]     [,9]     [,10]
     [1,] 1.4142136 0.000000 1.0000000
     [2,] 0.8164966 1.154701 0.8164966
     [3,] 1.0000000 1.414214 1.4142136
     [4,] 1.0000000 1.414214 1.0000000
     [5,] 1.0000000 1.414214 1.0000000
     [6,] 0.8164966 1.154701 0.8164966
     [7,] 0.0000000 1.414214 1.1547005
     [8,] 0.0000000 1.414214 1.1547005
     [9,] 1.4142136 0.000000 1.0000000
    [10,] 1.1547005 1.000000 0.0000000
    



<br>



### Matriz de distancias de Jaccard en `Python` <a class="anchor" id="73"></a>


```python
def Dist_Jaccard_Matrix_Python(Binary_Data_set):

    M = np.zeros((Binary_Data_set.shape[0] , Binary_Data_set.shape[0]))

    for i in range(0 , Binary_Data_set.shape[0]):
        for j in range(0 , Binary_Data_set.shape[0]):

            M[i,j] = Dist_Jaccard_Python(i+1, j+1)
                 
    return M
```


```python
Dist_Jaccard_Matrix_Python(Binary_Data_Py)
```

    C:\Users\Usuario\AppData\Local\Temp\ipykernel_2220\2914781101.py:3: RuntimeWarning: invalid value encountered in double_scalars
      Jaccard_Similarity = a[i-1,j-1] / (a[i-1,j-1] + b[i-1,j-1] + c[i-1,j-1])
    




    array([[0.        , 1.15470054, 1.41421356, 1.41421356, 1.41421356,
            1.15470054, 1.41421356, 1.41421356, 0.        , 1.        ,
            1.41421356, 1.        , 1.41421356, 1.41421356, 1.41421356,
            1.41421356, 1.        , 1.15470054, 0.        , 1.        ,
            1.41421356, 1.41421356, 1.41421356, 1.41421356, 1.41421356,
            1.41421356, 1.        , 1.41421356, 1.15470054, 1.41421356,
            1.        , 1.41421356, 1.41421356, 1.        , 1.        ,
            1.41421356, 1.        , 1.15470054, 0.        , 0.        ,
            1.41421356, 0.        , 1.        , 1.41421356, 1.        ,
            1.41421356, 1.        , 1.41421356, 1.41421356, 1.        ],
           [1.15470054, 0.        , 1.15470054, 1.15470054, 1.15470054,
            0.        , 0.81649658, 0.81649658, 1.15470054, 0.81649658,
            1.15470054, 0.81649658, 1.41421356, 1.15470054, 0.81649658,
            1.15470054, 0.81649658, 0.        , 1.15470054, 0.81649658,
            1.15470054, 1.41421356, 1.41421356, 0.81649658, 1.15470054,
            0.81649658, 0.81649658, 1.41421356, 0.        , 1.15470054,
            0.81649658, 1.41421356, 1.41421356, 0.81649658, 0.81649658,
            1.15470054, 0.81649658, 0.        , 1.15470054, 1.15470054,
            1.15470054, 1.15470054, 0.81649658, 1.41421356, 0.81649658,
            1.15470054, 0.81649658, 1.15470054, 0.81649658, 0.81649658],
           [1.41421356, 1.15470054, 0.        , 1.41421356, 1.41421356,
            1.15470054, 1.        , 1.        , 1.41421356, 1.41421356,
            0.        , 1.41421356, 1.41421356, 1.41421356, 1.        ,
            1.41421356, 1.        , 1.15470054, 1.41421356, 1.41421356,
            0.        , 1.41421356, 1.41421356, 1.        , 0.        ,
            1.        , 1.41421356, 1.41421356, 1.15470054, 1.41421356,
            1.        , 1.41421356, 1.41421356, 1.41421356, 1.41421356,
            1.41421356, 1.41421356, 1.15470054, 1.41421356, 1.41421356,
            1.41421356, 1.41421356, 1.        , 1.41421356, 1.        ,
            1.41421356, 1.        , 1.41421356, 1.        , 1.41421356],
           
            ...
           
           [1.        , 0.81649658, 1.41421356, 1.        , 1.        ,
            0.81649658, 1.15470054, 1.15470054, 1.        , 0.        ,
            1.41421356, 0.        , 1.41421356, 1.        , 1.15470054,
            1.        , 1.15470054, 0.81649658, 1.        , 0.        ,
            1.41421356, 1.41421356, 1.41421356, 1.15470054, 1.41421356,
            1.15470054, 0.        , 1.41421356, 0.81649658, 1.        ,
            1.15470054, 1.41421356, 1.41421356, 0.        , 0.        ,
            1.        , 0.        , 0.81649658, 1.        , 1.        ,
            1.        , 1.        , 1.15470054, 1.41421356, 1.15470054,
            1.        , 1.15470054, 1.        , 1.15470054, 0.        ]])





<br>



## Más coeficientes de similaridad para variables binarias



<br>

<center>

![](similaridades 1.jpg){width="50%"}

</center>

 

<br>

<center>

![](similaridades 2.jpg){width="60%"}

</center>




<br>

<br>



# Similaridades con variables categoricas multiclase   <a class="anchor" id="76"></a>



Dada una muestra de $n$  elementos/individuos $\hspace{0.1cm}\Omega = \lbrace e_1,e_2,...,e_n \rbrace$ 

Dada una serie de variables estadisticas **categóricas multiclase** con no necesariamente igual número de categorias $\hspace{0.1cm}\mathcal{X}_1,...,\mathcal{X}_p$

Para cada variable categórica multiclase $\hspace{0.1cm}\mathcal{X}_j\hspace{0.1cm}$ tenemos una muestra de $n$ observaciones $\hspace{0.1cm}X_j\hspace{0.1cm}$  basada en la muestra de $n$ individuos $\hspace{0.1cm}\Omega$

 
Es decir, tenemos lo siguiente:

- $\hspace{0.1cm}X_j=(x_{j1},...,x_{jn})^t$ , para $j=1,...,p \\$

- $\hspace{0.1cm}x_{ji}\hspace{0.1cm}$ es la observación de la variable $\hspace{0.1cm}\mathcal{X}_j\hspace{0.1cm}$ para el individuo $\hspace{0.1cm}e_i\hspace{0.1cm}$ de la muestra $\hspace{0.1cm}\Omega$ , para $\hspace{0.1cm}j=1,...,p\hspace{0.1cm}$ y $\hspace{0.1cm}i=1,...,n \\$



Por tanto:

- $\hspace{0.1cm}X_j=(x_{j1},...,x_{jn})^t\hspace{0.1cm}$ es el vector con las observaciones de la variable para los individuos de la muestra $\hspace{0.1cm}\Omega$  , para $\hspace{0.1cm}j=1,...,p \\$

- $\hspace{0.1cm}x_i = (x_{1i} , x_{2i} ,..., x_{pi})^t\hspace{0.1cm}$ es el vector con las observaciones de las variables  $\hspace{0.1cm}\mathcal{X}_1,...,\mathcal{X}_p\hspace{0.1cm}$ para el individuo $\hspace{0.1cm}e_i\hspace{0.1cm}$ de $\hspace{0.1cm}\Omega$ , para $\hspace{0.1cm}i=1,...,n$




<br>

Los parametros que habitualmente se usan para construir las similaridades con variables multiclase son:


$\alpha_{ir} =$ nº de variables multiclase $\hspace{0.1cm}\mathcal {X}_j\hspace{0.1cm}$ tales que  $\hspace{0.1cm}x_{ij} = x_{rj}\\$

$$\alpha_{ir} = \# \lbrace j=1,...,p / x_{ij} = x_{rj}  \rbrace\\$$

$p-\alpha_{ir} =$  nº de variables multiclase $\hspace{0.1cm}\mathcal {X}_j\hspace{0.1cm}$ tales que  $\hspace{0.1cm}x_{ij} \neq x_{rj} \\$ 

$$p - \alpha_{ir} = \# \lbrace j=1,...,p / x_{ij} \neq x_{rj}  \rbrace\\$$




**Observación:**

$$\alpha_{ij}=a_{ij}+b_{ij}$$


<br>

## Similaridad por coincidencias  <a class="anchor" id="77"></a>

La medida de similaridad mas común con variables categoricas multiclase es la similaridad por coincidencias


La similaridad por coincidencias entre el par de observaciones $\hspace{0.1cm}(x_i , x_r)\hspace{0.1cm}$ de las variables categoricas multiclase $\hspace{0.1cm}\mathcal{X}_1,..., \mathcal{X}_p\hspace{0.1cm}$ se define como: $\\[0.4cm]$


 
\begin{gather*}
\phi(i,r)_{Matches}= \dfrac{\alpha_{ir}}{p}
\end{gather*}



**Observación:**

Cuando las variables son binarias, el la similaridad por coincidencias es igual a la similaridad de Sokal, ya que $\hspace{0.1cm} \alpha_{ij}=a_{ij}+b_{ij}$



<br>

## Distancia por coincidencias   <a class="anchor" id="78"></a>

La distancia por coincidencias entre el par de observaciones $\hspace{0.1cm}(x_i , x_r)\hspace{0.1cm}$ de las variables categoricas multiclase $\hspace{0.1cm}\mathcal{X}_1,..., \mathcal{X}_p\hspace{0.1cm}$ se obtiene como: $\\[0.4cm]$

\begin{gather*}
\delta(i,r)_{Coincidencias} = \sqrt{S(i,i)_{Coincidencias} +S(r,r)_{Coincidencias} - 2\cdot S(i,r)_{Coincidencias} }
\end{gather*}





<br>



 ####  Matches Similarity in `R`   <a class="anchor" id="79"></a>



```r
%%R

Multiple_Categorical_Data_R <- Data_set_R %>% select(8:10)
```



We create a function to compute the parameter $\hspace{0.1cm}\alpha_{ij}$  


```r
%%R

alpha<- function(i,j, Multiple_Categorical_Data){
  
  X=as.matrix(Multiple_Categorical_Data)
  
  alpha=ifelse( X[i,]==X[j,] , 1 , 0)
  
  # Otra forma de hacer lo mismo, pero menos eficiente:
    
  # alpha=rep(0, dim(Multiple_Categorical_Data)[2])

  # for(k in 1:dim(X)[2]){
  # if( X[i,k]==X[j,k] ){ alpha[k]=1 } else { alpha[k]=0 }
  # }
  
  alpha=sum(alpha)
  
  return(alpha)
}
```


```r
%%R

alpha(1,2 , Multiple_Categorical_Data_R)
```

    [1] 2
    



Now we develop a function to compute the matches similarity coefficient:


```r
%%R

Matches_Similarity_R <- function(i,j, Multiple_Categorical_Data){

Multiple_Categorical_Data=as.matrix(Multiple_Categorical_Data)
  
Matches_Similarity  =  alpha(i,j, Multiple_Categorical_Data) / dim(Multiple_Categorical_Data)[2] 
  
return(Matches_Similarity )
}
```


```r
%%R

Matches_Similarity_R(1,2, Multiple_Categorical_Data_R)
```

    [1] 0.6666667
    



---



#### Matches Similarity in `Python`  <a class="anchor" id="79.1"></a>



```python
Multiple_Categorical_Data_Py = Data_set_Python.iloc[: , 7:10]
```


```python
def alpha_py(i,j, Multiple_Categorical_Data):

    X = Multiple_Categorical_Data

    alpha = np.repeat(0, X.shape[1])

    for k in range(0, X.shape[1]) :

        if X[i-1, k] == X[j-1, k] :

            alpha[k] = 1

        else :

            alpha[k] = 0

    alpha = alpha.sum()

    return(alpha)
```


```python
def matches_similarity_py(i, j, Multiple_Categorical_Data):

    X = Multiple_Categorical_Data.to_numpy()

    p = X.shape[1]

    matches_similarity = alpha_py(i,j, X) / p

    return(matches_similarity)
```


```python
matches_similarity_py(1, 2, Multiple_Categorical_Data_Py)
```




    0.6666666666666666





---



 ####  Matches Distance in `R`   <a class="anchor" id="80"></a>



```r
%%R

Dist_Matches_R <- function(i,j,   Multiple_Categorical_Data){

Multiple_Categorical_Data=as.matrix(Multiple_Categorical_Data)
  
Dist_Matches  = sqrt( Matches_Similarity_R(i,i,   Multiple_Categorical_Data) + Matches_Similarity_R(j,j,   Multiple_Categorical_Data) - 2*Matches_Similarity_R(i,j,   Multiple_Categorical_Data)  )
  
return( Dist_Matches )
}
```


```r
%%R

Dist_Matches_R(1,3, Multiple_Categorical_Data_R)
```

    [1] 0.8164966
    



---



 ####  Matches Distance in `Python`   <a class="anchor" id="80.1"></a>



```python
def Dist_Matches_Py(i,j, Multiple_Categorical_Data):

    Dist_Matches = np.sqrt( matches_similarity_py(i, i, Multiple_Categorical_Data) +  matches_similarity_py(j, j, Multiple_Categorical_Data) - 2*matches_similarity_py(i, j, Multiple_Categorical_Data) )

    return( Dist_Matches )
```


```python
Dist_Matches_Py(1,3, Multiple_Categorical_Data_Py)
```




    0.816496580927726





---



 ####  Matches Similarity Matrix in `R`   <a class="anchor" id="81"></a>



```r
%%R

Matches_Similarity_Matrix_R <- function( Multiple_Categorical_Data ){
  
  Multiple_Categorical_Data=as.matrix(Multiple_Categorical_Data)

  M<-matrix(NA, ncol =dim(Multiple_Categorical_Data)[1] , nrow=dim(Multiple_Categorical_Data)[1] )
  
  for(i in 1:dim(Multiple_Categorical_Data)[1] ){
    for(j in 1:dim(Multiple_Categorical_Data)[1]){
    
  M[i,j]=Matches_Similarity_R(i,j,  Multiple_Categorical_Data)
  
   }
  }
 return(M)
}
```


```r
%%R

Matches_Similarity_Matrix_R(Multiple_Categorical_Data_R)[1:10 , 1:10]
```

               [,1]      [,2]      [,3]      [,4] [,5]      [,6]      [,7]
     [1,] 1.0000000 0.6666667 0.6666667 0.3333333    0 0.3333333 0.6666667
     [2,] 0.6666667 1.0000000 0.6666667 0.3333333    0 0.3333333 0.3333333
     [3,] 0.6666667 0.6666667 1.0000000 0.3333333    0 0.3333333 0.3333333
     [4,] 0.3333333 0.3333333 0.3333333 1.0000000    0 0.3333333 0.0000000
     [5,] 0.0000000 0.0000000 0.0000000 0.0000000    1 0.0000000 0.0000000
     [6,] 0.3333333 0.3333333 0.3333333 0.3333333    0 1.0000000 0.3333333
     [7,] 0.6666667 0.3333333 0.3333333 0.0000000    0 0.3333333 1.0000000
     [8,] 0.3333333 0.3333333 0.3333333 0.6666667    0 0.3333333 0.0000000
     [9,] 0.3333333 0.6666667 0.3333333 0.3333333    0 0.0000000 0.0000000
    [10,] 0.3333333 0.3333333 0.3333333 0.6666667    0 0.0000000 0.0000000
               [,8]      [,9]     [,10]
     [1,] 0.3333333 0.3333333 0.3333333
     [2,] 0.3333333 0.6666667 0.3333333
     [3,] 0.3333333 0.3333333 0.3333333
     [4,] 0.6666667 0.3333333 0.6666667
     [5,] 0.0000000 0.0000000 0.0000000
     [6,] 0.3333333 0.0000000 0.0000000
     [7,] 0.0000000 0.0000000 0.0000000
     [8,] 1.0000000 0.6666667 0.3333333
     [9,] 0.6666667 1.0000000 0.3333333
    [10,] 0.3333333 0.3333333 1.0000000
    



---



 ####  Matches Similarity Matrix in `Python`   <a class="anchor" id="82"></a>



```python
def Sim_Matches_Matrix_Python(Multiple_Categorical_Data):

    M = np.zeros((Multiple_Categorical_Data.shape[0] , Multiple_Categorical_Data.shape[0]))

    for i in range(0 , Multiple_Categorical_Data.shape[0]):
        for j in range(0 , Multiple_Categorical_Data.shape[0]):

            M[i,j] = matches_similarity_py(i+1, j+1, Multiple_Categorical_Data)
                 
    return M
```


```python
Sim_Matches_Matrix_Python(Multiple_Categorical_Data_Py)
```




    array([[1.        , 0.66666667, 0.66666667, 0.33333333, 0.        ,
            0.33333333, 0.66666667, 0.33333333, 0.33333333, 0.33333333,
            0.        , 0.33333333, 0.        , 0.        , 0.33333333,
            0.33333333, 0.        , 0.66666667, 0.        , 0.        ,
            0.66666667, 0.        , 0.33333333, 0.33333333, 0.33333333,
            0.        , 0.        , 0.        , 0.66666667, 0.66666667,
            0.        , 0.        , 0.        , 0.33333333, 0.        ,
            0.        , 0.        , 0.33333333, 0.33333333, 0.        ,
            0.33333333, 0.66666667, 0.        , 0.        , 0.        ,
            0.        , 0.66666667, 0.33333333, 0.        , 0.        ],
           [0.66666667, 1.        , 0.66666667, 0.33333333, 0.        ,
            0.33333333, 0.33333333, 0.33333333, 0.66666667, 0.33333333,
            0.        , 0.33333333, 0.        , 0.        , 0.        ,
            0.33333333, 0.        , 0.33333333, 0.        , 0.        ,
            0.33333333, 0.        , 0.        , 0.33333333, 0.33333333,
            0.        , 0.        , 0.33333333, 0.33333333, 0.33333333,
            0.        , 0.        , 0.        , 0.66666667, 0.        ,
            0.        , 0.        , 0.33333333, 0.66666667, 0.        ,
            0.33333333, 0.66666667, 0.        , 0.        , 0.        ,
            0.        , 0.33333333, 0.66666667, 0.        , 0.        ],
           [0.66666667, 0.66666667, 1.        , 0.33333333, 0.        ,
            0.33333333, 0.33333333, 0.33333333, 0.33333333, 0.33333333,
            0.        , 0.33333333, 0.33333333, 0.        , 0.        ,
            0.33333333, 0.        , 0.33333333, 0.        , 0.        ,
            0.33333333, 0.        , 0.        , 0.33333333, 0.33333333,
            0.        , 0.        , 0.        , 0.33333333, 0.33333333,
            0.        , 0.        , 0.        , 0.33333333, 0.        ,
            0.        , 0.        , 0.33333333, 0.33333333, 0.        ,
            0.33333333, 1.        , 0.        , 0.        , 0.        ,
            0.        , 0.33333333, 0.33333333, 0.33333333, 0.        ],
           [0.33333333, 0.33333333, 0.33333333, 1.        , 0.        ,
            0.33333333, 0.        , 0.66666667, 0.33333333, 0.66666667,
            0.        , 0.66666667, 0.33333333, 0.33333333, 0.33333333,
            0.33333333, 0.33333333, 0.        , 0.33333333, 0.33333333,
            0.33333333, 0.66666667, 0.        , 0.33333333, 0.        ,
            0.        , 0.        , 0.        , 0.33333333, 0.66666667,
            0.        , 0.        , 0.33333333, 0.33333333, 0.33333333,
            0.33333333, 0.33333333, 0.        , 0.33333333, 0.33333333,
            0.33333333, 0.33333333, 0.66666667, 0.        , 0.33333333,
            0.33333333, 0.        , 0.33333333, 0.33333333, 0.        ],
           [0.        , 0.        , 0.        , 0.        , 1.        ,
            0.        , 0.        , 0.        , 0.        , 0.        ,
            0.33333333, 0.33333333, 0.        , 0.33333333, 0.33333333,
            0.33333333, 0.33333333, 0.        , 0.33333333, 0.66666667,
            0.        , 0.        , 0.33333333, 0.33333333, 0.33333333,
            0.66666667, 0.33333333, 0.33333333, 0.        , 0.        ,
            0.        , 1.        , 0.33333333, 0.33333333, 0.33333333,
            0.        , 0.33333333, 0.33333333, 0.33333333, 0.33333333,
            0.        , 0.        , 0.33333333, 0.33333333, 0.        ,
            0.33333333, 0.        , 0.33333333, 0.        , 0.        ],
           [0.33333333, 0.33333333, 0.33333333, 0.33333333, 0.        ,
            1.        , 0.33333333, 0.33333333, 0.        , 0.        ,
            0.        , 0.33333333, 0.33333333, 0.        , 0.        ,
            0.        , 0.        , 0.66666667, 0.66666667, 0.        ,
            0.        , 0.33333333, 0.        , 0.        , 0.66666667,
            0.33333333, 0.        , 0.        , 0.        , 0.        ,
            0.        , 0.        , 0.        , 0.        , 0.        ,
            0.33333333, 0.33333333, 0.33333333, 0.        , 0.        ,
            0.        , 0.33333333, 0.33333333, 0.33333333, 0.33333333,
            0.66666667, 0.33333333, 0.        , 0.33333333, 0.        ],
           [0.66666667, 0.33333333, 0.33333333, 0.        , 0.        ,
            0.33333333, 1.        , 0.        , 0.        , 0.        ,
            0.        , 0.        , 0.        , 0.        , 0.33333333,
            0.        , 0.33333333, 0.66666667, 0.        , 0.        ,
            0.33333333, 0.33333333, 0.33333333, 0.        , 0.33333333,
            0.        , 0.33333333, 0.        , 0.33333333, 0.33333333,
            0.33333333, 0.        , 0.33333333, 0.        , 0.33333333,
            0.        , 0.        , 0.66666667, 0.        , 0.33333333,
            0.        , 0.33333333, 0.        , 0.        , 0.33333333,
            0.        , 1.        , 0.        , 0.        , 0.33333333],
           [0.33333333, 0.33333333, 0.33333333, 0.66666667, 0.        ,
            0.33333333, 0.        , 1.        , 0.66666667, 0.33333333,
            0.        , 0.66666667, 0.        , 0.        , 0.        ,
            0.33333333, 0.        , 0.        , 0.33333333, 0.        ,
            0.33333333, 0.33333333, 0.        , 0.66666667, 0.        ,
            0.        , 0.        , 0.33333333, 0.66666667, 0.33333333,
            0.        , 0.        , 0.        , 0.33333333, 0.        ,
            0.        , 0.        , 0.        , 0.33333333, 0.        ,
            0.33333333, 0.33333333, 0.33333333, 0.        , 0.33333333,
            0.33333333, 0.        , 0.33333333, 0.        , 0.33333333],
           [0.33333333, 0.66666667, 0.33333333, 0.33333333, 0.        ,
            0.        , 0.        , 0.66666667, 1.        , 0.33333333,
            0.        , 0.33333333, 0.        , 0.        , 0.        ,
            0.33333333, 0.        , 0.        , 0.        , 0.        ,
            0.33333333, 0.        , 0.        , 0.66666667, 0.        ,
            0.        , 0.        , 0.66666667, 0.66666667, 0.33333333,
            0.        , 0.        , 0.        , 0.66666667, 0.        ,
            0.        , 0.        , 0.        , 0.66666667, 0.        ,
            0.33333333, 0.33333333, 0.        , 0.        , 0.        ,
            0.        , 0.        , 0.66666667, 0.        , 0.33333333],
           [0.33333333, 0.33333333, 0.33333333, 0.66666667, 0.        ,
            0.        , 0.        , 0.33333333, 0.33333333, 1.        ,
            0.33333333, 0.33333333, 0.33333333, 0.66666667, 0.33333333,
            0.66666667, 0.33333333, 0.        , 0.        , 0.33333333,
            0.33333333, 0.33333333, 0.        , 0.33333333, 0.        ,
            0.        , 0.33333333, 0.        , 0.33333333, 0.66666667,
            0.33333333, 0.        , 0.33333333, 0.33333333, 0.33333333,
            0.66666667, 0.33333333, 0.        , 0.33333333, 0.33333333,
            0.66666667, 0.33333333, 0.33333333, 0.        , 0.        ,
            0.        , 0.        , 0.33333333, 0.33333333, 0.33333333],
           [0.        , 0.        , 0.        , 0.        , 0.33333333,
            0.        , 0.        , 0.        , 0.        , 0.33333333,
            1.        , 0.        , 0.        , 0.66666667, 0.33333333,
            0.33333333, 0.        , 0.        , 0.        , 0.33333333,
            0.33333333, 0.        , 0.66666667, 0.        , 0.        ,
            0.        , 0.33333333, 0.33333333, 0.        , 0.        ,
            0.66666667, 0.33333333, 0.        , 0.        , 0.        ,
            0.33333333, 0.        , 0.        , 0.        , 0.        ,
            0.66666667, 0.        , 0.33333333, 0.33333333, 0.33333333,
            0.        , 0.        , 0.        , 0.        , 0.33333333],
           [0.33333333, 0.33333333, 0.33333333, 0.66666667, 0.33333333,
            0.33333333, 0.        , 0.66666667, 0.33333333, 0.33333333,
            0.        , 1.        , 0.        , 0.        , 0.        ,
            0.66666667, 0.        , 0.        , 0.66666667, 0.        ,
            0.33333333, 0.33333333, 0.        , 0.33333333, 0.        ,
            0.33333333, 0.33333333, 0.        , 0.33333333, 0.33333333,
            0.        , 0.33333333, 0.        , 0.66666667, 0.        ,
            0.        , 0.        , 0.        , 0.66666667, 0.        ,
            0.33333333, 0.33333333, 0.33333333, 0.        , 0.33333333,
            0.66666667, 0.        , 0.66666667, 0.        , 0.        ],
           [0.        , 0.        , 0.33333333, 0.33333333, 0.        ,
            0.33333333, 0.        , 0.        , 0.        , 0.33333333,
            0.        , 0.        , 1.        , 0.33333333, 0.33333333,
            0.        , 0.33333333, 0.33333333, 0.33333333, 0.33333333,
            0.        , 0.33333333, 0.        , 0.        , 0.33333333,
            0.33333333, 0.        , 0.        , 0.        , 0.33333333,
            0.        , 0.        , 0.33333333, 0.        , 0.33333333,
            0.66666667, 0.66666667, 0.        , 0.        , 0.33333333,
            0.        , 0.33333333, 0.33333333, 0.33333333, 0.        ,
            0.33333333, 0.        , 0.        , 1.        , 0.        ],
           [0.        , 0.        , 0.        , 0.33333333, 0.33333333,
            0.        , 0.        , 0.        , 0.        , 0.66666667,
            0.66666667, 0.        , 0.33333333, 1.        , 0.66666667,
            0.33333333, 0.33333333, 0.        , 0.        , 0.66666667,
            0.        , 0.33333333, 0.33333333, 0.        , 0.        ,
            0.        , 0.33333333, 0.33333333, 0.        , 0.33333333,
            0.33333333, 0.33333333, 0.33333333, 0.        , 0.33333333,
            0.66666667, 0.33333333, 0.        , 0.        , 0.33333333,
            0.33333333, 0.        , 0.66666667, 0.        , 0.        ,
            0.        , 0.        , 0.        , 0.33333333, 0.33333333],
           [0.33333333, 0.        , 0.        , 0.33333333, 0.33333333,
            0.        , 0.33333333, 0.        , 0.        , 0.33333333,
            0.33333333, 0.        , 0.33333333, 0.66666667, 1.        ,
            0.        , 0.33333333, 0.33333333, 0.        , 0.66666667,
            0.33333333, 0.33333333, 0.66666667, 0.        , 0.        ,
            0.        , 0.        , 0.33333333, 0.33333333, 0.66666667,
            0.        , 0.33333333, 0.33333333, 0.        , 0.33333333,
            0.33333333, 0.33333333, 0.        , 0.        , 0.33333333,
            0.        , 0.        , 0.66666667, 0.        , 0.        ,
            0.        , 0.33333333, 0.        , 0.33333333, 0.        ],
           [0.33333333, 0.33333333, 0.33333333, 0.33333333, 0.33333333,
            0.        , 0.        , 0.33333333, 0.33333333, 0.66666667,
            0.33333333, 0.66666667, 0.        , 0.33333333, 0.        ,
            1.        , 0.        , 0.        , 0.33333333, 0.        ,
            0.33333333, 0.        , 0.        , 0.33333333, 0.        ,
            0.33333333, 0.66666667, 0.        , 0.33333333, 0.33333333,
            0.33333333, 0.33333333, 0.        , 0.66666667, 0.        ,
            0.33333333, 0.        , 0.        , 0.66666667, 0.        ,
            0.66666667, 0.33333333, 0.        , 0.        , 0.        ,
            0.33333333, 0.        , 0.66666667, 0.        , 0.33333333],
           [0.        , 0.        , 0.        , 0.33333333, 0.33333333,
            0.        , 0.33333333, 0.        , 0.        , 0.33333333,
            0.        , 0.        , 0.33333333, 0.33333333, 0.33333333,
            0.        , 1.        , 0.        , 0.        , 0.66666667,
            0.        , 0.66666667, 0.        , 0.33333333, 0.33333333,
            0.33333333, 0.33333333, 0.        , 0.        , 0.33333333,
            0.33333333, 0.33333333, 1.        , 0.        , 1.        ,
            0.33333333, 0.66666667, 0.66666667, 0.        , 1.        ,
            0.        , 0.        , 0.33333333, 0.33333333, 0.33333333,
            0.        , 0.33333333, 0.        , 0.33333333, 0.33333333],
           [0.66666667, 0.33333333, 0.33333333, 0.        , 0.        ,
            0.66666667, 0.66666667, 0.        , 0.        , 0.        ,
            0.        , 0.        , 0.33333333, 0.        , 0.33333333,
            0.        , 0.        , 1.        , 0.33333333, 0.        ,
            0.33333333, 0.        , 0.33333333, 0.        , 0.66666667,
            0.33333333, 0.        , 0.        , 0.33333333, 0.33333333,
            0.        , 0.        , 0.        , 0.        , 0.        ,
            0.33333333, 0.33333333, 0.33333333, 0.        , 0.        ,
            0.        , 0.33333333, 0.        , 0.33333333, 0.        ,
            0.33333333, 0.66666667, 0.        , 0.33333333, 0.        ],
           [0.        , 0.        , 0.        , 0.33333333, 0.33333333,
            0.66666667, 0.        , 0.33333333, 0.        , 0.        ,
            0.        , 0.66666667, 0.33333333, 0.        , 0.        ,
            0.33333333, 0.        , 0.33333333, 1.        , 0.        ,
            0.        , 0.33333333, 0.        , 0.        , 0.33333333,
            0.66666667, 0.33333333, 0.        , 0.        , 0.        ,
            0.        , 0.33333333, 0.        , 0.33333333, 0.        ,
            0.33333333, 0.33333333, 0.        , 0.33333333, 0.        ,
            0.        , 0.        , 0.33333333, 0.33333333, 0.33333333,
            1.        , 0.        , 0.33333333, 0.33333333, 0.        ],
           [0.        , 0.        , 0.        , 0.33333333, 0.66666667,
            0.        , 0.        , 0.        , 0.        , 0.33333333,
            0.33333333, 0.        , 0.33333333, 0.66666667, 0.66666667,
            0.        , 0.66666667, 0.        , 0.        , 1.        ,
            0.        , 0.33333333, 0.33333333, 0.33333333, 0.33333333,
            0.33333333, 0.        , 0.33333333, 0.        , 0.33333333,
            0.        , 0.66666667, 0.66666667, 0.        , 0.66666667,
            0.33333333, 0.66666667, 0.33333333, 0.        , 0.66666667,
            0.        , 0.        , 0.66666667, 0.33333333, 0.        ,
            0.        , 0.        , 0.        , 0.33333333, 0.        ],
           [0.66666667, 0.33333333, 0.33333333, 0.33333333, 0.        ,
            0.        , 0.33333333, 0.33333333, 0.33333333, 0.33333333,
            0.33333333, 0.33333333, 0.        , 0.        , 0.33333333,
            0.33333333, 0.        , 0.33333333, 0.        , 0.        ,
            1.        , 0.        , 0.66666667, 0.33333333, 0.        ,
            0.        , 0.        , 0.        , 0.66666667, 0.66666667,
            0.33333333, 0.        , 0.        , 0.33333333, 0.        ,
            0.        , 0.        , 0.        , 0.33333333, 0.        ,
            0.66666667, 0.33333333, 0.        , 0.33333333, 0.33333333,
            0.        , 0.33333333, 0.33333333, 0.        , 0.        ],
           [0.        , 0.        , 0.        , 0.66666667, 0.        ,
            0.33333333, 0.33333333, 0.33333333, 0.        , 0.33333333,
            0.        , 0.33333333, 0.33333333, 0.33333333, 0.33333333,
            0.        , 0.66666667, 0.        , 0.33333333, 0.33333333,
            0.        , 1.        , 0.        , 0.        , 0.        ,
            0.        , 0.33333333, 0.        , 0.        , 0.33333333,
            0.33333333, 0.        , 0.66666667, 0.        , 0.66666667,
            0.33333333, 0.33333333, 0.33333333, 0.        , 0.66666667,
            0.        , 0.        , 0.66666667, 0.        , 0.66666667,
            0.33333333, 0.33333333, 0.        , 0.33333333, 0.33333333],
           [0.33333333, 0.        , 0.        , 0.        , 0.33333333,
            0.        , 0.33333333, 0.        , 0.        , 0.        ,
            0.66666667, 0.        , 0.        , 0.33333333, 0.66666667,
            0.        , 0.        , 0.33333333, 0.        , 0.33333333,
            0.66666667, 0.        , 1.        , 0.        , 0.        ,
            0.        , 0.        , 0.33333333, 0.33333333, 0.33333333,
            0.33333333, 0.33333333, 0.        , 0.        , 0.        ,
            0.        , 0.        , 0.        , 0.        , 0.        ,
            0.33333333, 0.        , 0.33333333, 0.33333333, 0.33333333,
            0.        , 0.33333333, 0.        , 0.        , 0.        ],
           [0.33333333, 0.33333333, 0.33333333, 0.33333333, 0.33333333,
            0.        , 0.        , 0.66666667, 0.66666667, 0.33333333,
            0.        , 0.33333333, 0.        , 0.        , 0.        ,
            0.33333333, 0.33333333, 0.        , 0.        , 0.33333333,
            0.33333333, 0.        , 0.        , 1.        , 0.33333333,
            0.33333333, 0.        , 0.33333333, 0.66666667, 0.33333333,
            0.        , 0.33333333, 0.33333333, 0.33333333, 0.33333333,
            0.        , 0.33333333, 0.33333333, 0.33333333, 0.33333333,
            0.33333333, 0.33333333, 0.        , 0.33333333, 0.        ,
            0.        , 0.        , 0.33333333, 0.        , 0.33333333],
           [0.33333333, 0.33333333, 0.33333333, 0.        , 0.33333333,
            0.66666667, 0.33333333, 0.        , 0.        , 0.        ,
            0.        , 0.        , 0.33333333, 0.        , 0.        ,
            0.        , 0.33333333, 0.66666667, 0.33333333, 0.33333333,
            0.        , 0.        , 0.        , 0.33333333, 1.        ,
            0.66666667, 0.        , 0.        , 0.        , 0.        ,
            0.        , 0.33333333, 0.33333333, 0.        , 0.33333333,
            0.33333333, 0.66666667, 0.66666667, 0.        , 0.33333333,
            0.        , 0.33333333, 0.        , 0.66666667, 0.        ,
            0.33333333, 0.33333333, 0.        , 0.33333333, 0.        ],
           [0.        , 0.        , 0.        , 0.        , 0.66666667,
            0.33333333, 0.        , 0.        , 0.        , 0.        ,
            0.        , 0.33333333, 0.33333333, 0.        , 0.        ,
            0.33333333, 0.33333333, 0.33333333, 0.66666667, 0.33333333,
            0.        , 0.        , 0.        , 0.33333333, 0.66666667,
            1.        , 0.33333333, 0.        , 0.        , 0.        ,
            0.        , 0.66666667, 0.33333333, 0.33333333, 0.33333333,
            0.33333333, 0.66666667, 0.33333333, 0.33333333, 0.33333333,
            0.        , 0.        , 0.        , 0.66666667, 0.        ,
            0.66666667, 0.        , 0.33333333, 0.33333333, 0.        ],
           [0.        , 0.        , 0.        , 0.        , 0.33333333,
            0.        , 0.33333333, 0.        , 0.        , 0.33333333,
            0.33333333, 0.33333333, 0.        , 0.33333333, 0.        ,
            0.66666667, 0.33333333, 0.        , 0.33333333, 0.        ,
            0.        , 0.33333333, 0.        , 0.        , 0.        ,
            0.33333333, 1.        , 0.        , 0.        , 0.        ,
            0.66666667, 0.33333333, 0.33333333, 0.33333333, 0.33333333,
            0.33333333, 0.        , 0.33333333, 0.33333333, 0.33333333,
            0.33333333, 0.        , 0.        , 0.        , 0.33333333,
            0.33333333, 0.33333333, 0.33333333, 0.        , 0.66666667],
           [0.        , 0.33333333, 0.        , 0.        , 0.33333333,
            0.        , 0.        , 0.33333333, 0.66666667, 0.        ,
            0.33333333, 0.        , 0.        , 0.33333333, 0.33333333,
            0.        , 0.        , 0.        , 0.        , 0.33333333,
            0.        , 0.        , 0.33333333, 0.33333333, 0.        ,
            0.        , 0.        , 1.        , 0.33333333, 0.        ,
            0.        , 0.33333333, 0.        , 0.33333333, 0.        ,
            0.        , 0.        , 0.        , 0.33333333, 0.        ,
            0.        , 0.        , 0.33333333, 0.        , 0.        ,
            0.        , 0.        , 0.33333333, 0.        , 0.33333333],
           [0.66666667, 0.33333333, 0.33333333, 0.33333333, 0.        ,
            0.        , 0.33333333, 0.66666667, 0.66666667, 0.33333333,
            0.        , 0.33333333, 0.        , 0.        , 0.33333333,
            0.33333333, 0.        , 0.33333333, 0.        , 0.        ,
            0.66666667, 0.        , 0.33333333, 0.66666667, 0.        ,
            0.        , 0.        , 0.33333333, 1.        , 0.66666667,
            0.        , 0.        , 0.        , 0.33333333, 0.        ,
            0.        , 0.        , 0.        , 0.33333333, 0.        ,
            0.33333333, 0.33333333, 0.        , 0.        , 0.        ,
            0.        , 0.33333333, 0.33333333, 0.        , 0.33333333],
           [0.66666667, 0.33333333, 0.33333333, 0.66666667, 0.        ,
            0.        , 0.33333333, 0.33333333, 0.33333333, 0.66666667,
            0.        , 0.33333333, 0.33333333, 0.33333333, 0.66666667,
            0.33333333, 0.33333333, 0.33333333, 0.        , 0.33333333,
            0.66666667, 0.33333333, 0.33333333, 0.33333333, 0.        ,
            0.        , 0.        , 0.        , 0.66666667, 1.        ,
            0.        , 0.        , 0.33333333, 0.33333333, 0.33333333,
            0.33333333, 0.33333333, 0.        , 0.33333333, 0.33333333,
            0.33333333, 0.33333333, 0.33333333, 0.        , 0.        ,
            0.        , 0.33333333, 0.33333333, 0.33333333, 0.        ],
           [0.        , 0.        , 0.        , 0.        , 0.        ,
            0.        , 0.33333333, 0.        , 0.        , 0.33333333,
            0.66666667, 0.        , 0.        , 0.33333333, 0.        ,
            0.33333333, 0.33333333, 0.        , 0.        , 0.        ,
            0.33333333, 0.33333333, 0.33333333, 0.        , 0.        ,
            0.        , 0.66666667, 0.        , 0.        , 0.        ,
            1.        , 0.        , 0.33333333, 0.        , 0.33333333,
            0.33333333, 0.        , 0.33333333, 0.        , 0.33333333,
            0.66666667, 0.        , 0.        , 0.33333333, 0.66666667,
            0.        , 0.33333333, 0.        , 0.        , 0.66666667],
           [0.        , 0.        , 0.        , 0.        , 1.        ,
            0.        , 0.        , 0.        , 0.        , 0.        ,
            0.33333333, 0.33333333, 0.        , 0.33333333, 0.33333333,
            0.33333333, 0.33333333, 0.        , 0.33333333, 0.66666667,
            0.        , 0.        , 0.33333333, 0.33333333, 0.33333333,
            0.66666667, 0.33333333, 0.33333333, 0.        , 0.        ,
            0.        , 1.        , 0.33333333, 0.33333333, 0.33333333,
            0.        , 0.33333333, 0.33333333, 0.33333333, 0.33333333,
            0.        , 0.        , 0.33333333, 0.33333333, 0.        ,
            0.33333333, 0.        , 0.33333333, 0.        , 0.        ],
           [0.        , 0.        , 0.        , 0.33333333, 0.33333333,
            0.        , 0.33333333, 0.        , 0.        , 0.33333333,
            0.        , 0.        , 0.33333333, 0.33333333, 0.33333333,
            0.        , 1.        , 0.        , 0.        , 0.66666667,
            0.        , 0.66666667, 0.        , 0.33333333, 0.33333333,
            0.33333333, 0.33333333, 0.        , 0.        , 0.33333333,
            0.33333333, 0.33333333, 1.        , 0.        , 1.        ,
            0.33333333, 0.66666667, 0.66666667, 0.        , 1.        ,
            0.        , 0.        , 0.33333333, 0.33333333, 0.33333333,
            0.        , 0.33333333, 0.        , 0.33333333, 0.33333333],
           [0.33333333, 0.66666667, 0.33333333, 0.33333333, 0.33333333,
            0.        , 0.        , 0.33333333, 0.66666667, 0.33333333,
            0.        , 0.66666667, 0.        , 0.        , 0.        ,
            0.66666667, 0.        , 0.        , 0.33333333, 0.        ,
            0.33333333, 0.        , 0.        , 0.33333333, 0.        ,
            0.33333333, 0.33333333, 0.33333333, 0.33333333, 0.33333333,
            0.        , 0.33333333, 0.        , 1.        , 0.        ,
            0.        , 0.        , 0.        , 1.        , 0.        ,
            0.33333333, 0.33333333, 0.        , 0.        , 0.        ,
            0.33333333, 0.        , 1.        , 0.        , 0.        ],
           [0.        , 0.        , 0.        , 0.33333333, 0.33333333,
            0.        , 0.33333333, 0.        , 0.        , 0.33333333,
            0.        , 0.        , 0.33333333, 0.33333333, 0.33333333,
            0.        , 1.        , 0.        , 0.        , 0.66666667,
            0.        , 0.66666667, 0.        , 0.33333333, 0.33333333,
            0.33333333, 0.33333333, 0.        , 0.        , 0.33333333,
            0.33333333, 0.33333333, 1.        , 0.        , 1.        ,
            0.33333333, 0.66666667, 0.66666667, 0.        , 1.        ,
            0.        , 0.        , 0.33333333, 0.33333333, 0.33333333,
            0.        , 0.33333333, 0.        , 0.33333333, 0.33333333],
           [0.        , 0.        , 0.        , 0.33333333, 0.        ,
            0.33333333, 0.        , 0.        , 0.        , 0.66666667,
            0.33333333, 0.        , 0.66666667, 0.66666667, 0.33333333,
            0.33333333, 0.33333333, 0.33333333, 0.33333333, 0.33333333,
            0.        , 0.33333333, 0.        , 0.        , 0.33333333,
            0.33333333, 0.33333333, 0.        , 0.        , 0.33333333,
            0.33333333, 0.        , 0.33333333, 0.        , 0.33333333,
            1.        , 0.66666667, 0.        , 0.        , 0.33333333,
            0.33333333, 0.        , 0.33333333, 0.33333333, 0.        ,
            0.33333333, 0.        , 0.        , 0.66666667, 0.33333333],
           [0.        , 0.        , 0.        , 0.33333333, 0.33333333,
            0.33333333, 0.        , 0.        , 0.        , 0.33333333,
            0.        , 0.        , 0.66666667, 0.33333333, 0.33333333,
            0.        , 0.66666667, 0.33333333, 0.33333333, 0.66666667,
            0.        , 0.33333333, 0.        , 0.33333333, 0.66666667,
            0.66666667, 0.        , 0.        , 0.        , 0.33333333,
            0.        , 0.33333333, 0.66666667, 0.        , 0.66666667,
            0.66666667, 1.        , 0.33333333, 0.        , 0.66666667,
            0.        , 0.        , 0.33333333, 0.66666667, 0.        ,
            0.33333333, 0.        , 0.        , 0.66666667, 0.        ],
           [0.33333333, 0.33333333, 0.33333333, 0.        , 0.33333333,
            0.33333333, 0.66666667, 0.        , 0.        , 0.        ,
            0.        , 0.        , 0.        , 0.        , 0.        ,
            0.        , 0.66666667, 0.33333333, 0.        , 0.33333333,
            0.        , 0.33333333, 0.        , 0.33333333, 0.66666667,
            0.33333333, 0.33333333, 0.        , 0.        , 0.        ,
            0.33333333, 0.33333333, 0.66666667, 0.        , 0.66666667,
            0.        , 0.33333333, 1.        , 0.        , 0.66666667,
            0.        , 0.33333333, 0.        , 0.33333333, 0.33333333,
            0.        , 0.66666667, 0.        , 0.        , 0.33333333],
           [0.33333333, 0.66666667, 0.33333333, 0.33333333, 0.33333333,
            0.        , 0.        , 0.33333333, 0.66666667, 0.33333333,
            0.        , 0.66666667, 0.        , 0.        , 0.        ,
            0.66666667, 0.        , 0.        , 0.33333333, 0.        ,
            0.33333333, 0.        , 0.        , 0.33333333, 0.        ,
            0.33333333, 0.33333333, 0.33333333, 0.33333333, 0.33333333,
            0.        , 0.33333333, 0.        , 1.        , 0.        ,
            0.        , 0.        , 0.        , 1.        , 0.        ,
            0.33333333, 0.33333333, 0.        , 0.        , 0.        ,
            0.33333333, 0.        , 1.        , 0.        , 0.        ],
           [0.        , 0.        , 0.        , 0.33333333, 0.33333333,
            0.        , 0.33333333, 0.        , 0.        , 0.33333333,
            0.        , 0.        , 0.33333333, 0.33333333, 0.33333333,
            0.        , 1.        , 0.        , 0.        , 0.66666667,
            0.        , 0.66666667, 0.        , 0.33333333, 0.33333333,
            0.33333333, 0.33333333, 0.        , 0.        , 0.33333333,
            0.33333333, 0.33333333, 1.        , 0.        , 1.        ,
            0.33333333, 0.66666667, 0.66666667, 0.        , 1.        ,
            0.        , 0.        , 0.33333333, 0.33333333, 0.33333333,
            0.        , 0.33333333, 0.        , 0.33333333, 0.33333333],
           [0.33333333, 0.33333333, 0.33333333, 0.33333333, 0.        ,
            0.        , 0.        , 0.33333333, 0.33333333, 0.66666667,
            0.66666667, 0.33333333, 0.        , 0.33333333, 0.        ,
            0.66666667, 0.        , 0.        , 0.        , 0.        ,
            0.66666667, 0.        , 0.33333333, 0.33333333, 0.        ,
            0.        , 0.33333333, 0.        , 0.33333333, 0.33333333,
            0.66666667, 0.        , 0.        , 0.33333333, 0.        ,
            0.33333333, 0.        , 0.        , 0.33333333, 0.        ,
            1.        , 0.33333333, 0.        , 0.33333333, 0.33333333,
            0.        , 0.        , 0.33333333, 0.        , 0.33333333],
           [0.66666667, 0.66666667, 1.        , 0.33333333, 0.        ,
            0.33333333, 0.33333333, 0.33333333, 0.33333333, 0.33333333,
            0.        , 0.33333333, 0.33333333, 0.        , 0.        ,
            0.33333333, 0.        , 0.33333333, 0.        , 0.        ,
            0.33333333, 0.        , 0.        , 0.33333333, 0.33333333,
            0.        , 0.        , 0.        , 0.33333333, 0.33333333,
            0.        , 0.        , 0.        , 0.33333333, 0.        ,
            0.        , 0.        , 0.33333333, 0.33333333, 0.        ,
            0.33333333, 1.        , 0.        , 0.        , 0.        ,
            0.        , 0.33333333, 0.33333333, 0.33333333, 0.        ],
           [0.        , 0.        , 0.        , 0.66666667, 0.33333333,
            0.33333333, 0.        , 0.33333333, 0.        , 0.33333333,
            0.33333333, 0.33333333, 0.33333333, 0.66666667, 0.66666667,
            0.        , 0.33333333, 0.        , 0.33333333, 0.66666667,
            0.        , 0.66666667, 0.33333333, 0.        , 0.        ,
            0.        , 0.        , 0.33333333, 0.        , 0.33333333,
            0.        , 0.33333333, 0.33333333, 0.        , 0.33333333,
            0.33333333, 0.33333333, 0.        , 0.        , 0.33333333,
            0.        , 0.        , 1.        , 0.        , 0.33333333,
            0.33333333, 0.        , 0.        , 0.33333333, 0.        ],
           [0.        , 0.        , 0.        , 0.        , 0.33333333,
            0.33333333, 0.        , 0.        , 0.        , 0.        ,
            0.33333333, 0.        , 0.33333333, 0.        , 0.        ,
            0.        , 0.33333333, 0.33333333, 0.33333333, 0.33333333,
            0.33333333, 0.        , 0.33333333, 0.33333333, 0.66666667,
            0.66666667, 0.        , 0.        , 0.        , 0.        ,
            0.33333333, 0.33333333, 0.33333333, 0.        , 0.33333333,
            0.33333333, 0.66666667, 0.33333333, 0.        , 0.33333333,
            0.33333333, 0.        , 0.        , 1.        , 0.33333333,
            0.33333333, 0.        , 0.        , 0.33333333, 0.        ],
           [0.        , 0.        , 0.        , 0.33333333, 0.        ,
            0.33333333, 0.33333333, 0.33333333, 0.        , 0.        ,
            0.33333333, 0.33333333, 0.        , 0.        , 0.        ,
            0.        , 0.33333333, 0.        , 0.33333333, 0.        ,
            0.33333333, 0.66666667, 0.33333333, 0.        , 0.        ,
            0.        , 0.33333333, 0.        , 0.        , 0.        ,
            0.66666667, 0.        , 0.33333333, 0.        , 0.33333333,
            0.        , 0.        , 0.33333333, 0.        , 0.33333333,
            0.33333333, 0.        , 0.33333333, 0.33333333, 1.        ,
            0.33333333, 0.33333333, 0.        , 0.        , 0.33333333],
           [0.        , 0.        , 0.        , 0.33333333, 0.33333333,
            0.66666667, 0.        , 0.33333333, 0.        , 0.        ,
            0.        , 0.66666667, 0.33333333, 0.        , 0.        ,
            0.33333333, 0.        , 0.33333333, 1.        , 0.        ,
            0.        , 0.33333333, 0.        , 0.        , 0.33333333,
            0.66666667, 0.33333333, 0.        , 0.        , 0.        ,
            0.        , 0.33333333, 0.        , 0.33333333, 0.        ,
            0.33333333, 0.33333333, 0.        , 0.33333333, 0.        ,
            0.        , 0.        , 0.33333333, 0.33333333, 0.33333333,
            1.        , 0.        , 0.33333333, 0.33333333, 0.        ],
           [0.66666667, 0.33333333, 0.33333333, 0.        , 0.        ,
            0.33333333, 1.        , 0.        , 0.        , 0.        ,
            0.        , 0.        , 0.        , 0.        , 0.33333333,
            0.        , 0.33333333, 0.66666667, 0.        , 0.        ,
            0.33333333, 0.33333333, 0.33333333, 0.        , 0.33333333,
            0.        , 0.33333333, 0.        , 0.33333333, 0.33333333,
            0.33333333, 0.        , 0.33333333, 0.        , 0.33333333,
            0.        , 0.        , 0.66666667, 0.        , 0.33333333,
            0.        , 0.33333333, 0.        , 0.        , 0.33333333,
            0.        , 1.        , 0.        , 0.        , 0.33333333],
           [0.33333333, 0.66666667, 0.33333333, 0.33333333, 0.33333333,
            0.        , 0.        , 0.33333333, 0.66666667, 0.33333333,
            0.        , 0.66666667, 0.        , 0.        , 0.        ,
            0.66666667, 0.        , 0.        , 0.33333333, 0.        ,
            0.33333333, 0.        , 0.        , 0.33333333, 0.        ,
            0.33333333, 0.33333333, 0.33333333, 0.33333333, 0.33333333,
            0.        , 0.33333333, 0.        , 1.        , 0.        ,
            0.        , 0.        , 0.        , 1.        , 0.        ,
            0.33333333, 0.33333333, 0.        , 0.        , 0.        ,
            0.33333333, 0.        , 1.        , 0.        , 0.        ],
           [0.        , 0.        , 0.33333333, 0.33333333, 0.        ,
            0.33333333, 0.        , 0.        , 0.        , 0.33333333,
            0.        , 0.        , 1.        , 0.33333333, 0.33333333,
            0.        , 0.33333333, 0.33333333, 0.33333333, 0.33333333,
            0.        , 0.33333333, 0.        , 0.        , 0.33333333,
            0.33333333, 0.        , 0.        , 0.        , 0.33333333,
            0.        , 0.        , 0.33333333, 0.        , 0.33333333,
            0.66666667, 0.66666667, 0.        , 0.        , 0.33333333,
            0.        , 0.33333333, 0.33333333, 0.33333333, 0.        ,
            0.33333333, 0.        , 0.        , 1.        , 0.        ],
           [0.        , 0.        , 0.        , 0.        , 0.        ,
            0.        , 0.33333333, 0.33333333, 0.33333333, 0.33333333,
            0.33333333, 0.        , 0.        , 0.33333333, 0.        ,
            0.33333333, 0.33333333, 0.        , 0.        , 0.        ,
            0.        , 0.33333333, 0.        , 0.33333333, 0.        ,
            0.        , 0.66666667, 0.33333333, 0.33333333, 0.        ,
            0.66666667, 0.        , 0.33333333, 0.        , 0.33333333,
            0.33333333, 0.        , 0.33333333, 0.        , 0.33333333,
            0.33333333, 0.        , 0.        , 0.        , 0.33333333,
            0.        , 0.33333333, 0.        , 0.        , 1.        ]])





----



 ####  Matches Distance Matrix in `R`   <a class="anchor" id="83"></a>



```r
%%R

Matches_Dist_Matrix_R <- function( Multiple_Categorical_Data ){
  
  Multiple_Categorical_Data=as.matrix(Multiple_Categorical_Data)

  M<-matrix(NA, ncol =dim(Multiple_Categorical_Data)[1] , nrow=dim(Multiple_Categorical_Data)[1] )
  
  for(i in 1:dim(Multiple_Categorical_Data)[1] ){
    for(j in 1:dim(Multiple_Categorical_Data)[1]){
    
  M[i,j]=Dist_Matches_R(i,j,  Multiple_Categorical_Data)
  
   }
  }
 return(M)
}
```


```r
%%R

Matches_Dist_Matrix_R(Multiple_Categorical_Data_R)[1:10 , 1:10]
```

               [,1]      [,2]      [,3]      [,4]     [,5]     [,6]      [,7]
     [1,] 0.0000000 0.8164966 0.8164966 1.1547005 1.414214 1.154701 0.8164966
     [2,] 0.8164966 0.0000000 0.8164966 1.1547005 1.414214 1.154701 1.1547005
     [3,] 0.8164966 0.8164966 0.0000000 1.1547005 1.414214 1.154701 1.1547005
     [4,] 1.1547005 1.1547005 1.1547005 0.0000000 1.414214 1.154701 1.4142136
     [5,] 1.4142136 1.4142136 1.4142136 1.4142136 0.000000 1.414214 1.4142136
     [6,] 1.1547005 1.1547005 1.1547005 1.1547005 1.414214 0.000000 1.1547005
     [7,] 0.8164966 1.1547005 1.1547005 1.4142136 1.414214 1.154701 0.0000000
     [8,] 1.1547005 1.1547005 1.1547005 0.8164966 1.414214 1.154701 1.4142136
     [9,] 1.1547005 0.8164966 1.1547005 1.1547005 1.414214 1.414214 1.4142136
    [10,] 1.1547005 1.1547005 1.1547005 0.8164966 1.414214 1.414214 1.4142136
               [,8]      [,9]     [,10]
     [1,] 1.1547005 1.1547005 1.1547005
     [2,] 1.1547005 0.8164966 1.1547005
     [3,] 1.1547005 1.1547005 1.1547005
     [4,] 0.8164966 1.1547005 0.8164966
     [5,] 1.4142136 1.4142136 1.4142136
     [6,] 1.1547005 1.4142136 1.4142136
     [7,] 1.4142136 1.4142136 1.4142136
     [8,] 0.0000000 0.8164966 1.1547005
     [9,] 0.8164966 0.0000000 1.1547005
    [10,] 1.1547005 1.1547005 0.0000000
    



---



 ####  Matches Distance Matrix in `Python`   <a class="anchor" id="84"></a>



```python
def Dist_Matches_Matrix_Python(Multiple_Categorical_Data):

    M = np.zeros((Multiple_Categorical_Data.shape[0] , Multiple_Categorical_Data.shape[0]))

    for i in range(0 , Multiple_Categorical_Data.shape[0]):
        for j in range(0 , Multiple_Categorical_Data.shape[0]):

            M[i,j] = Dist_Matches_Py(i+1, j+1, Multiple_Categorical_Data)
                 
    return M
```


```python
Dist_Matches_Matrix_Python(Multiple_Categorical_Data_Py)
```




    array([[0.        , 0.81649658, 0.81649658, 1.15470054, 1.41421356,
            1.15470054, 0.81649658, 1.15470054, 1.15470054, 1.15470054,
            1.41421356, 1.15470054, 1.41421356, 1.41421356, 1.15470054,
            1.15470054, 1.41421356, 0.81649658, 1.41421356, 1.41421356,
            0.81649658, 1.41421356, 1.15470054, 1.15470054, 1.15470054,
            1.41421356, 1.41421356, 1.41421356, 0.81649658, 0.81649658,
            1.41421356, 1.41421356, 1.41421356, 1.15470054, 1.41421356,
            1.41421356, 1.41421356, 1.15470054, 1.15470054, 1.41421356,
            1.15470054, 0.81649658, 1.41421356, 1.41421356, 1.41421356,
            1.41421356, 0.81649658, 1.15470054, 1.41421356, 1.41421356],
           [0.81649658, 0.        , 0.81649658, 1.15470054, 1.41421356,
            1.15470054, 1.15470054, 1.15470054, 0.81649658, 1.15470054,
            1.41421356, 1.15470054, 1.41421356, 1.41421356, 1.41421356,
            1.15470054, 1.41421356, 1.15470054, 1.41421356, 1.41421356,
            1.15470054, 1.41421356, 1.41421356, 1.15470054, 1.15470054,
            1.41421356, 1.41421356, 1.15470054, 1.15470054, 1.15470054,
            1.41421356, 1.41421356, 1.41421356, 0.81649658, 1.41421356,
            1.41421356, 1.41421356, 1.15470054, 0.81649658, 1.41421356,
            1.15470054, 0.81649658, 1.41421356, 1.41421356, 1.41421356,
            1.41421356, 1.15470054, 0.81649658, 1.41421356, 1.41421356],
           [0.81649658, 0.81649658, 0.        , 1.15470054, 1.41421356,
            1.15470054, 1.15470054, 1.15470054, 1.15470054, 1.15470054,
            1.41421356, 1.15470054, 1.15470054, 1.41421356, 1.41421356,
            1.15470054, 1.41421356, 1.15470054, 1.41421356, 1.41421356,
            1.15470054, 1.41421356, 1.41421356, 1.15470054, 1.15470054,
            1.41421356, 1.41421356, 1.41421356, 1.15470054, 1.15470054,
            1.41421356, 1.41421356, 1.41421356, 1.15470054, 1.41421356,
            1.41421356, 1.41421356, 1.15470054, 1.15470054, 1.41421356,
            1.15470054, 0.        , 1.41421356, 1.41421356, 1.41421356,
            1.41421356, 1.15470054, 1.15470054, 1.15470054, 1.41421356],
           [1.15470054, 1.15470054, 1.15470054, 0.        , 1.41421356,
            1.15470054, 1.41421356, 0.81649658, 1.15470054, 0.81649658,
            1.41421356, 0.81649658, 1.15470054, 1.15470054, 1.15470054,
            1.15470054, 1.15470054, 1.41421356, 1.15470054, 1.15470054,
            1.15470054, 0.81649658, 1.41421356, 1.15470054, 1.41421356,
            1.41421356, 1.41421356, 1.41421356, 1.15470054, 0.81649658,
            1.41421356, 1.41421356, 1.15470054, 1.15470054, 1.15470054,
            1.15470054, 1.15470054, 1.41421356, 1.15470054, 1.15470054,
            1.15470054, 1.15470054, 0.81649658, 1.41421356, 1.15470054,
            1.15470054, 1.41421356, 1.15470054, 1.15470054, 1.41421356],
           [1.41421356, 1.41421356, 1.41421356, 1.41421356, 0.        ,
            1.41421356, 1.41421356, 1.41421356, 1.41421356, 1.41421356,
            1.15470054, 1.15470054, 1.41421356, 1.15470054, 1.15470054,
            1.15470054, 1.15470054, 1.41421356, 1.15470054, 0.81649658,
            1.41421356, 1.41421356, 1.15470054, 1.15470054, 1.15470054,
            0.81649658, 1.15470054, 1.15470054, 1.41421356, 1.41421356,
            1.41421356, 0.        , 1.15470054, 1.15470054, 1.15470054,
            1.41421356, 1.15470054, 1.15470054, 1.15470054, 1.15470054,
            1.41421356, 1.41421356, 1.15470054, 1.15470054, 1.41421356,
            1.15470054, 1.41421356, 1.15470054, 1.41421356, 1.41421356],
           [1.15470054, 1.15470054, 1.15470054, 1.15470054, 1.41421356,
            0.        , 1.15470054, 1.15470054, 1.41421356, 1.41421356,
            1.41421356, 1.15470054, 1.15470054, 1.41421356, 1.41421356,
            1.41421356, 1.41421356, 0.81649658, 0.81649658, 1.41421356,
            1.41421356, 1.15470054, 1.41421356, 1.41421356, 0.81649658,
            1.15470054, 1.41421356, 1.41421356, 1.41421356, 1.41421356,
            1.41421356, 1.41421356, 1.41421356, 1.41421356, 1.41421356,
            1.15470054, 1.15470054, 1.15470054, 1.41421356, 1.41421356,
            1.41421356, 1.15470054, 1.15470054, 1.15470054, 1.15470054,
            0.81649658, 1.15470054, 1.41421356, 1.15470054, 1.41421356],
           [0.81649658, 1.15470054, 1.15470054, 1.41421356, 1.41421356,
            1.15470054, 0.        , 1.41421356, 1.41421356, 1.41421356,
            1.41421356, 1.41421356, 1.41421356, 1.41421356, 1.15470054,
            1.41421356, 1.15470054, 0.81649658, 1.41421356, 1.41421356,
            1.15470054, 1.15470054, 1.15470054, 1.41421356, 1.15470054,
            1.41421356, 1.15470054, 1.41421356, 1.15470054, 1.15470054,
            1.15470054, 1.41421356, 1.15470054, 1.41421356, 1.15470054,
            1.41421356, 1.41421356, 0.81649658, 1.41421356, 1.15470054,
            1.41421356, 1.15470054, 1.41421356, 1.41421356, 1.15470054,
            1.41421356, 0.        , 1.41421356, 1.41421356, 1.15470054],
           [1.15470054, 1.15470054, 1.15470054, 0.81649658, 1.41421356,
            1.15470054, 1.41421356, 0.        , 0.81649658, 1.15470054,
            1.41421356, 0.81649658, 1.41421356, 1.41421356, 1.41421356,
            1.15470054, 1.41421356, 1.41421356, 1.15470054, 1.41421356,
            1.15470054, 1.15470054, 1.41421356, 0.81649658, 1.41421356,
            1.41421356, 1.41421356, 1.15470054, 0.81649658, 1.15470054,
            1.41421356, 1.41421356, 1.41421356, 1.15470054, 1.41421356,
            1.41421356, 1.41421356, 1.41421356, 1.15470054, 1.41421356,
            1.15470054, 1.15470054, 1.15470054, 1.41421356, 1.15470054,
            1.15470054, 1.41421356, 1.15470054, 1.41421356, 1.15470054],
           [1.15470054, 0.81649658, 1.15470054, 1.15470054, 1.41421356,
            1.41421356, 1.41421356, 0.81649658, 0.        , 1.15470054,
            1.41421356, 1.15470054, 1.41421356, 1.41421356, 1.41421356,
            1.15470054, 1.41421356, 1.41421356, 1.41421356, 1.41421356,
            1.15470054, 1.41421356, 1.41421356, 0.81649658, 1.41421356,
            1.41421356, 1.41421356, 0.81649658, 0.81649658, 1.15470054,
            1.41421356, 1.41421356, 1.41421356, 0.81649658, 1.41421356,
            1.41421356, 1.41421356, 1.41421356, 0.81649658, 1.41421356,
            1.15470054, 1.15470054, 1.41421356, 1.41421356, 1.41421356,
            1.41421356, 1.41421356, 0.81649658, 1.41421356, 1.15470054],
           [1.15470054, 1.15470054, 1.15470054, 0.81649658, 1.41421356,
            1.41421356, 1.41421356, 1.15470054, 1.15470054, 0.        ,
            1.15470054, 1.15470054, 1.15470054, 0.81649658, 1.15470054,
            0.81649658, 1.15470054, 1.41421356, 1.41421356, 1.15470054,
            1.15470054, 1.15470054, 1.41421356, 1.15470054, 1.41421356,
            1.41421356, 1.15470054, 1.41421356, 1.15470054, 0.81649658,
            1.15470054, 1.41421356, 1.15470054, 1.15470054, 1.15470054,
            0.81649658, 1.15470054, 1.41421356, 1.15470054, 1.15470054,
            0.81649658, 1.15470054, 1.15470054, 1.41421356, 1.41421356,
            1.41421356, 1.41421356, 1.15470054, 1.15470054, 1.15470054],
           [1.41421356, 1.41421356, 1.41421356, 1.41421356, 1.15470054,
            1.41421356, 1.41421356, 1.41421356, 1.41421356, 1.15470054,
            0.        , 1.41421356, 1.41421356, 0.81649658, 1.15470054,
            1.15470054, 1.41421356, 1.41421356, 1.41421356, 1.15470054,
            1.15470054, 1.41421356, 0.81649658, 1.41421356, 1.41421356,
            1.41421356, 1.15470054, 1.15470054, 1.41421356, 1.41421356,
            0.81649658, 1.15470054, 1.41421356, 1.41421356, 1.41421356,
            1.15470054, 1.41421356, 1.41421356, 1.41421356, 1.41421356,
            0.81649658, 1.41421356, 1.15470054, 1.15470054, 1.15470054,
            1.41421356, 1.41421356, 1.41421356, 1.41421356, 1.15470054],
           [1.15470054, 1.15470054, 1.15470054, 0.81649658, 1.15470054,
            1.15470054, 1.41421356, 0.81649658, 1.15470054, 1.15470054,
            1.41421356, 0.        , 1.41421356, 1.41421356, 1.41421356,
            0.81649658, 1.41421356, 1.41421356, 0.81649658, 1.41421356,
            1.15470054, 1.15470054, 1.41421356, 1.15470054, 1.41421356,
            1.15470054, 1.15470054, 1.41421356, 1.15470054, 1.15470054,
            1.41421356, 1.15470054, 1.41421356, 0.81649658, 1.41421356,
            1.41421356, 1.41421356, 1.41421356, 0.81649658, 1.41421356,
            1.15470054, 1.15470054, 1.15470054, 1.41421356, 1.15470054,
            0.81649658, 1.41421356, 0.81649658, 1.41421356, 1.41421356],
           [1.41421356, 1.41421356, 1.15470054, 1.15470054, 1.41421356,
            1.15470054, 1.41421356, 1.41421356, 1.41421356, 1.15470054,
            1.41421356, 1.41421356, 0.        , 1.15470054, 1.15470054,
            1.41421356, 1.15470054, 1.15470054, 1.15470054, 1.15470054,
            1.41421356, 1.15470054, 1.41421356, 1.41421356, 1.15470054,
            1.15470054, 1.41421356, 1.41421356, 1.41421356, 1.15470054,
            1.41421356, 1.41421356, 1.15470054, 1.41421356, 1.15470054,
            0.81649658, 0.81649658, 1.41421356, 1.41421356, 1.15470054,
            1.41421356, 1.15470054, 1.15470054, 1.15470054, 1.41421356,
            1.15470054, 1.41421356, 1.41421356, 0.        , 1.41421356],
           [1.41421356, 1.41421356, 1.41421356, 1.15470054, 1.15470054,
            1.41421356, 1.41421356, 1.41421356, 1.41421356, 0.81649658,
            0.81649658, 1.41421356, 1.15470054, 0.        , 0.81649658,
            1.15470054, 1.15470054, 1.41421356, 1.41421356, 0.81649658,
            1.41421356, 1.15470054, 1.15470054, 1.41421356, 1.41421356,
            1.41421356, 1.15470054, 1.15470054, 1.41421356, 1.15470054,
            1.15470054, 1.15470054, 1.15470054, 1.41421356, 1.15470054,
            0.81649658, 1.15470054, 1.41421356, 1.41421356, 1.15470054,
            1.15470054, 1.41421356, 0.81649658, 1.41421356, 1.41421356,
            1.41421356, 1.41421356, 1.41421356, 1.15470054, 1.15470054],
           [1.15470054, 1.41421356, 1.41421356, 1.15470054, 1.15470054,
            1.41421356, 1.15470054, 1.41421356, 1.41421356, 1.15470054,
            1.15470054, 1.41421356, 1.15470054, 0.81649658, 0.        ,
            1.41421356, 1.15470054, 1.15470054, 1.41421356, 0.81649658,
            1.15470054, 1.15470054, 0.81649658, 1.41421356, 1.41421356,
            1.41421356, 1.41421356, 1.15470054, 1.15470054, 0.81649658,
            1.41421356, 1.15470054, 1.15470054, 1.41421356, 1.15470054,
            1.15470054, 1.15470054, 1.41421356, 1.41421356, 1.15470054,
            1.41421356, 1.41421356, 0.81649658, 1.41421356, 1.41421356,
            1.41421356, 1.15470054, 1.41421356, 1.15470054, 1.41421356],
           [1.15470054, 1.15470054, 1.15470054, 1.15470054, 1.15470054,
            1.41421356, 1.41421356, 1.15470054, 1.15470054, 0.81649658,
            1.15470054, 0.81649658, 1.41421356, 1.15470054, 1.41421356,
            0.        , 1.41421356, 1.41421356, 1.15470054, 1.41421356,
            1.15470054, 1.41421356, 1.41421356, 1.15470054, 1.41421356,
            1.15470054, 0.81649658, 1.41421356, 1.15470054, 1.15470054,
            1.15470054, 1.15470054, 1.41421356, 0.81649658, 1.41421356,
            1.15470054, 1.41421356, 1.41421356, 0.81649658, 1.41421356,
            0.81649658, 1.15470054, 1.41421356, 1.41421356, 1.41421356,
            1.15470054, 1.41421356, 0.81649658, 1.41421356, 1.15470054],
           [1.41421356, 1.41421356, 1.41421356, 1.15470054, 1.15470054,
            1.41421356, 1.15470054, 1.41421356, 1.41421356, 1.15470054,
            1.41421356, 1.41421356, 1.15470054, 1.15470054, 1.15470054,
            1.41421356, 0.        , 1.41421356, 1.41421356, 0.81649658,
            1.41421356, 0.81649658, 1.41421356, 1.15470054, 1.15470054,
            1.15470054, 1.15470054, 1.41421356, 1.41421356, 1.15470054,
            1.15470054, 1.15470054, 0.        , 1.41421356, 0.        ,
            1.15470054, 0.81649658, 0.81649658, 1.41421356, 0.        ,
            1.41421356, 1.41421356, 1.15470054, 1.15470054, 1.15470054,
            1.41421356, 1.15470054, 1.41421356, 1.15470054, 1.15470054],
           [0.81649658, 1.15470054, 1.15470054, 1.41421356, 1.41421356,
            0.81649658, 0.81649658, 1.41421356, 1.41421356, 1.41421356,
            1.41421356, 1.41421356, 1.15470054, 1.41421356, 1.15470054,
            1.41421356, 1.41421356, 0.        , 1.15470054, 1.41421356,
            1.15470054, 1.41421356, 1.15470054, 1.41421356, 0.81649658,
            1.15470054, 1.41421356, 1.41421356, 1.15470054, 1.15470054,
            1.41421356, 1.41421356, 1.41421356, 1.41421356, 1.41421356,
            1.15470054, 1.15470054, 1.15470054, 1.41421356, 1.41421356,
            1.41421356, 1.15470054, 1.41421356, 1.15470054, 1.41421356,
            1.15470054, 0.81649658, 1.41421356, 1.15470054, 1.41421356],
           [1.41421356, 1.41421356, 1.41421356, 1.15470054, 1.15470054,
            0.81649658, 1.41421356, 1.15470054, 1.41421356, 1.41421356,
            1.41421356, 0.81649658, 1.15470054, 1.41421356, 1.41421356,
            1.15470054, 1.41421356, 1.15470054, 0.        , 1.41421356,
            1.41421356, 1.15470054, 1.41421356, 1.41421356, 1.15470054,
            0.81649658, 1.15470054, 1.41421356, 1.41421356, 1.41421356,
            1.41421356, 1.15470054, 1.41421356, 1.15470054, 1.41421356,
            1.15470054, 1.15470054, 1.41421356, 1.15470054, 1.41421356,
            1.41421356, 1.41421356, 1.15470054, 1.15470054, 1.15470054,
            0.        , 1.41421356, 1.15470054, 1.15470054, 1.41421356],
           [1.41421356, 1.41421356, 1.41421356, 1.15470054, 0.81649658,
            1.41421356, 1.41421356, 1.41421356, 1.41421356, 1.15470054,
            1.15470054, 1.41421356, 1.15470054, 0.81649658, 0.81649658,
            1.41421356, 0.81649658, 1.41421356, 1.41421356, 0.        ,
            1.41421356, 1.15470054, 1.15470054, 1.15470054, 1.15470054,
            1.15470054, 1.41421356, 1.15470054, 1.41421356, 1.15470054,
            1.41421356, 0.81649658, 0.81649658, 1.41421356, 0.81649658,
            1.15470054, 0.81649658, 1.15470054, 1.41421356, 0.81649658,
            1.41421356, 1.41421356, 0.81649658, 1.15470054, 1.41421356,
            1.41421356, 1.41421356, 1.41421356, 1.15470054, 1.41421356],
           [0.81649658, 1.15470054, 1.15470054, 1.15470054, 1.41421356,
            1.41421356, 1.15470054, 1.15470054, 1.15470054, 1.15470054,
            1.15470054, 1.15470054, 1.41421356, 1.41421356, 1.15470054,
            1.15470054, 1.41421356, 1.15470054, 1.41421356, 1.41421356,
            0.        , 1.41421356, 0.81649658, 1.15470054, 1.41421356,
            1.41421356, 1.41421356, 1.41421356, 0.81649658, 0.81649658,
            1.15470054, 1.41421356, 1.41421356, 1.15470054, 1.41421356,
            1.41421356, 1.41421356, 1.41421356, 1.15470054, 1.41421356,
            0.81649658, 1.15470054, 1.41421356, 1.15470054, 1.15470054,
            1.41421356, 1.15470054, 1.15470054, 1.41421356, 1.41421356],
           [1.41421356, 1.41421356, 1.41421356, 0.81649658, 1.41421356,
            1.15470054, 1.15470054, 1.15470054, 1.41421356, 1.15470054,
            1.41421356, 1.15470054, 1.15470054, 1.15470054, 1.15470054,
            1.41421356, 0.81649658, 1.41421356, 1.15470054, 1.15470054,
            1.41421356, 0.        , 1.41421356, 1.41421356, 1.41421356,
            1.41421356, 1.15470054, 1.41421356, 1.41421356, 1.15470054,
            1.15470054, 1.41421356, 0.81649658, 1.41421356, 0.81649658,
            1.15470054, 1.15470054, 1.15470054, 1.41421356, 0.81649658,
            1.41421356, 1.41421356, 0.81649658, 1.41421356, 0.81649658,
            1.15470054, 1.15470054, 1.41421356, 1.15470054, 1.15470054],
           [1.15470054, 1.41421356, 1.41421356, 1.41421356, 1.15470054,
            1.41421356, 1.15470054, 1.41421356, 1.41421356, 1.41421356,
            0.81649658, 1.41421356, 1.41421356, 1.15470054, 0.81649658,
            1.41421356, 1.41421356, 1.15470054, 1.41421356, 1.15470054,
            0.81649658, 1.41421356, 0.        , 1.41421356, 1.41421356,
            1.41421356, 1.41421356, 1.15470054, 1.15470054, 1.15470054,
            1.15470054, 1.15470054, 1.41421356, 1.41421356, 1.41421356,
            1.41421356, 1.41421356, 1.41421356, 1.41421356, 1.41421356,
            1.15470054, 1.41421356, 1.15470054, 1.15470054, 1.15470054,
            1.41421356, 1.15470054, 1.41421356, 1.41421356, 1.41421356],
           [1.15470054, 1.15470054, 1.15470054, 1.15470054, 1.15470054,
            1.41421356, 1.41421356, 0.81649658, 0.81649658, 1.15470054,
            1.41421356, 1.15470054, 1.41421356, 1.41421356, 1.41421356,
            1.15470054, 1.15470054, 1.41421356, 1.41421356, 1.15470054,
            1.15470054, 1.41421356, 1.41421356, 0.        , 1.15470054,
            1.15470054, 1.41421356, 1.15470054, 0.81649658, 1.15470054,
            1.41421356, 1.15470054, 1.15470054, 1.15470054, 1.15470054,
            1.41421356, 1.15470054, 1.15470054, 1.15470054, 1.15470054,
            1.15470054, 1.15470054, 1.41421356, 1.15470054, 1.41421356,
            1.41421356, 1.41421356, 1.15470054, 1.41421356, 1.15470054],
           [1.15470054, 1.15470054, 1.15470054, 1.41421356, 1.15470054,
            0.81649658, 1.15470054, 1.41421356, 1.41421356, 1.41421356,
            1.41421356, 1.41421356, 1.15470054, 1.41421356, 1.41421356,
            1.41421356, 1.15470054, 0.81649658, 1.15470054, 1.15470054,
            1.41421356, 1.41421356, 1.41421356, 1.15470054, 0.        ,
            0.81649658, 1.41421356, 1.41421356, 1.41421356, 1.41421356,
            1.41421356, 1.15470054, 1.15470054, 1.41421356, 1.15470054,
            1.15470054, 0.81649658, 0.81649658, 1.41421356, 1.15470054,
            1.41421356, 1.15470054, 1.41421356, 0.81649658, 1.41421356,
            1.15470054, 1.15470054, 1.41421356, 1.15470054, 1.41421356],
           [1.41421356, 1.41421356, 1.41421356, 1.41421356, 0.81649658,
            1.15470054, 1.41421356, 1.41421356, 1.41421356, 1.41421356,
            1.41421356, 1.15470054, 1.15470054, 1.41421356, 1.41421356,
            1.15470054, 1.15470054, 1.15470054, 0.81649658, 1.15470054,
            1.41421356, 1.41421356, 1.41421356, 1.15470054, 0.81649658,
            0.        , 1.15470054, 1.41421356, 1.41421356, 1.41421356,
            1.41421356, 0.81649658, 1.15470054, 1.15470054, 1.15470054,
            1.15470054, 0.81649658, 1.15470054, 1.15470054, 1.15470054,
            1.41421356, 1.41421356, 1.41421356, 0.81649658, 1.41421356,
            0.81649658, 1.41421356, 1.15470054, 1.15470054, 1.41421356],
           [1.41421356, 1.41421356, 1.41421356, 1.41421356, 1.15470054,
            1.41421356, 1.15470054, 1.41421356, 1.41421356, 1.15470054,
            1.15470054, 1.15470054, 1.41421356, 1.15470054, 1.41421356,
            0.81649658, 1.15470054, 1.41421356, 1.15470054, 1.41421356,
            1.41421356, 1.15470054, 1.41421356, 1.41421356, 1.41421356,
            1.15470054, 0.        , 1.41421356, 1.41421356, 1.41421356,
            0.81649658, 1.15470054, 1.15470054, 1.15470054, 1.15470054,
            1.15470054, 1.41421356, 1.15470054, 1.15470054, 1.15470054,
            1.15470054, 1.41421356, 1.41421356, 1.41421356, 1.15470054,
            1.15470054, 1.15470054, 1.15470054, 1.41421356, 0.81649658],
           [1.41421356, 1.15470054, 1.41421356, 1.41421356, 1.15470054,
            1.41421356, 1.41421356, 1.15470054, 0.81649658, 1.41421356,
            1.15470054, 1.41421356, 1.41421356, 1.15470054, 1.15470054,
            1.41421356, 1.41421356, 1.41421356, 1.41421356, 1.15470054,
            1.41421356, 1.41421356, 1.15470054, 1.15470054, 1.41421356,
            1.41421356, 1.41421356, 0.        , 1.15470054, 1.41421356,
            1.41421356, 1.15470054, 1.41421356, 1.15470054, 1.41421356,
            1.41421356, 1.41421356, 1.41421356, 1.15470054, 1.41421356,
            1.41421356, 1.41421356, 1.15470054, 1.41421356, 1.41421356,
            1.41421356, 1.41421356, 1.15470054, 1.41421356, 1.15470054],
           [0.81649658, 1.15470054, 1.15470054, 1.15470054, 1.41421356,
            1.41421356, 1.15470054, 0.81649658, 0.81649658, 1.15470054,
            1.41421356, 1.15470054, 1.41421356, 1.41421356, 1.15470054,
            1.15470054, 1.41421356, 1.15470054, 1.41421356, 1.41421356,
            0.81649658, 1.41421356, 1.15470054, 0.81649658, 1.41421356,
            1.41421356, 1.41421356, 1.15470054, 0.        , 0.81649658,
            1.41421356, 1.41421356, 1.41421356, 1.15470054, 1.41421356,
            1.41421356, 1.41421356, 1.41421356, 1.15470054, 1.41421356,
            1.15470054, 1.15470054, 1.41421356, 1.41421356, 1.41421356,
            1.41421356, 1.15470054, 1.15470054, 1.41421356, 1.15470054],
           [0.81649658, 1.15470054, 1.15470054, 0.81649658, 1.41421356,
            1.41421356, 1.15470054, 1.15470054, 1.15470054, 0.81649658,
            1.41421356, 1.15470054, 1.15470054, 1.15470054, 0.81649658,
            1.15470054, 1.15470054, 1.15470054, 1.41421356, 1.15470054,
            0.81649658, 1.15470054, 1.15470054, 1.15470054, 1.41421356,
            1.41421356, 1.41421356, 1.41421356, 0.81649658, 0.        ,
            1.41421356, 1.41421356, 1.15470054, 1.15470054, 1.15470054,
            1.15470054, 1.15470054, 1.41421356, 1.15470054, 1.15470054,
            1.15470054, 1.15470054, 1.15470054, 1.41421356, 1.41421356,
            1.41421356, 1.15470054, 1.15470054, 1.15470054, 1.41421356],
           [1.41421356, 1.41421356, 1.41421356, 1.41421356, 1.41421356,
            1.41421356, 1.15470054, 1.41421356, 1.41421356, 1.15470054,
            0.81649658, 1.41421356, 1.41421356, 1.15470054, 1.41421356,
            1.15470054, 1.15470054, 1.41421356, 1.41421356, 1.41421356,
            1.15470054, 1.15470054, 1.15470054, 1.41421356, 1.41421356,
            1.41421356, 0.81649658, 1.41421356, 1.41421356, 1.41421356,
            0.        , 1.41421356, 1.15470054, 1.41421356, 1.15470054,
            1.15470054, 1.41421356, 1.15470054, 1.41421356, 1.15470054,
            0.81649658, 1.41421356, 1.41421356, 1.15470054, 0.81649658,
            1.41421356, 1.15470054, 1.41421356, 1.41421356, 0.81649658],
           [1.41421356, 1.41421356, 1.41421356, 1.41421356, 0.        ,
            1.41421356, 1.41421356, 1.41421356, 1.41421356, 1.41421356,
            1.15470054, 1.15470054, 1.41421356, 1.15470054, 1.15470054,
            1.15470054, 1.15470054, 1.41421356, 1.15470054, 0.81649658,
            1.41421356, 1.41421356, 1.15470054, 1.15470054, 1.15470054,
            0.81649658, 1.15470054, 1.15470054, 1.41421356, 1.41421356,
            1.41421356, 0.        , 1.15470054, 1.15470054, 1.15470054,
            1.41421356, 1.15470054, 1.15470054, 1.15470054, 1.15470054,
            1.41421356, 1.41421356, 1.15470054, 1.15470054, 1.41421356,
            1.15470054, 1.41421356, 1.15470054, 1.41421356, 1.41421356],
           [1.41421356, 1.41421356, 1.41421356, 1.15470054, 1.15470054,
            1.41421356, 1.15470054, 1.41421356, 1.41421356, 1.15470054,
            1.41421356, 1.41421356, 1.15470054, 1.15470054, 1.15470054,
            1.41421356, 0.        , 1.41421356, 1.41421356, 0.81649658,
            1.41421356, 0.81649658, 1.41421356, 1.15470054, 1.15470054,
            1.15470054, 1.15470054, 1.41421356, 1.41421356, 1.15470054,
            1.15470054, 1.15470054, 0.        , 1.41421356, 0.        ,
            1.15470054, 0.81649658, 0.81649658, 1.41421356, 0.        ,
            1.41421356, 1.41421356, 1.15470054, 1.15470054, 1.15470054,
            1.41421356, 1.15470054, 1.41421356, 1.15470054, 1.15470054],
           [1.15470054, 0.81649658, 1.15470054, 1.15470054, 1.15470054,
            1.41421356, 1.41421356, 1.15470054, 0.81649658, 1.15470054,
            1.41421356, 0.81649658, 1.41421356, 1.41421356, 1.41421356,
            0.81649658, 1.41421356, 1.41421356, 1.15470054, 1.41421356,
            1.15470054, 1.41421356, 1.41421356, 1.15470054, 1.41421356,
            1.15470054, 1.15470054, 1.15470054, 1.15470054, 1.15470054,
            1.41421356, 1.15470054, 1.41421356, 0.        , 1.41421356,
            1.41421356, 1.41421356, 1.41421356, 0.        , 1.41421356,
            1.15470054, 1.15470054, 1.41421356, 1.41421356, 1.41421356,
            1.15470054, 1.41421356, 0.        , 1.41421356, 1.41421356],
           [1.41421356, 1.41421356, 1.41421356, 1.15470054, 1.15470054,
            1.41421356, 1.15470054, 1.41421356, 1.41421356, 1.15470054,
            1.41421356, 1.41421356, 1.15470054, 1.15470054, 1.15470054,
            1.41421356, 0.        , 1.41421356, 1.41421356, 0.81649658,
            1.41421356, 0.81649658, 1.41421356, 1.15470054, 1.15470054,
            1.15470054, 1.15470054, 1.41421356, 1.41421356, 1.15470054,
            1.15470054, 1.15470054, 0.        , 1.41421356, 0.        ,
            1.15470054, 0.81649658, 0.81649658, 1.41421356, 0.        ,
            1.41421356, 1.41421356, 1.15470054, 1.15470054, 1.15470054,
            1.41421356, 1.15470054, 1.41421356, 1.15470054, 1.15470054],
           [1.41421356, 1.41421356, 1.41421356, 1.15470054, 1.41421356,
            1.15470054, 1.41421356, 1.41421356, 1.41421356, 0.81649658,
            1.15470054, 1.41421356, 0.81649658, 0.81649658, 1.15470054,
            1.15470054, 1.15470054, 1.15470054, 1.15470054, 1.15470054,
            1.41421356, 1.15470054, 1.41421356, 1.41421356, 1.15470054,
            1.15470054, 1.15470054, 1.41421356, 1.41421356, 1.15470054,
            1.15470054, 1.41421356, 1.15470054, 1.41421356, 1.15470054,
            0.        , 0.81649658, 1.41421356, 1.41421356, 1.15470054,
            1.15470054, 1.41421356, 1.15470054, 1.15470054, 1.41421356,
            1.15470054, 1.41421356, 1.41421356, 0.81649658, 1.15470054],
           [1.41421356, 1.41421356, 1.41421356, 1.15470054, 1.15470054,
            1.15470054, 1.41421356, 1.41421356, 1.41421356, 1.15470054,
            1.41421356, 1.41421356, 0.81649658, 1.15470054, 1.15470054,
            1.41421356, 0.81649658, 1.15470054, 1.15470054, 0.81649658,
            1.41421356, 1.15470054, 1.41421356, 1.15470054, 0.81649658,
            0.81649658, 1.41421356, 1.41421356, 1.41421356, 1.15470054,
            1.41421356, 1.15470054, 0.81649658, 1.41421356, 0.81649658,
            0.81649658, 0.        , 1.15470054, 1.41421356, 0.81649658,
            1.41421356, 1.41421356, 1.15470054, 0.81649658, 1.41421356,
            1.15470054, 1.41421356, 1.41421356, 0.81649658, 1.41421356],
           [1.15470054, 1.15470054, 1.15470054, 1.41421356, 1.15470054,
            1.15470054, 0.81649658, 1.41421356, 1.41421356, 1.41421356,
            1.41421356, 1.41421356, 1.41421356, 1.41421356, 1.41421356,
            1.41421356, 0.81649658, 1.15470054, 1.41421356, 1.15470054,
            1.41421356, 1.15470054, 1.41421356, 1.15470054, 0.81649658,
            1.15470054, 1.15470054, 1.41421356, 1.41421356, 1.41421356,
            1.15470054, 1.15470054, 0.81649658, 1.41421356, 0.81649658,
            1.41421356, 1.15470054, 0.        , 1.41421356, 0.81649658,
            1.41421356, 1.15470054, 1.41421356, 1.15470054, 1.15470054,
            1.41421356, 0.81649658, 1.41421356, 1.41421356, 1.15470054],
           [1.15470054, 0.81649658, 1.15470054, 1.15470054, 1.15470054,
            1.41421356, 1.41421356, 1.15470054, 0.81649658, 1.15470054,
            1.41421356, 0.81649658, 1.41421356, 1.41421356, 1.41421356,
            0.81649658, 1.41421356, 1.41421356, 1.15470054, 1.41421356,
            1.15470054, 1.41421356, 1.41421356, 1.15470054, 1.41421356,
            1.15470054, 1.15470054, 1.15470054, 1.15470054, 1.15470054,
            1.41421356, 1.15470054, 1.41421356, 0.        , 1.41421356,
            1.41421356, 1.41421356, 1.41421356, 0.        , 1.41421356,
            1.15470054, 1.15470054, 1.41421356, 1.41421356, 1.41421356,
            1.15470054, 1.41421356, 0.        , 1.41421356, 1.41421356],
           [1.41421356, 1.41421356, 1.41421356, 1.15470054, 1.15470054,
            1.41421356, 1.15470054, 1.41421356, 1.41421356, 1.15470054,
            1.41421356, 1.41421356, 1.15470054, 1.15470054, 1.15470054,
            1.41421356, 0.        , 1.41421356, 1.41421356, 0.81649658,
            1.41421356, 0.81649658, 1.41421356, 1.15470054, 1.15470054,
            1.15470054, 1.15470054, 1.41421356, 1.41421356, 1.15470054,
            1.15470054, 1.15470054, 0.        , 1.41421356, 0.        ,
            1.15470054, 0.81649658, 0.81649658, 1.41421356, 0.        ,
            1.41421356, 1.41421356, 1.15470054, 1.15470054, 1.15470054,
            1.41421356, 1.15470054, 1.41421356, 1.15470054, 1.15470054],
           [1.15470054, 1.15470054, 1.15470054, 1.15470054, 1.41421356,
            1.41421356, 1.41421356, 1.15470054, 1.15470054, 0.81649658,
            0.81649658, 1.15470054, 1.41421356, 1.15470054, 1.41421356,
            0.81649658, 1.41421356, 1.41421356, 1.41421356, 1.41421356,
            0.81649658, 1.41421356, 1.15470054, 1.15470054, 1.41421356,
            1.41421356, 1.15470054, 1.41421356, 1.15470054, 1.15470054,
            0.81649658, 1.41421356, 1.41421356, 1.15470054, 1.41421356,
            1.15470054, 1.41421356, 1.41421356, 1.15470054, 1.41421356,
            0.        , 1.15470054, 1.41421356, 1.15470054, 1.15470054,
            1.41421356, 1.41421356, 1.15470054, 1.41421356, 1.15470054],
           [0.81649658, 0.81649658, 0.        , 1.15470054, 1.41421356,
            1.15470054, 1.15470054, 1.15470054, 1.15470054, 1.15470054,
            1.41421356, 1.15470054, 1.15470054, 1.41421356, 1.41421356,
            1.15470054, 1.41421356, 1.15470054, 1.41421356, 1.41421356,
            1.15470054, 1.41421356, 1.41421356, 1.15470054, 1.15470054,
            1.41421356, 1.41421356, 1.41421356, 1.15470054, 1.15470054,
            1.41421356, 1.41421356, 1.41421356, 1.15470054, 1.41421356,
            1.41421356, 1.41421356, 1.15470054, 1.15470054, 1.41421356,
            1.15470054, 0.        , 1.41421356, 1.41421356, 1.41421356,
            1.41421356, 1.15470054, 1.15470054, 1.15470054, 1.41421356],
           [1.41421356, 1.41421356, 1.41421356, 0.81649658, 1.15470054,
            1.15470054, 1.41421356, 1.15470054, 1.41421356, 1.15470054,
            1.15470054, 1.15470054, 1.15470054, 0.81649658, 0.81649658,
            1.41421356, 1.15470054, 1.41421356, 1.15470054, 0.81649658,
            1.41421356, 0.81649658, 1.15470054, 1.41421356, 1.41421356,
            1.41421356, 1.41421356, 1.15470054, 1.41421356, 1.15470054,
            1.41421356, 1.15470054, 1.15470054, 1.41421356, 1.15470054,
            1.15470054, 1.15470054, 1.41421356, 1.41421356, 1.15470054,
            1.41421356, 1.41421356, 0.        , 1.41421356, 1.15470054,
            1.15470054, 1.41421356, 1.41421356, 1.15470054, 1.41421356],
           [1.41421356, 1.41421356, 1.41421356, 1.41421356, 1.15470054,
            1.15470054, 1.41421356, 1.41421356, 1.41421356, 1.41421356,
            1.15470054, 1.41421356, 1.15470054, 1.41421356, 1.41421356,
            1.41421356, 1.15470054, 1.15470054, 1.15470054, 1.15470054,
            1.15470054, 1.41421356, 1.15470054, 1.15470054, 0.81649658,
            0.81649658, 1.41421356, 1.41421356, 1.41421356, 1.41421356,
            1.15470054, 1.15470054, 1.15470054, 1.41421356, 1.15470054,
            1.15470054, 0.81649658, 1.15470054, 1.41421356, 1.15470054,
            1.15470054, 1.41421356, 1.41421356, 0.        , 1.15470054,
            1.15470054, 1.41421356, 1.41421356, 1.15470054, 1.41421356],
           [1.41421356, 1.41421356, 1.41421356, 1.15470054, 1.41421356,
            1.15470054, 1.15470054, 1.15470054, 1.41421356, 1.41421356,
            1.15470054, 1.15470054, 1.41421356, 1.41421356, 1.41421356,
            1.41421356, 1.15470054, 1.41421356, 1.15470054, 1.41421356,
            1.15470054, 0.81649658, 1.15470054, 1.41421356, 1.41421356,
            1.41421356, 1.15470054, 1.41421356, 1.41421356, 1.41421356,
            0.81649658, 1.41421356, 1.15470054, 1.41421356, 1.15470054,
            1.41421356, 1.41421356, 1.15470054, 1.41421356, 1.15470054,
            1.15470054, 1.41421356, 1.15470054, 1.15470054, 0.        ,
            1.15470054, 1.15470054, 1.41421356, 1.41421356, 1.15470054],
           [1.41421356, 1.41421356, 1.41421356, 1.15470054, 1.15470054,
            0.81649658, 1.41421356, 1.15470054, 1.41421356, 1.41421356,
            1.41421356, 0.81649658, 1.15470054, 1.41421356, 1.41421356,
            1.15470054, 1.41421356, 1.15470054, 0.        , 1.41421356,
            1.41421356, 1.15470054, 1.41421356, 1.41421356, 1.15470054,
            0.81649658, 1.15470054, 1.41421356, 1.41421356, 1.41421356,
            1.41421356, 1.15470054, 1.41421356, 1.15470054, 1.41421356,
            1.15470054, 1.15470054, 1.41421356, 1.15470054, 1.41421356,
            1.41421356, 1.41421356, 1.15470054, 1.15470054, 1.15470054,
            0.        , 1.41421356, 1.15470054, 1.15470054, 1.41421356],
           [0.81649658, 1.15470054, 1.15470054, 1.41421356, 1.41421356,
            1.15470054, 0.        , 1.41421356, 1.41421356, 1.41421356,
            1.41421356, 1.41421356, 1.41421356, 1.41421356, 1.15470054,
            1.41421356, 1.15470054, 0.81649658, 1.41421356, 1.41421356,
            1.15470054, 1.15470054, 1.15470054, 1.41421356, 1.15470054,
            1.41421356, 1.15470054, 1.41421356, 1.15470054, 1.15470054,
            1.15470054, 1.41421356, 1.15470054, 1.41421356, 1.15470054,
            1.41421356, 1.41421356, 0.81649658, 1.41421356, 1.15470054,
            1.41421356, 1.15470054, 1.41421356, 1.41421356, 1.15470054,
            1.41421356, 0.        , 1.41421356, 1.41421356, 1.15470054],
           [1.15470054, 0.81649658, 1.15470054, 1.15470054, 1.15470054,
            1.41421356, 1.41421356, 1.15470054, 0.81649658, 1.15470054,
            1.41421356, 0.81649658, 1.41421356, 1.41421356, 1.41421356,
            0.81649658, 1.41421356, 1.41421356, 1.15470054, 1.41421356,
            1.15470054, 1.41421356, 1.41421356, 1.15470054, 1.41421356,
            1.15470054, 1.15470054, 1.15470054, 1.15470054, 1.15470054,
            1.41421356, 1.15470054, 1.41421356, 0.        , 1.41421356,
            1.41421356, 1.41421356, 1.41421356, 0.        , 1.41421356,
            1.15470054, 1.15470054, 1.41421356, 1.41421356, 1.41421356,
            1.15470054, 1.41421356, 0.        , 1.41421356, 1.41421356],
           [1.41421356, 1.41421356, 1.15470054, 1.15470054, 1.41421356,
            1.15470054, 1.41421356, 1.41421356, 1.41421356, 1.15470054,
            1.41421356, 1.41421356, 0.        , 1.15470054, 1.15470054,
            1.41421356, 1.15470054, 1.15470054, 1.15470054, 1.15470054,
            1.41421356, 1.15470054, 1.41421356, 1.41421356, 1.15470054,
            1.15470054, 1.41421356, 1.41421356, 1.41421356, 1.15470054,
            1.41421356, 1.41421356, 1.15470054, 1.41421356, 1.15470054,
            0.81649658, 0.81649658, 1.41421356, 1.41421356, 1.15470054,
            1.41421356, 1.15470054, 1.15470054, 1.15470054, 1.41421356,
            1.15470054, 1.41421356, 1.41421356, 0.        , 1.41421356],
           [1.41421356, 1.41421356, 1.41421356, 1.41421356, 1.41421356,
            1.41421356, 1.15470054, 1.15470054, 1.15470054, 1.15470054,
            1.15470054, 1.41421356, 1.41421356, 1.15470054, 1.41421356,
            1.15470054, 1.15470054, 1.41421356, 1.41421356, 1.41421356,
            1.41421356, 1.15470054, 1.41421356, 1.15470054, 1.41421356,
            1.41421356, 0.81649658, 1.15470054, 1.15470054, 1.41421356,
            0.81649658, 1.41421356, 1.15470054, 1.41421356, 1.15470054,
            1.15470054, 1.41421356, 1.15470054, 1.41421356, 1.15470054,
            1.15470054, 1.41421356, 1.41421356, 1.41421356, 1.15470054,
            1.41421356, 1.15470054, 1.41421356, 1.41421356, 0.        ]])





Mas coeficentes de similaridad:

 
<img src="similaridades 3.jpg" width=420 height=200 >



---



 ## Distances with Mixed Variables  <a class="anchor" id="76"></a>


Let $X=(X_1,...,X_p)$ be a mixed data matrix such that:

$X_1,...,X_{p_1} \hspace{0.1cm}$ are quantitative variables

$X_{p_1 + 1},...,X_{p_1 + p_2} \hspace{0.1cm}$ are binary categorical variables

$X_{p_1 + p_2 + 1},...,X_{p_1 + p_2 + p_3} \hspace{0.1cm}$ are multiple categorical variables (non-binary).

Where: $\hspace{0.2cm} p=p_1 + p_2 + p_3$




 ### Gower Similarity Coefficient  <a class="anchor" id="86"></a>




The Gower coefficient of similarity between the elements $i$ and $j$ with respect to the variables $X_1,...,X_p$ is:



\begin{gather*}
S(i,j)_{Gower}=\dfrac{\sum_{k=1}^{p_1} \left(1- \dfrac{\mid x_{ik} - x_{jk} \mid}{G_k} \right) + a_{ij} + \alpha_{ij} }{p_1 + (p_2 - d_{ij}) + p_3}
\end{gather*}



Where:

$p_1 \hspace{0.05cm} $ is the number of quantitative variables

$p_2 \hspace{0.05cm} $ is the number of binary categorical variables

$p_3 \hspace{0.05cm}  $ is the number of multiple (non-binary) categorical variables

$p_1+p_2+p_3=p$

$G_k \hspace{0.05cm} $ is the range of the $k$-th quantitative variable  $\hspace{0.1cm} \left( G_k = max(X_k) - min(X_k) \right)$ 

$a_{ij} \hspace{0.05cm} $ is the number of binary variables (there are $\hspace{0.05cm} p_2\hspace{0.05cm} $) for which the answer is 1 in both individuals $i$ and $j$

$d_{ij} \hspace{0.05cm} $ is the number of binary variables (there are $\hspace{0.05cm}  p_2 \hspace{0.05cm} $) for which the response is 0 in both individuals $i$ and $j$

$\alpha_{ij} \hspace{0.05cm} $ is the number of matches (coincidencias) between multiple non-binary categorical variables (there are $\hspace{0.05cm}  p_3 \hspace{0.05cm} $) for individuals $i$ and $j$




 ### Gower Distance   <a class="anchor" id="87"></a>



The Gower distance is obtained as:



\begin{gather*}
\delta(i,j)_{Gower} = \sqrt{1 - S(i,j)_{Gower}}
\end{gather*}





 ### Properties   


- Gower's similarity coefficient is the sum of different coefficients appropriate for each type of variable.

- If we only have quantitative variables, the distance obtained is:

\begin{gather*}
\dfrac{1}{p} \sum_{k=1}^{p } \left(1- \dfrac{\mid x_{ik} - x_{jk} \mid}{G_k} \right)
\end{gather*}

- If we only have binary categorical variables, Gower's coefficient of similarity coincides with Jaccard's.

- If we only have multiclass categorical variables, the Gower d coefficient matches the matches coefficient.




With this idea, other similarity coefficients can be constructed for data of mixed type. Some recommendations for this are the following:

If the resulting coefficient is to have the Euclidean property, all the coefficients that are combined must have it.

For quantitative variables, coefficients should be used that divide each comparison by a normalization factor before adding.

For binary and qualitative variables, those coefficients that take values ​​in [0,1] will be preferred to avoid rescaling the similarities before adding



---



 #### Gower Similarity in `R`   <a class="anchor" id="88"></a>



```r
%%R
 
Similaridad_Gower <- function(i,j,   Matriz_Datos_Mixtos, p1, p2, p3){

  X=as.matrix(Matriz_Datos_Mixtos) #tienen que estar las variables ordenadas del siguiente modo: las p1 primeras son cuantitativas, las p2 siguientes son binarias, las p3 siguientes son categoricas multiples (no binarias). De modo que p=p1+p2+p3
  
###################### 
  G <- function(k, X){

  G = max(X[ ,k])-min(X[ ,k])

  return(G)
  }
######################
  
  G_vector <- rep(0, p1)
  
  for(r in 1:p1){
  G_vector[r]=G(r, X)
  }

######################

  Matriz_Datos_Binarios = X[ , (p1+1):(p2+p1)]
  
  a = Matriz_Datos_Binarios %*% t(Matriz_Datos_Binarios)
  
  unos <- rep(1, dim(Matriz_Datos_Binarios)[2])

  Matriz_Unos <- matrix( rep(unos, dim(Matriz_Datos_Binarios)[1]), ncol=dim(Matriz_Datos_Binarios)[2])
                
  d = (Matriz_Unos - Matriz_Datos_Binarios)%*%t(Matriz_Unos - Matriz_Datos_Binarios)   
  
  Matriz_Datos_Categoricos_Multiples = X[ , (p1+p2+1):(p1+p2+p3)]
  
  Matriz_Datos_Cuantitativos = X[ , 1:p1]
  
Similaridad_Gower = (  sum( 1 - abs(Matriz_Datos_Cuantitativos[i,] - Matriz_Datos_Cuantitativos[j,])/G_vector ) + a[i,j] + alpha(i,j,Matriz_Datos_Categoricos_Multiples)  ) / (p1+p2- d[i,j] + p3)
  
return(Similaridad_Gower)

}
```


```r
%%R

Mixed_Data_R <- Data_set_R 
```


```r
%%R

head(Mixed_Data_R)
```

              X1        X2        X3         X4 X5 X6 X7 X8 X9 X10
    1  -6.284459 -9.411280  19.63082  13.807247  0  0  1  3  1   4
    2  24.960182 -5.581823 -19.66832  14.255880  1  1  1  3  1   3
    3  14.244677 36.155683  20.68397 -11.178333  1  0  0  3  1   0
    4 -12.594421 -1.970941  48.97456 -18.153030  0  1  0  1  1   1
    5   1.320996 10.445248   9.63061  -5.294826  0  1  0  2  3   2
    6  34.771548 26.039740  10.51213  12.519134  1  1  1  3  0   1
    


```r
 %%R

 Similaridad_Gower(1,3, Mixed_Data_R, p1=4, p2=3, p3=3)
```

    [1] 0.5165893
    



---



 #### Gower Similarity in `Python`   <a class="anchor" id="89"></a>

We define the following functions out of Gower similarity function in order to make the code more efficient.



```python
def a(Binary_Data) :

            X = Binary_Data

            a = X @ X.T

            return(a)

##########################################################################################

def d(Binary_Data):

            X = Binary_Data

            ones_matrix = np.ones(( X.shape[0] , X.shape[1])) 

            d = (ones_matrix - X) @ (ones_matrix - X).T

            return(d)

##########################################################################################

def alpha_py(i,j, Multiple_Categorical_Data):

                X = Multiple_Categorical_Data

                alpha = np.repeat(0, X.shape[1])

                for k in range(0, X.shape[1]) :

                    if X[i-1, k] == X[j-1, k] :

                        alpha[k] = 1

                    else :

                        alpha[k] = 0


                alpha = alpha.sum()

                return(alpha)
```


```python
def Gower_Similarity_Python(i,j, Mixed_Data_Set, p1, p2, p3):

    X = Mixed_Data_Set.to_numpy()

   # The data matrix X have to be order in the following way:
   # The p1 first are quantitative, the following p2 are binary categorical, and the following p3 are multiple categorical.

##########################################################################################
    def G(k, X):

        range = X[:,k].max() - X[:,k].min() 

        return(range)

    G_vector = np.repeat(0.5, p1)

    for r in range(0, p1):

        G_vector[r] = G(r, X)
##########################################################################################
    
    ones = np.repeat(1, p1)

    Quantitative_Data = X[: , 0:p1]

    Binary_Data = X[: , (p1):(p1+p2)]

    Multiple_Categorical_Data = X[: , (p1+p2):(p1+p2+p3) ]

##########################################################################################

    numerator_part_1 = ( ones - ( abs(Quantitative_Data[i-1,:] - Quantitative_Data[j-1,:]) / G_vector ) ).sum() 

    numerator_part_2 = a(Binary_Data)[i-1,j-1] + alpha_py(i,j, Multiple_Categorical_Data)

    numerator = numerator_part_1 + numerator_part_2
 
    denominator = p1 + (p2 - d(Binary_Data)[i-1,j-1]) + p3

    Similarity_Gower = numerator / denominator  

    return(Similarity_Gower)
```


```python
Mixed_Data_Py = Data_set_Python

```


```python
Gower_Similarity_Python(1, 3, Mixed_Data_Py, 4, 3, 3) 
```




    0.5165893428273731





---



 #### Gower Similarity Matrix in `R`   <a class="anchor" id="90"></a>



```r
%%R

Matriz_Similaridad_Gower <- function( Matriz_Datos_Mixtos, p1, p2, p3 ){
  
  Matriz_Datos_Mixtos=as.matrix(Matriz_Datos_Mixtos)
  
  M<-matrix(NA, ncol =dim(Matriz_Datos_Mixtos)[1] , nrow=dim(Matriz_Datos_Mixtos)[1] )
  
  for(i in 1:dim(Matriz_Datos_Mixtos)[1] ){
    for(j in 1:dim(Matriz_Datos_Mixtos)[1]){
    
  M[i,j]=Similaridad_Gower(i,j,  Matriz_Datos_Mixtos, p1, p2, p3)
  
   }
  }
 return(M)
}
```


```r
%%R

Matriz_Similaridad_Gower(Mixed_Data_R, p1=4, p2=3, p3=3)[1:10 , 1:10]
```

               [,1]      [,2]      [,3]      [,4]      [,5]      [,6]      [,7]
     [1,] 1.0000000 0.5965125 0.5165893 0.4366560 0.3528749 0.4761826 0.5059590
     [2,] 0.5965125 1.0000000 0.5263010 0.4016305 0.3746023 0.6913742 0.5358645
     [3,] 0.5165893 0.5263010 1.0000000 0.3939846 0.3538925 0.5097256 0.5274163
     [4,] 0.4366560 0.4016305 0.3939846 1.0000000 0.4846341 0.3963480 0.3763553
     [5,] 0.3528749 0.3746023 0.3538925 0.4846341 1.0000000 0.4060985 0.4515971
     [6,] 0.4761826 0.6913742 0.5097256 0.3963480 0.4060985 1.0000000 0.6059342
     [7,] 0.5059590 0.5358645 0.5274163 0.3763553 0.4515971 0.6059342 1.0000000
     [8,] 0.3442706 0.5865341 0.5686755 0.5486914 0.4512389 0.5879352 0.5266914
     [9,] 0.5751749 0.5596320 0.4559143 0.3074368 0.2994289 0.4485348 0.2918448
    [10,] 0.5363176 0.5969818 0.3850222 0.5732644 0.4634767 0.5094815 0.4124375
               [,8]      [,9]     [,10]
     [1,] 0.3442706 0.5751749 0.5363176
     [2,] 0.5865341 0.5596320 0.5969818
     [3,] 0.5686755 0.4559143 0.3850222
     [4,] 0.5486914 0.3074368 0.5732644
     [5,] 0.4512389 0.2994289 0.4634767
     [6,] 0.5879352 0.4485348 0.5094815
     [7,] 0.5266914 0.2918448 0.4124375
     [8,] 1.0000000 0.4715748 0.5615848
     [9,] 0.4715748 1.0000000 0.5254141
    [10,] 0.5615848 0.5254141 1.0000000
    



---



 #### Gower Similarity Matrix in `Python`   <a class="anchor" id="91"></a>



```python
def Sim_Gower_Matrix_Python(Mixed_Data,  p1, p2, p3):

    M = np.zeros((Mixed_Data.shape[0] , Mixed_Data.shape[0]))

    for i in range(0 , Mixed_Data.shape[0]):
        for j in range(0 , Mixed_Data.shape[0]):

            M[i,j] = Gower_Similarity_Python(i+1,j+1, Mixed_Data , p1, p2, p3)
                 
    return M
```


```python
Sim_Gower_Matrix_Python(Mixed_Data_Py,  4, 3, 3)
```




    array([[1.        , 0.59651254, 0.51658934, 0.43665601, 0.35287489,
            0.47618259, 0.50595897, 0.34427062, 0.57517487, 0.53631762,
            0.39081353, 0.56542398, 0.34980672, 0.4201179 , 0.40655964,
            0.45050182, 0.37169572, 0.56231184, 0.53162902, 0.4081931 ,
            0.5286284 , 0.38328218, 0.50822342, 0.44565728, 0.50335679,
            0.29058857, 0.48405046, 0.43047063, 0.65373807, 0.62200091,
            0.42736482, 0.36198276, 0.32792784, 0.58093371, 0.46501083,
            0.34608673, 0.47005337, 0.51280757, 0.60494337, 0.51817269,
            0.44803962, 0.83744673, 0.48546171, 0.36829829, 0.49637748,
            0.25813238, 0.68111357, 0.49143752, 0.2888966 , 0.43725514],
           [0.59651254, 1.        , 0.52630101, 0.40163047, 0.37460234,
            0.69137421, 0.53586446, 0.58653412, 0.55963199, 0.59698178,
            0.42231881, 0.55570042, 0.32831846, 0.39917961, 0.44117956,
            0.45490103, 0.51175821, 0.69336284, 0.40661991, 0.54605609,
            0.49434773, 0.34717778, 0.24354131, 0.6317765 , 0.45079173,
            0.45720717, 0.52232079, 0.3591729 , 0.70606407, 0.51710801,
            0.49616478, 0.27484519, 0.23273731, 0.66020162, 0.50471139,
            0.36679948, 0.52514703, 0.68153862, 0.50053527, 0.42027983,
            0.48606888, 0.58988136, 0.47232258, 0.28059386, 0.5139518 ,
            0.31927992, 0.6077584 , 0.59654301, 0.51521592, 0.50399889],
           [0.51658934, 0.52630101, 1.        , 0.39398465, 0.35389253,
            0.5097256 , 0.52741632, 0.56867549, 0.45591426, 0.38502221,
            0.45865367, 0.43309556, 0.47368467, 0.28916481, 0.47561039,
            0.49306922, 0.35091295, 0.48711073, 0.28655031, 0.27820493,
            0.66494159, 0.32514219, 0.41975076, 0.53701966, 0.52623589,
            0.42626604, 0.29865586, 0.37647543, 0.50393753, 0.37571697,
            0.45487202, 0.22908316, 0.33455925, 0.42823137, 0.31948358,
            0.32389011, 0.29036087, 0.48919711, 0.47752273, 0.3349825 ,
            0.44255528, 0.60899409, 0.44889425, 0.43213394, 0.45816578,
            0.3546023 , 0.514022  , 0.42036786, 0.56787232, 0.27449596],
           [0.43665601, 0.40163047, 0.39398465, 1.        , 0.48463409,
            0.39634799, 0.37635531, 0.54869141, 0.30743681, 0.57326441,
            0.30900806, 0.63362274, 0.37679672, 0.58887065, 0.48794242,
            0.58809008, 0.25107938, 0.33560209, 0.43019406, 0.45127277,
            0.38568826, 0.54430402, 0.33121196, 0.51133594, 0.3270104 ,
            0.34126867, 0.39951669, 0.38816703, 0.49556639, 0.69697458,
            0.20792669, 0.27793378, 0.36887885, 0.5168534 , 0.52662267,
            0.62997739, 0.52596352, 0.41183882, 0.40448795, 0.36787931,
            0.52876496, 0.43595807, 0.48279729, 0.28396652, 0.36568206,
            0.54812049, 0.23794926, 0.61207982, 0.47831209, 0.36658538],
           [0.35287489, 0.37460234, 0.35389253, 0.48463409, 1.        ,
            0.40609848, 0.45159713, 0.45123888, 0.29942892, 0.46347674,
            0.49824406, 0.5863589 , 0.39216263, 0.6487455 , 0.56285096,
            0.71205192, 0.3633721 , 0.43224168, 0.41591077, 0.68715358,
            0.39797573, 0.38551886, 0.57151242, 0.55526901, 0.41178724,
            0.68572835, 0.57231142, 0.5749921 , 0.44695334, 0.52455249,
            0.32021941, 0.70595406, 0.46456635, 0.61978571, 0.59545333,
            0.53229785, 0.61050589, 0.50562153, 0.44218649, 0.49264901,
            0.53320964, 0.35877021, 0.43920306, 0.5300071 , 0.33550969,
            0.64341467, 0.29011817, 0.61844436, 0.49197068, 0.461703  ],
           [0.47618259, 0.69137421, 0.5097256 , 0.39634799, 0.40609848,
            1.        , 0.60593424, 0.58793517, 0.44853477, 0.50948153,
            0.39826294, 0.62608752, 0.46162915, 0.37759158, 0.51973392,
            0.42587593, 0.50609605, 0.82426027, 0.5901606 , 0.50112475,
            0.43582148, 0.43397237, 0.32696591, 0.52193543, 0.52920371,
            0.62118912, 0.53091756, 0.28581437, 0.59890739, 0.37451868,
            0.53496963, 0.22081621, 0.27709225, 0.53117992, 0.52238758,
            0.45008169, 0.59775681, 0.66482084, 0.38395986, 0.43905893,
            0.43200689, 0.47316358, 0.61221982, 0.46401845, 0.62944286,
            0.59023856, 0.61624181, 0.37982522, 0.65402241, 0.54381618],
           [0.50595897, 0.53586446, 0.52741632, 0.37635531, 0.45159713,
            0.60593424, 1.        , 0.5266914 , 0.29184479, 0.4124375 ,
            0.44718416, 0.41407295, 0.3135715 , 0.44752985, 0.69880514,
            0.47438587, 0.43674775, 0.63867909, 0.23581227, 0.36429184,
            0.5393978 , 0.393981  , 0.48481153, 0.51218761, 0.52415701,
            0.59217881, 0.48616994, 0.36132867, 0.58864046, 0.53974128,
            0.51437998, 0.34287982, 0.47904607, 0.44248161, 0.47099021,
            0.37900895, 0.37569345, 0.62264103, 0.29369897, 0.41558463,
            0.48109701, 0.42193048, 0.41294794, 0.35306931, 0.501957  ,
            0.40230088, 0.63695076, 0.38694748, 0.54928824, 0.46295736],
           [0.34427062, 0.58653412, 0.56867549, 0.54869141, 0.45123888,
            0.58793517, 0.5266914 , 1.        , 0.4715748 , 0.56158476,
            0.43615382, 0.59652219, 0.32270973, 0.38408845, 0.56039152,
            0.58150023, 0.35481358, 0.45744107, 0.30677016, 0.43843804,
            0.55751967, 0.40409303, 0.36539189, 0.70243619, 0.33032415,
            0.55827109, 0.34753074, 0.42587627, 0.6794038 , 0.52183836,
            0.45296554, 0.26440843, 0.34164947, 0.52143028, 0.36760268,
            0.37524502, 0.40382007, 0.4192535 , 0.40660428, 0.29648434,
            0.60114995, 0.3495764 , 0.47884327, 0.34555409, 0.46796015,
            0.53588279, 0.32256863, 0.47467328, 0.5568215 , 0.44798316],
           [0.57517487, 0.55963199, 0.45591426, 0.30743681, 0.29942892,
            0.44853477, 0.29184479, 0.4715748 , 1.        , 0.52541413,
            0.29072276, 0.56270296, 0.39541288, 0.31167235, 0.33754495,
            0.44427165, 0.45055424, 0.37279504, 0.46313217, 0.40501365,
            0.44356557, 0.36087356, 0.37314049, 0.50228056, 0.243822  ,
            0.33544466, 0.46347567, 0.58269938, 0.57925253, 0.37545136,
            0.45243232, 0.29383969, 0.38949986, 0.6744514 , 0.4474808 ,
            0.25109458, 0.4012715 , 0.34516597, 0.73069637, 0.51481704,
            0.44402896, 0.55088388, 0.43766205, 0.43185043, 0.45667896,
            0.28180678, 0.42414908, 0.5113004 , 0.31740995, 0.55230368],
           [0.53631762, 0.59698178, 0.38502221, 0.57326441, 0.46347674,
            0.50948153, 0.4124375 , 0.56158476, 0.52541413, 1.        ,
            0.42371592, 0.68436916, 0.45776125, 0.63924062, 0.50995256,
            0.69867397, 0.47635994, 0.4626879 , 0.36479613, 0.71485123,
            0.40701453, 0.42803343, 0.38506614, 0.45373893, 0.23570697,
            0.43203661, 0.63230789, 0.33933816, 0.59049976, 0.67541964,
            0.56568362, 0.30709203, 0.46422064, 0.71593434, 0.63649945,
            0.60329705, 0.67674099, 0.42450032, 0.55950387, 0.57558967,
            0.74805183, 0.54221293, 0.50038963, 0.3637693 , 0.38950651,
            0.43060149, 0.33881005, 0.49861368, 0.51435353, 0.62931603],
           [0.39081353, 0.42231881, 0.45865367, 0.30900806, 0.49824406,
            0.39826294, 0.44718416, 0.43615382, 0.29072276, 0.42371592,
            1.        , 0.31087411, 0.40416266, 0.6128896 , 0.5541448 ,
            0.47017849, 0.41441348, 0.40646124, 0.33844511, 0.41564161,
            0.64682833, 0.44014645, 0.65152813, 0.47780335, 0.50594162,
            0.46913733, 0.4278161 , 0.54606761, 0.45990679, 0.41246926,
            0.69979937, 0.51545114, 0.35639621, 0.33788281, 0.32050228,
            0.45819376, 0.37131585, 0.39390736, 0.3091294 , 0.38866317,
            0.60003512, 0.39435871, 0.59040835, 0.51251328, 0.60555377,
            0.30140046, 0.45357454, 0.35502118, 0.47670146, 0.41709729],
           [0.56542398, 0.55570042, 0.43309556, 0.63362274, 0.5863589 ,
            0.62608752, 0.41407295, 0.59652219, 0.56270296, 0.68436916,
            0.31087411, 1.        , 0.34260795, 0.44911056, 0.45543073,
            0.73054852, 0.34522107, 0.47860832, 0.67805329, 0.56024563,
            0.42538725, 0.43279241, 0.37699929, 0.5142723 , 0.28789315,
            0.51595869, 0.7026494 , 0.36397783, 0.63957461, 0.53566272,
            0.43146657, 0.36357522, 0.30050694, 0.84961338, 0.59563338,
            0.42691346, 0.57291409, 0.50856808, 0.71648316, 0.47875964,
            0.58374543, 0.54671761, 0.57090927, 0.39656973, 0.54174862,
            0.66383012, 0.38885059, 0.70075973, 0.43428864, 0.55876288],
           [0.34980672, 0.32831846, 0.47368467, 0.37679672, 0.39216263,
            0.46162915, 0.3135715 , 0.32270973, 0.39541288, 0.45776125,
            0.40416266, 0.34260795, 1.        , 0.47656796, 0.43058828,
            0.3844347 , 0.48541546, 0.43904266, 0.49406248, 0.48832843,
            0.43374308, 0.66346023, 0.42312578, 0.3633609 , 0.41608311,
            0.44839674, 0.37175593, 0.41557679, 0.30399678, 0.5065366 ,
            0.37497025, 0.36822921, 0.54024178, 0.34760928, 0.47497441,
            0.56896385, 0.58674468, 0.26991022, 0.3164775 , 0.57439029,
            0.41635485, 0.47281621, 0.46209178, 0.61891513, 0.37011738,
            0.46490831, 0.35018313, 0.35614326, 0.74206962, 0.38082132],
           [0.4201179 , 0.39917961, 0.28916481, 0.58887065, 0.6487455 ,
            0.37759158, 0.44752985, 0.38408845, 0.31167235, 0.63924062,
            0.6128896 , 0.44911056, 0.47656796, 1.        , 0.68800095,
            0.63357579, 0.35489137, 0.36372083, 0.35624571, 0.63198087,
            0.30797173, 0.51004342, 0.49568421, 0.48997245, 0.3765941 ,
            0.45661532, 0.59246287, 0.5357171 , 0.45514707, 0.69269035,
            0.38603733, 0.49092452, 0.4568696 , 0.46877782, 0.57091964,
            0.76610881, 0.58273003, 0.40812549, 0.30000147, 0.46860237,
            0.62278877, 0.39350507, 0.53223347, 0.37005953, 0.34575653,
            0.41716017, 0.3144112 , 0.54892545, 0.54478399, 0.5499318 ],
           [0.40655964, 0.44117956, 0.47561039, 0.48794242, 0.56285096,
            0.51973392, 0.69880514, 0.56039152, 0.33754495, 0.50995256,
            0.5541448 , 0.45543073, 0.43058828, 0.68800095, 1.        ,
            0.48505919, 0.44676543, 0.54399419, 0.27717005, 0.56960694,
            0.54530347, 0.39988667, 0.59510248, 0.54542633, 0.42432762,
            0.60287996, 0.41885878, 0.451581  , 0.60670813, 0.6388734 ,
            0.43701159, 0.38024339, 0.46113947, 0.4440861 , 0.50145591,
            0.50294324, 0.48100856, 0.46399881, 0.34329048, 0.42089973,
            0.48522878, 0.27778694, 0.65430572, 0.38149587, 0.42358059,
            0.41561752, 0.45423646, 0.43290057, 0.66630502, 0.36827246],
           [0.45050182, 0.45490103, 0.49306922, 0.58809008, 0.71205192,
            0.42587593, 0.47438587, 0.58150023, 0.44427165, 0.69867397,
            0.47017849, 0.73054852, 0.3844347 , 0.63357579, 0.48505919,
            1.        , 0.24442167, 0.40744092, 0.40860181, 0.4520055 ,
            0.50468872, 0.36089222, 0.46897013, 0.54796005, 0.28719195,
            0.58759225, 0.67611357, 0.43482239, 0.54037528, 0.61797872,
            0.43745462, 0.42438029, 0.35416323, 0.75845322, 0.47703326,
            0.64270096, 0.47750444, 0.39569375, 0.580854  , 0.36676031,
            0.79780653, 0.4492582 , 0.33981474, 0.44295518, 0.32893163,
            0.65858438, 0.28354011, 0.73522178, 0.48853901, 0.55899553],
           [0.37169572, 0.51175821, 0.35091295, 0.25107938, 0.3633721 ,
            0.50609605, 0.43674775, 0.35481358, 0.45055424, 0.47635994,
            0.41441348, 0.34522107, 0.48541546, 0.35489137, 0.44676543,
            0.24442167, 1.        , 0.51547729, 0.38321332, 0.60932134,
            0.42652042, 0.57118241, 0.25895773, 0.47666682, 0.43758451,
            0.49670781, 0.49151436, 0.26727306, 0.45363878, 0.35512162,
            0.65076159, 0.42104679, 0.63224098, 0.34972227, 0.67711897,
            0.30481308, 0.57771221, 0.61955223, 0.32228435, 0.79370822,
            0.27558953, 0.36432774, 0.62427025, 0.41123834, 0.65044146,
            0.20880056, 0.65815226, 0.23455661, 0.50473657, 0.51991141],
           [0.56231184, 0.69336284, 0.48711073, 0.33560209, 0.43224168,
            0.82426027, 0.63867909, 0.45744107, 0.37279504, 0.4626879 ,
            0.40646124, 0.47860832, 0.43904266, 0.36372083, 0.54399419,
            0.40744092, 0.51547729, 1.        , 0.48002151, 0.50116889,
            0.55322107, 0.34618507, 0.38945162, 0.51206217, 0.51533295,
            0.5600218 , 0.5170468 , 0.29963226, 0.70857376, 0.47768358,
            0.47822223, 0.22280484, 0.21721191, 0.49004882, 0.53865886,
            0.48933579, 0.62989917, 0.69915482, 0.33020952, 0.42216332,
            0.37212655, 0.46761762, 0.47867656, 0.40064791, 0.5155721 ,
            0.48008964, 0.74138895, 0.37768147, 0.64431968, 0.56680348],
           [0.53162902, 0.40661991, 0.28655031, 0.43019406, 0.41591077,
            0.5901606 , 0.23581227, 0.30677016, 0.46313217, 0.36479613,
            0.33844511, 0.67805329, 0.49406248, 0.35624571, 0.27717005,
            0.40860181, 0.38321332, 0.48002151, 1.        , 0.40141991,
            0.31466693, 0.53041928, 0.31193416, 0.36795934, 0.46682193,
            0.43769801, 0.6107137 , 0.35196705, 0.42736635, 0.33168675,
            0.39245099, 0.39929939, 0.24024447, 0.52766667, 0.48712411,
            0.42645894, 0.55798067, 0.46802257, 0.58377754, 0.49643374,
            0.2745669 , 0.50484295, 0.58096037, 0.49471434, 0.59317252,
            0.56765362, 0.47856877, 0.52413114, 0.40563081, 0.45693256],
           [0.4081931 , 0.54605609, 0.27820493, 0.45127277, 0.68715358,
            0.50112475, 0.36429184, 0.43843804, 0.40501365, 0.71485123,
            0.41564161, 0.56024563, 0.48832843, 0.63198087, 0.56960694,
            0.4520055 , 0.60932134, 0.50116889, 0.40141991, 1.        ,
            0.33272111, 0.46465721, 0.43938359, 0.48670033, 0.3203949 ,
            0.48563455, 0.55782056, 0.43956875, 0.5087049 , 0.54750855,
            0.43259534, 0.51230084, 0.51240521, 0.56900616, 0.79036722,
            0.51097689, 0.81419814, 0.56298132, 0.3915991 , 0.71893405,
            0.46553045, 0.41408841, 0.60341102, 0.46559105, 0.42063406,
            0.41242649, 0.37707639, 0.42412635, 0.54428976, 0.55832325],
           [0.5286284 , 0.49434773, 0.66494159, 0.38568826, 0.39797573,
            0.43582148, 0.5393978 , 0.55751967, 0.44356557, 0.40701453,
            0.64682833, 0.42538725, 0.43374308, 0.30797173, 0.54530347,
            0.50468872, 0.42652042, 0.55322107, 0.31466693, 0.33272111,
            1.        , 0.4102006 , 0.67028818, 0.56513628, 0.41098334,
            0.45200081, 0.32396082, 0.39771479, 0.62202749, 0.54298333,
            0.58060984, 0.29225782, 0.32692317, 0.43682775, 0.34478854,
            0.33428126, 0.3409006 , 0.41260855, 0.41887606, 0.39116553,
            0.57383686, 0.4234126 , 0.45755866, 0.55928355, 0.58780648,
            0.36103576, 0.55444301, 0.43459466, 0.5306327 , 0.32441324],
           [0.38328218, 0.34717778, 0.32514219, 0.54430402, 0.38551886,
            0.43397237, 0.393981  , 0.40409303, 0.36087356, 0.42803343,
            0.44014645, 0.43279241, 0.66346023, 0.51004342, 0.39988667,
            0.36089222, 0.57118241, 0.34618507, 0.53041928, 0.46465721,
            0.4102006 , 1.        , 0.39622008, 0.39597343, 0.32455858,
            0.30658402, 0.49004359, 0.41855092, 0.33957461, 0.53937314,
            0.44847452, 0.38551526, 0.63230964, 0.32668263, 0.59836015,
            0.48843615, 0.50995531, 0.40548806, 0.29293502, 0.67374784,
            0.37191423, 0.38991441, 0.54953375, 0.44915229, 0.59590824,
            0.44136583, 0.50079702, 0.40061555, 0.49892074, 0.50757902],
           [0.50822342, 0.24354131, 0.41975076, 0.33121196, 0.57151242,
            0.32696591, 0.48481153, 0.36539189, 0.37314049, 0.38506614,
            0.65152813, 0.37699929, 0.42312578, 0.49568421, 0.59510248,
            0.46897013, 0.25895773, 0.38945162, 0.31193416, 0.43938359,
            0.67028818, 0.39622008, 1.        , 0.30552193, 0.32449981,
            0.37372683, 0.32256434, 0.64140715, 0.42218097, 0.49936313,
            0.49217457, 0.49637989, 0.44022068, 0.41627481, 0.34570626,
            0.36167109, 0.35377142, 0.27086985, 0.42323605, 0.3984057 ,
            0.57184053, 0.38985564, 0.46846715, 0.64718864, 0.4563748 ,
            0.39939149, 0.40593978, 0.3374789 , 0.36480599, 0.32306703],
           [0.44565728, 0.6317765 , 0.53701966, 0.51133594, 0.55526901,
            0.52193543, 0.51218761, 0.70243619, 0.50228056, 0.45373893,
            0.47780335, 0.5142723 , 0.3633609 , 0.48997245, 0.54542633,
            0.54796005, 0.47666682, 0.51206217, 0.36795934, 0.48670033,
            0.56513628, 0.39597343, 0.30552193, 1.        , 0.55918975,
            0.62539399, 0.47202492, 0.45221784, 0.75278877, 0.5765246 ,
            0.37836248, 0.38288455, 0.3526135 , 0.50032241, 0.56328326,
            0.45470607, 0.52760502, 0.64288541, 0.35910714, 0.42230357,
            0.52474088, 0.42449426, 0.42556607, 0.46799321, 0.45901185,
            0.37367852, 0.46275255, 0.61987755, 0.59005914, 0.54327997],
           [0.50335679, 0.45079173, 0.52623589, 0.3270104 , 0.41178724,
            0.52920371, 0.52415701, 0.33032415, 0.243822  , 0.23570697,
            0.50594162, 0.28789315, 0.41608311, 0.3765941 , 0.42432762,
            0.28719195, 0.43758451, 0.51533295, 0.46682193, 0.3203949 ,
            0.41098334, 0.32455858, 0.32449981, 0.55918975, 1.        ,
            0.6109872 , 0.29828615, 0.37985006, 0.40675919, 0.36404134,
            0.37516606, 0.44421069, 0.41015576, 0.27586145, 0.37667409,
            0.40499908, 0.47606915, 0.60764409, 0.30545054, 0.41483806,
            0.28472975, 0.47717881, 0.46331543, 0.55957469, 0.44417872,
            0.31704473, 0.5178037 , 0.37516832, 0.49101968, 0.24655074],
           [0.29058857, 0.45720717, 0.42626604, 0.34126867, 0.68572835,
            0.62118912, 0.59217881, 0.55827109, 0.33544466, 0.43203661,
            0.46913733, 0.51595869, 0.44839674, 0.45661532, 0.60287996,
            0.58759225, 0.49670781, 0.5600218 , 0.43769801, 0.48563455,
            0.45200081, 0.30658402, 0.37372683, 0.62539399, 0.6109872 ,
            1.        , 0.48805568, 0.32956464, 0.4905262 , 0.44275481,
            0.4428017 , 0.55456447, 0.50141832, 0.54197374, 0.47287596,
            0.49221533, 0.59703616, 0.52452677, 0.3933481 , 0.43692734,
            0.50550118, 0.28395739, 0.41483368, 0.58525237, 0.40384274,
            0.6528531 , 0.3388365 , 0.50015386, 0.68264443, 0.36641087],
           [0.48405046, 0.52232079, 0.29865586, 0.39951669, 0.57231142,
            0.53091756, 0.48616994, 0.34753074, 0.46347567, 0.63230789,
            0.4278161 , 0.7026494 , 0.37175593, 0.59246287, 0.41885878,
            0.67611357, 0.49151436, 0.5170468 , 0.6107137 , 0.55782056,
            0.32396082, 0.49004359, 0.32256434, 0.47202492, 0.29828615,
            0.48805568, 1.        , 0.35814914, 0.54750325, 0.44896871,
            0.5945652 , 0.39581642, 0.38061471, 0.68406731, 0.75376438,
            0.54683416, 0.58589997, 0.62803787, 0.53024367, 0.60833851,
            0.54665728, 0.4520808 , 0.44900662, 0.37392451, 0.57957059,
            0.50183204, 0.53537769, 0.60338028, 0.44363156, 0.83140511],
           [0.43047063, 0.3591729 , 0.37647543, 0.38816703, 0.5749921 ,
            0.28581437, 0.36132867, 0.42587627, 0.58269938, 0.33933816,
            0.54606761, 0.36397783, 0.41557679, 0.5357171 , 0.451581  ,
            0.43482239, 0.26727306, 0.29963226, 0.35196705, 0.43956875,
            0.39771479, 0.41855092, 0.64140715, 0.45221784, 0.37985006,
            0.32956464, 0.35814914, 1.        , 0.45310883, 0.39390262,
            0.33043674, 0.54583741, 0.40225586, 0.50514938, 0.38129105,
            0.38535873, 0.37113985, 0.29744523, 0.51177439, 0.4006972 ,
            0.39059793, 0.43364292, 0.48784455, 0.45234228, 0.38084848,
            0.34340677, 0.3283241 , 0.50251179, 0.35549696, 0.45263094],
           [0.65373807, 0.70606407, 0.50393753, 0.49556639, 0.44695334,
            0.59890739, 0.58864046, 0.6794038 , 0.57925253, 0.59049976,
            0.45990679, 0.63957461, 0.30399678, 0.45514707, 0.60670813,
            0.54037528, 0.45363878, 0.70857376, 0.42736635, 0.5087049 ,
            0.62202749, 0.33957461, 0.42218097, 0.75278877, 0.40675919,
            0.4905262 , 0.54750325, 0.45310883, 1.        , 0.63420774,
            0.50603409, 0.2722677 , 0.24502376, 0.64615885, 0.55751688,
            0.4446475 , 0.56930996, 0.63400057, 0.49292345, 0.43365078,
            0.4999384 , 0.54415715, 0.5413905 , 0.32973262, 0.56468554,
            0.37858107, 0.64238286, 0.54780215, 0.53304029, 0.63248624],
           [0.62200091, 0.51710801, 0.37571697, 0.69697458, 0.52455249,
            0.37451868, 0.53974128, 0.52183836, 0.37545136, 0.67541964,
            0.41246926, 0.53566272, 0.5065366 , 0.69269035, 0.6388734 ,
            0.61797872, 0.35512162, 0.47768358, 0.33168675, 0.54750855,
            0.54298333, 0.53937314, 0.49936313, 0.5765246 , 0.36404134,
            0.44275481, 0.44896871, 0.39390262, 0.63420774, 1.        ,
            0.31001224, 0.37694509, 0.46789016, 0.566571  , 0.54636068,
            0.62309315, 0.60864934, 0.38602243, 0.39609385, 0.47339177,
            0.65881776, 0.50743128, 0.40762325, 0.3515412 , 0.32125414,
            0.42810344, 0.39425384, 0.6485059 , 0.55583739, 0.43146625],
           [0.42736482, 0.49616478, 0.45487202, 0.20792669, 0.32021941,
            0.53496963, 0.51437998, 0.45296554, 0.45243232, 0.56568362,
            0.69979937, 0.43146657, 0.37497025, 0.38603733, 0.43701159,
            0.43745462, 0.65076159, 0.47822223, 0.39245099, 0.43259534,
            0.58060984, 0.44847452, 0.49217457, 0.37836248, 0.37516606,
            0.4428017 , 0.5945652 , 0.33043674, 0.50603409, 0.31001224,
            1.        , 0.30431301, 0.47618816, 0.44275862, 0.48838384,
            0.35850168, 0.42460122, 0.54003466, 0.44930054, 0.60390978,
            0.58139268, 0.42749142, 0.5785173 , 0.49866323, 0.79443846,
            0.30307567, 0.6159382 , 0.26564636, 0.42988787, 0.58191876],
           [0.36198276, 0.27484519, 0.22908316, 0.27793378, 0.70595406,
            0.22081621, 0.34287982, 0.26440843, 0.29383969, 0.30709203,
            0.51545114, 0.36357522, 0.36822921, 0.49092452, 0.38024339,
            0.42438029, 0.42104679, 0.22280484, 0.39929939, 0.51230084,
            0.29225782, 0.38551526, 0.49637989, 0.38288455, 0.44421069,
            0.55456447, 0.39581642, 0.54583741, 0.2722677 , 0.37694509,
            0.30431301, 1.        , 0.59374162, 0.39448351, 0.37427319,
            0.28091912, 0.43426093, 0.30626827, 0.37786352, 0.4771966 ,
            0.35620847, 0.38461483, 0.39472407, 0.46622031, 0.29863859,
            0.35950501, 0.24508667, 0.41484997, 0.27263879, 0.25937876],
           [0.32792784, 0.23273731, 0.33455925, 0.36887885, 0.46456635,
            0.27709225, 0.47904607, 0.34164947, 0.38949986, 0.46422064,
            0.35639621, 0.30050694, 0.54024178, 0.4568696 , 0.46113947,
            0.35416323, 0.63224098, 0.21721191, 0.24024447, 0.51240521,
            0.32692317, 0.63230964, 0.44022068, 0.3526135 , 0.41015576,
            0.50141832, 0.38061471, 0.40225586, 0.24502376, 0.46789016,
            0.47618816, 0.59374162, 1.        , 0.33207213, 0.58597057,
            0.37186419, 0.515101  , 0.37902433, 0.3583396 , 0.74381073,
            0.4277341 , 0.35055991, 0.41036804, 0.55398083, 0.39815589,
            0.30258168, 0.32592673, 0.25579504, 0.40986394, 0.35656493],
           [0.58093371, 0.66020162, 0.42823137, 0.5168534 , 0.61978571,
            0.53117992, 0.44248161, 0.52143028, 0.6744514 , 0.71593434,
            0.33788281, 0.84961338, 0.34760928, 0.46877782, 0.4440861 ,
            0.75845322, 0.34972227, 0.49004882, 0.52766667, 0.56900616,
            0.43682775, 0.32668263, 0.41627481, 0.50032241, 0.27586145,
            0.54197374, 0.68406731, 0.50514938, 0.64615885, 0.566571  ,
            0.44275862, 0.39448351, 0.33207213, 1.        , 0.58723178,
            0.44291827, 0.58562575, 0.48015942, 0.82240078, 0.48376096,
            0.61531061, 0.5776259 , 0.44697311, 0.40169546, 0.43609   ,
            0.56608756, 0.39069847, 0.77259533, 0.4449857 , 0.56488508],
           [0.46501083, 0.50471139, 0.31948358, 0.52662267, 0.59545333,
            0.52238758, 0.47099021, 0.36760268, 0.4474808 , 0.63649945,
            0.32050228, 0.59563338, 0.47497441, 0.57091964, 0.50145591,
            0.47703326, 0.67711897, 0.53865886, 0.48712411, 0.79036722,
            0.34478854, 0.59836015, 0.34570626, 0.56328326, 0.37667409,
            0.47287596, 0.75376438, 0.38129105, 0.55751688, 0.54636068,
            0.48838384, 0.37427319, 0.58597057, 0.58723178, 1.        ,
            0.5652992 , 0.82658723, 0.74243325, 0.43074582, 0.81369437,
            0.42476462, 0.44630447, 0.53613828, 0.48842993, 0.56807114,
            0.41386284, 0.54103018, 0.4878029 , 0.55652048, 0.72545149],
           [0.34608673, 0.36679948, 0.32389011, 0.62997739, 0.53229785,
            0.45008169, 0.37900895, 0.37524502, 0.25109458, 0.60329705,
            0.45819376, 0.42691346, 0.56896385, 0.76610881, 0.50294324,
            0.64270096, 0.30481308, 0.48933579, 0.42645894, 0.51097689,
            0.33428126, 0.48843615, 0.36167109, 0.45470607, 0.40499908,
            0.49221533, 0.54683416, 0.38535873, 0.4446475 , 0.62309315,
            0.35850168, 0.28091912, 0.37186419, 0.44291827, 0.5652992 ,
            1.        , 0.69677874, 0.41511488, 0.26540471, 0.42758343,
            0.56550749, 0.34269326, 0.38733129, 0.47563098, 0.30933304,
            0.65105136, 0.29954813, 0.50531105, 0.64912732, 0.53740061],
           [0.47005337, 0.52514703, 0.29036087, 0.52596352, 0.61050589,
            0.59775681, 0.37569345, 0.40382007, 0.4012715 , 0.67674099,
            0.37131585, 0.57291409, 0.58674468, 0.58273003, 0.48100856,
            0.47750444, 0.57771221, 0.62989917, 0.55798067, 0.81419814,
            0.3409006 , 0.50995531, 0.35377142, 0.52760502, 0.47606915,
            0.59703616, 0.58589997, 0.37113985, 0.56930996, 0.60864934,
            0.42460122, 0.43426093, 0.515101  , 0.58562575, 0.82658723,
            0.69677874, 1.        , 0.61543343, 0.40802654, 0.72143413,
            0.46500616, 0.47594868, 0.51569093, 0.57296001, 0.44449226,
            0.54903654, 0.41798108, 0.469576  , 0.6437344 , 0.58512589],
           [0.51280757, 0.68153862, 0.48919711, 0.41183882, 0.50562153,
            0.66482084, 0.62264103, 0.4192535 , 0.34516597, 0.42450032,
            0.39390736, 0.50856808, 0.26991022, 0.40812549, 0.46399881,
            0.39569375, 0.61955223, 0.69915482, 0.46802257, 0.56298132,
            0.41260855, 0.40548806, 0.27086985, 0.64288541, 0.60764409,
            0.52452677, 0.62803787, 0.29744523, 0.63400057, 0.38602243,
            0.54003466, 0.30626827, 0.37902433, 0.48015942, 0.74243325,
            0.41511488, 0.61543343, 1.        , 0.37210851, 0.58397575,
            0.33393897, 0.49597184, 0.5096931 , 0.39123775, 0.62068403,
            0.34219009, 0.72003211, 0.46721771, 0.49895373, 0.59839969],
           [0.60494337, 0.50053527, 0.47752273, 0.40448795, 0.44218649,
            0.38395986, 0.29369897, 0.40660428, 0.73069637, 0.55950387,
            0.3091294 , 0.71648316, 0.3164775 , 0.30000147, 0.34329048,
            0.580854  , 0.32228435, 0.33020952, 0.58377754, 0.3915991 ,
            0.41887606, 0.29293502, 0.42323605, 0.35910714, 0.30545054,
            0.3933481 , 0.53024367, 0.51177439, 0.49292345, 0.39609385,
            0.44930054, 0.37786352, 0.3583396 , 0.82240078, 0.43074582,
            0.26540471, 0.40802654, 0.37210851, 1.        , 0.46964814,
            0.4605182 , 0.5838987 , 0.47579188, 0.39992676, 0.42953719,
            0.40030122, 0.37428229, 0.65273092, 0.28531935, 0.38747802],
           [0.51817269, 0.42027983, 0.3349825 , 0.36787931, 0.49264901,
            0.43905893, 0.41558463, 0.29648434, 0.51481704, 0.57558967,
            0.38866317, 0.47875964, 0.57439029, 0.46860237, 0.42089973,
            0.36676031, 0.79370822, 0.42216332, 0.49643374, 0.71893405,
            0.39116553, 0.67374784, 0.3984057 , 0.42230357, 0.41483806,
            0.43692734, 0.60833851, 0.4006972 , 0.43365078, 0.47339177,
            0.60390978, 0.4771966 , 0.74381073, 0.48376096, 0.81369437,
            0.42758343, 0.72143413, 0.58397575, 0.46964814, 1.        ,
            0.37882795, 0.50988371, 0.60833981, 0.55574618, 0.62587969,
            0.32718129, 0.55365053, 0.34398606, 0.46361763, 0.58428872],
           [0.44803962, 0.48606888, 0.44255528, 0.52876496, 0.53320964,
            0.43200689, 0.48109701, 0.60114995, 0.44402896, 0.74805183,
            0.60003512, 0.58374543, 0.41635485, 0.62278877, 0.48522878,
            0.79780653, 0.27558953, 0.37212655, 0.2745669 , 0.46553045,
            0.57383686, 0.37191423, 0.57184053, 0.52474088, 0.28472975,
            0.50550118, 0.54665728, 0.39059793, 0.4999384 , 0.65881776,
            0.58139268, 0.35620847, 0.4277341 , 0.61531061, 0.42476462,
            0.56550749, 0.46500616, 0.33393897, 0.4605182 , 0.37882795,
            1.        , 0.44425284, 0.32330408, 0.55173431, 0.41242097,
            0.49622498, 0.2482487 , 0.57443834, 0.4708802 , 0.5286923 ],
           [0.83744673, 0.58988136, 0.60899409, 0.43595807, 0.35877021,
            0.47316358, 0.42193048, 0.3495764 , 0.55088388, 0.54221293,
            0.39435871, 0.54671761, 0.47281621, 0.39350507, 0.27778694,
            0.4492582 , 0.36432774, 0.46761762, 0.50484295, 0.41408841,
            0.4234126 , 0.38991441, 0.38985564, 0.42449426, 0.47717881,
            0.28395739, 0.4520808 , 0.43364292, 0.54415715, 0.50743128,
            0.42749142, 0.38461483, 0.35055991, 0.5776259 , 0.44630447,
            0.34269326, 0.47594868, 0.49597184, 0.5838987 , 0.50988371,
            0.44425284, 1.        , 0.45602682, 0.36397796, 0.47117224,
            0.26402769, 0.56022583, 0.47132012, 0.39420238, 0.44252115],
           [0.48546171, 0.47232258, 0.44889425, 0.48279729, 0.43920306,
            0.61221982, 0.41294794, 0.47884327, 0.43766205, 0.50038963,
            0.59040835, 0.57090927, 0.46209178, 0.53223347, 0.65430572,
            0.33981474, 0.62427025, 0.47867656, 0.58096037, 0.60341102,
            0.45755866, 0.54953375, 0.46846715, 0.42556607, 0.46331543,
            0.41483368, 0.44900662, 0.48784455, 0.5413905 , 0.40762325,
            0.5785173 , 0.39472407, 0.41036804, 0.44697311, 0.53613828,
            0.38733129, 0.51569093, 0.5096931 , 0.47579188, 0.60833981,
            0.32330408, 0.45602682, 1.        , 0.36741763, 0.73140329,
            0.36835637, 0.54324315, 0.3353048 , 0.52493383, 0.40295484],
           [0.36829829, 0.28059386, 0.43213394, 0.28396652, 0.5300071 ,
            0.46401845, 0.35306931, 0.34555409, 0.43185043, 0.3637693 ,
            0.51251328, 0.39656973, 0.61891513, 0.37005953, 0.38149587,
            0.44295518, 0.41123834, 0.40064791, 0.49471434, 0.46559105,
            0.55928355, 0.44915229, 0.64718864, 0.46799321, 0.55957469,
            0.58525237, 0.37392451, 0.45234228, 0.32973262, 0.3515412 ,
            0.49866323, 0.46622031, 0.55398083, 0.40169546, 0.48842993,
            0.47563098, 0.57296001, 0.39123775, 0.39992676, 0.55574618,
            0.55173431, 0.36397796, 0.36741763, 1.        , 0.49766545,
            0.5101822 , 0.3394972 , 0.38751033, 0.50703137, 0.36102909],
           [0.49637748, 0.5139518 , 0.45816578, 0.36568206, 0.33550969,
            0.62944286, 0.501957  , 0.46796015, 0.45667896, 0.38950651,
            0.60555377, 0.54174862, 0.37011738, 0.34575653, 0.42358059,
            0.32893163, 0.65044146, 0.5155721 , 0.59317252, 0.42063406,
            0.58780648, 0.59590824, 0.4563748 , 0.45901185, 0.44417872,
            0.40384274, 0.57957059, 0.38084848, 0.56468554, 0.32125414,
            0.79443846, 0.29863859, 0.39815589, 0.43609   , 0.56807114,
            0.30933304, 0.44449226, 0.62068403, 0.42953719, 0.62587969,
            0.41242097, 0.47117224, 0.73140329, 0.49766545, 1.        ,
            0.37207825, 0.70072875, 0.34629573, 0.44215686, 0.54469187],
           [0.25813238, 0.31927992, 0.3546023 , 0.54812049, 0.64341467,
            0.59023856, 0.40230088, 0.53588279, 0.28180678, 0.43060149,
            0.30140046, 0.66383012, 0.46490831, 0.41716017, 0.41561752,
            0.65858438, 0.20880056, 0.48008964, 0.56765362, 0.41242649,
            0.36103576, 0.44136583, 0.39939149, 0.37367852, 0.31704473,
            0.6528531 , 0.50183204, 0.34340677, 0.37858107, 0.42810344,
            0.30307567, 0.35950501, 0.30258168, 0.56608756, 0.41386284,
            0.65105136, 0.54903654, 0.34219009, 0.40030122, 0.32718129,
            0.49622498, 0.26402769, 0.36835637, 0.5101822 , 0.37207825,
            1.        , 0.22668673, 0.53915506, 0.56007111, 0.39122362],
           [0.68111357, 0.6077584 , 0.514022  , 0.23794926, 0.29011817,
            0.61624181, 0.63695076, 0.32256863, 0.42414908, 0.33881005,
            0.45357454, 0.38885059, 0.35018313, 0.3144112 , 0.45423646,
            0.28354011, 0.65815226, 0.74138895, 0.47856877, 0.37707639,
            0.55444301, 0.50079702, 0.40593978, 0.46275255, 0.5178037 ,
            0.3388365 , 0.53537769, 0.3283241 , 0.64238286, 0.39425384,
            0.6159382 , 0.24508667, 0.32592673, 0.39069847, 0.54103018,
            0.29954813, 0.41798108, 0.72003211, 0.37428229, 0.55365053,
            0.2482487 , 0.56022583, 0.54324315, 0.3394972 , 0.70072875,
            0.22668673, 1.        , 0.32837184, 0.42142928, 0.57242563],
           [0.49143752, 0.59654301, 0.42036786, 0.61207982, 0.61844436,
            0.37982522, 0.38694748, 0.47467328, 0.5113004 , 0.49861368,
            0.35502118, 0.70075973, 0.35614326, 0.54892545, 0.43290057,
            0.73522178, 0.23455661, 0.37768147, 0.52413114, 0.42412635,
            0.43459466, 0.40061555, 0.3374789 , 0.61987755, 0.37516832,
            0.50015386, 0.60338028, 0.50251179, 0.54780215, 0.6485059 ,
            0.26564636, 0.41484997, 0.25579504, 0.77259533, 0.4878029 ,
            0.50531105, 0.469576  , 0.46721771, 0.65273092, 0.34398606,
            0.57443834, 0.47132012, 0.3353048 , 0.38751033, 0.34629573,
            0.53915506, 0.32837184, 1.        , 0.4491847 , 0.45433251],
           [0.2888966 , 0.51521592, 0.56787232, 0.47831209, 0.49197068,
            0.65402241, 0.54928824, 0.5568215 , 0.31740995, 0.51435353,
            0.47670146, 0.43428864, 0.74206962, 0.54478399, 0.66630502,
            0.48853901, 0.50473657, 0.64431968, 0.40563081, 0.54428976,
            0.5306327 , 0.49892074, 0.36480599, 0.59005914, 0.49101968,
            0.68264443, 0.44363156, 0.35549696, 0.53304029, 0.55583739,
            0.42988787, 0.27263879, 0.40986394, 0.4449857 , 0.55652048,
            0.64912732, 0.6437344 , 0.49895373, 0.28531935, 0.46361763,
            0.4708802 , 0.39420238, 0.52493383, 0.50703137, 0.44215686,
            0.56007111, 0.42142928, 0.4491847 , 1.        , 0.44684381],
           [0.43725514, 0.50399889, 0.27449596, 0.36658538, 0.461703  ,
            0.54381618, 0.46295736, 0.44798316, 0.55230368, 0.62931603,
            0.41709729, 0.55876288, 0.38082132, 0.5499318 , 0.36827246,
            0.55899553, 0.51991141, 0.56680348, 0.45693256, 0.55832325,
            0.32441324, 0.50757902, 0.32306703, 0.54327997, 0.24655074,
            0.36641087, 0.83140511, 0.45263094, 0.63248624, 0.43146625,
            0.58191876, 0.25937876, 0.35656493, 0.56488508, 0.72545149,
            0.53740061, 0.58512589, 0.59839969, 0.38747802, 0.58428872,
            0.5286923 , 0.44252115, 0.40295484, 0.36102909, 0.54469187,
            0.39122362, 0.57242563, 0.45433251, 0.44684381, 1.        ]])





---



 #### Gower Distance in `R`   <a class="anchor" id="92"></a>


```r
 %%R 
 
Dist_Gower <- function(i, j, Matriz_Datos_Mixtos , p1, p2, p3) {

Dist_Gower <- sqrt( 1 - Similaridad_Gower(i, j, Matriz_Datos_Mixtos , p1, p2, p3) )

return(Dist_Gower)

}
```


```r
 %%R 

Dist_Gower(1,3, Mixed_Data_R, p1=4, p2=3, p3=3)
```

    [1] 0.6952774
    



---



 #### Gower Distance in `Python`   <a class="anchor" id="93"></a>


```python
def Dist_Gower_Py(i, j, Mixed_Data , p1, p2, p3):

    Dist_Gower = np.sqrt( 1 - Gower_Similarity_Python(i, j, Mixed_Data , p1, p2, p3) )

    return(Dist_Gower)
```


```python
Dist_Gower_Py(1, 3, Mixed_Data_Py , 4, 3, 3)
```




    0.6952773958447283





---



 #### Gower Distance Matrix in `R`   <a class="anchor" id="94"></a>


```r
%%R

 Matriz_Dist_Gower <- function( Matriz_Datos_Mixtos, p1, p2, p3 ){
  
  Matriz_Datos_Mixtos=as.matrix(Matriz_Datos_Mixtos)
  
  M<-matrix(NA, ncol =dim(Matriz_Datos_Mixtos)[1] , nrow=dim(Matriz_Datos_Mixtos)[1] )
  
  for(i in 1:dim(Matriz_Datos_Mixtos)[1] ){
    for(j in 1:dim(Matriz_Datos_Mixtos)[1]){
    
  M[i,j]=Dist_Gower(i,j,  Matriz_Datos_Mixtos, p1, p2, p3)
  
   }
  }
 return(M)
}
```


```r
 %%R

 Matriz_Dist_Gower(Mixed_Data_R, p1=4, p2=3, p3=3)[1:10 , 1:10]
```

               [,1]      [,2]      [,3]      [,4]      [,5]      [,6]      [,7]
     [1,] 0.0000000 0.6352066 0.6952774 0.7505625 0.8044409 0.7237523 0.7028805
     [2,] 0.6352066 0.0000000 0.6882579 0.7735435 0.7908209 0.5555410 0.6812749
     [3,] 0.6952774 0.6882579 0.0000000 0.7784699 0.8038081 0.7001960 0.6874472
     [4,] 0.7505625 0.7735435 0.7784699 0.0000000 0.7178899 0.7769505 0.7897118
     [5,] 0.8044409 0.7908209 0.8038081 0.7178899 0.0000000 0.7706501 0.7405423
     [6,] 0.7237523 0.5555410 0.7001960 0.7769505 0.7706501 0.0000000 0.6277466
     [7,] 0.7028805 0.6812749 0.6874472 0.7897118 0.7405423 0.6277466 0.0000000
     [8,] 0.8097712 0.6430131 0.6567530 0.6717951 0.7407841 0.6419228 0.6879743
     [9,] 0.6517861 0.6636023 0.7376217 0.8322038 0.8370012 0.7426070 0.8415196
    [10,] 0.6809423 0.6348372 0.7842052 0.6532500 0.7324775 0.7003702 0.7665263
               [,8]      [,9]     [,10]
     [1,] 0.8097712 0.6517861 0.6809423
     [2,] 0.6430131 0.6636023 0.6348372
     [3,] 0.6567530 0.7376217 0.7842052
     [4,] 0.6717951 0.8322038 0.6532500
     [5,] 0.7407841 0.8370012 0.7324775
     [6,] 0.6419228 0.7426070 0.7003702
     [7,] 0.6879743 0.8415196 0.7665263
     [8,] 0.0000000 0.7269286 0.6621293
     [9,] 0.7269286 0.0000000 0.6889019
    [10,] 0.6621293 0.6889019 0.0000000
    



---



 #### Gower Distance Matrix in `Python`   <a class="anchor" id="95"></a>


```python
def Dist_Gower_Matrix_Python(Mixed_Data,  p1, p2, p3):

    M = np.zeros((Mixed_Data.shape[0] , Mixed_Data.shape[0]))

    for i in range(0 , Mixed_Data.shape[0]):
        for j in range(0 , Mixed_Data.shape[0]):

            M[i,j] = Dist_Gower_Py(i+1,j+1, Mixed_Data , p1, p2, p3)
                 
    return M
```


```python
Dist_Gower_Matrix_Python(Mixed_Data_Py,  4, 3, 3)
```




    array([[0.        , 0.63520662, 0.6952774 , 0.75056245, 0.80444087,
            0.72375231, 0.70288052, 0.80977119, 0.65178611, 0.68094228,
            0.78050398, 0.6592238 , 0.80634563, 0.7614999 , 0.77035081,
            0.74128145, 0.79265647, 0.66158005, 0.68437634, 0.76928987,
            0.68656507, 0.78531383, 0.70126784, 0.74454195, 0.70472917,
            0.84226565, 0.71829628, 0.7546717 , 0.58844025, 0.61481631,
            0.75672662, 0.79875981, 0.81980007, 0.6473533 , 0.73142954,
            0.80864904, 0.72797433, 0.69799171, 0.62853531, 0.69413782,
            0.74294036, 0.40317896, 0.71731324, 0.79479665, 0.70966367,
            0.86131737, 0.5647003 , 0.71313567, 0.84326947, 0.75016322],
           [0.63520662, 0.        , 0.68825794, 0.77354349, 0.79082088,
            0.55554099, 0.68127494, 0.64301313, 0.6636023 , 0.63483716,
            0.76005341, 0.66655801, 0.8195618 , 0.77512605, 0.74754293,
            0.73830818, 0.69874301, 0.55374828, 0.77031168, 0.67375359,
            0.71109231, 0.80797415, 0.86974634, 0.60681423, 0.74108587,
            0.73674475, 0.69114341, 0.80051677, 0.54215858, 0.6949043 ,
            0.70981351, 0.85156022, 0.87593532, 0.58292228, 0.70376744,
            0.79573898, 0.68909576, 0.56432382, 0.70672819, 0.76139357,
            0.71688989, 0.64040506, 0.72641408, 0.84817813, 0.69717157,
            0.82505762, 0.62629194, 0.63518265, 0.69626437, 0.70427346],
           [0.6952774 , 0.68825794, 0.        , 0.77846988, 0.8038081 ,
            0.70019597, 0.68744722, 0.656753  , 0.73762168, 0.7842052 ,
            0.73576241, 0.75293057, 0.72547593, 0.84311042, 0.7241475 ,
            0.71199072, 0.80565939, 0.71616288, 0.84465951, 0.84958524,
            0.5788423 , 0.8214973 , 0.76174093, 0.68042659, 0.68830524,
            0.75745228, 0.83746292, 0.78963572, 0.70431702, 0.79011583,
            0.73832782, 0.8780187 , 0.81574552, 0.75615384, 0.82493419,
            0.82225902, 0.84240081, 0.71470476, 0.72282589, 0.81548605,
            0.7466222 , 0.62530466, 0.74236497, 0.75356888, 0.73609389,
            0.80336648, 0.69712122, 0.76133576, 0.65736419, 0.85176525],
           [0.75056245, 0.77354349, 0.77846988, 0.        , 0.7178899 ,
            0.77695046, 0.78971178, 0.67179505, 0.83220382, 0.65325002,
            0.83125925, 0.60529105, 0.78943225, 0.64119369, 0.71558198,
            0.64180209, 0.865402  , 0.81510607, 0.75485491, 0.74076125,
            0.78378042, 0.67505258, 0.81779462, 0.69904511, 0.82035943,
            0.81162265, 0.77490858, 0.78219753, 0.71023489, 0.55047745,
            0.88998501, 0.8497448 , 0.79443133, 0.69508747, 0.68802422,
            0.60829484, 0.68850307, 0.76691667, 0.77169427, 0.79506018,
            0.68646561, 0.75102725, 0.71916807, 0.84618761, 0.79644079,
            0.67221983, 0.87295518, 0.62283238, 0.72227966, 0.7958735 ],
           [0.80444087, 0.79082088, 0.8038081 , 0.7178899 , 0.        ,
            0.77065006, 0.74054228, 0.74078412, 0.83700125, 0.73247748,
            0.70834733, 0.64314936, 0.77963926, 0.59266728, 0.66117247,
            0.53660794, 0.79788965, 0.75349739, 0.7642573 , 0.55932676,
            0.77590223, 0.78388848, 0.65458962, 0.66688154, 0.7669503 ,
            0.56059937, 0.65397904, 0.6519263 , 0.74367107, 0.68952702,
            0.82448808, 0.54226003, 0.73173332, 0.61661519, 0.63603983,
            0.68388753, 0.62409463, 0.70312053, 0.74686914, 0.71228575,
            0.68322058, 0.80076825, 0.74886377, 0.68556028, 0.81516275,
            0.59714766, 0.84254485, 0.6177019 , 0.71276176, 0.73368726],
           [0.72375231, 0.55554099, 0.70019597, 0.77695046, 0.77065006,
            0.        , 0.62774657, 0.64192276, 0.74260705, 0.70037024,
            0.77571713, 0.61148383, 0.73373759, 0.78892865, 0.69301232,
            0.75770976, 0.702783  , 0.41921323, 0.64018701, 0.70631102,
            0.75111818, 0.75234808, 0.82038655, 0.69142214, 0.68614597,
            0.61547614, 0.68489594, 0.84509504, 0.63331873, 0.79087377,
            0.68193135, 0.88271388, 0.85023982, 0.68470437, 0.69109509,
            0.74156477, 0.63422645, 0.5789466 , 0.78488224, 0.74895999,
            0.75365317, 0.72583498, 0.62271998, 0.73210761, 0.60873405,
            0.64012611, 0.6194822 , 0.78751177, 0.5881986 , 0.67541381],
           [0.70288052, 0.68127494, 0.68744722, 0.78971178, 0.74054228,
            0.62774657, 0.        , 0.68797427, 0.84151959, 0.76652626,
            0.74351587, 0.76545872, 0.8285098 , 0.74328336, 0.54881222,
            0.7249925 , 0.75050133, 0.60109975, 0.87417832, 0.79731309,
            0.6786768 , 0.77847222, 0.7177663 , 0.69843567, 0.68981374,
            0.63860879, 0.71681941, 0.79916915, 0.64137317, 0.6784237 ,
            0.69686442, 0.8106295 , 0.72177138, 0.74667154, 0.72733059,
            0.78802986, 0.79013071, 0.61429551, 0.84041717, 0.76447065,
            0.72034922, 0.76030883, 0.76619323, 0.80432002, 0.70572162,
            0.77311003, 0.60253568, 0.7829767 , 0.6713507 , 0.73283193],
           [0.80977119, 0.64301313, 0.656753  , 0.67179505, 0.74078412,
            0.64192276, 0.68797427, 0.        , 0.72692861, 0.66212932,
            0.75089692, 0.63519903, 0.82297647, 0.78480032, 0.66302977,
            0.64691558, 0.80323497, 0.73658599, 0.83260425, 0.74937438,
            0.66519195, 0.77195011, 0.79662294, 0.5454941 , 0.81833725,
            0.66462689, 0.80775569, 0.75770953, 0.56621215, 0.69149233,
            0.73961778, 0.85766635, 0.81138803, 0.69178734, 0.79523413,
            0.79041444, 0.77212689, 0.76206726, 0.77032183, 0.83875841,
            0.63154576, 0.80648844, 0.72191186, 0.80897831, 0.72941062,
            0.68126148, 0.82306219, 0.72479426, 0.66571653, 0.74297836],
           [0.65178611, 0.6636023 , 0.73762168, 0.83220382, 0.83700125,
            0.74260705, 0.84151959, 0.72692861, 0.        , 0.68890193,
            0.84218599, 0.66128439, 0.77755201, 0.82965514, 0.81391342,
            0.7454719 , 0.74124608, 0.79196273, 0.73271265, 0.77135358,
            0.74594532, 0.79945384, 0.7917446 , 0.70549234, 0.86958496,
            0.81520264, 0.73247821, 0.6459881 , 0.6486505 , 0.7902839 ,
            0.73997816, 0.84033345, 0.78134508, 0.57056867, 0.74331635,
            0.86539321, 0.77377549, 0.80921816, 0.51894473, 0.69655076,
            0.74563466, 0.67016126, 0.74989196, 0.75375697, 0.73710314,
            0.84746281, 0.75884842, 0.69907053, 0.82619008, 0.66910113],
           [0.68094228, 0.63483716, 0.7842052 , 0.65325002, 0.73247748,
            0.70037024, 0.76652626, 0.66212932, 0.68890193, 0.        ,
            0.75913377, 0.56181033, 0.73636862, 0.60063248, 0.70003389,
            0.54893172, 0.72362978, 0.73301576, 0.79699678, 0.53399323,
            0.7700555 , 0.75628471, 0.78417718, 0.73909476, 0.87423854,
            0.75363346, 0.60637621, 0.81281107, 0.63992206, 0.56971955,
            0.65902684, 0.83241094, 0.73196951, 0.53297811, 0.60291007,
            0.62984359, 0.56855871, 0.75861695, 0.66369882, 0.65146783,
            0.50194439, 0.67659964, 0.70683122, 0.79764071, 0.78134083,
            0.75458499, 0.81313587, 0.70808638, 0.69688339, 0.60883821],
           [0.78050398, 0.76005341, 0.73576241, 0.83125925, 0.70834733,
            0.77571713, 0.74351587, 0.75089692, 0.84218599, 0.75913377,
            0.        , 0.83013607, 0.77190501, 0.62218197, 0.66772389,
            0.72788839, 0.76523625, 0.77041467, 0.81336025, 0.76443338,
            0.59428248, 0.74823362, 0.59031506, 0.72263176, 0.70289287,
            0.72860324, 0.75642838, 0.67374505, 0.73491034, 0.76650554,
            0.54790568, 0.69609544, 0.8022492 , 0.81370584, 0.82431652,
            0.73607489, 0.79289605, 0.77851952, 0.83118626, 0.78188032,
            0.63242776, 0.77822959, 0.63999348, 0.69820249, 0.62804954,
            0.83582267, 0.73920596, 0.80310573, 0.72339376, 0.76348065],
           [0.6592238 , 0.66655801, 0.75293057, 0.60529105, 0.64314936,
            0.61148383, 0.76545872, 0.63519903, 0.66128439, 0.56181033,
            0.83013607, 0.        , 0.81079717, 0.74221927, 0.73794937,
            0.51908716, 0.80918411, 0.72207457, 0.56740348, 0.66313978,
            0.75803215, 0.75313185, 0.78930394, 0.69694168, 0.84386424,
            0.69573077, 0.54529863, 0.79750998, 0.60035439, 0.68142298,
            0.75401156, 0.79776236, 0.83635701, 0.38779714, 0.63589828,
            0.7570248 , 0.6535181 , 0.70102205, 0.532463  , 0.72196978,
            0.64517793, 0.67326249, 0.65505017, 0.77680775, 0.67694267,
            0.57980159, 0.78176045, 0.54702858, 0.75213786, 0.66425682],
           [0.80634563, 0.8195618 , 0.72547593, 0.78943225, 0.77963926,
            0.73373759, 0.8285098 , 0.82297647, 0.77755201, 0.73636862,
            0.77190501, 0.81079717, 0.        , 0.72348603, 0.75459374,
            0.7845797 , 0.71734548, 0.74897085, 0.71129285, 0.71531222,
            0.75250045, 0.58012048, 0.75952236, 0.79789667, 0.76414455,
            0.74269998, 0.79261849, 0.76447577, 0.83426808, 0.7024695 ,
            0.79058823, 0.7948401 , 0.67805473, 0.80770707, 0.7245865 ,
            0.65653343, 0.64284938, 0.85445291, 0.8267542 , 0.6523877 ,
            0.76396672, 0.72607423, 0.73342226, 0.61732072, 0.79365145,
            0.73149962, 0.80611219, 0.80240684, 0.50786847, 0.78687907],
           [0.7614999 , 0.77512605, 0.84311042, 0.64119369, 0.59266728,
            0.78892865, 0.74328336, 0.78480032, 0.82965514, 0.60063248,
            0.62218197, 0.74221927, 0.72348603, 0.        , 0.55856875,
            0.60532984, 0.80318655, 0.79767109, 0.802343  , 0.60664581,
            0.83188237, 0.69996898, 0.71015195, 0.71416213, 0.78956057,
            0.73714631, 0.63838635, 0.68138308, 0.73814154, 0.55435517,
            0.7835577 , 0.71349526, 0.73697381, 0.7288499 , 0.65504226,
            0.48362298, 0.64596438, 0.76933381, 0.83665915, 0.72897025,
            0.61417525, 0.77877784, 0.6839346 , 0.79368789, 0.80885318,
            0.76343948, 0.8280029 , 0.67162084, 0.67469698, 0.67087122],
           [0.77035081, 0.74754293, 0.7241475 , 0.71558198, 0.66117247,
            0.69301232, 0.54881222, 0.66302977, 0.81391342, 0.70003389,
            0.66772389, 0.73794937, 0.75459374, 0.55856875, 0.        ,
            0.71759376, 0.7437974 , 0.67528202, 0.85019407, 0.65604349,
            0.67431189, 0.77466982, 0.63631558, 0.67422079, 0.75873077,
            0.63017461, 0.76232619, 0.74055317, 0.62712987, 0.6009381 ,
            0.75032553, 0.78724622, 0.7340712 , 0.74559634, 0.70607655,
            0.70502253, 0.72041061, 0.73212102, 0.81037616, 0.76098638,
            0.71747559, 0.84983119, 0.58795772, 0.78645034, 0.7592229 ,
            0.76444914, 0.7387581 , 0.75306004, 0.57766338, 0.79481289],
           [0.74128145, 0.73830818, 0.71199072, 0.64180209, 0.53660794,
            0.75770976, 0.7249925 , 0.64691558, 0.7454719 , 0.54893172,
            0.72788839, 0.51908716, 0.7845797 , 0.60532984, 0.71759376,
            0.        , 0.86924009, 0.76977859, 0.76902418, 0.74026651,
            0.70378354, 0.79944217, 0.72871796, 0.67233916, 0.84427961,
            0.64218981, 0.56911021, 0.75178296, 0.67795628, 0.6180787 ,
            0.75003025, 0.75869606, 0.8036397 , 0.49147409, 0.72316439,
            0.59774496, 0.72283855, 0.77737137, 0.64741486, 0.79576359,
            0.44965928, 0.7421198 , 0.81251785, 0.74635435, 0.81918763,
            0.58430781, 0.84643954, 0.51456605, 0.71516501, 0.66408167],
           [0.79265647, 0.69874301, 0.80565939, 0.865402  , 0.79788965,
            0.702783  , 0.75050133, 0.80323497, 0.74124608, 0.72362978,
            0.76523625, 0.80918411, 0.71734548, 0.80318655, 0.7437974 ,
            0.86924009, 0.        , 0.69607665, 0.78535768, 0.62504292,
            0.75728435, 0.65484165, 0.86083812, 0.72341771, 0.74994366,
            0.70943089, 0.71308179, 0.85599471, 0.73916251, 0.8030432 ,
            0.59096397, 0.76088975, 0.60643138, 0.806398  , 0.56822621,
            0.8337787 , 0.64983674, 0.61680449, 0.82323487, 0.45419355,
            0.85112306, 0.79729057, 0.61296798, 0.76730806, 0.59123476,
            0.88949392, 0.58467747, 0.87489622, 0.70374955, 0.69288426],
           [0.66158005, 0.55374828, 0.71616288, 0.81510607, 0.75349739,
            0.41921323, 0.60109975, 0.73658599, 0.79196273, 0.73301576,
            0.77041467, 0.72207457, 0.74897085, 0.79767109, 0.67528202,
            0.76977859, 0.69607665, 0.        , 0.72109534, 0.70627977,
            0.66841524, 0.80858824, 0.78137596, 0.69852547, 0.69618033,
            0.66330852, 0.69494834, 0.83687976, 0.53983909, 0.72271462,
            0.72234186, 0.88158673, 0.88475312, 0.71410866, 0.67922098,
            0.71460773, 0.60835913, 0.54849355, 0.81840728, 0.76015569,
            0.79238466, 0.72964538, 0.72202731, 0.77417833, 0.69600855,
            0.7210481 , 0.50853815, 0.78887168, 0.5963894 , 0.65817666],
           [0.68437634, 0.77031168, 0.84465951, 0.75485491, 0.7642573 ,
            0.64018701, 0.87417832, 0.83260425, 0.73271265, 0.79699678,
            0.81336025, 0.56740348, 0.71129285, 0.802343  , 0.85019407,
            0.76902418, 0.78535768, 0.72109534, 0.        , 0.77367958,
            0.82784846, 0.6852596 , 0.82949734, 0.79500985, 0.73019043,
            0.74986798, 0.62392812, 0.80500494, 0.75672561, 0.81750428,
            0.7794543 , 0.77504878, 0.87163957, 0.68726511, 0.71615354,
            0.75732493, 0.66484534, 0.72936783, 0.64515305, 0.70962403,
            0.8517236 , 0.70367396, 0.6473327 , 0.71083448, 0.63783029,
            0.65753052, 0.72210196, 0.68983248, 0.77095343, 0.73693109],
           [0.76928987, 0.67375359, 0.84958524, 0.74076125, 0.55932676,
            0.70631102, 0.79731309, 0.74937438, 0.77135358, 0.53399323,
            0.76443338, 0.66313978, 0.71531222, 0.60664581, 0.65604349,
            0.74026651, 0.62504292, 0.70627977, 0.77367958, 0.        ,
            0.81687141, 0.73167123, 0.74874322, 0.71644935, 0.82438165,
            0.71719276, 0.66496575, 0.74861957, 0.70092446, 0.67267485,
            0.75326267, 0.69835461, 0.69827988, 0.65650121, 0.45785672,
            0.69930187, 0.43104739, 0.66107389, 0.78000058, 0.53015653,
            0.73107424, 0.76544862, 0.62975311, 0.7310328 , 0.76116092,
            0.76653344, 0.7892551 , 0.75886339, 0.67506314, 0.66458766],
           [0.68656507, 0.71109231, 0.5788423 , 0.78378042, 0.77590223,
            0.75111818, 0.6786768 , 0.66519195, 0.74594532, 0.7700555 ,
            0.59428248, 0.75803215, 0.75250045, 0.83188237, 0.67431189,
            0.70378354, 0.75728435, 0.66841524, 0.82784846, 0.81687141,
            0.        , 0.76798399, 0.57420538, 0.65944198, 0.76747421,
            0.74026967, 0.82221602, 0.77607036, 0.61479469, 0.67603008,
            0.64760339, 0.84127414, 0.8204126 , 0.75044804, 0.80945133,
            0.81591589, 0.81184937, 0.76641467, 0.76231486, 0.78027845,
            0.65281172, 0.75933352, 0.73650617, 0.66386478, 0.64202299,
            0.79935239, 0.66750055, 0.7519344 , 0.68510386, 0.82194085],
           [0.78531383, 0.80797415, 0.8214973 , 0.67505258, 0.78388848,
            0.75234808, 0.77847222, 0.77195011, 0.79945384, 0.75628471,
            0.74823362, 0.75313185, 0.58012048, 0.69996898, 0.77466982,
            0.79944217, 0.65484165, 0.80858824, 0.6852596 , 0.73167123,
            0.76798399, 0.        , 0.77703276, 0.77719146, 0.82185243,
            0.83271603, 0.71411233, 0.76252808, 0.81266561, 0.67869497,
            0.74264762, 0.78389077, 0.60637477, 0.82055918, 0.63375062,
            0.71523692, 0.70003192, 0.771046  , 0.84087156, 0.57118487,
            0.79251862, 0.78107976, 0.67116782, 0.74219115, 0.63568212,
            0.74741834, 0.70654298, 0.77419923, 0.70786952, 0.70172714],
           [0.70126784, 0.86974634, 0.76174093, 0.81779462, 0.65458962,
            0.82038655, 0.7177663 , 0.79662294, 0.7917446 , 0.78417718,
            0.59031506, 0.78930394, 0.75952236, 0.71015195, 0.63631558,
            0.72871796, 0.86083812, 0.78137596, 0.82949734, 0.74874322,
            0.57420538, 0.77703276, 0.        , 0.83335351, 0.82188819,
            0.79137423, 0.8230648 , 0.59882623, 0.76014408, 0.70755697,
            0.71261871, 0.70966197, 0.74818401, 0.76401911, 0.80888426,
            0.79895488, 0.80388344, 0.85389118, 0.75944977, 0.7756251 ,
            0.65433895, 0.78111738, 0.72906299, 0.59397926, 0.73730943,
            0.77498936, 0.77075302, 0.81395399, 0.7969906 , 0.82275936],
           [0.74454195, 0.60681423, 0.68042659, 0.69904511, 0.66688154,
            0.69142214, 0.69843567, 0.5454941 , 0.70549234, 0.73909476,
            0.72263176, 0.69694168, 0.79789667, 0.71416213, 0.67422079,
            0.67233916, 0.72341771, 0.69852547, 0.79500985, 0.71644935,
            0.65944198, 0.77719146, 0.83335351, 0.        , 0.66393543,
            0.61205066, 0.72661894, 0.74012307, 0.49720341, 0.65074987,
            0.78843993, 0.78556696, 0.80460332, 0.70687876, 0.66084547,
            0.7384402 , 0.68730996, 0.59759066, 0.80055784, 0.76006344,
            0.6893904 , 0.75862095, 0.7579142 , 0.72938796, 0.73551897,
            0.79140475, 0.73297166, 0.61654071, 0.64026624, 0.67581065],
           [0.70472917, 0.74108587, 0.68830524, 0.82035943, 0.7669503 ,
            0.68614597, 0.68981374, 0.81833725, 0.86958496, 0.87423854,
            0.70289287, 0.84386424, 0.76414455, 0.78956057, 0.75873077,
            0.84427961, 0.74994366, 0.69618033, 0.73019043, 0.82438165,
            0.76747421, 0.82185243, 0.82188819, 0.66393543, 0.        ,
            0.62370891, 0.83768362, 0.78749599, 0.77022127, 0.79747016,
            0.79046438, 0.74551279, 0.76801317, 0.85096331, 0.78950992,
            0.77136303, 0.72383068, 0.6263832 , 0.83339634, 0.76495878,
            0.84573651, 0.72306375, 0.73258759, 0.66364547, 0.74553423,
            0.82641108, 0.69440356, 0.79046296, 0.71342857, 0.86801455],
           [0.84226565, 0.73674475, 0.75745228, 0.81162265, 0.56059937,
            0.61547614, 0.63860879, 0.66462689, 0.81520264, 0.75363346,
            0.72860324, 0.69573077, 0.74269998, 0.73714631, 0.63017461,
            0.64218981, 0.70943089, 0.66330852, 0.74986798, 0.71719276,
            0.74026967, 0.83271603, 0.79137423, 0.61205066, 0.62370891,
            0.        , 0.71550285, 0.81880117, 0.71377433, 0.74648857,
            0.74645716, 0.66740957, 0.70610316, 0.67677638, 0.72603309,
            0.71259012, 0.63479433, 0.68954567, 0.77887862, 0.75038168,
            0.7032061 , 0.84619301, 0.76496165, 0.64400903, 0.77211221,
            0.58919174, 0.81311961, 0.70699798, 0.56334321, 0.79598312],
           [0.71829628, 0.69114341, 0.83746292, 0.77490858, 0.65397904,
            0.68489594, 0.71681941, 0.80775569, 0.73247821, 0.60637621,
            0.75642838, 0.54529863, 0.79261849, 0.63838635, 0.76232619,
            0.56911021, 0.71308179, 0.69494834, 0.62392812, 0.66496575,
            0.82221602, 0.71411233, 0.8230648 , 0.72661894, 0.83768362,
            0.71550285, 0.        , 0.80115595, 0.67267879, 0.74231482,
            0.63673762, 0.77729247, 0.78701035, 0.5620789 , 0.49622134,
            0.67317593, 0.64350605, 0.60988698, 0.68538772, 0.62582865,
            0.6733073 , 0.74021564, 0.74228928, 0.79124932, 0.64840528,
            0.70581014, 0.6816321 , 0.62977752, 0.74590109, 0.41060309],
           [0.7546717 , 0.80051677, 0.78963572, 0.78219753, 0.6519263 ,
            0.84509504, 0.79916915, 0.75770953, 0.6459881 , 0.81281107,
            0.67374505, 0.79750998, 0.76447577, 0.68138308, 0.74055317,
            0.75178296, 0.85599471, 0.83687976, 0.80500494, 0.74861957,
            0.77607036, 0.76252808, 0.59882623, 0.74012307, 0.78749599,
            0.81880117, 0.80115595, 0.        , 0.73952091, 0.77852256,
            0.81826845, 0.67391586, 0.77313914, 0.7034562 , 0.78658054,
            0.7839906 , 0.79300703, 0.8381854 , 0.69873143, 0.7741465 ,
            0.78064209, 0.75256699, 0.71565037, 0.740039  , 0.78686182,
            0.81030441, 0.81955836, 0.70532844, 0.80280947, 0.73984394],
           [0.58844025, 0.54215858, 0.70431702, 0.71023489, 0.74367107,
            0.63331873, 0.64137317, 0.56621215, 0.6486505 , 0.63992206,
            0.73491034, 0.60035439, 0.83426808, 0.73814154, 0.62712987,
            0.67795628, 0.73916251, 0.53983909, 0.75672561, 0.70092446,
            0.61479469, 0.81266561, 0.76014408, 0.49720341, 0.77022127,
            0.71377433, 0.67267879, 0.73952091, 0.        , 0.60480762,
            0.70282709, 0.85307227, 0.86889368, 0.59484548, 0.66519405,
            0.74521977, 0.65626979, 0.60497887, 0.71209307, 0.75256177,
            0.70715034, 0.67516135, 0.67720713, 0.81869859, 0.65978364,
            0.7883013 , 0.59801098, 0.67245658, 0.68334451, 0.60622913],
           [0.61481631, 0.6949043 , 0.79011583, 0.55047745, 0.68952702,
            0.79087377, 0.6784237 , 0.69149233, 0.7902839 , 0.56971955,
            0.76650554, 0.68142298, 0.7024695 , 0.55435517, 0.6009381 ,
            0.6180787 , 0.8030432 , 0.72271462, 0.81750428, 0.67267485,
            0.67603008, 0.67869497, 0.70755697, 0.65074987, 0.79747016,
            0.74648857, 0.74231482, 0.77852256, 0.60480762, 0.        ,
            0.83065502, 0.78933828, 0.72945859, 0.65835325, 0.67352752,
            0.6139274 , 0.62558026, 0.78356721, 0.77711399, 0.72567777,
            0.58410807, 0.7018324 , 0.76966015, 0.80526939, 0.82386034,
            0.75623843, 0.77829696, 0.59286938, 0.66645526, 0.75401177],
           [0.75672662, 0.70981351, 0.73832782, 0.88998501, 0.82448808,
            0.68193135, 0.69686442, 0.73961778, 0.73997816, 0.65902684,
            0.54790568, 0.75401156, 0.79058823, 0.7835577 , 0.75032553,
            0.75003025, 0.59096397, 0.72234186, 0.7794543 , 0.75326267,
            0.64760339, 0.74264762, 0.71261871, 0.78843993, 0.79046438,
            0.74645716, 0.63673762, 0.81826845, 0.70282709, 0.83065502,
            0.        , 0.83407853, 0.72374847, 0.74648602, 0.71527349,
            0.8009359 , 0.75855044, 0.67820745, 0.74209128, 0.62935699,
            0.6469987 , 0.75664297, 0.64921699, 0.70805139, 0.45338895,
            0.83481994, 0.61972719, 0.85694436, 0.7550577 , 0.64659202],
           [0.79875981, 0.85156022, 0.8780187 , 0.8497448 , 0.54226003,
            0.88271388, 0.8106295 , 0.85766635, 0.84033345, 0.83241094,
            0.69609544, 0.79776236, 0.7948401 , 0.71349526, 0.78724622,
            0.75869606, 0.76088975, 0.88158673, 0.77504878, 0.69835461,
            0.84127414, 0.78389077, 0.70966197, 0.78556696, 0.74551279,
            0.66740957, 0.77729247, 0.67391586, 0.85307227, 0.78933828,
            0.83407853, 0.        , 0.63738402, 0.7781494 , 0.79102896,
            0.84798637, 0.75215628, 0.83290559, 0.78875629, 0.72305145,
            0.80236621, 0.78446489, 0.77799481, 0.73060228, 0.83747323,
            0.80030931, 0.86885749, 0.764951  , 0.85285474, 0.86059354],
           [0.81980007, 0.87593532, 0.81574552, 0.79443133, 0.73173332,
            0.85023982, 0.72177138, 0.81138803, 0.78134508, 0.73196951,
            0.8022492 , 0.83635701, 0.67805473, 0.73697381, 0.7340712 ,
            0.8036397 , 0.60643138, 0.88475312, 0.87163957, 0.69827988,
            0.8204126 , 0.60637477, 0.74818401, 0.80460332, 0.76801317,
            0.70610316, 0.78701035, 0.77313914, 0.86889368, 0.72945859,
            0.72374847, 0.63738402, 0.        , 0.81726854, 0.64345118,
            0.79255019, 0.69634689, 0.78802009, 0.80103708, 0.50615143,
            0.75648258, 0.80587846, 0.76787496, 0.66784666, 0.77578612,
            0.83511575, 0.82101965, 0.86267315, 0.76820314, 0.80214405],
           [0.6473533 , 0.58292228, 0.75615384, 0.69508747, 0.61661519,
            0.68470437, 0.74667154, 0.69178734, 0.57056867, 0.53297811,
            0.81370584, 0.38779714, 0.80770707, 0.7288499 , 0.74559634,
            0.49147409, 0.806398  , 0.71410866, 0.68726511, 0.65650121,
            0.75044804, 0.82055918, 0.76401911, 0.70687876, 0.85096331,
            0.67677638, 0.5620789 , 0.7034562 , 0.59484548, 0.65835325,
            0.74648602, 0.7781494 , 0.81726854, 0.        , 0.6424704 ,
            0.74637908, 0.64371907, 0.72099971, 0.42142522, 0.71849776,
            0.62023333, 0.64990315, 0.74365778, 0.77350148, 0.75093941,
            0.65872031, 0.78057769, 0.47686966, 0.74499282, 0.65963241],
           [0.73142954, 0.70376744, 0.82493419, 0.68802422, 0.63603983,
            0.69109509, 0.72733059, 0.79523413, 0.74331635, 0.60291007,
            0.82431652, 0.63589828, 0.7245865 , 0.65504226, 0.70607655,
            0.72316439, 0.56822621, 0.67922098, 0.71615354, 0.45785672,
            0.80945133, 0.63375062, 0.80888426, 0.66084547, 0.78950992,
            0.72603309, 0.49622134, 0.78658054, 0.66519405, 0.67352752,
            0.71527349, 0.79102896, 0.64345118, 0.6424704 , 0.        ,
            0.65931844, 0.41642859, 0.50751034, 0.75448935, 0.43163136,
            0.75844273, 0.7441072 , 0.68107395, 0.71524127, 0.65721295,
            0.76559595, 0.67747311, 0.71567947, 0.66594258, 0.52397377],
           [0.80864904, 0.79573898, 0.82225902, 0.60829484, 0.68388753,
            0.74156477, 0.78802986, 0.79041444, 0.86539321, 0.62984359,
            0.73607489, 0.7570248 , 0.65653343, 0.48362298, 0.70502253,
            0.59774496, 0.8337787 , 0.71460773, 0.75732493, 0.69930187,
            0.81591589, 0.71523692, 0.79895488, 0.7384402 , 0.77136303,
            0.71259012, 0.67317593, 0.7839906 , 0.74521977, 0.6139274 ,
            0.8009359 , 0.84798637, 0.79255019, 0.74637908, 0.65931844,
            0.        , 0.5506553 , 0.76477782, 0.85708534, 0.75658216,
            0.65916046, 0.81074456, 0.78273157, 0.72413329, 0.83106375,
            0.59071875, 0.83693003, 0.70334127, 0.59234507, 0.6801466 ],
           [0.72797433, 0.68909576, 0.84240081, 0.68850307, 0.62409463,
            0.63422645, 0.79013071, 0.77212689, 0.77377549, 0.56855871,
            0.79289605, 0.6535181 , 0.64284938, 0.64596438, 0.72041061,
            0.72283855, 0.64983674, 0.60835913, 0.66484534, 0.43104739,
            0.81184937, 0.70003192, 0.80388344, 0.68730996, 0.72383068,
            0.63479433, 0.64350605, 0.79300703, 0.65626979, 0.62558026,
            0.75855044, 0.75215628, 0.69634689, 0.64371907, 0.41642859,
            0.5506553 , 0.        , 0.62013432, 0.76939812, 0.52779339,
            0.73143273, 0.72391389, 0.69592318, 0.65348297, 0.74532391,
            0.67153813, 0.76290165, 0.72830214, 0.59687989, 0.64410722],
           [0.69799171, 0.56432382, 0.71470476, 0.76691667, 0.70312053,
            0.5789466 , 0.61429551, 0.76206726, 0.80921816, 0.75861695,
            0.77851952, 0.70102205, 0.85445291, 0.76933381, 0.73212102,
            0.77737137, 0.61680449, 0.54849355, 0.72936783, 0.66107389,
            0.76641467, 0.771046  , 0.85389118, 0.59759066, 0.6263832 ,
            0.68954567, 0.60988698, 0.8381854 , 0.60497887, 0.78356721,
            0.67820745, 0.83290559, 0.78802009, 0.72099971, 0.50751034,
            0.76477782, 0.62013432, 0.        , 0.79239605, 0.64499942,
            0.81612562, 0.70994941, 0.70021918, 0.78023218, 0.61588633,
            0.81105482, 0.52911992, 0.72991937, 0.70784622, 0.63371943],
           [0.62853531, 0.70672819, 0.72282589, 0.77169427, 0.74686914,
            0.78488224, 0.84041717, 0.77032183, 0.51894473, 0.66369882,
            0.83118626, 0.532463  , 0.8267542 , 0.83665915, 0.81037616,
            0.64741486, 0.82323487, 0.81840728, 0.64515305, 0.78000058,
            0.76231486, 0.84087156, 0.75944977, 0.80055784, 0.83339634,
            0.77887862, 0.68538772, 0.69873143, 0.71209307, 0.77711399,
            0.74209128, 0.78875629, 0.80103708, 0.42142522, 0.75448935,
            0.85708534, 0.76939812, 0.79239605, 0.        , 0.72825261,
            0.73449425, 0.64505914, 0.72402219, 0.77464394, 0.75528989,
            0.77440221, 0.79102321, 0.58929541, 0.84538787, 0.78263783],
           [0.69413782, 0.76139357, 0.81548605, 0.79506018, 0.71228575,
            0.74895999, 0.76447065, 0.83875841, 0.69655076, 0.65146783,
            0.78188032, 0.72196978, 0.6523877 , 0.72897025, 0.76098638,
            0.79576359, 0.45419355, 0.76015569, 0.70962403, 0.53015653,
            0.78027845, 0.57118487, 0.7756251 , 0.76006344, 0.76495878,
            0.75038168, 0.62582865, 0.7741465 , 0.75256177, 0.72567777,
            0.62935699, 0.72305145, 0.50615143, 0.71849776, 0.43163136,
            0.75658216, 0.52779339, 0.64499942, 0.72825261, 0.        ,
            0.78814469, 0.70008306, 0.62582761, 0.66652368, 0.61165375,
            0.82025527, 0.66809391, 0.80994688, 0.7323813 , 0.64475676],
           [0.74294036, 0.71688989, 0.7466222 , 0.68646561, 0.68322058,
            0.75365317, 0.72034922, 0.63154576, 0.74563466, 0.50194439,
            0.63242776, 0.64517793, 0.76396672, 0.61417525, 0.71747559,
            0.44965928, 0.85112306, 0.79238466, 0.8517236 , 0.73107424,
            0.65281172, 0.79251862, 0.65433895, 0.6893904 , 0.84573651,
            0.7032061 , 0.6733073 , 0.78064209, 0.70715034, 0.58410807,
            0.6469987 , 0.80236621, 0.75648258, 0.62023333, 0.75844273,
            0.65916046, 0.73143273, 0.81612562, 0.73449425, 0.78814469,
            0.        , 0.74548451, 0.82261529, 0.66952647, 0.76653704,
            0.7097711 , 0.86703593, 0.65235087, 0.72740621, 0.68651853],
           [0.40317896, 0.64040506, 0.62530466, 0.75102725, 0.80076825,
            0.72583498, 0.76030883, 0.80648844, 0.67016126, 0.67659964,
            0.77822959, 0.67326249, 0.72607423, 0.77877784, 0.84983119,
            0.7421198 , 0.79729057, 0.72964538, 0.70367396, 0.76544862,
            0.75933352, 0.78107976, 0.78111738, 0.75862095, 0.72306375,
            0.84619301, 0.74021564, 0.75256699, 0.67516135, 0.7018324 ,
            0.75664297, 0.78446489, 0.80587846, 0.64990315, 0.7441072 ,
            0.81074456, 0.72391389, 0.70994941, 0.64505914, 0.70008306,
            0.74548451, 0.        , 0.73754538, 0.7975099 , 0.72720544,
            0.85788828, 0.66315471, 0.72710376, 0.77833002, 0.74664506],
           [0.71731324, 0.72641408, 0.74236497, 0.71916807, 0.74886377,
            0.62271998, 0.76619323, 0.72191186, 0.74989196, 0.70683122,
            0.63999348, 0.65505017, 0.73342226, 0.6839346 , 0.58795772,
            0.81251785, 0.61296798, 0.72202731, 0.6473327 , 0.62975311,
            0.73650617, 0.67116782, 0.72906299, 0.7579142 , 0.73258759,
            0.76496165, 0.74228928, 0.71565037, 0.67720713, 0.76966015,
            0.64921699, 0.77799481, 0.76787496, 0.74365778, 0.68107395,
            0.78273157, 0.69592318, 0.70021918, 0.72402219, 0.62582761,
            0.82261529, 0.73754538, 0.        , 0.79535047, 0.51826316,
            0.79476011, 0.67583789, 0.81528842, 0.68925044, 0.77268698],
           [0.79479665, 0.84817813, 0.75356888, 0.84618761, 0.68556028,
            0.73210761, 0.80432002, 0.80897831, 0.75375697, 0.79764071,
            0.69820249, 0.77680775, 0.61732072, 0.79368789, 0.78645034,
            0.74635435, 0.76730806, 0.77417833, 0.71083448, 0.7310328 ,
            0.66386478, 0.74219115, 0.59397926, 0.72938796, 0.66364547,
            0.64400903, 0.79124932, 0.740039  , 0.81869859, 0.80526939,
            0.70805139, 0.73060228, 0.66784666, 0.77350148, 0.71524127,
            0.72413329, 0.65348297, 0.78023218, 0.77464394, 0.66652368,
            0.66952647, 0.7975099 , 0.79535047, 0.        , 0.70875564,
            0.69986985, 0.81271324, 0.78261719, 0.70211725, 0.79935656],
           [0.70966367, 0.69717157, 0.73609389, 0.79644079, 0.81516275,
            0.60873405, 0.70572162, 0.72941062, 0.73710314, 0.78134083,
            0.62804954, 0.67694267, 0.79365145, 0.80885318, 0.7592229 ,
            0.81918763, 0.59123476, 0.69600855, 0.63783029, 0.76116092,
            0.64202299, 0.63568212, 0.73730943, 0.73551897, 0.74553423,
            0.77211221, 0.64840528, 0.78686182, 0.65978364, 0.82386034,
            0.45338895, 0.83747323, 0.77578612, 0.75093941, 0.65721295,
            0.83106375, 0.74532391, 0.61588633, 0.75528989, 0.61165375,
            0.76653704, 0.72720544, 0.51826316, 0.70875564, 0.        ,
            0.79241514, 0.5470569 , 0.8085198 , 0.74688897, 0.67476524],
           [0.86131737, 0.82505762, 0.80336648, 0.67221983, 0.59714766,
            0.64012611, 0.77311003, 0.68126148, 0.84746281, 0.75458499,
            0.83582267, 0.57980159, 0.73149962, 0.76343948, 0.76444914,
            0.58430781, 0.88949392, 0.7210481 , 0.65753052, 0.76653344,
            0.79935239, 0.74741834, 0.77498936, 0.79140475, 0.82641108,
            0.58919174, 0.70581014, 0.81030441, 0.7883013 , 0.75623843,
            0.83481994, 0.80030931, 0.83511575, 0.65872031, 0.76559595,
            0.59071875, 0.67153813, 0.81105482, 0.77440221, 0.82025527,
            0.7097711 , 0.85788828, 0.79476011, 0.69986985, 0.79241514,
            0.        , 0.87938232, 0.67885561, 0.66327136, 0.78024123],
           [0.5647003 , 0.62629194, 0.69712122, 0.87295518, 0.84254485,
            0.6194822 , 0.60253568, 0.82306219, 0.75884842, 0.81313587,
            0.73920596, 0.78176045, 0.80611219, 0.8280029 , 0.7387581 ,
            0.84643954, 0.58467747, 0.50853815, 0.72210196, 0.7892551 ,
            0.66750055, 0.70654298, 0.77075302, 0.73297166, 0.69440356,
            0.81311961, 0.6816321 , 0.81955836, 0.59801098, 0.77829696,
            0.61972719, 0.86885749, 0.82101965, 0.78057769, 0.67747311,
            0.83693003, 0.76290165, 0.52911992, 0.79102321, 0.66809391,
            0.86703593, 0.66315471, 0.67583789, 0.81271324, 0.5470569 ,
            0.87938232, 0.        , 0.81952923, 0.76063836, 0.65389171],
           [0.71313567, 0.63518265, 0.76133576, 0.62283238, 0.6177019 ,
            0.78751177, 0.7829767 , 0.72479426, 0.69907053, 0.70808638,
            0.80310573, 0.54702858, 0.80240684, 0.67162084, 0.75306004,
            0.51456605, 0.87489622, 0.78887168, 0.68983248, 0.75886339,
            0.7519344 , 0.77419923, 0.81395399, 0.61654071, 0.79046296,
            0.70699798, 0.62977752, 0.70532844, 0.67245658, 0.59286938,
            0.85694436, 0.764951  , 0.86267315, 0.47686966, 0.71567947,
            0.70334127, 0.72830214, 0.72991937, 0.58929541, 0.80994688,
            0.65235087, 0.72710376, 0.81528842, 0.78261719, 0.8085198 ,
            0.67885561, 0.81952923, 0.        , 0.74216932, 0.73869309],
           [0.84326947, 0.69626437, 0.65736419, 0.72227966, 0.71276176,
            0.5881986 , 0.6713507 , 0.66571653, 0.82619008, 0.69688339,
            0.72339376, 0.75213786, 0.50786847, 0.67469698, 0.57766338,
            0.71516501, 0.70374955, 0.5963894 , 0.77095343, 0.67506314,
            0.68510386, 0.70786952, 0.7969906 , 0.64026624, 0.71342857,
            0.56334321, 0.74590109, 0.80280947, 0.68334451, 0.66645526,
            0.7550577 , 0.85285474, 0.76820314, 0.74499282, 0.66594258,
            0.59234507, 0.59687989, 0.70784622, 0.84538787, 0.7323813 ,
            0.72740621, 0.77833002, 0.68925044, 0.70211725, 0.74688897,
            0.66327136, 0.76063836, 0.74216932, 0.        , 0.7437447 ],
           [0.75016322, 0.70427346, 0.85176525, 0.7958735 , 0.73368726,
            0.67541381, 0.73283193, 0.74297836, 0.66910113, 0.60883821,
            0.76348065, 0.66425682, 0.78687907, 0.67087122, 0.79481289,
            0.66408167, 0.69288426, 0.65817666, 0.73693109, 0.66458766,
            0.82194085, 0.70172714, 0.82275936, 0.67581065, 0.86801455,
            0.79598312, 0.41060309, 0.73984394, 0.60622913, 0.75401177,
            0.64659202, 0.86059354, 0.80214405, 0.65963241, 0.52397377,
            0.6801466 , 0.64410722, 0.63371943, 0.78263783, 0.64475676,
            0.68651853, 0.74664506, 0.77268698, 0.79935656, 0.67476524,
            0.78024123, 0.65389171, 0.73869309, 0.7437447 , 0.        ]])





---



 ### Gower-Binary-Multiclass Similarity Coefficient   <a class="anchor" id="95.1"></a>




The Gower-Binary-Multiclass similarity between the elements $i$ and $j$ with respect to the variables $X_1,...,X_p$ is:



\begin{gather*}
S(i,j)_{GowerBM}=\dfrac{ a_{ij} + \alpha_{ij} }{  (p_2 - d_{ij}) + p_3}
\end{gather*}



Where:

 
$p_2 \hspace{0.05cm} $ is the number of binary categorical variables

$p_3 \hspace{0.05cm}  $ is the number of multiple (non-binary) categorical variables

$ p_2 + p_3 = p$ 

$a_{ij} \hspace{0.05cm} $ is the number of binary variables (there are $\hspace{0.05cm} p_2\hspace{0.05cm} $) that take 1 in both individuals $i$ and $j$

$d_{ij} \hspace{0.05cm} $ is the number of binary variables (there are $\hspace{0.05cm}  p_2 \hspace{0.05cm} $) that take 0 in both individuals $i$ and $j$

$\alpha_{ij} \hspace{0.05cm} $ is the number of matches (coincidencias) between multiple non-binary categorical variables (there are $\hspace{0.05cm}  p_3 \hspace{0.05cm} $) for individuals $i$ and $j$




 ### Gower-Binary-Multiclass Distance   <a class="anchor" id="95.1.1"></a>



\begin{gather*}
\delta(i,j)_{GowerBM} = \sqrt{1 - S(i,j)_{GowerBM}}
\end{gather*}





----



 ### Gower-Binary-Multiclass Similarity in `Python`  <a class="anchor" id="95.2"></a>


```python
def a(Binary_Data) :

            X = Binary_Data

            a = X @ X.T

            return(a)

##########################################################################################

def d(Binary_Data):

            X = Binary_Data

            ones_matrix = np.ones(( X.shape[0] , X.shape[1])) 

            d = (ones_matrix - X) @ (ones_matrix - X).T

            return(d)

##########################################################################################

def alpha_py(i,j, Multiple_Categorical_Data):

                X = Multiple_Categorical_Data

                alpha = np.repeat(0, X.shape[1])

                for k in range(0, X.shape[1]) :

                    if X[i-1, k] == X[j-1, k] :

                        alpha[k] = 1

                    else :

                        alpha[k] = 0


                alpha = alpha.sum()

                return(alpha)
```


```python
def GowerBM_Similarity_Python(i,j, BM_Data_Set, p2, p3):

    X = BM_Data_Set.to_numpy()

   # The data matrix X have to be order in the following way:
   # The p2 first are binary categorical, and the following p3 are multiple categorical.

##########################################################################################
       
    Binary_Data = X[: , 0:p2]

    Multiple_Categorical_Data = X[: , (p2):(p2+p3)]
 
##########################################################################################

 
    numerator_part_2 = a(Binary_Data)[i-1,j-1] + alpha_py(i,j, Multiple_Categorical_Data)

    numerator = numerator_part_2

    denominator = (p2 - d(Binary_Data)[i-1,j-1]) + p3

    Similarity_Gower = numerator / denominator  

    return(Similarity_Gower)
```


```python
BM_Data_Py = Mixed_Data_Py.iloc[: , 4:10]

BM_Data_Py.head()
```




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
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>X5</th>
      <th>X6</th>
      <th>X7</th>
      <th>X8</th>
      <th>X9</th>
      <th>X10</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>3.0</td>
      <td>1.0</td>
      <td>4.0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>3.0</td>
      <td>1.0</td>
      <td>3.0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>3.0</td>
      <td>1.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>3</th>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>2.0</td>
      <td>3.0</td>
      <td>2.0</td>
    </tr>
  </tbody>
</table>
</div>




```python
GowerBM_Similarity_Python(1, 4, BM_Data_Py, 3, 3)
```




    0.2





---



 ### Gower-Binary-Multiclass Similarity Matrix in `Python`  <a class="anchor" id="95.3"></a>


```python
def Sim_GowerBM_Matrix_Python(BM_Data,  p2, p3):

    M = np.zeros((BM_Data.shape[0] , BM_Data.shape[0]))

    for i in range(0 , BM_Data.shape[0]):
        for j in range(0 , BM_Data.shape[0]):

            M[i,j] = GowerBM_Similarity_Python(i+1,j+1, BM_Data, p2, p3)
                 
    return M
```


```python
Sim_GowerBM_Matrix_Python(BM_Data_Py,  3, 3)
```




    array([[1.        , 0.5       , 0.4       , 0.2       , 0.        ,
            0.33333333, 0.33333333, 0.16666667, 0.5       , 0.4       ,
            0.        , 0.4       , 0.        , 0.        , 0.16666667,
            0.2       , 0.2       , 0.5       , 0.25      , 0.2       ,
            0.4       , 0.        , 0.25      , 0.16666667, 0.2       ,
            0.        , 0.2       , 0.        , 0.5       , 0.4       ,
            0.2       , 0.        , 0.        , 0.4       , 0.2       ,
            0.        , 0.2       , 0.33333333, 0.5       , 0.25      ,
            0.2       , 0.75      , 0.2       , 0.        , 0.2       ,
            0.        , 0.6       , 0.2       , 0.        , 0.2       ],
           [0.5       , 1.        , 0.5       , 0.33333333, 0.16666667,
            0.66666667, 0.5       , 0.5       , 0.5       , 0.5       ,
            0.16666667, 0.5       , 0.        , 0.16666667, 0.33333333,
            0.33333333, 0.33333333, 0.66666667, 0.16666667, 0.33333333,
            0.33333333, 0.        , 0.        , 0.5       , 0.33333333,
            0.33333333, 0.33333333, 0.16666667, 0.66666667, 0.33333333,
            0.33333333, 0.        , 0.        , 0.66666667, 0.33333333,
            0.16666667, 0.33333333, 0.66666667, 0.5       , 0.16666667,
            0.33333333, 0.5       , 0.33333333, 0.        , 0.33333333,
            0.16666667, 0.5       , 0.5       , 0.33333333, 0.33333333],
           [0.4       , 0.5       , 1.        , 0.2       , 0.        ,
            0.33333333, 0.4       , 0.4       , 0.2       , 0.16666667,
            0.25      , 0.16666667, 0.25      , 0.        , 0.2       ,
            0.2       , 0.2       , 0.33333333, 0.        , 0.        ,
            0.5       , 0.        , 0.        , 0.4       , 0.5       ,
            0.2       , 0.        , 0.        , 0.33333333, 0.2       ,
            0.2       , 0.        , 0.        , 0.16666667, 0.        ,
            0.        , 0.        , 0.33333333, 0.2       , 0.        ,
            0.2       , 0.6       , 0.2       , 0.        , 0.2       ,
            0.        , 0.4       , 0.2       , 0.4       , 0.        ],
           [0.2       , 0.33333333, 0.2       , 1.        , 0.25      ,
            0.33333333, 0.2       , 0.6       , 0.2       , 0.6       ,
            0.        , 0.6       , 0.25      , 0.5       , 0.4       ,
            0.5       , 0.16666667, 0.16666667, 0.2       , 0.4       ,
            0.2       , 0.5       , 0.        , 0.4       , 0.        ,
            0.2       , 0.2       , 0.        , 0.33333333, 0.75      ,
            0.        , 0.        , 0.25      , 0.4       , 0.4       ,
            0.5       , 0.4       , 0.16666667, 0.2       , 0.2       ,
            0.5       , 0.2       , 0.33333333, 0.        , 0.16666667,
            0.5       , 0.        , 0.5       , 0.4       , 0.2       ],
           [0.        , 0.16666667, 0.        , 0.25      , 1.        ,
            0.16666667, 0.2       , 0.2       , 0.        , 0.2       ,
            0.2       , 0.4       , 0.        , 0.5       , 0.4       ,
            0.5       , 0.16666667, 0.16666667, 0.2       , 0.6       ,
            0.        , 0.        , 0.25      , 0.4       , 0.2       ,
            0.6       , 0.4       , 0.25      , 0.16666667, 0.25      ,
            0.        , 0.75      , 0.25      , 0.4       , 0.4       ,
            0.25      , 0.4       , 0.33333333, 0.2       , 0.2       ,
            0.25      , 0.        , 0.16666667, 0.25      , 0.        ,
            0.5       , 0.        , 0.5       , 0.2       , 0.2       ],
           [0.33333333, 0.66666667, 0.33333333, 0.33333333, 0.16666667,
            1.        , 0.5       , 0.5       , 0.16666667, 0.33333333,
            0.16666667, 0.5       , 0.16666667, 0.16666667, 0.33333333,
            0.16666667, 0.33333333, 0.83333333, 0.5       , 0.33333333,
            0.16666667, 0.16666667, 0.        , 0.33333333, 0.5       ,
            0.5       , 0.33333333, 0.        , 0.5       , 0.16666667,
            0.33333333, 0.        , 0.        , 0.33333333, 0.33333333,
            0.33333333, 0.5       , 0.66666667, 0.16666667, 0.16666667,
            0.16666667, 0.33333333, 0.5       , 0.16666667, 0.5       ,
            0.5       , 0.5       , 0.16666667, 0.5       , 0.33333333],
           [0.33333333, 0.5       , 0.4       , 0.2       , 0.2       ,
            0.5       , 1.        , 0.4       , 0.        , 0.16666667,
            0.2       , 0.16666667, 0.        , 0.2       , 0.6       ,
            0.2       , 0.33333333, 0.66666667, 0.        , 0.16666667,
            0.4       , 0.2       , 0.2       , 0.4       , 0.4       ,
            0.4       , 0.33333333, 0.        , 0.5       , 0.4       ,
            0.33333333, 0.        , 0.2       , 0.16666667, 0.33333333,
            0.2       , 0.16666667, 0.66666667, 0.        , 0.16666667,
            0.2       , 0.16666667, 0.16666667, 0.        , 0.33333333,
            0.2       , 0.66666667, 0.2       , 0.4       , 0.33333333],
           [0.16666667, 0.5       , 0.4       , 0.6       , 0.2       ,
            0.5       , 0.4       , 1.        , 0.33333333, 0.33333333,
            0.2       , 0.5       , 0.        , 0.2       , 0.4       ,
            0.4       , 0.16666667, 0.33333333, 0.16666667, 0.16666667,
            0.4       , 0.2       , 0.        , 0.8       , 0.2       ,
            0.4       , 0.16666667, 0.2       , 0.66666667, 0.4       ,
            0.16666667, 0.        , 0.        , 0.33333333, 0.16666667,
            0.2       , 0.16666667, 0.33333333, 0.16666667, 0.        ,
            0.4       , 0.16666667, 0.33333333, 0.        , 0.33333333,
            0.4       , 0.16666667, 0.4       , 0.4       , 0.33333333],
           [0.5       , 0.5       , 0.2       , 0.2       , 0.        ,
            0.16666667, 0.        , 0.33333333, 1.        , 0.4       ,
            0.        , 0.4       , 0.        , 0.        , 0.        ,
            0.2       , 0.2       , 0.16666667, 0.25      , 0.2       ,
            0.2       , 0.        , 0.        , 0.33333333, 0.        ,
            0.        , 0.2       , 0.5       , 0.5       , 0.2       ,
            0.2       , 0.        , 0.        , 0.6       , 0.2       ,
            0.        , 0.2       , 0.16666667, 0.75      , 0.25      ,
            0.2       , 0.5       , 0.2       , 0.        , 0.2       ,
            0.        , 0.2       , 0.4       , 0.        , 0.4       ],
           [0.4       , 0.5       , 0.16666667, 0.6       , 0.2       ,
            0.33333333, 0.16666667, 0.33333333, 0.4       , 1.        ,
            0.16666667, 0.6       , 0.2       , 0.6       , 0.33333333,
            0.6       , 0.33333333, 0.33333333, 0.2       , 0.6       ,
            0.16666667, 0.2       , 0.        , 0.33333333, 0.        ,
            0.16666667, 0.6       , 0.        , 0.5       , 0.6       ,
            0.33333333, 0.        , 0.2       , 0.6       , 0.6       ,
            0.6       , 0.6       , 0.33333333, 0.4       , 0.4       ,
            0.6       , 0.4       , 0.33333333, 0.        , 0.16666667,
            0.2       , 0.16666667, 0.4       , 0.33333333, 0.6       ],
           [0.        , 0.16666667, 0.25      , 0.        , 0.2       ,
            0.16666667, 0.2       , 0.2       , 0.        , 0.16666667,
            1.        , 0.        , 0.        , 0.4       , 0.4       ,
            0.2       , 0.2       , 0.16666667, 0.        , 0.16666667,
            0.5       , 0.        , 0.5       , 0.2       , 0.25      ,
            0.2       , 0.16666667, 0.25      , 0.16666667, 0.        ,
            0.6       , 0.25      , 0.        , 0.        , 0.        ,
            0.2       , 0.        , 0.16666667, 0.        , 0.        ,
            0.4       , 0.        , 0.4       , 0.25      , 0.4       ,
            0.        , 0.2       , 0.        , 0.2       , 0.16666667],
           [0.4       , 0.5       , 0.16666667, 0.6       , 0.4       ,
            0.5       , 0.16666667, 0.5       , 0.4       , 0.6       ,
            0.        , 1.        , 0.        , 0.2       , 0.16666667,
            0.6       , 0.16666667, 0.33333333, 0.6       , 0.4       ,
            0.16666667, 0.2       , 0.        , 0.33333333, 0.        ,
            0.33333333, 0.6       , 0.        , 0.5       , 0.4       ,
            0.16666667, 0.2       , 0.        , 0.8       , 0.4       ,
            0.2       , 0.4       , 0.33333333, 0.6       , 0.2       ,
            0.4       , 0.4       , 0.33333333, 0.        , 0.33333333,
            0.6       , 0.16666667, 0.6       , 0.16666667, 0.4       ],
           [0.        , 0.        , 0.25      , 0.25      , 0.        ,
            0.16666667, 0.        , 0.        , 0.        , 0.2       ,
            0.        , 0.        , 1.        , 0.25      , 0.2       ,
            0.        , 0.2       , 0.16666667, 0.25      , 0.2       ,
            0.        , 0.33333333, 0.        , 0.        , 0.25      ,
            0.2       , 0.        , 0.        , 0.        , 0.25      ,
            0.        , 0.        , 0.33333333, 0.        , 0.2       ,
            0.5       , 0.4       , 0.        , 0.        , 0.25      ,
            0.        , 0.25      , 0.2       , 0.33333333, 0.        ,
            0.25      , 0.        , 0.        , 0.6       , 0.        ],
           [0.        , 0.16666667, 0.        , 0.5       , 0.5       ,
            0.16666667, 0.2       , 0.2       , 0.        , 0.6       ,
            0.4       , 0.2       , 0.25      , 1.        , 0.6       ,
            0.5       , 0.16666667, 0.16666667, 0.        , 0.6       ,
            0.        , 0.25      , 0.25      , 0.2       , 0.        ,
            0.2       , 0.4       , 0.25      , 0.16666667, 0.5       ,
            0.16666667, 0.25      , 0.25      , 0.2       , 0.4       ,
            0.75      , 0.4       , 0.16666667, 0.        , 0.2       ,
            0.5       , 0.        , 0.33333333, 0.        , 0.        ,
            0.25      , 0.        , 0.25      , 0.4       , 0.4       ],
           [0.16666667, 0.33333333, 0.2       , 0.4       , 0.4       ,
            0.33333333, 0.6       , 0.4       , 0.        , 0.33333333,
            0.4       , 0.16666667, 0.2       , 0.6       , 1.        ,
            0.2       , 0.33333333, 0.5       , 0.        , 0.5       ,
            0.4       , 0.2       , 0.4       , 0.4       , 0.2       ,
            0.4       , 0.16666667, 0.2       , 0.5       , 0.6       ,
            0.16666667, 0.2       , 0.2       , 0.16666667, 0.33333333,
            0.4       , 0.33333333, 0.33333333, 0.        , 0.16666667,
            0.2       , 0.        , 0.5       , 0.        , 0.16666667,
            0.2       , 0.33333333, 0.2       , 0.6       , 0.16666667],
           [0.2       , 0.33333333, 0.2       , 0.5       , 0.5       ,
            0.16666667, 0.2       , 0.4       , 0.2       , 0.6       ,
            0.2       , 0.6       , 0.        , 0.5       , 0.2       ,
            1.        , 0.        , 0.16666667, 0.2       , 0.2       ,
            0.2       , 0.        , 0.        , 0.4       , 0.        ,
            0.4       , 0.6       , 0.        , 0.33333333, 0.5       ,
            0.16666667, 0.25      , 0.        , 0.6       , 0.2       ,
            0.5       , 0.2       , 0.16666667, 0.4       , 0.        ,
            0.75      , 0.2       , 0.        , 0.        , 0.        ,
            0.5       , 0.        , 0.75      , 0.2       , 0.4       ],
           [0.2       , 0.33333333, 0.2       , 0.16666667, 0.16666667,
            0.33333333, 0.33333333, 0.16666667, 0.2       , 0.33333333,
            0.2       , 0.16666667, 0.2       , 0.16666667, 0.33333333,
            0.        , 1.        , 0.33333333, 0.2       , 0.5       ,
            0.2       , 0.4       , 0.        , 0.33333333, 0.4       ,
            0.33333333, 0.33333333, 0.        , 0.33333333, 0.16666667,
            0.6       , 0.2       , 0.6       , 0.16666667, 0.66666667,
            0.16666667, 0.5       , 0.66666667, 0.2       , 0.8       ,
            0.        , 0.2       , 0.6       , 0.2       , 0.6       ,
            0.        , 0.6       , 0.        , 0.33333333, 0.33333333],
           [0.5       , 0.66666667, 0.33333333, 0.16666667, 0.16666667,
            0.83333333, 0.66666667, 0.33333333, 0.16666667, 0.33333333,
            0.16666667, 0.33333333, 0.16666667, 0.16666667, 0.5       ,
            0.16666667, 0.33333333, 1.        , 0.33333333, 0.33333333,
            0.33333333, 0.        , 0.16666667, 0.33333333, 0.5       ,
            0.5       , 0.33333333, 0.        , 0.66666667, 0.33333333,
            0.33333333, 0.        , 0.        , 0.33333333, 0.33333333,
            0.33333333, 0.5       , 0.66666667, 0.16666667, 0.16666667,
            0.16666667, 0.33333333, 0.33333333, 0.16666667, 0.33333333,
            0.33333333, 0.66666667, 0.16666667, 0.5       , 0.33333333],
           [0.25      , 0.16666667, 0.        , 0.2       , 0.2       ,
            0.5       , 0.        , 0.16666667, 0.25      , 0.2       ,
            0.        , 0.6       , 0.25      , 0.        , 0.        ,
            0.2       , 0.2       , 0.33333333, 1.        , 0.2       ,
            0.        , 0.25      , 0.        , 0.        , 0.2       ,
            0.33333333, 0.4       , 0.        , 0.16666667, 0.        ,
            0.2       , 0.25      , 0.        , 0.4       , 0.2       ,
            0.2       , 0.4       , 0.16666667, 0.5       , 0.25      ,
            0.        , 0.25      , 0.4       , 0.25      , 0.4       ,
            0.6       , 0.2       , 0.2       , 0.16666667, 0.2       ],
           [0.2       , 0.33333333, 0.        , 0.4       , 0.6       ,
            0.33333333, 0.16666667, 0.16666667, 0.2       , 0.6       ,
            0.16666667, 0.4       , 0.2       , 0.6       , 0.5       ,
            0.2       , 0.5       , 0.33333333, 0.2       , 1.        ,
            0.        , 0.2       , 0.2       , 0.33333333, 0.16666667,
            0.33333333, 0.4       , 0.2       , 0.33333333, 0.4       ,
            0.16666667, 0.4       , 0.4       , 0.4       , 0.8       ,
            0.4       , 0.8       , 0.5       , 0.2       , 0.6       ,
            0.2       , 0.2       , 0.5       , 0.2       , 0.16666667,
            0.2       , 0.16666667, 0.2       , 0.33333333, 0.4       ],
           [0.4       , 0.33333333, 0.5       , 0.2       , 0.        ,
            0.16666667, 0.4       , 0.4       , 0.2       , 0.16666667,
            0.5       , 0.16666667, 0.        , 0.        , 0.4       ,
            0.2       , 0.2       , 0.33333333, 0.        , 0.        ,
            1.        , 0.        , 0.5       , 0.4       , 0.25      ,
            0.2       , 0.        , 0.        , 0.5       , 0.4       ,
            0.4       , 0.        , 0.        , 0.16666667, 0.        ,
            0.        , 0.        , 0.16666667, 0.2       , 0.        ,
            0.4       , 0.2       , 0.2       , 0.25      , 0.4       ,
            0.        , 0.4       , 0.2       , 0.2       , 0.        ],
           [0.        , 0.        , 0.        , 0.5       , 0.        ,
            0.16666667, 0.2       , 0.2       , 0.        , 0.2       ,
            0.        , 0.2       , 0.33333333, 0.25      , 0.2       ,
            0.        , 0.4       , 0.        , 0.25      , 0.2       ,
            0.        , 1.        , 0.        , 0.        , 0.        ,
            0.        , 0.2       , 0.        , 0.        , 0.25      ,
            0.2       , 0.        , 0.66666667, 0.        , 0.4       ,
            0.25      , 0.2       , 0.16666667, 0.        , 0.5       ,
            0.        , 0.        , 0.4       , 0.        , 0.4       ,
            0.25      , 0.2       , 0.        , 0.2       , 0.2       ],
           [0.25      , 0.        , 0.        , 0.        , 0.25      ,
            0.        , 0.2       , 0.        , 0.        , 0.        ,
            0.5       , 0.        , 0.        , 0.25      , 0.4       ,
            0.        , 0.        , 0.16666667, 0.        , 0.2       ,
            0.5       , 0.        , 1.        , 0.        , 0.        ,
            0.        , 0.        , 0.33333333, 0.16666667, 0.25      ,
            0.2       , 0.33333333, 0.        , 0.        , 0.        ,
            0.        , 0.        , 0.        , 0.        , 0.        ,
            0.25      , 0.        , 0.2       , 0.33333333, 0.2       ,
            0.        , 0.2       , 0.        , 0.        , 0.        ],
           [0.16666667, 0.5       , 0.4       , 0.4       , 0.4       ,
            0.33333333, 0.4       , 0.8       , 0.33333333, 0.33333333,
            0.2       , 0.33333333, 0.        , 0.2       , 0.4       ,
            0.4       , 0.33333333, 0.33333333, 0.        , 0.33333333,
            0.4       , 0.        , 0.        , 1.        , 0.4       ,
            0.6       , 0.16666667, 0.2       , 0.66666667, 0.4       ,
            0.16666667, 0.2       , 0.2       , 0.33333333, 0.33333333,
            0.2       , 0.33333333, 0.5       , 0.16666667, 0.16666667,
            0.4       , 0.16666667, 0.16666667, 0.2       , 0.16666667,
            0.2       , 0.16666667, 0.4       , 0.4       , 0.33333333],
           [0.2       , 0.33333333, 0.5       , 0.        , 0.2       ,
            0.5       , 0.4       , 0.2       , 0.        , 0.        ,
            0.25      , 0.        , 0.25      , 0.        , 0.2       ,
            0.        , 0.4       , 0.5       , 0.2       , 0.16666667,
            0.25      , 0.        , 0.        , 0.4       , 1.        ,
            0.6       , 0.        , 0.        , 0.16666667, 0.        ,
            0.2       , 0.25      , 0.25      , 0.        , 0.16666667,
            0.2       , 0.33333333, 0.5       , 0.        , 0.2       ,
            0.        , 0.2       , 0.2       , 0.5       , 0.2       ,
            0.2       , 0.4       , 0.        , 0.4       , 0.        ],
           [0.        , 0.33333333, 0.2       , 0.2       , 0.6       ,
            0.5       , 0.4       , 0.4       , 0.        , 0.16666667,
            0.2       , 0.33333333, 0.2       , 0.2       , 0.4       ,
            0.4       , 0.33333333, 0.5       , 0.33333333, 0.33333333,
            0.2       , 0.        , 0.        , 0.6       , 0.6       ,
            1.        , 0.33333333, 0.        , 0.33333333, 0.2       ,
            0.16666667, 0.4       , 0.2       , 0.33333333, 0.33333333,
            0.4       , 0.5       , 0.5       , 0.16666667, 0.16666667,
            0.2       , 0.        , 0.16666667, 0.4       , 0.16666667,
            0.6       , 0.16666667, 0.4       , 0.6       , 0.16666667],
           [0.2       , 0.33333333, 0.        , 0.2       , 0.4       ,
            0.33333333, 0.33333333, 0.16666667, 0.2       , 0.6       ,
            0.16666667, 0.6       , 0.        , 0.4       , 0.16666667,
            0.6       , 0.33333333, 0.33333333, 0.4       , 0.4       ,
            0.        , 0.2       , 0.        , 0.16666667, 0.        ,
            0.33333333, 1.        , 0.        , 0.33333333, 0.2       ,
            0.5       , 0.2       , 0.2       , 0.6       , 0.6       ,
            0.4       , 0.4       , 0.5       , 0.4       , 0.4       ,
            0.4       , 0.2       , 0.16666667, 0.        , 0.33333333,
            0.4       , 0.33333333, 0.4       , 0.16666667, 0.8       ],
           [0.        , 0.16666667, 0.        , 0.        , 0.25      ,
            0.        , 0.        , 0.2       , 0.5       , 0.        ,
            0.25      , 0.        , 0.        , 0.25      , 0.2       ,
            0.        , 0.        , 0.        , 0.        , 0.2       ,
            0.        , 0.        , 0.33333333, 0.2       , 0.        ,
            0.        , 0.        , 1.        , 0.16666667, 0.        ,
            0.        , 0.33333333, 0.        , 0.2       , 0.        ,
            0.        , 0.        , 0.        , 0.25      , 0.        ,
            0.        , 0.        , 0.2       , 0.        , 0.        ,
            0.        , 0.        , 0.25      , 0.        , 0.2       ],
           [0.5       , 0.66666667, 0.33333333, 0.33333333, 0.16666667,
            0.5       , 0.5       , 0.66666667, 0.5       , 0.5       ,
            0.16666667, 0.5       , 0.        , 0.16666667, 0.5       ,
            0.33333333, 0.33333333, 0.66666667, 0.16666667, 0.33333333,
            0.5       , 0.        , 0.16666667, 0.66666667, 0.16666667,
            0.33333333, 0.33333333, 0.16666667, 1.        , 0.5       ,
            0.33333333, 0.        , 0.        , 0.5       , 0.33333333,
            0.16666667, 0.33333333, 0.5       , 0.33333333, 0.16666667,
            0.33333333, 0.33333333, 0.33333333, 0.        , 0.33333333,
            0.16666667, 0.5       , 0.33333333, 0.33333333, 0.5       ],
           [0.4       , 0.33333333, 0.2       , 0.75      , 0.25      ,
            0.16666667, 0.4       , 0.4       , 0.2       , 0.6       ,
            0.        , 0.4       , 0.25      , 0.5       , 0.6       ,
            0.5       , 0.16666667, 0.33333333, 0.        , 0.4       ,
            0.4       , 0.25      , 0.25      , 0.4       , 0.        ,
            0.2       , 0.2       , 0.        , 0.5       , 1.        ,
            0.        , 0.        , 0.25      , 0.4       , 0.4       ,
            0.5       , 0.4       , 0.16666667, 0.2       , 0.2       ,
            0.5       , 0.2       , 0.16666667, 0.        , 0.        ,
            0.25      , 0.16666667, 0.5       , 0.4       , 0.2       ],
           [0.2       , 0.33333333, 0.2       , 0.        , 0.        ,
            0.33333333, 0.33333333, 0.16666667, 0.2       , 0.33333333,
            0.6       , 0.16666667, 0.        , 0.16666667, 0.16666667,
            0.16666667, 0.6       , 0.33333333, 0.2       , 0.16666667,
            0.4       , 0.2       , 0.2       , 0.16666667, 0.2       ,
            0.16666667, 0.5       , 0.        , 0.33333333, 0.        ,
            1.        , 0.        , 0.2       , 0.16666667, 0.33333333,
            0.16666667, 0.16666667, 0.5       , 0.2       , 0.4       ,
            0.33333333, 0.2       , 0.4       , 0.2       , 0.8       ,
            0.        , 0.6       , 0.        , 0.16666667, 0.5       ],
           [0.        , 0.        , 0.        , 0.        , 0.75      ,
            0.        , 0.        , 0.        , 0.        , 0.        ,
            0.25      , 0.2       , 0.        , 0.25      , 0.2       ,
            0.25      , 0.2       , 0.        , 0.25      , 0.4       ,
            0.        , 0.        , 0.33333333, 0.2       , 0.25      ,
            0.4       , 0.2       , 0.33333333, 0.        , 0.        ,
            0.        , 1.        , 0.33333333, 0.2       , 0.2       ,
            0.        , 0.2       , 0.16666667, 0.25      , 0.25      ,
            0.        , 0.        , 0.2       , 0.33333333, 0.        ,
            0.25      , 0.        , 0.25      , 0.        , 0.        ],
           [0.        , 0.        , 0.        , 0.25      , 0.25      ,
            0.        , 0.2       , 0.        , 0.        , 0.2       ,
            0.        , 0.        , 0.33333333, 0.25      , 0.2       ,
            0.        , 0.6       , 0.        , 0.        , 0.4       ,
            0.        , 0.66666667, 0.        , 0.2       , 0.25      ,
            0.2       , 0.2       , 0.        , 0.        , 0.25      ,
            0.2       , 0.33333333, 1.        , 0.        , 0.6       ,
            0.25      , 0.4       , 0.33333333, 0.        , 0.75      ,
            0.        , 0.        , 0.2       , 0.33333333, 0.2       ,
            0.        , 0.2       , 0.        , 0.2       , 0.2       ],
           [0.4       , 0.66666667, 0.16666667, 0.4       , 0.4       ,
            0.33333333, 0.16666667, 0.33333333, 0.6       , 0.6       ,
            0.        , 0.8       , 0.        , 0.2       , 0.16666667,
            0.6       , 0.16666667, 0.33333333, 0.4       , 0.4       ,
            0.16666667, 0.        , 0.        , 0.33333333, 0.        ,
            0.33333333, 0.6       , 0.2       , 0.5       , 0.4       ,
            0.16666667, 0.2       , 0.        , 1.        , 0.4       ,
            0.2       , 0.4       , 0.33333333, 0.8       , 0.2       ,
            0.4       , 0.4       , 0.16666667, 0.        , 0.16666667,
            0.4       , 0.16666667, 0.8       , 0.16666667, 0.4       ],
           [0.2       , 0.33333333, 0.        , 0.4       , 0.4       ,
            0.33333333, 0.33333333, 0.16666667, 0.2       , 0.6       ,
            0.        , 0.4       , 0.2       , 0.4       , 0.33333333,
            0.2       , 0.66666667, 0.33333333, 0.2       , 0.8       ,
            0.        , 0.4       , 0.        , 0.33333333, 0.16666667,
            0.33333333, 0.6       , 0.        , 0.33333333, 0.4       ,
            0.33333333, 0.2       , 0.6       , 0.4       , 1.        ,
            0.4       , 0.8       , 0.66666667, 0.2       , 0.8       ,
            0.2       , 0.2       , 0.33333333, 0.2       , 0.33333333,
            0.2       , 0.33333333, 0.2       , 0.33333333, 0.6       ],
           [0.        , 0.16666667, 0.        , 0.5       , 0.25      ,
            0.33333333, 0.2       , 0.2       , 0.        , 0.6       ,
            0.2       , 0.2       , 0.5       , 0.75      , 0.4       ,
            0.5       , 0.16666667, 0.33333333, 0.2       , 0.4       ,
            0.        , 0.25      , 0.        , 0.2       , 0.2       ,
            0.4       , 0.4       , 0.        , 0.16666667, 0.5       ,
            0.16666667, 0.        , 0.25      , 0.2       , 0.4       ,
            1.        , 0.6       , 0.16666667, 0.        , 0.2       ,
            0.5       , 0.        , 0.16666667, 0.25      , 0.        ,
            0.5       , 0.        , 0.25      , 0.6       , 0.4       ],
           [0.2       , 0.33333333, 0.        , 0.4       , 0.4       ,
            0.5       , 0.16666667, 0.16666667, 0.2       , 0.6       ,
            0.        , 0.4       , 0.4       , 0.4       , 0.33333333,
            0.2       , 0.5       , 0.5       , 0.4       , 0.8       ,
            0.        , 0.2       , 0.        , 0.33333333, 0.33333333,
            0.5       , 0.4       , 0.        , 0.33333333, 0.4       ,
            0.16666667, 0.2       , 0.4       , 0.4       , 0.8       ,
            0.6       , 1.        , 0.5       , 0.2       , 0.6       ,
            0.2       , 0.2       , 0.33333333, 0.4       , 0.16666667,
            0.4       , 0.16666667, 0.2       , 0.5       , 0.4       ],
           [0.33333333, 0.66666667, 0.33333333, 0.16666667, 0.33333333,
            0.66666667, 0.66666667, 0.33333333, 0.16666667, 0.33333333,
            0.16666667, 0.33333333, 0.        , 0.16666667, 0.33333333,
            0.16666667, 0.66666667, 0.66666667, 0.16666667, 0.5       ,
            0.16666667, 0.16666667, 0.        , 0.5       , 0.5       ,
            0.5       , 0.5       , 0.        , 0.5       , 0.16666667,
            0.5       , 0.16666667, 0.33333333, 0.33333333, 0.66666667,
            0.16666667, 0.5       , 1.        , 0.16666667, 0.5       ,
            0.16666667, 0.33333333, 0.33333333, 0.16666667, 0.5       ,
            0.16666667, 0.66666667, 0.16666667, 0.33333333, 0.5       ],
           [0.5       , 0.5       , 0.2       , 0.2       , 0.2       ,
            0.16666667, 0.        , 0.16666667, 0.75      , 0.4       ,
            0.        , 0.6       , 0.        , 0.        , 0.        ,
            0.4       , 0.2       , 0.16666667, 0.5       , 0.2       ,
            0.2       , 0.        , 0.        , 0.16666667, 0.        ,
            0.16666667, 0.4       , 0.25      , 0.33333333, 0.2       ,
            0.2       , 0.25      , 0.        , 0.8       , 0.2       ,
            0.        , 0.2       , 0.16666667, 1.        , 0.25      ,
            0.2       , 0.5       , 0.2       , 0.        , 0.2       ,
            0.2       , 0.2       , 0.6       , 0.        , 0.2       ],
           [0.25      , 0.16666667, 0.        , 0.2       , 0.2       ,
            0.16666667, 0.16666667, 0.        , 0.25      , 0.4       ,
            0.        , 0.2       , 0.25      , 0.2       , 0.16666667,
            0.        , 0.8       , 0.16666667, 0.25      , 0.6       ,
            0.        , 0.5       , 0.        , 0.16666667, 0.2       ,
            0.16666667, 0.4       , 0.        , 0.16666667, 0.2       ,
            0.4       , 0.25      , 0.75      , 0.2       , 0.8       ,
            0.2       , 0.6       , 0.5       , 0.25      , 1.        ,
            0.        , 0.25      , 0.4       , 0.25      , 0.4       ,
            0.        , 0.4       , 0.        , 0.16666667, 0.4       ],
           [0.2       , 0.33333333, 0.2       , 0.5       , 0.25      ,
            0.16666667, 0.2       , 0.4       , 0.2       , 0.6       ,
            0.4       , 0.4       , 0.        , 0.5       , 0.2       ,
            0.75      , 0.        , 0.16666667, 0.        , 0.2       ,
            0.4       , 0.        , 0.25      , 0.4       , 0.        ,
            0.2       , 0.4       , 0.        , 0.33333333, 0.5       ,
            0.33333333, 0.        , 0.        , 0.4       , 0.2       ,
            0.5       , 0.2       , 0.16666667, 0.2       , 0.        ,
            1.        , 0.2       , 0.        , 0.25      , 0.16666667,
            0.25      , 0.        , 0.5       , 0.2       , 0.4       ],
           [0.75      , 0.5       , 0.6       , 0.2       , 0.        ,
            0.33333333, 0.16666667, 0.16666667, 0.5       , 0.4       ,
            0.        , 0.4       , 0.25      , 0.        , 0.        ,
            0.2       , 0.2       , 0.33333333, 0.25      , 0.2       ,
            0.2       , 0.        , 0.        , 0.16666667, 0.2       ,
            0.        , 0.2       , 0.        , 0.33333333, 0.2       ,
            0.2       , 0.        , 0.        , 0.4       , 0.2       ,
            0.        , 0.2       , 0.33333333, 0.5       , 0.25      ,
            0.2       , 1.        , 0.2       , 0.        , 0.2       ,
            0.        , 0.4       , 0.2       , 0.16666667, 0.2       ],
           [0.2       , 0.33333333, 0.2       , 0.33333333, 0.16666667,
            0.5       , 0.16666667, 0.33333333, 0.2       , 0.33333333,
            0.4       , 0.33333333, 0.2       , 0.33333333, 0.5       ,
            0.        , 0.6       , 0.33333333, 0.4       , 0.5       ,
            0.2       , 0.4       , 0.2       , 0.16666667, 0.2       ,
            0.16666667, 0.16666667, 0.2       , 0.33333333, 0.16666667,
            0.4       , 0.2       , 0.2       , 0.16666667, 0.33333333,
            0.16666667, 0.33333333, 0.33333333, 0.2       , 0.4       ,
            0.        , 0.2       , 1.        , 0.        , 0.6       ,
            0.16666667, 0.4       , 0.        , 0.33333333, 0.16666667],
           [0.        , 0.        , 0.        , 0.        , 0.25      ,
            0.16666667, 0.        , 0.        , 0.        , 0.        ,
            0.25      , 0.        , 0.33333333, 0.        , 0.        ,
            0.        , 0.2       , 0.16666667, 0.25      , 0.2       ,
            0.25      , 0.        , 0.33333333, 0.2       , 0.5       ,
            0.4       , 0.        , 0.        , 0.        , 0.        ,
            0.2       , 0.33333333, 0.33333333, 0.        , 0.2       ,
            0.25      , 0.4       , 0.16666667, 0.        , 0.25      ,
            0.25      , 0.        , 0.        , 1.        , 0.2       ,
            0.25      , 0.        , 0.        , 0.2       , 0.        ],
           [0.2       , 0.33333333, 0.2       , 0.16666667, 0.        ,
            0.5       , 0.33333333, 0.33333333, 0.2       , 0.16666667,
            0.4       , 0.33333333, 0.        , 0.        , 0.16666667,
            0.        , 0.6       , 0.33333333, 0.4       , 0.16666667,
            0.4       , 0.4       , 0.2       , 0.16666667, 0.2       ,
            0.16666667, 0.33333333, 0.        , 0.33333333, 0.        ,
            0.8       , 0.        , 0.2       , 0.16666667, 0.33333333,
            0.        , 0.16666667, 0.5       , 0.2       , 0.4       ,
            0.16666667, 0.2       , 0.6       , 0.2       , 1.        ,
            0.16666667, 0.6       , 0.        , 0.16666667, 0.33333333],
           [0.        , 0.16666667, 0.        , 0.5       , 0.5       ,
            0.5       , 0.2       , 0.4       , 0.        , 0.2       ,
            0.        , 0.6       , 0.25      , 0.25      , 0.2       ,
            0.5       , 0.        , 0.33333333, 0.6       , 0.2       ,
            0.        , 0.25      , 0.        , 0.2       , 0.2       ,
            0.6       , 0.4       , 0.        , 0.16666667, 0.25      ,
            0.        , 0.25      , 0.        , 0.4       , 0.2       ,
            0.5       , 0.4       , 0.16666667, 0.2       , 0.        ,
            0.25      , 0.        , 0.16666667, 0.25      , 0.16666667,
            1.        , 0.        , 0.5       , 0.4       , 0.2       ],
           [0.6       , 0.5       , 0.4       , 0.        , 0.        ,
            0.5       , 0.66666667, 0.16666667, 0.2       , 0.16666667,
            0.2       , 0.16666667, 0.        , 0.        , 0.33333333,
            0.        , 0.6       , 0.66666667, 0.2       , 0.16666667,
            0.4       , 0.2       , 0.2       , 0.16666667, 0.4       ,
            0.16666667, 0.33333333, 0.        , 0.5       , 0.16666667,
            0.6       , 0.        , 0.2       , 0.16666667, 0.33333333,
            0.        , 0.16666667, 0.66666667, 0.2       , 0.4       ,
            0.        , 0.4       , 0.4       , 0.        , 0.6       ,
            0.        , 1.        , 0.        , 0.16666667, 0.33333333],
           [0.2       , 0.5       , 0.2       , 0.5       , 0.5       ,
            0.16666667, 0.2       , 0.4       , 0.4       , 0.4       ,
            0.        , 0.6       , 0.        , 0.25      , 0.2       ,
            0.75      , 0.        , 0.16666667, 0.2       , 0.2       ,
            0.2       , 0.        , 0.        , 0.4       , 0.        ,
            0.4       , 0.4       , 0.25      , 0.33333333, 0.5       ,
            0.        , 0.25      , 0.        , 0.8       , 0.2       ,
            0.25      , 0.2       , 0.16666667, 0.6       , 0.        ,
            0.5       , 0.2       , 0.        , 0.        , 0.        ,
            0.5       , 0.        , 1.        , 0.2       , 0.2       ],
           [0.        , 0.33333333, 0.4       , 0.4       , 0.2       ,
            0.5       , 0.4       , 0.4       , 0.        , 0.33333333,
            0.2       , 0.16666667, 0.6       , 0.4       , 0.6       ,
            0.2       , 0.33333333, 0.5       , 0.16666667, 0.33333333,
            0.2       , 0.2       , 0.        , 0.4       , 0.4       ,
            0.6       , 0.16666667, 0.        , 0.33333333, 0.4       ,
            0.16666667, 0.        , 0.2       , 0.16666667, 0.33333333,
            0.6       , 0.5       , 0.33333333, 0.        , 0.16666667,
            0.2       , 0.16666667, 0.33333333, 0.2       , 0.16666667,
            0.4       , 0.16666667, 0.2       , 1.        , 0.16666667],
           [0.2       , 0.33333333, 0.        , 0.2       , 0.2       ,
            0.33333333, 0.33333333, 0.33333333, 0.4       , 0.6       ,
            0.16666667, 0.4       , 0.        , 0.4       , 0.16666667,
            0.4       , 0.33333333, 0.33333333, 0.2       , 0.4       ,
            0.        , 0.2       , 0.        , 0.33333333, 0.        ,
            0.16666667, 0.8       , 0.2       , 0.5       , 0.2       ,
            0.5       , 0.        , 0.2       , 0.4       , 0.6       ,
            0.4       , 0.4       , 0.5       , 0.2       , 0.4       ,
            0.4       , 0.2       , 0.16666667, 0.        , 0.33333333,
            0.2       , 0.33333333, 0.2       , 0.16666667, 1.        ]])





----



 ### Gower-Binary-Multiclass Distance in `Python`  <a class="anchor" id="95.4"></a>


```python
def Dist_GowerBM_Py(i, j, BM_Data ,  p2, p3):

    Dist_Gower = np.sqrt( 1 - GowerBM_Similarity_Python(i, j, BM_Data , p2, p3) )

    return(Dist_Gower)
```


```python
Dist_GowerBM_Py(1, 2, BM_Data_Py,  3, 3)
```




    0.7071067811865476





---



 ### Gower-Binary-Multiclass Distance Matrix in `Python`  <a class="anchor" id="95.5"></a>


```python
def Dist_GowerBM_Matrix_Python(BM_Data,  p2, p3):

    M = np.zeros((BM_Data.shape[0] , BM_Data.shape[0]))

    for i in range(0 , BM_Data.shape[0]):
        for j in range(0 , BM_Data.shape[0]):

            M[i,j] = Dist_GowerBM_Py(i+1,j+1, BM_Data, p2, p3)
                 
    return M
```


```python
Dist_GowerBM_Matrix_Python(BM_Data_Py,  3, 3)
```




    array([[0.        , 0.70710678, 0.77459667, 0.89442719, 1.        ,
            0.81649658, 0.81649658, 0.91287093, 0.70710678, 0.77459667,
            1.        , 0.77459667, 1.        , 1.        , 0.91287093,
            0.89442719, 0.89442719, 0.70710678, 0.8660254 , 0.89442719,
            0.77459667, 1.        , 0.8660254 , 0.91287093, 0.89442719,
            1.        , 0.89442719, 1.        , 0.70710678, 0.77459667,
            0.89442719, 1.        , 1.        , 0.77459667, 0.89442719,
            1.        , 0.89442719, 0.81649658, 0.70710678, 0.8660254 ,
            0.89442719, 0.5       , 0.89442719, 1.        , 0.89442719,
            1.        , 0.63245553, 0.89442719, 1.        , 0.89442719],
           [0.70710678, 0.        , 0.70710678, 0.81649658, 0.91287093,
            0.57735027, 0.70710678, 0.70710678, 0.70710678, 0.70710678,
            0.91287093, 0.70710678, 1.        , 0.91287093, 0.81649658,
            0.81649658, 0.81649658, 0.57735027, 0.91287093, 0.81649658,
            0.81649658, 1.        , 1.        , 0.70710678, 0.81649658,
            0.81649658, 0.81649658, 0.91287093, 0.57735027, 0.81649658,
            0.81649658, 1.        , 1.        , 0.57735027, 0.81649658,
            0.91287093, 0.81649658, 0.57735027, 0.70710678, 0.91287093,
            0.81649658, 0.70710678, 0.81649658, 1.        , 0.81649658,
            0.91287093, 0.70710678, 0.70710678, 0.81649658, 0.81649658],
           [0.77459667, 0.70710678, 0.        , 0.89442719, 1.        ,
            0.81649658, 0.77459667, 0.77459667, 0.89442719, 0.91287093,
            0.8660254 , 0.91287093, 0.8660254 , 1.        , 0.89442719,
            0.89442719, 0.89442719, 0.81649658, 1.        , 1.        ,
            0.70710678, 1.        , 1.        , 0.77459667, 0.70710678,
            0.89442719, 1.        , 1.        , 0.81649658, 0.89442719,
            0.89442719, 1.        , 1.        , 0.91287093, 1.        ,
            1.        , 1.        , 0.81649658, 0.89442719, 1.        ,
            0.89442719, 0.63245553, 0.89442719, 1.        , 0.89442719,
            1.        , 0.77459667, 0.89442719, 0.77459667, 1.        ],
           [0.89442719, 0.81649658, 0.89442719, 0.        , 0.8660254 ,
            0.81649658, 0.89442719, 0.63245553, 0.89442719, 0.63245553,
            1.        , 0.63245553, 0.8660254 , 0.70710678, 0.77459667,
            0.70710678, 0.91287093, 0.91287093, 0.89442719, 0.77459667,
            0.89442719, 0.70710678, 1.        , 0.77459667, 1.        ,
            0.89442719, 0.89442719, 1.        , 0.81649658, 0.5       ,
            1.        , 1.        , 0.8660254 , 0.77459667, 0.77459667,
            0.70710678, 0.77459667, 0.91287093, 0.89442719, 0.89442719,
            0.70710678, 0.89442719, 0.81649658, 1.        , 0.91287093,
            0.70710678, 1.        , 0.70710678, 0.77459667, 0.89442719],
           [1.        , 0.91287093, 1.        , 0.8660254 , 0.        ,
            0.91287093, 0.89442719, 0.89442719, 1.        , 0.89442719,
            0.89442719, 0.77459667, 1.        , 0.70710678, 0.77459667,
            0.70710678, 0.91287093, 0.91287093, 0.89442719, 0.63245553,
            1.        , 1.        , 0.8660254 , 0.77459667, 0.89442719,
            0.63245553, 0.77459667, 0.8660254 , 0.91287093, 0.8660254 ,
            1.        , 0.5       , 0.8660254 , 0.77459667, 0.77459667,
            0.8660254 , 0.77459667, 0.81649658, 0.89442719, 0.89442719,
            0.8660254 , 1.        , 0.91287093, 0.8660254 , 1.        ,
            0.70710678, 1.        , 0.70710678, 0.89442719, 0.89442719],
           [0.81649658, 0.57735027, 0.81649658, 0.81649658, 0.91287093,
            0.        , 0.70710678, 0.70710678, 0.91287093, 0.81649658,
            0.91287093, 0.70710678, 0.91287093, 0.91287093, 0.81649658,
            0.91287093, 0.81649658, 0.40824829, 0.70710678, 0.81649658,
            0.91287093, 0.91287093, 1.        , 0.81649658, 0.70710678,
            0.70710678, 0.81649658, 1.        , 0.70710678, 0.91287093,
            0.81649658, 1.        , 1.        , 0.81649658, 0.81649658,
            0.81649658, 0.70710678, 0.57735027, 0.91287093, 0.91287093,
            0.91287093, 0.81649658, 0.70710678, 0.91287093, 0.70710678,
            0.70710678, 0.70710678, 0.91287093, 0.70710678, 0.81649658],
           [0.81649658, 0.70710678, 0.77459667, 0.89442719, 0.89442719,
            0.70710678, 0.        , 0.77459667, 1.        , 0.91287093,
            0.89442719, 0.91287093, 1.        , 0.89442719, 0.63245553,
            0.89442719, 0.81649658, 0.57735027, 1.        , 0.91287093,
            0.77459667, 0.89442719, 0.89442719, 0.77459667, 0.77459667,
            0.77459667, 0.81649658, 1.        , 0.70710678, 0.77459667,
            0.81649658, 1.        , 0.89442719, 0.91287093, 0.81649658,
            0.89442719, 0.91287093, 0.57735027, 1.        , 0.91287093,
            0.89442719, 0.91287093, 0.91287093, 1.        , 0.81649658,
            0.89442719, 0.57735027, 0.89442719, 0.77459667, 0.81649658],
           [0.91287093, 0.70710678, 0.77459667, 0.63245553, 0.89442719,
            0.70710678, 0.77459667, 0.        , 0.81649658, 0.81649658,
            0.89442719, 0.70710678, 1.        , 0.89442719, 0.77459667,
            0.77459667, 0.91287093, 0.81649658, 0.91287093, 0.91287093,
            0.77459667, 0.89442719, 1.        , 0.4472136 , 0.89442719,
            0.77459667, 0.91287093, 0.89442719, 0.57735027, 0.77459667,
            0.91287093, 1.        , 1.        , 0.81649658, 0.91287093,
            0.89442719, 0.91287093, 0.81649658, 0.91287093, 1.        ,
            0.77459667, 0.91287093, 0.81649658, 1.        , 0.81649658,
            0.77459667, 0.91287093, 0.77459667, 0.77459667, 0.81649658],
           [0.70710678, 0.70710678, 0.89442719, 0.89442719, 1.        ,
            0.91287093, 1.        , 0.81649658, 0.        , 0.77459667,
            1.        , 0.77459667, 1.        , 1.        , 1.        ,
            0.89442719, 0.89442719, 0.91287093, 0.8660254 , 0.89442719,
            0.89442719, 1.        , 1.        , 0.81649658, 1.        ,
            1.        , 0.89442719, 0.70710678, 0.70710678, 0.89442719,
            0.89442719, 1.        , 1.        , 0.63245553, 0.89442719,
            1.        , 0.89442719, 0.91287093, 0.5       , 0.8660254 ,
            0.89442719, 0.70710678, 0.89442719, 1.        , 0.89442719,
            1.        , 0.89442719, 0.77459667, 1.        , 0.77459667],
           [0.77459667, 0.70710678, 0.91287093, 0.63245553, 0.89442719,
            0.81649658, 0.91287093, 0.81649658, 0.77459667, 0.        ,
            0.91287093, 0.63245553, 0.89442719, 0.63245553, 0.81649658,
            0.63245553, 0.81649658, 0.81649658, 0.89442719, 0.63245553,
            0.91287093, 0.89442719, 1.        , 0.81649658, 1.        ,
            0.91287093, 0.63245553, 1.        , 0.70710678, 0.63245553,
            0.81649658, 1.        , 0.89442719, 0.63245553, 0.63245553,
            0.63245553, 0.63245553, 0.81649658, 0.77459667, 0.77459667,
            0.63245553, 0.77459667, 0.81649658, 1.        , 0.91287093,
            0.89442719, 0.91287093, 0.77459667, 0.81649658, 0.63245553],
           [1.        , 0.91287093, 0.8660254 , 1.        , 0.89442719,
            0.91287093, 0.89442719, 0.89442719, 1.        , 0.91287093,
            0.        , 1.        , 1.        , 0.77459667, 0.77459667,
            0.89442719, 0.89442719, 0.91287093, 1.        , 0.91287093,
            0.70710678, 1.        , 0.70710678, 0.89442719, 0.8660254 ,
            0.89442719, 0.91287093, 0.8660254 , 0.91287093, 1.        ,
            0.63245553, 0.8660254 , 1.        , 1.        , 1.        ,
            0.89442719, 1.        , 0.91287093, 1.        , 1.        ,
            0.77459667, 1.        , 0.77459667, 0.8660254 , 0.77459667,
            1.        , 0.89442719, 1.        , 0.89442719, 0.91287093],
           [0.77459667, 0.70710678, 0.91287093, 0.63245553, 0.77459667,
            0.70710678, 0.91287093, 0.70710678, 0.77459667, 0.63245553,
            1.        , 0.        , 1.        , 0.89442719, 0.91287093,
            0.63245553, 0.91287093, 0.81649658, 0.63245553, 0.77459667,
            0.91287093, 0.89442719, 1.        , 0.81649658, 1.        ,
            0.81649658, 0.63245553, 1.        , 0.70710678, 0.77459667,
            0.91287093, 0.89442719, 1.        , 0.4472136 , 0.77459667,
            0.89442719, 0.77459667, 0.81649658, 0.63245553, 0.89442719,
            0.77459667, 0.77459667, 0.81649658, 1.        , 0.81649658,
            0.63245553, 0.91287093, 0.63245553, 0.91287093, 0.77459667],
           [1.        , 1.        , 0.8660254 , 0.8660254 , 1.        ,
            0.91287093, 1.        , 1.        , 1.        , 0.89442719,
            1.        , 1.        , 0.        , 0.8660254 , 0.89442719,
            1.        , 0.89442719, 0.91287093, 0.8660254 , 0.89442719,
            1.        , 0.81649658, 1.        , 1.        , 0.8660254 ,
            0.89442719, 1.        , 1.        , 1.        , 0.8660254 ,
            1.        , 1.        , 0.81649658, 1.        , 0.89442719,
            0.70710678, 0.77459667, 1.        , 1.        , 0.8660254 ,
            1.        , 0.8660254 , 0.89442719, 0.81649658, 1.        ,
            0.8660254 , 1.        , 1.        , 0.63245553, 1.        ],
           [1.        , 0.91287093, 1.        , 0.70710678, 0.70710678,
            0.91287093, 0.89442719, 0.89442719, 1.        , 0.63245553,
            0.77459667, 0.89442719, 0.8660254 , 0.        , 0.63245553,
            0.70710678, 0.91287093, 0.91287093, 1.        , 0.63245553,
            1.        , 0.8660254 , 0.8660254 , 0.89442719, 1.        ,
            0.89442719, 0.77459667, 0.8660254 , 0.91287093, 0.70710678,
            0.91287093, 0.8660254 , 0.8660254 , 0.89442719, 0.77459667,
            0.5       , 0.77459667, 0.91287093, 1.        , 0.89442719,
            0.70710678, 1.        , 0.81649658, 1.        , 1.        ,
            0.8660254 , 1.        , 0.8660254 , 0.77459667, 0.77459667],
           [0.91287093, 0.81649658, 0.89442719, 0.77459667, 0.77459667,
            0.81649658, 0.63245553, 0.77459667, 1.        , 0.81649658,
            0.77459667, 0.91287093, 0.89442719, 0.63245553, 0.        ,
            0.89442719, 0.81649658, 0.70710678, 1.        , 0.70710678,
            0.77459667, 0.89442719, 0.77459667, 0.77459667, 0.89442719,
            0.77459667, 0.91287093, 0.89442719, 0.70710678, 0.63245553,
            0.91287093, 0.89442719, 0.89442719, 0.91287093, 0.81649658,
            0.77459667, 0.81649658, 0.81649658, 1.        , 0.91287093,
            0.89442719, 1.        , 0.70710678, 1.        , 0.91287093,
            0.89442719, 0.81649658, 0.89442719, 0.63245553, 0.91287093],
           [0.89442719, 0.81649658, 0.89442719, 0.70710678, 0.70710678,
            0.91287093, 0.89442719, 0.77459667, 0.89442719, 0.63245553,
            0.89442719, 0.63245553, 1.        , 0.70710678, 0.89442719,
            0.        , 1.        , 0.91287093, 0.89442719, 0.89442719,
            0.89442719, 1.        , 1.        , 0.77459667, 1.        ,
            0.77459667, 0.63245553, 1.        , 0.81649658, 0.70710678,
            0.91287093, 0.8660254 , 1.        , 0.63245553, 0.89442719,
            0.70710678, 0.89442719, 0.91287093, 0.77459667, 1.        ,
            0.5       , 0.89442719, 1.        , 1.        , 1.        ,
            0.70710678, 1.        , 0.5       , 0.89442719, 0.77459667],
           [0.89442719, 0.81649658, 0.89442719, 0.91287093, 0.91287093,
            0.81649658, 0.81649658, 0.91287093, 0.89442719, 0.81649658,
            0.89442719, 0.91287093, 0.89442719, 0.91287093, 0.81649658,
            1.        , 0.        , 0.81649658, 0.89442719, 0.70710678,
            0.89442719, 0.77459667, 1.        , 0.81649658, 0.77459667,
            0.81649658, 0.81649658, 1.        , 0.81649658, 0.91287093,
            0.63245553, 0.89442719, 0.63245553, 0.91287093, 0.57735027,
            0.91287093, 0.70710678, 0.57735027, 0.89442719, 0.4472136 ,
            1.        , 0.89442719, 0.63245553, 0.89442719, 0.63245553,
            1.        , 0.63245553, 1.        , 0.81649658, 0.81649658],
           [0.70710678, 0.57735027, 0.81649658, 0.91287093, 0.91287093,
            0.40824829, 0.57735027, 0.81649658, 0.91287093, 0.81649658,
            0.91287093, 0.81649658, 0.91287093, 0.91287093, 0.70710678,
            0.91287093, 0.81649658, 0.        , 0.81649658, 0.81649658,
            0.81649658, 1.        , 0.91287093, 0.81649658, 0.70710678,
            0.70710678, 0.81649658, 1.        , 0.57735027, 0.81649658,
            0.81649658, 1.        , 1.        , 0.81649658, 0.81649658,
            0.81649658, 0.70710678, 0.57735027, 0.91287093, 0.91287093,
            0.91287093, 0.81649658, 0.81649658, 0.91287093, 0.81649658,
            0.81649658, 0.57735027, 0.91287093, 0.70710678, 0.81649658],
           [0.8660254 , 0.91287093, 1.        , 0.89442719, 0.89442719,
            0.70710678, 1.        , 0.91287093, 0.8660254 , 0.89442719,
            1.        , 0.63245553, 0.8660254 , 1.        , 1.        ,
            0.89442719, 0.89442719, 0.81649658, 0.        , 0.89442719,
            1.        , 0.8660254 , 1.        , 1.        , 0.89442719,
            0.81649658, 0.77459667, 1.        , 0.91287093, 1.        ,
            0.89442719, 0.8660254 , 1.        , 0.77459667, 0.89442719,
            0.89442719, 0.77459667, 0.91287093, 0.70710678, 0.8660254 ,
            1.        , 0.8660254 , 0.77459667, 0.8660254 , 0.77459667,
            0.63245553, 0.89442719, 0.89442719, 0.91287093, 0.89442719],
           [0.89442719, 0.81649658, 1.        , 0.77459667, 0.63245553,
            0.81649658, 0.91287093, 0.91287093, 0.89442719, 0.63245553,
            0.91287093, 0.77459667, 0.89442719, 0.63245553, 0.70710678,
            0.89442719, 0.70710678, 0.81649658, 0.89442719, 0.        ,
            1.        , 0.89442719, 0.89442719, 0.81649658, 0.91287093,
            0.81649658, 0.77459667, 0.89442719, 0.81649658, 0.77459667,
            0.91287093, 0.77459667, 0.77459667, 0.77459667, 0.4472136 ,
            0.77459667, 0.4472136 , 0.70710678, 0.89442719, 0.63245553,
            0.89442719, 0.89442719, 0.70710678, 0.89442719, 0.91287093,
            0.89442719, 0.91287093, 0.89442719, 0.81649658, 0.77459667],
           [0.77459667, 0.81649658, 0.70710678, 0.89442719, 1.        ,
            0.91287093, 0.77459667, 0.77459667, 0.89442719, 0.91287093,
            0.70710678, 0.91287093, 1.        , 1.        , 0.77459667,
            0.89442719, 0.89442719, 0.81649658, 1.        , 1.        ,
            0.        , 1.        , 0.70710678, 0.77459667, 0.8660254 ,
            0.89442719, 1.        , 1.        , 0.70710678, 0.77459667,
            0.77459667, 1.        , 1.        , 0.91287093, 1.        ,
            1.        , 1.        , 0.91287093, 0.89442719, 1.        ,
            0.77459667, 0.89442719, 0.89442719, 0.8660254 , 0.77459667,
            1.        , 0.77459667, 0.89442719, 0.89442719, 1.        ],
           [1.        , 1.        , 1.        , 0.70710678, 1.        ,
            0.91287093, 0.89442719, 0.89442719, 1.        , 0.89442719,
            1.        , 0.89442719, 0.81649658, 0.8660254 , 0.89442719,
            1.        , 0.77459667, 1.        , 0.8660254 , 0.89442719,
            1.        , 0.        , 1.        , 1.        , 1.        ,
            1.        , 0.89442719, 1.        , 1.        , 0.8660254 ,
            0.89442719, 1.        , 0.57735027, 1.        , 0.77459667,
            0.8660254 , 0.89442719, 0.91287093, 1.        , 0.70710678,
            1.        , 1.        , 0.77459667, 1.        , 0.77459667,
            0.8660254 , 0.89442719, 1.        , 0.89442719, 0.89442719],
           [0.8660254 , 1.        , 1.        , 1.        , 0.8660254 ,
            1.        , 0.89442719, 1.        , 1.        , 1.        ,
            0.70710678, 1.        , 1.        , 0.8660254 , 0.77459667,
            1.        , 1.        , 0.91287093, 1.        , 0.89442719,
            0.70710678, 1.        , 0.        , 1.        , 1.        ,
            1.        , 1.        , 0.81649658, 0.91287093, 0.8660254 ,
            0.89442719, 0.81649658, 1.        , 1.        , 1.        ,
            1.        , 1.        , 1.        , 1.        , 1.        ,
            0.8660254 , 1.        , 0.89442719, 0.81649658, 0.89442719,
            1.        , 0.89442719, 1.        , 1.        , 1.        ],
           [0.91287093, 0.70710678, 0.77459667, 0.77459667, 0.77459667,
            0.81649658, 0.77459667, 0.4472136 , 0.81649658, 0.81649658,
            0.89442719, 0.81649658, 1.        , 0.89442719, 0.77459667,
            0.77459667, 0.81649658, 0.81649658, 1.        , 0.81649658,
            0.77459667, 1.        , 1.        , 0.        , 0.77459667,
            0.63245553, 0.91287093, 0.89442719, 0.57735027, 0.77459667,
            0.91287093, 0.89442719, 0.89442719, 0.81649658, 0.81649658,
            0.89442719, 0.81649658, 0.70710678, 0.91287093, 0.91287093,
            0.77459667, 0.91287093, 0.91287093, 0.89442719, 0.91287093,
            0.89442719, 0.91287093, 0.77459667, 0.77459667, 0.81649658],
           [0.89442719, 0.81649658, 0.70710678, 1.        , 0.89442719,
            0.70710678, 0.77459667, 0.89442719, 1.        , 1.        ,
            0.8660254 , 1.        , 0.8660254 , 1.        , 0.89442719,
            1.        , 0.77459667, 0.70710678, 0.89442719, 0.91287093,
            0.8660254 , 1.        , 1.        , 0.77459667, 0.        ,
            0.63245553, 1.        , 1.        , 0.91287093, 1.        ,
            0.89442719, 0.8660254 , 0.8660254 , 1.        , 0.91287093,
            0.89442719, 0.81649658, 0.70710678, 1.        , 0.89442719,
            1.        , 0.89442719, 0.89442719, 0.70710678, 0.89442719,
            0.89442719, 0.77459667, 1.        , 0.77459667, 1.        ],
           [1.        , 0.81649658, 0.89442719, 0.89442719, 0.63245553,
            0.70710678, 0.77459667, 0.77459667, 1.        , 0.91287093,
            0.89442719, 0.81649658, 0.89442719, 0.89442719, 0.77459667,
            0.77459667, 0.81649658, 0.70710678, 0.81649658, 0.81649658,
            0.89442719, 1.        , 1.        , 0.63245553, 0.63245553,
            0.        , 0.81649658, 1.        , 0.81649658, 0.89442719,
            0.91287093, 0.77459667, 0.89442719, 0.81649658, 0.81649658,
            0.77459667, 0.70710678, 0.70710678, 0.91287093, 0.91287093,
            0.89442719, 1.        , 0.91287093, 0.77459667, 0.91287093,
            0.63245553, 0.91287093, 0.77459667, 0.63245553, 0.91287093],
           [0.89442719, 0.81649658, 1.        , 0.89442719, 0.77459667,
            0.81649658, 0.81649658, 0.91287093, 0.89442719, 0.63245553,
            0.91287093, 0.63245553, 1.        , 0.77459667, 0.91287093,
            0.63245553, 0.81649658, 0.81649658, 0.77459667, 0.77459667,
            1.        , 0.89442719, 1.        , 0.91287093, 1.        ,
            0.81649658, 0.        , 1.        , 0.81649658, 0.89442719,
            0.70710678, 0.89442719, 0.89442719, 0.63245553, 0.63245553,
            0.77459667, 0.77459667, 0.70710678, 0.77459667, 0.77459667,
            0.77459667, 0.89442719, 0.91287093, 1.        , 0.81649658,
            0.77459667, 0.81649658, 0.77459667, 0.91287093, 0.4472136 ],
           [1.        , 0.91287093, 1.        , 1.        , 0.8660254 ,
            1.        , 1.        , 0.89442719, 0.70710678, 1.        ,
            0.8660254 , 1.        , 1.        , 0.8660254 , 0.89442719,
            1.        , 1.        , 1.        , 1.        , 0.89442719,
            1.        , 1.        , 0.81649658, 0.89442719, 1.        ,
            1.        , 1.        , 0.        , 0.91287093, 1.        ,
            1.        , 0.81649658, 1.        , 0.89442719, 1.        ,
            1.        , 1.        , 1.        , 0.8660254 , 1.        ,
            1.        , 1.        , 0.89442719, 1.        , 1.        ,
            1.        , 1.        , 0.8660254 , 1.        , 0.89442719],
           [0.70710678, 0.57735027, 0.81649658, 0.81649658, 0.91287093,
            0.70710678, 0.70710678, 0.57735027, 0.70710678, 0.70710678,
            0.91287093, 0.70710678, 1.        , 0.91287093, 0.70710678,
            0.81649658, 0.81649658, 0.57735027, 0.91287093, 0.81649658,
            0.70710678, 1.        , 0.91287093, 0.57735027, 0.91287093,
            0.81649658, 0.81649658, 0.91287093, 0.        , 0.70710678,
            0.81649658, 1.        , 1.        , 0.70710678, 0.81649658,
            0.91287093, 0.81649658, 0.70710678, 0.81649658, 0.91287093,
            0.81649658, 0.81649658, 0.81649658, 1.        , 0.81649658,
            0.91287093, 0.70710678, 0.81649658, 0.81649658, 0.70710678],
           [0.77459667, 0.81649658, 0.89442719, 0.5       , 0.8660254 ,
            0.91287093, 0.77459667, 0.77459667, 0.89442719, 0.63245553,
            1.        , 0.77459667, 0.8660254 , 0.70710678, 0.63245553,
            0.70710678, 0.91287093, 0.81649658, 1.        , 0.77459667,
            0.77459667, 0.8660254 , 0.8660254 , 0.77459667, 1.        ,
            0.89442719, 0.89442719, 1.        , 0.70710678, 0.        ,
            1.        , 1.        , 0.8660254 , 0.77459667, 0.77459667,
            0.70710678, 0.77459667, 0.91287093, 0.89442719, 0.89442719,
            0.70710678, 0.89442719, 0.91287093, 1.        , 1.        ,
            0.8660254 , 0.91287093, 0.70710678, 0.77459667, 0.89442719],
           [0.89442719, 0.81649658, 0.89442719, 1.        , 1.        ,
            0.81649658, 0.81649658, 0.91287093, 0.89442719, 0.81649658,
            0.63245553, 0.91287093, 1.        , 0.91287093, 0.91287093,
            0.91287093, 0.63245553, 0.81649658, 0.89442719, 0.91287093,
            0.77459667, 0.89442719, 0.89442719, 0.91287093, 0.89442719,
            0.91287093, 0.70710678, 1.        , 0.81649658, 1.        ,
            0.        , 1.        , 0.89442719, 0.91287093, 0.81649658,
            0.91287093, 0.91287093, 0.70710678, 0.89442719, 0.77459667,
            0.81649658, 0.89442719, 0.77459667, 0.89442719, 0.4472136 ,
            1.        , 0.63245553, 1.        , 0.91287093, 0.70710678],
           [1.        , 1.        , 1.        , 1.        , 0.5       ,
            1.        , 1.        , 1.        , 1.        , 1.        ,
            0.8660254 , 0.89442719, 1.        , 0.8660254 , 0.89442719,
            0.8660254 , 0.89442719, 1.        , 0.8660254 , 0.77459667,
            1.        , 1.        , 0.81649658, 0.89442719, 0.8660254 ,
            0.77459667, 0.89442719, 0.81649658, 1.        , 1.        ,
            1.        , 0.        , 0.81649658, 0.89442719, 0.89442719,
            1.        , 0.89442719, 0.91287093, 0.8660254 , 0.8660254 ,
            1.        , 1.        , 0.89442719, 0.81649658, 1.        ,
            0.8660254 , 1.        , 0.8660254 , 1.        , 1.        ],
           [1.        , 1.        , 1.        , 0.8660254 , 0.8660254 ,
            1.        , 0.89442719, 1.        , 1.        , 0.89442719,
            1.        , 1.        , 0.81649658, 0.8660254 , 0.89442719,
            1.        , 0.63245553, 1.        , 1.        , 0.77459667,
            1.        , 0.57735027, 1.        , 0.89442719, 0.8660254 ,
            0.89442719, 0.89442719, 1.        , 1.        , 0.8660254 ,
            0.89442719, 0.81649658, 0.        , 1.        , 0.63245553,
            0.8660254 , 0.77459667, 0.81649658, 1.        , 0.5       ,
            1.        , 1.        , 0.89442719, 0.81649658, 0.89442719,
            1.        , 0.89442719, 1.        , 0.89442719, 0.89442719],
           [0.77459667, 0.57735027, 0.91287093, 0.77459667, 0.77459667,
            0.81649658, 0.91287093, 0.81649658, 0.63245553, 0.63245553,
            1.        , 0.4472136 , 1.        , 0.89442719, 0.91287093,
            0.63245553, 0.91287093, 0.81649658, 0.77459667, 0.77459667,
            0.91287093, 1.        , 1.        , 0.81649658, 1.        ,
            0.81649658, 0.63245553, 0.89442719, 0.70710678, 0.77459667,
            0.91287093, 0.89442719, 1.        , 0.        , 0.77459667,
            0.89442719, 0.77459667, 0.81649658, 0.4472136 , 0.89442719,
            0.77459667, 0.77459667, 0.91287093, 1.        , 0.91287093,
            0.77459667, 0.91287093, 0.4472136 , 0.91287093, 0.77459667],
           [0.89442719, 0.81649658, 1.        , 0.77459667, 0.77459667,
            0.81649658, 0.81649658, 0.91287093, 0.89442719, 0.63245553,
            1.        , 0.77459667, 0.89442719, 0.77459667, 0.81649658,
            0.89442719, 0.57735027, 0.81649658, 0.89442719, 0.4472136 ,
            1.        , 0.77459667, 1.        , 0.81649658, 0.91287093,
            0.81649658, 0.63245553, 1.        , 0.81649658, 0.77459667,
            0.81649658, 0.89442719, 0.63245553, 0.77459667, 0.        ,
            0.77459667, 0.4472136 , 0.57735027, 0.89442719, 0.4472136 ,
            0.89442719, 0.89442719, 0.81649658, 0.89442719, 0.81649658,
            0.89442719, 0.81649658, 0.89442719, 0.81649658, 0.63245553],
           [1.        , 0.91287093, 1.        , 0.70710678, 0.8660254 ,
            0.81649658, 0.89442719, 0.89442719, 1.        , 0.63245553,
            0.89442719, 0.89442719, 0.70710678, 0.5       , 0.77459667,
            0.70710678, 0.91287093, 0.81649658, 0.89442719, 0.77459667,
            1.        , 0.8660254 , 1.        , 0.89442719, 0.89442719,
            0.77459667, 0.77459667, 1.        , 0.91287093, 0.70710678,
            0.91287093, 1.        , 0.8660254 , 0.89442719, 0.77459667,
            0.        , 0.63245553, 0.91287093, 1.        , 0.89442719,
            0.70710678, 1.        , 0.91287093, 0.8660254 , 1.        ,
            0.70710678, 1.        , 0.8660254 , 0.63245553, 0.77459667],
           [0.89442719, 0.81649658, 1.        , 0.77459667, 0.77459667,
            0.70710678, 0.91287093, 0.91287093, 0.89442719, 0.63245553,
            1.        , 0.77459667, 0.77459667, 0.77459667, 0.81649658,
            0.89442719, 0.70710678, 0.70710678, 0.77459667, 0.4472136 ,
            1.        , 0.89442719, 1.        , 0.81649658, 0.81649658,
            0.70710678, 0.77459667, 1.        , 0.81649658, 0.77459667,
            0.91287093, 0.89442719, 0.77459667, 0.77459667, 0.4472136 ,
            0.63245553, 0.        , 0.70710678, 0.89442719, 0.63245553,
            0.89442719, 0.89442719, 0.81649658, 0.77459667, 0.91287093,
            0.77459667, 0.91287093, 0.89442719, 0.70710678, 0.77459667],
           [0.81649658, 0.57735027, 0.81649658, 0.91287093, 0.81649658,
            0.57735027, 0.57735027, 0.81649658, 0.91287093, 0.81649658,
            0.91287093, 0.81649658, 1.        , 0.91287093, 0.81649658,
            0.91287093, 0.57735027, 0.57735027, 0.91287093, 0.70710678,
            0.91287093, 0.91287093, 1.        , 0.70710678, 0.70710678,
            0.70710678, 0.70710678, 1.        , 0.70710678, 0.91287093,
            0.70710678, 0.91287093, 0.81649658, 0.81649658, 0.57735027,
            0.91287093, 0.70710678, 0.        , 0.91287093, 0.70710678,
            0.91287093, 0.81649658, 0.81649658, 0.91287093, 0.70710678,
            0.91287093, 0.57735027, 0.91287093, 0.81649658, 0.70710678],
           [0.70710678, 0.70710678, 0.89442719, 0.89442719, 0.89442719,
            0.91287093, 1.        , 0.91287093, 0.5       , 0.77459667,
            1.        , 0.63245553, 1.        , 1.        , 1.        ,
            0.77459667, 0.89442719, 0.91287093, 0.70710678, 0.89442719,
            0.89442719, 1.        , 1.        , 0.91287093, 1.        ,
            0.91287093, 0.77459667, 0.8660254 , 0.81649658, 0.89442719,
            0.89442719, 0.8660254 , 1.        , 0.4472136 , 0.89442719,
            1.        , 0.89442719, 0.91287093, 0.        , 0.8660254 ,
            0.89442719, 0.70710678, 0.89442719, 1.        , 0.89442719,
            0.89442719, 0.89442719, 0.63245553, 1.        , 0.89442719],
           [0.8660254 , 0.91287093, 1.        , 0.89442719, 0.89442719,
            0.91287093, 0.91287093, 1.        , 0.8660254 , 0.77459667,
            1.        , 0.89442719, 0.8660254 , 0.89442719, 0.91287093,
            1.        , 0.4472136 , 0.91287093, 0.8660254 , 0.63245553,
            1.        , 0.70710678, 1.        , 0.91287093, 0.89442719,
            0.91287093, 0.77459667, 1.        , 0.91287093, 0.89442719,
            0.77459667, 0.8660254 , 0.5       , 0.89442719, 0.4472136 ,
            0.89442719, 0.63245553, 0.70710678, 0.8660254 , 0.        ,
            1.        , 0.8660254 , 0.77459667, 0.8660254 , 0.77459667,
            1.        , 0.77459667, 1.        , 0.91287093, 0.77459667],
           [0.89442719, 0.81649658, 0.89442719, 0.70710678, 0.8660254 ,
            0.91287093, 0.89442719, 0.77459667, 0.89442719, 0.63245553,
            0.77459667, 0.77459667, 1.        , 0.70710678, 0.89442719,
            0.5       , 1.        , 0.91287093, 1.        , 0.89442719,
            0.77459667, 1.        , 0.8660254 , 0.77459667, 1.        ,
            0.89442719, 0.77459667, 1.        , 0.81649658, 0.70710678,
            0.81649658, 1.        , 1.        , 0.77459667, 0.89442719,
            0.70710678, 0.89442719, 0.91287093, 0.89442719, 1.        ,
            0.        , 0.89442719, 1.        , 0.8660254 , 0.91287093,
            0.8660254 , 1.        , 0.70710678, 0.89442719, 0.77459667],
           [0.5       , 0.70710678, 0.63245553, 0.89442719, 1.        ,
            0.81649658, 0.91287093, 0.91287093, 0.70710678, 0.77459667,
            1.        , 0.77459667, 0.8660254 , 1.        , 1.        ,
            0.89442719, 0.89442719, 0.81649658, 0.8660254 , 0.89442719,
            0.89442719, 1.        , 1.        , 0.91287093, 0.89442719,
            1.        , 0.89442719, 1.        , 0.81649658, 0.89442719,
            0.89442719, 1.        , 1.        , 0.77459667, 0.89442719,
            1.        , 0.89442719, 0.81649658, 0.70710678, 0.8660254 ,
            0.89442719, 0.        , 0.89442719, 1.        , 0.89442719,
            1.        , 0.77459667, 0.89442719, 0.91287093, 0.89442719],
           [0.89442719, 0.81649658, 0.89442719, 0.81649658, 0.91287093,
            0.70710678, 0.91287093, 0.81649658, 0.89442719, 0.81649658,
            0.77459667, 0.81649658, 0.89442719, 0.81649658, 0.70710678,
            1.        , 0.63245553, 0.81649658, 0.77459667, 0.70710678,
            0.89442719, 0.77459667, 0.89442719, 0.91287093, 0.89442719,
            0.91287093, 0.91287093, 0.89442719, 0.81649658, 0.91287093,
            0.77459667, 0.89442719, 0.89442719, 0.91287093, 0.81649658,
            0.91287093, 0.81649658, 0.81649658, 0.89442719, 0.77459667,
            1.        , 0.89442719, 0.        , 1.        , 0.63245553,
            0.91287093, 0.77459667, 1.        , 0.81649658, 0.91287093],
           [1.        , 1.        , 1.        , 1.        , 0.8660254 ,
            0.91287093, 1.        , 1.        , 1.        , 1.        ,
            0.8660254 , 1.        , 0.81649658, 1.        , 1.        ,
            1.        , 0.89442719, 0.91287093, 0.8660254 , 0.89442719,
            0.8660254 , 1.        , 0.81649658, 0.89442719, 0.70710678,
            0.77459667, 1.        , 1.        , 1.        , 1.        ,
            0.89442719, 0.81649658, 0.81649658, 1.        , 0.89442719,
            0.8660254 , 0.77459667, 0.91287093, 1.        , 0.8660254 ,
            0.8660254 , 1.        , 1.        , 0.        , 0.89442719,
            0.8660254 , 1.        , 1.        , 0.89442719, 1.        ],
           [0.89442719, 0.81649658, 0.89442719, 0.91287093, 1.        ,
            0.70710678, 0.81649658, 0.81649658, 0.89442719, 0.91287093,
            0.77459667, 0.81649658, 1.        , 1.        , 0.91287093,
            1.        , 0.63245553, 0.81649658, 0.77459667, 0.91287093,
            0.77459667, 0.77459667, 0.89442719, 0.91287093, 0.89442719,
            0.91287093, 0.81649658, 1.        , 0.81649658, 1.        ,
            0.4472136 , 1.        , 0.89442719, 0.91287093, 0.81649658,
            1.        , 0.91287093, 0.70710678, 0.89442719, 0.77459667,
            0.91287093, 0.89442719, 0.63245553, 0.89442719, 0.        ,
            0.91287093, 0.63245553, 1.        , 0.91287093, 0.81649658],
           [1.        , 0.91287093, 1.        , 0.70710678, 0.70710678,
            0.70710678, 0.89442719, 0.77459667, 1.        , 0.89442719,
            1.        , 0.63245553, 0.8660254 , 0.8660254 , 0.89442719,
            0.70710678, 1.        , 0.81649658, 0.63245553, 0.89442719,
            1.        , 0.8660254 , 1.        , 0.89442719, 0.89442719,
            0.63245553, 0.77459667, 1.        , 0.91287093, 0.8660254 ,
            1.        , 0.8660254 , 1.        , 0.77459667, 0.89442719,
            0.70710678, 0.77459667, 0.91287093, 0.89442719, 1.        ,
            0.8660254 , 1.        , 0.91287093, 0.8660254 , 0.91287093,
            0.        , 1.        , 0.70710678, 0.77459667, 0.89442719],
           [0.63245553, 0.70710678, 0.77459667, 1.        , 1.        ,
            0.70710678, 0.57735027, 0.91287093, 0.89442719, 0.91287093,
            0.89442719, 0.91287093, 1.        , 1.        , 0.81649658,
            1.        , 0.63245553, 0.57735027, 0.89442719, 0.91287093,
            0.77459667, 0.89442719, 0.89442719, 0.91287093, 0.77459667,
            0.91287093, 0.81649658, 1.        , 0.70710678, 0.91287093,
            0.63245553, 1.        , 0.89442719, 0.91287093, 0.81649658,
            1.        , 0.91287093, 0.57735027, 0.89442719, 0.77459667,
            1.        , 0.77459667, 0.77459667, 1.        , 0.63245553,
            1.        , 0.        , 1.        , 0.91287093, 0.81649658],
           [0.89442719, 0.70710678, 0.89442719, 0.70710678, 0.70710678,
            0.91287093, 0.89442719, 0.77459667, 0.77459667, 0.77459667,
            1.        , 0.63245553, 1.        , 0.8660254 , 0.89442719,
            0.5       , 1.        , 0.91287093, 0.89442719, 0.89442719,
            0.89442719, 1.        , 1.        , 0.77459667, 1.        ,
            0.77459667, 0.77459667, 0.8660254 , 0.81649658, 0.70710678,
            1.        , 0.8660254 , 1.        , 0.4472136 , 0.89442719,
            0.8660254 , 0.89442719, 0.91287093, 0.63245553, 1.        ,
            0.70710678, 0.89442719, 1.        , 1.        , 1.        ,
            0.70710678, 1.        , 0.        , 0.89442719, 0.89442719],
           [1.        , 0.81649658, 0.77459667, 0.77459667, 0.89442719,
            0.70710678, 0.77459667, 0.77459667, 1.        , 0.81649658,
            0.89442719, 0.91287093, 0.63245553, 0.77459667, 0.63245553,
            0.89442719, 0.81649658, 0.70710678, 0.91287093, 0.81649658,
            0.89442719, 0.89442719, 1.        , 0.77459667, 0.77459667,
            0.63245553, 0.91287093, 1.        , 0.81649658, 0.77459667,
            0.91287093, 1.        , 0.89442719, 0.91287093, 0.81649658,
            0.63245553, 0.70710678, 0.81649658, 1.        , 0.91287093,
            0.89442719, 0.91287093, 0.81649658, 0.89442719, 0.91287093,
            0.77459667, 0.91287093, 0.89442719, 0.        , 0.91287093],
           [0.89442719, 0.81649658, 1.        , 0.89442719, 0.89442719,
            0.81649658, 0.81649658, 0.81649658, 0.77459667, 0.63245553,
            0.91287093, 0.77459667, 1.        , 0.77459667, 0.91287093,
            0.77459667, 0.81649658, 0.81649658, 0.89442719, 0.77459667,
            1.        , 0.89442719, 1.        , 0.81649658, 1.        ,
            0.91287093, 0.4472136 , 0.89442719, 0.70710678, 0.89442719,
            0.70710678, 1.        , 0.89442719, 0.77459667, 0.63245553,
            0.77459667, 0.77459667, 0.70710678, 0.89442719, 0.77459667,
            0.77459667, 0.89442719, 0.91287093, 1.        , 0.81649658,
            0.89442719, 0.81649658, 0.89442719, 0.91287093, 0.        ]])





---



 ### Gower-Binary-Quantitative Similarity Coefficient   <a class="anchor" id="96.1"></a>

The Gower-Binary-Quantitative similarity between the elements $i$ and $j$ with respect to the variables $X_1,...,X_p$ is:



\begin{gather*}
S(i,j)_{GowerBQ}=\dfrac{\sum_{k=1}^{p_1} \left(1- \dfrac{\mid x_{ik} - x_{jk} \mid}{G_k} \right) + a_{ij}   }{p_1 + (p_2 - d_{ij}) }
\end{gather*}



Where:

 
$p_1 \hspace{0.05cm} $ is the number of quantitative variables

$p_2 \hspace{0.05cm}  $ is the number of binary categorical variables

$ p_1 + p_2 = p$ 

$a_{ij} \hspace{0.05cm} $ is the number of binary variables (there are $\hspace{0.05cm} p_2\hspace{0.05cm} $) for which the answer is 1 in both individuals $i$ and $j$

$d_{ij} \hspace{0.05cm} $ is the number of binary variables (there are $\hspace{0.05cm}  p_2 \hspace{0.05cm} $) for which the response is 0 in both individuals $i$ and $j$

 



 ### Gower-Binary-Quantitative Distance   <a class="anchor" id="96.1.1"></a>



\begin{gather*}
\delta(i,j)_{GowerBQ} = \sqrt{1 - S(i,j)_{GowerBQ}}
\end{gather*}





---



 ### Gower-Binary-Quantitative Similarity in `Python`  <a class="anchor" id="96.2"></a>


```python
def a(Binary_Data) :

            X = Binary_Data

            a = X @ X.T

            return(a)

##########################################################################################

def d(Binary_Data):

            X = Binary_Data

            ones_matrix = np.ones(( X.shape[0] , X.shape[1])) 

            d = (ones_matrix - X) @ (ones_matrix - X).T

            return(d)
```


```python
def GowerBQ_Similarity_Python(i,j, BQ_Data_Set, p1, p2):

    X = BQ_Data_Set.to_numpy()

   

   # The data matrix X have to be order in the following way:
   # The p1 first are quantitative, the following p2 are binary categorical 

##########################################################################################
    def G(k, X):

        range = X[:,k].max() - X[:,k].min() 

        return(range)

    G_vector = np.repeat(0.5, p1)

    for r in range(0, p1):

        G_vector[r] = G(r, X)
##########################################################################################
    
    ones = np.repeat(1, p1)

    Quantitative_Data = X[: , 0:p1]

    Binary_Data = X[: , (p1):(p1+p2)]
         
 
##########################################################################################

    numerator_part_1 = ( ones - ( abs(Quantitative_Data[i-1,:] - Quantitative_Data[j-1,:]) / G_vector ) ).sum() 

    numerator_part_2 = a(Binary_Data)[i-1,j-1] 
     
    numerator = numerator_part_1 + numerator_part_2

    denominator = p1 + (p2 - d(Binary_Data)[i-1,j-1])  

    Similarity_Gower = numerator / denominator  

    return(Similarity_Gower)
```


```python
BQ_Data_Py = Mixed_Data_Py.iloc[: , 0:7]

BQ_Data_Py.head()
```




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
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>X1</th>
      <th>X2</th>
      <th>X3</th>
      <th>X4</th>
      <th>X5</th>
      <th>X6</th>
      <th>X7</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>-6.284459</td>
      <td>-9.411280</td>
      <td>19.630820</td>
      <td>13.807247</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>1.0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>24.960182</td>
      <td>-5.581823</td>
      <td>-19.668319</td>
      <td>14.255880</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>14.244677</td>
      <td>36.155683</td>
      <td>20.683970</td>
      <td>-11.178333</td>
      <td>1.0</td>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>3</th>
      <td>-12.594421</td>
      <td>-1.970941</td>
      <td>48.974559</td>
      <td>-18.153030</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>1.320996</td>
      <td>10.445248</td>
      <td>9.630610</td>
      <td>-5.294826</td>
      <td>0.0</td>
      <td>1.0</td>
      <td>0.0</td>
    </tr>
  </tbody>
</table>
</div>




```python
GowerBQ_Similarity_Python(1,2, BQ_Data_Py, 4, 3)
```




    0.5653669852832306





---



 ### Gower-Binary-Quantitative Similarity Matrix in `Python`  <a class="anchor" id="96.3"></a>


```python
def Sim_GowerBQ_Matrix_Python(BQ_Data,  p1, p2):

    M = np.zeros((BQ_Data.shape[0] , BQ_Data.shape[0]))

    for i in range(0 , BQ_Data.shape[0]):
        for j in range(0 , BQ_Data.shape[0]):

            M[i,j] = GowerBQ_Similarity_Python(i+1,j+1, BQ_Data, p1, p2)
                 
    return M
```


```python
Sim_GowerBQ_Matrix_Python(BQ_Data_Py,  4, 3) 
```




    array([[1.        , 0.56536699, 0.44048835, 0.48742259, 0.5286785 ,
            0.53625617, 0.43637643, 0.34800434, 0.71867961, 0.63702922,
            0.58579079, 0.68073022, 0.55806526, 0.62991562, 0.43740635,
            0.50840009, 0.5556589 , 0.51615395, 0.84936917, 0.61104373,
            0.45840831, 0.61175906, 0.61250544, 0.49304007, 0.58802756,
            0.41448716, 0.72523212, 0.68827406, 0.64775356, 0.59931862,
            0.64017731, 0.57775   , 0.52352251, 0.70423691, 0.69654762,
            0.51827792, 0.70428863, 0.58882063, 0.76712146, 0.82807074,
            0.50477616, 0.93946769, 0.72767719, 0.58813392, 0.74393596,
            0.38587954, 0.68694654, 0.56971996, 0.41171455, 0.65443078],
           [0.56536699, 1.        , 0.46504191, 0.42909635, 0.53408791,
            0.84411301, 0.62107153, 0.6942489 , 0.51294239, 0.7091078 ,
            0.60249392, 0.64994195, 0.46854687, 0.56928145, 0.6290877 ,
            0.50589246, 0.73035682, 0.84678205, 0.58022506, 0.779706  ,
            0.56270134, 0.49552637, 0.34666912, 0.75916456, 0.4997674 ,
            0.65204736, 0.7456514 , 0.36891216, 0.86496155, 0.5950062 ,
            0.70805086, 0.39113719, 0.33106129, 0.65630635, 0.72039237,
            0.52288706, 0.74954041, 0.82989487, 0.42786324, 0.59981066,
            0.55059394, 0.5557395 , 0.67369663, 0.40011657, 0.733546  ,
            0.45487755, 0.72447758, 0.56567664, 0.7355425 , 0.71915989],
           [0.44048835, 0.46504191, 1.        , 0.42300201, 0.53016632,
            0.58452309, 0.62299035, 0.68547832, 0.51633251, 0.40622805,
            0.73261669, 0.47540728, 0.5565961 , 0.43274565, 0.71273816,
            0.57242784, 0.52466681, 0.55205722, 0.42881801, 0.39669257,
            0.86327679, 0.51887605, 0.67074951, 0.63802582, 0.6403243 ,
            0.63836297, 0.42603218, 0.60120561, 0.57653413, 0.39569447,
            0.68151567, 0.36397567, 0.5335407 , 0.46831688, 0.45591135,
            0.4851457 , 0.41419542, 0.55539632, 0.5488504 , 0.50184076,
            0.49618421, 0.41215127, 0.67259131, 0.69089547, 0.68674522,
            0.53127136, 0.60310604, 0.46318083, 0.68441597, 0.39110662],
           [0.48742259, 0.42909635, 0.42300201, 1.        , 0.77417886,
            0.42154497, 0.56321114, 0.48804036, 0.2923558 , 0.52510923,
            0.46235728, 0.61592415, 0.40033568, 0.74080585, 0.56395805,
            0.7395998 , 0.21352716, 0.47767829, 0.47725447, 0.50836462,
            0.41027815, 0.46855227, 0.52870605, 0.59869448, 0.48975491,
            0.51035781, 0.59769452, 0.62025471, 0.5641348 , 0.71370958,
            0.29565093, 0.44267637, 0.38844888, 0.60751128, 0.62179713,
            0.80672544, 0.62094219, 0.58738278, 0.43912307, 0.38351507,
            0.64435402, 0.48640136, 0.40308014, 0.45238839, 0.37833593,
            0.67526069, 0.33814534, 0.77786537, 0.54903002, 0.5477763 ],
           [0.5286785 , 0.53408791, 0.53016632, 0.77417886, 1.        ,
            0.57919559, 0.6763602 , 0.67622464, 0.4478754 , 0.69458311,
            0.58034759, 0.71226093, 0.62615682, 0.83736694, 0.67697095,
            0.93904122, 0.37482797, 0.61655365, 0.45597381, 0.6965489 ,
            0.59639648, 0.61554046, 0.71404964, 0.66518162, 0.45003939,
            0.6947011 , 0.69086001, 0.71940897, 0.63813423, 0.83863377,
            0.45695174, 0.52777609, 0.54198214, 0.76272532, 0.72571905,
            0.85100393, 0.74863876, 0.57867272, 0.49591882, 0.57169935,
            0.85250506, 0.53743125, 0.48413719, 0.64713205, 0.47872982,
            0.82864125, 0.41326753, 0.78840396, 0.7372143 , 0.69134229],
           [0.53625617, 0.84411301, 0.58452309, 0.42154497, 0.57919559,
            1.        , 0.72141348, 0.69595879, 0.64038405, 0.72675347,
            0.56798272, 0.75075284, 0.51637606, 0.53836527, 0.74157997,
            0.60754511, 0.72233417, 0.89129859, 0.55667117, 0.71504685,
            0.62205636, 0.47677198, 0.4661503 , 0.74517145, 0.46885122,
            0.74362153, 0.75796122, 0.40707732, 0.85472622, 0.53393198,
            0.76346598, 0.31357875, 0.39444924, 0.75796387, 0.74571885,
            0.49895979, 0.71023444, 0.80596761, 0.54734442, 0.62663861,
            0.61625133, 0.53181223, 0.73084069, 0.51959776, 0.75573963,
            0.55646668, 0.73695612, 0.54174938, 0.79108378, 0.77650999],
           [0.43637643, 0.62107153, 0.62299035, 0.56321114, 0.6763602 ,
            0.72141348, 1.        , 0.78868859, 0.41558006, 0.58832522,
            0.66979059, 0.59053621, 0.46865582, 0.67035432, 0.88060563,
            0.71060459, 0.47919256, 0.62486239, 0.33529891, 0.51903273,
            0.6409119 , 0.42249376, 0.5597714 , 0.76661148, 0.61857065,
            0.88738144, 0.550402  , 0.54129234, 0.69703425, 0.64193931,
            0.59102358, 0.51365605, 0.55128764, 0.63143007, 0.52860956,
            0.56699213, 0.53555653, 0.60217407, 0.41865989, 0.4498323 ,
            0.72079303, 0.45941969, 0.58901949, 0.52835923, 0.57316135,
            0.60189641, 0.47955143, 0.57882579, 0.82243736, 0.51685425],
           [0.34800434, 0.6942489 , 0.68547832, 0.48804036, 0.67622464,
            0.69595879, 0.78868859, 1.        , 0.38680117, 0.65912215,
            0.6535476 , 0.56574513, 0.48292239, 0.57513234, 0.83983386,
            0.70504053, 0.50556567, 0.65219868, 0.29401744, 0.62589956,
            0.66869633, 0.43822025, 0.54745199, 0.71889482, 0.49403262,
            0.83665411, 0.49534847, 0.47116144, 0.68417412, 0.6152676 ,
            0.64677852, 0.39506874, 0.51147395, 0.60151555, 0.52414308,
            0.56178123, 0.57633877, 0.59770759, 0.43728536, 0.42283599,
            0.73456223, 0.3555067 , 0.54047312, 0.51744854, 0.52476971,
            0.63620796, 0.45930742, 0.54404983, 0.83426566, 0.49576185],
           [0.71867961, 0.51294239, 0.51633251, 0.2923558 , 0.4478754 ,
            0.64038405, 0.41558006, 0.38680117, 1.        , 0.62003234,
            0.43479372, 0.67643165, 0.63193534, 0.46643007, 0.48148378,
            0.49867438, 0.67500096, 0.53168264, 0.74000364, 0.60636854,
            0.49787962, 0.57654086, 0.59556445, 0.43136002, 0.36410583,
            0.47845889, 0.69466127, 0.53057225, 0.54091479, 0.39506785,
            0.67761319, 0.46778255, 0.62160393, 0.67727495, 0.67055866,
            0.37523267, 0.60075406, 0.49215618, 0.76754888, 0.82277002,
            0.49817831, 0.67946794, 0.65542897, 0.69031842, 0.68429721,
            0.42135833, 0.63530299, 0.43259427, 0.45292424, 0.66095359],
           [0.63702922, 0.7091078 , 0.40622805, 0.52510923, 0.69458311,
            0.72675347, 0.58832522, 0.65912215, 0.62003234, 1.        ,
            0.46203437, 0.85905317, 0.51884951, 0.62469514, 0.58496677,
            0.71403217, 0.53636034, 0.6596031 , 0.54561413, 0.90497732,
            0.43771556, 0.47414738, 0.57715487, 0.5041331 , 0.33576295,
            0.61669331, 0.78050033, 0.5082303 , 0.69997219, 0.67930136,
            0.6649307 , 0.45942624, 0.52888226, 0.90676267, 0.78680541,
            0.57041972, 0.84770039, 0.60511201, 0.67188134, 0.69590245,
            0.78852069, 0.64578198, 0.5712678 , 0.54476699, 0.55556438,
            0.64484645, 0.48248936, 0.57997695, 0.5910655 , 0.7757171 ],
           [0.58579079, 0.60249392, 0.73261669, 0.46235728, 0.58034759,
            0.56798272, 0.66979059, 0.6535476 , 0.43479372, 0.46203437,
            1.        , 0.44350496, 0.64550694, 0.58565504, 0.66388927,
            0.53808608, 0.62009107, 0.57956281, 0.50657403, 0.4502168 ,
            0.83393288, 0.7032438 , 0.64184528, 0.71578184, 0.80858202,
            0.70325798, 0.46755485, 0.67298554, 0.65664051, 0.61851389,
            0.71590213, 0.62337424, 0.56914675, 0.48238386, 0.45706272,
            0.5198661 , 0.53014101, 0.56178033, 0.46293088, 0.58248537,
            0.56639139, 0.59100242, 0.71841171, 0.61905935, 0.74104708,
            0.45113226, 0.6790173 , 0.53169976, 0.71425221, 0.45194065],
           [0.68073022, 0.64994195, 0.47540728, 0.61592415, 0.71226093,
            0.75075284, 0.59053621, 0.56574513, 0.67643165, 0.85905317,
            0.44350496, 1.        , 0.51288013, 0.67298753, 0.65030329,
            0.76207786, 0.4917573 , 0.68256717, 0.68298436, 0.8395271 ,
            0.4642007 , 0.48144676, 0.5648685 , 0.59115515, 0.41053865,
            0.59357528, 0.88667286, 0.54519527, 0.7705248 , 0.63593634,
            0.61590275, 0.37688827, 0.44945517, 0.94067274, 0.8928305 ,
            0.6396182 , 0.85880486, 0.72592358, 0.74090817, 0.71755748,
            0.70822427, 0.65239314, 0.67252813, 0.59439951, 0.63068166,
            0.66161201, 0.55444388, 0.71734718, 0.61979394, 0.83698554],
           [0.55806526, 0.46854687, 0.5565961 , 0.40033568, 0.62615682,
            0.51637606, 0.46865582, 0.48292239, 0.63193534, 0.51884951,
            0.64550694, 0.51288013, 1.        , 0.561018  , 0.47800802,
            0.61378687, 0.56083672, 0.48385667, 0.58951237, 0.56511592,
            0.69331931, 0.91078971, 0.73859275, 0.54451063, 0.46369833,
            0.50479429, 0.55704361, 0.72510121, 0.43342103, 0.60918031,
            0.56168078, 0.64152208, 0.69315926, 0.52030526, 0.54514926,
            0.50871643, 0.54600421, 0.38466241, 0.50454597, 0.71835217,
            0.66505033, 0.55470985, 0.525403  , 0.83212579, 0.55445175,
            0.54236599, 0.52453342, 0.56862185, 0.61274744, 0.5706796 ],
           [0.62991562, 0.56928145, 0.43274565, 0.74080585, 0.83736694,
            0.53836527, 0.67035432, 0.57513234, 0.46643007, 0.62469514,
            0.58565504, 0.67298753, 0.561018  , 1.        , 0.69823398,
            0.81303285, 0.36273368, 0.51826305, 0.53339828, 0.61350434,
            0.46086893, 0.6147118 , 0.59232063, 0.73413738, 0.56434243,
            0.68443209, 0.7212618 , 0.65641678, 0.64986266, 0.90783469,
            0.40797536, 0.58397646, 0.52974897, 0.7027381 , 0.68880492,
            0.82488624, 0.70674925, 0.58218403, 0.44923291, 0.53555485,
            0.79571287, 0.58967534, 0.47422956, 0.59108666, 0.49347659,
            0.66600819, 0.44806328, 0.87743749, 0.64946093, 0.6568914 ],
           [0.43740635, 0.6290877 , 0.71273816, 0.56395805, 0.67697095,
            0.74157997, 0.88060563, 0.83983386, 0.48148378, 0.58496677,
            0.66388927, 0.65030329, 0.47800802, 0.69823398, 1.        ,
            0.72714457, 0.49395707, 0.63287856, 0.39506599, 0.52704891,
            0.65026411, 0.43184596, 0.5587326 , 0.81717138, 0.63570809,
            0.9038513 , 0.59772202, 0.50990529, 0.72336085, 0.62416341,
            0.62383778, 0.40213472, 0.52410134, 0.63403186, 0.57273753,
            0.58677327, 0.5435727 , 0.66194115, 0.49000724, 0.45784847,
            0.72727387, 0.39598757, 0.64878656, 0.57160413, 0.60459363,
            0.62239211, 0.50475527, 0.64855405, 0.83178956, 0.52487043],
           [0.50840009, 0.50589246, 0.57242784, 0.7395998 , 0.93904122,
            0.60754511, 0.71060459, 0.70504053, 0.49867438, 0.71403217,
            0.53808608, 0.76207786, 0.61378687, 0.81303285, 0.72714457,
            1.        , 0.34770781, 0.58104036, 0.44506222, 0.67713364,
            0.5897862 , 0.57606682, 0.75002968, 0.65427003, 0.42976098,
            0.71415017, 0.67994842, 0.69507487, 0.62878144, 0.78791996,
            0.48165107, 0.47706227, 0.56532102, 0.80415749, 0.71480745,
            0.82766505, 0.71574406, 0.564513  , 0.53735099, 0.54949974,
            0.87584394, 0.5063901 , 0.48508044, 0.70809083, 0.46937702,
            0.85297534, 0.40391473, 0.77531005, 0.73207495, 0.6706167 ],
           [0.5556589 , 0.73035682, 0.52466681, 0.21352716, 0.37482797,
            0.72233417, 0.47919256, 0.50556567, 0.67500096, 0.53636034,
            0.62009107, 0.4917573 , 0.56083672, 0.36273368, 0.49395707,
            0.34770781, 1.        , 0.73584887, 0.57342892, 0.58382325,
            0.63860281, 0.52269509, 0.38656522, 0.53715364, 0.48753172,
            0.56558529, 0.55836042, 0.39890276, 0.64670841, 0.36306113,
            0.80817725, 0.46296949, 0.44663971, 0.4981217 , 0.53770104,
            0.29094198, 0.53843385, 0.5979498 , 0.48129169, 0.68949271,
            0.39240929, 0.54442683, 0.76809731, 0.44892058, 0.8077231 ,
            0.2966929 , 0.81976744, 0.33373157, 0.57735786, 0.59935453],
           [0.51615395, 0.84678205, 0.55205722, 0.47767829, 0.61655365,
            0.89129859, 0.62486239, 0.65219868, 0.53168264, 0.6596031 ,
            0.57956281, 0.68256717, 0.48385667, 0.51826305, 0.63287856,
            0.58104036, 0.73584887, 1.        , 0.541924  , 0.71498677,
            0.6469379 , 0.49411283, 0.41230339, 0.73080575, 0.448749  ,
            0.65583822, 0.737859  , 0.42672419, 0.86840039, 0.538289  ,
            0.6820317 , 0.3162478 , 0.30851911, 0.69888964, 0.76887123,
            0.55509311, 0.75617488, 0.85504044, 0.47019835, 0.60226457,
            0.53032119, 0.52365631, 0.68256656, 0.42864645, 0.73563741,
            0.54189286, 0.77304323, 0.53847571, 0.77705894, 0.80949766],
           [0.84936917, 0.58022506, 0.42881801, 0.47725447, 0.45597381,
            0.55667117, 0.33529891, 0.29401744, 0.74000364, 0.54561413,
            0.50657403, 0.68298436, 0.58951237, 0.53339828, 0.39506599,
            0.44506222, 0.57342892, 0.541924  , 1.        , 0.60098752,
            0.47115614, 0.64783714, 0.49742343, 0.52540396, 0.53254798,
            0.33833798, 0.74904639, 0.56151957, 0.60984332, 0.4963471 ,
            0.58744302, 0.43624148, 0.38201399, 0.6236571 , 0.73025476,
            0.47186963, 0.66934019, 0.66833735, 0.73267069, 0.79325764,
            0.41044742, 0.80613693, 0.70399266, 0.59068617, 0.72249382,
            0.34997808, 0.71701161, 0.61919509, 0.43607545, 0.68449584],
           [0.61104373, 0.779706  , 0.39669257, 0.50836462, 0.6965489 ,
            0.71504685, 0.51903273, 0.62589956, 0.60636854, 0.90497732,
            0.4502168 , 0.8395271 , 0.56511592, 0.61350434, 0.52704891,
            0.67713364, 0.58382325, 0.71498677, 0.60098752, 1.        ,
            0.47480568, 0.52952077, 0.49137308, 0.551596  , 0.31348967,
            0.55000857, 0.83587372, 0.4914857 , 0.72606521, 0.6536396 ,
            0.61749684, 0.43344074, 0.43385957, 0.8526165 , 0.85141969,
            0.59868191, 0.88742243, 0.66049567, 0.58609955, 0.74461616,
            0.69748333, 0.61979648, 0.57547915, 0.53110318, 0.60037808,
            0.61761624, 0.537565  , 0.63535034, 0.63421266, 0.836356  ],
           [0.45840831, 0.56270134, 0.86327679, 0.41027815, 0.59639648,
            0.62205636, 0.6409119 , 0.66869633, 0.49787962, 0.43771556,
            0.83393288, 0.4642007 , 0.69331931, 0.46086893, 0.65026411,
            0.5897862 , 0.63860281, 0.6469379 , 0.47115614, 0.47480568,
            1.        , 0.65559926, 0.67151169, 0.68036395, 0.65572304,
            0.67705038, 0.46232201, 0.63508474, 0.60231071, 0.48012463,
            0.70350152, 0.46529186, 0.52128419, 0.48052317, 0.49220118,
            0.50059545, 0.48656413, 0.58895076, 0.46047053, 0.58631305,
            0.52650592, 0.46716107, 0.68542359, 0.69439198, 0.71447235,
            0.54087223, 0.66399445, 0.48445037, 0.79573479, 0.46273539],
           [0.61175906, 0.49552637, 0.51887605, 0.46855227, 0.61554046,
            0.47677198, 0.42249376, 0.43822025, 0.57654086, 0.47414738,
            0.7032438 , 0.48144676, 0.91078971, 0.6147118 , 0.43184596,
            0.57606682, 0.52269509, 0.49411283, 0.64783714, 0.52952077,
            0.65559926, 1.        , 0.69144268, 0.59355966, 0.51739214,
            0.45863223, 0.56783694, 0.730368  , 0.48439833, 0.66184665,
            0.50510671, 0.67179739, 0.60401302, 0.48887189, 0.56363892,
            0.58008466, 0.59764496, 0.43563972, 0.46682591, 0.67722729,
            0.59373334, 0.62226237, 0.48981529, 0.78497572, 0.55982006,
            0.50464594, 0.58396425, 0.63999008, 0.58131407, 0.59423911],
           [0.61250544, 0.34666912, 0.67074951, 0.52870605, 0.71404964,
            0.4661503 , 0.5597714 , 0.54745199, 0.59556445, 0.57715487,
            0.64184528, 0.5648685 , 0.73859275, 0.59232063, 0.5587326 ,
            0.75002968, 0.38656522, 0.41230339, 0.49742343, 0.49137308,
            0.67151169, 0.69144268, 1.        , 0.45706067, 0.51813851,
            0.56004905, 0.48273905, 0.87187525, 0.45974484, 0.59831146,
            0.57100438, 0.6165327 , 0.76911417, 0.62419576, 0.51759809,
            0.57769473, 0.5299835 , 0.38596277, 0.67666613, 0.63648701,
            0.71450526, 0.62300874, 0.53538448, 0.88155753, 0.51706383,
            0.63806529, 0.44069116, 0.53865881, 0.54631439, 0.48322133],
           [0.49304007, 0.75916456, 0.63802582, 0.59869448, 0.66518162,
            0.74517145, 0.76661148, 0.71889482, 0.43136002, 0.5041331 ,
            0.71578184, 0.59115515, 0.54451063, 0.73413738, 0.81717138,
            0.65427003, 0.53715364, 0.73080575, 0.52540396, 0.551596  ,
            0.68036395, 0.59355966, 0.45706067, 1.        , 0.67093379,
            0.77015707, 0.67413916, 0.51047412, 0.7891643 , 0.69708619,
            0.53960495, 0.40563066, 0.36044108, 0.57102706, 0.66160558,
            0.68107744, 0.610184  , 0.77508187, 0.36907644, 0.45983782,
            0.61921018, 0.46254137, 0.60726346, 0.53477962, 0.65536278,
            0.55918589, 0.66060598, 0.76267425, 0.88462917, 0.63273533],
           [0.58802756, 0.4997674 , 0.6403243 , 0.48975491, 0.45003939,
            0.46885122, 0.61857065, 0.49403262, 0.36410583, 0.33576295,
            0.80858202, 0.41053865, 0.46369833, 0.56434243, 0.63570809,
            0.42976098, 0.48753172, 0.448749  , 0.53254798, 0.31348967,
            0.65572304, 0.51739214, 0.51813851, 0.67093379, 1.        ,
            0.58210785, 0.42517572, 0.60701752, 0.58034861, 0.54543169,
            0.5615382 , 0.50910779, 0.4548803 , 0.39336955, 0.39416349,
            0.43963881, 0.39341388, 0.5814552 , 0.45749913, 0.45445513,
            0.42613705, 0.5485093 , 0.69434561, 0.49376699, 0.66529686,
            0.30724043, 0.60830744, 0.5619855 , 0.5683612 , 0.35067858],
           [0.41448716, 0.65204736, 0.63836297, 0.51035781, 0.6947011 ,
            0.74362153, 0.88738144, 0.83665411, 0.47845889, 0.61669331,
            0.70325798, 0.59357528, 0.50479429, 0.68443209, 0.9038513 ,
            0.71415017, 0.56558529, 0.65583822, 0.33833798, 0.55000857,
            0.67705038, 0.45863223, 0.56004905, 0.77015707, 0.58210785,
            1.        , 0.55344107, 0.49347889, 0.70007332, 0.66353211,
            0.63213687, 0.4974144 , 0.5848913 , 0.63101131, 0.53164864,
            0.57053771, 0.56653236, 0.60521314, 0.41837902, 0.48080813,
            0.75787445, 0.40485967, 0.59205856, 0.54373185, 0.57620042,
            0.64496444, 0.4825905 , 0.58237137, 0.85636107, 0.52214437],
           [0.72523212, 0.7456514 , 0.42603218, 0.59769452, 0.69086001,
            0.75796122, 0.550402  , 0.49534847, 0.69466127, 0.78050033,
            0.46755485, 0.88667286, 0.55704361, 0.7212618 , 0.59772202,
            0.67994842, 0.55836042, 0.737859  , 0.74904639, 0.83587372,
            0.46232201, 0.56783694, 0.48273905, 0.67413916, 0.42517572,
            0.55344107, 1.        , 0.53615251, 0.78164029, 0.67242145,
            0.56285566, 0.42516254, 0.40263193, 0.85854329, 0.96381907,
            0.65258627, 0.87810766, 0.75387509, 0.62758103, 0.74533497,
            0.65223259, 0.67691022, 0.64090284, 0.56045801, 0.68486448,
            0.58486428, 0.62131897, 0.737933  , 0.6334196 , 0.91308667],
           [0.68827406, 0.36891216, 0.60120561, 0.62025471, 0.71940897,
            0.40707732, 0.54129234, 0.47116144, 0.53057225, 0.5082303 ,
            0.67298554, 0.54519527, 0.72510121, 0.65641678, 0.50990529,
            0.69507487, 0.39890276, 0.42672419, 0.56151957, 0.4914857 ,
            0.63508474, 0.730368  , 0.87187525, 0.51047412, 0.60701752,
            0.49347889, 0.53615251, 1.        , 0.50395061, 0.62945172,
            0.49471382, 0.70346258, 0.70268291, 0.59063236, 0.57101155,
            0.61551181, 0.55593371, 0.42392349, 0.61807336, 0.63996338,
            0.62409931, 0.69337592, 0.56442772, 0.7901671 , 0.57047729,
            0.54805021, 0.49095467, 0.60275496, 0.53215109, 0.51080636],
           [0.64775356, 0.86496155, 0.57653413, 0.5641348 , 0.63813423,
            0.85472622, 0.69703425, 0.68417412, 0.54091479, 0.69997219,
            0.65664051, 0.7705248 , 0.43342103, 0.64986266, 0.72336085,
            0.62878144, 0.64670841, 0.86840039, 0.60984332, 0.72606521,
            0.60231071, 0.48439833, 0.45974484, 0.7891643 , 0.58034861,
            0.70007332, 0.78164029, 0.50395061, 1.        , 0.61977541,
            0.72240079, 0.38762212, 0.34888819, 0.77988989, 0.7960135 ,
            0.63486224, 0.81306527, 0.90513982, 0.56068064, 0.61905132,
            0.57069028, 0.63388124, 0.77304885, 0.47060153, 0.8064115 ,
            0.54014319, 0.77401054, 0.63929716, 0.76092127, 0.75984665],
           [0.59931862, 0.5950062 , 0.39569447, 0.71370958, 0.83863377,
            0.53393198, 0.64193931, 0.6152676 , 0.39506785, 0.67930136,
            0.61851389, 0.63593634, 0.60918031, 0.90783469, 0.62416341,
            0.78791996, 0.36306113, 0.538289  , 0.4963471 , 0.6536396 ,
            0.48012463, 0.66184665, 0.59831146, 0.69708619, 0.54543169,
            0.66353211, 0.67242145, 0.62945172, 0.61977541, 1.        ,
            0.44237701, 0.60180005, 0.54757255, 0.68265811, 0.65175374,
            0.79588396, 0.74579981, 0.55042587, 0.42665269, 0.5427595 ,
            0.85370157, 0.59398165, 0.43887358, 0.56127602, 0.45827532,
            0.68357538, 0.41909879, 0.83651951, 0.66609944, 0.64577798],
           [0.64017731, 0.70805086, 0.68151567, 0.29565093, 0.45695174,
            0.76346598, 0.59102358, 0.64677852, 0.67761319, 0.6649307 ,
            0.71590213, 0.61590275, 0.56168078, 0.40797536, 0.62383778,
            0.48165107, 0.80817725, 0.6820317 , 0.58744302, 0.61749684,
            0.70350152, 0.50510671, 0.57100438, 0.53960495, 0.5615382 ,
            0.63213687, 0.56285566, 0.49471382, 0.72240079, 0.44237701,
            1.        , 0.45513072, 0.54677992, 0.63206983, 0.5539761 ,
            0.36850265, 0.6061718 , 0.62754061, 0.67311444, 0.73873371,
            0.54462955, 0.64023789, 0.86719259, 0.58074364, 0.85765638,
            0.43229699, 0.75573763, 0.37864579, 0.6134941 , 0.54447183],
           [0.57775   , 0.39113719, 0.36397567, 0.44267637, 0.52777609,
            0.31357875, 0.51365605, 0.39506874, 0.46778255, 0.45942624,
            0.62337424, 0.37688827, 0.64152208, 0.58397646, 0.40213472,
            0.47706227, 0.46296949, 0.3162478 , 0.43624148, 0.43344074,
            0.46529186, 0.67179739, 0.6165327 , 0.40563066, 0.50910779,
            0.4974144 , 0.42516254, 0.70346258, 0.38762212, 0.60180005,
            0.45513072, 1.        , 0.78804371, 0.42361004, 0.39270566,
            0.44721356, 0.48329197, 0.29276193, 0.40251111, 0.5617162 ,
            0.56855462, 0.61430053, 0.42383523, 0.56302291, 0.4462901 ,
            0.37271769, 0.36516251, 0.46141396, 0.40705136, 0.38672991],
           [0.52352251, 0.33106129, 0.5335407 , 0.38844888, 0.54198214,
            0.39444924, 0.55128764, 0.51147395, 0.62160393, 0.52888226,
            0.56914675, 0.44945517, 0.69315926, 0.52974897, 0.52410134,
            0.56532102, 0.44663971, 0.30851911, 0.38201399, 0.43385957,
            0.52128419, 0.60401302, 0.76911417, 0.36044108, 0.4548803 ,
            0.5848913 , 0.40263193, 0.70268291, 0.34888819, 0.54757255,
            0.54677992, 0.78804371, 1.        , 0.49716468, 0.37720742,
            0.39298607, 0.4381024 , 0.25402801, 0.57207614, 0.58875635,
            0.6836515 , 0.56007303, 0.44768566, 0.71746842, 0.4291845 ,
            0.48229815, 0.31997293, 0.40718646, 0.44664509, 0.36611911],
           [0.70423691, 0.65630635, 0.46831688, 0.60751128, 0.76272532,
            0.75796387, 0.63143007, 0.60151555, 0.67727495, 0.90676267,
            0.48238386, 0.94067274, 0.52030526, 0.7027381 , 0.63403186,
            0.80415749, 0.4981217 , 0.69888964, 0.6236571 , 0.8526165 ,
            0.48052317, 0.48887189, 0.62419576, 0.57102706, 0.39336955,
            0.63101131, 0.85854329, 0.59063236, 0.77988989, 0.68265811,
            0.63206983, 0.42361004, 0.49716468, 1.        , 0.88004274,
            0.66365704, 0.87784774, 0.68502971, 0.7331935 , 0.72498261,
            0.75593378, 0.69911491, 0.63816176, 0.60200959, 0.62245835,
            0.68164263, 0.55699606, 0.65801992, 0.63504956, 0.84609957],
           [0.69654762, 0.72039237, 0.45591135, 0.62179713, 0.72571905,
            0.74571885, 0.52860956, 0.52414308, 0.67055866, 0.78680541,
            0.45706272, 0.8928305 , 0.54514926, 0.68880492, 0.57273753,
            0.71480745, 0.53770104, 0.76887123, 0.73025476, 0.85141969,
            0.49220118, 0.56363892, 0.51759809, 0.66160558, 0.39416349,
            0.53164864, 0.96381907, 0.57101155, 0.7960135 , 0.65175374,
            0.5539761 , 0.39270566, 0.37720742, 0.88004274, 1.        ,
            0.68041294, 0.90593433, 0.77453447, 0.64506688, 0.71991046,
            0.63597652, 0.66821054, 0.62242553, 0.56556181, 0.6683562 ,
            0.61972332, 0.62944136, 0.73120523, 0.6519139 , 0.9208666 ],
           [0.51827792, 0.52288706, 0.4851457 , 0.80672544, 0.85100393,
            0.49895979, 0.56699213, 0.56178123, 0.37523267, 0.57041972,
            0.5198661 , 0.6396182 , 0.50871643, 0.82488624, 0.58677327,
            0.82766505, 0.29094198, 0.55509311, 0.47186963, 0.59868191,
            0.50059545, 0.58008466, 0.57769473, 0.68107744, 0.43963881,
            0.57053771, 0.65258627, 0.61551181, 0.63486224, 0.79588396,
            0.36850265, 0.44721356, 0.39298607, 0.66365704, 0.68041294,
            1.        , 0.71125948, 0.59229771, 0.3969797 , 0.47383237,
            0.70350899, 0.51302677, 0.40977937, 0.55996078, 0.44127374,
            0.84112195, 0.42680173, 0.80747894, 0.63934731, 0.63809359],
           [0.70428863, 0.74954041, 0.41419542, 0.62094219, 0.74863876,
            0.71023444, 0.53555653, 0.57633877, 0.60075406, 0.84770039,
            0.53014101, 0.85880486, 0.54600421, 0.70674925, 0.5435727 ,
            0.71574406, 0.53843385, 0.75617488, 0.66934019, 0.88742243,
            0.48656413, 0.59764496, 0.5299835 , 0.610184  , 0.39341388,
            0.56653236, 0.87810766, 0.55593371, 0.81306527, 0.74579981,
            0.6061718 , 0.48329197, 0.4381024 , 0.87784774, 0.90593433,
            0.71125948, 1.        , 0.73565453, 0.61104124, 0.74844571,
            0.6968715 , 0.71304139, 0.5932607 , 0.5254887 , 0.63457779,
            0.65622666, 0.596153  , 0.70370301, 0.63343638, 0.87667013],
           [0.58882063, 0.82989487, 0.55539632, 0.58738278, 0.57867272,
            0.80596761, 0.60217407, 0.59770759, 0.49215618, 0.60511201,
            0.56178033, 0.72592358, 0.38466241, 0.58218403, 0.66194115,
            0.564513  , 0.5979498 , 0.85504044, 0.66833735, 0.66049567,
            0.58895076, 0.43563972, 0.38596277, 0.77508187, 0.5814552 ,
            0.60521314, 0.75387509, 0.42392349, 0.90513982, 0.55042587,
            0.62754061, 0.29276193, 0.25402801, 0.68502971, 0.77453447,
            0.59229771, 0.73565453, 1.        , 0.53069738, 0.54777348,
            0.4758301 , 0.5645317 , 0.7274403 , 0.41547463, 0.74329844,
            0.48781924, 0.74205812, 0.66719765, 0.71216265, 0.71108804],
           [0.76712146, 0.42786324, 0.5488504 , 0.43912307, 0.49591882,
            0.54734442, 0.41865989, 0.43728536, 0.76754888, 0.67188134,
            0.46293088, 0.74090817, 0.50454597, 0.44923291, 0.49000724,
            0.53735099, 0.48129169, 0.47019835, 0.73267069, 0.58609955,
            0.46047053, 0.46682591, 0.67666613, 0.36907644, 0.45749913,
            0.41837902, 0.62758103, 0.61807336, 0.56068064, 0.42665269,
            0.67311444, 0.40251111, 0.57207614, 0.7331935 , 0.64506688,
            0.3969797 , 0.61104124, 0.53069738, 1.        , 0.75015878,
            0.52348085, 0.73311696, 0.71319438, 0.63884533, 0.64337011,
            0.43259853, 0.55973093, 0.47825506, 0.40660645, 0.57958262],
           [0.82807074, 0.59981066, 0.50184076, 0.38351507, 0.57169935,
            0.62663861, 0.4498323 , 0.42283599, 0.82277002, 0.69590245,
            0.58248537, 0.71755748, 0.71835217, 0.53555485, 0.45784847,
            0.54949974, 0.68949271, 0.60226457, 0.79325764, 0.74461616,
            0.58631305, 0.67722729, 0.63648701, 0.45983782, 0.45445513,
            0.48080813, 0.74533497, 0.63996338, 0.61905132, 0.5427595 ,
            0.73873371, 0.5617162 , 0.58875635, 0.72498261, 0.71991046,
            0.47383237, 0.74844571, 0.54777348, 0.75015878, 1.        ,
            0.5676347 , 0.81459226, 0.74527127, 0.68870213, 0.77188755,
            0.48998234, 0.66267597, 0.51535843, 0.51910388, 0.70882215],
           [0.50477616, 0.55059394, 0.49618421, 0.64435402, 0.85250506,
            0.61625133, 0.72079303, 0.73456223, 0.49817831, 0.78852069,
            0.56639139, 0.70822427, 0.66505033, 0.79571287, 0.72727387,
            0.87584394, 0.39240929, 0.53032119, 0.41044742, 0.69748333,
            0.52650592, 0.59373334, 0.71450526, 0.61921018, 0.42613705,
            0.75787445, 0.65223259, 0.62409931, 0.57069028, 0.85370157,
            0.54462955, 0.56855462, 0.6836515 , 0.75593378, 0.63597652,
            0.70350899, 0.6968715 , 0.4758301 , 0.52348085, 0.5676347 ,
            1.        , 0.49894016, 0.46132401, 0.68186371, 0.4456206 ,
            0.79282107, 0.35320745, 0.71770938, 0.70541419, 0.62488821],
           [0.93946769, 0.5557395 , 0.41215127, 0.48640136, 0.53743125,
            0.53181223, 0.45941969, 0.3555067 , 0.67946794, 0.64578198,
            0.59100242, 0.65239314, 0.55470985, 0.58967534, 0.39598757,
            0.5063901 , 0.54442683, 0.52365631, 0.80613693, 0.61979648,
            0.46716107, 0.62226237, 0.62300874, 0.46254137, 0.5485093 ,
            0.40485967, 0.67691022, 0.69337592, 0.63388124, 0.59398165,
            0.64023789, 0.61430053, 0.56007303, 0.69911491, 0.66821054,
            0.51302677, 0.71304139, 0.5645317 , 0.73311696, 0.81459226,
            0.49894016, 1.        , 0.6831746 , 0.58102418, 0.70580997,
            0.39463229, 0.67207206, 0.53926119, 0.41921691, 0.66223478],
           [0.72767719, 0.67369663, 0.67259131, 0.40308014, 0.48413719,
            0.73084069, 0.58901949, 0.54047312, 0.65542897, 0.5712678 ,
            0.71841171, 0.67252813, 0.525403  , 0.47422956, 0.64878656,
            0.48508044, 0.76809731, 0.68256656, 0.70399266, 0.57547915,
            0.68542359, 0.48981529, 0.53538448, 0.60726346, 0.69434561,
            0.59205856, 0.64090284, 0.56442772, 0.77304885, 0.43887358,
            0.86719259, 0.42383523, 0.44768566, 0.63816176, 0.62242553,
            0.40977937, 0.5932607 , 0.7274403 , 0.71319438, 0.74527127,
            0.46132401, 0.6831746 , 1.        , 0.55046021, 0.92999522,
            0.38248127, 0.81351714, 0.47854548, 0.60629908, 0.57455842],
           [0.58813392, 0.40011657, 0.69089547, 0.45238839, 0.64713205,
            0.51959776, 0.52835923, 0.51744854, 0.69031842, 0.54476699,
            0.61905935, 0.59439951, 0.83212579, 0.59108666, 0.57160413,
            0.70809083, 0.44892058, 0.42864645, 0.59068617, 0.53110318,
            0.69439198, 0.78497572, 0.88155753, 0.53477962, 0.49376699,
            0.54373185, 0.56045801, 0.7901671 , 0.47060153, 0.56127602,
            0.58074364, 0.56302291, 0.71746842, 0.60200959, 0.56556181,
            0.55996078, 0.5254887 , 0.41547463, 0.63884533, 0.68870213,
            0.68186371, 0.58102418, 0.55046021, 1.        , 0.57950897,
            0.61531158, 0.50832732, 0.61938438, 0.59351877, 0.54074471],
           [0.74393596, 0.733546  , 0.68674522, 0.37833593, 0.47872982,
            0.75573963, 0.57316135, 0.52476971, 0.68429721, 0.55556438,
            0.74104708, 0.63068166, 0.55445175, 0.49347659, 0.60459363,
            0.46937702, 0.8077231 , 0.73563741, 0.72249382, 0.60037808,
            0.71447235, 0.55982006, 0.51706383, 0.65536278, 0.66529686,
            0.57620042, 0.68486448, 0.57047729, 0.8064115 , 0.45827532,
            0.85765638, 0.4462901 , 0.4291845 , 0.62245835, 0.6683562 ,
            0.44127374, 0.63457779, 0.74329844, 0.64337011, 0.77188755,
            0.4456206 , 0.70580997, 0.92999522, 0.57950897, 1.        ,
            0.38787634, 0.88352192, 0.49440361, 0.63119801, 0.63456252],
           [0.38587954, 0.45487755, 0.53127136, 0.67526069, 0.82864125,
            0.55646668, 0.60189641, 0.63620796, 0.42135833, 0.64484645,
            0.45113226, 0.66161201, 0.54236599, 0.66600819, 0.62239211,
            0.85297534, 0.2966929 , 0.54189286, 0.34997808, 0.61761624,
            0.54087223, 0.50464594, 0.63806529, 0.55918589, 0.30724043,
            0.64496444, 0.58486428, 0.54805021, 0.54014319, 0.68357538,
            0.43229699, 0.37271769, 0.48229815, 0.68164263, 0.61972332,
            0.84112195, 0.65622666, 0.48781924, 0.43259853, 0.48998234,
            0.79282107, 0.39463229, 0.38248127, 0.61531158, 0.38787634,
            1.        , 0.32241404, 0.66120908, 0.67255755, 0.58534656],
           [0.68694654, 0.72447758, 0.60310604, 0.33814534, 0.41326753,
            0.73695612, 0.47955143, 0.45930742, 0.63530299, 0.48248936,
            0.6790173 , 0.55444388, 0.52453342, 0.44806328, 0.50475527,
            0.40391473, 0.81976744, 0.77304323, 0.71701161, 0.537565  ,
            0.66399445, 0.58396425, 0.44069116, 0.66060598, 0.60830744,
            0.4825905 , 0.62131897, 0.49095467, 0.77401054, 0.41909879,
            0.75573763, 0.36516251, 0.31997293, 0.55699606, 0.62944136,
            0.42680173, 0.596153  , 0.74205812, 0.55973093, 0.66267597,
            0.35320745, 0.67207206, 0.81351714, 0.50832732, 0.88352192,
            0.32241404, 1.        , 0.46827594, 0.60136542, 0.67473185],
           [0.56971996, 0.56567664, 0.46318083, 0.77786537, 0.78840396,
            0.54174938, 0.57882579, 0.54404983, 0.43259427, 0.57997695,
            0.53169976, 0.71734718, 0.56862185, 0.87743749, 0.64855405,
            0.77531005, 0.33373157, 0.53847571, 0.61919509, 0.63535034,
            0.48445037, 0.63999008, 0.53865881, 0.76267425, 0.5619855 ,
            0.58237137, 0.737933  , 0.60275496, 0.63929716, 0.83651951,
            0.37864579, 0.46141396, 0.40718646, 0.65801992, 0.73120523,
            0.80747894, 0.70370301, 0.66719765, 0.47825506, 0.51535843,
            0.71770938, 0.53926119, 0.47854548, 0.61938438, 0.49440361,
            0.66120908, 0.46827594, 1.        , 0.67304237, 0.68047283],
           [0.41171455, 0.7355425 , 0.68441597, 0.54903002, 0.7372143 ,
            0.79108378, 0.82243736, 0.83426566, 0.45292424, 0.5910655 ,
            0.71425221, 0.61979394, 0.61274744, 0.64946093, 0.83178956,
            0.73207495, 0.57735786, 0.77705894, 0.43607545, 0.63421266,
            0.79573479, 0.58131407, 0.54631439, 0.88462917, 0.5683612 ,
            0.85636107, 0.6334196 , 0.53215109, 0.76092127, 0.66609944,
            0.6134941 , 0.40705136, 0.44664509, 0.63504956, 0.6519139 ,
            0.63934731, 0.63343638, 0.71216265, 0.40660645, 0.51910388,
            0.70541419, 0.41921691, 0.60629908, 0.59351877, 0.63119801,
            0.67255755, 0.60136542, 0.67304237, 1.        , 0.63781986],
           [0.65443078, 0.71915989, 0.39110662, 0.5477763 , 0.69134229,
            0.77650999, 0.51685425, 0.49576185, 0.66095359, 0.7757171 ,
            0.45194065, 0.83698554, 0.5706796 , 0.6568914 , 0.52487043,
            0.6706167 , 0.59935453, 0.80949766, 0.68449584, 0.836356  ,
            0.46273539, 0.59423911, 0.48322133, 0.63273533, 0.35067858,
            0.52214437, 0.91308667, 0.51080636, 0.75984665, 0.64577798,
            0.54447183, 0.38672991, 0.36611911, 0.84609957, 0.9208666 ,
            0.63809359, 0.87667013, 0.71108804, 0.57958262, 0.70882215,
            0.62488821, 0.66223478, 0.57455842, 0.54074471, 0.63456252,
            0.58534656, 0.67473185, 0.68047283, 0.63781986, 1.        ]])





---



 ### Gower-Binary-Quantitative Distance in `Python`  <a class="anchor" id="96.4"></a>


```python
def Dist_GowerBQ_Py(i, j, BQ_Data ,  p1, p2):

    Dist_Gower = np.sqrt( 1 - GowerBQ_Similarity_Python(i, j, BQ_Data , p1, p2) )

    return(Dist_Gower)
```


```python
Dist_GowerBQ_Py(1, 2, BQ_Data_Py,  4, 3)
```




    0.6592670283858957





---



 ### Gower-Binary-Quantitative Distance Matrix in `Python`  <a class="anchor" id="96.5"></a>


```python
def Dist_GowerBQ_Matrix_Python(BQ_Data,  p1, p2):

    M = np.zeros((BQ_Data.shape[0] , BQ_Data.shape[0]))

    for i in range(0 , BQ_Data.shape[0]):
        for j in range(0 , BQ_Data.shape[0]):

            M[i,j] = Dist_GowerBQ_Py(i+1,j+1, BQ_Data, p1, p2)
                 
    return M
```


```python
Dist_GowerBQ_Matrix_Python(BQ_Data_Py,  4, 3)
```




    array([[0.        , 0.65926703, 0.74800511, 0.71594512, 0.68652859,
            0.6809874 , 0.75074868, 0.80746248, 0.53039645, 0.60247056,
            0.64359087, 0.56503962, 0.66478172, 0.60834561, 0.75006243,
            0.70114186, 0.66658916, 0.69559043, 0.38811187, 0.62366359,
            0.73592913, 0.62308983, 0.62249061, 0.71201119, 0.64185079,
            0.76518811, 0.52418306, 0.55832423, 0.59350353, 0.63299398,
            0.59985223, 0.64980766, 0.69027349, 0.54384105, 0.55086512,
            0.69406202, 0.5437935 , 0.6412327 , 0.48257491, 0.41464353,
            0.70372142, 0.24603315, 0.52184559, 0.64176793, 0.5060277 ,
            0.78365838, 0.5595118 , 0.65595735, 0.76699768, 0.58785136],
           [0.65926703, 0.        , 0.73140829, 0.75558166, 0.68257753,
            0.39482527, 0.61557166, 0.55294764, 0.69789513, 0.53934423,
            0.63048083, 0.59165704, 0.72900832, 0.65629151, 0.60902569,
            0.70292783, 0.51927178, 0.39143064, 0.64790041, 0.46935488,
            0.66128561, 0.71026307, 0.80828886, 0.49074987, 0.70727123,
            0.5898751 , 0.50432985, 0.79441037, 0.36747578, 0.63639123,
            0.54032318, 0.78029662, 0.81788674, 0.58625391, 0.52877937,
            0.69073363, 0.50045938, 0.41243803, 0.75639722, 0.6326052 ,
            0.67037755, 0.6665287 , 0.5712297 , 0.77452142, 0.51619182,
            0.73832408, 0.5249023 , 0.65903214, 0.51425431, 0.52994349],
           [0.74800511, 0.73140829, 0.        , 0.75960384, 0.68544415,
            0.64457498, 0.61401112, 0.56082232, 0.69546207, 0.770566  ,
            0.5170912 , 0.72428773, 0.6658858 , 0.75316289, 0.53596813,
            0.65389002, 0.68944412, 0.66928527, 0.75576583, 0.77672867,
            0.36976102, 0.69363099, 0.57380353, 0.6016429 , 0.59972969,
            0.60136264, 0.75760664, 0.6315017 , 0.65074255, 0.77737091,
            0.56434416, 0.79751133, 0.68297826, 0.72916605, 0.73762365,
            0.71753349, 0.76537872, 0.66678608, 0.67167671, 0.70580397,
            0.70979982, 0.76671294, 0.57219638, 0.5559717 , 0.55969168,
            0.6846376 , 0.6299952 , 0.73267945, 0.56176866, 0.7803162 ],
           [0.71594512, 0.75558166, 0.75960384, 0.        , 0.47520642,
            0.76056231, 0.66090004, 0.71551355, 0.84121591, 0.68912319,
            0.73324124, 0.61973853, 0.77437996, 0.50911114, 0.66033473,
            0.51029423, 0.88683304, 0.72271828, 0.72301143, 0.70116716,
            0.76793349, 0.72900462, 0.68650852, 0.6334868 , 0.71431442,
            0.69974437, 0.63427555, 0.61623477, 0.66020088, 0.53506113,
            0.83925507, 0.74654111, 0.78201734, 0.6264892 , 0.614982  ,
            0.43963002, 0.61567671, 0.64235288, 0.74891717, 0.78516554,
            0.59636061, 0.71665797, 0.77260589, 0.74000785, 0.78845677,
            0.56985902, 0.81354451, 0.4713116 , 0.67154299, 0.6724758 ],
           [0.68652859, 0.68257753, 0.68544415, 0.47520642, 0.        ,
            0.64869439, 0.56889349, 0.56901261, 0.74305088, 0.55264536,
            0.64780584, 0.53641315, 0.61142717, 0.40327789, 0.56835645,
            0.24689833, 0.79067821, 0.61923045, 0.73758131, 0.55086396,
            0.63529798, 0.62004802, 0.53474327, 0.57863493, 0.74159329,
            0.55253859, 0.55600359, 0.52970844, 0.6015528 , 0.40170415,
            0.73691808, 0.6871855 , 0.67677017, 0.48710849, 0.52371839,
            0.38600009, 0.50135939, 0.64909728, 0.70998674, 0.65444682,
            0.3840507 , 0.68012407, 0.7182359 , 0.59402689, 0.72199043,
            0.41395501, 0.76598464, 0.4599957 , 0.51262628, 0.55556972],
           [0.6809874 , 0.39482527, 0.64457498, 0.76056231, 0.64869439,
            0.        , 0.52781296, 0.55139932, 0.59967987, 0.52272989,
            0.65728021, 0.49924659, 0.69543076, 0.67943707, 0.5083503 ,
            0.6264622 , 0.52694006, 0.32969896, 0.66582943, 0.53381003,
            0.61477121, 0.72334502, 0.73065019, 0.50480546, 0.72879955,
            0.5063383 , 0.49197437, 0.77001473, 0.38114797, 0.68269175,
            0.48634763, 0.82850543, 0.77817142, 0.49197168, 0.50426297,
            0.70784194, 0.53829876, 0.44049108, 0.67279683, 0.61103305,
            0.61947451, 0.68424248, 0.51880565, 0.69311056, 0.49422705,
            0.66598297, 0.51287803, 0.67694211, 0.45707354, 0.4727473 ],
           [0.75074868, 0.61557166, 0.61401112, 0.66090004, 0.56889349,
            0.52781296, 0.        , 0.4596862 , 0.76447364, 0.64161888,
            0.5746385 , 0.63989358, 0.72893359, 0.57414779, 0.34553491,
            0.53795484, 0.72166989, 0.61248479, 0.81529203, 0.69351804,
            0.5992396 , 0.75993832, 0.66349725, 0.48310301, 0.61759967,
            0.33558688, 0.67052069, 0.6772796 , 0.55042324, 0.59838172,
            0.63951265, 0.69738365, 0.66985996, 0.6070996 , 0.68657879,
            0.65803333, 0.6815009 , 0.63073444, 0.76245663, 0.74173291,
            0.52840039, 0.73524167, 0.64107762, 0.68676107, 0.6533289 ,
            0.63095451, 0.72142122, 0.64897936, 0.42138183, 0.69508686],
           [0.80746248, 0.55294764, 0.56082232, 0.71551355, 0.56901261,
            0.55139932, 0.4596862 , 0.        , 0.78307013, 0.58384746,
            0.58860207, 0.65898017, 0.71908109, 0.65181873, 0.40020762,
            0.54310171, 0.70316025, 0.58974682, 0.84022768, 0.61163751,
            0.57558985, 0.74951968, 0.67271689, 0.53019353, 0.71131384,
            0.40416073, 0.7103883 , 0.72721287, 0.56198388, 0.62026801,
            0.59432439, 0.77777327, 0.69894638, 0.63125624, 0.68982383,
            0.66198094, 0.65089264, 0.63426525, 0.75014308, 0.75971311,
            0.51520653, 0.8028034 , 0.67788412, 0.69465924, 0.68936949,
            0.60315175, 0.73531802, 0.67524082, 0.40710483, 0.71009728],
           [0.53039645, 0.69789513, 0.69546207, 0.84121591, 0.74305088,
            0.59967987, 0.76447364, 0.78307013, 0.        , 0.61641517,
            0.75180202, 0.56883069, 0.60668333, 0.73045871, 0.7200807 ,
            0.70804351, 0.57008687, 0.68433717, 0.50989838, 0.62740056,
            0.70860453, 0.65073738, 0.63595247, 0.75408221, 0.79742972,
            0.72217803, 0.55257464, 0.68514798, 0.67755827, 0.77777384,
            0.56779117, 0.72953235, 0.61513907, 0.56808895, 0.57396981,
            0.79042225, 0.63185912, 0.71263162, 0.48213185, 0.42098691,
            0.70839374, 0.56615551, 0.58700173, 0.55649041, 0.56187435,
            0.760685  , 0.60390149, 0.75326339, 0.7396457 , 0.58227692],
           [0.60247056, 0.53934423, 0.770566  , 0.68912319, 0.55264536,
            0.52272989, 0.64161888, 0.58384746, 0.61641517, 0.        ,
            0.7334614 , 0.37542887, 0.69365012, 0.61262131, 0.64423073,
            0.5347596 , 0.6809109 , 0.58343543, 0.6740815 , 0.3082575 ,
            0.74985628, 0.72515697, 0.65026543, 0.70417818, 0.81500739,
            0.61911767, 0.46850792, 0.70126293, 0.54774795, 0.5663026 ,
            0.57885171, 0.73523722, 0.68638017, 0.30534788, 0.46172999,
            0.65542374, 0.39025583, 0.62840114, 0.57281642, 0.55145041,
            0.45986879, 0.59516218, 0.65477645, 0.67470958, 0.66666005,
            0.59594761, 0.71938212, 0.64809185, 0.63947987, 0.47358516],
           [0.64359087, 0.63048083, 0.5170912 , 0.73324124, 0.64780584,
            0.65728021, 0.5746385 , 0.58860207, 0.75180202, 0.7334614 ,
            0.        , 0.74598595, 0.59539319, 0.64369633, 0.57975057,
            0.6796425 , 0.61636753, 0.64841128, 0.70244286, 0.74147367,
            0.40751333, 0.54475334, 0.59846029, 0.53312115, 0.4375134 ,
            0.54474032, 0.72968839, 0.57185178, 0.58596884, 0.61764562,
            0.53300832, 0.61369843, 0.65639413, 0.71945545, 0.73684278,
            0.69291695, 0.68546261, 0.66198162, 0.73285   , 0.64615372,
            0.65848964, 0.63952919, 0.53064894, 0.6172039 , 0.50887417,
            0.74085609, 0.56655335, 0.68432466, 0.53455382, 0.74031031],
           [0.56503962, 0.59165704, 0.72428773, 0.61973853, 0.53641315,
            0.49924659, 0.63989358, 0.65898017, 0.56883069, 0.37542887,
            0.74598595, 0.        , 0.69793973, 0.57185004, 0.5913516 ,
            0.48777263, 0.71291142, 0.56341178, 0.56304142, 0.40059069,
            0.73198313, 0.72010641, 0.65964498, 0.63940976, 0.76776386,
            0.63751449, 0.33664097, 0.67439212, 0.4790357 , 0.60337688,
            0.6197558 , 0.78937427, 0.74198708, 0.24357188, 0.32736753,
            0.60031808, 0.37575942, 0.52352309, 0.50901064, 0.53145322,
            0.54016269, 0.58958193, 0.57225158, 0.63686772, 0.60771567,
            0.58171126, 0.66749991, 0.53165104, 0.61660851, 0.40375049],
           [0.66478172, 0.72900832, 0.6658858 , 0.77437996, 0.61142717,
            0.69543076, 0.72893359, 0.71908109, 0.60668333, 0.69365012,
            0.59539319, 0.69793973, 0.        , 0.66255717, 0.72249012,
            0.62146048, 0.66269395, 0.71843116, 0.64069309, 0.65945741,
            0.55378759, 0.29868092, 0.51128001, 0.67489953, 0.7323262 ,
            0.70370854, 0.66554969, 0.52430791, 0.7527144 , 0.62515573,
            0.66205681, 0.59873026, 0.55393207, 0.69259998, 0.67442623,
            0.70091624, 0.6737921 , 0.78443457, 0.70388496, 0.53070503,
            0.57874837, 0.66730064, 0.68891001, 0.40972455, 0.66749401,
            0.67648652, 0.68954085, 0.65679384, 0.6222962 , 0.65522546],
           [0.60834561, 0.65629151, 0.75316289, 0.50911114, 0.40327789,
            0.67943707, 0.57414779, 0.65181873, 0.73045871, 0.61262131,
            0.64369633, 0.57185004, 0.66255717, 0.        , 0.54933234,
            0.43239698, 0.79828962, 0.69407273, 0.68308251, 0.62168775,
            0.73425545, 0.62071587, 0.63849775, 0.51561868, 0.66004361,
            0.56175432, 0.52795662, 0.58615972, 0.59172404, 0.3035874 ,
            0.76943137, 0.64499887, 0.68574852, 0.5452173 , 0.55784862,
            0.41846596, 0.54152631, 0.64638686, 0.74213684, 0.68150212,
            0.45198134, 0.64056589, 0.72510029, 0.63946332, 0.71170458,
            0.57792025, 0.74292444, 0.35008928, 0.5920634 , 0.58575473],
           [0.75006243, 0.60902569, 0.53596813, 0.66033473, 0.56835645,
            0.5083503 , 0.34553491, 0.40020762, 0.7200807 , 0.64423073,
            0.57975057, 0.5913516 , 0.72249012, 0.54933234, 0.        ,
            0.52235566, 0.71136695, 0.60590547, 0.77777504, 0.6877144 ,
            0.59138473, 0.75375994, 0.66427961, 0.42758464, 0.603566  ,
            0.31007854, 0.63425388, 0.70006765, 0.52596497, 0.61305513,
            0.61332065, 0.77321749, 0.68985409, 0.60495301, 0.65365317,
            0.64282714, 0.67559403, 0.58142828, 0.71413777, 0.7363094 ,
            0.52223187, 0.77718236, 0.59263263, 0.65451958, 0.62881347,
            0.61449808, 0.70373627, 0.59282877, 0.41013466, 0.68929643],
           [0.70114186, 0.70292783, 0.65389002, 0.51029423, 0.24689833,
            0.6264622 , 0.53795484, 0.54310171, 0.70804351, 0.5347596 ,
            0.6796425 , 0.48777263, 0.62146048, 0.43239698, 0.52235566,
            0.        , 0.80764608, 0.64727092, 0.74494146, 0.56821331,
            0.64047935, 0.65110151, 0.49997032, 0.58798807, 0.75514172,
            0.53464926, 0.56573102, 0.55220026, 0.60927708, 0.46052149,
            0.71996454, 0.72314434, 0.65930189, 0.44254097, 0.53403422,
            0.41513244, 0.53315658, 0.65991439, 0.68018307, 0.67119316,
            0.35235786, 0.70257377, 0.71757896, 0.54028619, 0.72843872,
            0.38343795, 0.77206558, 0.47401472, 0.51761477, 0.57391924],
           [0.66658916, 0.51927178, 0.68944412, 0.88683304, 0.79067821,
            0.52694006, 0.72166989, 0.70316025, 0.57008687, 0.6809109 ,
            0.61636753, 0.71291142, 0.66269395, 0.79828962, 0.71136695,
            0.80764608, 0.        , 0.51395635, 0.65312409, 0.64511763,
            0.60116319, 0.69087257, 0.78322077, 0.68032813, 0.7158689 ,
            0.65910144, 0.66455969, 0.77530461, 0.59438337, 0.7980845 ,
            0.43797574, 0.73282366, 0.7438819 , 0.70843369, 0.6799257 ,
            0.84205583, 0.6793866 , 0.63407429, 0.72021407, 0.55723181,
            0.77948105, 0.67496161, 0.48156276, 0.74234724, 0.4384939 ,
            0.83863407, 0.42453805, 0.81625268, 0.65010933, 0.63296562],
           [0.69559043, 0.39143064, 0.66928527, 0.72271828, 0.61923045,
            0.32969896, 0.61248479, 0.58974682, 0.68433717, 0.58343543,
            0.64841128, 0.56341178, 0.71843116, 0.69407273, 0.60590547,
            0.64727092, 0.51395635, 0.        , 0.67681312, 0.53386631,
            0.59419029, 0.71125746, 0.76661373, 0.51883933, 0.7424628 ,
            0.58665303, 0.51199707, 0.75714979, 0.36276661, 0.67949319,
            0.56388678, 0.8268931 , 0.8315533 , 0.54873524, 0.48075854,
            0.66701341, 0.49378651, 0.38073556, 0.72787475, 0.63066269,
            0.68533117, 0.69017657, 0.56341232, 0.75587932, 0.51416203,
            0.67683613, 0.47639981, 0.67935579, 0.47216635, 0.43646574],
           [0.38811187, 0.64790041, 0.75576583, 0.72301143, 0.73758131,
            0.66582943, 0.81529203, 0.84022768, 0.50989838, 0.6740815 ,
            0.70244286, 0.56304142, 0.64069309, 0.68308251, 0.77777504,
            0.74494146, 0.65312409, 0.67681312, 0.        , 0.63167434,
            0.72721651, 0.59343312, 0.70892635, 0.68890931, 0.68370463,
            0.8134261 , 0.5009527 , 0.66217855, 0.62462523, 0.70968507,
            0.64230599, 0.75083855, 0.78612086, 0.61346793, 0.51937004,
            0.72672579, 0.57503027, 0.5759016 , 0.51703898, 0.4546893 ,
            0.76782327, 0.44029884, 0.54406557, 0.63977639, 0.52678856,
            0.80623937, 0.53196653, 0.61709393, 0.7509491 , 0.56169757],
           [0.62366359, 0.46935488, 0.77672867, 0.70116716, 0.55086396,
            0.53381003, 0.69351804, 0.61163751, 0.62740056, 0.3082575 ,
            0.74147367, 0.40059069, 0.65945741, 0.62168775, 0.6877144 ,
            0.56821331, 0.64511763, 0.53386631, 0.63167434, 0.        ,
            0.72470292, 0.68591489, 0.71318085, 0.66962975, 0.82855919,
            0.67081401, 0.40512502, 0.71310189, 0.5233878 , 0.58852392,
            0.61846839, 0.75270131, 0.75242304, 0.38390558, 0.38546116,
            0.63349671, 0.33552581, 0.58267   , 0.64335096, 0.50535517,
            0.55001516, 0.61660645, 0.65155264, 0.68476041, 0.63215656,
            0.61837187, 0.68002574, 0.60386228, 0.60480355, 0.40452935],
           [0.73592913, 0.66128561, 0.36976102, 0.76793349, 0.63529798,
            0.61477121, 0.5992396 , 0.57558985, 0.70860453, 0.74985628,
            0.40751333, 0.73198313, 0.55378759, 0.73425545, 0.59138473,
            0.64047935, 0.60116319, 0.59419029, 0.72721651, 0.72470292,
            0.        , 0.58685666, 0.573139  , 0.56536364, 0.58675119,
            0.56828657, 0.73326529, 0.60408216, 0.63062611, 0.72102384,
            0.54451674, 0.7312374 , 0.69189292, 0.72074741, 0.71260004,
            0.70668561, 0.7165444 , 0.64113122, 0.7345267 , 0.643185  ,
            0.68810906, 0.72995817, 0.56087111, 0.55281825, 0.53434788,
            0.67758967, 0.57965986, 0.71801785, 0.45195709, 0.73298336],
           [0.62308983, 0.71026307, 0.69363099, 0.72900462, 0.62004802,
            0.72334502, 0.75993832, 0.74951968, 0.65073738, 0.72515697,
            0.54475334, 0.72010641, 0.29868092, 0.62071587, 0.75375994,
            0.65110151, 0.69087257, 0.71125746, 0.59343312, 0.68591489,
            0.58685666, 0.        , 0.55547936, 0.63752674, 0.69469984,
            0.73577698, 0.6573911 , 0.51926101, 0.71805408, 0.58150955,
            0.70348652, 0.5728897 , 0.62927496, 0.71493224, 0.66057633,
            0.64800875, 0.63431462, 0.75123916, 0.73018771, 0.56813089,
            0.63739051, 0.61460364, 0.71427216, 0.4637071 , 0.66346058,
            0.70381394, 0.64500833, 0.60000827, 0.64705945, 0.63699363],
           [0.62249061, 0.80828886, 0.57380353, 0.68650852, 0.53474327,
            0.73065019, 0.66349725, 0.67271689, 0.63595247, 0.65026543,
            0.59846029, 0.65964498, 0.51128001, 0.63849775, 0.66427961,
            0.49997032, 0.78322077, 0.76661373, 0.70892635, 0.71318085,
            0.573139  , 0.55547936, 0.        , 0.73684417, 0.69416244,
            0.66328799, 0.71920856, 0.35794517, 0.73502051, 0.63378903,
            0.65497758, 0.61924736, 0.4805058 , 0.61302874, 0.69455159,
            0.64985019, 0.68557749, 0.78360528, 0.56862454, 0.60292038,
            0.53431708, 0.61399614, 0.68162711, 0.34415471, 0.69493609,
            0.6016101 , 0.74786953, 0.67922102, 0.67356188, 0.71887319],
           [0.71201119, 0.49074987, 0.6016429 , 0.6334868 , 0.57863493,
            0.50480546, 0.48310301, 0.53019353, 0.75408221, 0.70417818,
            0.53312115, 0.63940976, 0.67489953, 0.51561868, 0.42758464,
            0.58798807, 0.68032813, 0.51883933, 0.68890931, 0.66962975,
            0.56536364, 0.63752674, 0.73684417, 0.        , 0.57364293,
            0.47941937, 0.57084222, 0.69966126, 0.45916849, 0.55037606,
            0.67852417, 0.77095353, 0.79972428, 0.65496026, 0.58171679,
            0.56473229, 0.62435246, 0.47425534, 0.79430697, 0.73495726,
            0.6170817 , 0.7331157 , 0.62668695, 0.68207066, 0.58705811,
            0.66393833, 0.58257533, 0.48716091, 0.33966283, 0.60602366],
           [0.64185079, 0.70727123, 0.59972969, 0.71431442, 0.74159329,
            0.72879955, 0.61759967, 0.71131384, 0.79742972, 0.81500739,
            0.4375134 , 0.76776386, 0.7323262 , 0.66004361, 0.603566  ,
            0.75514172, 0.7158689 , 0.7424628 , 0.68370463, 0.82855919,
            0.58675119, 0.69469984, 0.69416244, 0.57364293, 0.        ,
            0.64644578, 0.75817167, 0.62688314, 0.64780506, 0.67421682,
            0.66216448, 0.700637  , 0.73832222, 0.77886485, 0.778355  ,
            0.74857277, 0.77883639, 0.64695039, 0.73654658, 0.73861009,
            0.75753742, 0.67193058, 0.55286019, 0.71150053, 0.57853534,
            0.83232179, 0.62585347, 0.66182664, 0.65699223, 0.80580483],
           [0.76518811, 0.5898751 , 0.60136264, 0.69974437, 0.55253859,
            0.5063383 , 0.33558688, 0.40416073, 0.72217803, 0.61911767,
            0.54474032, 0.63751449, 0.70370854, 0.56175432, 0.31007854,
            0.53464926, 0.65910144, 0.58665303, 0.8134261 , 0.67081401,
            0.56828657, 0.73577698, 0.66328799, 0.47941937, 0.64644578,
            0.        , 0.66825065, 0.71170297, 0.54765562, 0.58005852,
            0.60651721, 0.70893272, 0.6442893 , 0.60744439, 0.68436201,
            0.65533372, 0.65838259, 0.62832066, 0.7626408 , 0.7205497 ,
            0.49206255, 0.77145339, 0.63870294, 0.67547624, 0.65099891,
            0.5958486 , 0.71931182, 0.64624193, 0.37899726, 0.69127103],
           [0.52418306, 0.50432985, 0.75760664, 0.63427555, 0.55600359,
            0.49197437, 0.67052069, 0.7103883 , 0.55257464, 0.46850792,
            0.72968839, 0.33664097, 0.66554969, 0.52795662, 0.63425388,
            0.56573102, 0.66455969, 0.51199707, 0.5009527 , 0.40512502,
            0.73326529, 0.6573911 , 0.71920856, 0.57084222, 0.75817167,
            0.66825065, 0.        , 0.6810635 , 0.46728975, 0.57234478,
            0.66116892, 0.75818036, 0.7728959 , 0.37610731, 0.19021287,
            0.58941812, 0.34913083, 0.49610978, 0.61026139, 0.50464346,
            0.58971808, 0.56840987, 0.59924716, 0.66297963, 0.56136933,
            0.64431027, 0.61537065, 0.5119248 , 0.60545883, 0.29481067],
           [0.55832423, 0.79441037, 0.6315017 , 0.61623477, 0.52970844,
            0.77001473, 0.6772796 , 0.72721287, 0.68514798, 0.70126293,
            0.57185178, 0.67439212, 0.52430791, 0.58615972, 0.70006765,
            0.55220026, 0.77530461, 0.75714979, 0.66217855, 0.71310189,
            0.60408216, 0.51926101, 0.35794517, 0.69966126, 0.62688314,
            0.71170297, 0.6810635 , 0.        , 0.70430774, 0.60872677,
            0.71083485, 0.54455249, 0.54526791, 0.63981845, 0.6549721 ,
            0.62007112, 0.66638299, 0.75899704, 0.61800213, 0.60003052,
            0.6131074 , 0.55373648, 0.659979  , 0.45807522, 0.65537982,
            0.67227211, 0.71347413, 0.63027378, 0.68399482, 0.69942379],
           [0.59350353, 0.36747578, 0.65074255, 0.66020088, 0.6015528 ,
            0.38114797, 0.55042324, 0.56198388, 0.67755827, 0.54774795,
            0.58596884, 0.4790357 , 0.7527144 , 0.59172404, 0.52596497,
            0.60927708, 0.59438337, 0.36276661, 0.62462523, 0.5233878 ,
            0.63062611, 0.71805408, 0.73502051, 0.45916849, 0.64780506,
            0.54765562, 0.46728975, 0.70430774, 0.        , 0.61662354,
            0.52687685, 0.78254577, 0.80691499, 0.46915894, 0.45164864,
            0.6042663 , 0.43235949, 0.3079938 , 0.66281171, 0.6172104 ,
            0.65521731, 0.60507748, 0.47639391, 0.72759774, 0.43998693,
            0.67812743, 0.47538349, 0.60058541, 0.48895678, 0.49005443],
           [0.63299398, 0.63639123, 0.77737091, 0.53506113, 0.40170415,
            0.68269175, 0.59838172, 0.62026801, 0.77777384, 0.5663026 ,
            0.61764562, 0.60337688, 0.62515573, 0.3035874 , 0.61305513,
            0.46052149, 0.7980845 , 0.67949319, 0.70968507, 0.58852392,
            0.72102384, 0.58150955, 0.63378903, 0.55037606, 0.67421682,
            0.58005852, 0.57234478, 0.60872677, 0.61662354, 0.        ,
            0.74674158, 0.63103087, 0.67262727, 0.56333106, 0.59012394,
            0.45179203, 0.5041827 , 0.67050289, 0.75719701, 0.67619561,
            0.38248977, 0.6371957 , 0.74908372, 0.66236242, 0.73601948,
            0.56251633, 0.76216875, 0.40432721, 0.5778413 , 0.59516554],
           [0.59985223, 0.54032318, 0.56434416, 0.83925507, 0.73691808,
            0.48634763, 0.63951265, 0.59432439, 0.56779117, 0.57885171,
            0.53300832, 0.6197558 , 0.66205681, 0.76943137, 0.61332065,
            0.71996454, 0.43797574, 0.56388678, 0.64230599, 0.61846839,
            0.54451674, 0.70348652, 0.65497758, 0.67852417, 0.66216448,
            0.60651721, 0.66116892, 0.71083485, 0.52687685, 0.74674158,
            0.        , 0.73815261, 0.67321622, 0.60657248, 0.66785021,
            0.79466808, 0.62755733, 0.61029451, 0.57173906, 0.51114214,
            0.67481141, 0.59980173, 0.36442751, 0.64750008, 0.37728454,
            0.75346069, 0.49422907, 0.78826025, 0.62169599, 0.67492827],
           [0.64980766, 0.78029662, 0.79751133, 0.74654111, 0.6871855 ,
            0.82850543, 0.69738365, 0.77777327, 0.72953235, 0.73523722,
            0.61369843, 0.78937427, 0.59873026, 0.64499887, 0.77321749,
            0.72314434, 0.73282366, 0.8268931 , 0.75083855, 0.75270131,
            0.7312374 , 0.5728897 , 0.61924736, 0.77095353, 0.700637  ,
            0.70893272, 0.75818036, 0.54455249, 0.78254577, 0.63103087,
            0.73815261, 0.        , 0.4603871 , 0.7592035 , 0.77929092,
            0.74349609, 0.71882406, 0.84097447, 0.77297406, 0.66203006,
            0.65684502, 0.62104708, 0.75905518, 0.66104243, 0.74411686,
            0.79201156, 0.7967669 , 0.73388422, 0.77003158, 0.78311563],
           [0.69027349, 0.81788674, 0.68297826, 0.78201734, 0.67677017,
            0.77817142, 0.66985996, 0.69894638, 0.61513907, 0.68638017,
            0.65639413, 0.74198708, 0.55393207, 0.68574852, 0.68985409,
            0.65930189, 0.7438819 , 0.8315533 , 0.78612086, 0.75242304,
            0.69189292, 0.62927496, 0.4805058 , 0.79972428, 0.73832222,
            0.6442893 , 0.7728959 , 0.54526791, 0.80691499, 0.67262727,
            0.67321622, 0.4603871 , 0.        , 0.70910882, 0.78917209,
            0.77911099, 0.74959829, 0.8636967 , 0.6541589 , 0.64128282,
            0.56244867, 0.66326991, 0.74317854, 0.531537  , 0.75552333,
            0.71951501, 0.82463754, 0.76994385, 0.74387829, 0.79616637],
           [0.54384105, 0.58625391, 0.72916605, 0.6264892 , 0.48710849,
            0.49197168, 0.6070996 , 0.63125624, 0.56808895, 0.30534788,
            0.71945545, 0.24357188, 0.69259998, 0.5452173 , 0.60495301,
            0.44254097, 0.70843369, 0.54873524, 0.61346793, 0.38390558,
            0.72074741, 0.71493224, 0.61302874, 0.65496026, 0.77886485,
            0.60744439, 0.37610731, 0.63981845, 0.46915894, 0.56333106,
            0.60657248, 0.7592035 , 0.70910882, 0.        , 0.34634847,
            0.57995082, 0.34950288, 0.56122214, 0.51653315, 0.52442101,
            0.49403058, 0.54852993, 0.60152991, 0.63086481, 0.61444418,
            0.56423167, 0.66558541, 0.58479063, 0.60411128, 0.39230145],
           [0.55086512, 0.52877937, 0.73762365, 0.614982  , 0.52371839,
            0.50426297, 0.68657879, 0.68982383, 0.57396981, 0.46172999,
            0.73684278, 0.32736753, 0.67442623, 0.55784862, 0.65365317,
            0.53403422, 0.6799257 , 0.48075854, 0.51937004, 0.38546116,
            0.71260004, 0.66057633, 0.69455159, 0.58171679, 0.778355  ,
            0.68436201, 0.19021287, 0.6549721 , 0.45164864, 0.59012394,
            0.66785021, 0.77929092, 0.78917209, 0.34634847, 0.        ,
            0.56532032, 0.30670128, 0.47483211, 0.59576264, 0.52923486,
            0.60334358, 0.57601169, 0.61447089, 0.65911925, 0.57588523,
            0.61666578, 0.60873528, 0.51845421, 0.58998822, 0.28130659],
           [0.69406202, 0.69073363, 0.71753349, 0.43963002, 0.38600009,
            0.70784194, 0.65803333, 0.66198094, 0.79042225, 0.65542374,
            0.69291695, 0.60031808, 0.70091624, 0.41846596, 0.64282714,
            0.41513244, 0.84205583, 0.66701341, 0.72672579, 0.63349671,
            0.70668561, 0.64800875, 0.64985019, 0.56473229, 0.74857277,
            0.65533372, 0.58941812, 0.62007112, 0.6042663 , 0.45179203,
            0.79466808, 0.74349609, 0.77911099, 0.57995082, 0.56532032,
            0.        , 0.53734581, 0.6385157 , 0.77654382, 0.72537413,
            0.54450988, 0.69783468, 0.76825818, 0.66335452, 0.74747994,
            0.3985951 , 0.75709859, 0.43877222, 0.60054366, 0.60158658],
           [0.5437935 , 0.50045938, 0.76537872, 0.61567671, 0.50135939,
            0.53829876, 0.6815009 , 0.65089264, 0.63185912, 0.39025583,
            0.68546261, 0.37575942, 0.6737921 , 0.54152631, 0.67559403,
            0.53315658, 0.6793866 , 0.49378651, 0.57503027, 0.33552581,
            0.7165444 , 0.63431462, 0.68557749, 0.62435246, 0.77883639,
            0.65838259, 0.34913083, 0.66638299, 0.43235949, 0.5041827 ,
            0.62755733, 0.71882406, 0.74959829, 0.34950288, 0.30670128,
            0.53734581, 0.        , 0.51414538, 0.62366558, 0.50155188,
            0.55057107, 0.53568518, 0.63776117, 0.6888478 , 0.60450162,
            0.58632187, 0.63548958, 0.54433169, 0.60544498, 0.35118352],
           [0.6412327 , 0.41243803, 0.66678608, 0.64235288, 0.64909728,
            0.44049108, 0.63073444, 0.63426525, 0.71263162, 0.62840114,
            0.66198162, 0.52352309, 0.78443457, 0.64638686, 0.58142828,
            0.65991439, 0.63407429, 0.38073556, 0.5759016 , 0.58267   ,
            0.64113122, 0.75123916, 0.78360528, 0.47425534, 0.64695039,
            0.62832066, 0.49610978, 0.75899704, 0.3079938 , 0.67050289,
            0.61029451, 0.84097447, 0.8636967 , 0.56122214, 0.47483211,
            0.6385157 , 0.51414538, 0.        , 0.68505666, 0.6724779 ,
            0.72399579, 0.65990022, 0.5220725 , 0.76454259, 0.50665724,
            0.71566805, 0.50787979, 0.57689024, 0.53650475, 0.53750531],
           [0.48257491, 0.75639722, 0.67167671, 0.74891717, 0.70998674,
            0.67279683, 0.76245663, 0.75014308, 0.48213185, 0.57281642,
            0.73285   , 0.50901064, 0.70388496, 0.74213684, 0.71413777,
            0.68018307, 0.72021407, 0.72787475, 0.51703898, 0.64335096,
            0.7345267 , 0.73018771, 0.56862454, 0.79430697, 0.73654658,
            0.7626408 , 0.61026139, 0.61800213, 0.66281171, 0.75719701,
            0.57173906, 0.77297406, 0.6541589 , 0.51653315, 0.59576264,
            0.77654382, 0.62366558, 0.68505666, 0.        , 0.4998412 ,
            0.69030366, 0.51660724, 0.53554236, 0.60096145, 0.59718497,
            0.75326056, 0.66352775, 0.72231914, 0.77032042, 0.64839601],
           [0.41464353, 0.6326052 , 0.70580397, 0.78516554, 0.65444682,
            0.61103305, 0.74173291, 0.75971311, 0.42098691, 0.55145041,
            0.64615372, 0.53145322, 0.53070503, 0.68150212, 0.7363094 ,
            0.67119316, 0.55723181, 0.63066269, 0.4546893 , 0.50535517,
            0.643185  , 0.56813089, 0.60292038, 0.73495726, 0.73861009,
            0.7205497 , 0.50464346, 0.60003052, 0.6172104 , 0.67619561,
            0.51114214, 0.66203006, 0.64128282, 0.52442101, 0.52923486,
            0.72537413, 0.50155188, 0.6724779 , 0.4998412 , 0.        ,
            0.6575449 , 0.43058999, 0.50470658, 0.55794074, 0.47761119,
            0.71415521, 0.58079603, 0.69616203, 0.69346674, 0.53960898],
           [0.70372142, 0.67037755, 0.70979982, 0.59636061, 0.3840507 ,
            0.61947451, 0.52840039, 0.51520653, 0.70839374, 0.45986879,
            0.65848964, 0.54016269, 0.57874837, 0.45198134, 0.52223187,
            0.35235786, 0.77948105, 0.68533117, 0.76782327, 0.55001516,
            0.68810906, 0.63739051, 0.53431708, 0.6170817 , 0.75753742,
            0.49206255, 0.58971808, 0.6131074 , 0.65521731, 0.38248977,
            0.67481141, 0.65684502, 0.56244867, 0.49403058, 0.60334358,
            0.54450988, 0.55057107, 0.72399579, 0.69030366, 0.6575449 ,
            0.        , 0.70785581, 0.73394549, 0.56403572, 0.74456659,
            0.45516913, 0.80423414, 0.53131028, 0.5427576 , 0.61246371],
           [0.24603315, 0.6665287 , 0.76671294, 0.71665797, 0.68012407,
            0.68424248, 0.73524167, 0.8028034 , 0.56615551, 0.59516218,
            0.63952919, 0.58958193, 0.66730064, 0.64056589, 0.77718236,
            0.70257377, 0.67496161, 0.69017657, 0.44029884, 0.61660645,
            0.72995817, 0.61460364, 0.61399614, 0.7331157 , 0.67193058,
            0.77145339, 0.56840987, 0.55373648, 0.60507748, 0.6371957 ,
            0.59980173, 0.62104708, 0.66326991, 0.54852993, 0.57601169,
            0.69783468, 0.53568518, 0.65990022, 0.51660724, 0.43058999,
            0.70785581, 0.        , 0.56287245, 0.64728342, 0.54239287,
            0.77805379, 0.57264993, 0.67877744, 0.76209126, 0.58117572],
           [0.52184559, 0.5712297 , 0.57219638, 0.77260589, 0.7182359 ,
            0.51880565, 0.64107762, 0.67788412, 0.58700173, 0.65477645,
            0.53064894, 0.57225158, 0.68891001, 0.72510029, 0.59263263,
            0.71757896, 0.48156276, 0.56341232, 0.54406557, 0.65155264,
            0.56087111, 0.71427216, 0.68162711, 0.62668695, 0.55286019,
            0.63870294, 0.59924716, 0.659979  , 0.47639391, 0.74908372,
            0.36442751, 0.75905518, 0.74317854, 0.60152991, 0.61447089,
            0.76825818, 0.63776117, 0.5220725 , 0.53554236, 0.50470658,
            0.73394549, 0.56287245, 0.        , 0.67047728, 0.26458416,
            0.7858236 , 0.43183661, 0.72211808, 0.62745591, 0.65225883],
           [0.64176793, 0.77452142, 0.5559717 , 0.74000785, 0.59402689,
            0.69311056, 0.68676107, 0.69465924, 0.55649041, 0.67470958,
            0.6172039 , 0.63686772, 0.40972455, 0.63946332, 0.65451958,
            0.54028619, 0.74234724, 0.75587932, 0.63977639, 0.68476041,
            0.55281825, 0.4637071 , 0.34415471, 0.68207066, 0.71150053,
            0.67547624, 0.66297963, 0.45807522, 0.72759774, 0.66236242,
            0.64750008, 0.66104243, 0.531537  , 0.63086481, 0.65911925,
            0.66335452, 0.6888478 , 0.76454259, 0.60096145, 0.55794074,
            0.56403572, 0.64728342, 0.67047728, 0.        , 0.6484528 ,
            0.62023256, 0.70119376, 0.61694053, 0.63755881, 0.67768377],
           [0.5060277 , 0.51619182, 0.55969168, 0.78845677, 0.72199043,
            0.49422705, 0.6533289 , 0.68936949, 0.56187435, 0.66666005,
            0.50887417, 0.60771567, 0.66749401, 0.71170458, 0.62881347,
            0.72843872, 0.4384939 , 0.51416203, 0.52678856, 0.63215656,
            0.53434788, 0.66346058, 0.69493609, 0.58705811, 0.57853534,
            0.65099891, 0.56136933, 0.65537982, 0.43998693, 0.73601948,
            0.37728454, 0.74411686, 0.75552333, 0.61444418, 0.57588523,
            0.74747994, 0.60450162, 0.50665724, 0.59718497, 0.47761119,
            0.74456659, 0.54239287, 0.26458416, 0.6484528 , 0.        ,
            0.78238332, 0.34128886, 0.71105301, 0.6072907 , 0.60451425],
           [0.78365838, 0.73832408, 0.6846376 , 0.56985902, 0.41395501,
            0.66598297, 0.63095451, 0.60315175, 0.760685  , 0.59594761,
            0.74085609, 0.58171126, 0.67648652, 0.57792025, 0.61449808,
            0.38343795, 0.83863407, 0.67683613, 0.80623937, 0.61837187,
            0.67758967, 0.70381394, 0.6016101 , 0.66393833, 0.83232179,
            0.5958486 , 0.64431027, 0.67227211, 0.67812743, 0.56251633,
            0.75346069, 0.79201156, 0.71951501, 0.56423167, 0.61666578,
            0.3985951 , 0.58632187, 0.71566805, 0.75326056, 0.71415521,
            0.45516913, 0.77805379, 0.7858236 , 0.62023256, 0.78238332,
            0.        , 0.82315609, 0.58205749, 0.57222587, 0.6439359 ],
           [0.5595118 , 0.5249023 , 0.6299952 , 0.81354451, 0.76598464,
            0.51287803, 0.72142122, 0.73531802, 0.60390149, 0.71938212,
            0.56655335, 0.66749991, 0.68954085, 0.74292444, 0.70373627,
            0.77206558, 0.42453805, 0.47639981, 0.53196653, 0.68002574,
            0.57965986, 0.64500833, 0.74786953, 0.58257533, 0.62585347,
            0.71931182, 0.61537065, 0.71347413, 0.47538349, 0.76216875,
            0.49422907, 0.7967669 , 0.82463754, 0.66558541, 0.60873528,
            0.75709859, 0.63548958, 0.50787979, 0.66352775, 0.58079603,
            0.80423414, 0.57264993, 0.43183661, 0.70119376, 0.34128886,
            0.82315609, 0.        , 0.72919412, 0.63137515, 0.57032285],
           [0.65595735, 0.65903214, 0.73267945, 0.4713116 , 0.4599957 ,
            0.67694211, 0.64897936, 0.67524082, 0.75326339, 0.64809185,
            0.68432466, 0.53165104, 0.65679384, 0.35008928, 0.59282877,
            0.47401472, 0.81625268, 0.67935579, 0.61709393, 0.60386228,
            0.71801785, 0.60000827, 0.67922102, 0.48716091, 0.66182664,
            0.64624193, 0.5119248 , 0.63027378, 0.60058541, 0.40432721,
            0.78826025, 0.73388422, 0.76994385, 0.58479063, 0.51845421,
            0.43877222, 0.54433169, 0.57689024, 0.72231914, 0.69616203,
            0.53131028, 0.67877744, 0.72211808, 0.61694053, 0.71105301,
            0.58205749, 0.72919412, 0.        , 0.57180209, 0.56526734],
           [0.76699768, 0.51425431, 0.56176866, 0.67154299, 0.51262628,
            0.45707354, 0.42138183, 0.40710483, 0.7396457 , 0.63947987,
            0.53455382, 0.61660851, 0.6222962 , 0.5920634 , 0.41013466,
            0.51761477, 0.65010933, 0.47216635, 0.7509491 , 0.60480355,
            0.45195709, 0.64705945, 0.67356188, 0.33966283, 0.65699223,
            0.37899726, 0.60545883, 0.68399482, 0.48895678, 0.5778413 ,
            0.62169599, 0.77003158, 0.74387829, 0.60411128, 0.58998822,
            0.60054366, 0.60544498, 0.53650475, 0.77032042, 0.69346674,
            0.5427576 , 0.76209126, 0.62745591, 0.63755881, 0.6072907 ,
            0.57222587, 0.63137515, 0.57180209, 0.        , 0.60181404],
           [0.58785136, 0.52994349, 0.7803162 , 0.6724758 , 0.55556972,
            0.4727473 , 0.69508686, 0.71009728, 0.58227692, 0.47358516,
            0.74031031, 0.40375049, 0.65522546, 0.58575473, 0.68929643,
            0.57391924, 0.63296562, 0.43646574, 0.56169757, 0.40452935,
            0.73298336, 0.63699363, 0.71887319, 0.60602366, 0.80580483,
            0.69127103, 0.29481067, 0.69942379, 0.49005443, 0.59516554,
            0.67492827, 0.78311563, 0.79616637, 0.39230145, 0.28130659,
            0.60158658, 0.35118352, 0.53750531, 0.64839601, 0.53960898,
            0.61246371, 0.58117572, 0.65225883, 0.67768377, 0.60451425,
            0.6439359 , 0.57032285, 0.56526734, 0.60181404, 0.        ]])





---



 ### Gower-Multiclass-Quantitative Similarity Coefficient   <a class="anchor" id="97.1"></a>

The Gower-Multiclass-Quantitative similarity between the elements $i$ and $j$ with respect to the variables $X_1,...,X_p$ is:



\begin{gather*}
S(i,j)_{GowerMQ}=\dfrac{\sum_{k=1}^{p_1} \left(1- \dfrac{\mid x_{ik} - x_{jk} \mid}{G_k} \right)   + \alpha_{ij} }{p_1 +   p_3}
\end{gather*}



Where:

$p_1 \hspace{0.05cm} $ is the number of quantitative variables

 
$p_3 \hspace{0.05cm}  $ is the number of multiple (non-binary) categorical variables

$p_1+p_3=p$

$G_k \hspace{0.05cm} $ is the range of the $k$-th quantitative variable  $\hspace{0.1cm} \left( G_k = max(X_k) - min(X_k) \right)$ 

 
 
$\alpha_{ij} \hspace{0.05cm} $ is the number of matches (coincidencias) between multiple non-binary categorical variables (there are $\hspace{0.05cm}  p_3 \hspace{0.05cm} $) for individuals $i$ and $j$




 ### Gower-Multiclass-Quantitative Distance   <a class="anchor" id="97.1.1"></a>



\begin{gather*}
\delta(i,j)_{GowerMQ} = \sqrt{1 - S(i,j)_{GowerMQ}}
\end{gather*}





---



 ### Gower-Multiclass-Quantitative Similarity in `Python`  <a class="anchor" id="97.2"></a>


```python
def alpha_py(i,j, Multiple_Categorical_Data):

                X = Multiple_Categorical_Data

                alpha = np.repeat(0, X.shape[1])

                for k in range(0, X.shape[1]) :

                    if X[i-1, k] == X[j-1, k] :

                        alpha[k] = 1

                    else :

                        alpha[k] = 0


                alpha = alpha.sum()

                return(alpha)
```


```python
def GowerMQ_Similarity_Python(i,j, MQ_Data_Set, p1, p3):

    X = MQ_Data_Set.to_numpy()

   # The data matrix X have to be order in the following way:
   # The p1 first are quantitative, the following p2 are binary categorical, and the following p3 are multiple categorical.

##########################################################################################
    def G(k, X):

        range = X[:,k].max() - X[:,k].min() 

        return(range)

    G_vector = np.repeat(0.5, p1)

    for r in range(0, p1):

        G_vector[r] = G(r, X)
##########################################################################################
    
    ones = np.repeat(1, p1)

    Quantitative_Data = X[: , 0:p1]
    
    Multiple_Categorical_Data = X[: , (p1):(p1+p3)]
 
    
##########################################################################################

    numerator_part_1 = ( ones - ( abs(Quantitative_Data[i-1,:] - Quantitative_Data[j-1,:]) / G_vector ) ).sum() 

    numerator_part_2 =   alpha_py(i,j, Multiple_Categorical_Data)

    numerator = numerator_part_1 + numerator_part_2

    denominator = p1 + p3

    Similarity_Gower = numerator / denominator  

    return(Similarity_Gower)
```


```python
MQ_Data_Py = Mixed_Data_Py.loc[:, ['X1', 'X2', 'X3', 'X4', 'X8', 'X9', 'X10'] ]

MQ_Data_Py.head()
```




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
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>X1</th>
      <th>X2</th>
      <th>X3</th>
      <th>X4</th>
      <th>X8</th>
      <th>X9</th>
      <th>X10</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>-6.284459</td>
      <td>-9.411280</td>
      <td>19.630820</td>
      <td>13.807247</td>
      <td>3.0</td>
      <td>1.0</td>
      <td>4.0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>24.960182</td>
      <td>-5.581823</td>
      <td>-19.668319</td>
      <td>14.255880</td>
      <td>3.0</td>
      <td>1.0</td>
      <td>3.0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>14.244677</td>
      <td>36.155683</td>
      <td>20.683970</td>
      <td>-11.178333</td>
      <td>3.0</td>
      <td>1.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>3</th>
      <td>-12.594421</td>
      <td>-1.970941</td>
      <td>48.974559</td>
      <td>-18.153030</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>1.0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>1.320996</td>
      <td>10.445248</td>
      <td>9.630610</td>
      <td>-5.294826</td>
      <td>2.0</td>
      <td>3.0</td>
      <td>2.0</td>
    </tr>
  </tbody>
</table>
</div>




```python
GowerMQ_Similarity_Python(1,2, MQ_Data_Py, 4, 3)
```




    0.7093036354516592






```python
def Sim_GowerMQ_Matrix_Python(MQ_Data,  p1, p3):

    M = np.zeros((MQ_Data.shape[0] , MQ_Data.shape[0]))

    for i in range(0 , MQ_Data.shape[0]):
        for j in range(0 , MQ_Data.shape[0]):

            M[i,j] = GowerMQ_Similarity_Python(i+1,j+1, MQ_Data, p1, p3)
                 
    return M
```


```python
Sim_GowerMQ_Matrix_Python(MQ_Data_Py, 4, 3)
```




    array([[1.        , 0.70930364, 0.6641863 , 0.56141487, 0.45369629,
            0.5374037 , 0.72279853, 0.49181517, 0.51448557, 0.54669408,
            0.50247454, 0.58411655, 0.39977911, 0.54015159, 0.58079948,
            0.57921662, 0.33503736, 0.66044548, 0.46471888, 0.38196255,
            0.67966509, 0.43803678, 0.58082676, 0.63665326, 0.64717302,
            0.41512653, 0.47949345, 0.49196643, 0.79105439, 0.79971545,
            0.40661191, 0.41369459, 0.37477467, 0.60405763, 0.45501393,
            0.44496865, 0.46149719, 0.5897251 , 0.5485067 , 0.44934022,
            0.57605094, 0.81422483, 0.48130792, 0.42091233, 0.49534247,
            0.33188449, 0.7328603 , 0.63184824, 0.41270942, 0.41932804],
           [0.70930364, 1.        , 0.60900144, 0.43090066, 0.39228905,
            0.55910602, 0.47980638, 0.5521916 , 0.65661713, 0.56711683,
            0.46045544, 0.50814346, 0.46902636, 0.42739944, 0.34454223,
            0.50700147, 0.44536887, 0.56194692, 0.43802845, 0.49436585,
            0.5633539 , 0.49596825, 0.34791616, 0.61682357, 0.50113104,
            0.36743882, 0.46045827, 0.51310414, 0.58009153, 0.59586859,
            0.42309255, 0.39263598, 0.33248188, 0.65743089, 0.43530198,
            0.38114211, 0.46449576, 0.54505517, 0.57219324, 0.45754262,
            0.55152698, 0.69983052, 0.38903225, 0.40084836, 0.44850257,
            0.31325702, 0.582512  , 0.70934715, 0.45030846, 0.43428413],
           [0.6641863 , 0.60900144, 1.        , 0.50655169, 0.45500468,
            0.58532229, 0.53524956, 0.58829706, 0.58617548, 0.55003173,
            0.38131848, 0.61870794, 0.54135391, 0.37178333, 0.46864193,
            0.63394614, 0.30831665, 0.55301533, 0.36842183, 0.39743561,
            0.61707611, 0.37159108, 0.47971516, 0.5475967 , 0.4585553 ,
            0.4051992 , 0.42665123, 0.43025763, 0.57705362, 0.48306467,
            0.44197832, 0.26180933, 0.38235343, 0.6117591 , 0.45640512,
            0.41643014, 0.41480124, 0.55599587, 0.6139578 , 0.43069179,
            0.56899965, 0.7829924 , 0.43429261, 0.49386736, 0.44621315,
            0.45591724, 0.51802828, 0.54047296, 0.58726441, 0.39213708],
           [0.56141487, 0.43090066, 0.50655169, 1.        , 0.41101039,
            0.42335427, 0.34102826, 0.56260324, 0.3952759 , 0.5941971 ,
            0.39729607, 0.67180067, 0.43062482, 0.53013789, 0.4844974 ,
            0.5292458 , 0.35868483, 0.33657441, 0.55310665, 0.43735071,
            0.4958849 , 0.62206173, 0.37852796, 0.51457477, 0.42044195,
            0.29591686, 0.37080717, 0.44361946, 0.56509485, 0.65368523,
            0.29703812, 0.3176386 , 0.42157583, 0.52166866, 0.53422915,
            0.57711701, 0.53338166, 0.44548403, 0.52005594, 0.47298769,
            0.46144567, 0.56051751, 0.68971041, 0.32453317, 0.52240295,
            0.48356628, 0.33992751, 0.55666265, 0.47211555, 0.32846691],
           [0.45369629, 0.39228905, 0.45500468, 0.41101039, 1.        ,
            0.43728355, 0.43776773, 0.43730713, 0.38498003, 0.45304152,
            0.64059951, 0.61103287, 0.44818586, 0.59856628, 0.58080838,
            0.67091648, 0.51910301, 0.47463097, 0.53474242, 0.74062603,
            0.51168308, 0.44059298, 0.65315705, 0.57106015, 0.52944074,
            0.73879359, 0.59297182, 0.65713383, 0.49564763, 0.45663142,
            0.4574563 , 0.80680464, 0.53093297, 0.6540102 , 0.62272571,
            0.46548325, 0.64207901, 0.57945932, 0.56852549, 0.63340587,
            0.46652531, 0.46127598, 0.62743294, 0.60572241, 0.47929956,
            0.59247391, 0.41445453, 0.56393641, 0.48967658, 0.450761  ],
           [0.5374037 , 0.55910602, 0.58532229, 0.42335427, 0.43728355,
            1.        , 0.57990605, 0.55419309, 0.49790681, 0.44211647,
            0.42608991, 0.60869646, 0.65947022, 0.39655941, 0.45676275,
            0.46553704, 0.43728007, 0.74894324, 0.70022942, 0.43017821,
            0.47974497, 0.61996052, 0.46709415, 0.45990775, 0.61314815,
            0.60169874, 0.47273937, 0.40830624, 0.42701056, 0.39216954,
            0.47852804, 0.31545172, 0.39584608, 0.47311418, 0.46055369,
            0.50011671, 0.56822401, 0.52117262, 0.40565695, 0.4843699 ,
            0.47429556, 0.53309083, 0.58888546, 0.6628835 , 0.6134898 ,
            0.7003408 , 0.59463115, 0.39975031, 0.64860344, 0.49116597],
           [0.72279853, 0.47980638, 0.53524956, 0.34102826, 0.43776773,
            0.57990605, 1.        , 0.39146037, 0.41692112, 0.44633929,
            0.43209392, 0.44867564, 0.40316336, 0.43253838, 0.61274947,
            0.46706755, 0.48106822, 0.62668442, 0.33687467, 0.37755976,
            0.55065432, 0.506547  , 0.62332911, 0.37281264, 0.53105901,
            0.47565847, 0.55167134, 0.46456543, 0.55520066, 0.55109593,
            0.59197141, 0.44084549, 0.61591638, 0.48925945, 0.52998602,
            0.34444007, 0.39384779, 0.6037729 , 0.41956996, 0.59369233,
            0.47569615, 0.60275782, 0.44706848, 0.45394626, 0.57422429,
            0.37438684, 0.76707251, 0.35464676, 0.42051345, 0.51851052],
           [0.49181517, 0.5521916 , 0.58829706, 0.56260324, 0.43730713,
            0.55419309, 0.39146037, 1.        , 0.67367828, 0.6594068 ,
            0.41791205, 0.70931742, 0.41491251, 0.35097087, 0.4347891 ,
            0.60478601, 0.3640194 , 0.36777296, 0.43824308, 0.48348292,
            0.57395386, 0.51954818, 0.46978957, 0.61741796, 0.28184533,
            0.43206283, 0.35361534, 0.54755521, 0.68486258, 0.52807789,
            0.50423648, 0.3399537 , 0.4392636 , 0.60204326, 0.38228954,
            0.33960074, 0.43402867, 0.31321928, 0.58086326, 0.42354905,
            0.63004994, 0.49939486, 0.54120467, 0.44428383, 0.52565736,
            0.54613502, 0.31795518, 0.46743707, 0.43019907, 0.4971188 ],
           [0.51448557, 0.65661713, 0.58617548, 0.3952759 , 0.38498003,
            0.49790681, 0.41692112, 0.67367828, 1.        , 0.53267531,
            0.3737864 , 0.58061809, 0.45190043, 0.40072159, 0.48220707,
            0.57120641, 0.43642689, 0.3897072 , 0.38643676, 0.3778747 ,
            0.5702986 , 0.41242693, 0.42644627, 0.71754366, 0.31348543,
            0.47920666, 0.45304015, 0.66594215, 0.68464647, 0.48272317,
            0.43884156, 0.33581678, 0.4451427 , 0.72429465, 0.43247531,
            0.32283589, 0.37306336, 0.35023711, 0.69222442, 0.44550518,
            0.57089438, 0.48672443, 0.4198512 , 0.49354334, 0.44430152,
            0.362323  , 0.40247739, 0.65738623, 0.45344278, 0.56724759],
           [0.54669408, 0.56711683, 0.55003173, 0.5941971 , 0.45304152,
            0.44211647, 0.44633929, 0.6594068 , 0.53267531, 1.        ,
            0.60530846, 0.59418892, 0.58855018, 0.67902366, 0.58564651,
            0.75543796, 0.53765706, 0.37526843, 0.32616646, 0.63338015,
            0.58144932, 0.5503287 , 0.49508504, 0.50534133, 0.33672424,
            0.47433801, 0.527253  , 0.43629192, 0.55785679, 0.72553954,
            0.66526232, 0.39483261, 0.59685511, 0.63477272, 0.53264215,
            0.63281049, 0.58438128, 0.32071475, 0.57650498, 0.59718672,
            0.81892379, 0.55427377, 0.57198519, 0.46770339, 0.41358073,
            0.41077334, 0.34115722, 0.49821759, 0.59193362, 0.52340632],
           [0.50247454, 0.46045544, 0.38131848, 0.39729607, 0.64059951,
            0.42608991, 0.43209392, 0.41791205, 0.3737864 , 0.60530846,
            1.        , 0.44410587, 0.46190018, 0.78800091, 0.56961475,
            0.6045152 , 0.38996018, 0.43780178, 0.43514371, 0.59377373,
            0.59637524, 0.50302452, 0.74460357, 0.47146145, 0.43536185,
            0.46031942, 0.61116586, 0.62407727, 0.51415256, 0.53031762,
            0.75688491, 0.58908701, 0.40730996, 0.48268973, 0.4578604 ,
            0.58910626, 0.53045122, 0.41986766, 0.39745208, 0.49970979,
            0.77147373, 0.50703263, 0.61623931, 0.58572947, 0.63571199,
            0.38751488, 0.44031013, 0.45645581, 0.47004474, 0.59585327],
           [0.58411655, 0.50814346, 0.61870794, 0.67180067, 0.61103287,
            0.60869646, 0.44867564, 0.70931742, 0.58061809, 0.59418892,
            0.44410587, 1.        , 0.44049594, 0.43457072, 0.50775818,
            0.79641953, 0.35031582, 0.39801189, 0.72892566, 0.43460152,
            0.60769607, 0.55644739, 0.48471338, 0.59181757, 0.41127593,
            0.5942267 , 0.61769209, 0.4679715 , 0.62796373, 0.54585206,
            0.47352368, 0.46745386, 0.38636607, 0.80664577, 0.48010005,
            0.40603159, 0.45088955, 0.44081155, 0.77833549, 0.47269096,
            0.6076727 , 0.5600655 , 0.67272753, 0.50987536, 0.63106946,
            0.71063872, 0.4126437 , 0.75811965, 0.47755521, 0.43269513],
           [0.39977911, 0.46902636, 0.54135391, 0.43062482, 0.44818586,
            0.65947022, 0.40316336, 0.41491251, 0.45190043, 0.58855018,
            0.46190018, 0.44049594, 1.        , 0.5446491 , 0.55361351,
            0.43935394, 0.62410559, 0.62720381, 0.56464283, 0.62785084,
            0.49570638, 0.66346023, 0.42312578, 0.46717831, 0.47552356,
            0.57651009, 0.47797192, 0.41557679, 0.43428111, 0.57889897,
            0.4821046 , 0.36822921, 0.54024178, 0.44692622, 0.61068139,
            0.6502444 , 0.75438602, 0.38558603, 0.36168857, 0.65644605,
            0.47583412, 0.54036138, 0.59411801, 0.61891513, 0.47586521,
            0.53132379, 0.45023545, 0.40702087, 0.95408951, 0.48962741],
           [0.54015159, 0.42739944, 0.37178333, 0.53013789, 0.59856628,
            0.39655941, 0.43253838, 0.35097087, 0.40072159, 0.67902366,
            0.78800091, 0.43457072, 0.5446491 , 1.        , 0.7417155 ,
            0.58122947, 0.50698767, 0.37674404, 0.4580302 , 0.66968969,
            0.39596365, 0.58290677, 0.56649624, 0.48710743, 0.48419241,
            0.4442197 , 0.61888083, 0.61224812, 0.50735295, 0.64878897,
            0.5514819 , 0.56105659, 0.52213668, 0.4598572 , 0.59118239,
            0.73269578, 0.60636718, 0.44017928, 0.38571617, 0.60248876,
            0.56890145, 0.50593509, 0.76033352, 0.42292518, 0.4939379 ,
            0.33389733, 0.44915886, 0.48448623, 0.55757941, 0.56419803],
           [0.58079948, 0.34454223, 0.46864193, 0.4844974 , 0.58080838,
            0.45676275, 0.61274947, 0.4347891 , 0.48220707, 0.58564651,
            0.56961475, 0.50775818, 0.55361351, 0.7417155 , 1.        ,
            0.48079039, 0.49537919, 0.49142027, 0.39595722, 0.67086705,
            0.55824732, 0.51414001, 0.76513176, 0.41554814, 0.40270694,
            0.48941709, 0.45551254, 0.58060415, 0.58101161, 0.67855152,
            0.48144513, 0.48888436, 0.5928936 , 0.49155157, 0.57350844,
            0.50378416, 0.54429794, 0.37714116, 0.49041497, 0.60128533,
            0.48100844, 0.39683849, 0.79186531, 0.49049469, 0.46225799,
            0.39150824, 0.50605209, 0.41372931, 0.57096359, 0.38324638],
           [0.57921662, 0.50700147, 0.63394614, 0.5292458 , 0.67091648,
            0.46553704, 0.46706755, 0.60478601, 0.57120641, 0.75543796,
            0.6045152 , 0.79641953, 0.43935394, 0.58122947, 0.48079039,
            1.        , 0.34917382, 0.43920132, 0.52534519, 0.43829278,
            0.6488855 , 0.41244825, 0.53596586, 0.56166292, 0.36924679,
            0.6126186 , 0.72643174, 0.49693987, 0.62910754, 0.56340425,
            0.62493518, 0.48500605, 0.40475798, 0.83229699, 0.47047134,
            0.59165824, 0.47107713, 0.42241964, 0.74681228, 0.47154896,
            0.76892175, 0.57761769, 0.48544963, 0.50623449, 0.46990232,
            0.60981072, 0.40505729, 0.69739632, 0.48526444, 0.5758514 ],
           [0.33503736, 0.44536887, 0.30831665, 0.35868483, 0.51910301,
            0.43728007, 0.48106822, 0.3640194 , 0.43642689, 0.53765706,
            0.38996018, 0.35031582, 0.62410559, 0.50698767, 0.49537919,
            0.34917382, 1.        , 0.45068184, 0.3498457 , 0.72760192,
            0.40552625, 0.73437738, 0.33294565, 0.53809545, 0.41975151,
            0.56672545, 0.55930623, 0.3436368 , 0.36234112, 0.5073166 ,
            0.55097919, 0.54134588, 0.81288126, 0.3567461 , 0.82445568,
            0.43544726, 0.68244602, 0.59936032, 0.27150845, 0.87762486,
            0.39369933, 0.32556424, 0.51691889, 0.528735  , 0.55056759,
            0.29828652, 0.56048148, 0.33508087, 0.5781951 , 0.59987344],
           [0.66044548, 0.56194692, 0.55301533, 0.33657441, 0.47463097,
            0.74894324, 0.62668442, 0.36777296, 0.3897072 , 0.37526843,
            0.43780178, 0.39801189, 0.62720381, 0.37674404, 0.49142027,
            0.43920132, 0.45068184, 1.        , 0.54288788, 0.43024127,
            0.64745867, 0.49455009, 0.55635945, 0.44580311, 0.59333279,
            0.51431686, 0.452924  , 0.42804609, 0.5836768 , 0.53954797,
            0.39746033, 0.31829262, 0.31030273, 0.41435545, 0.48379837,
            0.55619399, 0.61414168, 0.57022118, 0.32887074, 0.46023332,
            0.38875221, 0.52516803, 0.39810938, 0.57235416, 0.45081729,
            0.5429852 , 0.77341279, 0.39668781, 0.6347424 , 0.52400498],
           [0.46471888, 0.43802845, 0.36842183, 0.55310665, 0.53474242,
            0.70022942, 0.33687467, 0.43824308, 0.38643676, 0.32616646,
            0.43514371, 0.72892566, 0.56464283, 0.4580302 , 0.39595722,
            0.52534519, 0.3498457 , 0.54288788, 1.        , 0.37325417,
            0.40457177, 0.60619346, 0.35649618, 0.5256562 , 0.60019962,
            0.62528287, 0.64234619, 0.40224806, 0.46766622, 0.4264544 ,
            0.36172271, 0.45634216, 0.2745651 , 0.53557143, 0.48344528,
            0.54830436, 0.57454658, 0.52574653, 0.52431719, 0.4244957 ,
            0.35301459, 0.43410623, 0.60409191, 0.56538782, 0.61979324,
            0.72984037, 0.47244556, 0.6738829 , 0.57947259, 0.44462758],
           [0.38196255, 0.49436585, 0.39743561, 0.43735071, 0.74062603,
            0.43017821, 0.37755976, 0.48348292, 0.3778747 , 0.63338015,
            0.59377373, 0.43460152, 0.62785084, 0.66968969, 0.67086705,
            0.43829278, 0.72760192, 0.43024127, 0.37325417, 1.        ,
            0.47531587, 0.59741641, 0.56492176, 0.55242905, 0.457707  ,
            0.55090649, 0.43148357, 0.56515982, 0.441007  , 0.56108242,
            0.4751362 , 0.65867251, 0.65880669, 0.44586506, 0.73047214,
            0.51411314, 0.7611119 , 0.51854474, 0.36062741, 0.78148664,
            0.45568201, 0.38954224, 0.7191586 , 0.59861707, 0.45804865,
            0.38740548, 0.39582342, 0.40244816, 0.63469965, 0.43212989],
           [0.67966509, 0.5633539 , 0.61707611, 0.4958849 , 0.51168308,
            0.47974497, 0.55065432, 0.57395386, 0.5702986 , 0.58144932,
            0.59637524, 0.60769607, 0.49570638, 0.39596365, 0.55824732,
            0.6488855 , 0.40552625, 0.64745867, 0.40457177, 0.47531587,
            1.        , 0.46880068, 0.76604364, 0.58374664, 0.32683811,
            0.43828676, 0.46280117, 0.45453119, 0.74575355, 0.69812143,
            0.60364123, 0.33400894, 0.37362648, 0.62403964, 0.49255506,
            0.42979019, 0.48700085, 0.44658364, 0.53855493, 0.50292712,
            0.73779025, 0.54438763, 0.44543256, 0.6391812 , 0.61289404,
            0.46418884, 0.56999816, 0.55876456, 0.53938489, 0.46344749],
           [0.43803678, 0.49596825, 0.37159108, 0.62206173, 0.44059298,
            0.61996052, 0.506547  , 0.51954818, 0.41242693, 0.5503287 ,
            0.50302452, 0.55644739, 0.66346023, 0.58290677, 0.51414001,
            0.41244825, 0.73437738, 0.49455009, 0.60619346, 0.59741641,
            0.46880068, 1.        , 0.39622008, 0.50910869, 0.37092409,
            0.39417945, 0.63005604, 0.41855092, 0.48510659, 0.61642645,
            0.5766101 , 0.38551526, 0.63230964, 0.42002053, 0.76932019,
            0.55821274, 0.65565683, 0.57926866, 0.33478288, 0.76999753,
            0.42504483, 0.44561647, 0.70654339, 0.44915229, 0.76616773,
            0.50441809, 0.64388188, 0.45784635, 0.64146953, 0.65260159],
           [0.58082676, 0.34791616, 0.47971516, 0.37852796, 0.65315705,
            0.46709415, 0.62332911, 0.46978957, 0.42644627, 0.49508504,
            0.74460357, 0.48471338, 0.42312578, 0.56649624, 0.76513176,
            0.53596586, 0.33294565, 0.55635945, 0.35649618, 0.56492176,
            0.76604364, 0.39622008, 1.        , 0.39281391, 0.37085693,
            0.48050592, 0.41472558, 0.64140715, 0.60311568, 0.57070072,
            0.63279588, 0.49637989, 0.44022068, 0.53521046, 0.44447947,
            0.41333839, 0.45484897, 0.38695693, 0.48369834, 0.4553208 ,
            0.65353204, 0.44554931, 0.60231491, 0.64718864, 0.5867676 ,
            0.45644742, 0.52192257, 0.38569017, 0.46903627, 0.4153719 ],
           [0.63665326, 0.61682357, 0.5475967 , 0.51457477, 0.57106015,
            0.45990775, 0.37281264, 0.61741796, 0.71754366, 0.50534133,
            0.47146145, 0.59181757, 0.46717831, 0.48710743, 0.41554814,
            0.56166292, 0.53809545, 0.44580311, 0.5256562 , 0.55242905,
            0.58374664, 0.50910869, 0.39281391, 1.        , 0.57610111,
            0.5183637 , 0.53146417, 0.58142293, 0.78969824, 0.59838878,
            0.39766068, 0.49228013, 0.45336022, 0.57188916, 0.66183323,
            0.44176495, 0.61086431, 0.63269344, 0.5130102 , 0.60329081,
            0.5318097 , 0.60642037, 0.46509439, 0.60170555, 0.51287407,
            0.33758667, 0.51821793, 0.65412828, 0.47293318, 0.6332571 ],
           [0.64717302, 0.50113104, 0.4585553 , 0.42044195, 0.52944074,
            0.61314815, 0.53105901, 0.28184533, 0.31348543, 0.33672424,
            0.43536185, 0.41127593, 0.47552356, 0.48419241, 0.40270694,
            0.36924679, 0.41975151, 0.59333279, 0.60019962, 0.457707  ,
            0.32683811, 0.37092409, 0.37085693, 0.57610111, 1.        ,
            0.64269783, 0.42612307, 0.43411435, 0.43822741, 0.46805316,
            0.33949922, 0.50766936, 0.46874944, 0.39408779, 0.53810585,
            0.5207131 , 0.68009878, 0.72520585, 0.39272213, 0.53336322,
            0.36608111, 0.61351562, 0.45283412, 0.63951393, 0.42822978,
            0.40762894, 0.52289047, 0.48235926, 0.48845387, 0.35221535],
           [0.41512653, 0.36743882, 0.4051992 , 0.29591686, 0.73879359,
            0.60169874, 0.47565847, 0.43206283, 0.47920666, 0.47433801,
            0.46031942, 0.5942267 , 0.57651009, 0.4442197 , 0.48941709,
            0.6126186 , 0.56672545, 0.51431686, 0.62528287, 0.55090649,
            0.43828676, 0.39417945, 0.48050592, 0.5183637 , 0.64269783,
            1.        , 0.55436525, 0.42372597, 0.41503743, 0.42639905,
            0.48971672, 0.71301146, 0.6446807 , 0.63139105, 0.53267994,
            0.48999113, 0.71005166, 0.46360967, 0.56192586, 0.62418192,
            0.50707294, 0.40565342, 0.44976239, 0.75246733, 0.43406106,
            0.69652541, 0.341195  , 0.50019782, 0.5919714 , 0.38058696],
           [0.47949345, 0.46045827, 0.42665123, 0.37080717, 0.59297182,
            0.47273937, 0.55167134, 0.35361534, 0.45304015, 0.527253  ,
            0.61116586, 0.61769209, 0.47797192, 0.61888083, 0.45551254,
            0.72643174, 0.55930623, 0.452924  , 0.64234619, 0.43148357,
            0.46280117, 0.63005604, 0.41472558, 0.53146417, 0.42612307,
            0.55436525, 1.        , 0.46047746, 0.49643321, 0.43438834,
            0.70652171, 0.50890683, 0.48936177, 0.59380083, 0.68341135,
            0.56021535, 0.46758567, 0.61148267, 0.53888472, 0.63929237,
            0.55998794, 0.43838961, 0.49858088, 0.48076008, 0.68510084,
            0.50235548, 0.62196812, 0.6329175 , 0.49090223, 0.78323514],
           [0.49196643, 0.51310414, 0.43025763, 0.44361946, 0.65713383,
            0.40830624, 0.46456543, 0.54755521, 0.66594215, 0.43629192,
            0.62407727, 0.4679715 , 0.41557679, 0.61224812, 0.58060415,
            0.49693987, 0.3436368 , 0.42804609, 0.40224806, 0.56515982,
            0.45453119, 0.41855092, 0.64140715, 0.58142293, 0.43411435,
            0.42372597, 0.46047746, 1.        , 0.64729832, 0.45017442,
            0.42484723, 0.54583741, 0.40225586, 0.64947777, 0.49023135,
            0.44040998, 0.47717981, 0.42492175, 0.58488502, 0.45793965,
            0.44639764, 0.49559191, 0.62722871, 0.45234228, 0.48966234,
            0.39246488, 0.42213099, 0.57429919, 0.45706751, 0.58195407],
           [0.79105439, 0.58009153, 0.57705362, 0.56509485, 0.49564763,
            0.42701056, 0.55520066, 0.68486258, 0.68464647, 0.55785679,
            0.51415256, 0.62796373, 0.43428111, 0.50735295, 0.58101161,
            0.62910754, 0.36234112, 0.5836768 , 0.46766622, 0.441007  ,
            0.74575355, 0.48510659, 0.60311568, 0.78969824, 0.43822741,
            0.41503743, 0.49643321, 0.64729832, 1.        , 0.76315391,
            0.43719155, 0.38895386, 0.35003395, 0.63736979, 0.51073839,
            0.49235357, 0.52758565, 0.47714367, 0.56131922, 0.47664398,
            0.57134058, 0.63451021, 0.48770071, 0.4710466 , 0.52097935,
            0.39797295, 0.63197552, 0.63971735, 0.47577184, 0.61783749],
           [0.79971545, 0.59586859, 0.48306467, 0.65368523, 0.45663142,
            0.39216954, 0.55109593, 0.52807789, 0.48272317, 0.72553954,
            0.53031762, 0.54585206, 0.57889897, 0.64878897, 0.67855152,
            0.56340425, 0.5073166 , 0.53954797, 0.4264544 , 0.56108242,
            0.69812143, 0.61642645, 0.57070072, 0.59838878, 0.46805316,
            0.42639905, 0.43438834, 0.45017442, 0.76315391, 1.        ,
            0.44287464, 0.43079438, 0.53473161, 0.58559129, 0.55960659,
            0.56924932, 0.63969201, 0.40860348, 0.50926352, 0.60864656,
            0.61007744, 0.65241164, 0.58231893, 0.40176137, 0.45893448,
            0.34640393, 0.56321977, 0.59829245, 0.57179093, 0.41188518],
           [0.40661191, 0.42309255, 0.44197832, 0.29703812, 0.4574563 ,
            0.47852804, 0.59197141, 0.50423648, 0.43884156, 0.66526232,
            0.75688491, 0.47352368, 0.4821046 , 0.5514819 , 0.48144513,
            0.62493518, 0.55097919, 0.39746033, 0.36172271, 0.4751362 ,
            0.60364123, 0.5766101 , 0.63279588, 0.39766068, 0.33949922,
            0.48971672, 0.70652171, 0.42484723, 0.43719155, 0.44287464,
            1.        , 0.39125958, 0.61224192, 0.48965517, 0.55483406,
            0.51214525, 0.46371604, 0.48576379, 0.43481498, 0.63359828,
            0.83056097, 0.40677468, 0.45809367, 0.64113844, 0.73570659,
            0.43296524, 0.50620626, 0.3794948 , 0.47126838, 0.68845537],
           [0.41369459, 0.39263598, 0.26180933, 0.3176386 , 0.80680464,
            0.31545172, 0.44084549, 0.3399537 , 0.33581678, 0.39483261,
            0.58908701, 0.46745386, 0.36822921, 0.56105659, 0.48888436,
            0.48500605, 0.54134588, 0.31829262, 0.45634216, 0.65867251,
            0.33400894, 0.38551526, 0.49637989, 0.49228013, 0.50766936,
            0.71301146, 0.50890683, 0.54583741, 0.38895386, 0.43079438,
            0.39125958, 1.        , 0.59374162, 0.50719309, 0.48120839,
            0.32105042, 0.55833549, 0.4375261 , 0.43184402, 0.54536754,
            0.40709539, 0.43955981, 0.50750238, 0.46622031, 0.3839639 ,
            0.41086287, 0.31511143, 0.47411425, 0.35053558, 0.33348698],
           [0.37477467, 0.33248188, 0.38235343, 0.42157583, 0.53093297,
            0.39584608, 0.61591638, 0.4392636 , 0.4451427 , 0.59685511,
            0.40730996, 0.38636607, 0.54024178, 0.52213668, 0.5928936 ,
            0.40475798, 0.81288126, 0.31030273, 0.2745651 , 0.65880669,
            0.37362648, 0.63230964, 0.44022068, 0.45336022, 0.46874944,
            0.6446807 , 0.48936177, 0.40225586, 0.35003395, 0.53473161,
            0.61224192, 0.59374162, 1.        , 0.42694988, 0.75339074,
            0.42498765, 0.66227272, 0.54146333, 0.40953097, 0.8500694 ,
            0.48883897, 0.40063989, 0.52761605, 0.55398083, 0.51191472,
            0.34580764, 0.41904866, 0.29233719, 0.52696792, 0.45844062],
           [0.60405763, 0.65743089, 0.6117591 , 0.52166866, 0.6540102 ,
            0.47311418, 0.48925945, 0.60204326, 0.72429465, 0.63477272,
            0.48268973, 0.80664577, 0.44692622, 0.4598572 , 0.49155157,
            0.83229699, 0.3567461 , 0.41435545, 0.53557143, 0.44586506,
            0.62403964, 0.42002053, 0.53521046, 0.57188916, 0.39408779,
            0.63139105, 0.59380083, 0.64947777, 0.63736979, 0.58559129,
            0.48965517, 0.50719309, 0.42694988, 1.        , 0.469298  ,
            0.4266092 , 0.46723311, 0.40022774, 0.91451529, 0.47912124,
            0.6482565 , 0.59980473, 0.49567588, 0.5164656 , 0.48012856,
            0.58496972, 0.41528353, 0.85047971, 0.49283671, 0.44056653],
           [0.45501393, 0.43530198, 0.45640512, 0.53422915, 0.62272571,
            0.46055369, 0.52998602, 0.38228954, 0.43247531, 0.53264215,
            0.4578604 , 0.48010005, 0.61068139, 0.59118239, 0.57350844,
            0.47047134, 0.82445568, 0.48379837, 0.48344528, 0.73047214,
            0.49255506, 0.76932019, 0.44447947, 0.66183323, 0.53810585,
            0.53267994, 0.68341135, 0.49023135, 0.51073839, 0.55960659,
            0.55483406, 0.48120839, 0.75339074, 0.469298  , 1.        ,
            0.58395612, 0.77704072, 0.77490465, 0.41095891, 0.90332133,
            0.40326879, 0.43096289, 0.62305469, 0.62798133, 0.66867306,
            0.38925223, 0.63004311, 0.48431801, 0.65217211, 0.64700905],
           [0.44496865, 0.38114211, 0.41643014, 0.57711701, 0.46548325,
            0.50011671, 0.34444007, 0.33960074, 0.32283589, 0.63281049,
            0.58910626, 0.40603159, 0.6502444 , 0.73269578, 0.50378416,
            0.59165824, 0.43544726, 0.55619399, 0.54830436, 0.51411314,
            0.42979019, 0.55821274, 0.41333839, 0.44176495, 0.5207131 ,
            0.48999113, 0.56021535, 0.44040998, 0.49235357, 0.56924932,
            0.51214525, 0.32105042, 0.42498765, 0.4266092 , 0.58395612,
            1.        , 0.75300124, 0.45016411, 0.34123463, 0.54975012,
            0.50343713, 0.44060562, 0.55333041, 0.54357827, 0.44190435,
            0.60120155, 0.4279259 , 0.4346412 , 0.69173513, 0.54808649],
           [0.46149719, 0.46449576, 0.41480124, 0.53338166, 0.64207901,
            0.56822401, 0.39384779, 0.43402867, 0.37306336, 0.58438128,
            0.53045122, 0.45088955, 0.75438602, 0.60636718, 0.54429794,
            0.47107713, 0.68244602, 0.61414168, 0.57454658, 0.7611119 ,
            0.48700085, 0.65565683, 0.45484897, 0.61086431, 0.68009878,
            0.71005166, 0.46758567, 0.47717981, 0.52758565, 0.63969201,
            0.46371604, 0.55833549, 0.66227272, 0.46723311, 0.77704072,
            0.75300124, 1.        , 0.59347633, 0.3817484 , 0.78470103,
            0.45500792, 0.46907688, 0.59384418, 0.73666287, 0.49213181,
            0.56304698, 0.45425868, 0.46088343, 0.77676343, 0.46659043],
           [0.5897251 , 0.54505517, 0.55599587, 0.44548403, 0.57945932,
            0.52117262, 0.6037729 , 0.31321928, 0.35023711, 0.32071475,
            0.41986766, 0.44081155, 0.38558603, 0.44017928, 0.37714116,
            0.42241964, 0.59936032, 0.57022118, 0.52574653, 0.51854474,
            0.44658364, 0.57926866, 0.38695693, 0.63269344, 0.72520585,
            0.46360967, 0.61148267, 0.42492175, 0.47714367, 0.40860348,
            0.48576379, 0.4375261 , 0.54146333, 0.40022774, 0.77490465,
            0.45016411, 0.59347633, 1.        , 0.38872644, 0.69139393,
            0.33419853, 0.56567406, 0.44241871, 0.55891107, 0.60097718,
            0.34598584, 0.74290302, 0.52459674, 0.42707676, 0.56914241],
           [0.5485067 , 0.57219324, 0.6139578 , 0.52005594, 0.56852549,
            0.40565695, 0.41956996, 0.58086326, 0.69222442, 0.57650498,
            0.39745208, 0.77833549, 0.36168857, 0.38571617, 0.49041497,
            0.74681228, 0.27150845, 0.32887074, 0.52431719, 0.36062741,
            0.53855493, 0.33478288, 0.48369834, 0.5130102 , 0.39272213,
            0.56192586, 0.53888472, 0.58488502, 0.56131922, 0.50926352,
            0.43481498, 0.43184402, 0.40953097, 0.91451529, 0.41095891,
            0.34123463, 0.3817484 , 0.38872644, 1.        , 0.39388359,
            0.59209483, 0.52445566, 0.46887527, 0.45705916, 0.40940495,
            0.51467299, 0.33836294, 0.83922547, 0.40759907, 0.35532888],
           [0.44934022, 0.45754262, 0.43069179, 0.47298769, 0.63340587,
            0.4843699 , 0.59369233, 0.42354905, 0.44550518, 0.59718672,
            0.49970979, 0.47269096, 0.65644605, 0.60248876, 0.60128533,
            0.47154896, 0.87762486, 0.46023332, 0.4244957 , 0.78148664,
            0.50292712, 0.76999753, 0.4553208 , 0.60329081, 0.53336322,
            0.62418192, 0.63929237, 0.45793965, 0.47664398, 0.60864656,
            0.63359828, 0.54536754, 0.8500694 , 0.47912124, 0.90332133,
            0.54975012, 0.78470103, 0.69139393, 0.39388359, 1.        ,
            0.4870645 , 0.4398671 , 0.63929404, 0.63513849, 0.66184531,
            0.42066166, 0.56897925, 0.44226779, 0.6623109 , 0.60837122],
           [0.57605094, 0.55152698, 0.56899965, 0.46144567, 0.46652531,
            0.47429556, 0.47569615, 0.63004994, 0.57089438, 0.81892379,
            0.77147373, 0.6076727 , 0.47583412, 0.56890145, 0.48100844,
            0.76892175, 0.39369933, 0.38875221, 0.35301459, 0.45568201,
            0.73779025, 0.42504483, 0.65353204, 0.5318097 , 0.36608111,
            0.50707294, 0.55998794, 0.44639764, 0.57134058, 0.61007744,
            0.83056097, 0.40709539, 0.48883897, 0.6482565 , 0.40326879,
            0.50343713, 0.45500792, 0.33419853, 0.59209483, 0.4870645 ,
            1.        , 0.57118223, 0.46186298, 0.63055349, 0.58917281,
            0.42425712, 0.354641  , 0.51364382, 0.46256026, 0.53689011],
           [0.81422483, 0.69983052, 0.7829924 , 0.56051751, 0.46127598,
            0.53309083, 0.60275782, 0.49939486, 0.48672443, 0.55427377,
            0.50703263, 0.5600655 , 0.54036138, 0.50593509, 0.39683849,
            0.57761769, 0.32556424, 0.52516803, 0.43410623, 0.38954224,
            0.54438763, 0.44561647, 0.44554931, 0.60642037, 0.61351562,
            0.40565342, 0.43838961, 0.49559191, 0.63451021, 0.65241164,
            0.40677468, 0.43955981, 0.40063989, 0.59980473, 0.43096289,
            0.44060562, 0.46907688, 0.56567406, 0.52445566, 0.4398671 ,
            0.57118223, 1.        , 0.44346305, 0.41597481, 0.46293574,
            0.33946418, 0.57743321, 0.60598302, 0.56314625, 0.42609862],
           [0.48130792, 0.38903225, 0.43429261, 0.68971041, 0.62743294,
            0.58888546, 0.44706848, 0.54120467, 0.4198512 , 0.57198519,
            0.61623931, 0.67272753, 0.59411801, 0.76033352, 0.79186531,
            0.48544963, 0.51691889, 0.39810938, 0.60409191, 0.7191586 ,
            0.44543256, 0.70654339, 0.60231491, 0.46509439, 0.45283412,
            0.44976239, 0.49858088, 0.62722871, 0.48770071, 0.58231893,
            0.45809367, 0.50750238, 0.52761605, 0.49567588, 0.62305469,
            0.55333041, 0.59384418, 0.44241871, 0.46887527, 0.63929404,
            0.46186298, 0.44346305, 1.        , 0.47239409, 0.65466138,
            0.52622339, 0.41274119, 0.47900685, 0.60704832, 0.43279262],
           [0.42091233, 0.40084836, 0.49386736, 0.32453317, 0.60572241,
            0.6628835 , 0.45394626, 0.44428383, 0.49354334, 0.46770339,
            0.58572947, 0.50987536, 0.61891513, 0.42292518, 0.49049469,
            0.50623449, 0.528735  , 0.57235416, 0.56538782, 0.59861707,
            0.6391812 , 0.44915229, 0.64718864, 0.60170555, 0.63951393,
            0.75246733, 0.48076008, 0.45234228, 0.4710466 , 0.40176137,
            0.64113844, 0.46622031, 0.55398083, 0.5164656 , 0.62798133,
            0.54357827, 0.73666287, 0.55891107, 0.45705916, 0.63513849,
            0.63055349, 0.41597481, 0.47239409, 1.        , 0.63985557,
            0.58306537, 0.4364964 , 0.44286895, 0.65189748, 0.46418026],
           [0.49534247, 0.44850257, 0.44621315, 0.52240295, 0.47929956,
            0.6134898 , 0.57422429, 0.52565736, 0.44430152, 0.41358073,
            0.63571199, 0.63106946, 0.47586521, 0.4939379 , 0.46225799,
            0.46990232, 0.55056759, 0.45081729, 0.61979324, 0.45804865,
            0.61289404, 0.76616773, 0.5867676 , 0.51287407, 0.42822978,
            0.43406106, 0.68510084, 0.48966234, 0.52097935, 0.45893448,
            0.73570659, 0.3839639 , 0.51191472, 0.48012856, 0.66867306,
            0.44190435, 0.49213181, 0.60097718, 0.40940495, 0.66184531,
            0.58917281, 0.46293574, 0.65466138, 0.63985557, 1.        ,
            0.53154036, 0.61522267, 0.49470819, 0.48879552, 0.6352741 ],
           [0.33188449, 0.31325702, 0.45591724, 0.48356628, 0.59247391,
            0.7003408 , 0.37438684, 0.54613502, 0.362323  , 0.41077334,
            0.38751488, 0.71063872, 0.53132379, 0.33389733, 0.39150824,
            0.60981072, 0.29828652, 0.5429852 , 0.72984037, 0.38740548,
            0.46418884, 0.50441809, 0.45644742, 0.33758667, 0.40762894,
            0.69652541, 0.50235548, 0.39246488, 0.39797295, 0.34640393,
            0.43296524, 0.41086287, 0.34580764, 0.58496972, 0.38925223,
            0.60120155, 0.56304698, 0.34598584, 0.51467299, 0.42066166,
            0.42425712, 0.33946418, 0.52622339, 0.58306537, 0.53154036,
            1.        , 0.32383818, 0.47332007, 0.57723428, 0.36014466],
           [0.7328603 , 0.582512  , 0.51802828, 0.33992751, 0.41445453,
            0.59463115, 0.76707251, 0.31795518, 0.40247739, 0.34115722,
            0.44031013, 0.4126437 , 0.45023545, 0.44915886, 0.50605209,
            0.40505729, 0.56048148, 0.77341279, 0.47244556, 0.39582342,
            0.56999816, 0.64388188, 0.52192257, 0.51821793, 0.52289047,
            0.341195  , 0.62196812, 0.42213099, 0.63197552, 0.56321977,
            0.50620626, 0.31511143, 0.41904866, 0.41528353, 0.63004311,
            0.4279259 , 0.45425868, 0.74290302, 0.33836294, 0.56897925,
            0.354641  , 0.57743321, 0.41274119, 0.4364964 , 0.61522267,
            0.32383818, 1.        , 0.46910263, 0.45918469, 0.67489375],
           [0.63184824, 0.70934715, 0.54047296, 0.55666265, 0.56393641,
            0.39975031, 0.35464676, 0.46743707, 0.65738623, 0.49821759,
            0.45645581, 0.75811965, 0.40702087, 0.48448623, 0.41372931,
            0.69739632, 0.33508087, 0.39668781, 0.6738829 , 0.40244816,
            0.55876456, 0.45784635, 0.38569017, 0.65412828, 0.48235926,
            0.50019782, 0.6329175 , 0.57429919, 0.63971735, 0.59829245,
            0.3794948 , 0.47411425, 0.29233719, 0.85047971, 0.48431801,
            0.4346412 , 0.46088343, 0.52459674, 0.83922547, 0.44226779,
            0.51364382, 0.60598302, 0.47900685, 0.44286895, 0.49470819,
            0.47332007, 0.46910263, 1.        , 0.43466604, 0.44128466],
           [0.41270942, 0.45030846, 0.58726441, 0.47211555, 0.48967658,
            0.64860344, 0.42051345, 0.43019907, 0.45344278, 0.59193362,
            0.47004474, 0.47755521, 0.95408951, 0.55757941, 0.57096359,
            0.48526444, 0.5781951 , 0.6347424 , 0.57947259, 0.63469965,
            0.53938489, 0.64146953, 0.46903627, 0.47293318, 0.48845387,
            0.5919714 , 0.49090223, 0.45706751, 0.47577184, 0.57179093,
            0.47126838, 0.35053558, 0.52696792, 0.49283671, 0.65217211,
            0.69173513, 0.77676343, 0.42707676, 0.40759907, 0.6623109 ,
            0.46256026, 0.56314625, 0.60704832, 0.65189748, 0.48879552,
            0.57723428, 0.45918469, 0.43466604, 1.        , 0.49549116],
           [0.41932804, 0.43428413, 0.39213708, 0.32846691, 0.450761  ,
            0.49116597, 0.51851052, 0.4971188 , 0.56724759, 0.52340632,
            0.59585327, 0.43269513, 0.48962741, 0.56419803, 0.38324638,
            0.5758514 , 0.59987344, 0.52400498, 0.44462758, 0.43212989,
            0.46344749, 0.65260159, 0.4153719 , 0.6332571 , 0.35221535,
            0.38058696, 0.78323514, 0.58195407, 0.61783749, 0.41188518,
            0.68845537, 0.33348698, 0.45844062, 0.44056653, 0.64700905,
            0.54808649, 0.46659043, 0.56914241, 0.35532888, 0.60837122,
            0.53689011, 0.42609862, 0.43279262, 0.46418026, 0.6352741 ,
            0.36014466, 0.67489375, 0.44128466, 0.49549116, 1.        ]])





---



 ### Gower-Multiclass-Quantitative Distance in `Python`  <a class="anchor" id="97.4"></a>


```python
def Dist_GowerMQ_Py(i, j, MQ_Data ,  p1, p3):

    Dist_Gower = np.sqrt( 1 - GowerMQ_Similarity_Python(i, j, MQ_Data , p1, p3) )

    return(Dist_Gower)
```


```python
Dist_GowerMQ_Py(1, 2, MQ_Data_Py , 4, 3)
```




    0.5391626512921132





---



 ### Gower-Multiclass-Quantitative Distance Matrix in `Python`  <a class="anchor" id="97.5"></a>


```python
def Dist_GowerMQ_Matrix_Python(MQ_Data,  p1, p3):

    M = np.zeros((MQ_Data.shape[0] , MQ_Data.shape[0]))

    for i in range(0 , MQ_Data.shape[0]):
        for j in range(0 , MQ_Data.shape[0]):

            M[i,j] = Dist_GowerMQ_Py(i+1,j+1, MQ_Data, p1, p3)
                 
    return M
```


```python
Dist_GowerMQ_Matrix_Python(MQ_Data_Py,  4, 3)
```




    array([[0.        , 0.53916265, 0.57949435, 0.6622576 , 0.73912361,
            0.68014432, 0.52649926, 0.71287084, 0.69678866, 0.67327997,
            0.70535484, 0.64489027, 0.77473924, 0.67812124, 0.64745696,
            0.64867818, 0.81545242, 0.58271307, 0.73162909, 0.78615358,
            0.56598137, 0.74964206, 0.64743589, 0.6027825 , 0.59399241,
            0.76477021, 0.7214614 , 0.71276474, 0.45710569, 0.44753162,
            0.77031687, 0.76570583, 0.79071191, 0.62923952, 0.73823172,
            0.74500426, 0.73382751, 0.64052705, 0.67193251, 0.74206454,
            0.6511137 , 0.43101643, 0.72020281, 0.7609781 , 0.71039251,
            0.81738333, 0.51685559, 0.60675511, 0.76634886, 0.76201834],
           [0.53916265, 0.        , 0.62529878, 0.75438673, 0.77955817,
            0.66399848, 0.7212445 , 0.66918488, 0.58598879, 0.65793858,
            0.73453697, 0.70132484, 0.72867938, 0.75670375, 0.80960346,
            0.70213854, 0.74473561, 0.66185579, 0.74964762, 0.71107957,
            0.66079202, 0.70995193, 0.80751708, 0.61901247, 0.70630656,
            0.79533715, 0.73453505, 0.69777923, 0.64800345, 0.63571331,
            0.75954424, 0.77933562, 0.81701782, 0.58529404, 0.75146392,
            0.78667521, 0.73178155, 0.67449598, 0.65406939, 0.73651706,
            0.66968129, 0.54787725, 0.78164426, 0.77404886, 0.74262873,
            0.82869957, 0.64613311, 0.5391223 , 0.74141186, 0.75214086],
           [0.57949435, 0.62529878, 0.        , 0.70245876, 0.73823798,
            0.64395474, 0.68172608, 0.64164082, 0.64329194, 0.67079674,
            0.78656311, 0.61748851, 0.67723415, 0.7926012 , 0.72894312,
            0.60502385, 0.83167503, 0.66856912, 0.79471893, 0.77625021,
            0.61880845, 0.79272248, 0.72130773, 0.67260932, 0.73582926,
            0.7712333 , 0.75719797, 0.7548128 , 0.65034328, 0.71898215,
            0.74700849, 0.85918023, 0.78590494, 0.6230898 , 0.73728887,
            0.76391744, 0.76498285, 0.66633635, 0.62132295, 0.75452515,
            0.65650617, 0.46584075, 0.75213522, 0.71143   , 0.74416856,
            0.73761965, 0.69424183, 0.67788424, 0.64244501, 0.77965564],
           [0.6622576 , 0.75438673, 0.70245876, 0.        , 0.76745658,
            0.75937193, 0.81177074, 0.66135978, 0.77764009, 0.63702661,
            0.77634008, 0.57288684, 0.75456953, 0.68546489, 0.7179851 ,
            0.68611529, 0.80082156, 0.81450942, 0.66850082, 0.75009952,
            0.71001063, 0.61476684, 0.78833498, 0.69672464, 0.7612871 ,
            0.83909662, 0.79321676, 0.7459092 , 0.65947339, 0.58848515,
            0.83842822, 0.82605169, 0.76054202, 0.69161502, 0.68247406,
            0.65029454, 0.68309468, 0.74465829, 0.69277995, 0.72595614,
            0.73386261, 0.66293475, 0.55703644, 0.82186789, 0.69108397,
            0.71863323, 0.81244845, 0.66583583, 0.72655657, 0.81947122],
           [0.73912361, 0.77955817, 0.73823798, 0.76745658, 0.        ,
            0.75014429, 0.74982149, 0.75012857, 0.78423209, 0.73956641,
            0.5995002 , 0.62367229, 0.74284194, 0.63358797, 0.64745009,
            0.57365801, 0.69346737, 0.72482345, 0.68209792, 0.50928771,
            0.69879677, 0.74793517, 0.58893374, 0.65493499, 0.68597322,
            0.51108356, 0.6379876 , 0.58554776, 0.7101777 , 0.73713539,
            0.73657566, 0.43953994, 0.68488469, 0.58820898, 0.61422658,
            0.73110652, 0.59826499, 0.64849108, 0.65686719, 0.60547018,
            0.73039352, 0.73397821, 0.61038272, 0.62791528, 0.72159576,
            0.6383777 , 0.76520943, 0.66035111, 0.71436924, 0.74110661],
           [0.68014432, 0.66399848, 0.64395474, 0.75937193, 0.75014429,
            0.        , 0.64814655, 0.66768773, 0.70858534, 0.74691601,
            0.75756854, 0.6255426 , 0.58354929, 0.77681439, 0.7370463 ,
            0.73106974, 0.7501466 , 0.50105564, 0.54751308, 0.75486541,
            0.72128707, 0.61647342, 0.730004  , 0.73490969, 0.62197415,
            0.63111113, 0.72612715, 0.76921633, 0.75696066, 0.77963482,
            0.72213015, 0.82737433, 0.77727339, 0.72586901, 0.73447009,
            0.70702425, 0.65709664, 0.69197354, 0.77093648, 0.71807388,
            0.72505478, 0.68330752, 0.64118214, 0.58061734, 0.62169944,
            0.54741136, 0.63668583, 0.77475782, 0.59278711, 0.71332603],
           [0.52649926, 0.7212445 , 0.68172608, 0.81177074, 0.74982149,
            0.64814655, 0.        , 0.7800895 , 0.76359602, 0.74408381,
            0.75359544, 0.7425122 , 0.77255203, 0.75330049, 0.62229457,
            0.73002223, 0.7203692 , 0.61099557, 0.81432508, 0.78894882,
            0.67033252, 0.7024621 , 0.61373519, 0.79195161, 0.68479266,
            0.72411431, 0.66957349, 0.73173395, 0.66693278, 0.67000304,
            0.63877116, 0.74776635, 0.6197448 , 0.71466115, 0.68557566,
            0.80966655, 0.77855777, 0.62946573, 0.76185959, 0.63742268,
            0.72408829, 0.63027151, 0.74359365, 0.73895449, 0.65251491,
            0.79095712, 0.48262562, 0.80333881, 0.76124014, 0.69389443],
           [0.71287084, 0.66918488, 0.64164082, 0.66135978, 0.75012857,
            0.66768773, 0.7800895 , 0.        , 0.57124576, 0.58360363,
            0.76294688, 0.53914987, 0.76491012, 0.80562344, 0.75180509,
            0.62866047, 0.79748392, 0.79512706, 0.74950445, 0.71869123,
            0.6527221 , 0.69314632, 0.7281555 , 0.61853217, 0.84744007,
            0.75361606, 0.80398051, 0.67264017, 0.56137102, 0.68696587,
            0.70410476, 0.81243234, 0.74882334, 0.63083813, 0.78594558,
            0.81264953, 0.75231066, 0.82872234, 0.64740771, 0.75924367,
            0.6082352 , 0.70753455, 0.67734432, 0.74546373, 0.68872538,
            0.67369502, 0.82586005, 0.72976909, 0.7548516 , 0.70914117],
           [0.69678866, 0.58598879, 0.64329194, 0.77764009, 0.78423209,
            0.70858534, 0.76359602, 0.57124576, 0.        , 0.68361151,
            0.79133659, 0.64759703, 0.74033747, 0.77413074, 0.7195783 ,
            0.65482333, 0.75071507, 0.78121239, 0.78330277, 0.7887492 ,
            0.65551614, 0.76653315, 0.7573333 , 0.53146621, 0.82856174,
            0.72166013, 0.73956734, 0.57797738, 0.56156347, 0.7192196 ,
            0.74910509, 0.81497437, 0.74488744, 0.52507651, 0.75334234,
            0.82289982, 0.79179331, 0.80607871, 0.55477525, 0.74464409,
            0.65506154, 0.71643253, 0.76167499, 0.71165768, 0.74545186,
            0.79854681, 0.77299587, 0.58533219, 0.73929508, 0.6578392 ],
           [0.67327997, 0.65793858, 0.67079674, 0.63702661, 0.73956641,
            0.74691601, 0.74408381, 0.58360363, 0.68361151, 0.        ,
            0.62824481, 0.63703303, 0.64144355, 0.56654774, 0.64370295,
            0.49453214, 0.67995804, 0.79039963, 0.82087365, 0.60549141,
            0.64695493, 0.67057535, 0.71057368, 0.70331975, 0.81441743,
            0.72502551, 0.68756599, 0.75080495, 0.6649385 , 0.52388974,
            0.57856519, 0.77792506, 0.63493692, 0.60434037, 0.68363576,
            0.60596164, 0.64468498, 0.82418763, 0.65076495, 0.63467573,
            0.42553051, 0.66762732, 0.65422841, 0.7295866 , 0.76578017,
            0.76761101, 0.81169131, 0.70836601, 0.63880073, 0.69035764],
           [0.70535484, 0.73453697, 0.78656311, 0.77634008, 0.5995002 ,
            0.75756854, 0.75359544, 0.76294688, 0.79133659, 0.62824481,
            0.        , 0.74558308, 0.73355288, 0.46043358, 0.65603754,
            0.62887582, 0.78105046, 0.74979879, 0.75156922, 0.63735883,
            0.6353147 , 0.70496488, 0.50536761, 0.72700657, 0.75142408,
            0.73462955, 0.62356567, 0.61312538, 0.69702757, 0.68533377,
            0.49306703, 0.64102495, 0.76986365, 0.71924284, 0.7363013 ,
            0.64100994, 0.6852363 , 0.76166419, 0.7762396 , 0.70731196,
            0.47804421, 0.70211635, 0.61948422, 0.64363851, 0.60356276,
            0.78261429, 0.74812424, 0.7372545 , 0.72798026, 0.63572535],
           [0.64489027, 0.70132484, 0.61748851, 0.57288684, 0.62367229,
            0.6255426 , 0.7425122 , 0.53914987, 0.64759703, 0.63703303,
            0.74558308, 0.        , 0.74800004, 0.75195032, 0.70159947,
            0.45119893, 0.80602989, 0.77587893, 0.520648  , 0.75192984,
            0.6263417 , 0.66599746, 0.71783468, 0.63889156, 0.76728356,
            0.63700338, 0.61831053, 0.72940284, 0.60994776, 0.67390499,
            0.72558688, 0.72975759, 0.7833479 , 0.43972063, 0.72104088,
            0.77069346, 0.74101987, 0.74778904, 0.47081261, 0.72616048,
            0.62636036, 0.66327558, 0.57207733, 0.70008902, 0.60739652,
            0.53792312, 0.76639174, 0.49181332, 0.72280343, 0.75319643],
           [0.77473924, 0.72867938, 0.67723415, 0.75456953, 0.74284194,
            0.58354929, 0.77255203, 0.76491012, 0.74033747, 0.64144355,
            0.73355288, 0.74800004, 0.        , 0.67479693, 0.66812161,
            0.74876302, 0.61310228, 0.61057038, 0.65981601, 0.61004029,
            0.71013634, 0.58012048, 0.75952236, 0.72994636, 0.72420746,
            0.65076102, 0.72251511, 0.76447577, 0.75214286, 0.64892297,
            0.7196495 , 0.7948401 , 0.67805473, 0.7436893 , 0.62395402,
            0.59140139, 0.49559458, 0.78384563, 0.79894395, 0.58613476,
            0.72399301, 0.67796653, 0.63708868, 0.61732072, 0.72397154,
            0.68459931, 0.74146109, 0.77005138, 0.21426734, 0.71440366],
           [0.67812124, 0.75670375, 0.7926012 , 0.68546489, 0.63358797,
            0.77681439, 0.75330049, 0.80562344, 0.77413074, 0.56654774,
            0.46043358, 0.75195032, 0.67479693, 0.        , 0.50821698,
            0.64712482, 0.70214837, 0.78946562, 0.73618598, 0.5747263 ,
            0.77719776, 0.64582756, 0.65841002, 0.71616518, 0.71819746,
            0.74550674, 0.6173485 , 0.62269726, 0.7018882 , 0.5926306 ,
            0.66971494, 0.66252804, 0.69127659, 0.73494408, 0.63938846,
            0.51701472, 0.62740164, 0.74821168, 0.78376261, 0.63048492,
            0.65658096, 0.70289751, 0.48955743, 0.75965441, 0.71138042,
            0.81615113, 0.74218673, 0.71799288, 0.66514704, 0.66015299],
           [0.64745696, 0.80960346, 0.72894312, 0.7179851 , 0.64745009,
            0.7370463 , 0.62229457, 0.75180509, 0.7195783 , 0.64370295,
            0.65603754, 0.70159947, 0.66812161, 0.50821698, 0.        ,
            0.72056201, 0.71036667, 0.71314776, 0.77720189, 0.5737011 ,
            0.66464478, 0.69703658, 0.48463207, 0.76449451, 0.77284737,
            0.71455085, 0.73789394, 0.64760779, 0.64729312, 0.56696427,
            0.72010754, 0.71492352, 0.6380489 , 0.7130557 , 0.65306321,
            0.70442589, 0.67505708, 0.78921407, 0.71385225, 0.63143857,
            0.72041069, 0.77663473, 0.45621781, 0.71379641, 0.73330895,
            0.78005882, 0.70281428, 0.76568315, 0.65500871, 0.78533663],
           [0.64867818, 0.70213854, 0.60502385, 0.68611529, 0.57365801,
            0.73106974, 0.73002223, 0.62866047, 0.65482333, 0.49453214,
            0.62887582, 0.45119893, 0.74876302, 0.64712482, 0.72056201,
            0.        , 0.80673799, 0.74886493, 0.68895197, 0.74947129,
            0.59254915, 0.76651924, 0.68120051, 0.6620703 , 0.79419973,
            0.62239971, 0.52303754, 0.70926732, 0.60900941, 0.66075392,
            0.61242536, 0.71763079, 0.7715193 , 0.40951558, 0.7276872 ,
            0.63901624, 0.72727083, 0.75998708, 0.50317762, 0.72694638,
            0.48070599, 0.64990946, 0.71732166, 0.7026845 , 0.72807807,
            0.62465132, 0.77132529, 0.55009424, 0.71745074, 0.65126692],
           [0.81545242, 0.74473561, 0.83167503, 0.80082156, 0.69346737,
            0.7501466 , 0.7203692 , 0.79748392, 0.75071507, 0.67995804,
            0.78105046, 0.80602989, 0.61310228, 0.70214837, 0.71036667,
            0.80673799, 0.        , 0.74116001, 0.80632146, 0.5219177 ,
            0.77102124, 0.51538589, 0.81673395, 0.6796356 , 0.76174043,
            0.65823594, 0.6638477 , 0.81016246, 0.79853546, 0.7019141 ,
            0.67009015, 0.67724008, 0.43257224, 0.80203111, 0.4189801 ,
            0.75136725, 0.56351928, 0.63296104, 0.85351717, 0.34982159,
            0.77865311, 0.82124038, 0.69504036, 0.68648743, 0.6703972 ,
            0.8376834 , 0.66296193, 0.81542573, 0.64946509, 0.63255558],
           [0.58271307, 0.66185579, 0.66856912, 0.81450942, 0.72482345,
            0.50105564, 0.61099557, 0.79512706, 0.78121239, 0.79039963,
            0.74979879, 0.77587893, 0.61057038, 0.78946562, 0.71314776,
            0.74886493, 0.74116001, 0.        , 0.67610068, 0.75482364,
            0.59375191, 0.71095   , 0.66606347, 0.74444402, 0.63770465,
            0.69690971, 0.73964586, 0.75627634, 0.64523112, 0.67856616,
            0.77623429, 0.82565573, 0.83048015, 0.76527417, 0.71847173,
            0.66618767, 0.62117495, 0.65557519, 0.81922479, 0.73468815,
            0.78182338, 0.68908053, 0.7758161 , 0.65394636, 0.74106863,
            0.6760287 , 0.47601177, 0.77673174, 0.60436545, 0.68992392],
           [0.73162909, 0.74964762, 0.79471893, 0.66850082, 0.68209792,
            0.54751308, 0.81432508, 0.74950445, 0.78330277, 0.82087365,
            0.75156922, 0.520648  , 0.65981601, 0.73618598, 0.77720189,
            0.68895197, 0.80632146, 0.67610068, 0.        , 0.7916728 ,
            0.77163996, 0.62754007, 0.8021869 , 0.68872622, 0.6322977 ,
            0.61214143, 0.59804165, 0.77314419, 0.72961208, 0.75732794,
            0.79892258, 0.73733157, 0.85172466, 0.68148996, 0.71871741,
            0.67208306, 0.65226791, 0.68866063, 0.68969762, 0.75862   ,
            0.80435403, 0.75225911, 0.62921228, 0.65925123, 0.61660908,
            0.51976883, 0.72632943, 0.57106663, 0.64848085, 0.74523313],
           [0.78615358, 0.71107957, 0.77625021, 0.75009952, 0.50928771,
            0.75486541, 0.78894882, 0.71869123, 0.7887492 , 0.60549141,
            0.63735883, 0.75192984, 0.61004029, 0.5747263 , 0.5737011 ,
            0.74947129, 0.5219177 , 0.75482364, 0.7916728 , 0.        ,
            0.72435084, 0.63449475, 0.65960461, 0.66900744, 0.73640546,
            0.67014439, 0.75400028, 0.65942413, 0.74765835, 0.66250855,
            0.72447484, 0.58423239, 0.58411755, 0.74440241, 0.51916072,
            0.69705585, 0.4887618 , 0.69386977, 0.79960777, 0.46745413,
            0.73777909, 0.78131796, 0.52994472, 0.63354789, 0.73617345,
            0.78268417, 0.77728797, 0.77301477, 0.60440082, 0.75357157],
           [0.56598137, 0.66079202, 0.61880845, 0.71001063, 0.69879677,
            0.72128707, 0.67033252, 0.6527221 , 0.65551614, 0.64695493,
            0.6353147 , 0.6263417 , 0.71013634, 0.77719776, 0.66464478,
            0.59254915, 0.77102124, 0.59375191, 0.77163996, 0.72435084,
            0.        , 0.72883422, 0.48369036, 0.645177  , 0.82046444,
            0.74947531, 0.73293849, 0.7385586 , 0.50422857, 0.54943477,
            0.62957031, 0.81608275, 0.79143763, 0.61315607, 0.7123517 ,
            0.75512238, 0.71623959, 0.74391959, 0.67929748, 0.70503396,
            0.5120642 , 0.67499064, 0.74469285, 0.60068194, 0.6221784 ,
            0.73199123, 0.65574526, 0.66425555, 0.67868631, 0.73249745],
           [0.74964206, 0.70995193, 0.79272248, 0.61476684, 0.74793517,
            0.61647342, 0.7024621 , 0.69314632, 0.76653315, 0.67057535,
            0.70496488, 0.66599746, 0.58012048, 0.64582756, 0.69703658,
            0.76651924, 0.51538589, 0.71095   , 0.62754007, 0.63449475,
            0.72883422, 0.        , 0.77703276, 0.70063636, 0.79314306,
            0.77834475, 0.60823019, 0.76252808, 0.71756073, 0.61933315,
            0.65068418, 0.78389077, 0.60637477, 0.76156383, 0.48029138,
            0.66467079, 0.58680761, 0.64863807, 0.81560844, 0.47958572,
            0.75825798, 0.74456936, 0.54171635, 0.74219115, 0.48356206,
            0.70397579, 0.59675633, 0.73631084, 0.59877414, 0.58940513],
           [0.64743589, 0.80751708, 0.72130773, 0.78833498, 0.58893374,
            0.730004  , 0.61373519, 0.7281555 , 0.7573333 , 0.71057368,
            0.50536761, 0.71783468, 0.75952236, 0.65841002, 0.48463207,
            0.68120051, 0.81673395, 0.66606347, 0.8021869 , 0.65960461,
            0.48369036, 0.77703276, 0.        , 0.77922146, 0.7931854 ,
            0.72075938, 0.7650323 , 0.59882623, 0.62998756, 0.65520934,
            0.6059737 , 0.70966197, 0.74818401, 0.68175475, 0.74533249,
            0.76593838, 0.73834344, 0.78297067, 0.71854134, 0.73802385,
            0.58861529, 0.74461446, 0.63062278, 0.59397926, 0.64283155,
            0.73726019, 0.69143144, 0.7837792 , 0.72867258, 0.76460977],
           [0.6027825 , 0.61901247, 0.67260932, 0.69672464, 0.65493499,
            0.73490969, 0.79195161, 0.61853217, 0.53146621, 0.70331975,
            0.72700657, 0.63889156, 0.72994636, 0.71616518, 0.76449451,
            0.6620703 , 0.6796356 , 0.74444402, 0.68872622, 0.66900744,
            0.645177  , 0.70063636, 0.77922146, 0.        , 0.65107518,
            0.69400021, 0.68449677, 0.64697532, 0.4585867 , 0.63372804,
            0.77610522, 0.71254464, 0.73935092, 0.65430179, 0.58152108,
            0.74715129, 0.62380741, 0.60605821, 0.69784654, 0.62984854,
            0.68424432, 0.62735925, 0.73137242, 0.63110573, 0.69794407,
            0.81388779, 0.69410523, 0.5881086 , 0.72599368, 0.60559302],
           [0.59399241, 0.70630656, 0.73582926, 0.7612871 , 0.68597322,
            0.62197415, 0.68479266, 0.84744007, 0.82856174, 0.81441743,
            0.75142408, 0.76728356, 0.72420746, 0.71819746, 0.77284737,
            0.79419973, 0.76174043, 0.63770465, 0.6322977 , 0.73640546,
            0.82046444, 0.79314306, 0.7931854 , 0.65107518, 0.        ,
            0.59774758, 0.75754665, 0.75225371, 0.7495149 , 0.72934686,
            0.81271199, 0.70166277, 0.72886937, 0.77840363, 0.67962795,
            0.6923055 , 0.56559811, 0.52420812, 0.77928036, 0.68310817,
            0.79619024, 0.62167868, 0.73970662, 0.60040492, 0.75615489,
            0.76965646, 0.69073116, 0.71947254, 0.71522453, 0.8048507 ],
           [0.76477021, 0.79533715, 0.7712333 , 0.83909662, 0.51108356,
            0.63111113, 0.72411431, 0.75361606, 0.72166013, 0.72502551,
            0.73462955, 0.63700338, 0.65076102, 0.74550674, 0.71455085,
            0.62239971, 0.65823594, 0.69690971, 0.61214143, 0.67014439,
            0.74947531, 0.77834475, 0.72075938, 0.69400021, 0.59774758,
            0.        , 0.6675588 , 0.75912715, 0.76482846, 0.75736448,
            0.71434115, 0.53571311, 0.59608665, 0.60713174, 0.68360812,
            0.71414905, 0.53846851, 0.73238673, 0.66187169, 0.61304003,
            0.70208764, 0.77093877, 0.74178002, 0.49752655, 0.75228913,
            0.55088528, 0.81166804, 0.70696689, 0.63877116, 0.78702798],
           [0.7214614 , 0.73453505, 0.75719797, 0.79321676, 0.6379876 ,
            0.72612715, 0.66957349, 0.80398051, 0.73956734, 0.68756599,
            0.62356567, 0.61831053, 0.72251511, 0.6173485 , 0.73789394,
            0.52303754, 0.6638477 , 0.73964586, 0.59804165, 0.75400028,
            0.73293849, 0.60823019, 0.7650323 , 0.68449677, 0.75754665,
            0.6675588 , 0.        , 0.73452198, 0.7096244 , 0.75207158,
            0.54173636, 0.7007804 , 0.71458955, 0.63733756, 0.56266211,
            0.66316261, 0.72966727, 0.62331159, 0.67905469, 0.60058941,
            0.66333405, 0.74940669, 0.70810954, 0.72058304, 0.56115877,
            0.70543924, 0.61484297, 0.60587334, 0.71351088, 0.46558014],
           [0.71276474, 0.69777923, 0.7548128 , 0.7459092 , 0.58554776,
            0.76921633, 0.73173395, 0.67264017, 0.57797738, 0.75080495,
            0.61312538, 0.72940284, 0.76447577, 0.62269726, 0.64760779,
            0.70926732, 0.81016246, 0.75627634, 0.77314419, 0.65942413,
            0.7385586 , 0.76252808, 0.59882623, 0.64697532, 0.75225371,
            0.75912715, 0.73452198, 0.        , 0.59388692, 0.74150225,
            0.75838827, 0.67391586, 0.77313914, 0.59204918, 0.71398085,
            0.7480575 , 0.72306306, 0.75833914, 0.64429417, 0.73624748,
            0.7440446 , 0.71021693, 0.61054999, 0.740039  , 0.71437922,
            0.77944539, 0.76017696, 0.65245751, 0.73683952, 0.64656471],
           [0.45710569, 0.64800345, 0.65034328, 0.65947339, 0.7101777 ,
            0.75696066, 0.66693278, 0.56137102, 0.56156347, 0.6649385 ,
            0.69702757, 0.60994776, 0.75214286, 0.7018882 , 0.64729312,
            0.60900941, 0.79853546, 0.64523112, 0.72961208, 0.74765835,
            0.50422857, 0.71756073, 0.62998756, 0.4585867 , 0.7495149 ,
            0.76482846, 0.7096244 , 0.59388692, 0.        , 0.48666836,
            0.7502056 , 0.7816944 , 0.80620472, 0.60218786, 0.69947238,
            0.71249311, 0.68732405, 0.72308805, 0.66232981, 0.7234335 ,
            0.65472087, 0.60455752, 0.71575086, 0.72729182, 0.69211318,
            0.77590402, 0.60665021, 0.60023549, 0.72403602, 0.61819294],
           [0.44753162, 0.63571331, 0.71898215, 0.58848515, 0.73713539,
            0.77963482, 0.67000304, 0.68696587, 0.7192196 , 0.52388974,
            0.68533377, 0.67390499, 0.64892297, 0.5926306 , 0.56696427,
            0.66075392, 0.7019141 , 0.67856616, 0.75732794, 0.66250855,
            0.54943477, 0.61933315, 0.65520934, 0.63372804, 0.72934686,
            0.75736448, 0.75207158, 0.74150225, 0.48666836, 0.        ,
            0.74640831, 0.75445717, 0.68210585, 0.64374584, 0.66362143,
            0.65631599, 0.60025661, 0.7690231 , 0.70052586, 0.62558248,
            0.6244378 , 0.58956625, 0.6462825 , 0.77345887, 0.73557156,
            0.80845289, 0.66089351, 0.63380403, 0.65437686, 0.76688644],
           [0.77031687, 0.75954424, 0.74700849, 0.83842822, 0.73657566,
            0.72213015, 0.63877116, 0.70410476, 0.74910509, 0.57856519,
            0.49306703, 0.72558688, 0.7196495 , 0.66971494, 0.72010754,
            0.61242536, 0.67009015, 0.77623429, 0.79892258, 0.72447484,
            0.62957031, 0.65068418, 0.6059737 , 0.77610522, 0.81271199,
            0.71434115, 0.54173636, 0.75838827, 0.7502056 , 0.74640831,
            0.        , 0.78021819, 0.62270224, 0.71438423, 0.66720757,
            0.698466  , 0.73231412, 0.71710265, 0.75178788, 0.60531126,
            0.41162972, 0.77021122, 0.73614287, 0.59905055, 0.51409475,
            0.7530171 , 0.70270459, 0.78772153, 0.72713934, 0.55816183],
           [0.76570583, 0.77933562, 0.85918023, 0.82605169, 0.43953994,
            0.82737433, 0.74776635, 0.81243234, 0.81497437, 0.77792506,
            0.64102495, 0.72975759, 0.7948401 , 0.66252804, 0.71492352,
            0.71763079, 0.67724008, 0.82565573, 0.73733157, 0.58423239,
            0.81608275, 0.78389077, 0.70966197, 0.71254464, 0.70166277,
            0.53571311, 0.7007804 , 0.67391586, 0.7816944 , 0.75445717,
            0.78021819, 0.        , 0.63738402, 0.70200208, 0.7202719 ,
            0.82398397, 0.66457845, 0.7499826 , 0.75376122, 0.67426439,
            0.77000299, 0.74862554, 0.70178175, 0.73060228, 0.78487967,
            0.76755269, 0.82757995, 0.72517981, 0.80589355, 0.81640249],
           [0.79071191, 0.81701782, 0.78590494, 0.76054202, 0.68488469,
            0.77727339, 0.6197448 , 0.74882334, 0.74488744, 0.63493692,
            0.76986365, 0.7833479 , 0.67805473, 0.69127659, 0.6380489 ,
            0.7715193 , 0.43257224, 0.83048015, 0.85172466, 0.58411755,
            0.79143763, 0.60637477, 0.74818401, 0.73935092, 0.72886937,
            0.59608665, 0.71458955, 0.77313914, 0.80620472, 0.68210585,
            0.62270224, 0.63738402, 0.        , 0.75700074, 0.49659769,
            0.75829569, 0.58114308, 0.67715336, 0.76841982, 0.38720872,
            0.71495526, 0.77418351, 0.68730193, 0.66784666, 0.698631  ,
            0.80882159, 0.76220164, 0.84122696, 0.68777328, 0.73590718],
           [0.62923952, 0.58529404, 0.6230898 , 0.69161502, 0.58820898,
            0.72586901, 0.71466115, 0.63083813, 0.52507651, 0.60434037,
            0.71924284, 0.43972063, 0.7436893 , 0.73494408, 0.7130557 ,
            0.40951558, 0.80203111, 0.76527417, 0.68148996, 0.74440241,
            0.61315607, 0.76156383, 0.68175475, 0.65430179, 0.77840363,
            0.60713174, 0.63733756, 0.59204918, 0.60218786, 0.64374584,
            0.71438423, 0.70200208, 0.75700074, 0.        , 0.72849296,
            0.75722573, 0.72990882, 0.77444965, 0.29237768, 0.72171931,
            0.59307967, 0.63260989, 0.71015782, 0.69536638, 0.72102111,
            0.64422844, 0.76466755, 0.38667854, 0.71215398, 0.74795285],
           [0.73823172, 0.75146392, 0.73728887, 0.68247406, 0.61422658,
            0.73447009, 0.68557566, 0.78594558, 0.75334234, 0.68363576,
            0.7363013 , 0.72104088, 0.62395402, 0.63938846, 0.65306321,
            0.7276872 , 0.4189801 , 0.71847173, 0.71871741, 0.51916072,
            0.7123517 , 0.48029138, 0.74533249, 0.58152108, 0.67962795,
            0.68360812, 0.56266211, 0.71398085, 0.69947238, 0.66362143,
            0.66720757, 0.7202719 , 0.49659769, 0.72849296, 0.        ,
            0.64501464, 0.47218564, 0.47444215, 0.76749013, 0.31093193,
            0.77248379, 0.75434549, 0.61395872, 0.60993333, 0.57561006,
            0.78150353, 0.60824081, 0.71811001, 0.58976935, 0.59413041],
           [0.74500426, 0.78667521, 0.76391744, 0.65029454, 0.73110652,
            0.70702425, 0.80966655, 0.81264953, 0.82289982, 0.60596164,
            0.64100994, 0.77069346, 0.59140139, 0.51701472, 0.70442589,
            0.63901624, 0.75136725, 0.66618767, 0.67208306, 0.69705585,
            0.75512238, 0.66467079, 0.76593838, 0.74715129, 0.6923055 ,
            0.71414905, 0.66316261, 0.7480575 , 0.71249311, 0.65631599,
            0.698466  , 0.82398397, 0.75829569, 0.75722573, 0.64501464,
            0.        , 0.4969897 , 0.74150919, 0.81164362, 0.67100662,
            0.70467217, 0.74792672, 0.66833344, 0.67558992, 0.747058  ,
            0.63150491, 0.7563558 , 0.75190345, 0.55521606, 0.67224512],
           [0.73382751, 0.73178155, 0.76498285, 0.68309468, 0.59826499,
            0.65709664, 0.77855777, 0.75231066, 0.79179331, 0.64468498,
            0.6852363 , 0.74101987, 0.49559458, 0.62740164, 0.67505708,
            0.72727083, 0.56351928, 0.62117495, 0.65226791, 0.4887618 ,
            0.71623959, 0.58680761, 0.73834344, 0.62380741, 0.56559811,
            0.53846851, 0.72966727, 0.72306306, 0.68732405, 0.60025661,
            0.73231412, 0.66457845, 0.58114308, 0.72990882, 0.47218564,
            0.4969897 , 0.        , 0.63759209, 0.78628977, 0.4640032 ,
            0.73823579, 0.72864472, 0.63730355, 0.51316384, 0.71264872,
            0.66102422, 0.73874307, 0.73424558, 0.47247918, 0.73034894],
           [0.64052705, 0.67449598, 0.66633635, 0.74465829, 0.64849108,
            0.69197354, 0.62946573, 0.82872234, 0.80607871, 0.82418763,
            0.76166419, 0.74778904, 0.78384563, 0.74821168, 0.78921407,
            0.75998708, 0.63296104, 0.65557519, 0.68866063, 0.69386977,
            0.74391959, 0.64863807, 0.78297067, 0.60605821, 0.52420812,
            0.73238673, 0.62331159, 0.75833914, 0.72308805, 0.7690231 ,
            0.71710265, 0.7499826 , 0.67715336, 0.77444965, 0.47444215,
            0.74150919, 0.63759209, 0.        , 0.78183986, 0.55552324,
            0.81596659, 0.6590341 , 0.74671366, 0.66414526, 0.63168253,
            0.80871142, 0.50704732, 0.68949493, 0.75691693, 0.65639743],
           [0.67193251, 0.65406939, 0.62132295, 0.69277995, 0.65686719,
            0.77093648, 0.76185959, 0.64740771, 0.55477525, 0.65076495,
            0.7762396 , 0.47081261, 0.79894395, 0.78376261, 0.71385225,
            0.50317762, 0.85351717, 0.81922479, 0.68969762, 0.79960777,
            0.67929748, 0.81560844, 0.71854134, 0.69784654, 0.77928036,
            0.66187169, 0.67905469, 0.64429417, 0.66232981, 0.70052586,
            0.75178788, 0.75376122, 0.76841982, 0.29237768, 0.76749013,
            0.81164362, 0.78628977, 0.78183986, 0.        , 0.77853478,
            0.63867454, 0.68959723, 0.72878305, 0.73684519, 0.76850182,
            0.69665415, 0.81341076, 0.400967  , 0.76967586, 0.80291414],
           [0.74206454, 0.73651706, 0.75452515, 0.72595614, 0.60547018,
            0.71807388, 0.63742268, 0.75924367, 0.74464409, 0.63467573,
            0.70731196, 0.72616048, 0.58613476, 0.63048492, 0.63143857,
            0.72694638, 0.34982159, 0.73468815, 0.75862   , 0.46745413,
            0.70503396, 0.47958572, 0.73802385, 0.62984854, 0.68310817,
            0.61304003, 0.60058941, 0.73624748, 0.7234335 , 0.62558248,
            0.60531126, 0.67426439, 0.38720872, 0.72171931, 0.31093193,
            0.67100662, 0.4640032 , 0.55552324, 0.77853478, 0.        ,
            0.71619515, 0.74842027, 0.60058801, 0.60403767, 0.58151069,
            0.76114278, 0.6565217 , 0.74681471, 0.58111023, 0.62580251],
           [0.6511137 , 0.66968129, 0.65650617, 0.73386261, 0.73039352,
            0.72505478, 0.72408829, 0.6082352 , 0.65506154, 0.42553051,
            0.47804421, 0.62636036, 0.72399301, 0.65658096, 0.72041069,
            0.48070599, 0.77865311, 0.78182338, 0.80435403, 0.73777909,
            0.5120642 , 0.75825798, 0.58861529, 0.68424432, 0.79619024,
            0.70208764, 0.66333405, 0.7440446 , 0.65472087, 0.6244378 ,
            0.41162972, 0.77000299, 0.71495526, 0.59307967, 0.77248379,
            0.70467217, 0.73823579, 0.81596659, 0.63867454, 0.71619515,
            0.        , 0.65484179, 0.73357823, 0.60782111, 0.64095803,
            0.75877722, 0.80334239, 0.69739241, 0.73310282, 0.68052178],
           [0.43101643, 0.54787725, 0.46584075, 0.66293475, 0.73397821,
            0.68330752, 0.63027151, 0.70753455, 0.71643253, 0.66762732,
            0.70211635, 0.66327558, 0.67796653, 0.70289751, 0.77663473,
            0.64990946, 0.82124038, 0.68908053, 0.75225911, 0.78131796,
            0.67499064, 0.74456936, 0.74461446, 0.62735925, 0.62167868,
            0.77093877, 0.74940669, 0.71021693, 0.60455752, 0.58956625,
            0.77021122, 0.74862554, 0.77418351, 0.63260989, 0.75434549,
            0.74792672, 0.72864472, 0.6590341 , 0.68959723, 0.74842027,
            0.65484179, 0.        , 0.74601404, 0.76421541, 0.73284668,
            0.81273355, 0.65005138, 0.62770772, 0.66094913, 0.75756279],
           [0.72020281, 0.78164426, 0.75213522, 0.55703644, 0.61038272,
            0.64118214, 0.74359365, 0.67734432, 0.76167499, 0.65422841,
            0.61948422, 0.57207733, 0.63708868, 0.48955743, 0.45621781,
            0.71732166, 0.69504036, 0.7758161 , 0.62921228, 0.52994472,
            0.74469285, 0.54171635, 0.63062278, 0.73137242, 0.73970662,
            0.74178002, 0.70810954, 0.61054999, 0.71575086, 0.6462825 ,
            0.73614287, 0.70178175, 0.68730193, 0.71015782, 0.61395872,
            0.66833344, 0.63730355, 0.74671366, 0.72878305, 0.60058801,
            0.73357823, 0.74601404, 0.        , 0.72636486, 0.58765519,
            0.68831433, 0.76632813, 0.72179855, 0.62685858, 0.75313171],
           [0.7609781 , 0.77404886, 0.71143   , 0.82186789, 0.62791528,
            0.58061734, 0.73895449, 0.74546373, 0.71165768, 0.7295866 ,
            0.64363851, 0.70008902, 0.61732072, 0.75965441, 0.71379641,
            0.7026845 , 0.68648743, 0.65394636, 0.65925123, 0.63354789,
            0.60068194, 0.74219115, 0.59397926, 0.63110573, 0.60040492,
            0.49752655, 0.72058304, 0.740039  , 0.72729182, 0.77345887,
            0.59905055, 0.73060228, 0.66784666, 0.69536638, 0.60993333,
            0.67558992, 0.51316384, 0.66414526, 0.73684519, 0.60403767,
            0.60782111, 0.76421541, 0.72636486, 0.        , 0.60012034,
            0.64570475, 0.75066877, 0.74641212, 0.59000214, 0.73199709],
           [0.71039251, 0.74262873, 0.74416856, 0.69108397, 0.72159576,
            0.62169944, 0.65251491, 0.68872538, 0.74545186, 0.76578017,
            0.60356276, 0.60739652, 0.72397154, 0.71138042, 0.73330895,
            0.72807807, 0.6703972 , 0.74106863, 0.61660908, 0.73617345,
            0.6221784 , 0.48356206, 0.64283155, 0.69794407, 0.75615489,
            0.75228913, 0.56115877, 0.71437922, 0.69211318, 0.73557156,
            0.51409475, 0.78487967, 0.698631  , 0.72102111, 0.57561006,
            0.747058  , 0.71264872, 0.63168253, 0.76850182, 0.58151069,
            0.64095803, 0.73284668, 0.58765519, 0.60012034, 0.        ,
            0.68444112, 0.62030422, 0.71083881, 0.71498565, 0.60392541],
           [0.81738333, 0.82869957, 0.73761965, 0.71863323, 0.6383777 ,
            0.54741136, 0.79095712, 0.67369502, 0.79854681, 0.76761101,
            0.78261429, 0.53792312, 0.68459931, 0.81615113, 0.78005882,
            0.62465132, 0.8376834 , 0.6760287 , 0.51976883, 0.78268417,
            0.73199123, 0.70397579, 0.73726019, 0.81388779, 0.76965646,
            0.55088528, 0.70543924, 0.77944539, 0.77590402, 0.80845289,
            0.7530171 , 0.76755269, 0.80882159, 0.64422844, 0.78150353,
            0.63150491, 0.66102422, 0.80871142, 0.69665415, 0.76114278,
            0.75877722, 0.81273355, 0.68831433, 0.64570475, 0.68444112,
            0.        , 0.82229059, 0.72572717, 0.65020437, 0.79990958],
           [0.51685559, 0.64613311, 0.69424183, 0.81244845, 0.76520943,
            0.63668583, 0.48262562, 0.82586005, 0.77299587, 0.81169131,
            0.74812424, 0.76639174, 0.74146109, 0.74218673, 0.70281428,
            0.77132529, 0.66296193, 0.47601177, 0.72632943, 0.77728797,
            0.65574526, 0.59675633, 0.69143144, 0.69410523, 0.69073116,
            0.81166804, 0.61484297, 0.76017696, 0.60665021, 0.66089351,
            0.70270459, 0.82757995, 0.76220164, 0.76466755, 0.60824081,
            0.7563558 , 0.73874307, 0.50704732, 0.81341076, 0.6565217 ,
            0.80334239, 0.65005138, 0.76632813, 0.75066877, 0.62030422,
            0.82229059, 0.        , 0.72862704, 0.73540146, 0.57018089],
           [0.60675511, 0.5391223 , 0.67788424, 0.66583583, 0.66035111,
            0.77475782, 0.80333881, 0.72976909, 0.58533219, 0.70836601,
            0.7372545 , 0.49181332, 0.77005138, 0.71799288, 0.76568315,
            0.55009424, 0.81542573, 0.77673174, 0.57106663, 0.77301477,
            0.66425555, 0.73631084, 0.7837792 , 0.5881086 , 0.71947254,
            0.70696689, 0.60587334, 0.65245751, 0.60023549, 0.63380403,
            0.78772153, 0.72517981, 0.84122696, 0.38667854, 0.71811001,
            0.75190345, 0.73424558, 0.68949493, 0.400967  , 0.74681471,
            0.69739241, 0.62770772, 0.72179855, 0.74641212, 0.71083881,
            0.72572717, 0.72862704, 0.        , 0.75188693, 0.74747264],
           [0.76634886, 0.74141186, 0.64244501, 0.72655657, 0.71436924,
            0.59278711, 0.76124014, 0.7548516 , 0.73929508, 0.63880073,
            0.72798026, 0.72280343, 0.21426734, 0.66514704, 0.65500871,
            0.71745074, 0.64946509, 0.60436545, 0.64848085, 0.60440082,
            0.67868631, 0.59877414, 0.72867258, 0.72599368, 0.71522453,
            0.63877116, 0.71351088, 0.73683952, 0.72403602, 0.65437686,
            0.72713934, 0.80589355, 0.68777328, 0.71215398, 0.58976935,
            0.55521606, 0.47247918, 0.75691693, 0.76967586, 0.58111023,
            0.73310282, 0.66094913, 0.62685858, 0.59000214, 0.71498565,
            0.65020437, 0.73540146, 0.75188693, 0.        , 0.71028785],
           [0.76201834, 0.75214086, 0.77965564, 0.81947122, 0.74110661,
            0.71332603, 0.69389443, 0.70914117, 0.6578392 , 0.69035764,
            0.63572535, 0.75319643, 0.71440366, 0.66015299, 0.78533663,
            0.65126692, 0.63255558, 0.68992392, 0.74523313, 0.75357157,
            0.73249745, 0.58940513, 0.76460977, 0.60559302, 0.8048507 ,
            0.78702798, 0.46558014, 0.64656471, 0.61819294, 0.76688644,
            0.55816183, 0.81640249, 0.73590718, 0.74795285, 0.59413041,
            0.67224512, 0.73034894, 0.65639743, 0.80291414, 0.62580251,
            0.68052178, 0.75756279, 0.75313171, 0.73199709, 0.60392541,
            0.79990958, 0.57018089, 0.74747264, 0.71028785, 0.        ]])





---



 ### Gower-Mahalanobis Similarity Coefficient   <a class="anchor" id="96"></a>



The Gower-Mahalanobis similarity coefficient between the elements $i$ and $j$ with respect to the variables $X_1,...,X_p$ is:


\begin{gather*}
S(i,j)_{Gower-Maha}=\dfrac{ \left(1- \dfrac{\delta(i,j)_{Maha}}{max(D_{Maha})} \right) + a_{ij} + \alpha_{ij} }{ \left( p_2 - d_{ij} \right) + p_3}
\end{gather*}


Where:

$p_2 \hspace{0.05cm}$ is the number of binary categorical variables

$p_3 \hspace{0.05cm}$ is the number of multiple (non-binary) categorical variables

$\delta(i,j)_{Maha}  \hspace{0.05cm}$ is the Mahalanobis distance between the individuals with respect to the $p_1$ quantitative variables

$max(D_{Maha})  \hspace{0.05cm}$ is the maximum value of the Mahalanobis distance matrix  between the individuals with respect to the $p_1$ quantitative variables.

$a_{ij}  \hspace{0.05cm}$ is the number of binary variables (there are $p_2$) for which the answer is 1 in both individuals $i$ and $j$

$d_{ij}  \hspace{0.05cm}$ is the number of binary variables (there are $p_2$) for which the response is 0 in both individuals $i$ and $j$

$\alpha_{ij}  \hspace{0.05cm}$ is the number of matches between multiple non-binary categorical variables (there are $p_3$) for individuals $i$ and $j$





 ### Gower-Mahalanobis Distance   <a class="anchor" id="97"></a>



La distancia de Gower-Mahalanobis:



\begin{gather*}
\delta(i,j)_{Gower-Maha} = \sqrt{S(i,i)_{Gower-Maha} +S(j,j)_{Gower-Maha} - 2\cdot S(i,j)_{Gower-Maha} }
\end{gather*}




---



 #### Gower-Mahalanobis Similarity in `R`   <a class="anchor" id="98"></a>



```r
%%R

Gower_Maha_Similarity_R <- function(i,j, Mixed_Data_Set, p1, p2, p3){

  # X tiene que ser tal que: las p1 primeras variables son cuantitativas, las p2 siguientes son binarias,# tienen que estar las variables ordenadas del siguiente mod las p3 siguientes son categoricas multiples (no binarias). De modo que p=p1+p2+p3

  X=as.matrix(Mixed_Data_Set) 

############################################

  Binary_Data_set = X[ , (p1+1):(p2+p1)]

############################################

  a= Binary_Data_set %*% t(Binary_Data_set)
  
  unos<- rep(1, dim(Binary_Data_set)[2])

  Ones_Matrix <- matrix( rep(unos, dim(Binary_Data_set)[1]),      
                ncol=dim(Binary_Data_set)[2])
                
  d= (Ones_Matrix - Binary_Data_set)%*%t(Ones_Matrix -     
      Binary_Data_set)   

############################################ 

  Multiple_Categorical_Data_set = X[ , (p1+p2+1):(p1+p2+p3)]

############################################

  Quantitative_Data_set  = X[ , 1:p1]

############################################ 

  max_maha = max(Dist_Mahalanobis_Matrix_R(Quantitative_Data_set))
  
############################################
  
  Similaridad_Gower_Mahalanobis = (  1 - Dist_Mahalanobis_R(i,j, Quantitative_Data_set)/max_maha  + a[i,j] + alpha(i,j, Multiple_Categorical_Data_set)  ) / ( p2- d[i,j] + p3 )
  
  return(Similaridad_Gower_Mahalanobis)
} 
```


```r
%%R  

 Gower_Maha_Similarity_R(1,2, Mixed_Data_R, p1=4, p2=3, p3=3)
```

              [,1]
    [1,] 0.5789689
    



---



 #### Gower-Mahalanobis Similarity in `Python`   <a class="anchor" id="99"></a>



```python
def Gower_Maha_Similarity_Python(i,j, Mixed_Data_Set, p1, p2, p3):

    X = Mixed_Data_Set.to_numpy()
    X_pandas = Mixed_Data_Set

    # The variable must to be order in the following way: 
    # the p1 first are quantitative, the following p2 are binary categorical, and the following p3 are multiple categorical.

##########################################################################################
    
    ones = np.repeat(1, p1)

    Quantitative_Data = X_pandas.iloc[: , 0:p1]

    Binary_Data = X[: , (p1):(p1+p2)]
    
    Multiple_Categorical_Data = X[: , (p1+p2):(p1+p2+p3) ]

    a = Binary_Data @ Binary_Data.T

    ones_matrix = np.ones(( Binary_Data.shape[0] , Binary_Data.shape[1])) 
   
    d = (ones_matrix - Binary_Data) @ (ones_matrix - Binary_Data).T

    max_maha = Dist_Mahalanobis_Matrix_Python(Quantitative_Data).max()

##########################################################################################

    numerator =  1 - ( Dist_Mahalanobis_Python(i,j, Quantitative_Data) / max_maha ) + a[i,j] + alpha_py(i,j, Multiple_Categorical_Data)

    denominator = (p2 - d[i,j]) + p3

    Gower_Maha_Similarity = numerator / denominator  

    return(Gower_Maha_Similarity) 
```


```python
Gower_Maha_Similarity_Python(1,2, Mixed_Data_Py, 4, 3, 3)
```




    0.5789689030957912





---



 #### Gower-Mahalanobis Similarity Matrix in `R`   <a class="anchor" id="100"></a>



```r
%%R

Sim_Gower_Maha_Matrix_R <- function( Matriz_Datos_Mixtos, p1, p2, p3 ){
  
  Matriz_Datos_Mixtos=as.matrix(Matriz_Datos_Mixtos)
  
  M<-matrix(NA, ncol =dim(Matriz_Datos_Mixtos)[1] , nrow=dim(Matriz_Datos_Mixtos)[1] )
  
  for(i in 1:dim(Matriz_Datos_Mixtos)[1] ){
    for(j in 1:dim(Matriz_Datos_Mixtos)[1]){
    
  M[i,j]=Gower_Maha_Similarity_R(i,j,  Matriz_Datos_Mixtos, p1, p2, p3)
  
   }
  }
 return(M)
}
```

The computational cost of implement the following code is too large (about 40 minutes)


```r
%%R

# Sim_Gower_Maha_Matrix_R(Mixed_Data_R , p1=4, p2=3, p3=3) 
```

    NULL
    



---



 #### Gower-Mahalanobis Similarity Matrix in `Python`   <a class="anchor" id="101"></a>



```python
def Sim_Gower_Maha_Matrix_Python(Mixed_Data,  p1, p2, p3):

    M = np.zeros((Mixed_Data.shape[0] , Mixed_Data.shape[0]))

    for i in range(0 , Mixed_Data.shape[0]):
        for j in range(0 , Mixed_Data.shape[0]):

            M[i,j] = Gower_Maha_Similarity_Python(i,j, Mixed_Data , p1, p2, p3) 
                 
    return M
```

Again, the computational cost of implement the following code is too large (about 40 minutes)


```python
# Sim_Gower_Maha_Matrix_Python(Mixed_Data_Py, 4, 3, 3)[1:3,1:3]
```



---



 #### Gower-Mahalanobis Distance in `R`   <a class="anchor" id="102"></a>



```r
%%R

Dist_Gower_Maha_R <- function(i, j, Mixed_Data , p1, p2, p3) {

Dist_Gower_Mahalanobis <- sqrt( Gower_Maha_Similarity_R(i, i, Mixed_Data , p1, p2, p3) + Gower_Maha_Similarity_R(j, j, Mixed_Data , p1, p2, p3) - 2*Gower_Maha_Similarity_R(i, j, Mixed_Data , p1, p2, p3))

return(Dist_Gower_Mahalanobis)
}
```


```r
%%R 

Dist_Gower_Maha_R(1,2, Mixed_Data_R , p1=4, p2=3, p3=3)
```

             [,1]
    [1,] 1.121931
    



---



 #### Gower-Mahalanobis Distance in `Python`   <a class="anchor" id="103"></a>



```python
def Dist_Gower_Maha_Python(i, j, Mixed_Data, p1, p2, p3):

    Dist_Gower_Mahalanobis = np.sqrt( Gower_Maha_Similarity_Python(i, i, Mixed_Data , p1, p2, p3) + Gower_Maha_Similarity_Python(j, j, Mixed_Data , p1, p2, p3) - 2*Gower_Maha_Similarity_Python(i, j, Mixed_Data , p1, p2, p3) )

    return Dist_Gower_Mahalanobis
```


```python
Dist_Gower_Maha_Python(1, 2, Mixed_Data_Py, 4, 3, 3)
```




    1.1219308626092273





---



 #### Gower-Mahalanobis Distance Matrix in `R`   <a class="anchor" id="104"></a>



```r
%%R

 Dist_Gower_Maha_Matrix_R <- function( Mixed_Data, p1, p2, p3 ){
  
  Mixed_Data=as.matrix(Mixed_Data)
  
  M<-matrix(NA, ncol = dim(Mixed_Data)[1] , nrow = dim(Mixed_Data)[1] )
  
  for(i in 1:dim(Mixed_Data)[1] ){
    for(j in 1:dim(Mixed_Data)[1]){
    
  M[i,j]=Dist_Gower_Maha_R(i,j,  Mixed_Data, p1, p2, p3)
  
   }
  }
 return(M)
}
```

The computational cost of implement this code is too large


```r
%%R 

# Dist_Gower_Maha_Matrix_R(Mixed_Data_R, p1=4, p2=3, p3=3)
```

    NULL
    



---



 #### Gower-Mahalanobis Distance Matrix in `Python`   <a class="anchor" id="105"></a>



```python
def Dist_Gower_Maha_Matrix_Python(Mixed_Data,  p1, p2, p3):

    M = np.zeros((Mixed_Data.shape[0] , Mixed_Data.shape[0]))

    for i in range(0 , Mixed_Data.shape[0]):
        for j in range(0 , Mixed_Data.shape[0]):

            M[i,j] = Dist_Gower_Maha_Python(i,j, Mixed_Data , p1, p2, p3) 
                 
    return M
```

The computational cost of implement this code is too large


```python
# Dist_Gower_Maha_Matrix_Python(Mixed_Data_Py , 4, 3, 3)
```



---



## Bibliography <a class="anchor" id="1"></a>

Grané, A. (2022). *Distancias Estadisticas* [Presentación de PowerPoint]. Aula Global UC3M.

Grané, A., Manzi, G. and Salini, S. (2021) *Smart visualization of mixed data*. Stats 4(2), 472-485; https://doi.org/10.3390/stats4020029 (S.I. Robust Statistics in Action).


NumPy Developers. Legacy Random Generation. *NumPy*.  https://numpy.org/doc/stable/reference/random/legacy.html
