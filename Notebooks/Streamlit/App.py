import streamlit as st
import pandas as pd
import matplotlib.pyplot as plt

st.title("Visualización de datos")

# Cargar archivo CSV
file = st.file_uploader("Cargar archivo CSV", type="csv")

# Si se cargó un archivo, mostrar tabla de datos y gráfico
if file is not None:
    # Convertir archivo CSV en un DataFrame de Pandas
    df = pd.read_csv(file)

    # Mostrar tabla de datos
    st.write("Tabla de datos:")
    st.write(df)



 