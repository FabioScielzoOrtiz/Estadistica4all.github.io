---
title: 'Modelos de Clasificación No Supervisada'
author: 'Fabio Scielzo Ortiz'
date: '13/11/22'
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






> More articles in my blog:   $\hspace{0.1cm}$   [Estadistica4all](https://fabioscielzoortiz.github.io/Estadistica4all.github.io/)



<br>


# Problema de clasificación no supervisada


Un proble de clasificación supervisada  es un problema estadistico que consiste en predecir una variable respuesta **categorica** usando para ello informacion exclusivamente de unas variables predictoras, puesto que no se tienen datos sobre la respuesta (esta es la diferencia entre la clasificación no supervisada y la supervisada). 

A los prblemas de clasificación no supervisada tambien se les conoce como problemas de clustering.$\\[1cm]$



- Tenemos $p$ predictores  $\hspace{0.1cm}(\mathcal{X}_1 ,...,\mathcal{X}_p)\hspace{0.1cm}$ y una variable respuesta **categorica** $\hspace{0.1cm}\mathcal{Y} \\$ que es desconocida.


- Tenemos una muestra de tamaño $\hspace{0.1cm}n\hspace{0.1cm}$ de los $\hspace{0.1cm}p\hspace{0.1cm}$ predictores $\hspace{0.1cm}X_1,...,X_p\hspace{0.1cm}$  pero no tenemos muestra de la respuesta (elemento clave de la clasificación no supervisada), tampoco conocemos su recorrido, es decir, las categorias que la definen.

Port tanto tenemos la siguiente matriz de datos: $\\[0.8cm]$

$$D=[X_1,...,X_p]=\begin{pmatrix}
    x_{11}&x_{12}&...&x_{1p} \\
    x_{21}&x_{22}&...&x_{2p} \\
    ... &...& ...&...\\
    x_{n1}&x_{n2}&...&x_{np}
    \end{pmatrix} = \begin{pmatrix}
    x_{1} \\
    x_{2}  \\
     ...\\
     x_{n} 
    \end{pmatrix}$$


<br>


<br>


# k-medias


Es un modelo o algoritmo de clasificación no supervisada, en el sentido de que permite resolver problemas de clasificación no supervisada.

A continuación vamos a explicar su mécanica, partiendo de los elementos descritos en la sección anterior.

<br>

**Descripción no formal del algoritmo**






<br>





**Descripción formal del algoritmo**


$1)\hspace{0.1cm}$ Se considera que la variable respuesta $\hspace{0.1cm}\mathcal{Y}\hspace{0.1cm}$ tiene $\hspace{0.1cm} k\hspace{0.1cm}$ categorias $\hspace{0.1cm}g_1,...,g_k$ $\\[0.6cm]$


$2)\hspace{0.1cm}$  Se asignan aleatoriamente las observaciones disponibles $\hspace{0.1cm}x_1,...,x_n\hspace{0.1cm}$ de los predictores a dichas categorias, formandose clusters (o grupos) de observaciones $\hspace{0.1cm} C_1,...,C_k\hspace{0.1cm}$ , de un tamaño similar : $\\[0.4cm]$

$$C_j = \left( \hspace{0.12cm} x_i^t = (x_{i1},...,x_{ip}) \hspace{0.13cm}/\hspace{0.13cm} i \in I_j \subset \lbrace 1,...,n \rbrace \hspace{0.12cm} \right)^t \\$$

Donde $\hspace{0.1cm}I_j\hspace{0.1cm}$ es el conjunto de indices de las observaciones de los predictores que pertenecen al cluster $\hspace{0.1cm}C_j$. $\hspace{0.08cm}$ Por lo que puede verse como el conjunto de los individuos de la muestra asociados al cluster $\hspace{0.1cm} C_j$

Notese que $\hspace{0.1cm}I_j\hspace{0.1cm}$ es definido aleatoriamente en esta primera etapa. 

También hay que notar que $\hspace{0.1cm}C_j\hspace{0.1cm}$ es un vector cuyas componentes son vectores fila, luego es una matriz. Como además estos vectores fila son observaciones de variables estadisticas, puede verse como una matriz de datos. $\\[0.8cm]$


$3)\hspace{0.1cm}$  Se calculan los **centroides** de los clusters formados en el paso anterior.

El **centroide** de un cluster $\hspace{0.1cm} C_j\hspace{0.1cm}$  es definido en el algoritmo k-medias como la media de las observaciones del cluster. Si las observaciones son $\hspace{0.1cm}p$-dimensionales (como en este caso) el centroide será un vector de medias como centroide del cluster.


El **centroide** del cluster $\hspace{0.1cm}C_j\hspace{0.1cm}$ es $\hspace{0.2cm}\overline{x}_{C_j} = (\overline{X}_{1, C_j} ,...,\overline{X}_{p, C_j})$

Donde:

$$X_{r , C_j } = (\hspace{0.1cm} x_{ir} \hspace{0.1cm}/\hspace{0.1cm} i\in I_j \hspace{0.1cm})$$

Es decir, es la muestra de observaciones de $\hspace{0.1cm}\mathcal{X}_r\hspace{0.1cm}$ que aparecen en el cluster $\hspace{0.1cm}C_j$ $\\[0.8cm]$


$4)\hspace{0.1cm}$  Aplicado a la observación $\hspace{0.1cm}x_1$

Se asigna $\hspace{0.1cm}x_1 \hspace{0.1cm}$ al cluster que le queda mas cercano teniendo en cuenta su centroide, usando para ello una medida de distancia $\hspace{0.1cm}\delta$

Se calculan las distancia entre la observacion $\hspace{0.1cm} x_1\hspace{0.1cm}$ y los centroides de cada cluster:

$$\delta(x_1, \overline{x}_{C_1}) \hspace{0.1cm},\hspace{0.1cm} \delta(x_1, \overline{x}_{C_2}) \hspace{0.1cm},...,\hspace{0.1cm} \delta(x_1, \overline{x}_{C_k})$$

Se asigna $\hspace{0.1cm}x_1\hspace{0.1cm}$ al cluster que minimiza estas distancias. Es decir, al cluster del que está mas cerca.



Por tanto, el algoritmo asigna $\hspace{0.1cm}x_1\hspace{0.1cm}$ al cluster $\hspace{0.1cm}C_{j^*}\hspace{0.1cm}$ tal que: $\\[0.5cm]$

$$j\hspace{0.1cm}^{*} \hspace{0.1cm}=\hspace{0.1cm} arg \hspace{0.15cm} \underset{j}{Min} \hspace{0.15cm} \delta(x_1 , \overline{x}_{C_j}) \\$$

 



$5)\hspace{0.1cm}$  Aplicado a la observación $\hspace{0.1cm} x_1$



- Si en la configuración aleatoria inicial de los clusterings $\hspace{0.1cm} x_1 \in C_{j\hspace{0.08cm}^*}\hspace{0.1cm}$ $\Rightarrow \hspace{0.2cm}$  Aplicar 4) y 5) para la siguiente observación $(x_2) \\$

 
- Si en la configuracion aleatoria inicial de los clusterings $\hspace{0.1cm}x_1 \notin C_{j\hspace{0.08cm}^*}\hspace{0.1cm}$ , entonces:

Se modifica la configuración de los cluesterings del siguiente modo:

- $C_{j\hspace{0.08cm}^*}\hspace{0.1cm}$ ahora contiene a $x_1$

-  El cluster que contenia a $\hspace{0.1cm}x_1\hspace{0.1cm}$ ahora ya no lo contiene

Se recalculan los centroides de los clusters para la nueva configuracion de clusters.

Se aplica 4) y 5) de nuevo a la observacion $\hspace{0.1cm}x_1\hspace{0.1cm}$

$\\[0.8cm]$

$6)\hspace{0.1cm}$  Cuando el paso 4) y 5) se hayan aplicado a todas las observaciones $\hspace{0.1cm}x_1,...,x_n\hspace{0.1cm}$, se detiene el algoritmo, obteniendose la configuración definitiva de clusters, y con ello las predicciones de la respuesta.

Para las observaciones $\hspace{0.1cm} x_i \in C_j\hspace{0.1cm}$ se predice la respuesta como $\hspace{0.1cm}\hat{y}_i = g_j\hspace{0.1cm}$

Una tarea posterior es la interpretar la categoria $\hspace{0.1cm}g_j\hspace{0.1cm}$ , puesto que desconocemos a que hace referencia al no tener esa info sobre la respuesta

 
<br>

 

----

<br>


***Observaciones:***

 

**Los predictores en k-medias deben ser cuantitativos**


