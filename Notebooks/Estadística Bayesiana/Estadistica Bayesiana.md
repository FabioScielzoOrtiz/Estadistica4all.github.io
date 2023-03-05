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





# Terorema de la probabilidad total con variables aleatorias











<br>

-------

<br>

# Inferencia Frecuentista


## Estimación Puntual

Dada una variable de interés $X$ , el objetivo de la estimación puntual es estimar un parametro $\theta$ de la distribución de $X$ como por ejemplo la media, varianza o mediana, usando para ello una muestra de observaciones de $X$.


Se va a asumir de ahora en adelante que $X$ es una v.a. tal que $X\sim D(\theta)$



## Variables aleatorias i.i.d.

$X_1,...,X_n$ son variables aleatorias independientes (dos a dos) e identicamente distribuidas  (i.i.d.) $\Leftrightarrow$

1) $X_1,...,X_n$ son independientes (dos a dos)

2) $X_1,...,X_n$ tienen la misma distribucion de probabilidad, es decir, $X_i \sim D(\theta), \forall i=1,...,n$ 

Donde $D(\cdot)$ es una distribucion de probabilidad con parametros no especificados.




Seguiremos la siguiente notación:


$(X_1,...,X_n) \underset{i.i.d.}{\sim} D(\cdot) \Leftrightarrow$

1) $X_1,...,X_n$ son independientes (dos a dos)

2) $X_i \sim D(\cdot), \forall i=1,...,n$ 





## Muestra Aleatoria Simple

Sea $X$ una v.a. tal que $X \sim D(\cdot)$ 


$(X_1,...,X_n)$ es una muestra aleatoria simple (m.a.s.) de tamaño $n$ de $X$ $\Leftrightarrow$ $(X_1,...,X_n) \underset{i.i.d.}{\sim} D(\cdot)$

**Observación:**

Una m.a.s. de una v.a. es un vector de v.a.'s


## Muestra de Observaciones


Sea $X$ una v.a. tal que $X \sim D(\cdot)$ 


$(x_1,...,x_n)$ es una muestra de $n$ observaciones de $X$ $\Leftrightarrow$ $x_i \in Im(X) , forall i=1,...,n$ $\Leftrightarrow$ $x_i$ es una realizacion de la v.a. $X$  , $forall i=1,...,n$


**Observación:**

1) Una muestra de observaciones de una v.a. es un vector de números, no son v.a.'s.

2) Si $(x_1,...,x_n)$ es una muestra de $n$ observaciones de $X\sim D(\cdot)$ , entonces $x_i$ es una observacion que ha sido generada por la distribución de probabilidad $D(\cdot)$, es decir, $x_i$ puede verse como un numero aleatorio generado en base a la distribución de probabilidad $D(\cdot)$

3) Si $(x_1,...,x_n)$ es una muestra de $n$ observaciones de $X\sim D(\cdot)$ , entonces:


$P(X= x_i)$ es la probabilidad de  observar $x_i$ al extraer una muestra de observaciones de $X$


4) Si $(X_1,...,X_n)$ es una muestra aleatoria simple (m.a.s.) de tamaño $n$ de $X\sim D(\cdot)$ , entonces:

$P(X_1 = x_1 , ..., X_n=x_n)$ es la probabilidad de obtener como valores $(x_1,...,x_n)$ al extraer una muestra de observaciones de $X$





## Estadístico

Sea $X$ una v.a. tal que $X \sim D(\theta)$ ,

Sea $(X_1,...,X_n)$ una m.a.s. de $X$

Un estadistico es una funcion $T$ de una m.a.s. que no depende del parametro $\theta$


Por tanto:

$T(X_1,...,X_n)$ es un estadistico


**Observación:**

1) $T(X_1,...,X_n)$ es una v.a. al ser una función de v.a.'s

2) Dada una muestra de observaciones $(x_1 ,..., x_n)$ de  la v.a. $X \sim D(\theta)$ 

