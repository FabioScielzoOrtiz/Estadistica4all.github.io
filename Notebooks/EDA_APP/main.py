from fastapi import FastAPI
from fastapi.responses import HTMLResponse
from fastapi import File, UploadFile
import pandas as pd
import matplotlib.pyplot as plt

app = FastAPI()

@app.get('/')
async def welcome():
    return {"message": "Bienvenido a la aplicación de EDA!"}


@app.post('/analyze', response_class=HTMLResponse)
async def analyze(file: UploadFile = File(...)):
    df = pd.read_csv(file.file)
    
    # Realiza tareas de EDA aquí utilizando Pandas y Matplotlib
    
    return """
    <html>
        <body>
            <h1>Resultados de EDA</h1>
            <div>{{table}}</div>
            <div>{{chart}}</div>
        </body>
    </html>
    """

    