¿Por qué?  $\hspace{0.15cm}\Rightarrow\hspace{0.15cm}$ Por como se definen los centroides, son medias de variables, y la media solo deberia aplicarse a variables cuantitativas.

<br>


**¿Qué medidas de distancias pueden usarse en k-medias ?**

En k-medias hay que calcular la distancia entre las observaciones de  predictores $x_i$ y los centroides, que son un vector numerico, pero no un vector de observaciones de variables estadisticas.

Hay distancias que no se pueden aplicar en esta contexto, como por ejemplo: 

- La distancias de Pearson y Mahalanobis, puesto que solo esta definida para pares de vectores de observaciones de variables estadisticas,  luego no puede aplicarse a ellos las distancias de Pearson y Mahalanobis.$\\[0.5cm]$

- Las distancias de Sokal y Jaccard, por ser distancias definidas para vectores numericos binarios (de ceros y unos), y al ser k-medias solo aplicable a variables cuantitativas, los vectores de observaciones no sera binarios ni tampoco los centroides, luego no puede aplicarse a ellos las distancias de Sokal y Jaccard. $\\[0.5cm]$

- La distancia de coincidencias, por ser definida para vectores numericos multi-clase , y al ser k-medias solo aplicable a variables cuantitativas, los vectores de observaciones no serán multi-clase y los centroides tampoco, luego no puede aplicarse a ellos la distancia de coincidencias. $\\[0.5cm]$

- La distancia de Gower y Gower-Mahalanobis, al ser distancias definida sobre pares de vectores de tipo mixto (componentes cuantitativas, pero tambien binarias y multi-clase), y como el k-medias solo esta definido para variables cuantitativas, los vectores de observaciones no serán de tipo mixto, y los centroides tampoco, luego no puede aplicarse a ellos la distancia de Gower, ni la de Gower-Mahalanobis, la cual además involucra a la distancia de Mahalanobis que no se puede aplicar con k-medias por lo ya comentado.  $\\[0.5cm]$