$T(x_1,...,x_n)$ es una observación de la v.a. $T(X_1,...,X_n)$


3) Dadas $B$ muestras de observaciones $(x_1^1 , ..., x_n^1) ,...,(x_1^B,...,x_n^B)$ de la v.a. $X \sim D(\theta)$ 

$T(x_1^1 , ..., x_n^1) ,..., T(x_1^B,...,x_n^B)$ es una muestra de observaciones de la v.a. $T(X_1,...,X_n)$


### Ejemplos de estadisticos


Sea $X$ una v.a. tal que $X \sim D(\theta)$ , y sea $(X_1,...,X_n)$ una m.a.s. de $X$


**Media muestral**

$$T(X_1,...,X_n) = \overline{X} = \dfrac{1}{n} \sum_{i=1}^n X_i$$


**Varianza muestral**

$$T(X_1,...,X_n) = S^2 = \dfrac{1}{n} \sum_{i=1}^n (X_i - \overline{X})^2$$


**Cuasi-Varianza muestral**

$$T(X_1,...,X_n) = S^2 = \dfrac{1}{n-1} \sum_{i=1}^n (X_i - \overline{X})^2$$







## Estimador Puntual

Dada una v.a. $X\sim D(\theta)$ y una m.a.s. $(X_1,...,X_n)$ de $X$, 

Un estimador puntual para el parametro $\theta$ es un estadistico $\widehat{\theta}(X_1,...,X_n)$ que se propone para estimar $\theta$

## Estimación Puntual

Dada una v.a. $X\sim D(\theta)$ , una m.a.s. $(X_1,...,X_n)$ de $X$ y un estadistico $\widehat{\theta}(X_1,...,X_n)$

Si  $(x_1,...,x_n)$ es una muestra de observaciones  de $X$ , entonces:

$\widehat{\theta}(x_1,...,x_n)$ es una estimación puntual del parametro $\theta$



**Observaciones:**

Un estimador puntual es una v.a. y una estimación puntual un número.



## Métodos de estimación puntual: método de los momentos

### Momentos de una v.a.

Momento de orden $k$ de la v.a. $X$  es $E[X^k]$


### Momento muestral

Momento de orden $k$ de la m.a.s. $(X_1,...,X_n)$ de la v.a. $X$ es $\dfrac{1}{n} \cdot \sum_{i=1}^n X_i^k$



### Método de los Momentos 

Dada una v.a. $X\sim D(\theta_1,...,\theta_h)$ y una m.a.s. $(X_1,...,X_n)$ de $X$, 

Se quieren estimar los parametros $\theta_1,...,\theta_h$ 

El método de los momentos consiste en resolver en $\theta_1,...,\theta_h$ el siguiente sistema de ecuaciones:


$E[X] = \dfrac{1}{n} \cdot \sum_{i=1}^n X_i$

$E[X^2] = \dfrac{1}{n} \cdot \sum_{i=1}^n X_i^2$

$...$

$E[X^h] = \dfrac{1}{n} \cdot \sum_{i=1}^n X_i^h$



