FROM python:3.9-slim

# Install git
RUN apt-get update && apt-get install -y git

# Set working dir
WORKDIR /app

# Copy and install dependencies
COPY requirements.txt .
RUN pip install -r requirements.txt

# Copy the bot code
COPY . .

CMD ["python", "-m", "unzipbot"]
