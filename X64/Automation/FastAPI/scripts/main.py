from fastapi import FastAPI
import datetime

app = FastAPI()
startup_time = datetime.datetime.utcnow()

@app.get("/uptime")
def get_uptime():
    current_time = datetime.datetime.utcnow()
    uptime_duration = current_time - startup_time
    return {"uptime": str(uptime_duration)}

@app.get("/hello")
def hello_world():
    return {"message": "Hello World"}