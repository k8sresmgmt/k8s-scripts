#/bin/bash

set -x

kubectl delete statefulset ycsb-run
kubectl patch statefulset mongo -p '{"spec":{"template":{"spec":{"containers":[{"name":"mongo","resources":{"limits":{"cpu":"200m", "memory":"2G"}}}]}}}}'
kubectl create -f run.yaml
sleep 400
kubectl patch statefulset mongo -p '{"spec":{"template":{"spec":{"containers":[{"name":"mongo","resources":{"limits":{"cpu":"500m", "memory":"2G"}}}]}}}}'
