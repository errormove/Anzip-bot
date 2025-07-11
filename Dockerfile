FROM python:3.9-slim

# Set work directory
WORKDIR /app

# Install system dependencies
RUN apt update && apt install -y unzip && rm -rf /var/lib/apt/lists/*

# Copy project files
COPY . .

# Install Poetry
RUN pip install poetry

# Install dependencies
RUN poetry config virtualenvs.create false && poetry install --no-root

# Expose port (not used by Telegram bots but required by Render)
EXPOSE 8080

# Start the bot
CMD ["poetry", "run", "python3", "bot.py"]
