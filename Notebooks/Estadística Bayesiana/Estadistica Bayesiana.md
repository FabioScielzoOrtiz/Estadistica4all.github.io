---
title: 'Introducción a la Inferencia Estadística'
author: 'Fabio Scielzo Ortiz'
date: '5/11/22'
output: 
   rmdformats::readthedown:
      use_bookdown: true
      self_contained: true
      thumbnails: true
      lightbox: true
      gallery: true
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

 
<br>

#  Repaso de teoria de probabilidad

## Experimento Aleatorio <a class="anchor" id="1"></a>

Un experimento aleatorio $\varepsilon$ es un  experimento que si se repite varias veces en las mismas condiciones puede ofrecer diferentes resultados.

<br>

## Espacio Muestral

El espacio muestal de un experimento aleatorio $\varepsilon$ es el conjunto de todos los resultados posibles de una realización del esperimento, y se denota por $\Omega(\varepsilon)$


<br>

## Sucesos

Sea $\varepsilon$  un experimento aleatorio con espacio muestral $\Omega(\varepsilon)$ ,

A es un suceso del experimento aleatorio $\varepsilon$ $\Leftrightarrow$ $A\subset \Omega(\varepsilon)$


## Ocurrencia de sucesos

Sea $w_i \in \Omega(\varepsilon)$ es el resultado obtenido de la i-esima realizacion del exprerimento aleatorio $\varepsilon$ ,


Ocurre el suceso $A \subset \Omega(\varepsilon)$  $\Leftrightarrow$ $w_i \in A , \exists i=1,2,3,...$


### Suceso Imposible

Sea $\emptyset$ el conjunto vacio,


$\emptyset$ es el suceso imposible, ya que nunca ocurre.



### Suceso Seguro


$\Omega(\varepsilon)$ es el suceso seguro, ya que siempre ocurre.



## Suceso Simple


$A\subset \Omega(\varepsilon)$ es un suceso simple $\Leftrightarrow$ $\# A = 1$


## Suceso Compuesto


$A\subset \Omega(\varepsilon)$ es un suceso compuesto $\Leftrightarrow$ $\# A > 1$


## Operaciones con sucesos

Sean $A, B \subset \Omega(\varepsilon)$

### Unión de sucesos


$$A\cup B = \lbrace w \in \Omega(\varepsilon) / w \in A \hspace{0.2cm} o\hspace{0.2cm} w \in B    \rbrace$$


**Observación:**

Sea $w \in \Omega(\varepsilon)$ el resultado de una realizacion del experimento aleatorio $\varepsilon$

Si $w \in A\cup B \Rigtharrow$  ocurre $A$ o $B$

<br>

#### Propiedades de la unión de sucesos

1) $A\cup B = B\cup A$

2) $A \cup A = A$

3) $A \cup \C = A$

4) $A \cup \Omega(\varepsilon) = \Omega(\varepsilon)$

5) $A \cup A^c = \Omega(\varepsilon)$

6) Si $A \cup B = \emptyset \Rightarrow \# A \cup B = \#A + \#B$

7) \# A \cup B = \# A + \# B - \# A\cap B$


<br>

### Intersección de sucesos

$$A\cap B = \lbrace w \in \\Omega(\varepsilon) / w \in A \hspace{0.2cm} y\hspace{0.2cm} w \in B    \rbrace$$

<br>

**Observación:**

Sea $w \in \Omega(\varepsilon)$ el resultado de una realizacion del experimento aleatorio $\varepsilon$

Si $w \in A\cap B \Rigtharrow$  ocurre $A$ y $B$

<br>

#### Propiedades de la intersección de sucesos

1) $A\cap B = B \cap A$

2) $A\cap A = A$

3) $A \cap \emptyset = \emptyset$

4) $A \cap \Omega(\varepsilon) = A$

5) $A \cap A^c = \emptyset$


<br>

### Diferencia de sucesos

$$A - B = \lbrace w \in \\Omega(\varepsilon) / w \in A \hspace{0.2cm} y \hspace{0.2cm} w \notin B    \rbrace$$


<br>

**Observación:**

Sea $w \in \Omega(\varepsilon)$ el resultado de una realizacion del experimento aleatorio $\varepsilon$

Si $w \in A - B \Rigtharrow$  ocurre $A$ pero no $B$


<br>

#### Propiedades de la diferencia de sucesos

1) $A-B \neq B - A$  , en general

2) $A-A = \emptyset$

3) $A-\emptyset = A$

4) $A - \Omega(\varepsilon) = \emptyset$

5) $A- B = A - (A\cap B)$

6) $A-B = A\cap B^c$



<br>


### Suceso Contrario

$$A^c  = \lbrace w \in \Omega(\varepsilon) / w \notin A  \rbrace$$

#### Propiedades del suceso contrario

1) $\emptyset^c = \Omega(\varepsilon)$

2) $\Omega(\varepsilon)^c = \emptyset$

3) $(A^c)^c = A$

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


1) $\sigma (\Omega)$ = \lbrace A / A\subset \Omega\rbrace 

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

1) E[a]=a

2) E[b\cdot X] = b \cdot E[X]

3) E[a + b\cdot X] = a + b \cdot E[X]

4) Formulas de transferencia:

Si $X$ es **discreta** :


$$E[g(X)] = \sum_{x\in \mathbb{R}} x \cdot P(g(X)=x) = \sum_{x\in \mathbb{R}} g(x) \cdot P(X=x)$$


Si $X$ es **continua**

$$E[g(X)] = \int_{-\infty}^{\infty} x \cdot f_{g(X)}(x) \cdot dx =  \int_{-\infty}^{\infty} g(x) \cdot f_X(x) \cdot dx$$



Donde: $g(X)$ es una transformación de $X$



## Varianza de una variable aleatoria


$$Var(X) = E\left[ (X - E[X])^2 \right]$$
 
 
 
### Propiedades 
 
 
 
 
 
 
 
 
 

# Bibliografia

Apuntes probabilidad Raul Jimenez

Apuntes Mike Wipper

Libro inferencia estadistica Luis Rincon

Apuntes contrastes hipotesis Sandra Benitez Peña