Ejemplos de distancias que si pueden aplicarse con k-medias, ya que estan definidas para pares de vectores numéricos (no necesariamente observaciones de variables estadisticas, son los siguientes:

- Distancia Euclidea.  $\\[0.4cm]$

- Distancia Minkowski.  $\\[0.4cm]$
 
- Distancia Canberra.  $\\[0.4cm]$

- Distancia coseno.









<br>

## Varianzas intra-cluster


La varianza intra-cluster de un cluster cualquiera $C_j$ , definida en base a la distancia Euclidea, es: $\\[0.4cm]$

$$\sum_{i \in I_j} \hspace{0.2cm} \delta(x_i , \overline{x}_{C_j})_{Euclidea}\\ $$






Se puede demostrar que este algoritmo hace disminuir con cada nueva configuración de clusters la suma de varizas intra-clustera:

Es decir, para cada nueva configuración de clusters se reduce la siguiente cantidad: $\\[0.5cm]$


$$\sum_{j=1}^{k} \hspace{0.2cm} \sum_{i \in I_j} \hspace{0.2cm} \delta(x_i , \overline{x}_{C_j})_{Euclidea} \\$$

Donde: 

- $\hspace{0.2cm} i \in I_j \hspace{0.2cm} \Leftrightarrow \hspace{0.2cm} x_{i} \in C_j \\$

- $\hspace{0.2cm} \overline{x}_{C_j}$ es el centroide del cluster $C_j$



<br>

## Interpretación de los clusters en k-medias





<br>

## k-medias en `Python` con algoritmo de creación propia  <a class="anchor" id="2"></a>




Cargamos los datos con los que vamos a trabajar:

```python
import pandas as pd
```


```python
Data = pd.read_csv('House_Price_Regression.csv')

Data = Data.loc[:, ['latitude', 'longitude', 'price', 'size_in_m_2']]

Data.head()
```
```
    latitude  longitude    price  size_in_m_2
0  25.113208  55.138932  2700000   100.242337
1  25.106809  55.151201  2850000   146.972546
2  25.063302  55.137728  1150000   181.253753
3  25.227295  55.341761  2850000   187.664060
4  25.114275  55.139764  1729200    47.101821
```


```python
def k_means(k , Data, random_seed, Distance, q=1):  # Por ahora el k máximo aceptado es k=4

#########################################################################################

# Librerias necesarias

    from sklearn.utils import resample

    import numpy as np

    import pandas as pd

    import math

#########################################################################################

    # Definición de las distancias:


    ## Distancia Euclidea:

    def Dist_Euclidea(x_i, x_r):

        Dist_Euclidea = ( ( x_i - x_r )**2 ).sum()

        Dist_Euclidea = np.sqrt(Dist_Euclidea)

        return Dist_Euclidea


    ## Distancia Minkowski:

    def Dist_Minkowski(x_i, x_r, q):

        Dist_Minkowski = ( ( ( abs( x_i - x_r) )**q ).sum() )**(1/q)

        return Dist_Minkowski


    ## Distancia Canberra:

    def Dist_Canberra(x_i, x_r):

        numerator =  abs( x_i - x_r )

        denominator =  ( abs(x_i) + abs(x_r) )
       
        numerator=np.array([numerator], dtype=float)

        denominator=np.array([denominator], dtype=float)

        # The following code is to eliminate zero division problems

        Dist_Canberra = ( np.divide( numerator , denominator , out=np.zeros_like(numerator), where=denominator!=0) ).sum() 

        return Dist_Canberra

   

#########################################################################################


    #Configuracion inicial aleatoria de los clusters:

    n=len(Data)


    elementos_clusterizados = []

    m = resample(range(0, n), n_samples=math.floor(n/k) , replace=False, random_state=random_seed)

    Cluster_0 = Data.loc[m,:]

    elementos_clusterizados.append(m)


##############################


    if k >= 2:


        # Si los elementos que quedan por clusterizar menos el tamaño de los clusters es menor que el propio tamaño de los clusters,
        #  se meten todos los elementos que quedan por clusterizar en un mimsmo cluster que será ademas el ultimo.

        if len(np.delete(range(0,n), elementos_clusterizados)) - n/k  < n/k : 

            Cluster_1 = Data.loc[np.delete(range(0,n), elementos_clusterizados),:]

            elementos_clusterizados.append(m)

        else:

            m = resample(np.delete(range(0,n), elementos_clusterizados), n_samples=math.floor(n/k) , replace=False, random_state=random_seed)

            Cluster_1 = Data.loc[m,:]

            elementos_clusterizados.append(m)

    elif k < 2 :

        pass

###############################

    if k >= 3:

# Si los elementos que quedan por clusterizar menos el tamaño de los clusters es menor que el propio tamaño de los clusters,
#  se meten todos los elementos que quedan por clusterizar en un mimsmo cluster que será ademas el ultimo.


        if len(np.delete(range(0,n), elementos_clusterizados)) - n/k  < n/k : 

            Cluster_2 = Data.loc[np.delete(range(0,n), elementos_clusterizados),:]

            elementos_clusterizados.append(m)

        else:

            m = resample(np.delete(range(0,n), elementos_clusterizados), n_samples=math.floor(n/k) , replace=False, random_state=random_seed)

            Cluster_2 = Data.loc[m,:]

            elementos_clusterizados.append(m)

    elif k < 3 :

        pass

###############################

    if k >= 4:

# Si los elementos que quedan por clusterizar menos el tamaño de los clusters es menor que el propio tamaño de los clusters,
#  se meten todos los elementos que quedan por clusterizar en un mimsmo cluster que será ademas el ultimo.


        if len(np.delete(range(0,n), elementos_clusterizados)) - n/k  < n/k : 

            Cluster_3 = Data.loc[np.delete(range(0,n), elementos_clusterizados),:]

            elementos_clusterizados.append(m)

        else:

            m = resample(np.delete(range(0,n), elementos_clusterizados), n_samples=math.floor(n/k) , replace=False, random_state=random_seed)

            Cluster_3 = Data.loc[m ,:]

            elementos_clusterizados.append(m)

    elif k < 4 :

          pass


#########################################################################################


    lista_clusters = [None] * 4

    lista_clusters[0] = Cluster_0
    lista_clusters[1] = Cluster_1
    lista_clusters[2] = Cluster_2
    lista_clusters[3] = Cluster_3

   # Calculo de centroides iniciales

    centroide_0 = lista_clusters[0].mean()
    centroide_1 = lista_clusters[1].mean()
    centroide_2 = lista_clusters[2].mean()
    centroide_3 = lista_clusters[3].mean()

   # Calculo de distancias para la observacion x_1

    x_1 = Data.iloc[0,:]

    if Distance == 'Euclidea' :

        distancia_0 = Dist_Euclidea(x_1 , centroide_0) 
        distancia_1 = Dist_Euclidea(x_1 , centroide_1) 
        distancia_2 = Dist_Euclidea(x_1 , centroide_2) 
        distancia_3 = Dist_Euclidea(x_1 , centroide_3)

    if Distance == 'Minkowski' :

        distancia_0 = Dist_Minkowski(x_1 , centroide_0, q)
        distancia_1 = Dist_Minkowski(x_1 , centroide_1, q) 
        distancia_2 = Dist_Minkowski(x_1 , centroide_2, q) 
        distancia_3 = Dist_Minkowski(x_1 , centroide_3, q)        

    if Distance == 'Canberra' :

        distancia_0 = Dist_Canberra(x_1 , centroide_0)
        distancia_1 = Dist_Canberra(x_1 , centroide_1) 
        distancia_2 = Dist_Canberra(x_1 , centroide_2) 
        distancia_3 = Dist_Canberra(x_1 , centroide_3)      

    # Calculo de cluster optimo para x_1

    df_distancias = pd.DataFrame({'Distancias' : [distancia_0, distancia_1 , distancia_2 , distancia_3], 'Cluster': [0,1,2,3]})

    df_distancias_sort = df_distancias.sort_values(by='Distancias', ascending=False)

    j_star = df_distancias_sort.iloc[0]['Cluster']

    j_star = int(j_star)


#########################################################################################

    i = 1

    while i <= n-2 :

        for j in range(0, k) :


           # Si x_i no esta en el cluster j --> pasamos a analizar otro cluster j

            if sum(lista_clusters[j].index == i-1) ==  0 :

                    pass


        # Si x_i esta en el cluster j y es el cluster optimo de x_i --> pasamos a x_i+1

            if ( sum(lista_clusters[j].index == i-1) != 0 )  & ( j_star == j ) :

            # Actualizamos i a i+1

                i = i + 1


            # calculamos las distancias entre x_i+1 y los centroides

                x_i = Data.iloc[ i ,:] # x_{i+1}

                if Distance == 'Euclidea' :

                    distancia_0 = Dist_Euclidea(x_i , centroide_0) 
                    distancia_1 = Dist_Euclidea(x_i , centroide_1) 
                    distancia_2 = Dist_Euclidea(x_i , centroide_2) 
                    distancia_3 = Dist_Euclidea(x_i , centroide_3)

                if Distance == 'Minkowski' :

                    distancia_0 = Dist_Minkowski(x_i , centroide_0, q)
                    distancia_1 = Dist_Minkowski(x_1 , centroide_1, q) 
                    distancia_2 = Dist_Minkowski(x_1 , centroide_2, q) 
                    distancia_3 = Dist_Minkowski(x_1 , centroide_3, q)        

                if Distance == 'Canberra' :

                    distancia_0 = Dist_Canberra(x_i , centroide_0)
                    distancia_1 = Dist_Canberra(x_i , centroide_1) 
                    distancia_2 = Dist_Canberra(x_i , centroide_2) 
                    distancia_3 = Dist_Canberra(x_i , centroide_3)     


               # Calculo de cluster optimo para x_1

                df_distancias = pd.DataFrame({'Distancias' : [distancia_0 , distancia_1 , distancia_2, distancia_3], 'Cluster': [0,1,2,3]})

                df_distancias_sort = df_distancias.sort_values(by='Distancias', ascending=False)

                j_star = df_distancias_sort.iloc[0]['Cluster']

                j_star = int(j_star)


        # Si x_i esta en el cluster j pero ese no es el cluster optimo de x_i 

            if ( sum(lista_clusters[j].index == i-1) != 0 )  & ( j_star != j ) : 

               ## Actualizamos los clusters:

               # Añadimos x_i al cluster j_star :

                lista_clusters[j_star] = pd.concat( [ lista_clusters[j_star] , lista_clusters[j].loc[i-1,:].to_frame().T ]  )  

            
               # Eliminamos x_1 del cluster j :

                lista_clusters[j] = lista_clusters[j].drop(i-1)   


              # Recalculo de centroides para la nueva configuracion de clusters

                centroide_0 = lista_clusters[0].mean()
                centroide_1 = lista_clusters[1].mean()
                centroide_2 = lista_clusters[2].mean()
                centroide_3 = lista_clusters[3].mean()

              # Recalculo de distancias de x_i respecto los centroides:

                x_i = Data.iloc[ i ,:] # x_i

                if Distance == 'Euclidea' :

                    distancia_0 = Dist_Euclidea(x_i , centroide_0) 
                    distancia_1 = Dist_Euclidea(x_i , centroide_1) 
                    distancia_2 = Dist_Euclidea(x_i , centroide_2) 
                    distancia_3 = Dist_Euclidea(x_i , centroide_3)

                if Distance == 'Minkowski' :

                    distancia_0 = Dist_Minkowski(x_i , centroide_0, q)
                    distancia_1 = Dist_Minkowski(x_i , centroide_1, q) 
                    distancia_2 = Dist_Minkowski(x_i , centroide_2, q) 
                    distancia_3 = Dist_Minkowski(x_i , centroide_3, q)        

                if Distance == 'Canberra' :

                    distancia_0 = Dist_Canberra(x_i , centroide_0)
                    distancia_1 = Dist_Canberra(x_i , centroide_1) 
                    distancia_2 = Dist_Canberra(x_i , centroide_2) 
                    distancia_3 = Dist_Canberra(x_i , centroide_3)    


# Clusters finales --> lista_clusters

    return(lista_clusters)
```

<br>

Probamos el algoritmo con la distancia Euclidea y el $k$ máximo que admite, es decir, $k=4$

```python
lista_clusters = k_means(k=4 , Data=Data, random_seed=123, Distance='Euclidea') # Tarda solo 18.8 segundos 
```

<br>

Podemos acceder a los clusters generados por el algoritmo. Los cluster son un data frame con ciertas observaciones de los predictores, aquellas que pertenecen al cluster en sí.

```python
lista_clusters[0]
```
```
       latitude  longitude       price  size_in_m_2
1004  25.087251  55.145574   2990000.0   162.208638
43    25.091487  55.172015   1150000.0   105.259099
1214  25.078367  55.140410   1650000.0   166.575079
351   25.111108  55.137591   1699000.0   124.304214
182   25.064767  55.138814    875000.0   123.282281
...         ...        ...         ...          ...
1871  25.099380  55.141275   1352888.0    69.212735
1877  25.072573  55.131009   1499000.0   175.029252
1879  25.203553  55.345554    890000.0    70.606280
1883  25.072569  55.126527   1970000.0    81.940446
1885  25.103972  55.149621  31440000.0   607.771426

[517 rows x 4 columns]
```



<br>

```python
lista_clusters[1]
```
```
       latitude  longitude      price  size_in_m_2
1041  25.026191  55.156948   350000.0    35.117334
1282  25.198796  55.271342  2500000.0   168.804751
1476  25.081955  55.138863   690000.0    66.332742
1251  25.077150  55.135515  1550000.0   127.648722
1091  25.206412  55.275199  3950000.0   243.498763
...         ...        ...        ...          ...
1868  25.207533  55.277978  2300000.0   170.569908
1889  25.106668  55.149275  1400000.0   108.975219
1890  25.072954  55.128089  3800000.0   167.875721
1897  25.153080  55.254242   360000.0    55.741800
1901  25.166145  55.276684  1230000.0    70.606280

[378 rows x 4 columns]
```

<br>

```python
lista_clusters[2]
```
```
       latitude  longitude      price  size_in_m_2
539   25.068729  55.139815   820000.0    59.457920
730   25.093469  55.173061  1220000.0   119.008743
1472  25.064191  55.216245   380000.0    63.081137
849   25.180869  55.271015   700000.0    66.239839
631   25.048095  55.206373   600205.0    74.786915
...         ...        ...        ...          ...
1573  25.078870  55.148529  1400000.0   157.006070
1857  25.078148  55.148277   400888.0    37.439909
1861  25.090987  55.385389   590000.0   101.635882
1864  25.081241  55.137946  2400000.0   171.127326
1865  25.209806  55.278974   795000.0    71.442407

[499 rows x 4 columns]
```

<br>

```python
lista_clusters[3]
```
```
       latitude  longitude      price  size_in_m_2
393   25.104115  55.148470  3150000.0   152.825435
397   24.999981  55.293818   930888.0    86.399790
404   25.233787  55.294217  1642777.0    92.717194
407   25.233787  55.294217  1550000.0    91.973970
415   25.076944  55.134135  2950000.0   139.633209
...         ...        ...        ...          ...
1891  25.226946  55.343628  7000000.0   377.929404
1893  25.073590  55.126352  2000000.0    79.617871
1894  25.191107  55.269910   980888.0   101.078464
1898  25.104330  55.148769  2700000.0    99.963628
1899  25.037477  55.221942   550000.0    78.688841

[511 rows x 4 columns]
```

<br>

También podemos calcular los centroides de cada cluster de la siguiente manera:

```python
lista_clusters[0].mean()
```
```
latitude       2.511612e+01
longitude      5.521077e+01
price          2.051995e+06
size_in_m_2    1.297637e+02

dtype: float64
```

```python
lista_clusters[1].mean()
```
```
latitude       2.511925e+01
longitude      5.521314e+01
price          1.967974e+06
size_in_m_2    1.280963e+02

dtype: float64
```

```python
lista_clusters[2].mean()
```
```
latitude       2.511636e+01
longitude      5.521152e+01
price          2.114565e+06
size_in_m_2    1.346380e+02

dtype: float64
```

```python
lista_clusters[3].mean()
```
```
latitude       2.511513e+01
longitude      5.521413e+01
price          2.179182e+06
size_in_m_2    1.332627e+02

dtype: float64
```


<br>

Probamos el algoritmo usando otras medidas de distancia, en este caso la de Minkowski, pero mantenemos $k=4$:

```python
lista_clusters = k_means(k=4 , Data=Data, random_seed=123, Distance='Minkowski', q=1)
```

```python
lista_clusters[0]
```

```
       latitude  longitude       price  size_in_m_2
382   25.196489  55.272126  15800000.0   488.019459
732   25.107984  55.244923   1700000.0   138.704179
1004  25.087251  55.145574   2990000.0   162.208638
1362  25.048660  55.209550    759000.0    83.148185
939   25.079900  55.131931   3615000.0   140.748045
...         ...        ...         ...          ...
1898  25.104330  55.148769   2700000.0    99.963628
1900  25.176892  55.310712   1500000.0   100.985561
1901  25.166145  55.276684   1230000.0    70.606280
1902  25.206500  55.345056   2900000.0   179.302790
1903  25.073858  55.229844    675000.0    68.748220

[1232 rows x 4 columns]
```


```python
lista_clusters[1]
```

```
       latitude  longitude      price  size_in_m_2
1041  25.026191  55.156948   350000.0    35.117334
1810  25.094635  55.171817  1600000.0   166.946691
1466  25.183133  55.256580  1698000.0   140.469336
1476  25.081955  55.138863   690000.0    66.332742
1746  25.086376  55.147360  1300000.0    76.366266
...         ...        ...        ...          ...
1888  25.071504  55.128579  1300000.0   171.220229
1892  24.865992  55.137958  1175000.0   301.656041
1894  25.191107  55.269910   980888.0   101.078464
1897  25.153080  55.254242   360000.0    55.741800
1899  25.037477  55.221942   550000.0    78.688841

[473 rows x 4 columns]
```

```python
lista_clusters[2]
```
```
      latitude  longitude      price  size_in_m_2
291  25.193703  55.271223  2700000.0   120.773900
323  25.137198  55.189006  2008000.0   125.233244
8    25.106668  55.149275  2100000.0   203.085958
102  25.195461  55.269463  1900000.0   133.594514
107  25.081622  55.141977  1845000.0   125.047438
..         ...        ...        ...          ...
437  25.066791  55.203684   424340.0    35.767655
439  25.115747  55.142615  3175000.0   211.911743
440  25.086726  55.145205  1500000.0   141.677075
444  25.181311  55.262507   900000.0    96.247508
453  25.070010  55.245729   778000.0    67.819190

[161 rows x 4 columns]
```

```python
lista_clusters[3]
```
```
      latitude  longitude       price  size_in_m_2
477  25.176670  55.272389    490000.0    52.304389
481  25.065886  55.138246   1700000.0   185.062776
484  25.082397  55.140660   1150000.0   129.692588
495  25.083330  55.144753   1575000.0   106.838450
502  25.090200  55.175145    750000.0    70.420474
507  25.193310  55.280919   2350000.0   172.613774
518  25.202977  55.280662   1430000.0    67.168869
527  25.184873  55.292277   1976504.0   108.231995
536  25.086886  55.173227   1999999.0   154.218980
551  25.189195  55.274878   1500000.0   121.981639
466  25.171461  55.275800   1246305.0    72.464340
469  25.109367  55.247980   1400000.0   126.162274
480  25.005442  55.293914   1400000.0   134.709350
494  25.195236  55.268641   3600000.0   239.968449
497  25.109367  55.247980    900000.0    92.903000
504  25.145181  55.288017   1400000.0   142.513202
505  25.240419  55.252770   1780000.0   111.483600
506  25.111902  55.138103   1754888.0   105.073293
519  25.088728  55.173310   1550000.0   131.736454
522  25.106668  55.149275   1150000.0   109.997152
524  25.109367  55.247980   1290000.0   126.533886
525  25.191680  55.280175   1700000.0    86.771402
526  25.089833  55.150625   2349000.0   276.758037
529  25.186573  55.282071    610000.0    44.314731
535  25.116492  55.141387   3450000.0   209.960780
539  25.068729  55.139815    820000.0    59.457920
542  25.091259  55.168657    950000.0    80.175289
544  25.215192  55.235827   7600000.0   194.445979
545  25.207533  55.277978   1500000.0    89.930104
550  25.221028  55.361808   3250000.0   378.208113
552  25.132519  55.151574   1950000.0    96.619120
553  25.072954  55.128089   2300000.0   158.306712
559  25.082004  55.142441   1400000.0   120.959706
563  25.089719  55.170481    850000.0    68.097899
565  24.948068  55.069311    550000.0    90.115910
569  25.077009  55.146035    699999.0    86.306887
571  25.092430  55.172975    900000.0   101.542979
574  25.049301  55.198896    350000.0    40.598611
576  25.103550  55.168509  34314000.0   889.639128
```

<br>

Probamos el algoritmo ahora con la distancia de Canberra:

```python
lista_clusters = k_means(k=4 , Data=Data, random_seed=123, Distance='Canberra')
```

<br>

```python
lista_clusters[0]
```

```
       latitude  longitude       price  size_in_m_2
1004  25.087251  55.145574   2990000.0   162.208638
43    25.091487  55.172015   1150000.0   105.259099
1214  25.078367  55.140410   1650000.0   166.575079
182   25.064767  55.138814    875000.0   123.282281
1846  25.195236  55.268641   3200000.0   158.771227
...         ...        ...         ...          ...
1883  25.072569  55.126527   1970000.0    81.940446
1885  25.103972  55.149621  31440000.0   607.771426
1889  25.106668  55.149275   1400000.0   108.975219
1890  25.072954  55.128089   3800000.0   167.875721
1895  25.081243  55.145120   1350000.0   146.600934

[484 rows x 4 columns]
```

<br>

```python
lista_clusters[1]
```

```
       latitude  longitude      price  size_in_m_2
1041  25.026191  55.156948   350000.0    35.117334
1700  25.004936  55.296535  1088888.0   126.812595
1810  25.094635  55.171817  1600000.0   166.946691
1746  25.086376  55.147360  1300000.0    76.366266
1589  25.186038  55.291750  1349888.0    98.012665
...         ...        ...        ...          ...
1898  25.104330  55.148769  2700000.0    99.963628
1899  25.037477  55.221942   550000.0    78.688841
1900  25.176892  55.310712  1500000.0   100.985561
1902  25.206500  55.345056  2900000.0   179.302790
1903  25.073858  55.229844   675000.0    68.748220

[549 rows x 4 columns]
```

<br>

```python
lista_clusters[2]
```
```
       latitude  longitude      price  size_in_m_2
539   25.068729  55.139815   820000.0    59.457920
1070  25.233787  55.294217  1359000.0    91.973970
730   25.093469  55.173061  1220000.0   119.008743
786   25.086376  55.147360  2587000.0   112.505533
1472  25.064191  55.216245   380000.0    63.081137
...         ...        ...        ...          ...
1827  25.050227  55.213350   699505.0    78.038520
1828  25.137409  55.188957  2121000.0   128.020334
1831  25.073151  55.136982   950000.0    78.131423
1849  25.071246  55.140806   499000.0    62.430816
1897  25.153080  55.254242   360000.0    55.741800

[579 rows x 4 columns]
```

<br>

```python
lista_clusters[3]
```

```
       latitude  longitude      price  size_in_m_2
337   25.273623  55.283576  1500888.0   192.309210
348   25.192522  55.266317   799900.0    91.881067
393   25.104115  55.148470  3150000.0   152.825435
397   24.999981  55.293818   930888.0    86.399790
415   25.076944  55.134135  2950000.0   139.633209
...         ...        ...        ...          ...
1852  25.069265  55.128568   700000.0    54.905673
1856  25.071436  55.136065  1500000.0   224.082036
1858  25.078148  55.148277   760888.0    83.984312
1861  25.090987  55.385389   590000.0   101.635882
1901  25.166145  55.276684  1230000.0    70.606280

[293 rows x 4 columns]
```





<br>

<br>

## k-medias en `Python` con `sklearn`

Importamos los modulos de la libreria `sklearn`que utilizaremos:

```python
from sklearn.cluster import KMeans

from sklearn.metrics import silhouette_score
```

La función KMeans tiene los siguientes parametros disponibles:

```python
sklearn.cluster.KMeans(n_clusters=8, *, init='k-means++', n_init=10, max_iter=300, tol=0.0001, verbose=0, random_state=None, copy_x=True, algorithm='lloyd')
```

Se recomienda explorar el significado de cada uno de ellos en la documentación oficial de [`sklearn`](https://scikit-learn.org/stable/modules/generated/sklearn.cluster.KMeans.html#sklearn.cluster.KMeans)

<br>

```python

```

```python

```

```python

```

```python

```

```python

```

```python

```

```python

```

```python

```

```python

```

```python

```




<br>

<br>

# k-medoids



Es un modelo o algoritmo de clasificación no supervisada, en el sentido de que permite resolver problemas de clasificación no supervisada.

A continuacion vamos a explicar su mécanica, partiendo de los elementos descritos en la sección anterior.

<br>

**Descripción no formal del algoritmo**






<br>





**Descripción formal del algoritmo**


$1)\hspace{0.1cm}$ Se considera que la variable respuesta $\hspace{0.1cm}\mathcal{Y}\hspace{0.1cm}$ tiene $\hspace{0.1cm} k\hspace{0.1cm}$ categorias $\hspace{0.1cm}g_1,...,g_k$ $\\[0.6cm]$


$2)\hspace{0.1cm}$  Se asignan aleatoriamente las observaciones disponibles $\hspace{0.1cm}x_1,...,x_n\hspace{0.1cm}$ de los predictores a dichas categorias, formandose clusters (o grupos) de observaciones $\hspace{0.1cm} C_1,...,C_k\hspace{0.1cm}$ , de un tamaño similar : $\\[0.4cm]$

