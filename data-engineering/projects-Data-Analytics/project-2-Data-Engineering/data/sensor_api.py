#### Simulation von Daten durch die Entwicklung einer API ####



import random
from datetime import datetime
from flask import Flask, jsonify

app = Flask(__name__)

def ajouter_bruit(valeur, bruit_min, bruit_max):
    return round(valeur + random.uniform(bruit_min, bruit_max), 2)

@app.route('/sensordata')
def get_sensor_data():
    timestamp = datetime.now().strftime("%y-%m-%d %H:%M:%S")

    #### 
    temperature_huile_base = random.uniform(75.0, 90.0)
    pression_huile_base = random.uniform(2.0, 3.0)
    puissance_moteur_base = random.uniform(150.0, 350.0)
    motor_speed_base = random.uniform(1450, 1550)
    vibrations_moteur_base = random.uniform(0.3, 0.7)

    # #### Leichtes Rauschen hinzugefügt
    temperature_huile = ajouter_bruit(temperature_huile_base, -2, 2)
    pression_huile = ajouter_bruit(pression_huile_base, -0.2, 0.2)
    puissance_moteur = ajouter_bruit(puissance_moteur_base, -10, 10)
    motor_speed = round(ajouter_bruit(motor_speed_base, -30, 30), 0)
    vibrations_moteur = ajouter_bruit(vibrations_moteur_base, -0.1, 0.1)

    response = {
        "DateTime": timestamp,
        "temperature_huile": temperature_huile,
        "pression_huile": pression_huile,
        "puissance_moteur": puissance_moteur,
        "motor_speed": motor_speed,
        "vibrations_moteur": vibrations_moteur,
    }

    return jsonify(response)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=3030)
