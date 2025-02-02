from flask import Flask, request, jsonify
import joblib
import numpy as np

# Load the trained model
model = joblib.load('iris_model.pkl')

# Initialize Flask app
app = Flask(__name__)

@app.route('/predict', methods=['POST'])
def predict():
    """
    Accepts a JSON payload with feature data for prediction.
    Example:
    {
        "features": [5.1, 3.5, 1.4, 0.2]
    }
    """
    data = request.get_json()
    features = data.get('features')

    if not features or len(features) != 4:
        return jsonify({'error': 'Invalid input. Provide 4 features.'}), 400

    # Make prediction
    prediction = model.predict([features])
    return jsonify({'prediction': int(prediction[0])})

if __name__ == '__main__':
    # exposing the model to be used (By specifying 0.0.0.0, the app listens for incoming requests from any IP address, enabling external devices (or Docker container ports) to connect.)
    app.run(host='0.0.0.0', port=5000)
