---
title: 'Introducción a la estadística bayesiana'
author: 'Marcos Álvarez Martín'
date: '19/02/23'
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


$\hspace{0.3cm}$ **Más artículos:    $\hspace{0.1cm}$ [Estadistica4all](https://estadistica4all.com/)**

$\hspace{0.3cm}$ **Autor:** $\hspace{0.1cm}$ [Marcos Álvarez Martín.](http://estadistica4all.com/autores/autores.html) $\hspace{0.2cm}$
 [Fabio Scielzo Ortiz.](http://estadistica4all.com/autores/autores.html)

$\hspace{0.3cm}$ **Si utilizas este artículo, por favor, cítalo:** 

$\hspace{0.5cm}$ Álvarez Martín, M., Scielzo Ortiz, F. (2023). Introducción a la estadística bayesiana. http://estadistica4all.com/Articulos/ajuste_hiperparametros.html


</p>
 
</p></span>
</div>


***Se recomienda abrir el artículo en un ordenador o en una tablet.***
 
 
 <br>




Este artículo forma es el primero de una serie de artículos que serán publicados en este blog cuyo objetivo es explicar   diferentes técnicas utilizadas en la
estadística clásica y su análogo en la corriente bayesiana.

Antes de empezar, como no podía ser de otra manera, vamos a introducir qué es
esto de la estadística bayesiana, cuales son las circunstacias de idoneidad de este enfoque y las principales diferencias con el enfoque clásico o frecuentista.






# Motivación de la estadística bayesiana

-   Las técnicas bayesianas nos permiten combinar información de una
    muestra con información de expertos o combinar información de
    múltiples muestras a través del teorema de Bayes.$\\[0.3cm]$
    
-   En la época del "Big Data", es posible resolver problemas muy
    complejos con aproximaciones bayesianas rápidas, por ejemplo,
    Variational Bayes es uno de los más empleados en problemas de
    aprendizaje profundo ("deep learning").$\\[0.3cm]$
    
-   El uso de métodos bayesianos está creciendo de manera exponencial en
    este siglo, principalmente, por el auge de las nuevas tecnologías y
    el alto desarrollo del software que permite aplicar este tipo de
    técnicas. $\\[0.3cm]$
    
-   El uso de dogmas de la estadística clásica empiezan a ser bastante
    cuestionados, como por ejemplo, el famosísimo p-valor.
    
    <br>

# Historia de la estadística bayesiana <a class="anchor" id="1"></a>

Ahora, vamos a contextualizar un poco esto de la estadística bayesiana
,y daremos algunos ejemplos de uso en los cuales se aplicaron técnicas
bayesianas para la resolución de problemas de diversa índole. Todo esto,
con el objetivo de desmitificar que la estadística bayesiana son
resultados teóricos sin ninguna utilidad.

En la década de 1740, el reverendo Thomas Bayes desarrolla su famoso
teorema para el caso especial de la predicción de la probabilidad en un
modelo binomial. El teorema no fue publicado en vida del autor, es más,
según algunas teorías, Bayes no quiso publicarlo por la gran aceptación
de las técnicas clásicas, que en ese momento se estaban presentando y
que siglos después aún seguimos utilizando. El que publicó su teorema
fue Richard Price en 1763, dos años después del fallecimiento del autor,
cuando el propio Price encontró sus avances entre el montón de papeles
que el autor tenía en su despacho.

A pesar de que Bayes fue el que descubrió el teorema que ahora lleva su
apellido, fue Laplace el que lo redescubre y generaliza el teorema de
Bayes en 1774. Uno de sus usos fue el de estimar la masa de Saturno.
Durante 40 años, Laplace desarrolla algunas de las ideas principales de
lo que hoy conocemos como estadística bayesiana, por lo que es Laplace y
no Bayes, el padre de la inferencia bayesiana.

En el siglo XIX, la inferencia bayesiana empieza a perder popularidad,
porque los científicos no querían resultados subjetivos.

Otro de los principales ejemplos de uso de técnicas bayesianas fue la
utilización de estas para descifrar el código Enigma Nazi, en el
contexto de la Segunda Guerra Mundial, el cuál llevó a cabo el
multidisciplinar Alan Turing.

Hasta finales del siglo XX, uno de los grandes inconvenientes de los
métodos bayesianos fue su difícil implementación. La mejora de la
informática al final del siglo XX facilitó el uso de las técnicas de
simulación que ha llevado al creciente uso de la estadística bayesiana
en el último siglo.

En este siglo, las diferencias filosóficas entre el bayesianismo y el
frecuentismo han ido desapareciendo. La gente es más pragmática y
emplean las técnicas que mejor funcionan en sus problemas.



<br>


---


<br>



# Repaso de Teoría de la Probabilidad

El objetivo de esta sección es el de familiarizarnos con algunos elementos de teoría de la probabilidad, los cuales serán relevantes en secciones posteriores de este artículo, y en posteriores entregas de la serie.





## Experimento Aleatorio 

Un experimento aleatorio $\hspace{0.08cm}\varepsilon\hspace{0.08cm}$ es un  experimento que si se repite varias veces en las mismas condiciones puede ofrecer diferentes resultados.

<br>

## Espacio Muestral

El espacio muestal de un experimento aleatorio $\hspace{0.08cm}\varepsilon\hspace{0.08cm}$ es el conjunto de todos los resultados posibles de una realización del esperimento, y se denota por $\hspace{0.08cm}\Omega(\varepsilon)\hspace{0.08cm}$.


<br>

## Sucesos

Sea $\hspace{0.08cm}\varepsilon\hspace{0.08cm}$  un experimento aleatorio con espacio muestral $\hspace{0.08cm}\Omega(\varepsilon)\hspace{0.08cm}$ ,

A es un suceso del experimento aleatorio $\hspace{0.08cm}\varepsilon\hspace{0.08cm}$ $\hspace{0.08cm}\Leftrightarrow\hspace{0.08cm}$ $\hspace{0.08cm}A\subset \Omega(\varepsilon)\hspace{0.08cm}$.


## Ocurrencia de sucesos

Sea $\hspace{0.08cm}w_i \in \Omega(\varepsilon)\hspace{0.08cm}$ es el resultado obtenido de la i-esima realizacion del exprerimento aleatorio $\hspace{0.08cm}\varepsilon\hspace{0.08cm}$ ,


Ocurre el suceso $\hspace{0.08cm}A \subset \Omega(\varepsilon)\hspace{0.08cm}$  $\hspace{0.08cm}\Leftrightarrow\hspace{0.08cm}$ $\hspace{0.08cm}w_i \in A \hspace{0.08cm},\hspace{0.08cm} \exists i=1,2,3,...$


### Suceso Imposible

Sea $\hspace{0.08cm}\emptyset\hspace{0.08cm}$ el conjunto vacio,


$\emptyset\hspace{0.08cm}$ es el suceso imposible, ya que nunca ocurre.



### Suceso Seguro


$\Omega(\varepsilon)\hspace{0.08cm}$ es el suceso seguro, ya que siempre ocurre.



## Suceso Simple


$A\subset \Omega(\varepsilon)\hspace{0.08cm}$ es un suceso simple $\hspace{0.15cm}\Leftrightarrow\hspace{0.15cm}$ $\# A = 1$


## Suceso Compuesto


$A\subset \Omega(\varepsilon)\hspace{0.08cm}$ es un suceso compuesto $\hspace{0.15cm}\Leftrightarrow\hspace{0.15cm}$ $\# A > 1$


## Operaciones con sucesos

Sean $\hspace{0.08cm}A, B \subset \Omega(\varepsilon)$

### Unión de sucesos


$$A\cup B \hspace{0.08cm}=\hspace{0.08cm} \lbrace \hspace{0.08cm} w \in \Omega(\varepsilon)\hspace{0.08cm} : \hspace{0.08cm} w \in A \hspace{0.2cm} o\hspace{0.2cm} w \in B  \hspace{0.08cm}  \rbrace$$


**Observación:**

Sea $\hspace{0.08cm}w \in \Omega(\varepsilon)\hspace{0.08cm}$ el resultado de una realizacion del experimento aleatorio $\hspace{0.08cm}\varepsilon\hspace{0.08cm}$.

Si $\hspace{0.08cm}w \in A\cup B \hspace{0.15cm} \Rigtharrow\hspace{0.15cm}$  ocurre $\hspace{0.08cm}A\hspace{0.08cm}$ o $\hspace{0.08cm}B\hspace{0.08cm}$.

<br>

#### Propiedades de la unión de sucesos

1) $A\cup B \hspace{0.08cm}=\hspace{0.08cm} B\cup A$

2) $A \cup A \hspace{0.08cm}=\hspace{0.08cm} A$

3) $A \cup \C \hspace{0.08cm}=\hspace{0.08cm} A$

4) $A \cup \Omega(\varepsilon) \hspace{0.08cm}=\hspace{0.08cm} \Omega(\varepsilon)$

5) $A \cup A^c \hspace{0.08cm}=\hspace{0.08cm} \Omega(\varepsilon)$

6) Si $\hspace{0.08cm} A \cup B \hspace{0.08cm}=\hspace{0.08cm} \emptyset \hspace{0.15cm}\Rightarrow\hspace{0.15cm} \# A \cup B \hspace{0.08cm}=\hspace{0.08cm} \#A + \#B$

7) $\# A \cup B \hspace{0.08cm}=\hspace{0.08cm} \# A + \# B - \# A\cap B$


<br>

### Intersección de sucesos

$$A\cap B \hspace{0.08cm}=\hspace{0.08cm} \lbrace \hspace{0.08cm} w \in \Omega(\varepsilon) \hspace{0.08cm} : \hspace{0.08cm} w \in A \hspace{0.2cm} y\hspace{0.2cm} w \in B   \hspace{0.08cm} \rbrace$$

<br>

**Observación:**

Sea $\hspace{0.08cm}w \in \Omega(\varepsilon)\hspace{0.08cm}$ el resultado de una realizacion del experimento aleatorio $\hspace{0.08cm}\varepsilon\hspace{0.08cm}$.

Si $\hspace{0.08cm}w \in A\cap B \hspace{0.15cm}\Rigtharrow\hspace{0.15cm}$  ocurre $\hspace{0.08cm}A\hspace{0.08cm}$ y $\hspace{0.08cm}B\hspace{0.08cm}$.

<br>

#### Propiedades de la intersección de sucesos

1) $A\cap B \hspace{0.08cm}=\hspace{0.08cm} B \cap A$

2) $A\cap A \hspace{0.08cm}=\hspace{0.08cm} A$

3) $A \cap \emptyset \hspace{0.08cm}=\hspace{0.08cm} \emptyset$

4) $A \cap \Omega(\varepsilon) \hspace{0.08cm}=\hspace{0.08cm} A$

5) $A \cap A^c \hspace{0.08cm}=\hspace{0.08cm} \emptyset$


<br>

### Diferencia de sucesos

$$A - B \hspace{0.08cm}=\hspace{0.08cm} \lbrace \hspace{0.08cm} w \in \\Omega(\varepsilon) \hspace{0.08cm} : \hspace{0.08cm} w \in A \hspace{0.2cm} y \hspace{0.2cm} w \notin B   \hspace{0.08cm} \rbrace$$


<br>

**Observación:**

Sea $\hspace{0.08cm}w \in \Omega(\varepsilon)\hspace{0.08cm}$ el resultado de una realizacion del experimento aleatorio $\hspace{0.08cm}\varepsilon\hspace{0.08cm}$ .

