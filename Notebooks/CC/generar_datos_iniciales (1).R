# Esto no es realmente parte de la pr?ctica. 
# Simplemente estamos generando un fichero de datos para ser usado en scikit-learn despu?s
#   quit?ndonos de encima los character, los ordinales, y los missing values.
#   simplemente quedar?n algunas categ?ricas, para las que si que crearemos dummies en scikit-learn

# Libreria para guardar dataframes en R y cargarlos en Python
library(feather)
library(mlr3verse)
datos<-readRDS("disp_2.rds")

# Columnas character a factor

for(i in 1:ncol(datos)){
  if(is.character(datos[,i]))
  {datos[,i] <- as.factor(datos[,i])
  }
 }

# Codificamos los ordinales directamente como enteros

for(i in 1:ncol(datos)){
  if(is.ordered(datos[,i]))
  {datos[,i] <- as.integer(datos[,i])
  }
 }
# Quedar?n algunas variables categ?ricas (fct) para python

mitarea <- as_task_regr(datos, target="salida")
print(mitarea)

# Eliminamos los NAs

preproc <- po("imputemean") %>>% po("imputemode")
mitarea_imputada <- preproc$train(mitarea)[[1]]

# Ya no hay NAs
print(which(mitarea_imputada$missings()>0))

# Guardamos en feather format, que se puede cargar en Python como un pandas dataframe
write_feather(as.data.frame(mitarea_imputada$data()), "disp_38.feather")
