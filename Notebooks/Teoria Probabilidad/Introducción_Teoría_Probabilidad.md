---
title: 'Introducción a la Teoría de la Probabilidad'
author: 'Fabio Scielzo Ortiz'
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







# Experimento Aleatorio 

Un experimento aleatorio $\hspace{0.08cm}\varepsilon\hspace{0.08cm}$ es un  experimento que si se repite varias veces en las mismas condiciones puede ofrecer diferentes resultados.

<br>

# Espacio Muestral

El espacio muestal de un experimento aleatorio $\hspace{0.08cm}\varepsilon\hspace{0.08cm}$ es el conjunto de todos los resultados posibles de una realización del esperimento, y se denota por $\hspace{0.08cm}\Omega(\varepsilon)\hspace{0.08cm}$.


<br>

# Sucesos

Sea $\hspace{0.08cm}\varepsilon\hspace{0.08cm}$  un experimento aleatorio con espacio muestral $\hspace{0.08cm}\Omega(\varepsilon)\hspace{0.08cm}$ , $\\[0.3cm]$

- $A\hspace{0.08cm}$ es un suceso del experimento aleatorio $\hspace{0.08cm}\varepsilon\hspace{0.08cm}$ $\hspace{0.15cm}\Leftrightarrow\hspace{0.15cm}$ $\hspace{0.08cm}A\subset \Omega(\varepsilon)\hspace{0.08cm}$.

<br>

# Ocurrencia de sucesos <a class="anchor" id="1"></a>

Se realiza un experimento aleatorio $\hspace{0.08cm}\varepsilon\hspace{0.08cm}$ un número $\hspace{0.08cm}n\hspace{0.08cm}$ determinado de veces.

Sea $\hspace{0.08cm}w_i \in \Omega(\varepsilon)\hspace{0.08cm}$  el resultado obtenido en la $i$-esima realizacion del exprerimento aleatorio $\hspace{0.08cm}\varepsilon\hspace{0.08cm}$ , $\\[0.3cm]$


- El suceso $\hspace{0.08cm}A \subset \Omega(\varepsilon)\hspace{0.08cm}$ ha ocurrido en ese conjunto de realizaciones  $\hspace{0.15cm}\Leftrightarrow\hspace{0.15cm}$ $\hspace{0.08cm}w_i \in A \hspace{0.15cm},\hspace{0.15cm} \exists \hspace{0.08cm}  i=1,2,...,n$


<br>

## Suceso Imposible

Sea $\hspace{0.08cm}\emptyset\hspace{0.08cm}$ el conjunto vacio, $\\[0.3cm]$


- $\emptyset\hspace{0.08cm}$ es el suceso imposible, ya que nunca ocurre, en ningún conjunto de realizaciones de un experimento aleatorio.


<br>

## Suceso Seguro


- $\Omega(\varepsilon)\hspace{0.08cm}$ es el suceso seguro, ya que siempre ocurre, en cualquier conjunto de realizaciones de un experimento aleatorio.


<br>

# Suceso Simple


- $A\subset \Omega(\varepsilon)\hspace{0.08cm}$ es un suceso simple $\hspace{0.15cm}\Leftrightarrow\hspace{0.15cm}$ $\# A = 1$

<br>

# Suceso Compuesto


- $A\subset \Omega(\varepsilon)\hspace{0.08cm}$ es un suceso compuesto $\hspace{0.15cm}\Leftrightarrow\hspace{0.15cm}$ $\# A > 1$

<br>

# Operaciones con sucesos


## Unión de sucesos

Sean $\hspace{0.08cm}A \hspace{0.05cm},\hspace{0.05cm} B \subset \Omega(\varepsilon)\hspace{0.08cm}$,

La unión de $\hspace{0.08cm}A\hspace{0.08cm}$ y $\hspace{0.08cm}B\hspace{0.08cm}$ se define como: $\\[0.35cm]$

$$A\cup B \hspace{0.08cm}=\hspace{0.08cm} \lbrace \hspace{0.08cm} w \in \Omega(\varepsilon)\hspace{0.15cm} : \hspace{0.15cm} w \in A \hspace{0.2cm} o\hspace{0.2cm} w \in B  \hspace{0.08cm}  \rbrace \\$$


**Observación:**

Sea $\hspace{0.08cm}w \in \Omega(\varepsilon)\hspace{0.08cm}$ el resultado de una realizacion del experimento aleatorio $\hspace{0.08cm}\varepsilon\hspace{0.08cm}$.

- Si $\hspace{0.08cm}w \in A\cup B \hspace{0.15cm} \Rightarrow\hspace{0.15cm}$  ocurre $\hspace{0.08cm}A\hspace{0.08cm}$ o $\hspace{0.08cm}B\hspace{0.08cm}$.

<br>

### Propiedades de la unión de sucesos

- $A\cup B \hspace{0.08cm}=\hspace{0.08cm} B\cup A$ $\\[0.45cm]$

- $A \cup A \hspace{0.08cm}=\hspace{0.08cm} A$ $\\[0.45cm]$

- $A \cup \emptyset  \hspace{0.08cm}=\hspace{0.08cm} A$ $\\[0.45cm]$

- $A \cup \Omega(\varepsilon) \hspace{0.08cm}=\hspace{0.08cm} \Omega(\varepsilon)$ $\\[0.45cm]$

- $A \cup A^c \hspace{0.08cm}=\hspace{0.08cm} \Omega(\varepsilon)$ $\\[0.45cm]$

- Si $\hspace{0.08cm} A \cup B \hspace{0.08cm}=\hspace{0.08cm} \emptyset \hspace{0.25cm}\Rightarrow\hspace{0.25cm} \# A \cup B \hspace{0.08cm}=\hspace{0.08cm} \#A + \#B$ $\\[0.45cm]$

- $\# A \cup B \hspace{0.08cm}=\hspace{0.08cm} \# A \hspace{0.08cm}+\hspace{0.08cm} \# B \hspace{0.08cm}-\hspace{0.08cm} \# A\cap B$


<br>

## Intersección de sucesos

Sean $\hspace{0.08cm}A \hspace{0.05cm},\hspace{0.05cm} B \subset \Omega(\varepsilon)\hspace{0.08cm}$,

La intersección de $\hspace{0.08cm}A\hspace{0.08cm}$ y $\hspace{0.08cm}B\hspace{0.08cm}$ se define como: $\\[0.3cm]$

$$A\cap B \hspace{0.08cm}=\hspace{0.08cm} \lbrace \hspace{0.08cm} w \in \Omega(\varepsilon) \hspace{0.15cm} : \hspace{0.15cm} w \in A \hspace{0.2cm} y\hspace{0.2cm} w \in B   \hspace{0.08cm} \rbrace \\$$

 
**Observación:**

Sea $\hspace{0.08cm}w \in \Omega(\varepsilon)\hspace{0.08cm}$ el resultado de una realizacion del experimento aleatorio $\hspace{0.08cm}\varepsilon\hspace{0.08cm}$.

- Si $\hspace{0.08cm}w \in A\cap B \hspace{0.25cm}\Rightarrow\hspace{0.25cm}$  ocurren $\hspace{0.08cm}A\hspace{0.08cm}$ y $\hspace{0.08cm}B\hspace{0.08cm}$.

<br>

### Propiedades de la intersección de sucesos

- $A\cap B \hspace{0.08cm}=\hspace{0.08cm} B \cap A$ $\\[0.45cm]$

- $A\cap A \hspace{0.08cm}=\hspace{0.08cm} A$$\\[0.45cm]$

- $A \cap \emptyset \hspace{0.08cm}=\hspace{0.08cm} \emptyset$$\\[0.45cm]$

- $A \cap \Omega(\varepsilon) \hspace{0.08cm}=\hspace{0.08cm} A$$\\[0.45cm]$

- $A \cap A^c \hspace{0.08cm}=\hspace{0.08cm} \emptyset$


<br>

## Diferencia de sucesos

Sean $\hspace{0.08cm}A \hspace{0.05cm},\hspace{0.05cm} B \subset \Omega(\varepsilon)\hspace{0.08cm}$,

La diferencia de $\hspace{0.08cm}A\hspace{0.08cm}$ y $\hspace{0.08cm}B\hspace{0.08cm}$ se define como:  $\\[0.3cm]$

$$A - B \hspace{0.08cm}=\hspace{0.08cm} \lbrace \hspace{0.08cm} w \in \Omega(\varepsilon) \hspace{0.15cm} : \hspace{0.15cm} w \in A \hspace{0.2cm} y \hspace{0.2cm} w \notin B   \hspace{0.08cm} \rbrace \\$$


 
**Observación:**

Sea $\hspace{0.08cm}w \in \Omega(\varepsilon)\hspace{0.08cm}$ el resultado de una realizacion del experimento aleatorio $\hspace{0.08cm}\varepsilon\hspace{0.08cm}$ .

- Si $\hspace{0.08cm}w \in A - B$ $\hspace{0.15cm}\Rightarrow\hspace{0.15cm}$  ocurre $\hspace{0.08cm}A\hspace{0.08cm}$ pero no $\hspace{0.08cm}B\hspace{0.08cm}$.


<br>

### Propiedades de la diferencia de sucesos

- $A-B \hspace{0.08cm}\neq\hspace{0.08cm} B - A$  , en general. $\\[0.45cm]$

- $A-A \hspace{0.08cm}=\hspace{0.08cm} \emptyset$ $\\[0.45cm]$

- $A-\emptyset \hspace{0.08cm}=\hspace{0.08cm} A$ $\\[0.45cm]$

- $A - \Omega(\varepsilon) \hspace{0.08cm}=\hspace{0.08cm} \emptyset$ $\\[0.45cm]$

- $A- B \hspace{0.08cm}=\hspace{0.08cm} A - (A\cap B)$ $\\[0.45cm]$

- $A-B \hspace{0.08cm}=\hspace{0.08cm} A\cap B^c$



<br>


## Suceso Contrario

Sea $\hspace{0.08cm}A   \subset \Omega(\varepsilon)\hspace{0.08cm}$,

El suceso contrario de $\hspace{0.08cm}A\hspace{0.08cm}$ y $\hspace{0.08cm}B\hspace{0.08cm}$ se define como: $\\[0.3cm]$

$$A^c  \hspace{0.08cm}=\hspace{0.08cm} \lbrace \hspace{0.08cm} w \in \Omega(\varepsilon) \hspace{0.15cm} : \hspace{0.15cm} w \notin A  \hspace{0.08cm} \rbrace$$

### Propiedades del suceso contrario

- $\emptyset^c \hspace{0.08cm}=\hspace{0.08cm} \Omega(\varepsilon)$ $\\[0.45cm]$

- $\Omega(\varepsilon)^c \hspace{0.08cm}=\hspace{0.08cm} \emptyset$ $\\[0.45cm]$

- $(A^c)^c \hspace{0.08cm}=\hspace{0.08cm} A$




<br>

# Leyes de teoria de conjuntos útiles para sucesos


## Leyes Asociativas

- $A \cup (B \cup C) \hspace{0.08cm}=\hspace{0.08cm} (A \cup B ) \cup C$ $\\[0.45cm]$

- $A \cap (B \cap C) \hspace{0.08cm}=\hspace{0.08cm} (A \cap B ) \cap C$ $\\[0.45cm]$

## Leyes Distributivas

- $A \cap (B \cup C) \hspace{0.08cm}=\hspace{0.08cm} (A \cap B) \cup (A \cap C)$ $\\[0.45cm]$

- $A \cup ( B \cap C) \hspace{0.08cm}=\hspace{0.08cm} (A \cup B) \cap (A \cup C)$ $\\[0.45cm]$

## Leyes de Morgan

- $(A \cup B)^c \hspace{0.08cm}=\hspace{0.08cm} A^c \cap B^c$ $\\[0.45cm]$

- $(A \cap B)^c \hspace{0.08cm} =\hspace{0.08cm} A^c \cup B^c$ $\\[0.45cm]$


<br>

# Conjunto potencia del espacio muestral

El conjunto potencia del espacio muestral $\hspace{0.08cm}\Omega\hspace{0.08cm}$ es:

$$2^\Omega \hspace{0.08cm}=\hspace{0.08cm} \lbrace\hspace{0.08cm} A \hspace{0.15cm}:\hspace{0.15cm} A \subset \Omega  \hspace{0.08cm}\rbrace$$

## Propiedades:

$$\# 2 ^\Omega \hspace{0.08cm}=\hspace{0.08cm} 2 ^{\# \Omega}$$ 


<br>


# Sucesos Disjuntos

$A\hspace{0.08cm}$ y $\hspace{0.08cm}B\hspace{0.08cm}$ son sucesos disjuntos $\hspace{0.15cm}\Leftrightarrow\hspace{0.15cm} A\cap B \hspace{0.08cm}=\hspace{0.08cm} \emptyset$

$A_1\hspace{0.08cm},\hspace{0.08cm} A_2\hspace{0.08cm} ,..., \hspace{0.08cm}A_n\hspace{0.08cm}$ son sucesos disjuntos $\hspace{0.15cm}\Leftrightarrow \hspace{0.15cm} A\hspace{0.08cm}\cap\hspace{0.08cm} A_2 \hspace{0.08cm}\cap \dots \cap\hspace{0.08cm} A_n \hspace{0.08cm}=\hspace{0.08cm} \emptyset$


<br>


# Sucesos Disjuntos dos a dos

$A_1 \hspace{0.08cm},\hspace{0.08cm} A_2 \hspace{0.08cm},..., \hspace{0.08cm} A_n\hspace{0.08cm}$ son sucesos disjuntos dos a dos $\hspace{0.15cm}\Leftrightarrow\hspace{0.15cm} A_i \cap A_j \hspace{0.08cm}=\hspace{0.08cm} \emptyset \hspace{0.25cm} , \hspace{0.25cm}\forall \hspace{0.08cm}i \neq j = 1,...,n$