Si $\hspace{0.08cm}w \in A - B \Rigtharrow\hspace{0.08cm}$  ocurre $\hspace{0.08cm}A\hspace{0.08cm}$ pero no $\hspace{0.08cm}B\hspace{0.08cm}$.


<br>

#### Propiedades de la diferencia de sucesos

1) $A-B \hspace{0.08cm}\neq\hspace{0.08cm} B - A$  , en general

2) $A-A \hspace{0.08cm}=\hspace{0.08cm} \emptyset$

3) $A-\emptyset \hspace{0.08cm}=\hspace{0.08cm} A$

4) $A - \Omega(\varepsilon) \hspace{0.08cm}=\hspace{0.08cm} \emptyset$

5) $A- B \hspace{0.08cm}=\hspace{0.08cm} A - (A\cap B)$

6) $A-B \hspace{0.08cm}=\hspace{0.08cm} A\cap B^c$



<br>


### Suceso Contrario

$$A^c  \hspace{0.08cm}=\hspace{0.08cm} \lbrace \hspace{0.08cm} w \in \Omega(\varepsilon) \hspace{0.08cm} : \hspace{0.08cm} w \notin A  \hspace{0.08cm} \rbrace$$

#### Propiedades del suceso contrario

1) $\emptyset^c \hspace{0.08cm}=\hspace{0.08cm} \Omega(\varepsilon)$

2) $\Omega(\varepsilon)^c \hspace{0.08cm}=\hspace{0.08cm} \emptyset$

3) $(A^c)^c \hspace{0.08cm}=\hspace{0.08cm} A$

<br>

## Leyes de teoria de conjuntos útiles para sucesos


### Leyes Asociativas

1) $A \cup (B \cup C) = (A \cup B ) \cup C$

2) $A \cap (B \cap C) = (A \cap B ) \cap C$

### Leyes Distributivas

1) $A \cap (B \cup C) = (A \cap B) \cup (A \cap C)$

2) $A \cup ( B \cap C) = (A \cup B) \cap (A \cup C)$

### Leyes de Morgan

1) $(A \cup B)^c = A^c \cap B^c$

2) $(A \cap B)^c = A^c \cup B^c$




## Conjunto potencia del espacio muestral

El conjunto potencia del espacio muestral $\Omega$ es:

$$2^\Omega = \lbrace A / A \subset \Omega  \rbrace$$

Propiedades:

$$\# 2 ^\Omega = 2 ^{\# \Omega}$$ 

## Sucesos Disjuntos

$A$ y $B$ son sucesos disjuntos $\Leftrightarrow A\cap B = \emptyset$

$A_1$ , $A_2$ ,..., $A_n$ son sucesos disjuntos $\Leftrightarrow A\cap A_2 \cap ... \cap A_n = \emptyset$

## Sucesos Disjuntos dos a dos

$A_1$ , $A_2$ ,..., $A_n$ son sucesos disjuntos dos a dos $\Leftrightarrow A_i \cap A_j = \emptyset$ , $\forall i \neq j = 1,...,n$



## Concepto de probabilidad

### Probabilidad de Laplace

Sea $\varepsilon$ un experimento aleatorio con espacio muestral $\Omega$ , tal que $\# \omega < \infty$  y $\# \Omega \neq 0$

La probabilidad en el sentido de Laplace de un suceso $A \subset \Omega$ se define como:

$$P(A) = \dfrac{\# A}{\# \Omega} = \dfrac{\text{casos favorables}}{\text{casos posibles}}$$

#### Propiedades de la probabilidad clásica:

1) $P(\Omega) = 1$

2) $P(A) \geq 0$

3) $P(A \cup B) = P(A) + P(B) + P(A\cap B)$

4) Si $A$ y $B$ son sucesos disjuntos $(A\cap B = \emptyset)$ , entonces:

$$P(A\cup B)= P(A) + P(B)$$


### Probabilidad Frecuentista

Sea $\varepsilon$ un experimento aleatorio con espacio muestral $\Omgea$ y sea $A\subset \Omega$

Si se realiza $n$ veces el experimento $\varepsilon$ y $n(A)$ es el nº de veces que ocurre el suceso $A$ en las $n$ realizaciones del experimento, la probabilidad en sentido frecuentista de $A$ se define como:



$$P(A) = \underset{n \rightarrow \infty}{lim}\left( \dfrac{n(A)}{n} \right)$$



Es decir, la probabilidad de un suceso de un experimento aleatorio es la proporción de veces que ocurre cuando el experimento se repite muchas veces.


#### Propiedades

1) $P(\Omega) = 1$

2) $P(\emptyset)=0$

3) $P(A) \geq 0$

4) $P(A\cup B) = P(A) + P(B) - P(A\cap B)$

5)  Si $A$ y $B$ son sucesos disjuntos $(A\cap B = \emptyset)$

$$P(A\cup B) = P(A) + P(B)$$




### Probabilidad Axiomatica

Sea $\varepsilon$ un experimento aleatorio con espacio muestral $\Omega$


$P$ es una medida de probabilidad definida sobre $\Omega$ $\Leftrightarrow$

1) $P: 2^\Omega \rightarrow \mathbb{R}$

2) $P(A) \geq 0$

3) $P(\Omega) = 1$

4) Si $A_1,A_2,A_3,... \subset \Omega$  , entonces:

$$P(A_1 \cup A_2 \cup A_3 \cup ...) = P(A_1)+P(A_2)+P(A_3)+...$$


#### Propiedades


1) $P(\emptyset) = \0$

2) Si $A_1,A_2,...,A_n \subset \Omega$  , entonces:

$$P(A_1 \cup A_2 \cup ...\cup A_n) = P(A_1)+P(A_2)+...+P(A_n)$$

3) $P(A^c) = 1 - P(A)$


4) Si $A \subseteq B \Rightarrow P(A) \geq P(B)$

5) Si $A \subseteq B \Rightarrow P(B-A) = P(B)-P(A)$

6) $0 \geq P(A) \geq 1$

7) $P(A-B) = P(A) - P(A\cap B)$

8) $P(A \cup B)= P(A) + P(B) - P(A\cap B)$





## Probabilidad Condicionada

La probabilidad de $A$ condicionada a $B$ se define como:

$$P(A | B) = \dfrac{P(A\cap B)}{P(B)}$$



### Propiedades

1) $P(\emptyset | B) = 0$

2) Si $A_1 , A_2,...,A_n$ son disjuntos dos a dos , entonces:

$$P(A_1 \cup A_2 \cup ... \cup A_n | B) = P(A_1 | B) + P(A_2 | B)  + ... + P(A_n | B)$$

3) $P(A^c | B) = 1 - P(A | B)$

4) Si $A \subseteq D \Rightarrow P(A | B) \geq P( D | B)$

5) Si $A \subseteq D \Rightarrow P(D-A | B) = P( D | B) - P(A | B$

6) $0 \geq P(A | B)   \geq 1$

7) $P(A-D | B) = P(A|B) - P(A\cap D | B)$

8) $P(A \cup B) = P(A) + P(B) - P(A\cap B)$



## Partición del espacio muestral

Sea $\varepsion$ un experimento aleatorio con espacio muestral $\Omega$

Sean $A_1,A_2, ..., A_n \subseteq \Omega$

$A_1,A_2, ..., A_n$ es una partición de $\Omega$  $\Leftrightarrow$

1)  $B_i \neq \Omega , \forall i = 1,...,n$


2) $B_i \cap B_j = \emptyset , \forall i \neq j = 1,...,n$

3) $B_1 \cup ... \cup B_n = \Omega$



## Teorema de la Probabilidad Total

Sea $A \subseteq \Omega$

Si $B_1,...,B_n$ una partición de $\Omega$ , entonces:

$$P(A)=P(A\cap B_1) +...+ P(A \cap B_n)$$



## Teorema de la Probabilidad Total con probabilidad condicionada

Sea $A \subseteq \Omega$

Si $B_1,...,B_n$ una partición de $\Omega$, con $P(B_i)>0$ , entonces:


$$P(A) = P(A | B_1)\cdot P(B_1) + ... + P(A | B_n)\cdot P(B_n)$$


## Teorema de Bayes

Sean $A,B \subset \Omega$ , con $P(B)\neq 0$

$$P(A |B) = \dfrac{P(B|A)\cdot P(A)}{P(B)}$$

## Independencia de sucesos

$A$ y $B$ son sucesos independientes $\Leftrightarrow$ $P(A\cap B) = P(A)\cdot P(B)$

### Propiedades

1) $A$ y $B$ son sucesos independientes $\Leftrightarrow$ $P(A | B) = P(A)$ $\Leftrightarrow$ $P(B | A) = P(B)$

2) Si $A$ y $B$ son sucesos independientes $\Rightarrow$ $A^c$ y $B^c$ también lo son 


3) Sucesos disjuntos no implica independientes

4) Sucesos independientes no implica disjuntos



## Independencia de múltiples sucesos


$A_1 , A_2, ..., A_n$ son sucesos independientes $\Leftrightarrow$

1) Son independientes 2 a 2

2) Son independientes 3 a 3

...

n+1) Son independientes n a n


$\Leftrightarrow$


$1)$ $P(A_i \cap A_j)=P(A_i)\cdot P(A_j) , \forall i \neq j = 1,...,n$

$2)$ $P(A_i \cap A_j \cap A_r)=P(A_i)\cdot P(A_j)\cdot P(A_r) , \forall i \neq j \neq r = 1,...,n$

...

$n+1)$ $P(A_1 \cap A_2 \cap ... \cap A_n)=P(A_1)\cdot P(A_2)\cdot ... \cdot P(A_n)$



## Sigma Algrebra

$\sigma (\Omega)$ es un sigma-algebra de $\Omega$ $\Leftrightarrow$


1) $\sigma (\Omega) = \lbrace A / A\subset \Omega\rbrace$ 

Es decir: $\sigma (\Omega)$ es un conjunto de subconjuntos de $\Omega$

Otra forma de expresarlo: $\sigma (\Omega) \subseteq 2^\Omega$


2) $\Omega \in \sigma (\Omega)$

3) Si $A \in \sigma(\Omega) \Rightarrow A^c \in \sigma (\Omega)$

4) Si $A_1, A_2 , A_3 ,... \in \sigma (\Omega)  \Rightarrow A_1 \cup A2 \cup A_3 \cup ... \in \sigma (\Omega)$


### Propiedades:

1) $\emptyset \in \sigma (\Omega)$

2) Si $A_1, A_2, A_3,... \in \sigma (\Omega) \Rightarrow A_1 \cap A_2 \cap A_3 \cap ... \in \sigma (\Omega)$

3) Si $A,B \in \sigma (\Omega) \Rightarroe A-B \in \sigma (\Omega)$



## Variables aleatorias


$X$ es una variable aleatoria (v.a.) definida sobre $(\Omega , \sigma (\Omega)) \Leftrightarrow$

1) $X: \Omega \rightarrow R$
   
   $\hspace{0.5cm} w \rightarrow X(w)$


2) $\lbrace w \in \Omega / X(w)=x \rbrace \in \sigma(\Omega) , \forall x \in \mathbb{R}$





**Observaciones:**

1) Formalmente una v.a. ni es una variable ni es aleatoria, es una funcion que asigna números a los elementos de un espacio muestral.

2) Definiciones adicionales:

$$X=x  = \lbrace w\in \Omega / X(w) = x \rbrace$$

$$ X\in A  = \lbrace w\in \Omega / X(w) \in A \rbrace$$



## Variables Aleatorias y Probabilidad

Dada una medida de probabilidad $P: \sigma(\Omega) \righarrow [0,1]$


$P$ esta definida en $X=x$ , para todo $x\in \mathbb{R}$

Es decir, $P(X=x) \in [0,1]$ y se cumplen todas las propiedades de la probabilidad en sentido axiomatico.



## Variables aleatorias discretas y continuas

Sea $X$ una v.a. 


$X$ es **discreta** $\Leftrightarrow Im(X)$ es un conjunto contable/numerable

$X$ es **continua** $\Leftrightarrow Im(X)$ es un conjunto **no** contable/numerable




Donde:

$$Im(X)= {x \in \mathbb{R} / \exist w \in \Omega , X(w) = x \rbrace$$ 

Es decir, $Im(X)$ es la imagen de la v.a. $X$ (notese que $X$ es una función, luego tiene dominio e imagen).


**Observación**

Un conjunto A es contable/numerable $\Leftrightarrow$ Existe alguna funcion $f: \mathbb{N} \rightarrow A$ que sea **biyectiva** 

Es decir, que para todo $y\in Im(f)$ , exista un único numero natural $x \in Dom(f)$ tal que $f(x)=y$



## Función de probabilidad

Sea $X$ una v.a. **discreta**

$P_X$ es la función de probabilidad de la v.a. $X \Leftrightarrow$


$$P_X(x) = P(X=x) \cdot \mathbb{1}_{\lbrace x\in Im(X) \rbrace}$$


Donde:


 $\mathbb{1}_{\lbrace x\in Im(X) \rbrace}$  es igual a 1 cuando $x\in Im(X)$   y 0 cuando $x\notin Im(X)$
 
 
### Propiedades

1) $P_X (x) \geq 0 , \forall x \in \mathbb{R}$
 
2) $\sum_{x\in\mathbb{R}} P_X(x) = 1$ 
 
3) Si $A\subset \mathbb{R} \Rightarrow  P(X\in A) = \sum_{x\in A} P_X(x)$
 
 
 
## Función de densidad

Sea $X$ una v.a. **continua**


 
$f_X$ es la funcion de densidad de la v.a. $X \Leftrightarrow$

1) $f_X(x) \geq 0 , \forall x \in Im(X)$

2) $f$ es integrable

3) $P(X\in (a,b)) = \int_a^b f(x)\cdot dx$
 
 
### Propiedades

1) $\int_{-\infty}^{\infty} f(x)\cdot dx = 1$

2) Toda funcion no negativa, integrable y cuya integral entre $-\infty$ y $\infty$ sea 1 es una función de densidad.
 
 
 
## Función de distribución


$F_X$ es la función de distribucion de la v.a.  $X \Leftrightarrow$ $F_X(x)= P(X \geq x)$


### Propiedades


1) Si $X$ es una v.a. **continua** 

$$F_X(x)= P(X \geq x) = \int_{-\infty}^{x} f_X(z)\cdot dz$$



2) Si $X$ es una v.a. **discreta** : 


$$F_X(x) = P(X \geq x) = \sum_{z \geq x} P(X=z)$$
 
 
3) $\undersert{x\rightarrow \infty}{lim} F_X(x) = 1$
 
4) $\underset{x\rightarrow -\infty}{lim} F_X(x) = 0$

5) $F_X$ es una función creciente



## Distribución de probabilidad de una variable aleatoria

La distribucion de probabilidad de una v.a. hace referencia a su funcion de densidad o probabolidad, o a su funcion de distribución.


## Esperanza de una variable aleatoria

Si $X$ es una v.a. **discreta** :

$$E[X]= \sum_{x\in \mathbb{R}} x \cdot P(X=x)$$


Si $X$ es una v.a. **continua** : 

$$E[X] = \int_{-\infty}^{\infty} x \cdot f_X(x) \cdot dx$$


### Propiedades

1) $E[a]=a$

2) $E[b\cdot X] = b \cdot E[X]$

3) $E[a + b\cdot X] = a + b \cdot E[X]$

4) $E[X_1 + X_2 + ...+ X_n]= E[X_1]+E[X_2] + ... + E[X_n]$

5) $E[g_1(X_1) + ... + g_n(X_n)]=E[g_1(X_1)]+...+E[g_n(X_n)]$

6) Si $X_1,...,X_n$ son independientes, entonces:

$E[X_1 \cdot X_2 \cdot ...\cdot X_n]= E[X_1]\cdot E[X_2] \cdot ... \cdot E[X_n]$

7) Si $X_1,...,X_n$ son independientes, entonces:

$E[g_1(X_1) \cdot ... \cdot g_n(X_n)]=E[g_1(X_1)]\cdot ...\cdot E[g_n(X_n)]$

8) Formulas de transferencia:

Si $X$ es **discreta** :


$$E[g(X)] = \sum_{x\in \mathbb{R}} x \cdot P(g(X)=x) = \sum_{x\in \mathbb{R}} g(x) \cdot P(X=x)$$


Si $X$ es **continua**

$$E[g(X)] = \int_{-\infty}^{\infty} x \cdot f_{g(X)}(x) \cdot dx =  \int_{-\infty}^{\infty} g(x) \cdot f_X(x) \cdot dx$$



Donde: $g(X)$ es una transformación de $X$



## Varianza de una variable aleatoria


$$Var(X) = E\left[ (X - E[X])^2 \right]$$
 
 
 
### Propiedades 
 
1) $Var(X) \geq 0$

2) $Var(a) = 0$

3) $Var(b\cdot X) = b^2 \cdot Var(X)$

4) $Var(a + b\cdot X) = b^2 \cdot Var(X)$

5) $Var(X)=E[X^2] - E[X]^2$

6) $Var(g_1(X)+g_2(Y)) = Var(g_1(X)) + Var(g_2(Y)) + 2\cdot Cov(g_1(X),g_2(Y))$

7) $Var(a\cdot X + b\cdot Y) = a^2 \cdot Var(X) + b^2 \cdot Var(Y) + 2\cdot Cov(X,Y)$

8) Si $X$ e $Y$ son independientes, entonces:

$Var(a\cdot X , b\cdot Y) = a^2\cdot Var(X) + b^2 \cdot Var(Y)$ 



## Covarianza 

$$Cov(X,Y) = E[ (X- E[X])\cdot (Y-E[Y])]$$

### Propiedades 

1) $Cov(X,Y) = E[X\cdot Y] - E[X]\cdot E[Y]$

2) Si $X$ e $Y$ son independientes $\Rightarrow$ $Cov(X,Y)=0$

3) Si $Cov(X,Y) \neq 0$ $\Rightarrow$ $X$ e $Y$ son independientes

4) Si $Cov(X,Y)=0$ $\Rightarrow$ 













## Distribuciones de probabilidad discretas


### Distribución Uniforme discreta


$$X \sim Unif(x_1,....,x_n) \Leftrightarrow P(X=x) = \dfrac{1}{n}\cdot 1_{\lbrace x\in \lbrace x_1,...,x_n \rbrace \rbrace}$$


#### Propiedades 


1) $E[X] = \dfrac{1}{n} \sum_{i=1}{n} x_i = media(x_1,...,x_n)$
 
2) $Var(X) = \dfrac{1}{n} \sum_{i=1}{n} (x_i - E[X])^2 = varianza(x_1,...,x_n)$
 
3) Sea $(x_{(1)},...,x_{(n)})$ el vector $(x_1,...,x_n)$ ordenado de menor a mayor:

$$F_X(x) = \left\lbrace\begin{array}{c} 1 , si x>x_{(n)} \\ 0 , si x < x_{(1)} \\ \dfrac{i}{n} , si x=x_{(i)} \end{array}\right.$$
 
 

### Distribución de Bernoulli

$$X \sim Bernoulli(p) \Leftrightarrow P(X=x) =p^x (1-p)^x \cdot 1_{\lbrace x=0,1 \rbrace \rbrace}$$


**Observaciones:**

1) Las v.a. Bernoulli(p) se usan para modelar experimentos aleatorios con dos únicos resultados contrarios (exito-fracaso)
 tales que la probabilidad del exito es p y la del fracoso 1-p.
 
 A este tipo de experimentos aleatorios se les llama experimentos tipo Bernoulli.
 
2) Si $X \sim Bernoulli(p)$ , entonces:

$X$ puede interpretarse como el nº de exitos obtenidos tras realizar una vez un experimento tipo Bernoulli (notese que este nº solo puede ser 0 o 1),  con probabilidad de exito $p$




#### Propiedades

1) $P(X=1)=p$

2) $P(X=0)=1-p$

3) $E[X]=p$

4) $Var(X)= p\cdot (1-p)$

5) $$F_X(x) = \left\lbrace\begin{array}{c} 1 , si x\geq 1 \\ 0 , si x < 0 \\ 1-p , si x\in [0 , 1) \end{array}\right.$$





### Distribución Binomial


$$X \sim Binomial(n,p) \Leftrightarrow P(X=x) =\binom{n}{x} \cdot p^x (1-p)^x \cdot 1_{\lbrace x= 0,1,...,n \rbrace \rbrace}$$


**Observación:**


1) Si $X \sim Binomial(p)$ , entonces:

$X$ puede interpretarse como el nº de exitos obtenidos tras realizar $n$ veces un experimento tipo Bernoulli (notese que este nº solo puede ser 0,1,...,n),  con probabilidad de exito $p$


#### Propiedades 

1) Si $X_1,...,X_n$ son v.a. independientes tales que $X_i \sim Bernoulli(p)$ , $i =1,...,n$ , entonces:

$$X_1 + ... + X_n \sim Binomial (n, p)$$



2) $E[X]=n\cdot p$


3) $Var(X) = n \cdot p \cdot (1-p)$


4) Para $x\geq n$ 

$$F_X(x) = \sum_{z\in \lbrace 0,1,...,x\rbrace} \binom{n}{z} \cdot p^z \cdot (1-p)^{n-z}$$




### Distribucion Geométrica (de fracasos)


$$X \sim GeoFrac(p) \Leftrightarrow P(X=x) = (1-p)^x\cdot p \cdot 1_{\lbrace x=0,1,2,...  \rbrace}$$

**Observacioón:**

1) Si $X \sim GeoFrac(p)$ , entonces:

$X$ puede interpretarse como el nº de  fracasos obtenidos hasta el primer exito tras realizar multiples veces un experimento tipo Bernoulli (notese que este nº solo puede ser 0,1,2,...), con probabilidad de exito $p$


#### Propiedades

1) $E[X] = \dfrac{1-p}$

2) $Var(X) = \dfrac{1-p}{p^2}$


### Distribucion Geométrica (de intentos)


$$X \sim GeoInt(p) \Leftrightarrow P(X=x) = (1-p)^{x-1}\cdot p \cdot 1_{\lbrace x=0,1,2,...  \rbrace}$$


**Observación:**

$X$ se puede interpretar como el nº de intentos hasta la obtencion del primer exito tras realizar múltiples veces un experimento tipo Bernoulli (notese que este nº solo puede ser 0,1,2,...), con probabilidad de exito $p$



#### Propiedades

1) $E[X]= \dfrac{1}{p}$

2) $Var(X)= \dfrac{1-p}{p^2}$




