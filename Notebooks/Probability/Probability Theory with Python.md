---
title: 'Probability Theory'
author: 'Fabio Scielzo Ortiz'
date: '16/10/22'
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

More articles in my blog:   $\hspace{0.1cm}$   [Estadistica4all](https://fabioscielzoortiz.github.io/Estadistica4all.github.io/)

&nbsp;

How to reference this article ? 

Scielzo Ortiz, F. (2022). Linear Regression with Python and R. *Estadistica4all*.  [Linear Regression with Python and R](https://fabioscielzoortiz.github.io/Estadistica4all.github.io/Articulos/Linear%20Regression%20in%20Python%20and%20R.html )



<br>


# Experimento Aleatorio <a class="anchor" id="1"></a>

Un experimento aleatorio $\varepsilon$ es un  experimento que si se repite varias veces en las mismas condiciones puede ofrecer diferentes resultados.

<br>

# Espacio Muestral

El espacio muestal de un experimento aleatorio $\varepsilon$ es el conjunto de todos los resultados posibles de una realización del esperimento, y se denota por $\Omega(\varepsilon)$


<br>

# Sucesos

Sea $\varepsilon$  un experimento aleatorio con espacio muestral $\Omega(\varepsilon)$ ,

A es un suceso del experimento aleatorio $\varepsilon$ $\Leftrightarrow$ $A\subset \Omega(\varepsilon)$


# Ocurrencia de sucesos

Sea $w_i \in \Omega(\varepsilon)$ es el resultado obtenido de la i-esima realizacion del exprerimento aleatorio $\varepsilon$ ,


Ocurre el suceso $A \subset \Omega(\varepsilon)$  $\Leftrightarrow$ $w_i \in A , \exists i=1,2,3,...$


## Suceso Imposible

Sea $\emptyset$ el conjunto vacio,


$\emptyset$ es el suceso imposible, ya que nunca ocurre.



## Suceso Seguro


$\Omega(\varepsilon)$ es el suceso seguro, ya que siempre ocurre.



# Suceso Simple


$A\subset \Omega(\varepsilon)$ es un suceso simple $\Leftrightarrow$ $\# A = 1$


# Suceso Compuesto


$A\subset \Omega(\varepsilon)$ es un suceso compuesto $\Leftrightarrow$ $\# A > 1$


# Operaciones con sucesos

Sean $A, B \subset \Omega(\varepsilon)$

## Unión de sucesos


$$A\cup B = \lbrace w \in \Omega(\varepsilon) / w \in A \hspace{0.2cm} o\hspace{0.2cm} w \in B    \rbrace$$


**Observación:**

Sea $w \in \Omega(\varepsilon)$ el resultado de una realizacion del experimento aleatorio $\varepsilon$

Si $w \in A\cup B \Rigtharrow$  ocurre $A$ o $B$

<br>

### Propiedades de la unión de sucesos

1) A\cup B = B\cup A

2) A \cup A = A

3) A \cup \C = A

4) A \cup \Omega(\varepsilon) = \Omega(\varepsilon)

5) A \cup A^c = \Omega(\varepsilon)

6) Si A \cup B = \emptyset \Rightarrow \# A \cup B = \#A + \#B

7) \# A \cup B = \# A + \# B - \# A\cap B


<br>

## Intersección de sucesos

$$A\cap B = \lbrace w \in \\Omega(\varepsilon) / w \in A \hspace{0.2cm} y\hspace{0.2cm} w \in B    \rbrace$$

<br>

**Observación:**

Sea $w \in \Omega(\varepsilon)$ el resultado de una realizacion del experimento aleatorio $\varepsilon$

Si $w \in A\cap B \Rigtharrow$  ocurre $A$ y $B$

<br>

### Propiedades de la intersección de sucesos

1) A\cap B = B \cap A

2) A\cap A = A

3) A \cap \emptyset = \emptyset

4) A \cap \Omega(\varepsilon) = A

5) A \cap A^c = \emptyset


<br>

## Diferencia de sucesos

$$A - B = \lbrace w \in \\Omega(\varepsilon) / w \in A \hspace{0.2cm} y \hspace{0.2cm} w \notin B    \rbrace$$


<br>

**Observación:**

Sea $w \in \Omega(\varepsilon)$ el resultado de una realizacion del experimento aleatorio $\varepsilon$

Si $w \in A - B \Rigtharrow$  ocurre $A$ pero no $B$


<br>

### Propiedades de la diferencia de sucesos

1) A-B \neq B - A  , en general

2) A-A = \emptyset

3) A-\emptyset = A

4) A - \Omega(\varepsilon) = \emptyset

5) A- B = A - (A\cap B)

6) A-B = A\cap B^c



<br>


## Suceso Contrario

$$A^c  = \lbrace w \in \Omega(\varepsilon) / w \notin A  \rbrace$$

### Propiedades del suceso contrario

1) \emptyset^c = \Omega(\varepsilon)

2) \Omega(\varepsilon)^c = \emptyset

3) (A^c)^c = A

<br>

# Leyes de teoria de conjuntos útiles para sucesos


## Leyes Asociativas


## Leyes Distributivas

## Leyes de Morgan


# Conjunto potencia del espacio muestral


# Sucesos Disjuntos

# Sucesos Disjuntos dos a dos


# Concepto de probabilidad

## Probabilidad Clásicaa

## Probabilidad Frecuentista

## Probabilidad Axiomatica

# Probabilidad Condicionada












