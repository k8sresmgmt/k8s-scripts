#/bin/bash

set -x

IP=$(kubectl get pods mongo-mem-0 -o json | jq -r .status.podIP)
kubectl delete statefulset ycsb-run-mem
kubectl patch statefulset mongo-mem -p '{"spec":{"template":{"spec":{"containers":[{"name":"mongo-mem","resources":{"limits":{"cpu":"500m", "memory":"2G"}}}]}}}}'
mongo $IP:27017 < 1GB.js

#kubectl patch statefulset mongo-mem -p '{"spec":{"template":{"spec":{"containers":[{"name":"mongo-mem","resources":{"limits":{"cpu":"500m", "memory":"500M"}}}]}}}}'
#mongo $IP:27017 < 256MB.js

kubectl create -f run-mem.yaml
#sleep 300

#kubectl patch statefulset mongo-mem -p '{"spec":{"template":{"spec":{"containers":[{"name":"mongo-mem","resources":{"limits":{"cpu":"500m", "memory":"1G"}}}]}}}}'
#mongo $IP:27017 < 500MB.js
#sleep 900

#kubectl patch statefulset mongo-mem -p '{"spec":{"template":{"spec":{"containers":[{"name":"mongo-mem","resources":{"limits":{"cpu":"500m", "memory":"2G"}}}]}}}}'
#mongo $IP:27017 < 1GB.js
sleep 900

kubectl patch statefulset mongo-mem -p '{"spec":{"template":{"spec":{"containers":[{"name":"mongo-mem","resources":{"limits":{"cpu":"500m", "memory":"3G"}}}]}}}}'
mongo $IP:27017 < 1.5GB.js