$$C_j = \left( \hspace{0.12cm} x_i^t = (x_{i1},...,x_{ip}) \hspace{0.13cm}/\hspace{0.13cm} i \in I_j \subset \lbrace 1,...,n \rbrace \hspace{0.12cm} \right)^t \\$$

Donde $\hspace{0.1cm}I_j\hspace{0.1cm}$ es el conjunto de indices de las observaciones de los predictores que pertenecen al cluster $\hspace{0.1cm}C_j$. $\hspace{0.08cm}$ Por lo que puede verse como el conjunto de los individuos de la muestra asociados al cluster $\hspace{0.1cm} C_j$

Notese que $\hspace{0.1cm}I_j\hspace{0.1cm}$ es definido aleatoriamente en esta primera etapa.  

También hay que notar que $\hspace{0.1cm}C_j\hspace{0.1cm}$ es un vector cuyas componentes son vectores fila, luego es una matriz. Como además estos vectores fila son observaciones de variables estadisticas, puede verse como una matriz de datos. $\\[0.8cm]$


$3)\hspace{0.1cm}$  Se calculan los **medoids** de los clusters formados en el paso anterior (lo que en k-medias eran los centroides).


Sea $\hspace{0.1cm}\delta\hspace{0.1cm}$ una medida de distancia;

