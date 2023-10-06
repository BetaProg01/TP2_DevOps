# Choose a base image
FROM python:3.9

# Precise the creator
LABEL maintainer="verdotbeno@cy-tech.fr"

# Set the working directory
WORKDIR /app

# Copy application files into the container
COPY ./app /app

# Install dependencies inside the container
RUN pip install "fastapi[all]" 

# Expose ports
EXPOSE 80

# Define the command to run the application
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "80", "--reload"]
