# Multi-stage Dockerfile for Django

# Base stage
FROM python:3.11-slim as base

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PYTHONHASHSEED=random \
    PIP_NO_CACHE_DIR=off \
    PIP_DISABLE_PIP_VERSION_CHECK=on \
    PIP_DEFAULT_TIMEOUT=100

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    netcat-traditional \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Set work directory
WORKDIR /app

# Development stage
FROM base as development

# Copy requirements first for better caching
COPY requirements*.txt ./
RUN pip install --upgrade pip && \
    pip install -r requirements.txt || \
    pip install django djangorestframework psycopg2-binary redis python-dotenv

# Copy project files
COPY . .

# Create necessary directories
RUN mkdir -p staticfiles media logs

# Add a script to wait for postgres
RUN echo '#!/bin/sh\n\
    while ! nc -z postgres 5432; do\n\
    echo "Waiting for PostgreSQL..."\n\
    sleep 1\n\
    done\n\
    echo "PostgreSQL is ready!"\n\
    exec "$@"' > /entrypoint.sh && \
    chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

# Production stage
FROM base as production

# Copy requirements
COPY requirements.txt .
RUN pip install --upgrade pip && \
    pip install -r requirements.txt && \
    pip install gunicorn

# Copy project files
COPY . .

# Collect static files
RUN python manage.py collectstatic --noinput || echo "Collectstatic skipped"

# Run gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "--workers", "4", "config.wsgi:application"]