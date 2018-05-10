#!/bin/bash
echo "========================="
echo "Creating the MongoDB....."
echo "========================="
echo "kubectl create -f mongo-live.yaml"
kubectl create -f mongo-live.yaml
read line
echo "=================================================="
echo "The CPU resource allocated to the MongoDB instance."
echo "=================================================="
echo "kubectl get statefulset mongo-live -o json | jq .spec.template.spec.containers[0].resources"
kubectl get statefulset mongo-live -o json | jq '.spec.template.spec.containers[0].resources'
read line
echo "==============================="
echo "Resizing to 1 CPU from 500m CPU"
echo "==============================="
read line
echo "kubectl patch statefulset mongo-live -p '{"spec":{"template":{"spec":{"containers":[{"name":"mongo-live","resources":{"limits":{"cpu":"1"}}}]}}}}'"
kubectl patch statefulset mongo-live -p '{"spec":{"template":{"spec":{"containers":[{"name":"mongo-live","resources":{"limits":{"cpu":"1"}}}]}}}}'
read line
echo "========================="
echo "The resized CPU resource."
echo "========================="
echo "kubectl get statefulset mongo-live -o json | jq .spec.template.spec.containers[0].resources"
kubectl get statefulset mongo-live -o json | jq '.spec.template.spec.containers[0].resources'
read line