### Distribución de Poisson


$$X\sim Poisson(\lambda) \Leftrightarrow P(X=x) = e^{-\lambda} \cdot \dfrac{\lambda^x}{x!} \cdot 1_{\lbrace x=0,1,2,... \rbrace}$$


Donde:  $\lambda > 0$

#### Propiedad

1) $E[X] = \lambda$

2) $Var[X] = \lambda$

3) Si $X_i \sim Poisson(\lambda_i)$  y son independientes , para $i =1,...,n$ , entonces:

$$X_1 + ... + X_n \sim Poisson(\lambda_1 + ... + \lambda_n)$$


### Distribución Hipergeommetrica


$$X \sim HiperGeo(N, k, n) \Leftrightarrow P(X=x) = \dfrac{\binom{k}{n} \cdot \binom{N-k}{n-x}}{\binom{N}{n}} \cdot 1_{\lbrace x=0,1,..,n \rbrace}$$

**Observación:**

1) Las v.a. hipergeometrica se usan para modelar experimentos aleatorios que consisten en extrar sin reemplazamiento una muestra de $n$ elementos de un conjunto con $N$ elementos, $k$ de una clase llamada clase-k y $N-k$ de otra clase.

2) Si  $X \sim HiperGeo(N, k, n)$ , entonces:

$X$ puede interpretarse como el nº de elementos de la clase-k extraidos del conjunto tras haber extraido una muestra de $n$ elementos.


#### Propiedades

1) $E[X] = n \dfrac{k}{N}$

2) $Var(X) = n\cdot \dfrac{k}{N} \cdot \dfrac{N-k}{N} \cdot \dfrac{N-n}{N-1}$




## Distribuciones de probabilidad continuas



### Distribución Uniforme Continua

$$X \sim U(a,b) \Leftrightarrow f_X(x) = \dfrac{1}{b-a} \cdot 1_{\lbrace x\in (a,b)  \rbrace}$$



#### Propiedades

1) $E[X] = \dfrac{1}{2} \cdot (a + b)$

2) $Var(X) = \dfrac{1}{12} \cdot (b-a)^2$

3) $$F_X(x) = P(X \geq x) = \int_{-\infty}^{x} f_X(z) \cdot dz = \left\lbrace\begin{array}{c} 1 , si x\geq b \\ 0 , si x \leq a \\ \dfrac{x-a}{b-a} , si x\in (a,b) \end{array}\right.$$




### Distribución Exponencial


$$X \sim Exponencial(\lambda) \Leftrightarrow  f_X(x) = \lambda \cdot e^{-\lambda \cdot x} \cdot 1_{\lbrace x>0 \rbrace}$$

Donde: $\lambda > 0$

#### Propiedades

1) $E[X] = \dfrac{1}{\lambda}$

2) $Var(X)= \dfrac{1}{\lambda^2}$

3) $$F_X(x)=  P(X \geq x) = \int_{-\infty}^{x} f_X(z) \cdot dz =\left\lbrace\begin{array}{c} 0 , si x \leq 0 \\ 1- e^{-\lambda \cdot x} , si x>0 \end{array}\right.$$


### Funcion Gamma

$\Gamma$ es la función Gamma $\Leftrightarrow \Gamma(\alpha) = \int_{0}^{\infty} x^{\alpha - 1} \cdot e^{-x} \cdot dx$

Donde: $\alpha >0$

#### Propiedades

1) $\Gamma(1) = \Gamma(2) = 1$

2) $\Gamma(\alpha + 1) = \alpha \cdot \Gamma(\alpha)$

3) $\Gamma(\alpha + 1) = \alpha !$ , si $\alpha \in \mathbb{N}$

4) $\Gamma(\alpha) = (\alpha -1)!$ , si $\alpha \in \mathbb{N}$

5) $\Gamma(1/2) = \sqrt{\pi}$



### Distribucion Gamma

$$X\sim Gamma(\alpha , \lambda ) \Leftrightarrow f_X(x) = \dfrac{\lambda^\alpha}{\Gamma(\alpha )} \cdot x^{\alpha -1} \cdot e^{-\lambda \cdot x} \cdot 1_{\lbrace x>0  \rbrace}$$

Donde: $\alpha, \lambda > 0$


#### Propiedades

1) Si $\alpha \in \mathbb{N}$ , entonces:


$$f_X(x) = \dfrac{\lambda^\alpha}{(\alpha -1)!} \cdot x^{\alpha -1} \cdot e^{-\lambda \cdot x} \cdot 1_{\lbrace x>0  \rbrace}$$

2) Si $\alpha = 1$ , entonces:

$$f_X(x)= \lambda \cdot e^{-\lambda \cdot x} \cdot 1_{\lbrace x>0  \rbrace}$$

Por tanto:

$$Gamma(\alpha = 1 , \lambda) = Exponencial(\lambda)$$



3) $E[X]= \dfrac{\alpha}{\lambda}$

4) $Var(X)=\dfrac{\alpha}{\lambda^2}$

5) $$F_X(x) = $$

6) Si $X_1,...,Xn \sim Exponencial(\lambda)$ y son independientes, entonces:

$$X_1+...+X_n \sim Gamma(n , \lambda)$$

7) Si $X\sim Gamma(\alpha , \lambda)$ y $c>0$ , entonces:

$$c\cdot X \sim Gamma(\alpha , \lambda / c)$$

8) Si $X_1 , ..., X_n$ son independientes y $X_i\sim Gamma(\alpha_i , \lambda)$, entonces:

$$X_1 +...+ X_n \sim Gamma(\alpha_1 +...+ \alpha_n , \lambda)$$





### Distribucion Normal


$$X \sim N(\mu, \sigma^2) \Leftrightarrow f_X(x) = \dfrac{}{} \cdot exp \left( \dfrac{-1}{2} \cdot \dfrac{(x- \mu)^2}{\sigma^2}  \right)$$


Donde: $\mu \in \mathbb{R}$ y $\sigma^2 > 0$

#### Propiedades

1) $E[X]=\mu$

2) $Var(X)=\sigma^2$

3) $X\cdot a \sim N(\mu \cdot a , a^2 \cdot \sigma^2)$

4) $X\cdot b + a \sim N( b\cdot \mu + a , b^2 \cdot \sigma^2)$

5) Si $X_i \sim N(\mu_i , \sigma_i^2)$ , para $i =1,...,n$ , entonces:

$$X_1 + ...+ X_n \sim N(\mu_1 +...+ \mu_n , \sigma_1^2 + ...+ \sigma_n^2)$$

6) Si $X_i \sim N(\mu_i , \sigma_i^2)$ , para $i =1,...,n$ , entonces:

$$a_1\cdot X_1 + ...+ a_n \cdot X_n \sim N(a_1 \cdot \mu_1 +...+ a_n \cdot \mu_n , a_1^2 \cdot \sigma_1^2 + ...+ a_n^2 \cdot \sigma_n^2)$$




### Funcion Beta

$$B(a,b)= \int_0^1 x^{a-1} \cdot (1-x)^{b-1} \cdot dx$$

Donde: $a, b >0$


#### Propiedades

1) $B(a,b) = B(b,a)$

2) $B(a,1) = 1/a$

3) $B(a+1, b)= \dfrac{a}{a+b} \cdot B(a,b)$

4) $B(a,b) = \dfrac{\Gamma(a) \cdot \Gamma(b)}{\Gamma(a+b)}$


### Distribucion Beta

$$X\sim Beta(a,b) \Leftrightarrow f_X(x)= \dfrac{1}{B(a,b)} \cdot x^{a-1} \cdot (1-x)^{b-1} \cdot 1_{\lbrace x \in (0,1)  \rbrace}$$


Donde: $a, b >0$


#### Propiedades

1) $E[X]=\dfrac{a}{a+b}$

2) $Var(X) = \dfrac{a\cdot b}{(a + b +1)(a+b)^2}$

3) Si $X\sim Gamma(a, \lambda)$ y $Y\sim Gamma(b,\lambda)$ , entonces:

$$\dfrac{X}{X+Y} \sim Beta(a,b)$$



### Distribucion Weibull


$$X\sim Weibull(\alpha , \lambda) \Leftrightarrow f_X(x)= \lambda\cdot \alpha (\lambda \cdot x)^{\alpha - 1} \cdot e^{-(\lambda \cdot x)^\alpha} \cdot 1_{\lbrace x > 0  \rbrace}$$

Donde: $\alpha , \lambda >0$


#### Propiedades

1) $E[X]= \dfrac{1}{\lambda} \Gamma(1 + \dfrac{1}{\alpha})$

2) $Var(X)= \dfrac{1}{\lambda^2} \left( \Gamma(1 + \dfrac{2}{\alpha}) - \Gamma(1+ \dfrac{1}{\alpha}) \right)$

2) $$F_X(x) = (1 - e^{-(\lambda \cdot x)^\alpha}) \cdot 1_{\lbrace x>0 \rbrace}$$



### Distribucion Chi-cuadrado

$$X \sim \chi_n ^2 \Leftrightarrow f_X(x) = \dfrac{1}{\Gamma(n/2)} \cdot \dfrac{1}{2}^{n/2} \cdot x ^{n/2 -1} \cdot e^{-x/2}$$


#### Propiedades

1) $E[\chi_n ^2]= n$

2) $Var(\chi_n ^2)= 2n$

3) $\chi_n ^2 + \chi_m ^2 = \chi_{n+m} ^2$

4) $\chi_n ^2 - \chi_m ^2 = \chi_{n-m} ^2$

5) $\chi_n ^2 = Gamma( \alpha= n/2 , \lambda=1/2)$

6) Si $X_1 ,..., X_n \sim N(0,1)$ y son independientes , entonces:

$$X_1^2 + ... + X_n^2 \sim \chi_n^2$$


### Distribucion t-student

$$X\sim t_n \Leftrightarrow f_X(x) = \dfrac{\Gamma(\dfrac{n+1}{2})}{\sqrt{n\cdot \pi} \cdot \Gamma(n/2)} \cdot (1 + \dfrac{x^2}{n})^{-1/2 \cdot (n+1)} \cdot 1_{\lbrace x\in \mathbb{R} \rbrace}$$

#### Propiedades 

1) $E[X] = 0$

2) $Var[X] = \dfrac{n}{n-2}$ , si $n>2$

3) Si $Z \sim N(0,1)$ y $X\sim \chi_n^2$ y son independientes , entonces:

$$\dfrac{Z}{\sqrt{X/n}} \sim t_n$$





### Distribucion F-Fisher

$$X\sim F(a,b) \Leftrightarrow f_X(x) = \dfrac{\Gamma(\dfrac{a+b}{2})}{\Gamma(a/2)\cdot \Gamma(b/2)} \cdot (a/b)^{a/2} \cdot x^{a/2-1} \cdot (1 + (a/b)\cdot x)^{-(a+b)/2} \cdot 1_{\lbrace x>0  \rbrace}$$


#### Propiedades

1) $E[X] = \dfrac{b}{b-2}$

2) $Var(X) = \dfrac{2b^2 \cdot (a + b - 2)}{a \cdot (b-2)^2 \cdot (b-4)}$ , si $b>4$

3) Si $X \sim \chi^2_a$ y $Y \sim \chi^2_b$ , entonces:

$$\dfrac{X/a}{Y/b} \sim F(a,b)$$





## Probabilidad conjunta de variables aleatorias discretas



