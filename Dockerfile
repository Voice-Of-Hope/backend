# Use the official Python image from the Docker Hub
FROM --platform=linux/amd64 python:3.9

# Set environment variables
ENV PYTHONUNBUFFERED=1

# Set the working directory inside the container
WORKDIR /app

# Copy the dependencies file to the working directory
COPY requirements.txt /app/

# Install the dependencies
RUN pip install --upgrade pip && pip install -r requirements.txt

# Copy the rest of the application code to the working directory
COPY . /app/

# Expose the port the app runs on
EXPOSE 8000

# Add an entrypoint for the Docker container
ENTRYPOINT ["python", "manage.py"]

# Default command to run when container starts
CMD ["runserver", "0.0.0.0:8000"]