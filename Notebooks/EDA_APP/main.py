from fastapi import FastAPI
from fastapi.responses import HTMLResponse
from fastapi import File, UploadFile
import pandas as pd
import matplotlib.pyplot as plt

from fastapi.responses import HTMLResponse
from fastapi.templating import Jinja2Templates


app = FastAPI()


templates = Jinja2Templates(directory="templates")

@app.get("/", response_class=HTMLResponse)
async def welcome(request: Request):
    return templates.TemplateResponse("welcome.html", {"request": request})


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