$$P(X=x , Y=y) = P(X= x \cap Y=y)$$

### Propiedades


1) $\sum_{x\in \mathbb{R}}\sum_{y\in \mathbb{R}} P(X=x , Y=y) = 1$

2) Si $x\notin Im(X)$ o $y \notin Im(Y)$ , entonces:

$$P(X=x , Y=y) = 0$$

3) $P(X\in A , Y\in B) = \sum_{x\in A} \sum_{y\in B} P(X=x , Y=y)$

4) $P(X\in A , Y=y) = \sum_{x\in A} P(X=x , Y=y)$

5) $P(X=x) = \sum_{y\in \mathbb{R}} P(X=x , Y=y)$

6) $P(Y=y) = \sum_{x\in \mathbb{R}} P(X=x , Y=y)$




## Densidad conjunta de variables aleatorias continuas

$$f_{X,Y}$$ es la funcion de densidad conjunta de las v.a. $X$ y $Y$ $\Leftrightarrow$


1) $f_{X,Y} : \mathbb{R}^2 \rightarrow (0 , \infty)$

2) $$P( X \in A , Y \in B) = \int_{x\in A} \int_{y\in B} f_{X,Y}(x,y) \cdot dy \cdot dx$$


3) $$\int_{x\in \mathbb{R}} \int_{y\in \mathbb{R}}   f_{X,Y}(x,y) \cdot dy \cdot dx = 1$$


### Propiedades

1) $P(X\in A , Y=y) = \int_{x\in A} f_{X,Y}(x , y)\cdot dx$

2) $P(X=x , Y\in B) = \int_{y\in B} f_{X,Y}(x , y) \cdot dy$

3) $f_X(x) = \int_{y\in \mathbb{R}} f_{X,Y}(x , y) \cdot dy$

4) $f_Y(y) = \int_{x\in \mathbb{R}} f_{X,Y}(x , y) \cdot dx$


## Probabilidad condicionada de variables aleatorias discretas

$$P(X=x | Y=y) = \dfrac{P(X=x , Y=y)}{P(Y=y)}$$

### Propiedades

1) $P(X\in A | Y=y) = \sum_{x\in A} P(X=x | Y=y)$


## Densidad condicionada de variables aleatorias continuas

$$f_{X|Y}(x,y) = \dfrac{f_{X,Y}(x,y)}{f_Y(y)}$$

### Propiedades

1) Si $Y$ es una v.a. continua , entonces:

$P(Y=y) = 0$ , para todo $y\in \mathbb{R}$

Por lo que $P(X\in A | Y=y)$ no está definido, ya que:

$P(X\in A | Y=y) = \dfrac{P(X=x , Y=y)}{P(Y=y)} = \dfrac{P(X=x , Y=y)}{ 0}$


2) Teniendo en consideración el problema anterior, se esquiva del siguiente modo:

Sea $\delta \rightarrow 0^+$

$$P(X\in A | Y \in [y , y+ \delta]) = \dfrac{P(X\in A , Y\in [y , y+ \delta])}{P(Y\in [y , y+ \delta])}$$


Donde ahora $P(Y\in [y , y+ \delta]) > 0$ 


3) 

$$P(X\in A | Y \in [y , y+ \delta]) = \int_{x\in A} \int_{y \in [y , y+ \delta]} f_{X|Y}(x,y) = \int_{x\in A} \int_{y \in [y , y+ \delta]} \dfrac{f_{X,Y}(x,y)}{f_Y(y)} \approx \int_{x\in A}   f_{X|Y}(x,y) = \int_{x\in A}   \dfrac{f_{X,Y}(x,y)}{f_Y(y)} = \dfrac{1}{f_Y(y)} \cdot \int_{x\in A}   f_{X,Y}(x,y)$$


En resumen:


$$P(X\in A | Y \in [y , y+ \delta]) \approx \int_{x\in A}   f_{X|Y}(x,y)$$



## Independencia de variables aleatorias discretas

$X$ e $Y$ son v.a. independientes  $(X \perp Y)$ $\Leftrightarrow$ $P(X=x , Y=y) = P(X=x)\cdot P(Y=y) , \for x,y \in \mathbb{R}$


### Teorema de Factorización para v.a. discretas


Sean $X$ e $Y$ v.a. discretas, 

Si $\exist g,h: \mathbb{R} \rightarrow \mathbb{R}$  , tal que:

$P(X=x, Y=y) = g(x)\cdot h(y) , \forall x,y \in \mathbb{R}$

entonces:

$X$ e $Y$ son independientes  $(X \perp Y)$








## Independencia de variables aleatorias continuas


$X$ e $Y$ son v.a. independientes  $(X \perp Y)$ $\Leftrightarrow$ $P(X=x , Y=y) = P(X=x)\cdot P(Y=y) , \for x,y \in \mathbb{R}$  $\Leftrightarrow$

$P(X\in A , Y\in B) = P(X\in A)\cdot P(Y\in B) , \for A,B \subset \mathbb{R}$


$\Leftrightarrow$

$\for A,B \subset \mathbb{R} , \int_{x\in A} \int_{y \in B} f_{X,Y}(x,y) \cdot dy \cdot dx = \int_{x\in A}  f_{X}(x)  \cdot dx \int_{y \in B} f_{Y}(y) \cdot dy$



### Teorema de Factorización para v.a. continuas  

Sean $X$ e $Y$ v.a. continuas,  

$X$ e $Y$ son v.a. independientes $(X \perp Y)$ $\Leftrightarrow$  $f_{X,Y}(x,y) = f_X(x) \cdot f_Y(y) , \forall x,y \in \mathbb{R}$


#### Colorario

Si $\exist g,h: \mathbb{R} \rightarrow \mathbb{R}$  , tal que:

$f_{X,Y}(x,y) = g(x)\cdot h(y) , \forall x,y \in \mathbb{R}$

entonces:

$X$ e $Y$ son independientes




## Independencia (dos a dos) de múltiples v.a. 



$X_1,...,X_n$ son independientes (dos a dos) $Leftrightarrow$ $X_i \perp X_j , \forall i\neq j = 1,...,n$




## Teorema de Bayes para variables aleatorias 

- Si $X$ e $Y$ son discretas:


$$P(X=x | Y=y) = \dfrac{P(Y=y | X=x) \cdot P(X=x)}{P(Y=y)}$$


- Si $X$ e $Y$ son continuas:

$$f_{X|Y}(x,y) =  = \dfrac{f{Y|X}(x, y) \cdot f_X(x)}{f_Y(y)}$$


## Formula de transferencia para funciones de varias v.a.

Sea $g: \mathbb{R}^2 \rightarrow \mathbb{R}$

- Si $X$ e $Y$ son discretas:


$$E[g(X,Y)] = \sum_{x\in \mathbb{R}} \sum_{y\in \mathbb{R}} g(x,y) \cdot P(X=x , Y=y)$$


- Si $X$ e $Y$ son continuas:

$$E[g(X,Y)] = \int_{x\in \mathbb{R}} \int_{y\in \mathbb{R}} g(x,y) \cdot f_{X,Y}(x , y) \dcor dy \cdot dx$$



## Esperanza Condicionada

Si $X$ es v.a. discreta :

$$E[X | Y=y] = \sum_{x\in \mathbb{R}} x \cdot P(X=x | Y=y)$$

Si $Y$ es v.a. continua :

$$E[ X | Y=y] = \int_{x\in \mathbb{R}} x \cdot P(X=x | Y=y) \cdot dx$$


## Esperanza total 

Si $Y$ es una v.a. discreta:

$$E[X] = \sum_{y\in \mathbb{R} } E[X / Y=y] \cdot P(Y=y)$$


Si $Y$ es v.a. continua :

$$E[X] = \int_{y\in \mathbb{R} } E[X / Y=y] \cdot f_Y(y) \cdot dy$$








<br>


<br>


En los años 30 del siglo pasado, Kolmogorov formaliza los axiomas de la
probabilidad matemática, los cuales son: 

- $P\left ( S \right )\geq 0$ , para cualquier suceso $S$. 


- $P\left ( \Omega \right )= 1$

- Si
$S_{1},S_{2},...,S_{n}$ son incompatibles entonces:

$$P\left ( S_{1}\cup S_{2}\cup ...,S_{n} \right )= \sum_{i=1}^{n}P\left ( S_{i} \right )$$

Este último axioma implica que bajo muestreo al azar, la probabilidad de
un suceso es proporcional al número de sucesos elementales que contiene.


<br>

## Independencia

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>
 
<p style='margin-left:1em;'>

Dos sucesos A y B son estadísticamente independientes si:
$$P\left ( A\cap B \right )=P\left ( A \right )P\left ( B \right )$$

</p>
 
</p></span>
</div>


<br>

## Probabilidad Condicionada

Si $P\left ( B \right )> 0$, la probabilidad de un suceso B dado A es:
$$P\left ( A|B \right )=\frac{P\left ( A\cap B \right )}{P\left ( B \right )}$$.


<br>

##  Interpretando la Independencia Estadística

Utilizando la definición de la probabilidad condicionada, si A y B son
independientes, entonces:
$$P\left ( A|B \right )=\frac{P\left ( A \right )P\left ( B \right )}{P\left ( B \right )}=P\left ( A \right )$$
Luego si se sabe que B ha ocurrido, la probabilidad de A es invariante.

<br>

##  Ley de la Multipiclación

Reordenando la fórmula para la probabilidad condicionada, se tiene:
$$P\left ( A\cap B \right )=P\left ( B|A \right )P\left ( A \right )=P\left ( A|B \right )P\left ( B \right )$$

<br>

## Ley de la Probabilidad Total

Para dos sucesos A y B,
$$P\left ( A \right )=P\left ( A|B \right )P\left ( B \right )+P\left ( A|\bar{B} \right )P\left ( \bar{B} \right )$$.


<br>

##  Extendiendo la Ley de la Probabilidad Total

De manera más general, si $B_{1},...,B_{k}$ forman una partición,
entonces:
$$P\left ( A \right )= \sum_{j=1}^{k}P\left ( A|B_{j} \right )P\left ( B_{j} \right )$$

Con estos resultados, llegamos al teorema sobre el que se fundamenta la
estadística bayesiana.




<br>

## Teorema de Bayes

Para dos sucesos A, B, tal que $P\left ( A \right )>0$, se tiene:
$$P\left ( B|A \right )=\frac{P\left ( B \right )P\left ( A|B \right )}{P\left ( A \right )}$$.

Dicho esto, ahora vamos a repasar los conceptos de variables
estadísticas, distribuciones conjuntas, marginales y condicionales.


<br>

## Variables Aleatorias

Siendo bastante simplistas, y haciendo una definición corta, pero más
que suficiente, podemos decir que una variable aleatoria es una función
que ascribe un valor (numérico) al resultado de un experimento. Las
variables aleatorias que son numéricas las podemos dividir en dos
grupos: 

- Discretas: Una definición de variable aleatoria discreta sin
entrar en profundidad y en conceptos matemáticos complejos, es aquella
que sólo puede tomar valores enteros; aunque en algunas ocasiones
también pueden ser decimales siempre y cuando estén dentro de un rango
concreto. Por ejemplo, el número de hijos o hermanos de una familia, el
número obtenido de lanzar un dado... $\\[0.35cm]$

