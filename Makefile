# Makefile for yan-defter repository

.PHONY: help clean setup test

help:
	@echo "Available commands:"
	@echo "  make setup   - Setup the repository"
	@echo "  make clean   - Clean generated files"
	@echo "  make test    - Run tests"
	@echo "  make help    - Show this help message"

setup:
	@echo "Setting up repository..."
	@chmod +x scripts/setup.sh
	@./scripts/setup.sh

clean:
	@echo "Cleaning up..."
	@find . -name "*.pyc" -delete
	@find . -name "__pycache__" -delete
	@echo "Clean complete!"

test:
	@echo "Running tests..."
	@echo "No tests configured yet."
