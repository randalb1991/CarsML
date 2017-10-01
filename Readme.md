# Swift 4 CoreML

Este proyecto pretende inferir el precio de venta de un vehiculo de segunda mano usando un modelo generado a partir de 1000 datos de ventas anteriores.

El valor estimado de los vehiculos dependerá de 4 parametros que podrán tomar los siguientes valores:


- Modelo:

	-	0: Peugeot 207
	-	1: peugeot 307
	-	2: Peugeot 407

- Extras:
	-	0: No lleva extras
	-	1: Si lleva extras

- Kilometraje:
	-	Kilometros del vehículo 

- Estados:
	-	0: Muy mal estado
	-	1: Estado regular
	-	2: Buen estado
	-	3: Estado excelente

Precio:


# 1. Generación del modelo de datos con Python 2.7.

Gracias a las librerías pandas, scipy y scikit-learn podremos generar un modelo de datos a partir un conjunto de datos(.csv) con el fin de inferir futuras ventas.

Posteriormente, con la ayuda de coremltools(oficial de Apple) optimizaremos y adaptaremos este modelo para Swift4, el cuál será finalmente importado en el proyecto


## 1.1 Usaremos un virtualenv en el cual instalaremos las librerías necesarias para la generacion del modelo de datos:

### Creamos el VirtualEnv
virtualenv env-machine-learning
### Lo activamos
source env-machine-learning/bin/activate
### Instalamos las librerias necesarias
sudo pip install --ignore-installed coremltools scikit-learn pandas scipy

## 1.2 Generamos el model de datos ejecutando el fichero script.py. Es necesario que el fichero csv que contiene todos los datos se encuentre en el mismo directorio



