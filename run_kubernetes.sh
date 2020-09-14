#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath="crisroddev/udacityproject"

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run microservice\
    --generator=run-pod/v1\
    --image=$dockerpath\
    --port=80 --labels app=microservice

# Step 3:
# List kubernetes pods
kubectl get pods 

# Step 4:
# Forward the container port to a host
kubectl port-forward microservice-674574fb5c-m7zzh 8000:80

# Step 5
# Get LOGS 
kubectl logs `kubectl get pods -o=name`