- Continuas: Una variable aleatoria
continua es aquella que puede tomar cualquier valor entre dos fijados y
los valores de la variable (al menos teóricamente) no se repiten.
Ejemplos de variable aleatoria continua son: la estatura, el peso, el
nivel de colesterol en sangre, el tiempo observado al recorrer una
distancia...

<br>

### Variables Aleatorias Discretas

Para una variable discreta, $\mathbf{X}$, tomando valores
$x_{1},x_{2},...$ se definen: 

- La función de probabilidad o masa
$P\left ( \mathbf{X}=x \right )$ tal que $\sum_{i}P\left (\mathbf{X}=x{i} \right )=1$ 

- La función de distribución
$\mathbf{F_{X}}\left ( x \right )$ tal que:
$$\mathbf{F_{X}}\left ( x \right )=P\left ( \mathbf{X}\leq x \right )=\sum_{x_{i}<x}P\left ( \mathbf{X}=x_{i} \right)$$ 

- Los momentos:
$E\left [ g(\mathbf{x}) \right ]=\sum_{i}g(x_{i})P\left ( \mathbf{X}=x_{i} \right )$

Ejemplo: la distribución de Poisson.

Una variable discreta, $\mathbf{X}$,
sigue una distribución de Poisson con parámetro $\lambda > 0$ si:
$$P\left ( \mathbf{X}=x \right )=\frac{\lambda^{x}e^{-\lambda}}{x!}$$
para x = 0,1,2,... Se tiene que $E[\mathbf{X}]=V[\mathbf{X}]=\lambda$



<br>


### Variables Aleatorias Continuas

Para una variable aleatoria continua, $\mathbf{Y}$, tomando valores x
$\in$ $\Re$, se tiene que: 

- La función de distribución
$\mathbf{F_{Y}}\left ( y \right )$ tal que:
$$\mathbf{F_{Y}}\left ( y \right )=P\left ( \mathbf{Y}\leq y \right )$$ 

- La función de densidad
$\mathbf{f_{Y}}\left ( y \right )=\frac{dF\left ( y \right )}{dy}$ tal
que:
$$\int_{-\infty}^{y} \mathbf{f_{Y}}\left ( y \right )dy=\mathbf{F_{Y}}\left ( y \right )$$ 

- Los momentos:
$E\left [ g(\mathbf{Y}) \right ]=\int_{-\infty}^{\infty}g(y)\mathbf{f_{Y}}\left ( y \right )$

Ejemplo: la distribución Gamma.

Una variable continua, $\mathbf{Y}$ sigue
una distribución gamma con parámetros $\alpha$,$\beta$\>0 si:
$$\mathbf{f_{Y}}\left ( y \right )=\frac{\beta^{\alpha}}{\Gamma\left ( \alpha \right )}y^{\alpha-1}e^{-\beta y}$$
para y \> 0 donde $\Gamma(\cdot)$ es la función gamma:
$$\Gamma\left ( \alpha \right )=\int_{0}^{\infty}u^{\alpha-1}e^{-u}du$$
$\Gamma\left ( \alpha+1 \right )=\alpha\Gamma\left ( \alpha \right )$ y
$\Gamma\left ( \alpha \right )=\left ( \alpha-1! \right )$ si $\alpha$
es un número entero. $$E[\mathbf{Y}]=\frac{\alpha}{\beta}$$
$$V[\mathbf{Y}]=\frac{\alpha}{\beta^{2}}$$

<br>


## Distribuciones Conjuntas

Para dos o más variables discretas, la distribución conjunta es la
función $P\left ( \mathbf{X}=x,\mathbf{Y}=y \right )$ tal que:
$$\sum_{x}\sum_{y}P\left ( \mathbf{X}=x,\mathbf{Y}=y \right )=1 $$
$$\sum_{x}P\left ( \mathbf{X}=x,\mathbf{Y}=y \right )=P\left ( \mathbf{Y}=y \right )$$
la distribución marginal de Y,
$$\sum_{y}P\left ( \mathbf{X}=x,\mathbf{Y}=y \right )=P\left ( \mathbf{X}=x \right )$$
la distribución marginal de X.

Para el caso de variables continuas, sustituimos sus respectivos
sumatorios por integrales.

<br>

## Distribucuines Condicionales

La distribución condicional de una variable (discreta) $\mathbf{X}$ dada
otra variable (discreta) $\mathbf{Y}$ es:
$$P\left ( \mathbf{X}=x|\mathbf{Y}=y \right )=\frac{P\left ( \mathbf{X}=x,\mathbf{Y}=y \right )}{P\left ( \mathbf{Y}=y \right )}$$
suponiendo que $P\left ( \mathbf{Y}=y \right ) > 0$. La esperanza
condicional de una función $g\left (x,y \right )$ es:
$$E[g\left (x,y  \right )|Y=y]=\sum_{x}g\left (x,y  \right )P\left ( \mathbf{X}=x|\mathbf{Y}=y \right )$$


<br>

##  Media y Varianza Marginal

Supongamos que queremos calcular $E[\mathbf{X}]$ y $V[\mathbf{X}]$.
Suena complicado porqué en principio, tendríamos que evaluar la
distribución marginal de X primero o computar a través de la
distribución conjunta. Por ejemplo:
$$E[\mathbf{X}]=\sum_{x} \int_{-\infty}^{\infty}x\mathbf{f_{x,y}}\left ( x,y \right )dy $$
¿Existe una manera más fácil de hacer el cálculo? Pues afortunadamente
sí, se puede calcular con la ley de las esperanzas iteradas.


<br>

## Ley de las Esperanzas Iteradas

Para dos variables $\mathbf{X}$ e $\mathbf{Y}$, la ley de las esperanzas
iteradas dice que: $$E[\mathbf{X}]=E[E[\mathbf{X|Y}]]$$ Existe otra
descomposición semejante para la varianza:
$$V[X]=E[V[\mathbf{X|Y}]]+V[E[\mathbf{X|Y}]]$$.


<br>

## Ley de la Probabilidad Total para Variables Aleatorias

Tenemos que:

$$P\left ( \mathbf{X}=x \right )=\sum_{y}P\left ( \mathbf{X}=x|\mathbf{Y}=y \right )P\left ( \mathbf{Y}=y \right )$$
si $\mathbf{Y}$ es discreta,
$$P\left ( \mathbf{X}=x \right )=\int_{-\infty}^{\infty}P\left ( \mathbf{X}=x|\mathbf{Y}=y \right )\mathbf{f_{Y}}\left ( y \right )dx$$
si $\mathbf{Y}$ es continua.

Este segundo caso suele ser más interesante en la mayoría de las
ocasiones.

<br>

## Terorema de Bayes para Variables Aleatorias

Tenemos que:

$$P\left ( \mathbf{Y}=y|\mathbf{X}=x \right )=\frac{P\left ( \mathbf{X}=x|\mathbf{Y}=y \right )P\left ( \mathbf{Y}=y \right )}{P\left ( \mathbf{X}=x \right )}=\frac{P\left ( \mathbf{X}=x|\mathbf{Y}=y \right )P\left ( \mathbf{Y}=y \right )}{\sum_{i}P\left ( \mathbf{X}=x|\mathbf{Y}=y_{i} \right )P\left ( \mathbf{Y}=y_{i} \right )}$$
en el caso de variables discretas.
$$\mathbf{f}_{x|y}\left ( y|\mathbf{X}=x \right )=\frac{P\left ( \mathbf{X}=x|\mathbf{Y}=y \right )\mathbf{f}_y\left ( \mathbf{Y}=y \right )}{P\left ( \mathbf{X}=x \right )}=\frac{P\left ( \mathbf{X}=x|\mathbf{Y}=y \right )\mathbf{f}_y\left ( \mathbf{Y}=y \right )}{\int_{-\infty}^{\infty}P\left ( \mathbf{X}=x|\mathbf{Y}=y_{i} \right )\mathbf{f}_{y}\left ( y \right )}dy$$
en caso de variables continuas.

Con esto, hemos terminado el repaso de conceptos probabilísticos
necesarios para entender posteriormente los fundamentos bayesianos.

Tras esto, es lógico pensar, ¡por Dios!, que me hablen ya de inferencia
bayesiana, pero sentimos decirte que por el momento tendrás que seguir
esperando, puesto que, como hemos dicho al principio de este artículo,
el objetivo es presentar las principales diferencias entre ambos
enfoques, y no hacemos nada si no presentamos antes los conceptos en el
enfoque clásico o frecuentista. Si crees que esto no te va a servir,
pasa directamente a la parte de inferencia bayesiana, pero si luego no
entiendes nada, no digas que no te lo advertimos.


<br>

---

<br>

# Inferencia Frecuentista

La inferencia clásica se basa en el uso de la interpretación
frecuentista de la probabilidad: en un experimento repetible, la
probabilidad de un suceso es el límite de la proporción de ocurrencias
del suceso en n repeticiones del experimento cuando $n \to \infty$

## 2.1. CONSECUENCIAS.

-   La probabilidad es un concepto objetivo: la probabilidad de que
    salga un 1 en un dado será la misma para todos.
-   La probabilidad es un concepto limitado a situaciones de
    experimentos repetibles y eso no siempre es posible.
-   Parámetros, $\theta$, son desconocidos, pero fijos.

## 2.2. ESTIMACIÓN PUNTUAL.

Un buen estimador tiene buenas propiedades probabilisticas
(frecuentistas), ¡qué lejos quedaron estas propiedades! Vamos a
refrescarlas: 

- Insesgadez: Quiere decir que la esperanza del estimador
coincide con el parámetro de interés. 

- Alta precisión: Recordad que la
precisión es el inverso de la varianza por lo que es lo mismo que pedir
que tenga una varianza pequeña. 

- Pequeño ECM: El error cuadrático medio
se definía como la varianza más el sesgo elevado al cuadrado. Y como es
un error nos interesa que sea lo más pequeño posible.

Existen varios métodos de seleccionar un estimador, entre ellos, el
método de los momentos, mínimos cuadrados o el estimador máximo
verosímil.

Por ejemplo, este último, se sabe que tiene unas muy buenas propiedades
asintóticas, pero su ventaja no está tan clara en muestras de tamaño
reducido.

## 2.3. ESTIMACIÓN POR INTERVALOS.

Formalmente, un intervalo de $100(1-\alpha)\%$ de confianza para un
parámetro $\theta$ dada una muestra es un intervalo aleatorio tal que:
$$P\left ( LI < \alpha < LS \right )=1-\alpha$$ para cualquier valor del
parámetro (y cualquier otro parámetro del modelo).

¿Cómo interpretamos este intervalo? ¿La probabilidad de que contenga a
$\theta$ es $100(1-\alpha)$? 

La respuesta es que la interpretación de un
intervalo de confianza frecuentista es; que repitiendo 100 veces un
experimento aleatorio se espera que $100(1-\alpha)$ de esos intervalos
obtenidos en cada uno de esos intentos contengan al verdadero valor del
parámetro.

## 2.4. CONTRASTES DE HIPÓTESIS.

Un contraste de hipótesis típicamente tiene una serie de pasos a
completar:

1.  Formalizar una hipótesis estadística experimental o alternativa
    ($H_{1}$) de la cual no sabemos su veracidad.
2.  Formalizar la hipótesis opuesta o nula ($H_{0}$).
3.  Derivar un estadístico que lo usaremos como la base del contraste.
4.  Hallar la distribución del estadístico de contraste bajo la
    hipótesis nula.
