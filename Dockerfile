FROM python:3.9-slim

# Install system dependencies
RUN apt-get update && apt-get install -y git curl

# Install Poetry
RUN curl -sSL https://install.python-poetry.org | python3 -

# Set PATH so poetry is available
ENV PATH="/root/.local/bin:$PATH"

# Set working directory
WORKDIR /app

# Copy project files
COPY pyproject.toml poetry.lock* ./

# Install dependencies
RUN poetry config virtualenvs.create false \
 && poetry install --no-interaction --no-ansi

# Copy the rest of your bot code
COPY . .

# Run the bot
CMD ["python", "-m", "unzipbot"]
