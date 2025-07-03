.PHONY: help build up down logs shell test clean

# Default target
help:
	@echo "Digo Chat - Development Commands"
	@echo "================================"
	@echo "make build    - Build all Docker images"
	@echo "make up       - Start all services"
	@echo "make down     - Stop all services"
	@echo "make logs     - View logs from all services"
	@echo "make shell    - Open Django shell"
	@echo "make test     - Run all tests"
	@echo "make clean    - Clean up volumes and images"
	@echo "make migrate  - Run Django migrations"
	@echo "make super    - Create Django superuser"

# Build Docker images
build:
	docker-compose build

# Start services
up:
	docker-compose up -d
	@echo "Services started!"
	@echo "Frontend: http://localhost:3000"
	@echo "Backend:  http://localhost:8000"
	@echo "Database: localhost:5432"

# Stop services
down:
	docker-compose down

# View logs
logs:
	docker-compose logs -f

# Django shell
shell:
	docker-compose exec backend python manage.py shell

# Run tests
test:
	docker-compose exec backend python manage.py test
	docker-compose exec frontend npm test

# Clean everything
clean:
	docker-compose down -v
	docker system prune -f

# Django migrations
migrate:
	docker-compose exec backend python manage.py makemigrations
	docker-compose exec backend python manage.py migrate

# Create superuser
super:
	docker-compose exec backend python manage.py createsuperuser

# Quick restart
restart: down up

# Check service health
health:
	docker-compose ps