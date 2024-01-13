from fastapi import FastAPI, HTTPException, status
from fastapi.responses import JSONResponse
from pydantic import BaseModel
from typing import List

app = FastAPI()

class IoTThing:
    def __init__(self, name: str, status: str):
        self.name = name
        self.status = status

# In-memory database to store IoT things
iot_things_db = {}


class IoTThingCreate(BaseModel):
    name: str
    status: str


class IoTThingResponse(BaseModel):
    name: str
    status: str


@app.post("/iot/things/", response_model=IoTThingResponse)
async def create_iot_thing(thing: IoTThingCreate):
    iot_thing = IoTThing(name=thing.name, status=thing.status)
    iot_things_db[thing.name] = iot_thing
    return iot_thing

@app.get("/iot/things/", response_model=List[IoTThingResponse])
async def read_iot_things():
    return [{"name": name, "status": thing.status} for name, thing in iot_things_db.items()]


@app.get("/iot/things/{thing_name}", response_model=IoTThingResponse)
async def read_iot_thing(thing_name: str):
    if thing_name not in iot_things_db:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Thing not found")
    thing = iot_things_db[thing_name]
    return {"name": thing.name, "status": thing.status}


@app.put("/iot/things/{thing_name}", response_model=IoTThingResponse)
async def update_iot_thing(thing_name: str, new_status: str):
    if thing_name not in iot_things_db:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Thing not found")
    iot_things_db[thing_name].status = new_status
    return {"name": thing_name, "status": new_status}


@app.delete("/iot/things/{thing_name}", response_model=IoTThingResponse)
async def delete_iot_thing(thing_name: str):
    if thing_name not in iot_things_db:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Thing not found")
    deleted_thing = iot_things_db.pop(thing_name)
    return {"name": deleted_thing.name, "status": deleted_thing.status}


@app.get("/iot/things/status/{thing_name}", status_code=status.HTTP_200_OK)
async def check_iot_thing_status(thing_name: str):
    if thing_name not in iot_things_db:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Thing not found")

    thing = iot_things_db[thing_name]
    if thing.status == "error":
        return JSONResponse(content={"message": "Error", "status_code": 400}, status_code=status.HTTP_200_OK)
    elif thing.status == "warning":
        return JSONResponse(content={"message": "Warning", "status_code": 200}, status_code=status.HTTP_200_OK)
    else:
        return JSONResponse(content={"message": "Good", "status_code": 100}, status_code=status.HTTP_200_OK)