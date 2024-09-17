# Your Solution
#!/bin/bash

# Variables for Kubernetes config and container registry
CONTAINER_REGISTRY=$CONTAINER_REGISTRY
KUBE_CONFIG=$KUBE_CONFIG
VERSION=$VERSION

# Use the KUBE_CONFIG environment variable to authenticate kubectl
echo "Setting up Kubernetes config..."
echo "$KUBE_CONFIG" > kubeconfig
export KUBECONFIG=$(pwd)/kubeconfig

# Deploy both book_catalog and inventory_management services (since they're in the same deployment.yaml)
echo "Deploying microservices (book_catalog and inventory_management) to Kubernetes..."
envsubst < ./scripts/kubernetes/deployment.yaml | kubectl apply -f -

# Clean up the kubeconfig file
rm kubeconfig

echo "Deployment to AKS completed successfully!"
