#/bin/bash

set -x

kubectl delete statefulset ycsb-run-mem-crestart
kubectl patch statefulset mongo-mem-crestart -p '{"spec":{"template":{"spec":{"containers":[{"name":"mongo-mem-crestart","resources":{"limits":{"cpu":"500m", "memory":"500M"}}}]}}}}'
kubectl create -f run-mem-crestart.yaml
sleep 300
kubectl patch statefulset mongo-mem-crestart -p '{"spec":{"template":{"spec":{"containers":[{"name":"mongo-mem-crestart","resources":{"limits":{"cpu":"500m", "memory":"1G"}}}]}}}}'
sleep 900
kubectl patch statefulset mongo-mem-crestart -p '{"spec":{"template":{"spec":{"containers":[{"name":"mongo-mem-crestart","resources":{"limits":{"cpu":"500m", "memory":"2G"}}}]}}}}'
sleep 900
kubectl patch statefulset mongo-mem-crestart -p '{"spec":{"template":{"spec":{"containers":[{"name":"mongo-mem-crestart","resources":{"limits":{"cpu":"500m", "memory":"3G"}}}]}}}}'
