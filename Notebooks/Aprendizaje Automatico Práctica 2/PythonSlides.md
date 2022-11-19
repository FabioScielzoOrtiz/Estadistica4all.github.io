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


## SymPy


## TensorFlow
## Pytorch


## NLKT 


---

# `Python` en la ciencia de datos

Hay más de 137000 librerias en Python, asi que esta ha sido una minuscula muestra de librerias, pero muchas de ellas son cruciales.

Sentiros libres de investigar por vuestra cuenta, Python es un mundo de posibilidades, tanto en el ambito de la ciencia de datos como fuera de él. 

Google es nuestro amigo.




---

# `Python` en la ciencia de datos 

- Existen varias formas de usar Python, lo mas común es usando un IDE (Integrated Development Environment).

- Los IDE's más usados son:

   - Jupyter Notebook (a través de Anaconda).
   -  Spider (parecido a R-studio).
   -  Visual Studio Code (el presente y futuro de los IDE's)


---
# `Python` en la ciencia de datos 

   -  Visual Studio Code (el presente y futuro de los IDE's).
        - Soporta multitud de lenguajes como Python, C, C++ , Java, R, HTML, CSS, Julia, Markdown, Go, Docker. Esta presentación esta hecha usando markdown en VS code !
      - Muchas extensiones útiles.
      - Buena integración con GitHub y Docker. 
  




---

# ¿Por qué dar el salto de R a Python?

- R es un entorno y lenguaje de programación con un enfoque al **análisis estadístico**.

- ¿Aprender más R o empezar con Python?

    - Empezar con Python

- Motivos por los que dar el salto de R a Python

    - 


---


# Pasar de R a Python

**¿ Por donde empezar ?**

Tres librarias de Python que nos podrian ser utiles en un comienzo:

- dfply
- plotnine
- rpy2


---
## dfply

- Libreria para manejo de data-frames que utiliza inspirada en la sintaxis de dplyr, una de las librerias de R más usadas para el manejo de data-frames
## Plotnine

- Libreria para visualización de datos que utiliza la gramática de ggplot (una de las librerias de R más usadas para visualización de datos). Básicamente es la version de ggplot en Python.

---
# Pasar de R a Python

¿ Por donde seguir ?

Recomendamos que, tras una etapa inicial usando dfply y plotnine, pasemos a sus versiones canonicas en Python, Pandas y Seaborn + Matplotlib.

Despues recomendamos tener una primera aproximacion a Numpy, ver cosas básicas. 

Luego estaria bien empezar a soltarnos con Sklearn y Statmodels.

---
# Pasar de R a Python

¿ Pero que es lo que debo hacer exactamente para aprender Python ?

Nuestra respuesta personal a esta pregunta es:

Haz proyectos de ciencia de datos que te motiven.
---