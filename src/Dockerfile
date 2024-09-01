FROM python:3.11.9-slim
WORKDIR /app

# Get wheels
RUN mkdir wheels
COPY requirements.txt .

# Install dependencies
RUN pip wheel -w wheels -r requirements.txt