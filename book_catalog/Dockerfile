# Your Solution

# Use an official Python runtime as a base image
FROM python:3.10-slim

# Set environment variables to ensure output goes directly to the terminal
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set the working directory inside the container (for installing dependencies)
WORKDIR /app

# Copy the requirements file and install the dependencies
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r /app/requirements.txt

# Copy the app code into the container
COPY ./app /app

# Set the working directory back to root to allow running Uvicorn outside /app
WORKDIR /

# Expose port 8001 for the FastAPI app
EXPOSE 8001

# Run the FastAPI app with Uvicorn from outside the "app" directory
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8001"]
