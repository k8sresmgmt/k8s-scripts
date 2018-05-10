#/bin/bash

set -x

kubectl delete statefulset ycsb-run
kubectl patch statefulset mongo -p '{"spec":{"template":{"spec":{"containers":[{"name":"mongo","resources":{"limits":{"cpu":"200m", "memory":"2G"}}}]}}}}'
kubectl create -f run.yaml
sleep 200
kubectl patch statefulset mongo -p '{"spec":{"template":{"spec":{"containers":[{"name":"mongo","resources":{"limits":{"cpu":"300m", "memory":"2G"}}}]}}}}'
sleep 200
kubectl patch statefulset mongo -p '{"spec":{"template":{"spec":{"containers":[{"name":"mongo","resources":{"limits":{"cpu":"400m", "memory":"2G"}}}]}}}}'
sleep 200
kubectl patch statefulset mongo -p '{"spec":{"template":{"spec":{"containers":[{"name":"mongo","resources":{"limits":{"cpu":"500m", "memory":"2G"}}}]}}}}'
