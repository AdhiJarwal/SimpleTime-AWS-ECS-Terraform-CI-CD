# Flask Time Service

Simple Flask application that returns current timestamp and client IP.

## Endpoints

- `GET /` - Returns JSON with timestamp and client IP
- `GET /health` - Health check endpoint

## Local Development

```bash
# Install dependencies
pip install -r requirements.txt

# Run application
python app.py
```

## Docker

```bash
# Build image
docker build -t simple-time-service .

# Run container
docker run -p 8080:8080 simple-time-service
```

Application runs on port 8080.