# MTProto Proxy Helm Chart

This repository contains a Helm chart for deploying the MTProto proxy in Kubernetes, based on the Telegram Messenger proxy image.

## Prerequisites
- Kubernetes cluster
- Helm installed
- kubectl installed

## Deployment
1. Ensure you have the necessary tools installed.
2. Run the deployment script:
   ```bash
   ./deploy.sh
   ```
   This will create a dedicated namespace and install the Helm chart.

## Checking the Deployment
After deployment, check the status with:
```bash
kubectl get all -n mtproto-proxy-ns
```

## Notes
- Customize values in values.yaml as needed for your environment.
- Make sure your Kubernetes cluster has an Ingress controller installed for external access. 