Si solución del sistema en $(\theta_1,...,\theta_h)$ es el vector de estadisticos $(T_1(X_1,...,X_n),...,T_h(X_1,...,X_n)$ , entonces se toma:

$(\widehat{\theta}_1,...,\widehat{\theta}_h) = (T_1(X_1,...,X_n),...,T_h(X_1,...,X_n)$




**Observación:**

Los momentos $E[X], E[X^2],..., E[X^h]$ depende generalmente de los parametros a estimar $\widehat{\theta}_1,...,\widehat{\theta}_h$



#### Ejemplo: v.a. Normal

Sea $X \sim N(\mu , \sigma^2)$ ,

Calcularemos estimadores de los parametros $(\mu , \sigma^2)$ usando el métodos de los momentos.


$E[X]= \mu$

$E[X^2]= \mu^2 + \sigma^2$


Siguiendo el método de los momentos debemos resolver en \mu y \sigma^2 els siguiente sistema de ecuaciones:

$\mu = \dfrac{1}{n} \cdot \sum_{i=1}^n X_i$

$\mu^2 + \sigma^2 = \dfrac{1}{n} \cdot \sum_{i=1}^n X_i^k$




#### Justificación al método de los momentos


#### Observaciones al método de los momentos






## Métodos de estimación puntual: Método de Máxima Verosimilitud

### Función de Verosimilitud

Dada una v.a. $X\sim D(\theta)$ y una m.a.s. $(X_1,...,X_n)$ de $X$ y una muestra de observaciones $(x_1,...,x_n)$    de $X$



La función de verosimilitud de la m.a.s. $(X_1,..., X_n)$ es una función tal que:

1) $\mathcal{L}_{X_1,..., X_n} : \mathbb{R}^n \rightarrow \mathbb{R}$


2) La función de verosimilitud de la m.a.s. $(X_1,..., X_n)$ evaluada en la muestra de observaciones $(x_1,...,x_n)$ se define como :

$$\mathcal{L}_{X_1,..., X_n}(x_1,...,x_n) = f_{X_1,...,X_n}(x_1,...,x_n, \theta)$$

Donde: $f_{X_1,...,X_n}$ es la funcion de densidad o de probabilidad conjunta para las v.a.'s $X_1,...,X_n$


**Observación:**


1) Como  la m.a.s. $(X_1,..., X_n)$ son v.a.'s independientes  ,entonces :

$$\mathcal{L}_{X_1,..., X_n}(x_1,...,x_n, \theta) = f_{X_1,...,X_n}(x_1,...,x_n, \theta)= f_{X_1}(x_1 , \theta)\cdot ... \cdot f_{X_n}(x_n, \theta)$$



2) Como  la m.a.s. $(X_1,..., X_n)$ son v.a.'s identicamente disstribuidas a $X$ , es decir, siguen la misma distribución que $X$, se tiene que $f_{X_i}=f_{X}=f_{D(\theta)} , \forall i=1,...,n$ , por lo tanto :

$$\mathcal{L}_{X_1,..., X_n}(x_1,...,x_n , \theta) = f_{X_1,...,X_n}(x_1,...,x_n | \theta)= f_{X_1}(x_1 , \theta)\cdot ... \cdot f_{X_n}(x_n | \theta) = f_{X}(x_1 | \theta)\cdot ... \cdot f_{X}(x_n | \theta)$$



# Método de Máxima Verosimilitud


Dada una v.a. $X\sim D(\theta)$ y una m.a.s. $(X_1,...,X_n)$ de $X$ y una muestra de observaciones $(x_1,...,x_n)$    de $X$

$$\widehat{\theta}_{MV} = arg \underset{\theta}{Max} \mathcal{L}_{X_1,..., X_n}(x_1,...,x_n, \theta)$$



**Observaciones:**

La idea del método de estimación por máxima verosimilitud es, dada una muestra de observaciones (unos datos) de una variable de interes, estimar el parametro desconocido como aquel valor del parametro que maximiza la probabilidad / densidad de obtener la muestra de observacciones que se ha extraido, es decir, que hace más verosimil los datos disponibles. Siempre bajo el supuesto de que conocemos la distribucion de probabilidad de la variable de interes, y por tanto se puede calcular la probabilidad de extraer aleatoriamente cierta muestra de observaciones de esa variable.

### Ejemplos




## Propiedades de los estimadores




## Estimación por Intervalos de Confianza




## Contrastes de Hipotesis







## Distribución de la media aritmética:

Si $X_1,...,X_n \underset{i.i.d.}{\sim} N(\mu , \sigma^2)$ , enonces:

$$\overline{X} = \dfrac{1}{n} \cdot \sum_{i=1}^n X_i  \sim N(\mu , \dfrac{\sigma^2}{n})$$


## Teorema de Fisher

