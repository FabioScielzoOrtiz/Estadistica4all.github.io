---
title: 'Métodos de validación de modelos de clasificación no supervisado'
author: 'Fabio Scielzo Ortiz'
date: '16/12/22'
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

</p>
 
</p></span>
</div>


***Se recomienda abrir el artículo en un ordenador o en una tablet.***
 
 
<br>





# Método de evaluación de modelos de clasificación no supervisada


Un método de evaluación de modelos de clasificación no supervisada es un método que permite evaluar un modelo de clustering usando una muestra de train de los predictores y una métrica de evaluación.

En este articulo nos centraremos en una métrica de evaluación denominada silhouette (silueta)



## Definición de la métrica Silhouette

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>



$\hspace{0.25cm}$ Dado un modelo de clustering $M$ , como por ejemplo k-medias o k-medoids.

$\hspace{0.25cm}$ Supongamos que tras entrenar $M$ con las observaciones disponibles para los predictores tenemos que $x_i \in C_h \\$

$\hspace{0.25cm}$ La silueta de $x_i \in C_h$ en el modelo de clustering $M$ es:

$$\mathcal{S}(x_i) \hspace{0.12cm}=\hspace{0.12cm} \dfrac{\overline{\delta}(i,r^*) - \overline{\delta}(i,h)}{Max \left\lbrace \hspace{0.12cm}\overline{\delta}(i,r^*) \hspace{0.12cm},\hspace{0.12cm} \overline{\delta}(i,h)\hspace{0.12cm} \right\rbrace}\\$$


$\hspace{0.25cm}$ Donde:



