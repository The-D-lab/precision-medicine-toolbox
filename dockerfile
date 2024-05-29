# Use an official Python runtime as a parent image
FROM python:3.8-slim

# Install system dependencies
RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
    libglib2.0-0


RUN pip install --upgrade pip

# Set the working directory in the container
WORKDIR /app

# Copy the local requirements file into the container
COPY requirements.txt .

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the local code into the container at /app
COPY . .

# Set the default command to run the main application script
CMD ["python", "main.py"]
