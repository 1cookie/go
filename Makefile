# Variables
DOCKER_COMPOSE = docker-compose
DOCKER_IMAGE = myapp:latest

# Default target
.PHONY: all
all: build up

# Build the Go binary via Docker
.PHONY: build
build:
	@echo "Building Go app..."
	@docker-compose build go_app

# Run the containers (NGINX + Go app)
.PHONY: up
up:
	@echo "Starting containers..."
	@docker-compose up -d

# Stop and remove containers
.PHONY: down
down:
	@echo "Stopping containers..."
	@docker-compose down

# View logs for both Go app and NGINX
.PHONY: logs
logs:
	@echo "Displaying logs for Go app and NGINX..."
	@docker-compose logs -f

# Rebuild and restart containers
.PHONY: restart
restart: down build up

# Build the Docker image for the app (useful for production-like builds)
.PHONY: docker-build
docker-build:
	@echo "Building Docker image..."
	@docker build -t $(DOCKER_IMAGE) .

# Push the Docker image to a repository (example, replace with actual registry)
.PHONY: docker-push
docker-push: docker-build
	@echo "Pushing Docker image to repository..."
	@docker push $(DOCKER_IMAGE)

# Clean up Docker artifacts
.PHONY: clean
clean:
	@echo "Cleaning up Docker artifacts..."
	@docker system prune -f

# Test the Go app locally (without NGINX)
.PHONY: test-local
test-local:
	@echo "Running Go app locally..."
	@go run main.go
