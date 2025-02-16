# %%
import pandas as pd

# Función para leer archivos CSV
def leer_csv(nombre_archivo):
    df = pd.read_csv(nombre_archivo)
    return df

#funcion para explorar datos:
def explorar_datos(df):
    print("Explorando datos")
    print("Columnas: ", df.columns)
    print("Forma: ", df.shape)
    print("Tipos de datos: ", df.dtypes)
    print("Datos nulos: ", df.isnull().sum())
    print("Valores únicos: ", df.nunique())
    print("Describe: ", df.describe())
    print("Info: ", df.info())
    print("Cabeza: ", df.head())
    print("Cola: ", df.tail())
    print("Muestra: ", df.sample(5))


""" # Función para limpiar datos
def limpiar_datos_tipo_objeto(df):

    columnas_object_con_nulos = df[df.columns[df.isnull().any()]].select_dtypes(include = "O").columns

    df.fillna("Desconocido", inplace=True)
    df.drop_duplicates(inplace=True)
    return df
# %%





# Veamos, por columna, el porcentaje en el que aparece cada valor


for col in columnas_object_con_nulos:
    print(f"La distribución de las categorías (incluyendo nulos) para la columna", col)
    display(df[col].value_counts(dropna=False, normalize=True) * 100)  # Convertimos a porcentaje
    print("........................")

    #normalize sirve para que me de el porcentaje por columna, pero está en formato decimal, así que multiplicamos por 100 """