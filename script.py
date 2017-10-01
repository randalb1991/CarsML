__author__ = 'Randal'
import pandas
import coremltools #Framework apple https://pypi.python.org/pypi/coremltools
from sklearn.linear_model import LinearRegression


rawdata = pandas.read_csv("cars.csv")

# Le pedimos a sklearn que encuentro un perfil virtual para hallar corelacion entre las variables.

model = LinearRegression()

# Evalua el modelo y me intentara buscar el precio. Generara un model entrenado con 1000 datos
model.fit(rawdata[["modelo", "extras", "kilometraje", "estado"]], rawdata["precio"])

# Adaptamos el modelo original para el modelo de coreml
coreml_model = coremltools.converters.sklearn.convert(model, ["modelo", "extras", "kilometraje", "estado"], "price")

coreml_model.author = "Randall Dani Barrientos Alva"
coreml_model.license = "RDBA"
coreml_model.short_description = "El modelo predice el valor de venta de un coche segun modelo, extras, kilometraje y estado"

# Indicamos el nombre del nuevo modelo.

coreml_model.save("Cars.mlmodel")