---
title: 'Introducción a la Estadística Bayesiana'
author: 'Marcos Álvarez Martín. Fabio Scielzo Ortiz.'
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


AÑADIR ENLACE ARTICULO SOBRE PROBABILIDAD

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