Sea $S^2 = \dfrac{1}{n-1}  \cdot \sum_{i=1}^n (X_i - \overline{X})^2$

Si $X_1,...,X_n \underset{i.i.d.}{\sim} N(\mu , \sigma^2)$ , enonces:


$$\dfrac{(n-1)}{\sigma^2} \cdot S^2 \sim \chi^2_{n-1}$$


## Teorema de Student


Si $Z\sim N(0,1)$ y $U\sim \chi_n^2$ y son independientes, entonces:


$$\dfrac{Z}{\sqrt{\dfrac{U}{n}}} \sim t_n$$



## Teorema de Gosset

Si $X_1,...,X_n \underset{i.i.d.}{\sim} N(\mu , \sigma^2)$ , enonces:


$$\dfrac{\overline{X} - \mu}{\sqrt{S / n}} \sim t_{n-1}$$




## Media muestral estimador insesgado de la media poblacional



<br>

------

<br>



# Inferencia Bayesiana


## Funcion de Versosimilitud

Dada una v.a. $X \sim D(\Theta)$ y una m.a.s. $(X_1,...,X_n)$ de $X$ y una muestra de observaciones $(x_1,...,x_n)$    de $X$


- En la inferencia **frecuentista**


Como $\Theta$ es un parametro constante y no una v.a.  se tiene que:

 
La funcion de verosimilitud de la m.a.s. $(X_1,...,X_n)$ de la v.a $X \sim D(\Theta )$ para la muestra de observaciones $(x_1,...,x_n)$ es:

\begin{gather*}
\mathcal{L}_{X_1,..., X_n}(\Theta | x_1,...,x_n )=f_{X_1,...,X_n | \Theta}(x_1,...,x_n, \theta)  = f_{X_1}(x_1 , \Theta) \cdot ... \cdot f_{X_n}(x_n, \Theta) =f_{X}(x_1 , \Theta) \cdot ... \cdot f_{X}(x_n, \Theta) = \prod_{i=1}^n f_{X}(x_i , \Theta)
\end{gather*}
 
<br>
 
**Observaciones:**
 
1) Como $\Theta$ es una constante se tiene que:

$$f_{X_1,...,X_n | \Theta}(x_1,...,x_n , \Theta) = \dfrac{f_{X_1,...,X_n, \Theta}(x_1,...,x_n, \Theta) }{f_{\Theta}(\Theta)} =  \dfrac{f_{X_1,...,X_n}(x_1,...,x_n, \Theta) }{1} = f_{X_1,...,X_n}(x_1,...,x_n, \Theta)$$

Ya que $f_{\Theta}(\Theta) = 1$ y $f_{X_1,...,X_n,\Theta}(x_1,...,x_n,\Theta) = f_{X_1,...,X_n}(x_1,...,x_n,\Theta)$ , donde $f_{X_1,...,X_n}(x_1,...,x_n,\Theta)$ sigue dependiendo de $\Theta$ porque la distribucion de las $X_i$ depende de $\Theta$ , pero lo relevante es que la distribucion conjunta de $X_1,...,X_n, \Theta$ coincide con la de conjunta de $X_1,...,X_n$ al ser $\Theta$ un parametro constante.
 
<br>

----

<br>
 
- En la estadistica **Bayesiana**, al ser $\Theta$ una v.a. se tiene que  la funcion de verosimilitud de la m.a.s. $(X_1,...,X_n)$ de la v.a $X\sim D(\Theta )$ para la muestra de observaciones $(x_1,...,x_n)$ es:


 $\mathcal{L}_{X_1,..., X_n}(\Theta | x_1,...,x_n )= f_{X_1,...,X_n | \Theta}(x_1,...,x_n, \theta) = \dfrac{f_{X_1,...,X_n, \Theta}(x_1,...,x_n, \theta) }{f_{\Theta}(\theta)} \neq f_{X_1,...,X_n}(x_1,...,x_n)$

<br>

**Observaciones:**