El **medoid** de un cluster $\hspace{0.1cm} C_j\hspace{0.1cm}$  es $\hspace{0.12cm}\overline{x}_{C_j} = x_{i\hspace{0.05cm}^*}\hspace{0.1cm}$   $\\[0.5cm]$


Donde:

$$i\hspace{0.08cm}^* \hspace{0.1cm}=\hspace{0.1cm}  arg \hspace{0.15cm} \underset{i \in I_j}{Min} \hspace{0.15cm} \sum_{r \in I_j} \hspace{0.1cm} \delta(x_i , x_r) \\$$

Y es importante recordar que:

$$i \in I_j \hspace{0.2cm} \Leftrightarrow \hspace{0.2cm} x_{i} \in C_j \\$$


**Observación:**

Ell medoid de un cluster  es una observacion del propio cluster, concretamente la que minimiza la suma de las distancias entre esa observacion y cada una de las restantes observaciones del cluster. $\\[0.6cm]$




$4)\hspace{0.1cm}$  Aplicado a la observación $\hspace{0.1cm}x_1$

Se asigna $\hspace{0.1cm}x_1 \hspace{0.1cm}$ al cluster que le queda mas cercano teniendo en cuenta su medoid.

Se calculan las distancia entre la observacion $\hspace{0.1cm} x_1\hspace{0.1cm}$ y los **medoids** de cada cluster:

$$\delta(x_1, \overline{x}_{C_1}) \hspace{0.1cm},\hspace{0.1cm} \delta(x_1, \overline{x}_{C_2}) \hspace{0.1cm},...,\hspace{0.1cm} \delta(x_1, \overline{x}_{C_k})$$

Se asigna $\hspace{0.1cm}x_1\hspace{0.1cm}$ al cluster que minimiza estas distancias. Es decir, al cluster del que está mas cerca.



Por tanto, el algoritmo asigna $\hspace{0.1cm}x_1\hspace{0.1cm}$ al cluster $\hspace{0.1cm}C_{j\hspace{0.07cm}^*}\hspace{0.1cm}$ tal que: $\\[0.5cm]$

$$j\hspace{0.1cm}^{*} \hspace{0.1cm}=\hspace{0.1cm} arg \hspace{0.15cm} \underset{j=1,...,k}{Min} \hspace{0.15cm} \delta(x_1 , \overline{x}_{C_j}) \\$$

 



$5)\hspace{0.1cm}$  Aplicado a la observación $\hspace{0.1cm} x_1$



- Si en la configuración aleatoria inicial de los clusterings $\hspace{0.1cm} x_1 \in C_{j\hspace{0.08cm}^*}\hspace{0.1cm}$  $\Rightarrow \hspace{0.2cm}$ Aplicar 4) y 5) para la siguiente observación $(x_2) \\$

 
- Si en la configuracion aleatoria inicial de los clusterings $\hspace{0.1cm}x_1 \notin C_{j\hspace{0.08cm}^*}\hspace{0.1cm}$ $\Rightarrow \hspace{0.2cm}$ Se modifica la configuración de los cluesterings del siguiente modo:

    -  $C_{j\hspace{0.08cm}^*}\hspace{0.1cm}$ ahora contiene a $x_1$

    - El cluster que contenía a $\hspace{0.1cm}x_1\hspace{0.1cm}$ ahora ya no lo contiene

       - Después se recalculan los centroides de los clusters para la nueva configuracion de clusters.

       - Posteriormente se aplica 4) y 5) de nuevo a la observacion $\hspace{0.1cm}x_1\hspace{0.1cm} \\$


$6)\hspace{0.1cm}$  Cuando el paso 4) y 5) se hayan aplicado a todas las observaciones $\hspace{0.1cm}x_1,...,x_n\hspace{0.1cm}$, se detiene el algoritmo, obteniendose la configuración definitiva de clusters, y con ello las predicciones de la respuesta.

Para las observaciones $\hspace{0.1cm} x_i \in C_j\hspace{0.1cm}$ se predice la respuesta como $\hspace{0.1cm}\hat{y}_i = g_j\hspace{0.1cm}$

Una tarea posterior es la interpretar la categoria $\hspace{0.1cm}g_j\hspace{0.1cm}$ , puesto que desconocemos a que hace referencia al no tener esa info sobre la respuesta



 

<br>

---


**Observación: los predictores en k-medoids pueden ser tanto cuantitativos como caategoricos**


¿Por qué?  $\hspace{0.15cm}\Rightarrow\hspace{0.15cm}$ Por como se definen los medoids, si se usa una medida de distancia adecuada para conjuntos de predictores de tipo mixto, el k-medoids puede aplicarse a ese tipo de variables y la media solo deberia aplicarse a predictores que sean tanto cuantitativos como categoricos.


<br>

**¿Qué medidas de distancias pueden usarse en k-medoids ?**

