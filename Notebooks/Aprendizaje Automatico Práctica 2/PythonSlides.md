---
marp: true
author: Fabio Scielzo Ortiz y Marcos Álvarez 
theme: beamer
size: 4:3
header:  Python en la Ciencia de Datos 
footer: Madrid - UC3M
paginate: true
---

 

<!-- _class: title -->



# Python en la Ciencia de Datos

<br/>

<br/>

<br/>

<br/>

![bg 35%](uc3m.jpg)





**Fabio Scielzo Ortiz**
**Marcos Álvarez Martín** 


---
# Indice

- [El papel de `Python` en la ciencia de datos](#3)
- [¿Por qué dar el salto de `R` a `Python`?](#4)
 

---

# Advertencia

- No somos expertos en los temas que vamos a mencionar, solo meros aficionados. Por tanto las cosas que aqui expondremos no deberian tomarse como dogma de fe, ni mucho menos.

- Recomendamos que investigueis por vuestra cuenta sobre estos temas, acudiendo a personas que realmente sean expertos en la materia.

 

---
# `Python` en la ciencia de datos 



- `Python` es un lenguaje de programación de **proposito general** creado en 1991 por Guido van Rossum

- En los últimos años ha tenido mucho desarrollo orientado a la **ciencia de datos** $\hspace{0.2cm}\Rightarrow\hspace{0.2cm}$ Aparición y desarrollo de muchas librerias orientadas a la ciencia de datos.

---

# `Python` en la ciencia de datos 


- Algunas de las liberias de `Python` más usadas para ciencia de datos son:

   - Pandas
   - Numpy
   - Scipy
   - Matplotlib , Seaborn , Plotly
   - Sklearn , Statmodels


 
  


---
# `Python` en la ciencia de datos 

## Pandas
- Libreria orientada al manejo de data-frames. Es la libreria básica y fundamental que todo cientifico de datos debe dominar en Python. 


## Numpy

- Libreria orientada al manejo de vectores y matrices en Python. Fundamental a la hora de programar cosas sobre ciencia de datos. Es además notablemente más eficiente que Pandas. En este [artículo](https://fabioscielzoortiz.github.io/Estadistica4all.github.io/Articulos/Optimizando%20codigo%20en%20Python.html) hago una muestra de ello.

---
# `Python` en la ciencia de datos 

## Scipy

Es la libreria fundamental de Python para matematicas  computacionales. Provee modulos para optimización, integración, interpolación, problemas de autovalores, ecuaciones algebraicas, ecuaciones diferenciales, estadística y aún más.


---
## Matplotlib

Es la libreria más conocida para la visualización de datos en Python.

## Seaborn

Es otra libreria muy popular para visualización de datos. Se complementa bien con Matplotlib.

## Plotly

Es una de las librerias más usadas para la visualizacion interactiva de datos (visualización en movimiento).



---
# `Python` en la ciencia de datos 

- Algunas librerias más especializadas en cosas concretas:
  

   - JobLib
   - SymPy
   - Skforcast, PyGam, PyClustering
   - Pytorch , NLTK, TensorFlow
   - BeautifulSoup , Selenium 
   - Pyomo, Gurobi
   - Shiny , FastAPI
    
   - MLflow 

---

# `Python` en la ciencia de datos


## JobLib

Es una de las librerias más populares para paralelizar código de forma sencilla.

## SymPy

La libreria más relevante de Python para matematicas simbólicas. Los que esteis cursando la asignatura de optimizacion estais usando matematicas simbolicas en Matlab con la libreria (toolbox) Symbolic Math.

---

# `Python` en la ciencia de datos

## TensorFlow

Libreria de Python desarrollada por Google orientada al deep learning.
## Pytorch

Libreria orientada principalmente a la aplicación de deep learning a imagenes y videos (vision artifical). Aunque tambien se aplica en problemas de audio y texto.

## NLKT 

Libreria orientada al PLN (Procesamiento de Lenguaje Natural).

---
# `Python` en la ciencia de datos

## BeautifulSopu , Selenium

Librerias orientadas al web scrapping.

## Pyomo, Gurobi

Librerias orientadas a la investigación operativa.

---

# `Python` en la ciencia de datos

## Skforcast

Liberia para predicción de series temporales. 

## PyGam

Libreria que permite implementar modelos GAM (Modelos Aditivos Generalizados).

## PyClustering

Libreria orientada a la aplicación de algoritmos de clustering.

---
# `Python` en la ciencia de datos

## Shiny

- Libreria mítica de R que permite la creación de aplicaciones interacctivas orientadas a la ciencia de datos. Desde hace unos mese también está en Python.

## FastAPI

- Otra libreria popular para la creación de API's con Python.


---
# `Python` en la ciencia de datos

## MLflows

- Libreria que permite hacer ML Ops.

- ML Ops es un conjunto de prácticas que tiene como objetivo implementar y mantener modelos de aprendizaje automático en producción de manera confiable y eficiente

---

# `Python` en la ciencia de datos

- Hay más de 137000 librerias en Python, asi que esta ha sido una minuscula muestra de librerias, pero muchas de ellas son cruciales.

- Sentiros libres de investigar por vuestra cuenta, Python es un mundo de posibilidades, tanto en el ambito de la ciencia de datos como fuera de él. 

- Google es nuestro amigo.


---
# ¿Por qué dar el salto de R a Python?

- R es un entorno y lenguaje de programación con un enfoque al **análisis estadístico**.

- **¿Debería aprender más R o empezar a aprender Python?**

    - Opción ideal: empezar a aprender Python, sin dejar de aprender R

    -  Realidad: el tiempo es finito, en  muchas ocasiones es dificil lo anterior. En esos caso recomendamos priorizar Python sobre R.

---

# ¿Por qué dar el salto de R a Python?

- **Motivos por los que empezar a aprender Python**

   - Abre Linkedin, busca ofertas de empleo como cientifico de datos, estadistico, analista de datos, ingeniero de datos o cosas similares.

   - ¿En cuantas ofertas exigen conocimientos de R? $\hspace{0.2cm} \Rightarrow\hspace{0.2cm}$ en pocas probablemente.
   - ¿ EN cuantas ofertas exigen conocimientos de Python? $\hspace{0.2cm}\Rightarrow\hspace{0.2cm}$ en muchas probablemente.

- Esto ya es un buen motivo para aprender Python, no ?

 ---

 # ¿Por qué dar el salto de R a Python?


 - **Más motivos para aprender Python**

   - A nuestro criterio R tiene una sola ventaja respecto de Python, en algunos campos de la estadistica R tiene un mayor desarrollo que Python. Pero en los campos más demandados por las empresas Python está más desarrollado.

   -  Python es un lenguaje de proposito general, no solo es util para hacer cosas de estadistica. 

  - Aunque no os lo creais muchas personas consideran que Python es un lenguaje mas sencillo de aprender que R. De hecho uno de los motivos por los que es mas usado en las empresas es que los ingenieros se manejan mucho mejor con Python que con R, principalmente por el punto anterior.

---

# ¿Por qué dar el salto de R a Python?


**Motivo clave**

- La ciencia de datos es mucho más que coger un data-set, entrenar un modelo y hacer predicciones con él para una muestra de test. Hay toda un parte denominada puesta en producción de modelos que es igual o más importante que la anterior para las empresas.

- Poner un modelo en producción significa que el modelo va a operar en la vida real. Va a recibir datos, va a predecir en tiempo real y estos resultados van a ser usados.


---

# ¿Por qué dar el salto de R a Python?

- Poner un modelo de machine learning en produccion es un proceso complejo que involucra diferentes herramientas como Docker, Kubernetes,  computacion en la nube (Azure, Google Cloud, Amazon Web Service), y más.

- Python está mucho más desarrollado que R para la puesta en producción de modelos de machine learning, la libreria de MLflow es un buen ejemplo de ello. 
  
- Este es el punto fuerte de Python desde el punto de vista empresarial. Quiza el factor que mejor explica el por que del auge de Python en detrimento de R, en el ambito de la ciencia de datos.
---

- Ahora podemos entender mejor por que, pese a que Python arrasa a R en el mundo empresarial, en la academia R sigue reinando, aunque es posble que cada vez lo haga con menor fuerza.

- En la academia pocas veces es relevante la parte de puesta en producción de un modelo, por lo que una de las mayores virtudes de Python sobre R se disipa.

- Quiza ahora también pueda entenderse algo mejor por qué no hemos visto NADA de Python en este grado, hasta el día de hoy. 

---
# La transición de R a Python

**Nunca es tarde para empezar.**

<br>
 
Además, tenemos buenas noticias:

- El hecho de manejar con fluidez otro lenguaje de programación, como en nuestro caso es R, ayuda **muchisimo** a la hora de aprender un nuevo lenguaje, en este caso Python.

---
# La transición de R a Python

- En mi caso particular escribí mi primera sentencia en codigo Python en junio de este año (2022). Y creo haber aprendido en apenas 5 meses al menos igual de Python que lo que aprendí de R en 3 años de carrera.

- ¿ Cual es el secreto ?  
   - Luego lo comentaremos.

---
# La transición de R a Python

**¿ Por donde empezar con Python ?**

- Existen varias formas de usar Python en nuestro ordenador, lo mas común es usando un IDE (Integrated Development Environment).

- Los IDE's más usados son:

   - Jupyter Notebook ( a través de Anaconda ).
   -  Spider (parecido a R-studio)
   -  R-studio ( ¿O debería decir Posit ? )
   -  Visual Studio Code ( el presente y futuro de los IDE's )


---
# La transición de R a Python

**¿ Por donde empezar con Python ?**

   -  Visual Studio Code (el presente y futuro de los IDE's).
        - Soporta multitud de lenguajes como Python, C, C++ , Java, R, HTML, CSS, Julia, Markdown, Go, Docker. Esta presentación esta hecha usando markdown en VS code !
      - Muchas extensiones útiles.
      - Buena integración con GitHub y Docker. 
  
---
# La transición de R a Python

**¿ Por donde empezar ?**

Tres librarias de Python que nos podrian ser utiles en un comienzo:

- dfply
- plotnine
- rpy2


---

# La transición de R a Python

## dfply

- Libreria para manejo de data-frames que utiliza inspirada en la sintaxis de dplyr, una de las librerias de R más usadas para el manejo de data-frames
## Plotnine

- Libreria para visualización de datos que utiliza la gramática de ggplot (una de las librerias de R más usadas para visualización de datos). Básicamente es la version de ggplot en Python.



---
# La transición de R a Python

¿ Por donde seguir ?

Recomendamos que, tras una etapa inicial usando dfply y plotnine, pasemos a sus versiones canonicas en Python, Pandas y Seaborn + Matplotlib.

Despues recomendamos tener una primera aproximacion a Numpy, ver cosas básicas. 

Luego estaria bien empezar a soltarnos con Sklearn y Statmodels.

---
# La transición de R a Python

¿ Cual es el secreto para aprender Python ?

Nuestra respuesta personal a esta pregunta es:

- Haz proyectos de ciencia de datos que te motiven.

- Apoyate en libros, documentos y webs útiles

---
# La transición de R a Python

- Algunos ejemplos de webs de interés :
  
   - Cienciadedatos.net
        - Creada por Joaquin Amat Rodrigo
        - a
        - b
   - Web de la liberia Sklearn
        - a
        - b
---
# La transición de R a Python

- Ejemplos de libros de interés:   

---