5.  Fijar un nivel de significación o error de tipo I:
    $$\alpha=P\left ( rechazar\ H_{0}|H_{0}\ es\ verdadera \right )$$
6.  Calcular la región crítica o de rechazo, es decir el rango de
    valores del estadístico de contraste donde se rechazaría $H_{0}$ a
    favor de $H_{1}$.

Entonces, tenemos que dada una muestra observada, se calcula el valor
del estadístico y si cae dentro de la región crítica, se rechaza
$H_{0}$.

Aunque usualmente explicamos los contrastes o test de hipótesis como el
cálculo de una región crítica, lo cierto es que es mucho más común hacer
uso del p-valor, que se define como, dada una muestra observada,
tenemos que el p-valor es la probabilidad bajo $H_{0}$ de observar un
valor del estadístico por lo menos tan extremo como el observado.

Si el p-valor por tanto es más pequeño que $\alpha$, se rechaza la
hipótesis nula. Por el contrario, si el p-valor es más grande que
$\alpha$, no se rechaza la hipótesis nula.

A menudo, interpretamos el concepto de p-valor como una medida de la
fuerza de la evidencia en contra de $H_{0}$

Ejemplo: Tenemos una moneda con $P\left ( cruz \right )=\theta$ y
queremos contrastar: $$H_{0}=0.5$$ $$H_{1}>0.5$$ Entonces tiramos la
moneda 12 veces y observamos 9 cruces y 3 caras. Luego, el p-valor es:
$$p=\sum_{x=9}^{12} \binom{12}{x}0.5^{x}\left ( 1-0.5 \right )^{12-x}=0.073$$
En este caso, no rechazaríamos la hipótesis nula a un 5% de
significación.

Ahora bien, supongamos que en lugar de decidir de antemano tirar la
moneda 12 veces, vamos a tirar la moneda hasta observar la tercera cara.
Ya el diseño del experimento no es binomial sino binomial negativa. Si
la tercera cara ocurre en la duodécima tirada, es decir, hemos visto 9
cruces y 3 caras ;y el EMV de $\theta$ sigue siendo
$\hat{\theta}=\frac{9}{12}$. No obstante, ahora el p-valor es:
$$p=\sum_{y=9}^{\infty}\binom{y+3-1}{y}\left ( 1-\theta \right )^{3}\theta^{9}=0.033$$
Y en este caso, sí rechazamos la hipótesis nula.

¿No parece lógico verdad?

Si a alguien le pica la curiosidad, no está
claro porque sucede esto y en qué condiciones ocurre, tan sólo decir que
este es uno de los grandes puntos en los que los estadísticos bayesianos
están más en contra de lo frecuentista.

## 2.5. PREDICCIÓN

Típicamente, para hacer predicción en un procedimiento clásico, se
utiliza un método denominado "plug in", que cumplen el principio del
mismo nombre, que dice que una característica dada de una distribución
puede ser aproximada por la equivalente evaluada en la distribución
empírica de una muestra aleatoria.

Siguiendo con el ejemplo anterior, si queremos predecir el número de
cruces en 10 tiradas más de la moneda (Y), lo haríamos de la siguiente
forma: $$Y\sim Binomial \left ( 10, 0.75 \right )$$

## 2.6. COMPARACIÓN DE MODELOS

Para comparar varios modelos, podemos utilizar, por ejemplo un criterio
basado en penalizar la verosimilitud de acuerdo al número de parámetros.
Por ejemplo, el AIC (Akaike Information Criterion) para dado un modelo
$\mathbf{M}$ es:
$$AIC=-2\log I\left( \hat{\theta_{\mathbf{M}}}|datos,\mathbf{M} \right ) +2k$$
dónde k es el número de parámetros presentes en el modelo. En el caso
del AIC el modelo seleccionado es el que minimice este criterio.

Ejemplo: Para que quede más claro esto haremos un breve ejemplo ya que
pensamos que la comparación de modelos no siempre se estudia o al menos
no en cursos de estadística básica-intermedia. Empecemos con el ejemplo,
supongamos que queremos comparar el modelo con $p=0.5$, que
denominaremos ($\mathbf{M_{0}}$) con el modelo completo
($\mathbf{M_{1}}$): $Y\sim Binomial\left ( 12,p \right )$ para cualquier
p. El AIC para el modelo $\mathbf{M_{0}}$ es:
$$AIC_{0}=-2\log \left\{\binom{12}{9}0.5^{12} \right\}+2\times 0=5.85$$
y el AIC para el modelo general es:
$$AIC_{1}=-2\log \left\{\binom{12}{9}0.75^{9}0.25^{3} \right\}+2\times 1=4.71$$
Luego el modelo preferido según el criterio de Akaike es el modelo
completo.

## 2.7. BONDAD DE AJUSTE

Para ver si los datos se ajustan a un modelo $\mathbf{M}$, se puede
utilizar un contraste de hipótesis de la hipótesis nula:
$$H_{0}: los\ datos\ provienen\ del\ modelo\ \mathbf{M}.$$ Ejemplos típicos
son el contraste de la chi-cuadrado o el de Kolmogorov-Smirnov.

Con esto, hemos resumido los puntos más característicos de la inferencia
clásica o frecuentista.

# 3. INFERENCIA BAYESIANA

Ahora sí, hemos llegado a lo que seguro estabáis esperando, la
introducción a la estadística bayesiana y las diferencias más evidentes
entre ambos enfoques.

## 3.1. CONCEPTO DE PROBABILIDAD Y DISTRIBUCIÓN A PRIORI

Las ideas iniciales de la probabilidad surgieron relacionadas con los
juegos de azar y su conceptualización e interpretación son básicamente
frecuentistas. Esta formulación frecuentista trabaja bien en multitud de
situaciones, pero no en todas. Entre otras, destacamos las tres
diferentes interpretaciones de Kyburg, Jr. señala que pueden
considerarse respecto a la probabilidad:

1.  Interpretación empírico frecuentista. Esta es la interpretación más
    común de la probabilidad y hace referencia al comportamiento (real o
    hipotético) de ciertos objetos.
2.  Interpretación lógica. Esta interpretación es bastante poco común
    entre estadísticos y está más bien reservada al mundo de la lógica.
    De acuerdo con esta interpretación, hay una relación lógica entre
    una afirmación (considerada como una hipótesis) y otra afirmación
    (considerada como evidencia), en virtud de la cual la primera tiene
    cierta probabilidad relativa a la segunda.
3.  Interpretación subjetivista. Esta es una versión más débil de la
    interpretación lógica. Es más del tipo psicológico que lógico. El
    grado de creencia es el concepto fundamental de la interpretación:
    las afirmaciones probabilísticas representan los grados de creencias
    de los individuos.

En esta última de las interpretaciones es sobre la que se substenta la
inferencia bayesiana.

Una característica distintiva de la estadística bayesiana es que tiene
en cuenta de una forma explícita la información previa y se involucra en
el análisis en forma de distribución llamada distribución a priori. La
teoría clásica la considera básicamente para determinar tamaños
muestrales y el diseño de experimentos y, a veces, como forma de crítica
de los resultados hallados.

La expresión de la información previa en forma cuantitativa puede ser un
proceso complejo y delicado, aunque se han hallado soluciones que pueden
llegar a parecer extrañas, como lo puede ser el uso de lo que se conoce
como distribuciones no informativas, pero que se utilizan extensamente
en el trabajo bayesiano orientado a la práctica.

Fuentes tradicionales para la construcción de la distribución a priori
son: 

- Estudios previos similares. La utilización de estudios previos
sobre unos pocos parámetros específicos ha dado origen a un área
conocida como metaanálisis, la cual puede trabajarse desde el punto
clásico y bayesiano. 

- Opinión de expertos. La utilización de expertos
es casi obligatoria en situaciones completamente nuevas donde
experimentar puede ser muy costoso o imposible, por ejemplo en la
implementación de políticas a nivel macroeconómico.

Wallsten y Budescu presentan las condiciones para que un proceso de
elicitación produzca una distribución apropiada. En teoría de la
medición se menciona con frecuencia las dificultades que tienen los
procesos de cuantificación de sentimientos en relación con los eventos
externos y la determinación del error. El proceso de codificación debe
garantizar condiciones básicas, como confiabilidad y validez. La
confiabilidad se mide como la correlación al cuadrado entre los valores
observados de las probabilidades y las verdaderas probabilidades,
$\rho_{p\pi}^{2}$. La probabilidad subejtiva es una variable aleatoria,
$p$, que puede ser descompuesta como la verdadera probabilidad fija
$\pi$ y un error, $e$: $$p=\pi+e$$. Los siguientes supuestos son
estándares para este modelo:

1.  $E(e)=0$
2.  $\rho_{\pi e}=0$
3.  Para cualquier par de mediciones independientes los errores son
    incorrelacionados: $\rho_{e_{i}e_{j}}=0$ para $i\neq j$
4.  $\rho_{\pi_{i}e_{j}}=0$ para $i\neq j$

Sea $\sigma_{e}^{2}$ la varianza del error. La raíz cuadrada de esta
cantidad se conoce como el error estándar de la medición. Del modelo y
los supuestos anteriores se tiene:
$$\sigma_{p}^{2}=\sigma_{\pi}^{2}+\sigma_{e}^{2}$$ Así, el coeficiente
de confiabilidad será:
$$0\leq \rho_{\pi p}^{2}=\frac{\sigma_{\pi}^{2}}{\sigma_{p}^{2}}=1-\frac{\sigma_{e}^{2}}{\sigma_{p}^{2}}\leq 1$$
La confiabilidad está inversamente relacionada con el error de medición
y es perfecta cuando $\sigma_{e}^{2}=0$. Ya que $\pi$ no puede ser
observado directamente, no podemos determinar $\sigma_{\pi}^{2}$. Esto
puede resolverse parcialmente a través de métodos indirectos, por
ejemplo, usando varios métodos de cuantificación.

La validez se define como la correlación entre dos procedimientos de
cuantificación independientes, digamos $\rho_{xy}$.

Ayyub presenta una clasificación de la ignorancia que es importante
considerar cuando se determina la claridad de un experto. La ignorancia
puede ser consciente o ciega. La ignorancia ciega incluye conocimiento
irrelevante que puede estar conformado por un conocimiento relevante y
que es descartado o no considerado intencionalmente y por un
conocimiento no confiable (prejuicios) o que no aplica al problema de
interés.

Un elicitador subjetivo está bien calibrado si para cada probabilidad
$p$, en la clase de todos los eventos en los cuales asigna una
probabilidad subjetiva, la frecuencia relativa de ocurrencia es igual a
$p$.

A pesar de que el concepto anterior es atractivo, en la práctica puede
ser difícil de verificar, excepto en ciertas circunstancias donde el
elicitador permanentemente construye distribuciones de probabilidad
subjetivas, como es el caso de los meteorólogos. En estos casos, se
pueden construir pruebas de tipo estadístico para medir el nivel de
concordancia de lo elicitado con lo observado. A nivel experimental se
pueden establecer ambientes controlados en los cuales los elicitadores
pueden ser evaluados, sin embargo no hay garantía que el resultado de un
laboratorio pueda extrapolarse a un ambiente real.

Entonces dicho esto, se supone que antes de hacer cualquier experimento
una persona puede representar los conocimientos sobre $\theta$
(parámetro o parámetros de interés) con una distribución
$f\left ( \theta \right )$.

A esta distribución como hemos dicho antes, la llamamos distribución a priori.