En k-medoids hay que calcular la distancia entre las observaciones de  predictores $x_i$ y el resto de observaciones de cierto cluster, que son un vector observaciones de variables estadisticas. Por tanto toda medida de distancia definida para vectores de observaciones de variables estadisticas (o para vectores numericos en general) podrá usarse en k-medoids.

Esto es una gran ventaja respecto de k-medias, ya que las distancias que no podian usarse en k-medias si podrán usarse en k-medoids.

Hay distancias que no se pueden aplicar en esta contexto, como por ejemplo: 

- La distancias de Pearson y Mahalanobis, puesto que solo esta definida para pares de vectores de observaciones de variables estadisticas,  luego no puede aplicarse a ellos las distancias de Pearson y Mahalanobis.$\\[0.5cm]$

- Las distancias de Sokal y Jaccard, por ser distancias definidas para vectores numericos binarios (de ceros y unos), y al ser k-medias solo aplicable a variables cuantitativas, los vectores de observaciones no sera binarios ni tampoco los centroides, luego no puede aplicarse a ellos las distancias de Sokal y Jaccard. $\\[0.5cm]$

- La distancia de coincidencias, por ser definida para vectores numericos multi-clase , y al ser k-medias solo aplicable a variables cuantitativas, los vectores de observaciones no serán multi-clase y los centroides tampoco, luego no puede aplicarse a ellos la distancia de coincidencias. $\\[0.5cm]$

- La distancia de Gower y Gower-Mahalanobis, al ser distancias definida sobre pares de vectores de tipo mixto (componentes cuantitativas, pero tambien binarias y multi-clase), y como el k-medias solo esta definido para variables cuantitativas, los vectores de observaciones no serán de tipo mixto, y los centroides tampoco, luego no puede aplicarse a ellos la distancia de Gower, ni la de Gower-Mahalanobis, la cual además involucra a la distancia de Mahalanobis que no se puede aplicar con k-medias por lo ya comentado.  $\\[0.5cm]$



Ejemplos de distancias que   pueden aplicarse con k-medoids son:

- Distancia Euclidea.  $\\[0.4cm]$

- Distancia Minkowski.  $\\[0.4cm]$
 
- Distancia de Canberra.  $\\[0.4cm]$

- Distancia Coseno. $\\[0.4cm]$

- Distancia de Mahalanobis. $\\[0.4cm]$


- Distancia de Pearson. $\\[0.4cm]$


- Distancia de Sokal. $\\[0.4cm]$


- Distancia de Jaccard. $\\[0.4cm]$


- Distancia por coincidencias. $\\[0.4cm]$


- Distancia de Gower. $\\[0.4cm]$

- Distancia de Gower-Mahalanobis. 


<br>

## Interpretación de los clusters en k-medoids






<br>

<br>


## k-medoids en `Python` con algoritmo de creación propia


La idea es usar el programa usado en k-medias para programar el k-medoids, pero modificando aquello que les hace diferente, que no es más que la definición de los centroides-medoids. Por tanto el ejercicio a priori es simple, puesto que sustituyendo el calculo de centroides por el calculo de medoids en dicho programa, ya tendriamos programa que ejecuta el algoritmo k-medoids.

El problema es que el calculo de los medoids es computacionalmente muchisimo más costoso que el cálculo de los centroides. Y esta es una tarea que se puede llegar a repetir cientos de veces en el algoritmo, luego se requiere que su coste computacional sea bajo para que el algoritmo sea lo suficiente eficiente como para poder usarlo en la práctica.

El problema está en que, tal y como lo hemos programado, el calculo de los medoids de una configuarción de clusters dada tarda en torno a 7 minutos. Y como se ha dicho esta tarea es realizada por el algoritmo en multiples ocasiones (con la configuaracion inicial de clusters y cada vez que una observacion es asignada a un cluster que no es su óptimo, en el sentido de k-medoids). Por tanto, repetir esta tarea que tarda unos 7 minutos un número elevado de veces convierte a nuestro algoritmo en no-ejecutable en la practica.



La solución seria construir un programa alternativo que fuera mucho más eficiente. Por suerte esto existe, y esta en la libreria `kmedoids`, desarrollada por Erich Schubert y Lars Lenssen. En la siguiente sección exploraremos esta libreria.

A continuación vamos a mostrar como se calcularian los medoids para la configuracion inical de clusters, basandonos enteramente en el progrma que usamos para k-medias. 
Uno mismo puede comprobar que la ejecución de este codigo lleva demasiado tiempo, y la parte que lo relentiza es la del calculo de los medoids. 



 

<br>

```python
#Configuracion inicial aleatoria de los clusters:

n=len(Data)

k=4

elementos_clusterizados = []

m = resample(range(0, n), n_samples=math.floor(n/k) , replace=False, random_state=123)

Cluster_0 = Data.loc[m,:]

elementos_clusterizados.append(m)


###################################################################################


if k >= 2:

# Si los elementos que quedan por clusterizar menos el tamaño de los clusters es menor que el propio tamaño de los clusters,
#  se meten todos los elementos que quedan por clusterizar en un mimsmo cluster que será ademas el ultimo.


    if len(np.delete(range(0,n), elementos_clusterizados)) - n/k  < n/k : 

        Cluster_1 = Data.loc[np.delete(range(0,n), elementos_clusterizados),:]

        elementos_clusterizados.append(m)

    else:

        m = resample(np.delete(range(0,n), elementos_clusterizados), n_samples=math.floor(n/k) , replace=False, random_state=123)

        Cluster_1 = Data.loc[m,:]

        elementos_clusterizados.append(m)

elif k < 2 :

    pass

###################################################################################

if k >= 3:

# Si los elementos que quedan por clusterizar menos el tamaño de los clusters es menor que el propio tamaño de los clusters,
#  se meten todos los elementos que quedan por clusterizar en un mimsmo cluster que será ademas el ultimo.


    if len(np.delete(range(0,n), elementos_clusterizados)) - n/k  < n/k : 

        Cluster_2 = Data.loc[np.delete(range(0,n), elementos_clusterizados),:]

        elementos_clusterizados.append(m)

    else:

        m = resample(np.delete(range(0,n), elementos_clusterizados), n_samples=math.floor(n/k) , replace=False, random_state=123)

        Cluster_2 = Data.loc[m,:]

        elementos_clusterizados.append(m)

elif k < 3 :

    pass

###################################################################################

if k >= 4:

# Si los elementos que quedan por clusterizar menos el tamaño de los clusters es menor que el propio tamaño de los clusters,
#  se meten todos los elementos que quedan por clusterizar en un mimsmo cluster que será ademas el ultimo.


    if len(np.delete(range(0,n), elementos_clusterizados)) - n/k  < n/k : 

        Cluster_3 = Data.loc[np.delete(range(0,n), elementos_clusterizados),:]

        elementos_clusterizados.append(m)

    else:

        m = resample(np.delete(range(0,n), elementos_clusterizados), n_samples=math.floor(n/k) , replace=False, random_state=123)

        Cluster_3 = Data.loc[m ,:]

        elementos_clusterizados.append(m)

elif k < 4 :

    pass
```

```python
lista_clusters = [None] * 4

lista_clusters[0] = Cluster_0
lista_clusters[1] = Cluster_1
lista_clusters[2] = Cluster_2
lista_clusters[3] = Cluster_3
```

