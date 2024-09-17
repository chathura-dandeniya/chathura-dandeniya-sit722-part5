# Your Solution
#!/bin/bash

# Variables for Kubernetes config and container registry
CONTAINER_REGISTRY=$CONTAINER_REGISTRY
KUBE_CONFIG=$KUBE_CONFIG

# Check if KUBE_CONFIG is set before proceeding
if [ -z "$KUBE_CONFIG" ]; then
  echo "Error: KUBE_CONFIG environment variable is not set."
  exit 1
fi

# Decode KUBE_CONFIG from base64 and use it to authenticate kubectl
echo "Setting up Kubernetes config for deletion..."
echo "$KUBE_CONFIG" | base64 --decode > kubeconfig
export KUBECONFIG=$(pwd)/kubeconfig

# Ensure the deployment YAML file exists
DEPLOYMENT_FILE="./scripts/kubernetes/deployment.yaml"
if [ ! -f "$DEPLOYMENT_FILE" ]; then
  echo "Error: Deployment file $DEPLOYMENT_FILE does not exist."
  exit 1
fi

# Delete Kubernetes resources
echo "Deleting Kubernetes services (book_catalog and inventory_management)..."
envsubst < "$DEPLOYMENT_FILE" | kubectl delete -f -

# Check if deletion was successful
if [ $? -ne 0 ]; then
  echo "Error: Deletion failed."
  rm kubeconfig  # Clean up kubeconfig even if the deletion fails
  exit 1
fi

# Clean up the kubeconfig file after successful deletion
rm kubeconfig
echo "Kubernetes resources deleted successfully!"

# Delete the Docker images from the Azure Container Registry
echo "Deleting book_catalog image from Azure Container Registry..."
az acr repository delete --name $CONTAINER_REGISTRY --image book_catalog:1 --yes

echo "Deleting inventory_management image from Azure Container Registry..."
az acr repository delete --name $CONTAINER_REGISTRY --image inventory_management:1 --yes

# Print success message
echo "Docker images deleted successfully!"