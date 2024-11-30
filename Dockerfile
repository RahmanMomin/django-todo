# Use an official Python runtime as a parent image (specific version for better compatibility)
FROM python:3.9-slim

# Install system dependencies including distutils
RUN apt-get update && apt-get install -y \
    python3-distutils \
    build-essential

# Install Django (specific version)
RUN pip install django==3.2

# Set the working directory
WORKDIR /app

# Copy the application code into the container
COPY . .

# Expose the port Django runs on
EXPOSE 8000

# Command to run the Django development server
CMD ["sh", "-c", "python3 manage.py migrate && python3 manage.py runserver 0.0.0.0:8000"]