Como todo lo anterior puede sonar un poco raro y complejo, supongamos
que queremos pedir una distribución a priori de un experto para
$\theta=P\left ( cruz \right )$ ¿Qué sabemos sobre la probabilidad?
$$0\leq \theta \leq 1$$. En la mayoría de experimentos, aproximadamente
el 50% de los resultados son cruces. Entonces buscamos una distribución
a priori con soporte en el intervalo $\left [ 0,1 \right ]$ y centrado
en 0.5.

Por ejemplo podemos utilizar para este caso la distribución beta, que
tiene la siguiente definición matemática y propiedades. Una variable
continua $\mathbf{Y}$ tiene una distribución beta con parámetros
$\alpha, \beta>0$ si:
$$\mathbf{f_{Y}}\left ( y \right )=\frac{1}{B\left ( \alpha, \beta \right )}y^{\alpha-1}\left ( 1-y \right )^{\beta-1}$$
para $0 < y < 1$. $B\left ( \cdot,\cdot \right )$ es el coeficiente
beta.
$$B\left ( \alpha,\beta \right )=\int_{0}^{1}y^{\alpha-1}\left ( 1-y \right )^{\beta-1}dy=\frac{\Gamma\left ( \alpha \right )\Gamma\left ( \beta \right )}{\Gamma\left ( \alpha + \beta \right )}$$
Se tiene que $E\left [ Y \right ]=\frac{\alpha}{\alpha + \beta}$ y
$V\left [ Y \right ]=\frac{\alpha\beta}{\left ( \alpha + \beta \right )^{2}\left ( \alpha + \beta + 1 \right )}$

Cambiando los parámetros, la distribución beta toma formas muy
distintas. En este caso podemos coger la Beta(5,5).

Antes de seguir vamos a desarrollar las diferentes aproximaciones al
análisis bayesiano.

## 3.2. APROXIMACIONES AL ANÁLISIS BAYESIANO

Una clasificación de las diversas aproximaciones que podemos realizar
cuando consideramos el enfoque bayesiano es la siguiente:

1.  Análisis bayesiano objetivo: esta posición se caracteriza por la
    utilización de distribuciones a priori no informativas.
2.  Análisis bayesiano subjetivo: la utilización de distribuciones a
    priori subjetivas es a menudo disponible como alternativa en algunos
    problemas.
3.  Análisis bayesiano robusto: esta posición asume que es imposible
    especificar la distribución a priori o el modelo, en cuyo caso es
    mejor trabajar dentro de clases donde haya un nivel de incertidumbre
    sobre esta distribución o modelo.
4.  Análisis bayesiano-frecuentista: hay problemas en los que la
    aproximación frecuentista produce resultados satisfactorios, como en
    los métodos no paramétricos, y al bayesiano le toca aceptarlos como
    soluciones pseudobayesianas.
5.  Análisis cuasibayesiano: esta aproximación utiliza distribuciones a
    priori seleccionadas de una forma que acomoden a la solución
    "bonita" del problema, ajustando estas distribuciones a priori de
    diversas formas, por ejemplo seleccionando distribuciones a priori
    vagas, o ajustando los parámetros.

## 3.3. LA DISTRIBUCIÓN A POSTERIORI

Con la a priori podemos obtener la a posteriori que es la que de verdad
nos importa y con la que trabajaremos. Para hallar la distribución a
posteriori... ¿Cómo creéis que se hará...? Pues claro con el teorema de
Bayes.
$$f\left ( \theta|datos \right )=\frac{f\left ( \theta \right )f\left ( datos|\theta \right )}{f\left ( datos \right )}$$
En esta expresión:

$f\left ( \theta|datos \right )$ es la distribución a posteriori.

$f\left ( \theta \right )$ es la distribución a priori.

$f\left (datos|\theta \right)= I\left ( \theta|datos \right )$ es la
función de verosimilitud.

$f\left (datos \right)=\int f\left (datos|\theta \right)f\left (\theta \right)d\theta$ es la verosimitud marginal.

De la fórmula anterior, observamos que el denominador no depende de $\theta$, luego tenemos que:
$$f\left ( \theta|datos \right ) \propto f\left ( \theta \right ) f\left (datos|\theta \right)$$
$$a\ posteriori \propto a\ priori \times verosimilitud$$

## 3.4. ESTIMACIÓN PUNTUAL
Cuando hemos calculado la distribución a posteriori, podemos utilizar la media a posteriori, la mediana a posteriori, la moda a posteriori como estimadores puntuales de $\theta$. Este último caso es conocido como el estimador máximo a posteriori o MAP.

## 3.5. ESTIMACIÓN POR INTERVALOS
Un intervalo de $100(1-\alpha)\%$ de credibilidad o de confianza bayesiana es cualquier intervalo tal que $P\left ( LI<\theta<LS|datos \right )=1-\alpha$.
¿Cuál es la interpretación de este intervalo? ¿Será igual que en el caso frecuentista?
El intervalo de credibilidad más corto se llama el intervalo de máxima densidad a posteriori. Y a las preguntas anteriores, la respuesta es que no, las interpretaciones son distintas, en el enfoque bayesiano, estos intervalos son interpretados de la forma siguiente:
Un intervalo de credibilidad es un intervalo dentro del cual cae un valor de un parámetro no observado con una probabilidad particular. Esto es, el verdadero valor del parámetro caerá dentro del intervalo por ejemplo con un 95% de probabilidad, que contrasta con la interpretación del intervalo frecuentista o clásico.

## 3.6. CONTRASTES Y SELECCIÓN DE MODELOS
En teoría, hacer contrastes de hipótesis a la bayesiana es bastante fácil y nuestro modo de ver más intuitivo que con el concepto de p-valor. Dadas las distribuciones a priori, $P\left ( H_{0} \right )$ y $P\left ( H_{1} \right )=1-P\left ( H_{0} \right )$, se calculan las probabilidades a posteriori con:
$$P\left ( H_{0}|datos \right )\propto f\left ( datos|H_{0} \right )P\left ( H_{0} \right )\propto P\left ( H_{0} \right )\int f\left ( datos|H_{0},\theta \right )f\left ( \theta|H_{0} \right )d\theta$$
Con esto, dada una regla de decisión, se puede decidir rechazar $H_{0}$ o no.
En principio, podemos utilizar las mismas técnicas para seleccionar modelos: fijadas las probabilidades a priori de cada modelo, calculamos las a posteriori y seleccionamos el modelo probable.

Ejemplo:
Supongamos que queremos contrastar:
$$H_{0}: \theta \leq 0.5$$
$$H_{1}: \theta > 0.5$$
Dada la a priori Beta(5,5) empleada anteriormente, entonces $P\left ( H_{0} \right )=\int_{0}^{0.5}f(\theta)d\theta=0.5$ y luego, a posteriori:
$$P\left ( H_{0}|datos \right )=\int_{0}^{0.5} \frac{1}{B(14,8)}\theta^{14-1}\left ( 1-\theta \right )^{8-1}d\theta=0.0946$$
Dada la regla de decisión de rechazar $H_{0}$ si su probabilidad a posterior es menor que 0.05, no rechazaríamos esta hipótesis.

¿Hay algún problema con esta idea?

Aunque parezca que no hay ningun problema, hay que darse cuenta que las probabilidades tienen que sumar 1, por lo que la $P\left ( H_{1}|datos \right )$ será la complementaria a la de $H_{0}$, por lo que en este enfoque no tiene sentido el concepto de p-valor y para este caso rechazaríamos la hipótesis nula ya que la probabilidad a posteriori de la hipótesis alternativa es mayor que la de la nula.

## 3.7. PREDICCIÓN
Supongamos que queremos predecir el valor de una nueva variable $\mathbf{Y}$. Entonces, $$f\left ( \mathbf{y}|datos \right )=\int f\left (\mathbf{y}|\theta,datos \right )f\left (\theta|datos \right )d\theta$$ y en muchas ocasiones, $\mathbf{Y}$ es condicionalmente independiente de los datos dado $\theta$, y luego:
$$f\left ( \mathbf{y}|datos \right )=\int f\left (\mathbf{y}|\theta \right )f\left (\theta|datos \right )d\theta$$

Veamos un ejemplo de esto y terminamos con este artículo.
Supongamos que queremos calcular la distribución del $\mathbf{X}$="número de cruces en 10 tiradas más de la moneda".
Tenemos $X|\theta \sim Binomial(10,\theta)$, y $\theta|datos \sim Beta(14,8)$. Entonces:
$$P\left ( \mathbf{X}=\mathbf{x}|datos \right )=\int_{0}^{1}\binom{10}{x}\theta^{x}\left ( 1-\theta \right )^{10-x}\frac{1}{B(14,8)}\theta^{14-1}\left ( 1-\theta \right )^{8-1}d\theta$$
$$=\binom{10}{x}\frac{1}{B(14,8)}\int_{0}^{1}\theta^{14+x-1}\left ( 1-\theta \right )^{18-x-1}d\theta$$
$$=\binom{10}{x}\frac{B(14+x,18-x)}{B(14,8)}\int_{0}^{1}\frac{1}{B(14+x,18-x)}\theta^{14+x-1}\left ( 1-\theta \right )^{18-x-1}d\theta$$
$$=\binom{10}{x}\frac{B(14+x,18-x)}{B(14,8)}\ para\ x\ =0,1,...,10$$

Como hemos podido ver las cuentas en el ámbito bayesiano no son tan amigables como en lo frecuentista. Ahora nos interesa el cálculo de la media de $\mathbf{X}$.
El cálculo directo a través de la distribución beta-binomial parece complicado. 

¿Existe una manera más sencilla? 

Pues afortunadamente sí, para los que pensaran al principio de este artículo... y estos conceptos para que me sirven, pues veréis, en este caso es de gran utilidad la antes mencionada Ley de las Esperanzas Iteradas.

$E[X|datos]=E[E[\mathbf{X}|\theta]|datos]=E[10\theta|datos]=10E[\theta|datos]=10\times \frac{14}{14+8}=6.364$

# 4. INFORMACIÓN DE RESUMEN
Ya por último vamos a resumir en una tabla lo que hemos ido explicando en este artículo.

| CARACTERÍSTICA  | TEORÍA CLASICA  |  TEORÍA BAYESIANA |
| ------------ | ------------ | ------------ |
| PARÁMETROS DE INTERÉS  | CONSTANTES DESCONOCIDAS  | VARIABLES ALEATORIAS  |
| DISTRIBUCIÓN A PRIORI  | NO EXISTE  |EXISTE Y ES EXPLÍCITA   |
| MODELO MUESTRAL  | SE ASUME  | SE ASUME  |
| DISTRIBUCIÓN A POSTERIORI  | NO EXISTE  | EXISTE Y SE DERIVA  |
| RAZONAMIENTO  | INDUCTIVO  | DEDUCTIVO  |

Ahora sí hemos terminado con esta introducción, en los próximos artículos profundizaremos más en las técnicas bayesianas e introduciremos conceptos que nos serán muy útiles para simplificar los cálculos, además de poner ejemplos computacionales con software R y OpenBUGS.

Espero que os haya gustado y servido.

Marcos Álvarez Martín

Estudiante de Estadística y Empresa en la Universidad Carlos III de Madrid

# Bibliografía

Diapos de MIke Wiper, el libro de Introducción a la estadística bayesiana de Juan Carlos Correa Morales y Carlos Javier Barrera Causil.