1) Como $\Theta$ es ahora una v.a. y no una constante entonces $\Theta$ tendra su propia distribucion por lo que $f_{\Theta}(\theta) \neq 1$ , y además $f_{X_1,...,X_n, \Theta} \neq f_{X_1,...,X_n}$ 



2) $\mathcal{L}_{X_1,..., X_n}(\Theta | x_1,...,x_n)$ difere de la estadistica frecuentista a la Bayesiana.




 

3) $f_{X_1,...,X_n | \Theta}(x_1,...,x_n, \theta)$ es llamada función de verosimilitud


4) $f_{X_1,...,X_n}(x_1,...,x_n)$ es llamada función de verosimilitud marginal

5) $f_{X_1,...,X_n}$  en la inferencia Bayesiana no depende de $\Theta$ , ya que al ser una v.a. se tiene que:


$$f_{X_1,...,X_n}(x_1,...,x_n) = \int_{\theta \in \mathbb{R}} f_{X_1,...,X_n | \Theta}(x_1,...,x_n, \theta) \cdot f_{\Theta}(\theta) \cdot d\theta$$


6) $f_{X_1,...,X_n}$ en la inferencia frecuentista si depende de $\Theta$ , al no cumplirse la igualdad anterior por no ser $\Theta$ una v.a., y depender la distribucion de $X_i$ de $\Theta$



<br>


## Teorema de Bayes en la inferencia bayesiana

Dada una v.a. $X\sim D(\Theta)$ y una m.a.s. $(X_1,...,X_n)$ de $X$ y una muestra de observaciones $(x_1,...,x_n)$    de $X$


En la estadistica Bayesiana se considera que $\Theta$ es una v.a. , en la frecuentista un parametro constante.


El terorema de Bayes aplicado a $\Theta | X_1,...,X_n$ es:

$$f_{\Theta | X_1,...,X_n}( \theta , x_1,...,x_n) = \dfrac{f_{\Theta}( \theta ) \cdot f_{X_1,...,X_n | \Theta }(x_1,...,x_n, \theta)}{f_{X_1,...,X_n}(x_1,...,x_n)}$$

<br>

Donde, en la estadistica Bayesiana:

- $f_{\Theta | X_1,...,X_n}( \theta | x_1,...,x_n) = f_{\Theta | Data }(\theta, data)$ se denomina **distribución a posteriori** de $\Theta$

- $f_{\Theta}( \theta )$ se denomina **distribucion a priori** de $\Theta$

- $f_{X_1,...,X_n | \Theta}(x_1,...,x_n, \theta)$ es la funcion de verosimilitud

- $f_{X_1,...,X_n}(x_1,...,x_n)$ es la funcion de verosimilitud marginal



**Observación**

- Usando el teorema de la probabilidad total,  como en la inferencia Bayesiana $\Theta$ es una v.a., tenemos que:


$$f_{X_1,...,X_n}(x_1,...,x_n) = \int_{\theta \in \mathbb{R}} f_{X_1,...,X_n | \Theta}(x_1,...,x_n, \theta) \cdot f_{\Theta}(\theta) \cdot d\theta$$

Por lo que en la inferencia Bayesiana,   $$f_{X_1,...,X_n}(x_1,...,x_n)$$ no depende de $\Theta$ , cosa que si ocurre en la inferencia frecuentista, al no poderse aplicar lo anterior por no ser $\Theta$ una v.a.

Además , dados los datos $(x_1,...,x_n)$ se tiene que $f_{X_1,...,X_n}(x_1,...,x_n)$ es una constante.

Usando este hecho y la relacion de proporcionalidad $\propto$ , en la estadistica Bayesiana se tiene que:

<br>

$$f_{\Theta | X_1,...,X_n}( \theta , x_1,...,x_n) = \dfrac{f_{\Theta}( \theta ) \cdot f_{X_1,...,X_n}(x_1,...,x_n | \Theta = \theta)}{f_{X_1,...,X_n}(x_1,...,x_n)} \hspace{0.15cm} \propto \hspace{0.15cm} f_{\Theta}( \theta ) \cdot f_{X_1,...,X_n | \Theta }(x_1,...,x_n , \theta)$$

