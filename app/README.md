# Flask Application: Timestamp and IP Service

## Overview

This Flask application provides two endpoints:
1. **`/`**: Returns the current timestamp and the client's IP address.
2. **`/health`**: A health check endpoint to ensure the service is running properly.

The application is containerized using Docker, allowing for easy deployment and scaling in any environment.

## Folder Structure

```
app/
├── app.py
├── Dockerfile       
├── requirements.txt 
```

## Endpoints

### `GET /`
Returns the current timestamp and the client's IP address.

**Response Example:**
```json
{
  "timestamp": "2025-04-21T12:34:56.789123",
  "ip": "192.168.1.1"
}
```


## Logging

The application logs incoming requests, including the client's IP address, to provide insights into the usage of the service. The logs are output at the `INFO` level.

## Docker Setup

The application is containerized using Docker. The `Dockerfile` ensures that the app runs in a lightweight container with the necessary dependencies installed.

### Steps to Build and Run the Docker Container

1. **Build the Docker image**:
   ```bash
   docker build -t flask-timestamp-ip .
   ```

2. **Run the Docker container**:
   ```bash
   docker run -p 8080:8080 flask-timestamp-ip
   ```

   The app will be accessible on `http://localhost:8080`.

### Dockerfile Explanation

- **Base Image**: The Docker image uses `python:3.11-slim`, a lightweight Python image.
- **User Creation**: Creates a non-root user (`appuser`) for security.
- **Dependencies**: Installs the required Python dependencies from `requirements.txt`.
- **App Code**: Copies the Flask application code into the container.
- **Expose Port**: The app listens on port `8080`.

### Requirements

- Python 3.11+
- Docker (for containerization)
- Flask 2.3.3 (installed via `requirements.txt`)

## Usage

1. **Start the Application**:
   After building and running the Docker container, the Flask app will start and be available at `http://localhost:8080`.

2. **Test Endpoints**:
   - To get the timestamp and IP, open a browser or use `curl` to access `http://localhost:8080/`.
   - To check the health status, navigate to `http://localhost:8080/health`.

## Conclusion

This Flask application provides a simple service to retrieve the current timestamp and client IP, along with a health check endpoint. It's designed to be easily deployable with Docker and can be used in various environments that support containerization.

---
