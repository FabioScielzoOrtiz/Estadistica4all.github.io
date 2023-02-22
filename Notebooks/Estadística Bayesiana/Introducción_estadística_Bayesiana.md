---
title: 'Introducción a la Estadística Bayesiana'
author: 'Marcos Álvarez Martín'
date: '22/02/23'
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

$\hspace{0.3cm}$ **Autor:** $\hspace{0.1cm}$ [Marcos Álvarez Martín.](https://estadistica4all.com/autores/informaci%C3%B3n#Marcos-%C3%81lvarez) 

$\hspace{0.3cm}$ **Si utilizas este artículo, por favor, cítalo:** 

$\hspace{0.5cm}$ Álvarez Martín, M. (2023). Introducción a la estadística bayesiana. http://estadistica4all.com/Articulos/Introducción_estadística_Bayesiana.html


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
    múltiples muestras a través del teorema de Bayes.$\\[0.4cm]$
    
-   En la época del "Big Data", es posible resolver problemas muy
    complejos con aproximaciones bayesianas rápidas, por ejemplo,
    Variational Bayes es uno de los más empleados en problemas de
    aprendizaje profundo ("deep learning").$\\[0.4cm]$
    
-   El uso de métodos bayesianos está creciendo de manera exponencial en
    este siglo, principalmente, por el auge de las nuevas tecnologías y
    el alto desarrollo del software que permite aplicar este tipo de
    técnicas. $\\[0.4cm]$
    
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



# Repaso de teoría de la probabilidad


El objetivo de este apéndice es el de familiarizarnos con algunas de las
propiedades de la probabilidad, en particular la probabilidad
condicionada y el teorema de Bayes.

En los años 30 del siglo pasado, Kolmogorov formaliza los axiomas de la
probabilidad matemática, los cuales son:


- Para cualquier suceso $\hspace{0.08cm}S\hspace{0.08cm}$ :

$$P\left ( S \right )\geq 0\\$$

- Si $\hspace{0.08cm}\Omega\hspace{0.08cm}$ es el espacio muestral:


$$P\left ( \Omega \right )= 1\\$$ 

- Si $\hspace{0.08cm}S_{1},S_{2},...,S_{n}\hspace{0.08cm}$ son incompatibles entonces:

$$P\left ( S_{1}\cup S_{2}\cup ...,S_{n} \right )= \sum_{i=1}^{n}P\left ( S_{i} \right )$$


Este último axioma implica que bajo muestreo al azar, la probabilidad de
un suceso es proporcional al número de sucesos elementales que contiene.

<br>

## Independencia  

Dos sucesos $\hspace{0.08cm} A\hspace{0.08cm}$ y $\hspace{0.08cm}B\hspace{0.08cm}$ son estadísticamente independientes si: $\\[0.5cm]$

$$P\left ( A\cap B \right )\hspace{0.08cm}=\hspace{0.08cm}P\left ( A \right )P\left ( B \right )$$

<br>

## Probabilidad condicionada  

Si $\hspace{0.08cm}P\left ( B \right )> 0\hspace{0.08cm}$, la probabilidad de un suceso B dado A es:$\\[0.5cm]$

$$P\left ( A|B \right )\hspace{0.08cm}=\hspace{0.08cm}\frac{P\left ( A\cap B \right )}{P\left ( B \right )}$$

<br>

## Interpretación de la independencia estadística

Utilizando la definición de la probabilidad condicionada, si $\hspace{0.08cm}A\hspace{0.08cm}$ y $\hspace{0.08cm}B\hspace{0.08cm}$ son
independientes, entonces: $\\[0.5cm]$


$$P\left ( A|B \right )=\frac{P\left ( A \right )P\left ( B \right )}{P\left ( B \right )}=P\left ( A \right ) \\$$

Luego si se sabe que $\hspace{0.08cm}B\hspace{0.08cm}$ ha ocurrido, la probabilidad de $\hspace{0.08cm}A\hspace{0.08cm}$ es invariante.

<br>

## Ley de la multiplicación

Reordenando la fórmula para la probabilidad condicionada, se tiene: $\\[0.5cm]$


$$P\left ( A\cap B \right )\hspace{0.08cm}=\hspace{0.08cm}P\left ( B|A \right )P\left ( A \right )\hspace{0.08cm}=\hspace{0.08cm}P\left ( A|B \right )P\left ( B \right )$$


<br>

## Ley de la probabilidad total

Para dos sucesos $\hspace{0.08cm}A\hspace{0.08cm}$ y $\hspace{0.08cm}B\hspace{0.08cm}$, $\\[0.5cm]$

$$P\left ( A \right )=P\left ( A|B \right )P\left ( B \right )+P\left ( A|\bar{B} \right )P\left ( \bar{B} \right )$$


<br>

## Extendiendo la ley de la probabilidad total

De manera más general, si $\hspace{0.1cm}B_{1},...,B_{k}\hspace{0.1cm}$ forman una partición,
entonces:

$$P\left ( A \right ) \hspace{0.08cm}=\hspace{0.08cm} \sum_{j=1}^{k}P\left ( A|B_{j} \right )P\left ( B_{j} \right )$$

Con estos resultados, llegamos al teorema sobre el que se fundamenta la
estadística bayesiana, el teorema de Bayes.


<br>

## Teorema de Bayes

Para dos sucesos $\hspace{0.08cm}A\hspace{0.08cm}$, $\hspace{0.08cm}B\hspace{0.08cm}$, tal que $\hspace{0.08cm}P\left ( A \right )>0\hspace{0.08cm}$, se tiene: $\\[0.5cm]$

$$P\left ( B|A \right )\hspace{0.08cm}=\hspace{0.08cm}\frac{P\left ( B \right )P\left ( A|B \right )}{P\left ( A \right )}$$

Dicho esto, ahora vamos a repasar los conceptos de variables
estadísticas, distribuciones conjuntas, marginales y condicionales.

<br>

## Variables aleatorias

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
número obtenido de lanzar un dado... $\\[0.5cm]$

- Continuas: Una variable aleatoria
continua es aquella que puede tomar cualquier valor entre dos fijados y
los valores de la variable (al menos teóricamente) no se repiten.
Ejemplos de variable aleatoria continua son: la estatura, el peso, el
nivel de colesterol en sangre, el tiempo observado al recorrer una
distancia...

<br>

## Variables aleatorias discretas

Para una variable discreta, $\hspace{0.1cm}\mathbf{X}\hspace{0.1cm}$, tomando valores
$\hspace{0.08cm}x_{1},x_{2},...\hspace{0.12cm}$ se definen: 

- La función de probabilidad o masa
$\hspace{0.08cm}P\left ( \mathbf{X}=x \right )\hspace{0.08cm}$ tal que $\hspace{0.08cm}\sum_{i}P\left (\mathbf{X}=x{i} \right )=1\hspace{0.08cm}\\[0.5cm]$ 

- La función de distribución
$\hspace{0.08cm}\mathbf{F_{X}}\left ( x \right )\hspace{0.08cm}$ tal que:

$$\mathbf{F_{X}}\left ( x \right )=P\left ( \mathbf{X}\leq x \right )=\sum_{x_{i}<x}P\left ( \mathbf{X}=x_{i} \right)$$ 

- Los momentos:
$\hspace{0.1cm}E\left [ g(\mathbf{x}) \right ]=\sum_{i}g(x_{i})P\left ( \mathbf{X}=x_{i} \right )\hspace{0.08cm}\\[0.5cm]$.

**Ejemplo: la distribución de Poisson.**

Una variable discreta, $\hspace{0.08cm}\mathbf{X}\hspace{0.08cm}$,
sigue una distribución de Poisson con parámetro $\hspace{0.08cm}\lambda > 0\hspace{0.08cm}$ si:

$$P\left ( \mathbf{X}=x \right )\hspace{0.08cm}=\hspace{0.08cm}\frac{\lambda^{x}e^{-\lambda}}{x!}$$

para $\hspace{0.08cm}x = 0,1,2,...$ 

Se tiene que $\hspace{0.08cm}E[\mathbf{X}]=V[\mathbf{X}]=\lambda\hspace{0.08cm}$.


<br>

## Variables aleatorias continuas

Para una variable aleatoria continua, $\hspace{0.08cm}\mathbf{Y}\hspace{0.08cm}$, tomando valores $\hspace{0.08cm}x \in \Re\hspace{0.08cm}$, se tiene que: 

- La función de distribución
$\hspace{0.12cm}\mathbf{F_{Y}}\left ( y \right )\hspace{0.12cm}$ tal que:

$$\mathbf{F_{Y}}\left ( y \right )=P\left ( \mathbf{Y}\leq y \right )\\[0.5cm]$$ 

- La función de densidad
$\hspace{0.2cm}\mathbf{f_{Y}}\left ( y \right )=\frac{dF\left ( y \right )}{dy}\hspace{0.2cm}$ tal
que:

$$\int_{-\infty}^{y} \mathbf{f_{Y}}\left ( y \right )dy=\mathbf{F_{Y}}\left ( y \right )\\[0.5cm]$$ 

- Los momentos:
$\hspace{0.2cm}E\left [ g(\mathbf{Y}) \right ]=\int_{-\infty}^{\infty}g(y)\mathbf{f_{Y}}\left ( y \right )\hspace{0.08cm}\\[0.5cm]$



**Ejemplo: la distribución Gamma.**

Una variable continua, $\hspace{0.08cm}\mathbf{Y}\hspace{0.08cm}$ sigue
una distribución gamma con parámetros $\hspace{0.08cm}\alpha\hspace{0.08cm},\hspace{0.08cm}\beta >0\hspace{0.08cm}$ si:

$$\mathbf{f_{Y}}\left ( y \right )=\frac{\beta^{\alpha}}{\Gamma\left ( \alpha \right )}y^{\alpha-1}e^{-\beta y}$$

para $\hspace{0.1cm}y > 0\hspace{0.1cm}$ donde $\hspace{0.08cm}\Gamma(\cdot)\hspace{0.08cm}$ es la función gamma.

La esperanza y varianza de la distribución Gamma son:

$$E[\mathbf{Y}]\hspace{0.1cm}=\hspace{0.1cm}\frac{\alpha}{\beta}$$

$$V[\mathbf{Y}]\hspace{0.1cm}=\hspace{0.1cm}\frac{\alpha}{\beta^{2}}\\$$



La función gamma se define como sigue:

$$\Gamma\left ( \alpha \right )\hspace{0.1cm}=\hspace{0.1cm}\int_{0}^{\infty}u^{\alpha-1}e^{-u} \hspace{0.05cm} du$$

si $\hspace{0.08cm}\alpha\hspace{0.08cm}$ es un número entero:

 $$\Gamma\left ( \alpha+1 \right )\hspace{0.08cm}=\hspace{0.08cm}\alpha\Gamma\left ( \alpha \right )$$
 
 
$$\Gamma\left ( \alpha \right )\hspace{0.08cm}=\hspace{0.08cm}\left ( \alpha-1! \right )$$  



<br>


## Distribuciones conjuntas

Para dos o más variables discretas, la distribución conjunta es la
función $P\left ( \mathbf{X}=x,\mathbf{Y}=y \right )$ tal que: $\\[0.8cm]$

$$\sum_{x}\sum_{y}P\left ( \mathbf{X}=x,\mathbf{Y}=y \right )\hspace{0.08cm}=\hspace{0.08cm}1 $$

$$\sum_{x}P\left ( \mathbf{X}=x,\mathbf{Y}=y \right )\hspace{0.08cm}=\hspace{0.08cm}P\left ( \mathbf{Y}=y \right )$$
 

$$\sum_{y}P\left ( \mathbf{X}=x,\mathbf{Y}=y \right )\hspace{0.08cm}=\hspace{0.08cm}P\left ( \mathbf{X}=x \right )$$
 

Para el caso de variables continuas, sustituimos sus respectivos
sumatorios por integrales.


<br>

## Distribuciones condicionales

La distribución condicional de una variable (discreta) $\hspace{0.08cm}\mathbf{X}\hspace{0.08cm}$ dada
otra variable (discreta) $\hspace{0.08cm}\mathbf{Y}\hspace{0.08cm}$ es: $\\[0.8cm]$


$$P\left ( \mathbf{X}=x|\mathbf{Y}=y \right )=\frac{P\left ( \mathbf{X}=x,\mathbf{Y}=y \right )}{P\left ( \mathbf{Y}=y \right )}$$


suponiendo que $\hspace{0.08cm}P\left ( \mathbf{Y}=y \right ) > 0\hspace{0.08cm}$. 

La esperanza
condicional de una función $\hspace{0.08cm}g\left (x,y \right )\hspace{0.08cm}$ es: $\\[0.5cm]$

$$E[\hspace{0.08cm}g\left (x,y  \right )\hspace{0.08cm}|\hspace{0.08cm}Y=y\hspace{0.08cm}]\hspace{0.08cm}=\hspace{0.08cm}\sum_{x}g\left (x,y  \right )P\left ( \mathbf{X}=x|\mathbf{Y}=y \right )$$


<br>

## Esperanza y varianza marginal

Supongamos que queremos calcular $\hspace{0.08cm}E[\mathbf{X}]\hspace{0.08cm}$ y $\hspace{0.08cm}V[\mathbf{X}]\hspace{0.08cm}$.

Suena complicado porqué en principio, tendríamos que evaluar la
distribución marginal de $\hspace{0.08cm}\mathbf{X}\hspace{0.08cm}$ primero o computar a través de la
distribución conjunta. 

Por ejemplo:

$$E[\mathbf{X}]=\sum_{x} \int_{-\infty}^{\infty}x\mathbf{f_{x,y}}\left ( x,y \right )dy $$

¿Existe una manera más fácil de hacer el cálculo? Pues afortunadamente
sí, se puede calcular con la ley de las esperanzas iteradas.


<br>

## Ley de las esperanzas iteradas

Para dos variables $\hspace{0.08cm}\mathbf{X}\hspace{0.08cm}$ e $\hspace{0.08cm}\mathbf{Y}\hspace{0.08cm}$, la ley de las esperanzas
iteradas dice que:

$$E[\mathbf{X}]\hspace{0.08cm}=\hspace{0.08cm}E[E[\mathbf{X|Y}]]$$ 

Existe otra
descomposición semejante para la varianza:

$$V[X]\hspace{0.08cm}=\hspace{0.08cm}E[V[\mathbf{X|Y}]]\hspace{0.08cm}+\hspace{0.08cm}V[E[\mathbf{X|Y}]]$$.

<br>

## Ley de la probabilidad total para variables aleatorias

Tenemos que:


- Si $\hspace{0.08cm}\mathbf{Y}\hspace{0.08cm}$ es discreta,

$$P\left ( \mathbf{X}=x \right )\hspace{0.08cm}=\hspace{0.08cm}\sum_{y}P\left ( \mathbf{X}=x|\mathbf{Y}=y \right )\cdot P\left ( \mathbf{Y}=y \right ) \\$$


- Si $\hspace{0.08cm}\mathbf{Y}\hspace{0.08cm}$ es continua,

$$P\left ( \mathbf{X}=x \right )=\int_{-\infty}^{\infty}P\left ( \mathbf{X}=x|\mathbf{Y}=y \right )\cdot\mathbf{f_{Y}}\left ( y \right )dx\\$$


Este segundo caso suele ser más interesante en la mayoría de las
ocasiones.

<br>

## Teorema de Bayes para variables aleatorias <a class="anchor" id="1"></a>

Tenemos que:

- Para el caso de v.a. discretas:

$$P\left ( \mathbf{Y}=y|\mathbf{X}=x \right )\hspace{0.08cm}=\hspace{0.08cm}\frac{P\left ( \mathbf{X}=x|\mathbf{Y}=y \right )P\left ( \mathbf{Y}=y \right )}{P\left ( \mathbf{X}=x \right )}=\frac{P\left ( \mathbf{X}=x|\mathbf{Y}=y \right )P\left ( \mathbf{Y}=y \right )}{\sum_{i}P\left ( \mathbf{X}=x|\mathbf{Y}=y_{i} \right )P\left ( \mathbf{Y}=y_{i} \right )}$$


- Para el caso de v.a. continuas:

$$\mathbf{f}_{x|y}\left ( y|\mathbf{X}=x \right )\hspace{0.08cm}=\hspace{0.08cm}\frac{P\left ( \mathbf{X}=x|\mathbf{Y}=y \right )\mathbf{f}_y\left ( \mathbf{Y}=y \right )}{P\left ( \mathbf{X}=x \right )}=\frac{P\left ( \mathbf{X}=x|\mathbf{Y}=y \right )\mathbf{f}_y\left ( \mathbf{Y}=y \right )}{\int_{-\infty}^{\infty}P\left ( \mathbf{X}=x|\mathbf{Y}=y_{i} \right )\mathbf{f}_{y}\left ( y \right )}dy$$



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
del suceso en $\hspace{0.08cm}n\hspace{0.08cm}$ repeticiones del experimento cuando $\hspace{0.08cm}n \to \infty\hspace{0.08cm}$.

<br>

## Consecuencias

-   La probabilidad es un concepto objetivo: la probabilidad de que
    salga un 1 en un dado será la misma para todos. $\\[0.5cm]$
    
-   La probabilidad es un concepto limitado a situaciones de
    experimentos repetibles y eso no siempre es posible. $\\[0.5cm]$
    
-   Parámetros, $\hspace{0.08cm}\theta\hspace{0.08cm}$, son desconocidos, pero fijos. 

<br>

## Estimación puntual

Un buen estimador tiene buenas propiedades probabilisticas
(frecuentistas), ¡qué lejos quedaron estas propiedades! Vamos a
refrescarlas: 

- **Insesgadez**: quiere decir que la esperanza del estimador
coincide con el parámetro de interés.  $\\[0.5cm]$

- **Alta precisión:** recordad que la
precisión es el inverso de la varianza por lo que es lo mismo que pedir
que tenga una varianza pequeña.  $\\[0.5cm]$

- **Pequeño ECM:** el error cuadrático medio
se definía como la varianza más el sesgo elevado al cuadrado. Y como es
un error nos interesa que sea lo más pequeño posible. $\\[0.3cm]$

Existen varios métodos de seleccionar un estimador, entre ellos, el
método de los momentos, mínimos cuadrados o el estimador máximo
verosímil.

Por ejemplo, este último, se sabe que tiene unas muy buenas propiedades
asintóticas, pero su ventaja no está tan clara en muestras de tamaño
reducido.

<br>

## Estimación por intervalos

Formalmente, un intervalo de $\hspace{0.08cm}(1-\alpha)\cdot 100\%\hspace{0.08cm}$ de confianza para un
parámetro $\hspace{0.08cm}\theta\hspace{0.08cm}$ dada una muestra es un intervalo aleatorio tal que:

$$P\left ( LI < \alpha < LS \right )=1-\alpha$$ 

para cualquier valor del
parámetro (y cualquier otro parámetro del modelo).

- ¿Cómo interpretamos este intervalo? ¿La probabilidad de que contenga a
$\hspace{0.08cm}\theta\hspace{0.08cm}$ es $\hspace{0.08cm}(1-\alpha)\hspace{0.08cm}$? 

    La respuesta es que la interpretación de un intervalo de confianza frecuentista es que tras repetir un número elevado de veces un experimento aleatorio se espera que $\hspace{0.08cm}(1-\alpha)\cdot 100 \%\hspace{0.08cm}$ de esos intervalos obtenidos en cada uno de esas realización contengan al verdadero valor del parámetro.

<br>

## Contrastes de hipótesis

Un contraste de hipótesis típicamente tiene una serie de pasos a
completar:

1.  Formalizar una hipótesis estadística experimental o alternativa
    $\hspace{0.08cm}(H_{1})\hspace{0.08cm}$ de la cual no sabemos su veracidad. $\\[0.5cm]$
    
2.  Formalizar la hipótesis opuesta o nula $\hspace{0.08cm}(H_{0})\hspace{0.08cm}$. $\\[0.5cm]$

3.  Derivar un estadístico que lo usaremos como la base del contraste. $\\[0.5cm]$

4.  Hallar la distribución del estadístico de contraste bajo la
    hipótesis nula. $\\[0.5cm]$
    
5.  Fijar un nivel de significación o error de tipo I :

    $$\alpha\hspace{0.08cm}=\hspace{0.08cm}P\left( \hspace{0.08cm} \text{Rechazar} \hspace{0.08cm} H_{0} \hspace{0.08cm}|\hspace{0.08cm} H_{0} \text{es verdadera} \hspace{0.08cm}\right)$$ $\\[0.5cm]$
    
6.  Calcular la región crítica o de rechazo, es decir el rango de
    valores del estadístico de contraste donde se rechazaría $\hspace{0.08cm}H_{0}\hspace{0.08cm}$ a
    favor de $\hspace{0.08cm}H_{1}\hspace{0.08cm}$. $\\[0.5cm]$

Entonces, tenemos que dada una muestra observada, se calcula el valor
del estadístico y si cae dentro de la región crítica, se rechaza
$\hspace{0.08cm}H_{0}\hspace{0.08cm}$.

Aunque usualmente explicamos los contrastes o test de hipótesis como el
cálculo de una región crítica, lo cierto es que es mucho más común hacer
uso del p-valor, que se define como, dada una muestra observada,
tenemos que el p-valor es la probabilidad bajo $\hspace{0.08cm}H_{0}\hspace{0.08cm}$ de observar un
valor del estadístico por lo menos tan extremo como el observado.

Si el p-valor por tanto es más pequeño que $\hspace{0.08cm}\alpha\hspace{0.08cm}$, se rechaza la
hipótesis nula. Por el contrario, si el p-valor es más grande que
$\hspace{0.08cm}\alpha\hspace{0.08cm}$, no se rechaza la hipótesis nula.

A menudo, interpretamos el concepto de p-valor como una medida de la
fuerza de la evidencia en contra de $\hspace{0.08cm}H_{0}\hspace{0.08cm}$. $\\[0.5cm]$

**Ejemplo:** tenemos una moneda con $\hspace{0.08cm}P\left ( cruz \right )=\theta\hspace{0.11cm}$ y
queremos contrastar: 

$$H_{0}=0.5$$ 

$$H_{1}>0.5$$ 

Entonces tiramos la
moneda 12 veces y observamos 9 cruces y 3 caras. Luego, el p-valor es:
$$p\hspace{0.08cm}=\hspace{0.08cm}\sum_{x=9}^{12} \binom{12}{x}\cdot 0.5^{x} \cdot \left( 1-0.5 \right )^{12-x}\hspace{0.08cm}=\hspace{0.08cm}0.073$$

En este caso, no rechazaríamos la hipótesis nula a un 5% de
significación.

Ahora bien, supongamos que en lugar de decidir de antemano tirar la
moneda 12 veces, vamos a tirar la moneda hasta observar la tercera cara.
Ya el diseño del experimento no es binomial sino binomial negativa. Si
la tercera cara ocurre en la duodécima tirada, es decir, hemos visto 9
cruces y 3 caras ;y el EMV de $\hspace{0.08cm}\theta\hspace{0.08cm}$ sigue siendo
$\hspace{0.08cm}\hat{\theta}=\frac{9}{12}\hspace{0.08cm}$. 

No obstante, ahora el p-valor es:

$$p\hspace{0.08cm}=\hspace{0.08cm}\sum_{y=9}^{\infty}\binom{y+3-1}{y}\cdot \left ( 1-\theta \right )^{3}\cdot \theta^{9}\hspace{0.08cm}=\hspace{0.08cm}0.033$$

Y en este caso, sí rechazamos la hipótesis nula.

¿No parece lógico verdad?

Si a alguien le pica la curiosidad, no está
claro porque sucede esto y en qué condiciones ocurre, tan sólo decir que
este es uno de los  puntos en los que los estadísticos bayesianos
están más en contra de la estadística frecuentista.

<br>

## Predicción

Típicamente, para hacer predicción en un procedimiento clásico, se
utiliza un método denominado "plug in", que cumplen el principio del
mismo nombre, que dice que una característica dada de una distribución
puede ser aproximada por la equivalente evaluada en la distribución
empírica de una muestra aleatoria.

Siguiendo con el ejemplo anterior, si queremos predecir el número de
cruces en 10 tiradas más de la moneda (Y), lo haríamos de la siguiente
forma: 

$$Y\sim Binomial \left ( 10, 0.75 \right )$$

<br>

## Comparación de modelos

Para comparar varios modelos, podemos utilizar, por ejemplo un criterio
basado en penalizar la verosimilitud de acuerdo al número de parámetros.
Por ejemplo, el AIC (Akaike Information Criterion) para dado un modelo
$\mathbf{M}$ es:

$$AIC\hspace{0.08cm}=\hspace{0.08cm}-2\log I\left( \hat{\theta_{\mathbf{M}}}\hspace{0.08cm}|\hspace{0.08cm}datos,\mathbf{M} \right ) \hspace{0.08cm}+\hspace{0.08cm}2k$$

dónde $\hspace{0.08cm}k\hspace{0.08cm}$ es el número de parámetros presentes en el modelo. En el caso
del AIC el modelo seleccionado es el que minimice este criterio.


**Ejemplo:** Para que quede más claro esto haremos un breve ejemplo ya que
pensamos que la comparación de modelos no siempre se estudia o al menos
no en cursos de estadística básica-intermedia. Empecemos con el ejemplo,
supongamos que queremos comparar el modelo con $\hspace{0.08cm}p=0.5\hspace{0.08cm}$, que
denominaremos $\hspace{0.08cm}(\mathbf{M_{0}})\hspace{0.08cm}$ con el modelo completo
$\hspace{0.08cm}(\mathbf{M_{1}})\hspace{0.08cm}$: $\hspace{0.08cm}Y\sim Binomial\left ( 12,p \right )\hspace{0.08cm}$ para cualquier
$\hspace{0.08cm}p\hspace{0.08cm}$. 

El AIC para el modelo $\hspace{0.08cm}\mathbf{M_{0}}\hspace{0.08cm}$ es:

$$AIC_{0}\hspace{0.08cm}=\hspace{0.08cm}-2\log \left\{\binom{12}{9}0.5^{12} \right\}+2\times 0=5.85$$

Y el AIC para el modelo general es:

$$AIC_{1}\hspace{0.08cm}=\hspace{0.08cm}-2\log \left\{\binom{12}{9}0.75^{9}0.25^{3} \right\}+2\times 1=4.71$$

Luego el modelo preferido según el criterio de Akaike es el modelo
completo.

<br>

## Bondad de ajuste <a class="anchor" id="1"></a>

Para ver si los datos se ajustan a un modelo $\mathbf{M}$, se puede
utilizar un contraste de hipótesis de la hipótesis nula:

$$H_{0}\hspace{0.08cm}:\hspace{0.08cm} \text{los datos provienen del modelo} \hspace{0.08cm} \mathbf{M}.\\$$

Ejemplos típicos
son el contraste de la chi-cuadrado o el de Kolmogorov-Smirnov.

Con esto, hemos resumido los puntos más característicos de la inferencia
clásica o frecuentista.


<br>

---

<br>

# Inferencia Bayesiana

Ahora sí, hemos llegado a lo que seguro estabáis esperando, la
introducción a la estadística bayesiana y las diferencias más evidentes
entre ambos enfoques.


## Concepto de Probabilidad y Distribución A Priori

Las ideas iniciales de la probabilidad surgieron relacionadas con los
juegos de azar y su conceptualización e interpretación son básicamente
frecuentistas. Esta formulación frecuentista trabaja bien en multitud de
situaciones, pero no en todas. Entre otras, destacamos las tres
diferentes interpretaciones de Kyburg, Jr. señala que pueden
considerarse respecto a la probabilidad:

1.  Interpretación empírico frecuentista. Esta es la interpretación más
    común de la probabilidad y hace referencia al comportamiento (real o
    hipotético) de ciertos objetos. $\\[0.5cm]$
    
    
2.  Interpretación lógica. Esta interpretación es bastante poco común
    entre estadísticos y está más bien reservada al mundo de la lógica.
    De acuerdo con esta interpretación, hay una relación lógica entre
    una afirmación (considerada como una hipótesis) y otra afirmación
    (considerada como evidencia), en virtud de la cual la primera tiene
    cierta probabilidad relativa a la segunda. $\\[0.5cm]$
    
    
3.  Interpretación subjetivista. Esta es una versión más débil de la
    interpretación lógica. Es más del tipo psicológico que lógico. El
    grado de creencia es el concepto fundamental de la interpretación:
    las afirmaciones probabilísticas representan los grados de creencias
    de los individuos.$\\[0.5cm]$

En esta última de las interpretaciones es sobre la que se sustenta la
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
clásico y bayesiano.  $\\[0.5cm]$

- Opinión de expertos. La utilización de expertos
es casi obligatoria en situaciones completamente nuevas donde
experimentar puede ser muy costoso o imposible, por ejemplo en la
implementación de políticas a nivel macroeconómico. $\\[0.5cm]$

Wallsten y Budescu presentan las condiciones para que un proceso de
elicitación produzca una distribución apropiada. En teoría de la
medición se menciona con frecuencia las dificultades que tienen los
procesos de cuantificación de sentimientos en relación con los eventos
externos y la determinación del error. El proceso de codificación debe
garantizar condiciones básicas, como confiabilidad y validez. La
confiabilidad se mide como la correlación al cuadrado entre los valores
observados de las probabilidades y las verdaderas probabilidades,
$\hspace{0.08cm}\rho_{p\pi}^{2}\hspace{0.08cm}$. La probabilidad subejtiva es una variable aleatoria,
$\hspace{0.08cm}p\hspace{0.08cm}$, que puede ser descompuesta como la verdadera probabilidad fija
$\hspace{0.08cm}\pi\hspace{0.08cm}$ y un error, $\hspace{0.08cm}e\hspace{0.08cm}$: 
$$p\hspace{0.08cm}=\hspace{0.08cm}\pi+e$$ 

Los siguientes supuestos son
estándares para este modelo:

1.  $\hspace{0.15cm}E(e)\hspace{0.08cm}=\hspace{0.08cm}0$ $\\[0.5cm]$

2.  $\hspace{0.15cm}\rho_{\pi e}\hspace{0.08cm}=\hspace{0.08cm}0$ $\\[0.5cm]$

3.  Para cualquier par de mediciones independientes los errores son
    incorrelacionados: $\hspace{0.08cm}\rho_{e_{i}e_{j}}=0\hspace{0.08cm}$ para $\hspace{0.08cm}i\neq j\hspace{0.08cm}$. $\\[0.5cm]$
    
4.  $\hspace{0.15cm}\rho_{\pi_{i}e_{j}}=0\hspace{0.08cm}$ para $\hspace{0.08cm}i\neq j\hspace{0.08cm}$. $\\[0.5cm]$

Sea $\hspace{0.08cm}\sigma_{e}^{2}\hspace{0.08cm}$ la varianza del error. La raíz cuadrada de esta
cantidad se conoce como el error estándar de la medición. Del modelo y
los supuestos anteriores se tiene:

$$\sigma_{p}^{2}\hspace{0.08cm}=\hspace{0.08cm}\sigma_{\pi}^{2}+\sigma_{e}^{2}$$ 

Así, el coeficiente
de confiabilidad será:

$$0\hspace{0.08cm}\leq\hspace{0.08cm} \rho_{\pi p}^{2}\hspace{0.08cm}=\hspace{0.08cm}\frac{\sigma_{\pi}^{2}}{\sigma_{p}^{2}}\hspace{0.08cm}=\hspace{0.08cm}1-\frac{\sigma_{e}^{2}}{\sigma_{p}^{2}}\hspace{0.08cm}\leq\hspace{0.08cm} 1$$

La confiabilidad está inversamente relacionada con el error de medición
y es perfecta cuando $\hspace{0.08cm}\sigma_{e}^{2}=0\hspace{0.08cm}$. Ya que $\hspace{0.08cm}\pi\hspace{0.08cm}$ no puede ser
observado directamente, no podemos determinar $\hspace{0.08cm}\sigma_{\pi}^{2}\hspace{0.08cm}$. Esto
puede resolverse parcialmente a través de métodos indirectos, por
ejemplo, usando varios métodos de cuantificación.

La validez se define como la correlación entre dos procedimientos de
cuantificación independientes, digamos $\hspace{0.08cm}\rho_{xy}\hspace{0.08cm}$.

Ayyub presenta una clasificación de la ignorancia que es importante
considerar cuando se determina la claridad de un experto. La ignorancia
puede ser consciente o ciega. La ignorancia ciega incluye conocimiento
irrelevante que puede estar conformado por un conocimiento relevante y
que es descartado o no considerado intencionalmente y por un
conocimiento no confiable (prejuicios) o que no aplica al problema de
interés.

Un elicitador subjetivo está bien calibrado si para cada probabilidad
$\hspace{0.08cm}p\hspace{0.08cm}$, en la clase de todos los eventos en los cuales asigna una
probabilidad subjetiva, la frecuencia relativa de ocurrencia es igual a
$\hspace{0.08cm}p\hspace{0.08cm}$.

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
una persona puede representar los conocimientos sobre $\hspace{0.08cm}\theta\hspace{0.08cm}$
(parámetro o parámetros de interés) con una distribución
$\hspace{0.08cm}f\left ( \theta \right )\hspace{0.08cm}$.

A esta distribución como hemos dicho antes, la llamamos distribución a priori.

Como todo lo anterior puede sonar un poco raro y complejo, supongamos
que queremos pedir una distribución a priori de un experto para
$\hspace{0.08cm}\theta=P\left ( cruz \right )\hspace{0.08cm}$ ¿Qué sabemos sobre la probabilidad? $\\[0.5cm]$

$$0\leq \theta \leq 1$$

En la mayoría de experimentos, aproximadamente
el 50% de los resultados son cruces. Entonces buscamos una distribución
a priori con soporte en el intervalo $\hspace{0.08cm}\left [ 0,1 \right ]\hspace{0.08cm}$ y centrado
en $\hspace{0.08cm}0.5\hspace{0.08cm}$.

Por ejemplo podemos utilizar para este caso la distribución beta, que
tiene la siguiente definición matemática y propiedades. Una variable
continua $\hspace{0.08cm}\mathbf{Y}\hspace{0.08cm}$ tiene una distribución beta con parámetros
$\hspace{0.08cm}\alpha, \beta>0\hspace{0.08cm}$ si:

$$\mathbf{f_{Y}}\left( y \right)\hspace{0.08cm}=\hspace{0.08cm}\frac{1}{B\left ( \alpha, \beta \right )}y^{\alpha-1} \cdot \left( 1-y \right)^{\beta-1}$$

para $\hspace{0.08cm}0 < y < 1\hspace{0.08cm}$. 

$B\left ( \cdot,\cdot \right )\hspace{0.08cm}$ es el coeficiente
beta, que se define como sigue:

$$B\left ( \alpha,\beta \right )=\int_{0}^{1}y^{\alpha-1}\left ( 1-y \right )^{\beta-1}dy=\frac{\Gamma\left ( \alpha \right )\Gamma\left ( \beta \right )}{\Gamma\left ( \alpha + \beta \right )}\\$$

Se tiene que $\hspace{0.08cm}E\left [ Y \right ]=\frac{\alpha}{\alpha + \beta}\hspace{0.1cm}$ y
$\hspace{0.1cm}V\left [ Y \right ]=\frac{\alpha\beta}{\left ( \alpha + \beta \right )^{2}\left ( \alpha + \beta + 1 \right )}\hspace{0.1cm}$.

Cambiando los parámetros, la distribución beta toma formas muy
distintas. En este caso podemos coger la $\hspace{0.08cm}Beta(5,5)\hspace{0.08cm}$.

Antes de seguir vamos a desarrollar las diferentes aproximaciones al
análisis bayesiano.

<br>

## Aproximaciones al Análisis Bayesiano

Una clasificación de las diversas aproximaciones que podemos realizar
cuando consideramos el enfoque bayesiano es la siguiente:

1.  Análisis bayesiano objetivo: esta posición se caracteriza por la
    utilización de distribuciones a priori no informativas. $\\[0.5cm]$
    
2.  Análisis bayesiano subjetivo: la utilización de distribuciones a
    priori subjetivas es a menudo disponible como alternativa en algunos
    problemas. $\\[0.5cm]$
    
3.  Análisis bayesiano robusto: esta posición asume que es imposible
    especificar la distribución a priori o el modelo, en cuyo caso es
    mejor trabajar dentro de clases donde haya un nivel de incertidumbre
    sobre esta distribución o modelo. $\\[0.5cm]$
    
4.  Análisis bayesiano-frecuentista: hay problemas en los que la
    aproximación frecuentista produce resultados satisfactorios, como en
    los métodos no paramétricos, y al bayesiano le toca aceptarlos como
    soluciones pseudobayesianas. $\\[0.5cm]$
    
5.  Análisis cuasibayesiano: esta aproximación utiliza distribuciones a
    priori seleccionadas de una forma que acomoden a la solución
    "bonita" del problema, ajustando estas distribuciones a priori de
    diversas formas, por ejemplo seleccionando distribuciones a priori
    vagas, o ajustando los parámetros.

<br>

## La Distribución A Posteriori

Con la a priori podemos obtener la a posteriori que es la que de verdad
nos importa y con la que trabajaremos. Para hallar la distribución a
posteriori... ¿Cómo creéis que se hará...? Pues claro, con el teorema de
Bayes:

$$f\left ( \theta|datos \right )\hspace{0.08cm}=\hspace{0.08cm}\frac{\hspace{0.08cm}f\left ( \theta \right )f\left ( datos|\theta \right )\hspace{0.08cm}}{f\left ( datos \right )}$$

En esta expresión:

- $f\left ( \theta|datos \right )\hspace{0.08cm}$ es la distribución a posteriori. $\\[0.5cm]$

- $f\left ( \theta \right )\hspace{0.08cm}$ es la distribución a priori. $\\[0.5cm]$

- $f\left (datos|\theta \right)= I\left ( \theta|datos \right )\hspace{0.08cm}$ es la
función de verosimilitud. $\\[0.5cm]$

- $f\left (datos \right)=\int f\left (datos|\theta \right)f\left (\theta \right)d\theta\hspace{0.08cm}$ es la verosimitud marginal. $\\[0.5cm]$

De la fórmula anterior, observamos que el denominador no depende de $\hspace{0.08cm}\theta\hspace{0.08cm}$, luego tenemos que:

$$f\left ( \theta|datos \right ) \hspace{0.08cm}\propto\hspace{0.08cm} f\left ( \theta \right ) f\left (datos|\theta \right)$$
$$\text{a posteriori} \hspace{0.08cm} \propto\hspace{0.08cm} \text{a priori \times verosimilitud}$$

<br>

## Estimación Puntual
Cuando hemos calculado la distribución a posteriori, podemos utilizar la media a posteriori, la mediana a posteriori, la moda a posteriori como estimadores puntuales de $\hspace{0.08cm}\theta\hspace{0.08cm}$. Este último caso es conocido como el estimador máximo a posteriori o MAP.

<br>

## Estimación por Intervalos

Un intervalo de $\hspace{0.08cm}100\cdot(1-\alpha)\%\hspace{0.08cm}$ de credibilidad o de confianza bayesiana es cualquier intervalo tal que $\hspace{0.08cm}P\left ( LI<\theta<LS|datos \right )=1-\alpha\hspace{0.1cm}$.

¿Cuál es la interpretación de este intervalo? ¿Será igual que en el caso frecuentista?

El intervalo de credibilidad más corto se llama el intervalo de máxima densidad a posteriori. Y a las preguntas anteriores, la respuesta es que no, las interpretaciones son distintas, en el enfoque bayesiano, estos intervalos son interpretados de la forma siguiente:
Un intervalo de credibilidad es un intervalo dentro del cual cae un valor de un parámetro no observado con una probabilidad particular. Esto es, el verdadero valor del parámetro caerá dentro del intervalo por ejemplo con un 95% de probabilidad, que contrasta con la interpretación del intervalo frecuentista o clásico.


<br>

## Contraste y selección de modelos

En teoría, hacer contrastes de hipótesis a la bayesiana es bastante fácil y nuestro modo de ver más intuitivo que con el concepto de p-valor. Dadas las distribuciones a priori, $\hspace{0.08cm}P\left ( H_{0} \right )\hspace{0.1cm}$ y $\hspace{0.08cm}P\left ( H_{1} \right )=1-P\left ( H_{0} \right )\hspace{0.08cm}$, se calculan las probabilidades a posteriori con:


$$P\left ( H_{0}|datos \right )\propto f\left ( datos|H_{0} \right )P\left ( H_{0} \right )\propto P\left ( H_{0} \right )\int f\left ( datos|H_{0},\theta \right )f\left ( \theta|H_{0} \right )d\theta$$


Con esto, dada una regla de decisión, se puede decidir rechazar $\hspace{0.08cm}H_{0}\hspace{0.08cm}$ o no.

En principio, podemos utilizar las mismas técnicas para seleccionar modelos: fijadas las probabilidades a priori de cada modelo, calculamos las a posteriori y seleccionamos el modelo probable. $\\[0.5cm]$

**Ejemplo:**

Supongamos que queremos contrastar:

$$H_{0}: \theta \leq 0.5$$
$$H_{1}: \theta > 0.5$$

Dada la a priori Beta(5,5) empleada anteriormente, entonces $\hspace{0.08cm}P\left ( H_{0} \right )=\int_{0}^{0.5}f(\theta)d\theta=0.5\hspace{0.08cm}$ y luego, a posteriori:

$$P\left ( H_{0}|datos \right )\hspace{0.08cm}=\hspace{0.08cm}\int_{0}^{0.5} \frac{1}{B(14,8)}\theta^{14-1}\left ( 1-\theta \right )^{8-1}d\theta\hspace{0.08cm}=\hspace{0.08cm}0.0946$$

Dada la regla de decisión de rechazar $\hspace{0.08cm}H_{0}\hspace{0.08cm}$ si su probabilidad a posterior es menor que 0.05, no rechazaríamos esta hipótesis.

¿Hay algún problema con esta idea?

Aunque parezca que no hay ningun problema, hay que darse cuenta que las probabilidades tienen que sumar 1, por lo que la $\hspace{0.08cm}P\left ( H_{1}|datos \right )\hspace{0.08cm}$ será la complementaria a la de $\hspace{0.08cm}H_{0}\hspace{0.08cm}$, por lo que en este enfoque no tiene sentido el concepto de p-valor y para este caso rechazaríamos la hipótesis nula ya que la probabilidad a posteriori de la hipótesis alternativa es mayor que la de la nula.

<br>

## Predicción <a class="anchor" id="1"></a>

Supongamos que queremos predecir el valor de una nueva variable $\mathbf{Y}$. 

Entonces:

$$f\left ( \mathbf{y}|datos \right )=\int f\left (\mathbf{y}|\theta,datos \right )f\left (\theta|datos \right )d\theta$$ 

y en muchas ocasiones, $\hspace{0.08cm}\mathbf{Y}\hspace{0.08cm}$ es condicionalmente independiente de los datos dado $\theta$, y luego:

$$f\left ( \mathbf{y}|datos \right )=\int f\left (\mathbf{y}|\theta \right )f\left (\theta|datos \right )d\theta$$

Veamos un ejemplo de esto y terminamos con este artículo.
Supongamos que queremos calcular la distribución del $\hspace{0.08cm}\mathbf{X}\hspace{0.08cm}$="número de cruces en 10 tiradas más de la moneda".

Tenemos $\hspace{0.08cm}X|\theta \sim Binomial(10,\theta)$, y $\theta|datos \sim Beta(14,8)\hspace{0.08cm}$. 

Entonces:

$$P\left ( \mathbf{X}=\mathbf{x}|datos \right )=\int_{0}^{1}\binom{10}{x}\theta^{x}\left ( 1-\theta \right )^{10-x}\frac{1}{B(14,8)}\theta^{14-1}\left ( 1-\theta \right )^{8-1}d\theta\\$$

$$=\binom{10}{x}\frac{1}{B(14,8)}\int_{0}^{1}\theta^{14+x-1}\left ( 1-\theta \right )^{18-x-1}d\theta\\$$

$$=\binom{10}{x}\frac{B(14+x,18-x)}{B(14,8)}\int_{0}^{1}\frac{1}{B(14+x,18-x)}\theta^{14+x-1}\left ( 1-\theta \right )^{18-x-1}d\theta\\$$

$$=\binom{10}{x}\frac{B(14+x,18-x)}{B(14,8)}$$

para $x =0,1,...,10$

Como hemos podido ver las cuentas en el ámbito bayesiano no son tan amigables como en lo frecuentista. Ahora nos interesa el cálculo de la media de $\hspace{0.08cm}\mathbf{X}\hspace{0.08cm}$.

El cálculo directo a través de la distribución beta-binomial parece complicado. 

¿Existe una manera más sencilla? 

Pues afortunadamente sí, para los que pensaran al principio de este artículo... y estos conceptos para que me sirven, pues veréis, en este caso es de gran utilidad la antes mencionada Ley de las Esperanzas Iteradas.

$E[X|datos]\hspace{0.08cm}=\hspace{0.08cm}E[E[\mathbf{X}|\theta]|datos]\hspace{0.08cm}=\hspace{0.08cm}E[10\theta|datos]\hspace{0.08cm}=\hspace{0.08cm}10E[\theta|datos]\hspace{0.08cm}=\hspace{0.08cm}10\times \frac{14}{14+8}\hspace{0.08cm}=\hspace{0.08cm}6.364$


<br>

---

<br>

# Tabla Resumen <a class="anchor" id="1"></a>

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

<br>

---

<br>

# Bibliografía

- Wiper,M. (2022). Repaso de algunos resultados de probabilidad. [Presentación de PowerPoint]. Aula Global UC3M. $\\[0.5cm]$

- Wiper,M. (2022). Variables estadísticas, distribuciones  conjuntas, marginales y condicionales. [Presentación de PowerPoint]. Aula Global UC3M. $\\[0.5cm]$

- Wiper,M. (2022). Inferencia frecuentista. [Presentación de PowerPoint]. Aula Global UC3M. $\\[0.5cm]$

- Wiper,M. (2022). Inferencia bayesiana. [Presentación de PowerPoint]. Aula Global UC3M. $\\[0.5cm]$

- Barrero Causil, C., Correa Morales, J. (2018). Introducción a la estadística bayesiana. Fondo Editorial ITM.

<br>
 

 