<br>

$$\text{a posteriori} = \text{a priori x verosimilitud}$$



<br>

## Distribucion a posteriori para distribucion binomial, geometrica y binomial negativa



Dada una v.a. $X| \Theta \sim D(\Theta)$ y una m.a.s. $(X_1| \Theta,...,X_n| \Theta)$ de $X| \Theta$ y una muestra de observaciones $(x_1,...,x_n)$    de $X| \Theta$

<br>

- Si $D(\Theta)=Binomial(k, p=\Theta)$ , entonces: 

$$f_{X_i | \Theta}(x_i , \theta)  = \binom{k}{x_i} \cdot \theta\hspace{0.15cm}^{x_i} \cdot (1-\theta )\hspace{0.15cm}^{n- x_i}$$


Por tanto:

$$\mathcal{L}_{X_1,..., X_n}(\Theta | x_1,...,x_n) =f_{X_1,...,X_n | \Theta}(x_1,...,x_n, \theta) = \prod_{i=1}^n f_{X_i | \Theta}(x_i , \theta)  = \\ = \prod_{i=1}^n \left( \binom{k}{x_i} \cdot \theta\hspace{0.15cm}^{x_i} \cdot (1 - \theta )\hspace{0.15cm}^{k- x_i} \right) = \prod_{i=1}^n \binom{k}{x_i} \cdot \theta\hspace{0.15cm}^{\sum_{i=1}^n x_i} \cdot (1 - \theta )\hspace{0.15cm}^{n\cdot  k- \sum_{i=1}^n x_i}$$

<br>

Si usamos como distribucion a priori de $\Theta$ una $Beta(\alpha, \beta)$ :

<br>

$$f_{\Theta}(\theta)= \dfrac{1}{B(\alpha, \beta)} \cdot \theta\hspace{0.15cm}^{\alpha - 1} \cdot (1- \theta)\hspace{0.15cm}^{\beta -1}$$

Entonces, la distribucion a posteriori es:

\begin{gather*}
f_{\Theta | X_1,...,X_n}( \theta , x_1,...,x_n) \hspace{0.15cm} \propto\hspace{0.15cm} f_{\Theta}(\theta) \cdot f_{X_1,...,X_n | \Theta}(x_1,...,x_n, \theta) = \\[0.35cm] = \dfrac{1}{B(\alpha, \beta)} \cdot \theta\hspace{0.15cm}^{\alpha - 1} \cdot (1- \theta)\hspace{0.15cm}^{\beta -1} \cdot \prod_{i=1}^n \binom{k}{x_i}   \cdot \theta\hspace{0.15cm}^{\sum_{i=1}^n x_i} \cdot (1 - \theta )\hspace{0.15cm}^{n\cdot  k- \sum_{i=1}^n x_i} = \\[0.35cm] = \dfrac{1}{B(\alpha, \beta)} \cdot \theta\hspace{0.15cm}^{(\alpha+ \sum_{i=1}^n x_i ) - 1  } \cdot (1- \theta)\hspace{0.15cm}^{(\beta+ n\cdot  k- \sum_{i=1}^n x_i) -1 } \cdot \prod_{i=1}^n \binom{k}{x_i}  \propto \\[0.35cm] \propto
\dfrac{1}{B(\alpha, \beta)} \cdot \theta\hspace{0.15cm}^{(\alpha+ \sum_{i=1}^n x_i ) - 1  } \cdot (1- \theta)\hspace{0.15cm}^{(\beta+ n\cdot  k- \sum_{i=1}^n x_i) -1 } = \\[0.35cm] = Beta\left(\alpha+ \sum_{i=1}^n x_i \hspace{0.15cm},\hspace{0.15cm} \beta+ n\cdot  k- \sum_{i=1}^n x_i \right)
\end{gather*}



