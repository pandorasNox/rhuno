.PHONY: help setup gdformat gdlint gdparse gdradon build-gdtoolkit gdformat-check ensure-docker-image

# Docker image name
IMAGE_NAME := gdscript-toolkit-local

# Default target - show help
.DEFAULT_GOAL := help

# Help target
help: ## Show this help message
	@echo "GDScript Toolkit Commands:"
	@echo ""
	@echo "Available targets:"
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "  %-20s %s\n", $$1, $$2}' $(MAKEFILE_LIST)
	@echo ""
	@echo "Docker image will be built automatically when needed."

# Setup project (add githooks)
setup:
	git config core.hooksPath .githooks

# Ensure Docker image exists, build if it doesn't
ensure-docker-image:
	@if ! docker image inspect $(IMAGE_NAME) >/dev/null 2>&1; then \
		echo "Building Docker image for gdscript-toolkit..."; \
		docker build -t $(IMAGE_NAME) .; \
	fi

# Build the Docker image
build-gdtoolkit: ## Build the Docker image for gdscript-toolkit
	docker build -t $(IMAGE_NAME) .

# Format all GDScript files
gdformat: ensure-docker-image ## Format all GDScript files in the project
	docker run --rm -v $(PWD):/workspace -w /workspace $(IMAGE_NAME) gdformat $$(find . -name "*.gd" -not -path "./.git/*")

# Lint all GDScript files  
gdlint: ensure-docker-image ## Lint all GDScript files in the project
	docker run --rm -v $(PWD):/workspace -w /workspace $(IMAGE_NAME) gdlint $$(find . -name "*.gd" -not -path "./.git/*")

# Parse a specific file (usage: make gdparse FILE=path/to/file.gd)
gdparse: ensure-docker-image ## Parse a specific GDScript file (usage: make gdparse FILE=path/to/file.gd)
	docker run --rm -v $(PWD):/workspace -w /workspace $(IMAGE_NAME) gdparse -p $(FILE)

# Check formatting without making changes
gdformat-check: ensure-docker-image ## Check GDScript formatting without making changes
	docker run --rm -v $(PWD):/workspace -w /workspace $(IMAGE_NAME) gdformat --check $$(find . -name "*.gd" -not -path "./.git/*")

# Calculate code complexity metrics
gdradon: ensure-docker-image ## Calculate code complexity metrics for all GDScript files
	docker run --rm -v $(PWD):/workspace -w /workspace $(IMAGE_NAME) gdradon cc $$(find . -name "*.gd" -not -path "./.git/*")