$$\overline{\delta}(x_i,C_r) \hspace{0.12cm} =\hspace{0.12cm} \dfrac{1}{\# C_r} \cdot \sum_{j \in I(C_r)} \hspace{0.1cm} \delta(x_i , x_j)$$



 
$$b(i) \hspace{0.12cm}=\hspace{0.12cm} \overline{\delta}(x_i, C_h) \hspace{0.12cm}=\hspace{0.12cm}  \dfrac{1}{\# C_h } \cdot \sum_{r \in I(C_h)} \hspace{0.1cm} \delta(x_i , x_r)$$


$$a(i) \hspace{0.12cm}=\hspace{0.12cm} Min \hspace{0.12cm} \left\lbrace \hspace{0.12cm} \overline{\delta}(x_i, C_j)  \hspace{0.12cm}/\hspace{0.12cm} j \neq h \in \lbrace 1,...,k\rbrace \hspace{0.12cm} \right\rbrace \\$$



$\hspace{0.25cm}$ Por tanto: 

$$a(i)=\overline{\delta}(x_i, C_r^*)$$


$\hspace{0.35cm}$ Donde:


$$r^* \hspace{0.12cm}=\hspace{0.12cm} arg\hspace{0.12cm} \underset{r\neq h\in \lbrace 1,..,k\rbrace} {Min} \hspace{0.12cm} \overline{\delta}(x_i, C_r)\\$$  




</p>
 
</p></span>
</div>





**Observaciones:**


- $\overline{\delta}(x_i,C_j)$
es la **media** de las distancias entre la observacion $x_i$ y el resto de observaciones del cluster $C_j$ , para todo $i=1,..,n$ y $j=1,..,k \\$


- $\hspace{0.12cm}\overline{\delta}(x_i, C_{r^*}) \hspace{0.12cm}=\hspace{0.12cm}  Min\hspace{0.12cm} \left\lbrace \hspace{0.12cm}  \overline{\delta}(x_i, C_r) \hspace{0.12cm} / \hspace{0.12cm} r\neq j = 1,...,k  \hspace{0.12cm} \right\rbrace$

<br>

**Interpretación de Silhouette:** $\\[0.6cm]$

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

- $\mathcal{S}(x_i) \in [-1,1] \\$

- Si $\hspace{0.12cm}\mathcal{S}(x_i) \in [0,1]\hspace{0.12cm}$, se considera que $\hspace{0.12cm}x_i\hspace{0.12cm}$ ha sido clasificado **correctamente**, y cuanto más cerca este $\hspace{0.12cm}\mathcal{S}(x_i)\hspace{0.12cm}$ de $\hspace{0.12cm}1\hspace{0.12cm}$ , **mejor** clasificado estará $\hspace{0.12cm}x_i \\$


- Por lo anterior, si $\hspace{0.12cm}\mathcal{S}(x_i) \in [-1,0]\hspace{0.12cm}$, se considera que $\hspace{0.12cm}x_i\hspace{0.12cm}$ ha sido clasificado **incorrectamente**, y cuanto más cerca este $\hspace{0.12cm}\mathcal{S}(x_i)\hspace{0.12cm}$ de $\hspace{0.12cm}-1\hspace{0.12cm}$ , **peor** clasificado estará $\hspace{0.12cm}x_i \\$

</p>
 
</p></span>
</div>



<br>

**Justificaciones:** $\\[0.6cm]$

- Si $\hspace{0.12cm}\overline{\delta}(x_i , C_h) < \overline{\delta}(x_i , C_r^*)\hspace{0.12cm}$, entonces,   la distancia media entre $\hspace{0.12cm}x_i\hspace{0.12cm}$ y el resto de observaciones del cluster $\hspace{0.12cm}C_h\hspace{0.12cm}$ es menor que la distancia media entre x_i y las observaciones del cluster más cernano em media, sin tener en cuenta $\hspace{0.12cm}C_h\hspace{0.12cm}$, es decir, $\hspace{0.12cm}C_{r^*}\hspace{0.12cm}$. Lo cual puede interpretarse como que x_i ha sido **bien** clasificado. $\\[0.6cm]$

- Si $\hspace{0.12cm}\overline{\delta}(x_i , C_h) < \overline{\delta}(x_i , C_r^*)\hspace{0.12cm}$, entonces $\hspace{0.12cm}\mathcal{S}(x_i) \in [0,1] \\$

    - Y cuanto más se cumpla $\hspace{0.12cm}\overline{\delta}(x_i , C_h) < \overline{\delta}(x_i , C_r^*)$ mas cerca estará $\hspace{0.12cm}\mathcal{S}(x_i)\hspace{0.12cm}$ de $\hspace{0.12cm}1 \\$
       
    - En el caso extremo de que $\hspace{0.12cm}\overline{\delta}(x_i , C_h) = 0 < \overline{\delta}(x_i , C_r^*)\hspace{0.12cm}$ , se tendrá que $\hspace{0.12cm}\mathcal{S}(x_i) =1 \\$ 

- Por lo anterior, si $\hspace{0.12cm}\mathcal{S}(x_i) \in [0,1]\hspace{0.12cm}$, se considera que $\hspace{0.12cm}x_i\hspace{0.12cm}$ ha sido clasificado correctamente, y cuanto más cerca este $\hspace{0.12cm}\mathcal{S}(x_i)\hspace{0.12cm}$ de $\hspace{0.12cm}1\hspace{0.12cm}$ , **mejor** clasificado estará $\hspace{0.12cm}x_i \\[1cm]$




- Si $\hspace{0.12cm}\overline{\delta}(x_i , C_h) > \overline{\delta}(x_i , C_r^*)\hspace{0.12cm}$, entonces,   la distancia media entre $x_i$ y el resto de observaciones del cluster $\hspace{0.12cm}C_h\hspace{0.12cm}$ es mayor que la distancia media entre $\hspace{0.12cm}x_i\hspace{0.12cm}$ y las observaciones del cluster más cernano em media, sin tener en cuenta $\hspace{0.12cm}C_h\hspace{0.12cm}$, es decir, $\hspace{0.12cm}C_{r^*}\hspace{0.12cm}$. Lo cual puede interpretarse como que $\hspace{0.12cm}x_i\hspace{0.12cm}$ ha sido **mal** clasificado. $\\[0.6cm]$

- Si $\hspace{0.12cm}\overline{\delta}(x_i , C_h) > \overline{\delta}(x_i , C_r^*)\hspace{0.22cm} \Rightarrow \hspace{0.22cm}\mathcal{S}(x_i) \in [-1,0] \\$

    - Cuanto más se cumpla $\hspace{0.12cm}\overline{\delta}(x_i , C_h) < \overline{\delta}(x_i , C_r^*)\hspace{0.12cm}$ mas cerca estará $\hspace{0.12cm}\mathcal{S}(x_i)\hspace{0.12cm}$ de $\hspace{0.12cm}-1 \\$ 
    
    - En el caso extremo de que $\hspace{0.12cm}\overline{\delta}(x_i , C_h) > \overline{\delta}(x_i , C_r^*)=0\hspace{0.12cm}$ , se tendrá que $\hspace{0.12cm}\mathcal{S}(x_i) =-1 \\$

- Por lo anterior, cuanto más cerca este $\hspace{0.12cm}\mathcal{S}(x_i)\hspace{0.12cm}$ de $\hspace{0.12cm}-1\hspace{0.12cm}$ , peor clasificado estará $\hspace{0.12cm}x_i \\$

- Por lo anterior, si $\hspace{0.12cm}\mathcal{S}(x_i) \in [-1,0]\hspace{0.12cm}$, se considera que $\hspace{0.12cm}x_i\hspace{0.12cm}$ ha sido clasificado **incorrectamente**, y cuanto más cerca este $\hspace{0.12cm}\mathcal{S}(x_i)\hspace{0.12cm}$ de $\hspace{0.12cm}-1\hspace{0.12cm}$ , **peor** clasificado estará $\hspace{0.12cm}x_i$



<br>


**Métrica Silhouette**

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

Se define la métrica Silhouette para un modelo de clustering $M$  como la media de las siluetas de las observaciones de los predictores:


$$\overline{\mathcal{S}} (M) \hspace{0.12cm} =  \hspace{0.12cm}  \dfrac{1}{n} \cdot \sum_{i=1}^n \mathcal{S}(x_i, M)$$ 


</p>
 
</p></span>
</div>




<br>

## Método de evaluación basado en Silhouette

Como estamos considerando modelos de aprendizaje supervisado en los que por definición no se tienen datos de la respuesta, aqui la idea de considerar muestras de train y test no tiene utilidad, puesto que el fundamento de esa idea es comparar las predicciones que el modelo hace para la respuesta con la muestra de test de la respuesta, pero en este caso no se tiene ninguna muestra (ni de train ni de test) de la respuesta. Es esto lo que caracteriza a los modelos no supervisados.

Por ello el método de evaluación basado en Silhouette consiste simplemente en usar la muestra disponible de los predictores como muestra de train, es decir, usarla para entrenar el modelo de clustering considerado, y con el modelo entrenado calcular la métrica Silhouette, antes definida.

Notese que la metrica Silhouette depende del modelo entrenado, al depender de los clusters finales que se obtienen tras entrenarlo. Por lo que para modelos de clustering que generen distintas configuraciones finales de clusters se obtendran valores distintos de la métrica Silhouette.


<br>

# Ajuste del hiper-parámetro k mediante Silhouette

A continuación vamos a exponer un método para seleccionar el hiper-parametro k de un modelo de clustering como k-medias o k-medoids basado en la metrica Silhouette.


<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

Dado un modelo de clustering $M$ , como podría ser el k-medias o k-medoids.


1) Se entrena $M$ un número $B$ de veces con las mismas observaciones de los predictores, pero en cada ocasión se utiliza un valor del hiper-parametro $k$ distinto.

Por tanto, se obtienen los siguientes $B$ modelos entrenados: $\widehat{M}(k=k_1)  \hspace{0.12cm}, \hspace{0.12cm} \widehat{M}(k=k_2) \hspace{0.12cm}, ..., \hspace{0.12cm} \widehat{M}(k=k_B)$

Donde $\widehat{M}(k=k_j)$ es el modelo de clustering $M$, con hiper-parametro $k=k_1$, ya entrenado.


2) Se calcula la métrica Silhouette $\overline{\mathcal{S}}$ para cada uno de esos $B$ modelos:

