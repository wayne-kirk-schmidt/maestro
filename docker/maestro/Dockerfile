FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Copy requirements and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY . .

# Set environment variables
ENV MAESTRO_CONFIG=/app/config/maestro_config.yml

# Expose API port
EXPOSE 5000

# Define entrypoint for daemon execution
CMD ["python", "-m", "maestro"]
