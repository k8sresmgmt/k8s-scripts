#/bin/bash

set -x

kubectl delete statefulset ycsb-run1-mem
#kubectl patch statefulset mongo1-mem -p '{"spec":{"template":{"spec":{"containers":[{"name":"mongo1-mem","command":["mongod", "--noprealloc", "--bind_ip_all", "--wiredTigerCacheSizeGB=0.256"], "image": "mongo", "resources":{"limits":{"cpu":"500m", "memory":"500M"}}}]}}}}'
kubectl patch statefulset mongo1-mem -p '{"spec":{"template":{"spec":{"containers":[{"name":"mongo1-mem","command":["mongod", "--noprealloc", "--bind_ip_all", "--wiredTigerCacheSizeGB=1"], "image": "mongo", "resources":{"limits":{"cpu":"500m", "memory":"2G"}}}]}}}}'
while true; do
PHASE=$(kubectl get pod mongo1-mem-0 -o json | jq -r .status.phase)
if [ $PHASE == "Running" ]
then
	break
fi
done


kubectl create -f run1-mem.yaml
#sleep 300
#kubectl patch statefulset mongo1-mem -p '{"spec":{"template":{"spec":{"containers":[{"name":"mongo1-mem","command":["mongod", "--noprealloc", "--bind_ip_all", "--wiredTigerCacheSizeGB=0.5"], "image": "mongo", "resources":{"limits":{"cpu":"500m", "memory":"1G"}}}]}}}}'
#sleep 900
#kubectl patch statefulset mongo1-mem -p '{"spec":{"template":{"spec":{"containers":[{"name":"mongo1-mem","command":["mongod", "--noprealloc", "--bind_ip_all", "--wiredTigerCacheSizeGB=1"], "image": "mongo", "resources":{"limits":{"cpu":"500m", "memory":"2G"}}}]}}}}'
sleep 900
kubectl patch statefulset mongo1-mem -p '{"spec":{"template":{"spec":{"containers":[{"name":"mongo1-mem","command":["mongod", "--noprealloc", "--bind_ip_all", "--wiredTigerCacheSizeGB=1.5"], "image": "mongo", "resources":{"limits":{"cpu":"500m", "memory":"3G"}}}]}}}}'