$$\overline{\mathcal{S}}\left(\widehat{M}(k=k_1)\right)  \hspace{0.12cm}, \hspace{0.12cm} \overline{\mathcal{S}}\left(\widehat{M}(k=k_2)\right)  \hspace{0.12cm}, ..., \hspace{0.12cm} \overline{\mathcal{S}}\left(\widehat{M}(k=k_B)\right) \\$$ 


3) El valor óptimo del hiper-parametro $k^*$ es aque que maximixa la métrica Silhouette (de Silhouette media)


$$k^* \hspace{0.12cm}=\hspace{0.12cm} arg \hspace{0.2cm}\underset{k\in \lbrace k_1,...,k_B\rbrace}{Max} \hspace{0.2cm}\overline{\mathcal{S}}\left(\widehat{M}(k)\right)$$

Es decir: 

$$\text{Si} \hspace{0.4cm} \overline{\mathcal{S}}\left(\widehat{M}(k=k_j)\right) > \overline{\mathcal{S}}\left(\widehat{M}(k=k_r)\right) \hspace{0.2cm} , \forall r\neq j =1,...,B \hspace{0.12cm}\Rightarrow\hspace{0.12cm} k^* = k_j$$


</p>
 
</p></span>
</div>




<br>


# Selección de modelos de clasificación no supervisada mediante Silhouette


Vamos a exponer un método de selección de modelos de clustering basado en la métrica Silhouette.



<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

Dados $\hspace{0.12cm}B\hspace{0.12cm}$ modelos de clustering $M_1\hspace{0.12cm},\hspace{0.12cm}M_2\hspace{0.12cm},...,\hspace{0.12cm}M_B$,  se selcciona aquel que tenga mayor Silhouette.

Es decir, bajo este método de selección de modelos:

Dados $\hspace{0.12cm}B\hspace{0.12cm}$ modelos de clustering $M_1\hspace{0.12cm},\hspace{0.12cm}M_2\hspace{0.12cm},...,\hspace{0.12cm}M_B$, el modelo seleccionado es $\hspace{0.12cm}M_{j\hspace{0.08cm}^*}$

Donde:

$$j\hspace{0.08cm}^* \hspace{0.12cm}=\hspace{0.12cm} arg \hspace{0.2cm} \underset{j \in \lbrace 1,...,B\rbrace}{Max} \hspace{0.2cm} \overline{\mathcal{S}}\left(\widehat{M}_j \right) $$

</p>
 
</p></span>
</div>





<br>

<br>
