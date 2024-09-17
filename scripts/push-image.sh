# Your Solution
#!/bin/bash

# Variables for the container registry and version, set by GitHub Actions
CONTAINER_REGISTRY=$CONTAINER_REGISTRY
#VERSION=$VERSION

# Push the book_catalog image to the Azure Container Registry
echo "Pushing book_catalog image to Azure Container Registry..."
docker push $CONTAINER_REGISTRY/book_catalog:1

# Push the inventory_management image to the Azure Container Registry
echo "Pushing inventory_management image to Azure Container Registry..."
docker push $CONTAINER_REGISTRY/inventory_management:1

# Print success message
echo "Docker images pushed successfully!"
