# Makefile for Erst CLI

# Build variables
BINARY_NAME=erst
VERSION?=$(shell git describe --tags --always --dirty 2>/dev/null || echo "dev")
COMMIT_SHA?=$(shell git rev-parse HEAD 2>/dev/null || echo "unknown")
BUILD_DATE?=$(shell date -u +"%Y-%m-%d %H:%M:%S UTC")

# Go build flags
LDFLAGS=-ldflags "-X 'github.com/dotandev/hintents/internal/cmd.Version=$(VERSION)' \
                  -X 'github.com/dotandev/hintents/internal/cmd.CommitSHA=$(COMMIT_SHA)' \
                  -X 'github.com/dotandev/hintents/internal/cmd.BuildDate=$(BUILD_DATE)'"

.PHONY: build clean test help

# Default target
all: build

# Build the binary
build:
	@echo "Building $(BINARY_NAME)..."
	@go build $(LDFLAGS) -o $(BINARY_NAME) ./cmd/erst

# Build for release (optimized)
build-release:
	@echo "Building $(BINARY_NAME) for release..."
	@go build $(LDFLAGS) -ldflags "-s -w" -o $(BINARY_NAME) ./cmd/erst

# Run tests
test:
	@echo "Running tests..."
	@go test ./...

# Clean build artifacts
clean:
	@echo "Cleaning..."
	@rm -f $(BINARY_NAME)

# Show help
help:
	@echo "Available targets:"
	@echo "  build         - Build the binary with version info"
	@echo "  build-release - Build optimized binary for release"
	@echo "  test          - Run tests"
	@echo "  clean         - Remove build artifacts"
	@echo "  help          - Show this help"
