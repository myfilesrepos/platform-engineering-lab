from kafka import KafkaProducer
import json
import time
import requests

def json_serializer(data):
    return json.dumps(data).encode("utf-8")

def getSensorData():
    response = requests.get("http://localhost:3030/sensordata") ## ### API-Aufruf
    return response.json()

producer = KafkaProducer(
    bootstrap_servers='kafka1:19092',  
    value_serializer=json_serializer
)

if __name__ == "__main__":
    while True:
        try:
            sensor_data = getSensorData()
            print(sensor_data)
            producer.send("registered_user", sensor_data)
            producer.flush()
        except Exception as e:
            print(f"Error when sending to Kafka  : {e}")
        time.sleep(1)