Por tanto, la distribucion a posteriori es:

$$\Theta | X_1=x_1,...,X_n=x_n \hspace{0.15cm} \sim \hspace{0.15cm} Beta\left(\alpha+ \sum_{i=1}^n x_i \hspace{0.15cm},\hspace{0.15cm} \beta+ n\cdot  k- \sum_{i=1}^n x_i \right)$$


<br>


- Si $D(\Theta)=BinomNeg(r, p=\Theta)$ , entonces: 

$$f_{X_i | \Theta}(x_i , \theta)  = \binom{r- x_i -1}{x_i} \cdot \theta\hspace{0.15cm}^{r} \cdot (1-\theta )\hspace{0.15cm}^{ x_i}$$


BinomNeg(r, p) se puede interpretar como el nº de fracasos obtenidos hasta la obtencion de r exitos tras realizar suficientes experimentos Bernouilli(p).

Por tanto:

$$\mathcal{L}_{X_1,..., X_n}(\Theta | x_1,...,x_n) =f_{X_1,...,X_n | \Theta}(x_1,...,x_n, \theta) = \prod_{i=1}^n f_{X_i | \Theta}(x_i , \theta)  = \\ = \prod_{i=1}^n \left( \binom{r- x_i -1}{x_i} \cdot \theta\hspace{0.15cm}^{r} \cdot (1-\theta )\hspace{0.15cm}^{ x_i} \right) = \prod_{i=1}^n \binom{r- x_i -1}{x_i} \cdot \theta\hspace{0.15cm}^{n\cdot r} \cdot (1 - \theta )\hspace{0.15cm}^{\sum_{i=1}^n x_i}$$

<br>

Si usamos como distribucion a priori de $\Theta$ una $Beta(\alpha, \beta)$ :

<br>

$$f_{\Theta}(\theta)= \dfrac{1}{B(\alpha, \beta)} \cdot \theta\hspace{0.15cm}^{\alpha - 1} \cdot (1- \theta)\hspace{0.15cm}^{\beta -1}$$

Entonces, la distribucion a posteriori es:

\begin{gather*}
f_{\Theta | X_1,...,X_n}( \theta , x_1,...,x_n) \hspace{0.15cm} \propto\hspace{0.15cm} f_{\Theta}(\theta) \cdot f_{X_1,...,X_n | \Theta}(x_1,...,x_n, \theta) = \\[0.35cm] = \dfrac{1}{B(\alpha, \beta)} \cdot \theta\hspace{0.15cm}^{\alpha - 1} \cdot (1- \theta)\hspace{0.15cm}^{\beta -1} \cdot \prod_{i=1}^n \binom{r- x_i -1}{x_i} \cdot \theta\hspace{0.15cm}^{n\cdot r} \cdot (1 - \theta )\hspace{0.15cm}^{\sum_{i=1}^n x_i} \propto \\[0.35cm] \propto \hspace{0.15cm}   \dfrac{1}{B(\alpha, \beta)} \cdot \theta\hspace{0.15cm}^{(\alpha + n\cdot r) -cm} \cdot (1- \theta)\hspace{0.15cm}^{(\beta + \sum_{i=1}^n x_i) -1}
\end{gather*}



Por tanto, la distribucion a posteriori es:

$$\Theta | X_1=x_1,...,X_n=x_n \hspace{0.15cm} \sim \hspace{0.15cm} Beta\left(\alpha+ n\cdot r \hspace{0.15cm},\hspace{0.15cm} \beta + \sum_{i=1}^n x_i \right)$$








<br>


- Si $D(\Theta)=GeomFrac(p=\Theta)$ , entonces: 

$$f_{X_i | \Theta}(x_i , \theta)  = \theta \cdot (1-\theta )\hspace{0.15cm}^{ x_i}$$


Por tanto:

