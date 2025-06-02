import os
from flask import Flask, request, jsonify
import firebase_admin
from firebase_admin import credentials, messaging

app = Flask(__name__)

base_dir = os.path.dirname(os.path.abspath(__file__))
firebase_key_path = os.path.join(base_dir, 'firebase-key.json')

cred = credentials.Certificate(firebase_key_path)
firebase_admin.initialize_app(cred)

@app.route('/sendNoti', methods=['POST'])
def send_notification():
    data = request.json or {}
    evento = data.get('evento', 'desconhecido')

    if evento == 'ligar':
        title = "Compressor Ligado"
        body = f"O compressor foi ligado às {data.get('hora', 'hora desconhecida')}."
    elif evento == 'desligar':
        title = "Compressor Desligado"
        body = f"O compressor foi desligado às {data.get('hora', 'hora desconhecida')}."
    elif evento == 'critico':
        title = "Alerta Crítico"
        body = data.get('mensagem', 'Dados fora do padrão detectados.')
    else:
        title = "Compressor"
        body = "Um evento desconhecido foi registrado."

    message = messaging.Message(
        notification=messaging.Notification(title=title, body=body),
        topic="all"
    )
    response = messaging.send(message)
    return jsonify({"status": "success", "response": response})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
