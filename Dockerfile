# Choose a base image
FROM python:3.9

# Precise the creator
LABEL maintainer="verdotbeno@cy-tech.fr"

# Set the working directory
WORKDIR /app

# Copy application files
COPY ./app /app

# Install dependencies (if needed)
RUN pip install "fastapi[all]" 

# Expose ports (if needed)
EXPOSE 80

# Define the command to run the application
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "80", "--reload"]
