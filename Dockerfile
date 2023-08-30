# Use an official Python runtime as a parent image
FROM ubi9/python-311

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container at /app
COPY requirements.txt /app/

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the current directory contents into the container at /app
COPY . /app/

# Expose port 8080 to the outside world
EXPOSE 8080

# Define environment variables for Gunicorn
ENV GUNICORN_CMD_ARGS="--bind=0.0.0.0:8080 --workers=4"

# Run the command to start Gunicorn when the container launches
CMD ["gunicorn", "app:app"]