$$\mathcal{L}_{X_1,..., X_n}(\Theta | x_1,...,x_n) =f_{X_1,...,X_n | \Theta}(x_1,...,x_n, \theta) = \prod_{i=1}^n f_{X_i | \Theta}(x_i , \theta)  = \\ = \prod_{i=1}^n \theta \cdot (1 - \theta )\hspace{0.15cm}^{x_i}=  \theta\hspace{0.15cm}^{n} \cdot (1 - \theta )\hspace{0.15cm}^{ \sum_{i=1}^n x_i}$$

<br>

Si usamos como distribucion a priori de $\Theta$ una $Beta(\alpha, \beta)$ :

<br>

$$f_{\Theta}(\theta)= \dfrac{1}{B(\alpha, \beta)} \cdot \theta\hspace{0.15cm}^{\alpha - 1} \cdot (1- \theta)\hspace{0.15cm}^{\beta -1}$$

Entonces, la distribucion a posteriori es:

\begin{gather*}
f_{\Theta | X_1,...,X_n}( \theta , x_1,...,x_n) \hspace{0.15cm} \propto\hspace{0.15cm} f_{\Theta}(\theta) \cdot f_{X_1,...,X_n | \Theta}(x_1,...,x_n, \theta) = \\[0.35cm] = \dfrac{1}{B(\alpha, \beta)} \cdot \theta\hspace{0.15cm}^{\alpha - 1} \cdot (1- \theta)\hspace{0.15cm}^{\beta -1} \cdot  \theta\hspace{0.15cm}^{n} \cdot (1 - \theta )\hspace{0.15cm}^{ \sum_{i=1}^n x_i} = \\[0.35cm] = \dfrac{1}{B(\alpha, \beta)} \cdot \theta\hspace{0.15cm}^{(\alpha+ n) - 1  } \cdot (1- \theta)\hspace{0.15cm}^{(\beta+\sum_{i=1}^n x_i) -1 }   =  \\[0.35cm]  = Beta\left(\alpha+ n \hspace{0.15cm},\hspace{0.15cm} \beta+ \sum_{i=1}^n x_i \right)
\end{gather*}



Por tanto, la distribucion a posteriori es:

$$\Theta | X_1=x_1,...,X_n=x_n \hspace{0.15cm} \sim \hspace{0.15cm} Beta\left(\alpha+ n \hspace{0.15cm},\hspace{0.15cm} \beta+ \sum_{i=1}^n x_i \right)$$



<br>

- Si $D(\Theta)=GeomInt(p=\Theta)$ , entonces: 

$$f_{X_i | \Theta}(x_i , \theta)  = \theta \cdot (1-\theta )\hspace{0.15cm}^{ x_i -1}$$


Por tanto:

$$\mathcal{L}_{X_1,..., X_n}(\Theta | x_1,...,x_n) =f_{X_1,...,X_n | \Theta}(x_1,...,x_n, \theta) = \prod_{i=1}^n f_{X_i | \Theta}(x_i , \theta)  = \\ = \prod_{i=1}^n \theta \cdot (1 - \theta )\hspace{0.15cm}^{x_i -1}=  \theta\hspace{0.15cm}^{n} \cdot (1 - \theta )\hspace{0.15cm}^{ \sum_{i=1}^n (x_i-1)}$$

<br>

Si usamos como distribucion a priori de $\Theta$ una $Beta(\alpha, \beta)$ :


La distribucion a posteriori es:

$$\Theta | X_1=x_1,...,X_n=x_n \hspace{0.15cm} \sim \hspace{0.15cm} Beta\left(\alpha+ n \hspace{0.15cm},\hspace{0.15cm} \beta+ \sum_{i=1}^n (x_i -1) \right)$$

<br>






<br>

------

<br>



# Bibliografia

Apuntes probabilidad Raul Jimenez

Apuntes Mike Wipper

Libro inferencia estadistica Luis Rincon

Apuntes contrastes hipotesis Sandra Benitez Peña