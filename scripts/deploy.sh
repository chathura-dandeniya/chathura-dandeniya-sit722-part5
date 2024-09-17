#!/bin/bash

# Variables for Kubernetes config and container registry
CONTAINER_REGISTRY=$CONTAINER_REGISTRY
KUBE_CONFIG=$KUBE_CONFIG
VERSION=$VERSION

# Check if KUBE_CONFIG is set before proceeding
if [ -z "$KUBE_CONFIG" ]; then
  echo "Error: KUBE_CONFIG environment variable is not set."
  exit 1
fi

# Use the KUBE_CONFIG environment variable to authenticate kubectl
echo "Setting up Kubernetes config..."
echo "$KUBE_CONFIG" > kubeconfig
export KUBECONFIG=$(pwd)/kubeconfig

# Ensure the deployment YAML file exists
DEPLOYMENT_FILE="./scripts/kubernetes/deployment.yaml"
if [ ! -f "$DEPLOYMENT_FILE" ]; then
  echo "Error: Deployment file $DEPLOYMENT_FILE does not exist."
  exit 1
fi

# Deploy both book_catalog and inventory_management services
echo "Deploying microservices (book_catalog and inventory_management) to Kubernetes..."
envsubst < "$DEPLOYMENT_FILE" | kubectl apply -f - --validate=false

# Check if the deployment was successful
if [ $? -ne 0 ]; then
  echo "Error: Deployment failed."
  rm kubeconfig  # Clean up kubeconfig even if the deployment fails
  exit 1
fi

# Clean up the kubeconfig file after successful deployment
rm kubeconfig
echo "Deployment to AKS completed successfully!"