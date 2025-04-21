from flask import Flask, request, jsonify
from datetime import datetime
import logging

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

app = Flask(__name__)

@app.route('/', methods=['GET'])
def get_timestamp_and_ip():
    client_ip = request.remote_addr
    current_time = datetime.now().isoformat()
    
    logger.info(f"Request received from IP: {client_ip}")
    
    response = {
        "timestamp": current_time,
        "ip": client_ip
    }
    
    return jsonify(response)

@app.route('/health', methods=['GET'])
def health_check():
    return jsonify({"status": "healthy"})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
