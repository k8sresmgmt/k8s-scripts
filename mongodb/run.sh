#/bin/bash

set -x

kubectl patch statefulset mongo -p '{"spec":{"template":{"spec":{"containers":[{"name":"mongo","resources":{"limits":{"cpu":"500m", "memory":"2G"}}}]}}}}'
kubectl create -f run.yaml
sleep 60
kubectl patch statefulset ycsb-run -p '{"spec":{"replicas":2}}'
sleep 60
kubectl patch statefulset mongo -p '{"spec":{"template":{"spec":{"containers":[{"name":"mongo","resources":{"limits":{"cpu":"1", "memory":"2G"}}}]}}}}'