<br>

# Concepto de probabilidad

## Probabilidad de Laplace

Sea $\hspace{0.08cm}\varepsilon\hspace{0.08cm}$ un experimento aleatorio con espacio muestral $\hspace{0.08cm}\Omega\hspace{0.08cm}$ , tal que $\hspace{0.08cm}\# \omega < \infty\hspace{0.08cm}$  y $\hspace{0.08cm}\# \Omega \neq 0\hspace{0.08cm}$.

La probabilidad, en el sentido de Laplace, de un suceso $\hspace{0.08cm}A \subset \Omega\hspace{0.08cm}$ se define como: $\\[0.3cm]$

$$P(A) \hspace{0.08cm} =\hspace{0.08cm} \dfrac{\# A}{\# \Omega} \hspace{0.08cm}=\hspace{0.08cm} \dfrac{\text{casos favorables}}{\text{casos posibles}}\\$$

### Propiedades de la probabilidad clásica:

- $P(\Omega) \hspace{0.08cm}=\hspace{0.08cm} 1$ $\\[0.5cm]$

- $P(A) \hspace{0.08cm}\geq\hspace{0.08cm} 0$ $\\[0.5cm]$

- $P(A \cup B) \hspace{0.08cm}=\hspace{0.08cm} P(A) + P(B) + P(A\cap B)$ $\\[0.5cm]$

- Si $\hspace{0.08cm}A\hspace{0.08cm}$ y $\hspace{0.08cm}B\hspace{0.08cm}$ son sucesos disjuntos $\hspace{0.08cm}(A\cap B = \emptyset)\hspace{0.08cm}$ , entonces:

$$P(A\cup B)\hspace{0.08cm}=\hspace{0.08cm} P(A) + P(B)$$


<br>


## Probabilidad Frecuentista

Sea $\hspace{0.08cm}\varepsilon\hspace{0.08cm}$ un experimento aleatorio con espacio muestral $\hspace{0.08cm}\Omega\hspace{0.08cm}$ y sea $\hspace{0.08cm}A\subset \Omega\hspace{0.08cm}$.

Si se realiza $\hspace{0.08cm}n\hspace{0.08cm}$ veces el experimento $\hspace{0.08cm}\varepsilon\hspace{0.08cm}$ y $\hspace{0.08cm}n(A)\hspace{0.08cm}$ es el nº de veces que ocurre el suceso $\hspace{0.08cm}A\hspace{0.08cm}$ en las $\hspace{0.08cm}n\hspace{0.08cm}$ realizaciones del experimento, la probabilidad en sentido frecuentista de $\hspace{0.08cm}A\hspace{0.08cm}$ se define como: $\\[0.3cm]$



$$P(A) \hspace{0.08cm}=\hspace{0.08cm} \underset{n \rightarrow \infty}{lim}\left( \dfrac{n(A)}{n} \right)$$



Es decir, la probabilidad de un suceso de un experimento aleatorio es la proporción de veces que ocurre cuando el experimento se repite muchas veces. $\\[0.5cm]$


### Propiedades

- $P(\Omega) \hspace{0.08cm} =\hspace{0.08cm} 1$ $\\[0.5cm]$
 
- $P(\emptyset)\hspace{0.08cm}=\hspace{0.08cm}0$ $\\[0.5cm]$

- $P(A) \hspace{0.08cm}\geq\hspace{0.08cm} 0$ $\\[0.5cm]$

- $P(A\cup B) \hspace{0.08cm}=\hspace{0.08cm} P(A) \hspace{0.08cm}+\hspace{0.08cm} P(B) \hspace{0.08cm}-\hspace{0.08cm} P(A\cap B)$ $\\[0.5cm]$

-  Si $\hspace{0.08cm}A\hspace{0.08cm}$ y $\hspace{0.08cm}B\hspace{0.08cm}$ son sucesos disjuntos $\hspace{0.08cm}(A\cap B = \emptyset)\hspace{0.08cm}$ , entonces:

$$P(A\cup B) \hspace{0.08cm}=\hspace{0.08cm} P(A) \hspace{0.08cm}+\hspace{0.08cm} P(B)$$


<br>

## Probabilidad Axiomatica de Kolmogorov

Sea $\hspace{0.08cm}\varepsilon\hspace{0.08cm}$ un experimento aleatorio con espacio muestral $\hspace{0.08cm}\Omega\hspace{0.08cm}$.


$P\hspace{0.08cm}$ es una medida de probabilidad definida sobre $\hspace{0.08cm}\Omega\hspace{0.1cm}$ si y solo si :

- $P \hspace{0.08cm}:\hspace{0.08cm} 2^\Omega \hspace{0.08cm}\rightarrow\hspace{0.08cm} \mathbb{R}$ $\\[0.5cm]$

- $P(A) \hspace{0.08cm}\geq\hspace{0.08cm} 0$ $\\[0.5cm]$

- $P(\Omega) \hspace{0.08cm}=\hspace{0.08cm} 1$ $\\[0.5cm]$

- Si $\hspace{0.08cm}A_1,A_2,A_3,... \subset \Omega\hspace{0.1cm}$  , entonces:

$$P(A_1 \cup A_2 \cup A_3 \cup ...) \hspace{0.08cm}=\hspace{0.08cm} P(A_1)\hspace{0.08cm}+\hspace{0.08cm}P(A_2)\hspace{0.08cm}+\hspace{0.08cm}P(A_3)\hspace{0.08cm}+\dots \\$$


### Propiedades


- $P(\emptyset) \hspace{0.08cm}=\hspace{0.08cm} 0$ $\\[0.5cm]$

- Si $\hspace{0.08cm}A_1,A_2,...,A_n \subset \Omega\hspace{0.08cm}$  , entonces:

$$P(A_1 \cup A_2 \cup ...\cup A_n)\hspace{0.08cm} =\hspace{0.08cm} P(A_1)+P(A_2)+...+P(A_n) \hspace{0.08cm}=\hspace{0.08cm} \sum_{i=1}^n P(A_i)$$  

- $P(A^c) \hspace{0.08cm}=\hspace{0.08cm} 1 - P(A)$$\\[0.5cm]$


- Si $\hspace{0.08cm}A \subseteq B \hspace{0.15cm}\Rightarrow\hspace{0.15cm} P(A) \hspace{0.08cm}\geq\hspace{0.08cm} P(B)$$\\[0.5cm]$

- Si $\hspace{0.08cm}A \subseteq B \hspace{0.15cm}\Rightarrow\hspace{0.15cm} P(B-A)\hspace{0.08cm} =\hspace{0.08cm} P(B)-P(A)$$\\[0.5cm]$

- $0 \hspace{0.08cm}\geq\hspace{0.08cm} P(A) \hspace{0.08cm}\geq\hspace{0.08cm} 1$ $\\[0.5cm]$

- $P(A-B) \hspace{0.08cm}=\hspace{0.08cm} P(A) - P(A\cap B)$ $\\[0.5cm]$

- $P(A \cup B)\hspace{0.08cm}=\hspace{0.08cm} P(A) \hspace{0.08cm}+\hspace{0.08cm} P(B) \hspace{0.08cm}-\hspace{0.08cm} P(A\cap B)$



<br>

# Probabilidad Condicionada

La probabilidad de $\hspace{0.08cm}A\hspace{0.08cm}$ condicionada a $\hspace{0.08cm}B\hspace{0.08cm}$ se define como: $\\[0.3cm]$

$$P(A \hspace{0.08cm}|\hspace{0.08cm} B) \hspace{0.08cm}=\hspace{0.08cm} \dfrac{\hspace{0.08cm}P(A\cap B)\hspace{0.08cm}}{P(B)} \\$$



## Propiedades

- $P(\emptyset | B) = 0$ $\\[0.5cm]$

- Si $A_1 , A_2,...,A_n$ son disjuntos dos a dos , entonces:

$$P(A_1 \cup A_2 \cup ... \cup A_n | B) = P(A_1 | B) + P(A_2 | B)  + ... + P(A_n | B) = \sum_{i=1}^n P(A_i | B) \\$$  

- $P(A^c | B) = 1 - P(A | B)$ $\\[0.5cm]$

- Si $A \subseteq D \Rightarrow P(A | B) \geq P( D | B)$ $\\[0.5cm]$

- Si $A \subseteq D \Rightarrow P(D-A | B) = P( D | B) - P(A | B)$ $\\[0.5cm]$

- $0 \geq P(A | B)   \geq 1$ $\\[0.5cm]$

- $P(A-D | B) = P(A|B) - P(A\cap D | B)$ $\\[0.5cm]$

- $P(A \cup B) = P(A) + P(B) - P(A\cap B)$

<br>

# Partición del espacio muestral

Sea $\hspace{0.08cm}\varepsilon\hspace{0.08cm}$ un experimento aleatorio con espacio muestral $\hspace{0.08cm}\Omega\hspace{0.08cm}$.

Sean $\hspace{0.08cm}A_1,A_2, ..., A_n \subseteq \Omega\hspace{0.08cm}$.

$A_1,A_2, ..., A_n\hspace{0.08cm}$ es una partición de $\hspace{0.08cm}\Omega\hspace{0.1cm}$  si y solo si:

-  $B_i \hspace{0.08cm}\neq\hspace{0.08cm} \Omega \hspace{0.18cm},\hspace{0.16cm} \forall\hspace{0.08cm} i = 1,...,n$  $\\[0.5cm]$


- $B_i \cap B_j \hspace{0.08cm}=\hspace{0.08cm} \emptyset \hspace{0.18cm},\hspace{0.18cm} \forall\hspace{0.08cm} i \neq j = 1,...,n$ $\\[0.5cm]$

- $B_1 \cup ... \cup B_n \hspace{0.08cm}=\hspace{0.08cm} \Omega$


<br>


# Teorema de la Probabilidad Total

Sea $\hspace{0.08cm}A \subseteq \Omega\hspace{0.08cm}$.

Si $\hspace{0.08cm}B_1,...,B_n\hspace{0.08cm}$ una partición de $\hspace{0.08cm}\Omega\hspace{0.08cm}$ , entonces:

$$P(A)\hspace{0.08cm}=\hspace{0.08cm}P(A\cap B_1) \hspace{0.08cm}+\hspace{0.08cm} P(A\cap B_2) \hspace{0.08cm}+\dots +\hspace{0.08cm} P(A \cap B_n) \hspace{0.08cm}=\hspace{0.08cm} \sum_{i=1}^n P(A \cap B_i)$$

<br>

# Teorema de la Probabilidad Total con probabilidad condicionada

Sea $\hspace{0.08cm}A \subseteq \Omega\hspace{0.08cm}$

Si $\hspace{0.08cm}B_1,...,B_n\hspace{0.08cm}$ una partición de $\hspace{0.08cm}\Omega\hspace{0.08cm}$, con $\hspace{0.08cm}P(B_i)>0\hspace{0.08cm}$ , entonces:


$$P(A) \hspace{0.08cm}=\hspace{0.08cm} P(A | B_1)\cdot P(B_1) \hspace{0.08cm}+ \dots + \hspace{0.08cm}P(A | B_n)\cdot P(B_n)\hspace{0.08cm}=\hspace{0.08cm} \sum_{i=1}^n P(A |  B_i)\cdot P(B_i)$$

<br>

# Teorema de Bayes

Sean $\hspace{0.08cm}A,B \subset \Omega\hspace{0.08cm}$ , con $\hspace{0.08cm}P(B)\neq 0\hspace{0.08cm}$. $\\[0.5cm]$

$$P(A |B)\hspace{0.08cm} =\hspace{0.08cm} \dfrac{P(B|A)\cdot P(A)}{P(B)}$$


<br>

# Independencia de sucesos

$A\hspace{0.08cm}$ y $\hspace{0.08cm}B\hspace{0.08cm}$ son sucesos independientes $\hspace{0.15cm}\Leftrightarrow\hspace{0.15cm}$ $P(A\cap B) \hspace{0.08cm}=\hspace{0.08cm} P(A)\cdot P(B)$ $\\[0.5cm]$

## Propiedades

- $A\hspace{0.08cm}$ y $\hspace{0.08cm}B\hspace{0.08cm}$ son sucesos independientes $\hspace{0.08cm}\Leftrightarrow\hspace{0.08cm}$ $\hspace{0.08cm}P(A | B) \hspace{0.08cm}=\hspace{0.08cm} P(A)$ $\hspace{0.15cm}\Leftrightarrow\hspace{0.15cm}$ $P(B | A)\hspace{0.08cm} =\hspace{0.08cm} P(B)$ $\\[0.5cm]$

- Si $\hspace{0.08cm}A\hspace{0.08cm}$ y $\hspace{0.08cm}B\hspace{0.08cm}$ son sucesos independientes $\hspace{0.15cm}\Rightarrow\hspace{0.15cm}$ $A^c\hspace{0.08cm}$ y $\hspace{0.08cm}B^c\hspace{0.08cm}$ también lo son. $\\[0.5cm]$


- Sucesos disjuntos no implica independientes. $\\[0.5cm]$

- Sucesos independientes no implica disjuntos.


<br>

# Independencia de múltiples sucesos


$A_1 , A_2, ..., A_n\hspace{0.08cm}$ son sucesos independientes, si y solo si:

- Son independientes $\hspace{0.08cm}2\hspace{0.08cm}$ a $\hspace{0.08cm}2\hspace{0.08cm}$. $\\[0.5cm]$

- Son independientes $\hspace{0.08cm}3\hspace{0.08cm}$ a $\hspace{0.08cm}3\hspace{0.08cm}$. $\\[0.2cm]$

$\hspace{2.5cm} \dots$ $\\[0.5cm]$

- Son independientes $\hspace{0.08cm}n\hspace{0.08cm}$ a $\hspace{0.08cm}n\hspace{0.08cm}$. $\\[0.5cm]$


lo que equivale a que se cumplan las siguientes condiciones:


- $P(A_i \cap A_j) \hspace{0.08cm}=\hspace{0.08cm} P(A_i)\cdot P(A_j) \hspace{0.2cm},\hspace{0.2cm} \forall\hspace{0.08cm} i \neq j = 1,...,n$ $\\[0.6cm]$

- $P(A_i \cap A_j \cap A_r) \hspace{0.08cm}= \hspace{0.08cm} P(A_i)\cdot P(A_j)\cdot P(A_r) \hspace{0.2cm},\hspace{0.2cm} \forall\hspace{0.08cm}  i \neq j \neq r = 1,...,n$ $\\[0.2cm]$

$\hspace{2.5cm}\dots$ $\\[0.5cm]$

- $P(A_1 \cap A_2 \cap ... \cap A_n)\hspace{0.08cm}=\hspace{0.08cm}P(A_1)\cdot P(A_2)\cdot \dots \cdot P(A_n)$


<br>

# Sigma Algrebra

$\sigma (\Omega)\hspace{0.08cm}$ es un sigma-algebra de $\hspace{0.08cm}\Omega\hspace{0.08cm}$, si y solo si:

- $\sigma (\Omega) \hspace{0.08cm}=\hspace{0.08cm} \lbrace \hspace{0.08cm} A \hspace{0.08cm}:\hspace{0.08cm} A\subset \Omega \hspace{0.08cm}\rbrace$  $\\[0.5cm]$




- $\Omega \in \sigma (\Omega)$ $\\[0.5cm]$

- Si $A \in \sigma(\Omega) \hspace{0.08cm}\Rightarrow\hspace{0.08cm} A^c \in \sigma (\Omega)$ $\\[0.5cm]$

- Si $A_1, A_2 , A_3 ,\dots \hspace{0.08cm} \in\hspace{0.08cm} \sigma (\Omega)  \hspace{0.15cm}\Rightarrow\hspace{0.15cm} A_1 \cup A2 \cup A_3 \cup \dots \hspace{0.08cm}\in\hspace{0.08cm} \sigma (\Omega)$ $\\[0.5cm]$

**Observación:**

La condición primera significa que   $\hspace{0.08cm}\sigma (\Omega)\hspace{0.08cm}$ es un conjunto de subconjuntos de $\hspace{0.08cm}\Omega\hspace{0.08cm}$.

Otra forma equivalente de expresar esta condición es: $\hspace{0.08cm}\sigma (\Omega) \subseteq 2^\Omega \\$


## Propiedades:

- $\emptyset \in \sigma (\Omega)$ $\\[0.7cm]$

- Si $\hspace{0.08cm}A_1, A_2, A_3,\dots \hspace{0.08cm} \in \sigma (\Omega) \hspace{0.15cm} \Rightarrow\hspace{0.15cm} A_1 \cap A_2 \cap A_3 \cap \dots \hspace{0.08cm} \in \sigma (\Omega)$ $\\[0.7cm]$

- Si $\hspace{0.08cm}A,B \in \sigma (\Omega)\hspace{0.15cm} \Rightarrow \hspace{0.08cm} A-B \in \sigma (\Omega)$


<br>

# Variables aleatorias


$X\hspace{0.08cm}$ es una variable aleatoria (v.a.) definida sobre $\hspace{0.08cm}(\Omega , \sigma (\Omega))\hspace{0.08cm}$, si y solo si:

- $X \hspace{0.08cm}:\hspace{0.08cm} \Omega \hspace{0.08cm}\rightarrow\hspace{0.08cm} R$ $\\[0.5cm]$
   

- $\lbrace \hspace{0.08cm} w \in \Omega \hspace{0.15cm}:\hspace{0.15cm} X(w)=x \hspace{0.08cm} \rbrace \hspace{0.08cm} \in \hspace{0.08cm} \sigma(\Omega) \hspace{0.2cm},\hspace{0.2cm} \forall \hspace{0.08cm} x \in \mathbb{R}$ $\\[0.5cm]$





**Observaciones:**

- Formalmente una v.a. ni es una variable ni es aleatoria, es una funcion que asigna números a los elementos de un espacio muestral. $\\[0.5cm]$

- Definiciones adicionales:

$$\mathcal{X}=x \hspace{0.1cm} := \hspace{0.1cm} \lbrace \hspace{0.08cm} w\in \Omega \hspace{0.15cm} : \hspace{0.15cm} \mathcal{X}(w) = x \hspace{0.08cm} \rbrace$$

$$ \mathcal{X}\in A  \hspace{0.1cm} := \hspace{0.1cm} \lbrace \hspace{0.08cm} w\in \Omega \hspace{0.15cm} : \hspace{0.15cm} \mathcal{X}(w) \in A \hspace{0.08cm} \rbrace$$

<br>

# Variables Aleatorias y Probabilidad

Dada una medida de probabilidad $\hspace{0.08cm}P \hspace{0.08cm}:\hspace{0.08cm} \sigma(\Omega) \hspace{0.08cm}\rightarrow\hspace{0.08cm} [0,1]\hspace{0.08cm}$ .


Se cumple que $\hspace{0.08cm}P\hspace{0.08cm}$ está definida en $\hspace{0.08cm}\mathcal{X}=x\hspace{0.08cm}$ , para todo $\hspace{0.08cm}x\in \mathbb{R}$

Es decir, $\hspace{0.08cm}P(\mathcal{X}=x) \in [0,1] \hspace{0.15cm},\hspace{0.15cm} \forall \hspace{0.08cm} x \in \mathbb{R}$ y se cumplen todas las propiedades de la probabilidad en sentido axiomatico.

<br>

# Variables aleatorias discretas y continuas

Sea $\hspace{0.08cm}\mathcal{X}\hspace{0.08cm}$ una variable aleatoria,


- $\mathcal{X}\hspace{0.08cm}$ es **discreta** $\hspace{0.15cm}\Leftrightarrow \hspace{0.15cm} Im(\mathcal{X})\hspace{0.08cm}$ es un conjunto **contable**. $\\[0.5cm]$

- $\mathcal{X}\hspace{0.08cm}$ es **continua** $\hspace{0.15cm}\Leftrightarrow\hspace{0.15cm} Im(X)$ es un conjunto **no contable**.




Donde:

$$Im(\mathcal{X}) \hspace{0.08cm}=\hspace{0.08cm} \left\lbrace \hspace{0.08cm} x \in \mathbb{R} \hspace{0.15cm} : \hspace{0.15cm} \exists \hspace{0.08cm} w \in \Omega \hspace{0.08cm}, \hspace{0.08cm} \mathcal{X}(w) = x \hspace{0.08cm}\right\rbrace \\$$ 

Es decir, $\hspace{0.08cm}Im(\mathcal{X})\hspace{0.08cm}$ es la imagen de la v.a. $\hspace{0.08cm}\mathcal{X}\hspace{0.08cm}$. Notese que $\hspace{0.08cm}\mathcal{X}\hspace{0.08cm}$ es una función, luego tiene dominio e imagen. $\\[0.5cm]$


**Observación:**

Un conjunto $\hspace{0.08cm}A\hspace{0.08cm}$ es **contable** $\hspace{0.08cm}\Leftrightarrow\hspace{0.08cm}$ Existe alguna función $\hspace{0.08cm}f \hspace{0.08cm}:\hspace{0.08cm} \mathbb{N} \hspace{0.08cm}\rightarrow\hspace{0.08cm} A\hspace{0.08cm}$ que sea **biyectiva** .

Es decir, que para todo $\hspace{0.08cm}y\in Im(f)=A\hspace{0.08cm}$ , existe un único número   $\hspace{0.08cm}x \in Dom(f)=\mathbb{N}\hspace{0.11cm}$ tal que $\hspace{0.08cm}f(x)=y\hspace{0.08cm}$.


<br>

# Función de probabilidad

Sea $\hspace{0.08cm}\mathcal{X}\hspace{0.08cm}$ una variable aleatoria **discreta**.

$P_\mathcal{X}\hspace{0.08cm}$ es la función de probabilidad de la v.a. $\hspace{0.08cm}\mathcal{X}\hspace{0.08cm}$, si y solo si: $\\[0.3cm]$


$$P_\mathcal{X}(x) \hspace{0.08cm}=\hspace{0.08cm} P(\mathcal{X}=x) \cdot \mathbb{I}\hspace{0.08cm}[\hspace{0.08cm} x\in Im(\mathcal{X})\hspace{0.08cm} ]$$


Donde:


 $\mathbb{I}\hspace{0.08cm}[\hspace{0.08cm} x\in Im(\mathcal{X})\hspace{0.08cm} ]$  es igual a $\hspace{0.08cm}1\hspace{0.08cm}$ cuando $\hspace{0.08cm}x\in Im(\mathcal{X})\hspace{0.12cm}$   y $\hspace{0.1cm}0\hspace{0.08cm}$ cuando $x\notin Im(\mathcal{X}) \\$
 
 
## Propiedades

- $P_\mathcal{X} (x) \hspace{0.08cm} \geq \hspace{0.08cm} 0  \hspace{0.15cm} , \hspace{0.15cm} \forall x \in \mathbb{R}$ $\\[0.5cm]$
 
- $\sum_{x\in\mathbb{R}}\hspace{0.08cm}  P_\mathcal{X}(x) \hspace{0.08cm}= \hspace{0.08cm} 1$ $\\[0.5cm]$
 
- Si $\hspace{0.08cm}A\subset \mathbb{R} \hspace{0.25cm} \Rightarrow \hspace{0.25cm} P(\mathcal{X}\in A)\hspace{0.08cm} =\hspace{0.08cm} \sum_{x\in A} \hspace{0.08cm} P_\mathcal{X}(x)$
 
<br> 
 
# Función de densidad

Sea $\hspace{0.08cm}\mathcal{X}\hspace{0.08cm}$ una variable aleatoria **continua**,


 
$f_\mathcal{X}\hspace{0.08cm}$ es la funcion de densidad de la v.a. $\hspace{0.08cm}\mathcal{X}\hspace{0.08cm}$, si y solo si: $\\[0.3cm]$

- $f_\mathcal{X}(x) \hspace{0.08cm}\geq\hspace{0.08cm} 0 \hspace{0.2cm} ,  \hspace{0.2cm} \forall \hspace{0.08cm} x \in Im(\mathcal{X})$ $\\[0.6cm]$

- $f\hspace{0.08cm}$ es integrable. $\\[0.6cm]$

- $P(\mathcal{X}\in (a,b)) \hspace{0.08cm}=\hspace{0.08cm} \int_a^b f(x)\cdot dx$ $\\[0.5cm]$
 
 
## Propiedades

- $\int_{-\infty}^{\infty} f(x)\cdot dx \hspace{0.08cm}=\hspace{0.08cm} 1$ $\\[0.6cm]$

- Toda función no negativa, integrable y cuya integral entre $\hspace{0.08cm}-\infty\hspace{0.08cm}$ y $\hspace{0.08cm}\infty\hspace{0.08cm}$ sea 1 es una función de densidad.
 

<br>
 
# Función de distribución


$F_\mathcal{X}\hspace{0.08cm}$ es la función de distribución de la v.a.  $\hspace{0.08cm}\mathcal{X} \hspace{0.2cm}\Leftrightarrow\hspace{0.2cm}$ $F_\mathcal{X}(x) \hspace{0.08cm}=\hspace{0.08cm} P(\mathcal{X} \geq x)$ $\\[0.3cm]$


## Propiedades


- Si $\hspace{0.08cm}\mathcal{X}\hspace{0.08cm}$ es una v.a. **continua**:

$$F_\mathcal{X}(x) \hspace{0.08cm}=\hspace{0.08cm} P(\mathcal{X} \geq x) \hspace{0.08cm}=\hspace{0.08cm} \int_{-\infty}^{x} f_X(z)\cdot dz$$



- Si $\mathcal{X}$ es una v.a. **discreta** : 


$$F_\mathcal{X}(x) \hspace{0.08cm}=\hspace{0.08cm} P(\mathcal{X} \geq x) \hspace{0.08cm}=\hspace{0.08cm} \sum_{z \geq x} P(\mathcal{X}=z)$$
 
 
- $\underset{x\rightarrow \infty}{lim} F_\mathcal{X}(x) \hspace{0.08cm}=\hspace{0.08cm} 1$ $\\[0.8cm]$
 
- $\underset{x\rightarrow -\infty}{lim} F_\mathcal{X}(x) \hspace{0.08cm}=\hspace{0.08cm} 0$ $\\[0.8cm]$

- $F_\mathcal{X}\hspace{0.08cm}$ es una función creciente.




<br>

# Esperanza de una variable aleatoria

La esperanza de una v.a. $\hspace{0.08cm}\mathcal{X}\hspace{0.08cm}$  se define del siguiente modo: $\\[0.3cm]$

- Si $\hspace{0.08cm}\mathcal{X}\hspace{0.08cm}$ es una v.a. **discreta** :


    $$E[\mathcal{X}] \hspace{0.08cm}=\hspace{0.08cm} \sum_{x\in \mathbb{R}} x \cdot P(\mathcal{X}=x)$$


- Si $\hspace{0.08cm}\mathcal{X}\hspace{0.08cm}$ es una v.a. **continua** : 

    $$E[\mathcal{X}] \hspace{0.08cm}=\hspace{0.08cm} \int_{-\infty}^{\infty} x \cdot f_\mathcal{X}(x) \cdot dx$$ $\\[0.5cm]$


## Propiedades

- $E[a]\hspace{0.08cm}=\hspace{0.08cm}a$ $\\[0.8cm]$

- $E[b\cdot \mathcal{X}] \hspace{0.08cm}=\hspace{0.08cm} b \cdot E[\mathcal{X}]$ $\\[0.8cm]$

- $E[a + b\cdot \mathcal{X}] \hspace{0.08cm}=\hspace{0.08cm} a + b \cdot E[\mathcal{X}]$ $\\[0.8cm]$

- $E[\mathcal{X}_1 + \mathcal{X}_2 + ...+ \mathcal{X}_n] \hspace{0.08cm}=\hspace{0.08cm} E[\mathcal{X}_1]+E[\mathcal{X}_2] + ... + E[\mathcal{X}_n]$ $\\[0.8cm]$

- $E[g_1(\mathcal{X}_1) + ... + g_n(\mathcal{X}_n)]\hspace{0.08cm}=\hspace{0.08cm}E[g_1(\mathcal{X}_1)]+...+E[g_n(\mathcal{X}_n)]$ $\\[0.8cm]$

- Si $\hspace{0.08cm}\mathcal{X}_1,...,\mathcal{X}_n\hspace{0.08cm}$ son independientes, entonces:

$$E[\mathcal{X}_1 \cdot \mathcal{X}_2 \cdot ...\cdot \mathcal{X}_n]= E[\mathcal{X}_1]\cdot E[\mathcal{X}_2] \cdot ... \cdot E[\mathcal{X}_n]$$ $\\[0.2cm]$

- Si $\hspace{0.08cm}\mathcal{X}_1,...,\mathcal{X}_n\hspace{0.08cm}$ son independientes, entonces:

$$E[g_1(\mathcal{X}_1) \cdot ... \cdot g_n(\mathcal{X}_n)]=E[g_1(\mathcal{X}_1)]\cdot ...\cdot E[g_n(\mathcal{X}_n)]$$ $\\[0.2cm]$

- Formulas de transferencia:

    Si $\hspace{0.08cm}\mathcal{X}\hspace{0.08cm}$ es **discreta**:


    $$E[g(\mathcal{X})] \hspace{0.08cm}=\hspace{0.08cm} \sum_{x\in \mathbb{R}} x \cdot P(g(\mathcal{X})=x) \hspace{0.08cm}=\hspace{0.08cm} \sum_{x\in \mathbb{R}} g(x) \cdot P(\mathcal{X}=x)$$


    Si $\hspace{0.08cm}\mathcal{X}\hspace{0.08cm}$ es **continua**:

    $$E[g(\mathcal{X})] = \int_{-\infty}^{\infty} x \cdot f_{g(\mathcal{X})}(x) \cdot dx =  \int_{-\infty}^{\infty} g(x) \cdot f_\mathcal{X}(x) \cdot dx$$



    Donde: $\hspace{0.08cm}g(\mathcal{X})\hspace{0.08cm}$ es una transformación de $\hspace{0.08cm}\mathcal{X}$.


<br>

# Varianza de una variable aleatoria

Dada una variable aleatoria $\hspace{0.08cm}\mathcal{X}\hspace{0.08cm}$, 

La varianza de $\hspace{0.08cm}\mathcal{X}\hspace{0.08cm}$  se define como: $\\[0.3cm]$

$$Var(\mathcal{X}) \hspace{0.08cm}=\hspace{0.08cm} E\Bigl[ \hspace{0.08cm} (\mathcal{X} - E[\mathcal{X}])^2 \hspace{0.08cm} \Bigr]$$ $\\[0.5cm]$
 
 
 
## Propiedades 
 
- $Var(\mathcal{X}) \hspace{0.08cm}\geq\hspace{0.08cm} 0$ $\\[0.8cm]$

- $Var(a) \hspace{0.08cm}=\hspace{0.08cm} 0$ $\\[0.8cm]$

- $Var(b\cdot \mathcal{X}) \hspace{0.08cm}=\hspace{0.08cm} b^2 \cdot Var(\mathcal{X})$ $\\[0.8cm]$

- $Var(a + b\cdot \mathcal{X})\hspace{0.08cm} =\hspace{0.08cm} b^2 \cdot Var(\mathcal{X})$ $\\[0.8cm]$

- $Var(\mathcal{X})\hspace{0.08cm}=\hspace{0.08cm}E[\mathcal{X}^2] - E[\mathcal{X}]^2$ $\\[0.8cm]$

- $Var(g_1(\mathcal{X})+g_2(\mathcal{Y})) \hspace{0.08cm}=\hspace{0.08cm} Var(g_1(\mathcal{X})) + Var(g_2(\mathcal{Y})) + 2\cdot Cov(g_1(\mathcal{X}),g_2(\mathcal{Y}))$ $\\[0.8cm]$

- $Var(a\cdot \mathcal{X} + b\cdot \mathcal{Y}) \hspace{0.08cm}=\hspace{0.08cm} a^2 \cdot Var(\mathcal{X}) + b^2 \cdot Var(\mathcal{Y}) + 2\cdot Cov(\mathcal{X},\mathcal{Y})$ $\\[0.8cm]$

- Si $\hspace{0.08cm}\mathcal{X}\hspace{0.08cm}$ e $\hspace{0.08cm}\mathcal{Y}\hspace{0.08cm}$ son independientes, entonces:

$$Var(a\cdot \mathcal{X} , b\cdot \mathcal{Y}) \hspace{0.08cm}=\hspace{0.08cm} a^2\cdot Var(\mathcal{X}) + b^2 \cdot Var(\mathcal{Y})$$ 

<br>

## Covarianza  

La covarianza entre las variables $\hspace{0.08cm}\mathcal{X}\hspace{0.08cm}$ y $\hspace{0.08cm}\mathcal{Y}\hspace{0.08cm}$ se define como : $\\[0.5cm]$

$$Cov(\mathcal{X},\mathcal{Y}) = E\Bigl[\hspace{0.08cm} (\mathcal{X}- E[\mathcal{X}])\cdot (\mathcal{Y}-E[\mathcal{Y}])\hspace{0.08cm}\Bigr]$$ $\\[0.5cm]$

### Propiedades 

- $Cov(\mathcal{X},\mathcal{Y}) \hspace{0.08cm}=\hspace{0.08cm} E[\mathcal{X}\cdot \mathcal{Y}] - E[\mathcal{X}]\cdot E[\mathcal{Y}]$ $\\[0.8cm]$

- Si $\hspace{0.08cm}\mathcal{X}\hspace{0.08cm}$ e $\hspace{0.08cm}\mathcal{Y}\hspace{0.08cm}$ son independientes $\hspace{0.15cm}\Rightarrow\hspace{0.15cm}$ $Cov(\mathcal{X},\mathcal{Y})=0$ $\\[0.8cm]$

- Si $\hspace{0.08cm}Cov(\mathcal{X},\mathcal{Y}) \neq 0$ $\hspace{0.2cm}\Rightarrow\hspace{0.2cm}$ $\mathcal{X}\hspace{0.08cm}$ e $\hspace{0.08cm}\mathcal{Y}\hspace{0.08cm}$ son independientes. $\\[0.8cm]$

- Que $\hspace{0.08cm}Cov(\mathcal{X},\mathcal{Y})=0\hspace{0.08cm}$ no implica que $\hspace{0.08cm}\mathcal{X}\hspace{0.08cm}$ e $\hspace{0.08cm}\mathcal{Y}\hspace{0.08cm}$ sean independientes.  

 


<br>




# Distribuciones de probabilidad discretas


## Distribución Uniforme Discreta

 Sea $\hspace{0.08cm}X=(x_1,...,x_n)^t\hspace{0.08cm}$,

$$\mathcal{X} \sim U(X) \hspace{0.3cm}\Leftrightarrow\hspace{0.3cm}\mathcal{X} \sim U(x_1,....,x_n) \hspace{0.3cm}\Leftrightarrow\hspace{0.3cm} P(\mathcal{X}=x) \hspace{0.08cm}=\hspace{0.08cm} \dfrac{1}{n}\cdot \mathbb{I}\hspace{0.03cm} \left[ \hspace{0.03cm} x\in \lbrace x_1,...,x_n \rbrace \hspace{0.03cm} \right]$$ $\\[0.5cm]$


### Propiedades 



- $E[\mathcal{X}]\hspace{0.08cm} = \hspace{0.08cm}\dfrac{1}{n} \sum_{i=1}^{n} x_i \hspace{0.08cm}=\hspace{0.08cm} \overline{X}$ $\\[0.8cm]$
 
- $Var(\mathcal{X})\hspace{0.08cm} =\hspace{0.08cm} \dfrac{1}{n} \sum_{i=1}^{n} (x_i - E[\mathcal{X}])^2 \hspace{0.08cm}=\hspace{0.08cm} \sigma(X)^2$ $\\[0.8cm]$
 
- Sea $\hspace{0.1cm}(x_{(1)},...,x_{(n)})^t\hspace{0.1cm}$ el vector $\hspace{0.1cm}X=(x_1,...,x_n)^t\hspace{0.1cm}$ ordenado de menor a mayor:

$$F_\mathcal{X}(x) \hspace{0.08cm}=\hspace{0.08cm} \left\lbrace\begin{array}{c} 1 \hspace{0.3cm},\hspace{0.3cm} \text{si} \hspace{0.2cm} x \hspace{0.08cm}> \hspace{0.08cm} x_{(n)} \\
0 \hspace{0.3cm},\hspace{0.3cm}  \text{si} \hspace{0.2cm} x \hspace{0.08cm}<\hspace{0.08cm} x_{(1)} \\ \dfrac{i}{n} \hspace{0.3cm},\hspace{0.3cm} \text{si} \hspace{0.2cm} x=x_{(i)} \end{array}\right.$$
 
 <br>

## Distribución de Bernoulli

$$\mathcal{X} \sim Bernoulli(p) \hspace{0.3cm} \Leftrightarrow\hspace{0.3cm} P(\mathcal{X}=x) \hspace{0.08cm}=\hspace{0.08cm} p^x \cdot (1-p)^x \cdot \mathbb{I}\hspace{0.05cm} \left[ \hspace{0.05cm}  x \in \lbrace 0,1 \rbrace \hspace{0.05cm}  \right]$$ $\\[0.5cm]$


**Observaciones:**

- Las v.a. $\hspace{0.08cm}Bernoulli(p)\hspace{0.08cm}$ se usan para modelar experimentos aleatorios con dos únicos resultados contrarios (exito-fracaso)
 tales que la probabilidad del exito es $\hspace{0.08cm}p\hspace{0.08cm}$ y la del fracoso $\hspace{0.08cm}1-p\hspace{0.08cm}$.  
 
     A este tipo de experimentos aleatorios se les llama experimentos tipo Bernoulli. $\\[0.6cm]$
 
- Si $\hspace{0.08cm}\mathcal{X} \sim Bernoulli(p)\hspace{0.08cm}$ , entonces:

    $\mathcal{X}\hspace{0.08cm}$ puede interpretarse como el nº de exitos obtenidos tras realizar una vez un experimento tipo Bernoulli (notese que este nº solo puede ser 0 o 1),  con probabilidad de exito $\hspace{0.08cm}p\hspace{0.08cm}$. $\\[0.5cm]$




### Propiedades

- $P(\mathcal{X}=1)\hspace{0.08cm}=\hspace{0.08cm}p$ $\\[0.8cm]$

- $P(\mathcal{X}=0)\hspace{0.08cm}=\hspace{0.08cm}1-p$ $\\[0.8cm]$

- $E[\mathcal{X}]\hspace{0.08cm}=\hspace{0.08cm}p$ $\\[0.8cm]$

- $Var(\mathcal{X})\hspace{0.08cm}=\hspace{0.08cm} p\cdot (1-p)$ $\\[0.8cm]$

- $F_\mathcal{X}(x) \hspace{0.08cm}=\hspace{0.08cm} \left\lbrace\begin{array}{l} 1 \hspace{0.3cm},\hspace{0.3cm} \text{si} \hspace{0.2cm} x\geq 1 \\ 0 \hspace{0.3cm},\hspace{0.3cm} \text{si} \hspace{0.2cm} x < 0 \\ 1-p \hspace{0.3cm},\hspace{0.3cm} \text{si} \hspace{0.2cm} x\in [0 , 1) \end{array}\right.$ 

<br>


## Distribución Binomial


$$\mathcal{X} \sim Binomial(n,p) \hspace{0.3cm} \Leftrightarrow \hspace{0.3cm} P(\mathcal{X}=x) \hspace{0.08cm}=\hspace{0.08cm}\binom{n}{x} \cdot p^x (1-p)^x \cdot \mathbb{I}\hspace{0.08cm}\bigl[ x\in \lbrace 0,1,..,n \rbrace \bigr] \\$$ 


**Observación:**


- Si $\hspace{0.08cm}\mathcal{X} \sim Binomial(p)\hspace{0.08cm}$ , entonces:

    $\mathcal{X}$ puede interpretarse como el nº de exitos obtenidos tras realizar $n$ veces un experimento tipo Bernoulli (notese que este nº solo puede ser 0,1,...,n),  con probabilidad de exito $p$ $\\[0.7cm]$


### Propiedades 

- Si $\hspace{0.08cm}\mathcal{X}_1,...,\mathcal{X}_n\hspace{0.08cm}$ son v.a. independientes tales que $\hspace{0.08cm}\mathcal{X}_i \sim Bernoulli(p)\hspace{0.08cm} , \hspace{0.08cm} i =1,...,n$ , entonces:

$$\mathcal{X}_1 + ... + \mathcal{X}_n \sim Binomial (n, p)$$  



- $E[\mathcal{X}]\hspace{0.08cm}=\hspace{0.08cm}n\cdot p$ $\\[0.8cm]$


- $Var(\mathcal{X}) \hspace{0.08cm}=\hspace{0.08cm} n \cdot p \cdot (1-p)$ $\\[0.8cm]$


- Para $\hspace{0.08cm}x\geq n\hspace{0.08cm}$ :

$$F_\mathcal{X}(x) \hspace{0.15cm}=\sum_{z\in \lbrace 0,1,...,x\rbrace} \binom{n}{z} \cdot p^z \cdot (1-p)^{n-z}$$


<br>

## Distribución Geométrica (de fracasos)


$$\mathcal{X} \sim GeoFrac(p) \hspace{0.3cm}\Leftrightarrow\hspace{0.3cm} P(\mathcal{X}=x) \hspace{0.08cm}=\hspace{0.08cm} (1-p)^x \cdot p \cdot \mathbb{I}\hspace{0.08cm}\bigl[ x\in \lbrace 0,1,..,n \rbrace \bigr] \\$$ 


**Observación:**

- Si $\hspace{0.08cm}\mathcal{X} \sim GeoFrac(p)\hspace{0.08cm}$ , entonces:

    $\mathcal{X}\hspace{0.08cm}$ puede interpretarse como el nº de  fracasos obtenidos hasta el primer exito tras realizar multiples veces un experimento tipo Bernoulli (notese que este nº solo puede ser 0,1,2,...), con probabilidad de exito $\hspace{0.08cm}p\hspace{0.08cm}$. $\\[0.7cm]$


### Propiedades

- $E[ \mathcal{X} ] \hspace{0.08cm} = \hspace{0.08cm} \dfrac{1-p}{p}$ $\\[0.8cm]$

- $Var(\mathcal{X})\hspace{0.08cm} =\hspace{0.08cm} \dfrac{1-p}{p^2}$


<br>

## Distribucion Geométrica (de intentos)


$$\mathcal{X} \sim GeoInt(p) \hspace{0.3cm}\Leftrightarrow\hspace{0.3cm} P(\mathcal{X}=x) \hspace{0.08cm}=\hspace{0.08cm} (1-p)^{x-1}\cdot p \cdot \mathbb{I}\hspace{0.08cm}\bigl[ x\in \lbrace 0,1,..,n \rbrace \bigr] \\$$


**Observación:**

$\mathcal{X}\hspace{0.08cm}$ se puede interpretar como el nº de intentos hasta la obtencion del primer exito tras realizar múltiples veces un experimento tipo Bernoulli (notese que este nº solo puede ser 0,1,2,...), con probabilidad de exito $\hspace{0.08cm}p\hspace{0.08cm}$. $\\[0.6cm]$



### Propiedades

- $E[\mathcal{X}]\hspace{0.08cm}=\hspace{0.08cm} \dfrac{1}{p}$ $\\[0.8cm]$

- $Var(\mathcal{X})\hspace{0.08cm}=\hspace{0.08cm} \dfrac{1-p}{p^2}$


<br>

## Distribución de Poisson


$$\mathcal{X}\sim Poisson(\lambda) \hspace{0.3cm}\Leftrightarrow\hspace{0.3cm} P(\mathcal{X}=x) \hspace{0.08cm}=\hspace{0.08cm} e^{-\lambda} \cdot \dfrac{\lambda^x}{x!} \cdot \mathbb{I}\hspace{0.08cm}\bigl[ x\in \lbrace 0,1,..,n \rbrace \bigr]$$


Donde:  $\hspace{0.08cm}\lambda > 0 \\$


### Propiedad

- $E[\mathcal{X}] \hspace{0.08cm}=\hspace{0.08cm} \lambda$ $\\[0.8cm]$

- $Var[\mathcal{X}] \hspace{0.08cm}=\hspace{0.08cm} \lambda$ $\\[0.8cm]$

- Si $\hspace{0.08cm}\mathcal{X}_i \sim Poisson(\lambda_i)\hspace{0.08cm}$  y son independientes , para $\hspace{0.08cm}i =1,...,n\hspace{0.08cm}$ , entonces:

$$\mathcal{X}_1 + ... + \mathcal{X}_n \hspace{0.08cm}\sim\hspace{0.08cm} Poisson(\lambda_1 + ... + \lambda_n)$$

<br>

## Distribución Hipergeommetrica


$$\mathcal{X} \sim HiperGeo(N, k, n) \hspace{0.3cm}\Leftrightarrow\hspace{0.3cm} P(\mathcal{X}=x) \hspace{0.08cm}=\hspace{0.08cm} \dfrac{\hspace{0.08cm}\binom{k}{n} \cdot \binom{N-k}{n-x}\hspace{0.08cm}}{\binom{N}{n}} \cdot \mathbb{I}\hspace{0.08cm}\bigl[ x\in \lbrace 0,1,..,n \rbrace \bigr]\\$$


**Observación:**

- Las v.a. hipergeométrica se usan para modelar experimentos aleatorios que consisten en extrar sin reemplazamiento una muestra de $\hspace{0.08cm}n\hspace{0.08cm}$ elementos de un conjunto con $\hspace{0.08cm}N\hspace{0.08cm}$ elementos, $\hspace{0.08cm}k\hspace{0.08cm}$ de una clase llamada clase-k y $\hspace{0.08cm}N-k\hspace{0.08cm}$ de otra clase. $\\[0.8cm]$

- Si  $\hspace{0.08cm}\mathcal{X} \sim HiperGeo(N, k, n)\hspace{0.08cm}$ , entonces:

    $\mathcal{X}\hspace{0.08cm}$ puede interpretarse como el nº de elementos de la clase-k extraidos del conjunto tras haber extraido una muestra de $\hspace{0.08cm}n\hspace{0.08cm}$ elementos. $\\[0.8cm]$


### Propiedades

- $E[\mathcal{X}] \hspace{0.08cm}=\hspace{0.08cm} n \dfrac{k}{N}$ $\\[0.8cm]$

- $Var(\mathcal{X}) \hspace{0.08cm}=\hspace{0.08cm} n\cdot \dfrac{k}{N} \cdot \dfrac{N-k}{N} \cdot \dfrac{N-n}{N-1}$


<br>

# Distribuciones de probabilidad continuas



## Distribución Uniforme Continua

$$\mathcal{X} \sim U(a,b) \hspace{0.3cm}\Leftrightarrow \hspace{0.3cm} f_\mathcal{X}(x) \hspace{0.08cm} =\hspace{0.08cm} \dfrac{1}{b-a} \cdot \mathbb{I}\hspace{0.08cm}\bigl[ x\in (a,b) \bigr] \\$$



### Propiedades

- $E[\mathcal{X}] \hspace{0.08cm}=\hspace{0.08cm} \dfrac{1}{2} \cdot (a + b)$ $\\[0.8cm]$

- $Var(\mathcal{X}) \hspace{0.08cm}=\hspace{0.08cm} \dfrac{1}{12} \cdot (b-a)^2$ $\\[0.8cm]$

- $F_\mathcal{X}(x) \hspace{0.08cm}=\hspace{0.08cm} P(\mathcal{X} \geq x) \hspace{0.08cm}=\hspace{0.08cm} \int_{-\infty}^{x} \hspace{0.08cm} f_X(z) \cdot dz \hspace{0.08cm}=\hspace{0.08cm} \left\lbrace\begin{array}{l} 1 \hspace{0.3cm} , \hspace{0.3cm} \text{si} \hspace{0.2cm} x\geq b \\ 0  \hspace{0.3cm} , \hspace{0.3cm} \text{si} \hspace{0.2cm} x \leq a \\ \dfrac{x-a}{b-a}  \hspace{0.3cm} , \hspace{0.3cm} \text{si} \hspace{0.2cm} x\in (a,b) \end{array}\right.$


<br>

## Distribución Exponencial


$$\mathcal{X} \sim Exponencial(\lambda) \hspace{0.3cm}\Leftrightarrow\hspace{0.3cm}  f_\mathcal{X}(x) \hspace{0.08cm}=\hspace{0.08cm} \lambda \cdot e^{-\lambda \cdot x} \cdot \mathbb{I}\bigl[ x>0 \bigr]$$

Donde: $\hspace{0.08cm}\lambda > 0\hspace{0.08cm}\\$


### Propiedades

- $E[\mathcal{X}] \hspace{0.08cm}=\hspace{0.08cm} \dfrac{1}{\lambda}$ $\\[0.8cm]$

- $Var(\mathcal{X}) \hspace{0.08cm}=\hspace{0.08cm} \dfrac{1}{\lambda^2}$ $\\[0.8cm]$

- $F_\mathcal{X}(x) \hspace{0.08cm}=\hspace{0.08cm}  P(\mathcal{X} \geq x) \hspace{0.08cm}=\hspace{0.08cm} \int_{-\infty}^{x} f_\mathcal{X}(z) \cdot dz \hspace{0.08cm}=\hspace{0.08cm} \left\lbrace\begin{array}{l} 0  \hspace{0.3cm} , \hspace{0.3cm} \text{si} \hspace{0.2cm} x \leq 0 \\ 1- e^{-\lambda \cdot x}  \hspace{0.3cm} , \hspace{0.3cm} \text{si} \hspace{0.21cm} x>0 \end{array}\right.$

<br>

## Funcion Gamma

$\Gamma\hspace{0.08cm}$ es la función Gamma $\hspace{0.3cm}\Leftrightarrow\hspace{0.3cm} \Gamma(\alpha) \hspace{0.08cm}=\hspace{0.08cm} \int_{0}^{\infty} x^{\alpha - 1} \cdot e^{-x} \cdot dx$

Donde: $\hspace{0.08cm}\alpha >0\hspace{0.08cm}\\$

### Propiedades

- $\Gamma(1) \hspace{0.08cm}=\hspace{0.08cm} \Gamma(2) \hspace{0.08cm}=\hspace{0.08cm} 1\hspace{0.08cm}$. $\\[0.7cm]$

- $\Gamma(\alpha + 1) \hspace{0.08cm}=\hspace{0.08cm} \alpha \cdot \Gamma(\alpha)\hspace{0.08cm}$. $\\[0.7cm]$

- $\Gamma(\alpha + 1) \hspace{0.08cm}=\hspace{0.08cm} \alpha !\hspace{0.08cm}$ , si $\hspace{0.08cm}\alpha \in \mathbb{N}\hspace{0.08cm}$. $\\[0.7cm]$

- $\Gamma(\alpha) \hspace{0.08cm}=\hspace{0.08cm} (\alpha -1)!\hspace{0.08cm}$ , si $\hspace{0.08cm}\alpha \in \mathbb{N}\hspace{0.08cm}$. $\\[0.7cm]$

- $\Gamma(1/2) \hspace{0.08cm}=\hspace{0.08cm} \sqrt{\pi}\hspace{0.08cm}$.


<br>

## Distribucion Gamma

$$\mathcal{X}\sim Gamma(\alpha , \lambda ) \hspace{0.3cm}\Leftrightarrow\hspace{0.3cm} f_\mathcal{X}(x) \hspace{0.08cm}=\hspace{0.08cm} \dfrac{\lambda^\alpha}{\Gamma(\alpha )} \cdot x^{\alpha -1} \cdot e^{-\lambda \cdot x} \cdot \mathbb{I}\bigl[ x>0 \bigr]$$

Donde: $\hspace{0.08cm}\alpha, \lambda > 0 \\$


### Propiedades

- Si $\hspace{0.08cm}\alpha \in \mathbb{N}\hspace{0.08cm}$ , entonces:


    $$f_\mathcal{X}(x) \hspace{0.08cm}=\hspace{0.08cm} \dfrac{\lambda^\alpha}{(\alpha -1)!} \cdot x^{\alpha -1} \cdot e^{-\lambda \cdot x} \cdot \mathbb{I}( x>0 )\\$$ 

- Si $\hspace{0.08cm}\alpha \hspace{0.08cm}=\hspace{0.08cm} 1\hspace{0.08cm}$ , entonces:

    $$f_\mathcal{X}(x) \hspace{0.08cm}=\hspace{0.08cm} \lambda \cdot e^{-\lambda \cdot x} \cdot \mathbb{I}(  x>0 )$$

    Por tanto:

    $$Gamma(\alpha = 1 , \lambda) \hspace{0.08cm}=\hspace{0.08cm} Exponencial(\lambda) \\$$



- $E[\mathcal{X}] \hspace{0.08cm}=\hspace{0.08cm} \dfrac{\alpha}{\lambda}$ $\\[0.7cm]$

- $Var(\mathcal{X}) \hspace{0.08cm}= \hspace{0.08cm} \dfrac{\alpha}{\lambda^2}$ $\\[0.7cm]$

 
- Si $\hspace{0.08cm}\mathcal{X}_1,...,\mathcal{X}_n \sim Exponencial(\lambda)\hspace{0.08cm}$ y son independientes, entonces:

    $$\mathcal{X}_1+...+\mathcal{X}_n \sim Gamma(n , \lambda)\\$$

- Si $\hspace{0.08cm}\mathcal{X}\sim Gamma(\alpha , \lambda)\hspace{0.08cm}$ y $\hspace{0.08cm}c>0\hspace{0.08cm}$ , entonces:

    $$c\cdot \mathcal{X}\sim Gamma(\alpha , \lambda / c)\\$$

- Si $\hspace{0.08cm}\mathcal{X}_1 , ..., \mathcal{X}_n\hspace{0.08cm}$ son independientes y $\hspace{0.08cm}\mathcal{X}_i\sim Gamma(\alpha_i , \lambda)\hspace{0.08cm}$, entonces:

    $$\mathcal{X}_1 +...+ \mathcal{X}_n \sim Gamma(\alpha_1 +...+ \alpha_n , \lambda)$$


<br>


## Distribucion Normal


$$\mathcal{X} \sim N(\mu, \sigma^2) \Leftrightarrow f_\mathcal{X}(x) = \dfrac{1}{\sigma \sqrt{2\pi}} \cdot exp \left(  \dfrac{-(x- \mu)^2}{2\cdot \sigma^2}  \right) \hspace{0.3cm} , \hspace{0.3cm} x\in \mathbb{R}$$


Donde: $\hspace{0.12cm}\mu \in \mathbb{R}\hspace{0.12cm}$ y $\hspace{0.12cm}\sigma^2 > 0 \\$



### Propiedades

- $E[\mathcal{X}]\hspace{0.08cm}=\hspace{0.08cm}\mu$ $\\[0.7cm]$

- $Var(\mathcal{X})\hspace{0.08cm}=\hspace{0.08cm}\sigma^2$ $\\[0.7cm]$

- $\mathcal{X}\cdot a \sim N(\mu \cdot a , a^2 \cdot \sigma^2)$ $\\[0.7cm]$

- $\mathcal{X}\cdot b + a \sim N( b\cdot \mu + a , b^2 \cdot \sigma^2)$ $\\[0.7cm]$

- Si $\hspace{0.08cm}\mathcal{X}_i \sim N(\mu_i , \sigma_i^2)\hspace{0.08cm}$ , para $\hspace{0.08cm}i =1,...,n\hspace{0.08cm}$ , entonces:

    $$\mathcal{X}_1 + ...+ \mathcal{X}_n \sim N(\mu_1 +...+ \mu_n \hspace{0.1cm},\hspace{0.1cm} \sigma_1^2 + ...+ \sigma_n^2)\\$$

- Si $\hspace{0.08cm}\mathcal{X}_i \sim N(\mu_i , \sigma_i^2)\hspace{0.08cm}$ , para $\hspace{0.08cm}i =1,...,n\hspace{0.08cm}$ , entonces:

    $$a_1\cdot \mathcal{X}_1 + ...+ a_n \cdot \mathcal{X}_n \sim N(a_1 \cdot \mu_1 +...+ a_n \cdot \mu_n \hspace{0.1cm},\hspace{0.1cm} a_1^2 \cdot \sigma_1^2 + ...+ a_n^2 \cdot \sigma_n^2)$$


<br>

## Funcion Beta

$$B(a,b) \hspace{0.08cm}=\hspace{0.08cm} \int_0^1 x^{a-1} \cdot (1-x)^{b-1} \cdot dx$$

Donde: $\hspace{0.08cm}a, b >0 \\$


### Propiedades

- $B(a,b) \hspace{0.08cm}=\hspace{0.08cm} B(b,a)$ $\\[0.7cm]$

- $B(a,1) \hspace{0.08cm}=\hspace{0.08cm} 1/a$ $\\[0.7cm]$

- $B(a+1, b) \hspace{0.08cm}=\hspace{0.08cm} \dfrac{a}{a+b} \cdot B(a,b)$ $\\[0.9cm]$

- $B(a,b) \hspace{0.08cm}=\hspace{0.08cm} \dfrac{\Gamma(a) \cdot \Gamma(b)}{\Gamma(a+b)}$ $\\[0.7cm]$



## Distribucion Beta

$$\mathcal{X}\sim Beta(a,b) \hspace{0.3cm}\Leftrightarrow\hspace{0.3cm} f_\mathcal{X}(x) \hspace{0.08cm}=\hspace{0.08cm} \dfrac{1}{B(a,b)} \cdot x^{a-1} \cdot (1-x)^{b-1} \cdot \mathbb{I}\left[ \hspace{0.05cm} x \in (0,1) \hspace{0.05cm} \right]$$


Donde: $\hspace{0.08cm}a, b >0 \\$


### Propiedades

- $E[\mathcal{X}]\hspace{0.08cm}=\hspace{0.08cm}\dfrac{a}{a+b}$ $\\[0.7cm]$

- $Var(\mathcal{X})\hspace{0.08cm} =\hspace{0.08cm} \dfrac{a\cdot b}{(a + b +1)(a+b)^2}$ $\\[1.2cm]$

- Si $\hspace{0.08cm}\mathcal{X}\sim Gamma(a, \lambda)\hspace{0.08cm}$ y $\hspace{0.08cm}\mathcal{Y}\sim Gamma(b,\lambda)\hspace{0.08cm}$ , entonces:

    $$\dfrac{\mathcal{X}}{\mathcal{X}+\mathcal{Y}} \sim Beta(a,b)$$


<br>


## Distribucion Weibull


$$\mathcal{X}\sim Weibull(\alpha , \lambda) \hspace{0.3cm}\Leftrightarrow\hspace{0.3cm} f_\mathcal{X}(x) \hspace{0.08cm}=\hspace{0.08cm} \lambda\cdot \alpha (\lambda \cdot x)^{\alpha - 1} \cdot e^{-(\lambda \cdot x)^\alpha} \cdot \mathbb{I}\bigl[ x > 0 \bigr]$$

Donde: $\hspace{0.08cm}\alpha \hspace{0.08cm},\hspace{0.08cm} \lambda\hspace{0.08cm} > \hspace{0.08cm}0 \\$


### Propiedades

- $E[\mathcal{X}] \hspace{0.08cm}=\hspace{0.08cm} \dfrac{1}{\lambda} \Gamma(1 + \dfrac{1}{\alpha})$ $\\[0.9cm]$

- $Var(\mathcal{X}) \hspace{0.08cm}=\hspace{0.08cm} \dfrac{1}{\lambda^2} \left( \Gamma(1 + \dfrac{2}{\alpha}) - \Gamma(1+ \dfrac{1}{\alpha}) \right)$ $\\[1.2cm]$

- $F_\mathcal{X}(x) \hspace{0.08cm}=\hspace{0.08cm} \left(\hspace{0.08cm} 1 - e^{-(\lambda \cdot x)^\alpha} \hspace{0.08cm} \right) \cdot \mathbb{I}\left[ x>0 \right]$


<br>

## Distribucion Chi-cuadrado

$$\mathcal{X} \sim \chi_n ^2 \hspace{0.3cm}\Leftrightarrow\hspace{0.3cm} f_\mathcal{X}(x) \hspace{0.08cm}=\hspace{0.08cm} \dfrac{1}{\Gamma(n/2)} \cdot \dfrac{1}{2}^{n/2} \cdot x ^{n/2 -1} \cdot e^{-x/2} \hspace{0.3cm} , \hspace{0.3cm} x\in \mathbb{R} \\$$


### Propiedades

- $E[\chi_n ^2] \hspace{0.08cm}=\hspace{0.08cm} n$ $\\[0.7cm]$

- $Var(\chi_n ^2) \hspace{0.08cm}=\hspace{0.08cm} 2n$ $\\[0.7cm]$

- $\chi_n ^2 + \chi_m ^2 \hspace{0.08cm}=\hspace{0.08cm} \chi_{n+m} ^2$ $\\[0.7cm]$

- $\chi_n ^2 - \chi_m ^2 \hspace{0.08cm}=\hspace{0.08cm} \chi_{n-m} ^2$ $\\[0.7cm]$

- $\chi_n ^2 \hspace{0.08cm}=\hspace{0.08cm} Gamma( \alpha= n/2 , \lambda=1/2)$ $\\[0.7cm]$

- Si $\hspace{0.08cm}\mathcal{X}_1 ,..., \mathcal{X}_n \sim N(0,1)\hspace{0.08cm}$ y son independientes , entonces:

    $$\mathcal{X}_1^2 + ... + \mathcal{X}_n^2 \sim \chi_n^2$$

<br>

## Distribucion t-student

$$\mathcal{X}\sim t_n \hspace{0.3cm}\Leftrightarrow\hspace{0.3cm} f_\mathcal{X}(x) \hspace{0.08cm}=\hspace{0.08cm} \dfrac{\Gamma\left(\dfrac{n+1}{2}\right)}{\sqrt{n\cdot \pi} \cdot \Gamma(n/2)} \cdot \left(1 + \dfrac{x^2}{n}\right)^{-1/2 \cdot (n+1)}  \hspace{0.33cm} , \hspace{0.33cm} x\in \mathbb{R} \\$$


### Propiedades 

- $E[\mathcal{X}] \hspace{0.08cm}=\hspace{0.08cm} 0\hspace{0.08cm}$. $\\[0.7cm]$

- $Var[\mathcal{X}] \hspace{0.08cm}=\hspace{0.08cm} \dfrac{n}{n-2}\hspace{0.08cm}$ , si $\hspace{0.08cm}n>2\hspace{0.08cm}$. $\\[0.9cm]$

- Si $\hspace{0.08cm}Z \sim N(0,1)\hspace{0.12cm}$ y $\hspace{0.12cm}X\sim \chi_n^2\hspace{0.12cm}$ y son **independientes** , entonces:

    $$\dfrac{Z}{\sqrt{X/n}} \sim t_n$$


<br>


## Distribucion F-Fisher

$$\mathcal{X}\sim F(a,b) \hspace{0.3cm}\Leftrightarrow\hspace{0.3cm} f_\mathcal{X}(x) \hspace{0.08cm}=\hspace{0.08cm} \dfrac{\Gamma\left(\dfrac{a+b}{2}\right)}{\Gamma(a/2)\cdot \Gamma(b/2)} \cdot (a/b)^{a/2} \cdot x^{a/2-1} \cdot (1 + (a/b)\cdot x)^{-(a+b)/2} \cdot \mathbb{I}\left[ x>0 \right] \\$$


### Propiedades

- $E[\mathcal{X}] \hspace{0.08cm}=\hspace{0.08cm} \dfrac{b}{b-2}\hspace{0.08cm}$. $\\[0.8cm]$

- $Var(\mathcal{X}) \hspace{0.08cm}=\hspace{0.08cm} \dfrac{2b^2 \cdot (a + b - 2)}{a \cdot (b-2)^2 \cdot (b-4)}\hspace{0.128cm}$ , si $\hspace{0.12cm}b>4\hspace{0.08cm}$. $\\[1.2cm]$

- Si $\hspace{0.08cm}\mathcal{X} \sim \chi^2_a\hspace{0.15cm}$ y $\hspace{0.15cm}\mathcal{Y} \sim \chi^2_b\hspace{0.12cm}$ , entonces:

    $$\dfrac{\hspace{0.08cm}\mathcal{X}/a\hspace{0.08cm}}{\mathcal{Y}/b} \sim F(a,b)$$


<br>



# Probabilidad conjunta de variables aleatorias discretas

Sean $\hspace{0.08cm}\mathcal{X}\hspace{0.12cm}$ y $\hspace{0.12cm}\mathcal{Y}\hspace{0.12cm}$ variables aleatorias discretas. $\\[0.3cm]$

$$P(\mathcal{X}=x , \mathcal{Y}=y) \hspace{0.08cm}=\hspace{0.08cm} P(\mathcal{X}= x \cap \mathcal{Y}=y) \\$$




## Propiedades


- $\sum_{x\in \mathbb{R}}\sum_{y\in \mathbb{R}} P(\mathcal{X}=x , \mathcal{Y}=y) \hspace{0.08cm}=\hspace{0.08cm} 1$ $\\[0.8cm]$

- Si $\hspace{0.08cm}x\notin Im(\mathcal{X})\hspace{0.08cm}$ o $\hspace{0.08cm}y \notin Im(\mathcal{Y})\hspace{0.08cm}$ , entonces: $\hspace{0.12cm}P(\mathcal{X}=x , \mathcal{Y}=y) \hspace{0.08cm}=\hspace{0.08cm} 0$$\\[0.8cm]$

- $P(\mathcal{X}\in A , \mathcal{Y}\in B) \hspace{0.08cm}=\hspace{0.08cm} \sum_{x\in A} \sum_{y\in B} P(\mathcal{X}=x , \mathcal{Y}=y)$ $\\[0.8cm]$

- $P(\mathcal{X}\in A , \mathcal{Y}=y) \hspace{0.08cm}=\hspace{0.08cm} \sum_{x\in A} P(\mathcal{X}=x , \mathcal{Y}=y)$ $\\[0.8cm]$

- $P(\mathcal{X}=x) \hspace{0.08cm}=\hspace{0.08cm} \sum_{y\in \mathbb{R}} P(\mathcal{X}=x , \mathcal{Y}=y)$ $\\[0.8cm]$

- $P(\mathcal{Y}=y) \hspace{0.08cm}=\hspace{0.08cm} \sum_{x\in \mathbb{R}} P(\mathcal{X}=x , \mathcal{Y}=y)$ 


<br>

# Densidad conjunta de variables aleatorias continuas

$f_{\mathcal{X},\mathcal{Y}}\hspace{0.08cm}$ es la función de densidad conjunta de las v.a. $\hspace{0.08cm}\mathcal{X}\hspace{0.08cm}$ y $\hspace{0.08cm}\mathcal{Y}\hspace{0.08cm}$ , si y solo si:


- $f_{\mathcal{X},\mathcal{Y}} \hspace{0.12cm} :\hspace{0.12cm} \mathbb{R}^2 \hspace{0.08cm}\rightarrow\hspace{0.08cm} (0 , \infty)$ $\\[0.8cm]$

- $P( \mathcal{X} \in A , \mathcal{Y} \in B) \hspace{0.08cm}=\hspace{0.08cm} \int_{x\in A} \int_{y\in B} \hspace{0.08cm} f_{\mathcal{X},\mathcal{Y}}(x,y) \cdot dy \cdot dx$ $\\[0.8cm]$


- $\int_{x\in \mathbb{R}} \int_{y\in \mathbb{R}} \hspace{0.08cm}  f_{\mathcal{X},\mathcal{Y}}(x,y) \cdot dy \cdot dx \hspace{0.08cm}=\hspace{0.08cm} 1$ $\\[1cm]$



## Propiedades

- $P(\mathcal{X}\in A \hspace{0.08cm},\hspace{0.08cm} \mathcal{Y}=y) \hspace{0.08cm}=\hspace{0.08cm} \int_{x\in A} \hspace{0.08cm} f_{\mathcal{X},\mathcal{Y}}(x , y)\cdot dx$ $\\[0.8cm]$

- $P(\mathcal{X}=x \hspace{0.08cm},\hspace{0.08cm} \mathcal{Y}\in B) \hspace{0.08cm}=\hspace{0.08cm} \int_{y\in B} \hspace{0.08cm} f_{\mathcal{X},\mathcal{Y}}(x , y) \cdot dy$ $\\[0.8cm]$

- $f_X(x) \hspace{0.08cm}=\hspace{0.08cm} \int_{y\in \mathbb{R}} \hspace{0.08cm} f_{\mathcal{X},\mathcal{Y}}(x , y) \cdot dy$ $\\[0.8cm]$

- $f_Y(y) \hspace{0.08cm}=\hspace{0.08cm} \int_{x\in \mathbb{R}} \hspace{0.08cm} f_{\mathcal{X},\mathcal{Y}}(x , y) \cdot dx$


<br>


# Probabilidad condicionada de variables aleatorias discretas

$$P(\mathcal{X}=x \hspace{0.08cm}|\hspace{0.08cm} \mathcal{Y}=y) \hspace{0.08cm}=\hspace{0.08cm} \dfrac{\hspace{0.08cm}P(\mathcal{X}=x \hspace{0.08cm},\hspace{0.08cm} \mathcal{Y}=y)\hspace{0.08cm}}{P(\mathcal{Y}=y)} \\$$


## Propiedades

- $P(\mathcal{X}\in A \hspace{0.08cm}|\hspace{0.08cm} \mathcal{Y}=y) \hspace{0.08cm} = \hspace{0.08cm} \sum_{x\in A} P(\mathcal{X}=x \hspace{0.08cm}|\hspace{0.08cm} \mathcal{Y}=y)$


<br>

# Densidad condicionada de variables aleatorias continuas

$$f_{\mathcal{X}|\mathcal{Y}}(x,y) = \dfrac{\hspace{0.08cm}f_{\mathcal{X},\mathcal{Y}\hspace{0.08cm}}(x,y)}{f_Y(y)} \\$$


## Propiedades

- Si $\hspace{0.08cm}\mathcal{Y}\hspace{0.08cm}$ es una v.a. continua , entonces: $\hspace{0.12cm}P(\mathcal{Y}=y) \hspace{0.08cm}=\hspace{0.08cm} 0\hspace{0.08cm}$ , para todo $\hspace{0.08cm}y\in \mathbb{R}$

    Por lo que $\hspace{0.08cm}P(\mathcal{X}\in A \hspace{0.08cm}|\hspace{0.08cm} \mathcal{Y}=y)\hspace{0.1cm}$ no está definido, ya que:

$$P(\mathcal{X}\in A \hspace{0.08cm}|\hspace{0.08cm} \mathcal{Y}=y) \hspace{0.08cm}=\hspace{0.08cm} \dfrac{\hspace{0.08cm}P(\mathcal{X}=x , \mathcal{Y}=y)\hspace{0.08cm}}{P(\mathcal{Y}=y)} \hspace{0.08cm}=\hspace{0.08cm} \dfrac{P(\mathcal{X}=x , \mathcal{Y}=y)}{ 0}\\$$


- Teniendo en consideración el problema anterior, se esquiva del siguiente modo:

    Sea $\delta \rightarrow 0^+$

    $$P(\mathcal{X}\in A \hspace{0.08cm}|\hspace{0.08cm} \mathcal{Y} \in [y , y+ \delta]) = \dfrac{\hspace{0.08cm}P(\mathcal{X}\in A \hspace{0.08cm} , \hspace{0.08cm} \mathcal{Y}\in [y , y+ \delta])\hspace{0.08cm}}{P(\mathcal{Y}\in [y , y+ \delta])}$$


    Donde ahora $\hspace{0.08cm}P(\mathcal{Y}\in [y , y+ \delta]) \hspace{0.08cm}>\hspace{0.08cm} 0\hspace{0.08cm}$ . $\\[1cm]$


- $P(\mathcal{X}\in A \hspace{0.08cm} | \hspace{0.08cm} \mathcal{Y} \in [y , y+ \delta]) \hspace{0.08cm}=\hspace{0.08cm} \int_{x\in A} \int_{y \in [y , y+ \delta]} f_{\mathcal{X}|\mathcal{Y}}(x,y) \hspace{0.08cm}=\hspace{0.08cm} \int_{x\in A} \int_{y \in [y , y+ \delta]} \dfrac{f_{\mathcal{X},\mathcal{Y}}(x,y)}{f_Y(y)} \hspace{0.08cm} \approx  \hspace{0.08cm} \int_{x\in A}   f_{\mathcal{X}|\mathcal{Y}}(x,y) \hspace{0.08cm}=\hspace{0.08cm} \int_{x\in A}   \dfrac{f_{\mathcal{X},\mathcal{Y}}(x,y)}{f_Y(y)} \hspace{0.08cm}=\hspace{0.08cm} \dfrac{1}{f_Y(y)} \cdot \int_{x\in A}   f_{\mathcal{X},\mathcal{Y}}(x,y)$


    En resumen:


    $$P(\mathcal{X}\in A \hspace{0.08cm}|\hspace{0.08cm} \mathcal{Y} \in [y , y+ \delta]) \hspace{0.08cm}\approx\hspace{0.08cm} \int_{x\in A}   f_{\mathcal{X}|\mathcal{Y}}(x,y)$$


<br>

# Independencia de variables aleatorias discretas

$\mathcal{X}\hspace{0.08cm}$ e $\hspace{0.08cm}\mathcal{Y}\hspace{0.08cm}$ son v.a. independientes  $\hspace{0.08cm}(\mathcal{X} \perp \mathcal{Y})$ $\hspace{0.3cm}\Leftrightarrow\hspace{0.3cm}$ $P(\mathcal{X}=x , \mathcal{Y}=y) \hspace{0.08cm}=\hspace{0.08cm} P(\mathcal{X}=x)\cdot P(\mathcal{Y}=y) \hspace{0.3cm},\hspace{0.3cm} \forall x,y \in \mathbb{R}$

<br>


## Teorema de Factorización para v.a. discretas


Sean $\hspace{0.08cm}\mathcal{X}\hspace{0.08cm}$ e $\hspace{0.08cm}\mathcal{Y}\hspace{0.08cm}$ v.a. discretas, 

Si $\hspace{0.08cm}\exists \hspace{0.1cm} h,g \hspace{0.08cm}:\hspace{0.08cm} \mathbb{R} \rightarrow \mathbb{R}\hspace{0.1cm}$  , tal que:

$$P(\mathcal{X}=x \hspace{0.08cm},\hspace{0.08cm} \mathcal{Y}=y) \hspace{0.08cm}=\hspace{0.08cm} g(x)\cdot h(y) \hspace{0.3cm},\hspace{0.3cm} \forall x,y \in \mathbb{R}$$

entonces: $\hspace{0.12cm}\mathcal{X}\hspace{0.08cm}$ e $\hspace{0.08cm}\mathcal{Y}\hspace{0.08cm}$ son independientes  $\hspace{0.08cm}(\mathcal{X} \perp \mathcal{Y})\hspace{0.08cm}$ .



<br>




# Independencia de variables aleatorias continuas


$\mathcal{X}\hspace{0.08cm}$ e $\hspace{0.08cm}\mathcal{Y}\hspace{0.08cm}$ son v.a. independientes  $\hspace{0.08cm}(\mathcal{X} \perp \mathcal{Y})\hspace{0.1cm}$ , si y solo si:

$$\hspace{0.3cm}\Leftrightarrow\hspace{0.3cm}P(\mathcal{X}=x \hspace{0.08cm},\hspace{0.08cm} \mathcal{Y}=y) \hspace{0.08cm}=\hspace{0.08cm} P(\mathcal{X}=x)\cdot P(\mathcal{Y}=y) \hspace{0.3cm} , \hspace{0.3cm} \forall\hspace{0.08cm} x,y \in \mathbb{R}$$

$$\hspace{0.3cm}\Leftrightarrow\hspace{0.3cm}P(\mathcal{X}\in A \hspace{0.08cm},\hspace{0.08cm} \mathcal{Y}\in B) \hspace{0.08cm}=\hspace{0.08cm} P(\mathcal{X}\in A)\cdot P(\mathcal{Y}\in B) \hspace{0.3cm} ,\hspace{0.3cm} \forall \hspace{0.08cm} A,B \subset \mathbb{R} \hspace{0.3cm}\Leftrightarrow\hspace{0.3cm}$$

$$\hspace{0.3cm}\Leftrightarrow\hspace{0.3cm}\forall \hspace{0.08cm} A,B \subset \mathbb{R} \hspace{0.2cm},\hspace{0.2cm} \int_{x\in A} \int_{y \in B} \hspace{0.08cm} f_{\mathcal{X},\mathcal{Y}}(x,y) \cdot dy \cdot dx \hspace{0.08cm}=\hspace{0.08cm} \int_{x\in A} \hspace{0.08cm} f_{\mathcal{X}}(x)  \cdot dx \cdot \int_{y \in B} f_{\mathcal{Y}}(y) \cdot dy$$

<br>

## Teorema de Factorización para v.a. continuas  

Sean $\hspace{0.08cm}\mathcal{X}\hspace{0.08cm}$ e $\hspace{0.08cm}\mathcal{Y}\hspace{0.08cm}$ v.a. continuas,  

$\mathcal{X}\hspace{0.08cm}$ e $\hspace{0.08cm}\mathcal{Y}\hspace{0.08cm}$ son v.a. independientes $\hspace{0.08cm}(\mathcal{X} \perp \mathcal{Y})$ $\hspace{0.3cm}\Leftrightarrow\hspace{0.3cm}$  $f_{\mathcal{X},\mathcal{Y}}(x,y) = f_X(x) \cdot f_\mathcal{Y}(y) \hspace{0.2cm},\hspace{0.2cm} \forall \hspace{0.08cm} x,y \in \mathbb{R}$


### Colorario

Si $\hspace{0.08cm}\exists\hspace{0.08cm} g,h \hspace{0.08cm}:\hspace{0.08cm} \mathbb{R} \rightarrow \mathbb{R}\hspace{0.08cm}$  , tal que:

$f_{\mathcal{X},\mathcal{Y}}(x,y) \hspace{0.08cm}=\hspace{0.08cm} g(x)\cdot h(y) \hspace{0.2cm},\hspace{0.2cm} \forall\hspace{0.08cm} x,y \in \mathbb{R}$

entonces: $\hspace{0.12cm}\mathcal{X}\hspace{0.08cm}$ e $\hspace{0.08cm}\mathcal{Y}\hspace{0.08cm}$ son independientes.


<br>

# Independencia (dos a dos) de múltiples v.a. 



$\mathcal{X}_1,...,\mathcal{X}_n\hspace{0.08cm}$ son independientes (dos a dos) $\hspace{0.3cm}\Leftrightarrow\hspace{0.3cm}$ $\mathcal{X}_i \perp \mathcal{X}_j \hspace{0.2cm},\hspace{0.2cm} \forall i\neq j = 1,...,n$


<br>

# Teorema de Bayes para variables aleatorias 

- Si $\hspace{0.08cm}\mathcal{X}\hspace{0.08cm}$ e $\hspace{0.08cm}\mathcal{Y}\hspace{0.08cm}$ son discretas:


    $$P(\mathcal{X}=x \hspace{0.08cm}|\hspace{0.08cm} \mathcal{Y}=y) \hspace{0.08cm}=\hspace{0.08cm} \dfrac{P(\mathcal{Y}=y \hspace{0.08cm} | \hspace{0.08cm} \mathcal{X}=x) \cdot  P(\mathcal{X}=x)}{P(\mathcal{Y}=y)}$$


- Si $\hspace{0.08cm}\mathcal{X}\hspace{0.08cm}$ e $\hspace{0.08cm}\mathcal{Y}\hspace{0.08cm}$ son continuas:

    $$f_{\mathcal{X}|\mathcal{Y}}(x,y) \hspace{0.08cm}=\hspace{0.08cm}    \dfrac{\hspace{0.08cm}f_{\mathcal{Y}|\mathcal{X}}(x, y) \cdot f_\mathcal{X}(x)\hspace{0.08cm}}{f_\mathcal{Y}(y)}$$


<br>

# Formula de transferencia para funciones de varias v.a.

Sea $\hspace{0.08cm}g \hspace{0.08cm}:\hspace{0.08cm} \mathbb{R}^2 \rightarrow \mathbb{R}\hspace{0.08cm}$.

- Si $\hspace{0.08cm}\mathcal{X}\hspace{0.08cm}$ e $\hspace{0.08cm}\mathcal{Y}\hspace{0.08cm}$ son discretas:


    $$E[g(\mathcal{X},\mathcal{Y})] \hspace{0.08cm}=\hspace{0.08cm} \sum_{x\in \mathbb{R}} \hspace{0.08cm}\sum_{y\in \mathbb{R}}\hspace{0.08cm} g(x,y) \cdot P(\mathcal{X}=x , \mathcal{Y}=y)$$


- Si $\hspace{0.08cm}\mathcal{X}\hspace{0.08cm}$ e $\hspace{0.08cm}\mathcal{Y}\hspace{0.08cm}$ son continuas:

    $$E[g(\mathcal{X},\mathcal{Y})]\hspace{0.08cm} =\hspace{0.08cm} \int_{x\in \mathbb{R}} \int_{y\in \mathbb{R}} g(x,y) \cdot f_{\mathcal{X},\mathcal{Y}}(x , y) \cdot dy \cdot dx$$


<br>

# Esperanza Condicionada

Si $\hspace{0.08cm}\mathcal{X}\hspace{0.08cm}$ es v.a. discreta :

$$E[\mathcal{X} | \mathcal{Y}=y] \hspace{0.08cm}=\hspace{0.08cm} \sum_{x\in \mathbb{R}} x \cdot P(\mathcal{X}=x | \mathcal{Y}=y)$$

Si $\hspace{0.08cm}\mathcal{Y}\hspace{0.08cm}$ es v.a. continua :

$$E[ \mathcal{X} | \mathcal{Y}=y] \hspace{0.08cm}=\hspace{0.08cm} \int_{x\in \mathbb{R}} x \cdot P(\mathcal{X}=x | \mathcal{Y}=y) \cdot dx$$


<br>

# Ley de la Esperanza total 

- Si $\hspace{0.08cm}\mathcal{Y}\hspace{0.08cm}$ es una v.a. discreta:

    $$E[\mathcal{X}] \hspace{0.08cm}=\hspace{0.08cm} \sum_{y\in \mathbb{R} } E[\mathcal{X} \hspace{0.08cm}|\hspace{0.08cm} \mathcal{Y}=y] \cdot P(\mathcal{Y}=y)$$


- Si $\hspace{0.08cm}\mathcal{Y}\hspace{0.08cm}$ es v.a. continua :

    $$E[\mathcal{X}] \hspace{0.08cm}=\hspace{0.08cm} \int_{y\in \mathbb{R} } E[\mathcal{X} \hspace{0.08cm} | \hspace{0.08cm} \mathcal{Y}=y] \cdot f_\mathcal{Y}(y) \cdot dy$$


<br>


# Terorema de la probabilidad total con variables aleatorias




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





# Definiciones de Convergencia








### Teorema de esperanza-varianza de la media muestral

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

$\hspace{0.25cm}$ Si tenemos una v.a. $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ y una m.a.s $\hspace{0.1cm}\mathcal{X}_1,...,\mathcal{X}_n\hspace{0.1cm}$ de $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ , entonces: $\\[0.5cm]$

$$E\left[\overline{\mathcal{X}_n}\right] \hspace{0.1cm}=\hspace{0.1cm} E[\mathcal{X}]\\$$

$$Var\left(\overline{\mathcal{X}_n}\right) \hspace{0.1cm}=\hspace{0.1cm} Var(\mathcal{X})/n \\$$

$\hspace{0.25cm}$ Donde:

- $\hspace{0.1cm}\overline{\mathcal{X}_n} = \dfrac{1}{n} \cdot \sum_{i=1}^n \mathcal{X}_i$


</p>
 
</p></span>
</div>


<br>




### Teorema de distribución de la media muestral

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

<p style='margin-left:0.1em;'>

$\hspace{0.25cm}$ Si tenemos una v.a. $\hspace{0.1cm}\mathcal{X}\sim N(\mu , \sigma^2)\hspace{0.1cm}$ y una m.a.s $\hspace{0.1cm}\mathcal{X}_1,...,\mathcal{X}_n\hspace{0.1cm}$ de $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ , entonces: $\\[0.5cm]$


$$\overline{ \mathcal{X}_n } \sim N(\mu \hspace{0.1cm},\hspace{0.1cm} \sigma^2/n)$$

$\hspace{0.25cm}$ Por tanto:


$$\dfrac{\hspace{0.2cm} \overline{ \mathcal{X}_n } - \mu \hspace{0.2cm}}{ \sqrt{\sigma^2 / n}  } \hspace{0.1cm}\sim\hspace{0.1cm} N(0,1)$$

</p>
 
</p></span>
</div>




### Teorema de Gosset

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

<p style='margin-left:0.1em;'>

$\hspace{0.25cm}$ Dada una v.a. $\hspace{0.1cm}\mathcal{X}\sim N(\mu, \sigma^2)\hspace{0.1cm}$, y dada una m.a.s $\hspace{0.1cm}\mathcal{X}_1,...,\mathcal{X}_n\hspace{0.1cm}$ de $\hspace{0.1cm}\mathcal{X} \\$ 


$$\dfrac{\hspace{0.15cm} \overline{\mathcal{X}_n} - \mu \hspace{0.15cm}}{\sqrt{\dfrac{n}{n-1} S_n^2/n \hspace{0.1cm}} } \hspace{0.1cm}\sim\hspace{0.1cm} t_{n-1} \\$$

$\hspace{0.25cm}$ Donde:

- $\overline{\mathcal{X}_n} = \dfrac{1}{n} \cdot \sum_{i=1}^n \mathcal{X}_i \\$

- $S_n^2 = \dfrac{1}{n} \cdot \sum_{i=1}^n (\mathcal{X}_i - \overline{\mathcal{X}_n} )^2$

</p>
 
</p></span>
</div>


### Teorema de Fisher

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

<p style='margin-left:0.1em;'>

$\hspace{0.25cm}$ Dada una v.a. $\hspace{0.1cm}\mathcal{X}\sim N(\mu, \sigma^2)\hspace{0.1cm}$, y dada una m.a.s $\hspace{0.1cm}\mathcal{X}_1,...,\mathcal{X}_n\hspace{0.1cm}$ de $\hspace{0.1cm}\mathcal{X}$ 


$$\dfrac{\hspace{0.15cm} n\cdot S^2_n \hspace{0.15cm}}{ \sigma^2 \hspace{0.1cm} } \hspace{0.1cm}\sim\hspace{0.1cm} \chi^2_{n-1}$$


$\hspace{0.25cm}$ Donde:

- $\overline{\mathcal{X}_n} = \dfrac{1}{n} \cdot \sum_{i=1}^n \mathcal{X}_i \\$

- $S_n^2 = \dfrac{1}{n} \cdot \sum_{i=1}^n (\mathcal{X}_i - \overline{\mathcal{X}_n} )^2$

</p>
 
</p></span>
</div>


### Teorema central del límite


<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

$\hspace{0.25cm}$ El TCL dice lo siguiente:

$\hspace{0.25cm}$ Si tenemos una v.a. $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ con varianza finita y no nula, y una m.a.s $\hspace{0.1cm}\mathcal{X}_1,...,\mathcal{X}_n\hspace{0.1cm}$ de $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ , entonces: $\\[0.5cm]$

$$\dfrac{\overline{\mathcal{X}_n} - E\left[\overline{\mathcal{X}_n}\right]}{\sqrt{Var\left(\overline{\mathcal{X}_n}\right)}} = \dfrac{\overline{\mathcal{X}_n} - E\left[\mathcal{X}\right]}{\sqrt{Var(\mathcal{X})/n}} \hspace{0.2cm}\underset{d}{\rightarrow}\hspace{0.2cm} N(0,1)\\$$


</p>
 
</p></span>
</div>






Usando la definicion de convergencia en distribución tenemos lo siguiente: $\\[0.5cm]$



$$\underset{n \rightarrow \infty}{lim} \hspace{0.1cm} F_{W_n}(x) \hspace{0.1cm} =\hspace{0.1cm} F_{N(0,1)}(x) \hspace{0.25cm} , \hspace{0.25cm} \forall x\in \mathbb{R}$$

Donde:

 $$W_n = \dfrac{\overline{\mathcal{X}_n} - E[\mathcal{X}]}{\sqrt{Var(\mathcal{X})/n}}$$
 
<br> 
 
### Teorema de Moivre-Laplace

<div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

$\hspace{0.25cm}$ Este teorema es un caso particular del TCL para v.a`s Binomiales.


$\hspace{0.25cm}$ Si tenemos una v.a. $\hspace{0.1cm}\mathcal{X}\sim Binomial(k,p)\hspace{0.1cm}$ y una m.a.s $\hspace{0.1cm}\mathcal{X}_1,...,\mathcal{X}_n\hspace{0.1cm}$ de $\hspace{0.1cm}\mathcal{X}\hspace{0.1cm}$ , entonces: $\\[0.5cm]$

 
 
 
$$\dfrac{\overline{\mathcal{X}_n} - E\left[\overline{\mathcal{X}_n}\right]}{\sqrt{Var\left(\overline{\mathcal{X}_n}\right)}} \hspace{0.1cm}=\hspace{0.1cm} \dfrac{\overline{\mathcal{X}_n} - E\left[\mathcal{X}\right]}{\sqrt{Var(\mathcal{X})/n}} \hspace{0.1cm}= \hspace{0.1cm}
\dfrac{\overline{\mathcal{X}_n} - k\cdot p}{\sqrt{k\cdot p\cdot(1-p)/n}}\hspace{0.2cm}\underset{d}{\rightarrow}\hspace{0.2cm} N(0,1)\\$$
 
</p>
 
</p></span>
</div>
 
<br>













# Distribución Normal Multivariante

\section{Distribución Normal Multivariante:}

\tcbset{colback=blue!1!white,colframe=orange!80!black}
\begin{tcolorbox}[toptitle=2mm,title= Distribución Normal Multivariante: ]
El vector aleatorio $X=(X_1 , X_2 ,..., X_p)^t$ tiene una distribucion Normal p-variante si: \vspace{0.2cm}

Existen $p$ v.a's i.i.d. $Z_1 ,..., Z_p \sim N(0,1)$ tales que:

\begin{gather*}
X= \mu + A\cdot Z
\end{gather*}

Donde:
\begin{gather*}
\mu=(\mu_1 ,..., \mu_p)^t \in \mathbb{R}^p \\
Z=(Z_1 ,..., Z_p)^t \\
A=( a_{ij} )_{i,j = 1,...,p} \in \mathbb{R}^{pxp}
\end{gather*}
\end{tcolorbox}

\subsection{Propiedades Distribución Normal Multivariante:}


$X=(X_1 , X_2 ,..., X_p)^t$  tiene una distribucion Normal p-variante si:

\begin{gather*}
X=\begin{pmatrix}
X_1 \\
... \\
X_{p} 
\end{pmatrix} = \begin{pmatrix}
\mu_{1} \\
... \\
\mu_{p} 
\end{pmatrix} +
\begin{pmatrix}
a_{11} & ... & a_{1p} \\
...  & ... & ...\\
a_{p1} & ...& a_{pp} 
\end{pmatrix} \cdot
\begin{pmatrix}
Z_{1 } \\
... \\
Z_{p} 
\end{pmatrix}=
\begin{pmatrix}
\mu_1 + a_{11}\cdot Z_1 +...+ a_{1p}\cdot Z_p \\
... \\
\mu_p + a_{p1}\cdot Z_1 +...+ a_{pp}\cdot Z_p 
\end{pmatrix}
\end{gather*}

Por tanto:
\tcbset{colback=blue!1!white,colframe=orange!80!black}
\begin{tcolorbox}[toptitle=2mm,title=  ]
$X=(X_1 , X_2 ,..., X_p)^t$  tiene una distribucion Normal p-variante si:

\begin{equation*}
\left\lbrace\begin{array}{c} 
X_1=\mu_1 + a_{11}\cdot Z_1 +...+ a_{1p}\cdot Z_p \\
... \\
X_p=\mu_p + a_{p1}\cdot Z_1 +...+ a_{pp}\cdot Z_p 
\end{array}\right.
\end{equation*}
\end{tcolorbox}

\tcbset{colback=blue!1!white,colframe=orange!80!black}
\begin{tcolorbox}[toptitle=2mm,title=  ]
Si $X= \mu + A\cdot Z$ , definidos estos conceptos como lo fueron en la sección 3.1, entonces: \\

1) \hspace{0.1cm} $E[X]=\mu$ \\

2)\hspace{0.1cm} $Var(X)=A^t \cdot A = \Sigma$ \\

3)\hspace{0.1cm} Notacion: $X \sim N_p(\mu , \Sigma )$ \\

4)\hspace{0.1cm} $\Sigma$ es semi-definida positiva y positiva si $Rg(A)=p$ \\

5)\hspace{0.1cm} Todo vector aleatorio Y obtenido como combinacion lineal de las componentes de X tiene distribucion normal multivariante. \\

Es decir, si $\overrightarrow{c_1},...,\overrightarrow{c_k}$ son vectores de $p$ constantes, entonces:

\begin{gather*}
Y= \begin{pmatrix}
\overrightarrow{c_1}^t \cdot X \\
... \\
 \overrightarrow{c_k}\cdot X
\end{pmatrix} =
\begin{pmatrix}
c_{11} \cdot X_1 + ... + c_{p1}\cdot X_p \\
... \\
 c_{1k} \cdot X_1 + ... + c_{pk}\cdot X_p
\end{pmatrix}
\end{gather*} es un vector aleatorio con distribucion Normal multivariante.

Y es un vector cuya cuyas componentes son combinaciones lineales de X \\

6) Para v.a's con distribucion conjunta Normal multivariante, independencia equivale a incorrelacion lineal. \\

7)\hspace{0.1cm} Si $X\sim N_p(\mu , \Sigma)$ es no singular, entonces:
\begin{gather*}
U_p = (X- \mu )^t \cdot \Sigma^{-1} \cdot (X - \mu ) \sim \chi_p^2
\end{gather*}

\end{tcolorbox}












