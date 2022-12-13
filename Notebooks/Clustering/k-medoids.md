---
title: 'k-medias'
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

 <div class="warning" style='background-color:#F7EBE8; color: #030000; border-left: solid #CA0B0B 7px; border-radius: 3px; size:1px ; padding:0.1em;'>
<span>

$\hspace{0.25cm}$ **k-medoids: versión de Park & Jun original**

 

- Se considera que la variable respuesta $\hspace{0.1cm}\mathcal{Y}\hspace{0.1cm}$ tiene $\hspace{0.1cm} k\hspace{0.1cm}$ categorias $\hspace{0.1cm}g_1,...,g_k$ $\\[0.4cm]$


----

$\hspace{0.25cm}$ **1) Definición de los clusters iniciales**

- Dada una medida de distancia $\hspace{0.1cm}\delta\hspace{0.1cm}$ definida para cada par $\hspace{0.1cm}(x_i , x_r)\hspace{0.1cm}$  de observaciones de los predictores.

    - Se calcula $\hspace{0.15cm}\delta(x_i, x_r)  \hspace{0.25cm} , \hspace{0.25cm} \forall\hspace{0.1cm} i,r \in \lbrace 1,...,n \rbrace\\ $  
    
- Se define la siguiente cantidad:

$$v_r \hspace{0.15cm} = \hspace{0.15cm} \sum_{i=1}^n \dfrac{d(x_r , x_i)}{\sum_{h=1}^n d(x_h,x_i)} \hspace{0.15cm} = \hspace{0.15cm} \dfrac{d(x_r , x_1)}{\sum_{h=1}^n d(x_h,x_1)}+\dots +\dfrac{d(x_r , x_n)}{\sum_{h=1}^n d(x_h,x_n)}$$ 

$\hspace{0.5cm}$ para $\hspace{0.1cm} r \in \lbrace 1,...,n \rbrace$


- Se ordenan de menor a mayor las cantidades $\hspace{0.1cm} v_1,...,v_n \hspace{0.2cm} \Rightarrow  \hspace{0.2cm} v_{(1)} < v_{(2)} < \dots < v_{(n)}$


- Los medoids de los clusters iniciales se definen como las observaciones asociadas a las cantidades $\hspace{0.1cm}v_{(1)}, v_{(2)},..., v_{(k)}$

    - El medoid del cluster $\hspace{0.1cm}C_r\hspace{0.1cm}$ es $\hspace{0.1cm}\overline{x}_{C_r} = x_{(r)}\hspace{0.1cm}$ , para $\hspace{0.1cm}r\in \lbrace 1,...,k \rbrace\hspace{0.1cm}$ con $\hspace{0.1cm}r<k$
    
    

- Se obtienen los clusters iniciales asignando cada observación $\hspace{0.1cm}x_1,...,x_n\hspace{0.1cm}$ al medoid que le queda más cercano.


- Formalmente, $x_i$ es asignado al cluster $C_{r^*}$

    - Donde:
    
      $$r^* = arg Min \delta(x_i , \overline{x}_{C_r})$$

----


$\hspace{0.25cm}$ **3) Cálculo de la suma de varianzas intra-cluster**


- Dada una medida de distancia $\hspace{0.1cm}\delta\hspace{0.1cm}$ , la suma de varianzas intra-cluster para la configuración de clusters $\hspace{0.1cm}C_1,...,C_k\hspace{0.1cm}$ se define como sigue:


$$V(C_1,...,C_k) = \sum_{r=1}^{k} \hspace{0.2cm} \sum_{i \in I_r} \hspace{0.2cm} \delta(x_i , \overline{x}_{C_r}) \\$$



- Se calcula $\hspace{0.12cm}V(C_1,...,C_k)\hspace{0.12cm}$, puesto que será la métrica en base a la cual se define el criterio de parada.



    - Es una medida de lo similares que son entre si las observaciones contenidas en un mismo cluster. Cuanto menor sea, mas similares son, y viceversa.

----

$\hspace{0.25cm}$ **4) Re-asignación de las observaciones a los clusters**



- Se calcula $\hspace{0.12cm} \delta(x_i , \overline{x}_{C_r}) \hspace{0.12cm}$


- Se re-asigna $\hspace{0.12cm}x_i\hspace{0.12cm}$ al cluster que le quede más cerca.

- Formalmente, $\hspace{0.12cm}x_i\hspace{0.12cm}$ es re-asignado al cluster $\hspace{0.12cm}r^*$

    $$r^* \hspace{0.12cm}=\hspace{0.12cm} arg \hspace{0.12cm} \underset{r}{Min} \hspace{0.12cm} \delta(x_i , \overline{x}_{C_r} )$$

    - Por tanto, $\hspace{0.12cm}x_i\hspace{0.12cm}$ es re-asignado al cluster $\hspace{0.12cm}C_{r^*}\hspace{0.12cm}$, que podria ser el cluster al que ya estaba asignada, o no. 


- Tras  re-asignar todas las observaciones $\hspace{0.12cm}x_1,...,x_n\hspace{0.12cm}$ se obtiene una **nueva** configuracion de clusters $\hspace{0.12cm}C_1^{1 },...,C_k^{1 }\hspace{0.12cm}$ , que generalmente será diferente de la anterior, aunque no necesariamente.

- El super-indice 1 indica que esta nueva configuración de clusters es la obtenida con la iteración 1 del algoritmo.

- Se calcula la suma de varianzas intra-cluster para la nueva configuracion de clusters obtenida en el paso anterior:

$$V(C_1^{\dagger },...,C_k^{\dagger })$$

----


$\hspace{0.25cm}$ **5) Iterar paso 4)**


- Se itera el paso **4)** un número $b$ de veces, asi se obtienen $b$ configuraciones de clusters, y con ello $b$ valores de la suma de varianzas intra-cluster.


---

$\hspace{0.25cm}$ **6) Selección de la configuracion de clusters definitiva**


- Tras los pasos anteriores  se habrán obtenido un total de $b+2$ configuraciones de clusters. $b$ en el paso **5)** , $1$ en el paso **1)** y $1$ en el paso **4)**.



$$\left\lbrace \hspace{0.15cm} V(C_1^{h},....,C_k^h) \hspace{0.12cm} / \hspace{0.12cm} h \in \lbrace 1,...,b+2\rbrace \hspace{0.15cm} \right\rbrace$$




- Se selecciona como configuración de clusters **definitiva** aquella que minimiza la suma de varianzas intra-cluster, de entre las $b+2$ obtenidas.

-  Formalmente, se seleccionan la configuración de clusters $C_1^{h^*},...,C_k^{h^*}$

     - Donde:
     
       $$h^*  \hspace{0.12cm}=\hspace{0.12cm} arg \hspace{0.12cm} \underset{h}{Min} \hspace{0.15cm} V(C_1^{h},....,C_k^h)$$ 
    
   
   
</p>
 
</p></span>
</div>

 
 <br>
