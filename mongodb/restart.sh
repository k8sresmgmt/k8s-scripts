#/bin/bash

set -x

kubectl delete statefulset ycsb-run1
kubectl patch statefulset mongo1 -p '{"spec":{"template":{"spec":{"containers":[{"name":"mongo1","resources":{"limits":{"cpu":"200m", "memory":"2G"}}}]}}}}'
while true; do
PHASE=$(kubectl get pod mongo1-0 -o json | jq -r .status.phase)
if [ $PHASE == "Running" ]
then
	break
fi
done


kubectl create -f run1.yaml
sleep 400
kubectl patch statefulset mongo1 -p '{"spec":{"template":{"spec":{"containers":[{"name":"mongo1","resources":{"limits":{"cpu":"500m", "memory":"2G"}}}]}}}}'