```python
# Se calcula la matriz de distancias para las observaciones del cluster 0 :

distancias_clusters_0 =  np.empty((len(lista_clusters[0]), len(lista_clusters[0])))

distancias_clusters_0[:] = 0

for i in range(0, len(lista_clusters[0])) :

    for r in  range(0, len(lista_clusters[0])) :

            distancias_clusters_0[i,r] = sum( (lista_clusters[0].iloc[i , :] - lista_clusters[0].iloc[r , :])**2 )



# Calculamos la suma de las distancia entre x_i y cada una de las restantes observaciones del cluster 0 , para cada observacion x_i del cluster 0.

suma_distancias_cluster_0 = []

for i in range(0, distancias_clusters_0.shape[0]):

    suma_distancias_cluster_0.append( distancias_clusters_0[i,:].sum() )


# Calculamos el medoid del cluster 0 :

medoids =[]

# np.where(suma_distancias_cluster_0 == min( suma_distancias_cluster_0 ) )[0] 
# es la fila de la matriz de distancias del cluster 0 asociada a la observacion x_i  que minimiza la suma de distancias entre x_i y cada una de las restantes observaciones del cluster 0 


# lista_clusters[0].iloc[ np.where(suma_distancias_cluster_0 == min( suma_distancias_cluster_0 ) )[0] , :].index 
# es el vérdadero índice de la observacion x_i que minimiza la suma de distancias entre x_i y el resto de observaciones del cluster 0

# Este es el valor que nos interesa, nos da el indice de la observacion que es el medoid del ccluster 0  

medoids.append( lista_clusters[0].iloc[ np.where(suma_distancias_cluster_0 == min( suma_distancias_cluster_0 ) )[0] , :].index )


##########################################################################################

# Repetimos el proceso anterior con los clusters restantes (en este caso hay k=4 clusters).

distancias_clusters_1 =  np.empty((len(lista_clusters[1]), len(lista_clusters[1])))

distancias_clusters_1[:] = 0

for i in range(0, len(lista_clusters[1])) :

    for r in  range(0, len(lista_clusters[1])) :

            distancias_clusters_1[i,r] = sum( (lista_clusters[1].iloc[i , :] - lista_clusters[1].iloc[r , :])**2 )



# Para el cluster 1 : calculamos la suma de la distancia entre x_i y el resto de observaciones, para cada i=1,..,n 

suma_distancias_cluster_1 = []

for i in range(0, distancias_clusters_1.shape[0]):

    suma_distancias_cluster_1.append( distancias_clusters_1[i,:].sum() )


medoids.append( lista_clusters[1].iloc[ np.where(suma_distancias_cluster_1 == min( suma_distancias_cluster_1 ) )[0] , :].index )

##########################################################################################

distancias_clusters_2 =  np.empty((len(lista_clusters[2]), len(lista_clusters[2])))

distancias_clusters_2[:] = 0

for i in range(0, len(lista_clusters[2])) :

    for r in  range(0, len(lista_clusters[2])) :

            distancias_clusters_2[i,r] = sum( (lista_clusters[2].iloc[i , :] - lista_clusters[2].iloc[r , :])**2 )



# Para el cluster 2 : calculamos la suma de la distancia entre x_i y el resto de observaciones, para cada i=1,..,n 

suma_distancias_cluster_2 = []

for i in range(0, distancias_clusters_2.shape[0]):

    suma_distancias_cluster_2.append( distancias_clusters_2[i,:].sum() )


medoids.append( lista_clusters[2].iloc[ np.where(suma_distancias_cluster_2 == min( suma_distancias_cluster_2 ) )[0] , :].index )

##########################################################################################

distancias_clusters_3 =  np.empty((len(lista_clusters[3]), len(lista_clusters[3])))

distancias_clusters_3[:] = 0

for i in range(0, len(lista_clusters[3])) :

    for r in  range(0, len(lista_clusters[3])) :

            distancias_clusters_3[i,r] = sum( (lista_clusters[3].iloc[i , :] - lista_clusters[3].iloc[r , :])**2 )



# Para el cluster 3 : calculamos la suma de la distancia entre x_i y el resto de observaciones, para cada i=1,..,n 

suma_distancias_cluster_3 = []

for i in range(0, distancias_clusters_3.shape[0]):

    suma_distancias_cluster_3.append( distancias_clusters_3[i,:].sum() )


medoids.append( lista_clusters[3].iloc[ np.where(suma_distancias_cluster_3 == min( suma_distancias_cluster_3 ) )[0] , :].index )
```

```python
# Ha tardado 7.38 mins en calcular los medoids, tarda demasiado. 

medoids 
```

```
[Int64Index([1002], dtype='int64'),
 Int64Index([67], dtype='int64'),
 Int64Index([1775], dtype='int64'),
 Int64Index([198], dtype='int64')]
```
<br>

Por tanto, el medoid del cluster $C_1$ es la observacion de  $x_{1002}$, el del cluster $C_2$ es la observacion $x_{67}$, el del $C_3$ es $x_{1775}$ y el del $C_4$ es $x_{198}$

<br>

El código anterior, con el que se caluclan los medoids de la configuracion inicial de clusters tardón en ejecutarse 7.38 minutos.




Como se dijo antes, hay que notar que en el algoritmo completo el calculo de los medoids (al igual que el de los centroides) se tiene que hacer muchas veces, no solo una, por lo que tardar 7 minutos en calcularlos cada vez hace que no podamos usar este programa para implementar k-medoids.



<br>

## k-medoids en `Python` con la libreria `kmedoids`








<br>

<br>

# Método de evaluación de modelos de clasificación no supervisada


Un método de evaluación de modelos de clasificación no supervisada es un método que permite evaluar un modelo de clustering usando una muestra de train de los predictores y una métrica de evaluación.

En este articulo nos centraremos en una métrica de evaluación denominada silhouette (silueta)



## Definición de la métrica Silhouette

Dado un modelo de clustering $M$ , como por ejemplo k-medias o k-medoids.

Supongamos que tras entrenar $M$ con las observaciones disponibles para los predictores tenemos que $x_i \in C_h \\$

La silueta de $x_i$ en el modelo de clustering $M$ es:

$$\mathcal{S}(x_i, M) \hspace{0.12cm}=\hspace{0.12cm} \dfrac{\overline{\delta}(i,r^*) - \overline{\delta}(i,h)}{Max \left\lbrace \hspace{0.12cm}\overline{\delta}(i,r^*) \hspace{0.12cm},\hspace{0.12cm} \overline{\delta}(i,h)\hspace{0.12cm} \right\rbrace}\\$$


Donde:


