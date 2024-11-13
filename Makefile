BINARY_NAME = fileHandling
PACKAGE = ./cmd/myapp

all: build

build:
	go build -o $(BINARY_NAME) $(PACKAGE)
	@echo "Build complete. Run with './$(BINARY_NAME)'"

# Run the binary
run: build
	./$(BINARY_NAME)

# Clean up the binary
clean:
	@rm -f $(BINARY_NAME)
	@echo "Cleaned up the binary."

# Install dependencies (if needed)
deps:
	go mod download
	@echo "Dependencies installed."

# Format the code (optional)
fmt:
	go fmt ./...
	@echo "Code formatted."

# Run tests (optional)
test:
	go test ./... -v
	@echo "Tests completed."
