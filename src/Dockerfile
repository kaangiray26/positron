FROM python:3.11.9-slim
WORKDIR /app

# Get wheels
RUN mkdir wheels
COPY requirements.txt .

# Install dependencies
RUN pip wheel -w wheels -r requirements.txt

# Compress the wheels
RUN tar -czvf wheels.tar.gz wheels

# Remove the wheels folder
RUN rm -rf wheels