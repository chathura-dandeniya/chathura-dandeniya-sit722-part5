# Your Solution
#!/bin/bash

# Variables for the container registry and version, set by GitHub Actions
CONTAINER_REGISTRY=$CONTAINER_REGISTRY
#VERSION=$VERSION

# Authenticate Docker with Azure Container Registry (ACR)
echo "Logging into Azure Container Registry..."
echo $REGISTRY_PW | docker login $CONTAINER_REGISTRY --username $REGISTRY_UN --password-stdin

# Build the book_catalog image
echo "Building book_catalog image..."
docker build -t $CONTAINER_REGISTRY/book_catalog:1 ./book_catalog

# Build the inventory_management image
echo "Building inventory_management image..."
docker build -t $CONTAINER_REGISTRY/inventory_management:1 ./inventory_management

# Print success message
echo "Docker images built successfully!"