$$\overline{\delta}(x_i, C_h) \hspace{0.12cm}=\hspace{0.12cm} \dfrac{1}{\# C_h - 1} \cdot \sum_{r \in I_h} \hspace{0.1cm} \delta(x_i , x_r) \\$$

$$r^* \hspace{0.12cm}=\hspace{0.12cm} arg\hspace{0.12cm} \underset{r\neq j=1,..,k} {Min} \hspace{0.12cm} \overline{\delta}(x_i, C_r)\\$$  




**Observaciones:**


- En general

$$\overline{\delta}(x_i,C_j) \hspace{0.12cm} =\hspace{0.12cm} \dfrac{1}{\# C_j - 1} \cdot \sum_{r \in I_j} \hspace{0.1cm} \delta(x_i , x_r)$$

es la **media** de las distancias entre la observacion $x_i$ y el resto de observaciones del cluster $C_j$ , para todo $i=1,..,n$ y $j=1,..,k \\$


- $\hspace{0.12cm}\overline{\delta}(x_i, C_r^*) \hspace{0.12cm}=\hspace{0.12cm}  Min\hspace{0.12cm} \left\lbrace \hspace{0.12cm}  \overline{\delta}(x_i, C_r) \hspace{0.12cm} / \hspace{0.12cm} r\neq j = 1,...,k  \hspace{0.12cm} \right\rbrace$

<br>

**Interpretación de Silhouette:** $\\[0.6cm]$

- $\mathcal{S}(x_i) \in [-1,1] \\$

- Si $\hspace{0.12cm}\mathcal{S}(x_i) \in [0,1]\hspace{0.12cm}$, se considera que $\hspace{0.12cm}x_i\hspace{0.12cm}$ ha sido clasificado **correctamente**, y cuanto más cerca este $\hspace{0.12cm}\mathcal{S}(x_i)\hspace{0.12cm}$ de $\hspace{0.12cm}1\hspace{0.12cm}$ , **mejor** clasificado estará $\hspace{0.12cm}x_i \\$


- Por lo anterior, si $\hspace{0.12cm}\mathcal{S}(x_i) \in [-1,0]\hspace{0.12cm}$, se considera que $\hspace{0.12cm}x_i\hspace{0.12cm}$ ha sido clasificado **incorrectamente**, y cuanto más cerca este $\hspace{0.12cm}\mathcal{S}(x_i)\hspace{0.12cm}$ de $\hspace{0.12cm}-1\hspace{0.12cm}$ , **peor** clasificado estará $\hspace{0.12cm}x_i \\$


<br>

**Justificaciones:** $\\[0.6cm]$

- Si $\hspace{0.12cm}\overline{\delta}(x_i , C_h) < \overline{\delta}(x_i , C_r^*)\hspace{0.12cm}$, entonces,   la distancia media entre $\hspace{0.12cm}x_i\hspace{0.12cm}$ y el resto de observaciones del cluster $\hspace{0.12cm}C_h\hspace{0.12cm}$ es menor que la distancia media entre x_i y las observaciones del cluster más cernano em media, sin tener en cuenta $\hspace{0.12cm}C_h\hspace{0.12cm}$, es decir, $\hspace{0.12cm}C_{r^*}\hspace{0.12cm}$. Lo cual puede interpretarse como que x_i ha sido **bien** clasificado. $\\[0.6cm]$

- Si $\hspace{0.12cm}\overline{\delta}(x_i , C_h) < \overline{\delta}(x_i , C_r^*)\hspace{0.12cm}$, entonces $\hspace{0.12cm}\mathcal{S}(x_i) \in [0,1] \\$

    - Y cuanto más se cumpla $\hspace{0.12cm}\overline{\delta}(x_i , C_h) < \overline{\delta}(x_i , C_r^*)$ mas cerca estará $\hspace{0.12cm}\mathcal{S}(x_i)\hspace{0.12cm}$ de $\hspace{0.12cm}1 \\$
       
    - En el caso extremo de que $\hspace{0.12cm}\overline{\delta}(x_i , C_h) = 0 < \overline{\delta}(x_i , C_r^*)\hspace{0.12cm}$ , se tendrá que $\hspace{0.12cm}\mathcal{S}(x_i) =1 \\$ 

- Por lo anterior, si $\hspace{0.12cm}\mathcal{S}(x_i) \in [0,1]\hspace{0.12cm}$, se considera que $\hspace{0.12cm}x_i\hspace{0.12cm}$ ha sido clasificado correctamente, y cuanto más cerca este $\hspace{0.12cm}\mathcal{S}(x_i)\hspace{0.12cm}$ de $\hspace{0.12cm}1\hspace{0.12cm}$ , **mejor** clasificado estará $\hspace{0.12cm}x_i \\[1cm]$




- Si $\hspace{0.12cm}\overline{\delta}(x_i , C_h) > \overline{\delta}(x_i , C_r^*)\hspace{0.12cm}$, entonces,   la distancia media entre $x_i$ y el resto de observaciones del cluster $\hspace{0.12cm}C_h\hspace{0.12cm}$ es mayor que la distancia media entre $\hspace{0.12cm}x_i\hspace{0.12cm}$ y las observaciones del cluster más cernano em media, sin tener en cuenta $\hspace{0.12cm}C_h\hspace{0.12cm}$, es decir, $\hspace{0.12cm}C_{r^*}\hspace{0.12cm}$. Lo cual puede interpretarse como que $\hspace{0.12cm}x_i\hspace{0.12cm}$ ha sido **mal** clasificado. $\\[0.6cm]$

- Si $\hspace{0.12cm}\overline{\delta}(x_i , C_h) > \overline{\delta}(x_i , C_r^*)\hspace{0.22cm} \Rightarrow \hspace{0.22cm}\mathcal{S}(x_i) \in [-1,0] \\$

    - Cuanto más se cumpla $\hspace{0.12cm}\overline{\delta}(x_i , C_h) < \overline{\delta}(x_i , C_r^*)\hspace{0.12cm}$ mas cerca estará $\hspace{0.12cm}\mathcal{S}(x_i)\hspace{0.12cm}$ de $\hspace{0.12cm}-1 \\$ 
    
    - En el caso extremo de que $\hspace{0.12cm}\overline{\delta}(x_i , C_h) > \overline{\delta}(x_i , C_r^*)=0\hspace{0.12cm}$ , se tendrá que $\hspace{0.12cm}\mathcal{S}(x_i) =-1 \\$

- Por lo anterior, cuanto más cerca este $\hspace{0.12cm}\mathcal{S}(x_i)\hspace{0.12cm}$ de $\hspace{0.12cm}-1\hspace{0.12cm}$ , peor clasificado estará $\hspace{0.12cm}x_i \\$

- Por lo anterior, si $\hspace{0.12cm}\mathcal{S}(x_i) \in [-1,0]\hspace{0.12cm}$, se considera que $\hspace{0.12cm}x_i\hspace{0.12cm}$ ha sido clasificado **incorrectamente**, y cuanto más cerca este $\hspace{0.12cm}\mathcal{S}(x_i)\hspace{0.12cm}$ de $\hspace{0.12cm}-1\hspace{0.12cm}$ , **peor** clasificado estará $\hspace{0.12cm}x_i$



<br>


**Métrica Silhouette**

Se define la métrica Silhouette para un modelo de clustering $M$  como la media de las siluetas de las observaciones de los predictores:


$$\overline{\mathcal{S}} (M) \hspace{0.12cm} =  \hspace{0.12cm}  \dfrac{1}{n} \cdot \sum_{i=1}^n \mathcal{S}(x_i, M)$$ 



<br>

## Método de evaluación basado en Silhouette

Como estamos considerando modelos de aprendizaje supervisado en los que por definición no se tienen datos de la respuesta, aqui la idea de considerar muestras de train y test no tiene utilidad, puesto que el fundamento de esa idea es comparar las predicciones que el modelo hace para la respuesta con la muestra de test de la respuesta, pero en este caso no se tiene ninguna muestra (ni de train ni de test) de la respuesta. Es esto lo que caracteriza a los modelos no supervisados.

Por ello el método de evaluación basado en Silhouette consiste simplemente en usar la muestra disponible de los predictores como muestra de train, es decir, usarla para entrenar el modelo de clustering considerado, y con el modelo entrenado calcular la métrica Silhouette, antes definida.

Notese que la metrica Silhouette depende del modelo entrenado, al depender de los clusters finales que se obtienen tras entrenarlo. Por lo que para modelos de clustering que generen distintas configuraciones finales de clusters se obtendran valores distintos de la métrica Silhouette.


<br>

# Ajuste del hiper-parámetro k mediante Silhouette

A continuación vamos a exponer un método para seleccionar el hiper-parametro k de un modelo de clustering como k-medias o k-medoids basado en la metrica Silhouette.


Dado un modelo de clustering $M$ , como podría ser el k-medias o k-medoids.


1) Se entrena $M$ un número $B$ de veces con las mismas observaciones de los predictores, pero en cada ocasión se utiliza un valor del hiper-parametro $k$ distinto.

Por tanto, se obtienen los siguientes $B$ modelos entrenados: $\widehat{M}(k=k_1)  \hspace{0.12cm}, \hspace{0.12cm} \widehat{M}(k=k_2) \hspace{0.12cm}, ..., \hspace{0.12cm} \widehat{M}(k=k_B)$

Donde $\widehat{M}(k=k_j)$ es el modelo de clustering $M$, con hiper-parametro $k=k_1$, ya entrenado.


2) Se calcula la métrica Silhouette $\overline{\mathcal{S}}$ para cada uno de esos $B$ modelos:

$$\overline{\mathcal{S}}\left(\widehat{M}(k=k_1)\right)  \hspace{0.12cm}, \hspace{0.12cm} \overline{\mathcal{S}}\left(\widehat{M}(k=k_2)\right)  \hspace{0.12cm}, ..., \hspace{0.12cm} \overline{\mathcal{S}}\left(\widehat{M}(k=k_B)\right) \\$$ 


3) El valor óptimo del hiper-parametro $k^*$ es aque que maximixa la métrica Silhouette (de Silhouette media)


$$k^* \hspace{0.12cm}=\hspace{0.12cm} arg \hspace{0.2cm}\underset{k\in \lbrace k_1,...,k_B\rbrace}{Max} \hspace{0.2cm}\overline{\mathcal{S}}\left(\widehat{M}(k)\right)$$

Es decir: 

$$\text{Si} \hspace{0.4cm} \overline{\mathcal{S}}\left(\widehat{M}(k=k_j)\right) > \overline{\mathcal{S}}\left(\widehat{M}(k=k_r)\right) \hspace{0.2cm} , \forall r\neq j =1,...,B \hspace{0.12cm}\Rightarrow\hspace{0.12cm} k^* = k_j$$



<br>


# Selección de modelos de clasificación no supervisada mediante Silhouette


Vamos a exponer un método de selección de modelos de clustering basado en la métrica Silhouette.

Dados $\hspace{0.12cm}B\hspace{0.12cm}$ modelos de clustering $M_1\hspace{0.12cm},\hspace{0.12cm}M_2\hspace{0.12cm},...,\hspace{0.12cm}M_B$,  se selcciona aquel que tenga mayor Silhouette.

Es decir, bajo este método de selección de modelos:

Dados $\hspace{0.12cm}B\hspace{0.12cm}$ modelos de clustering $M_1\hspace{0.12cm},\hspace{0.12cm}M_2\hspace{0.12cm},...,\hspace{0.12cm}M_B$, el modelo seleccionado es $\hspace{0.12cm}M_{j\hspace{0.08cm}^*}$

Donde:

$$j\hspace{0.08cm}^* \hspace{0.12cm}=\hspace{0.12cm} arg \hspace{0.2cm} \underset{j \in \lbrace 1,...,B\rbrace}{Max} \hspace{0.2cm} \overline{\mathcal{S}}\left(\widehat{M}_j \right) $$


<br>

<br>

# Clustering y PCA








<br>

<br>


# Clustering y MDS










<br>

<br>

