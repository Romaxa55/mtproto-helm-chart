#!/bin/bash

# Create a dedicated namespace for the MTProto proxy deployment
NAMESPACE="mtproto-proxy-ns"

echo "Creating namespace $NAMESPACE if it doesn't exist..."
kubectl create namespace $NAMESPACE --dry-run=client -o yaml | kubectl apply -f -

echo "Deploying the Helm chart to namespace $NAMESPACE..."
helm upgrade --install mtproto-proxy ./ --namespace $NAMESPACE

echo "Deployment complete. You can check the status with: kubectl get all -n $NAMESPACE" 