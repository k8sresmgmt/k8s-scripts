#!/bin/bash
echo "============================================="
echo "A StatefulSet to be created."
echo "============================================="
cat statefulset-sl.yaml
read line
echo "============================================="
echo "Creating the StatefulSet....."
echo "============================================="
echo "kubectl create -f statefulset-sl.yaml"
kubectl create -f statefulset-sl.yaml
read line
echo "============================================="
echo "The resources allocated to the pod on the k8s."
echo "============================================="
echo "kubectl get statefulset mongo -o json | jq .spec.template.spec.containers[0].resources"
kubectl get statefulset mongo -o json | jq '.spec.template.spec.containers[0].resources'
read line
echo "======================================================================================="
echo "Resizing the pod (decreasing the request/limit of CPU to 3/8.)"
echo "======================================================================================="
read line
echo "kubectl patch statefulset mongo -p '{"spec":{"template":{"spec":{"containers":[{"name":"mongo","resources":{"requests":{"cpu":"3"}, "limits":{"cpu":"8"}}}]}}}}'"
kubectl patch statefulset mongo -p '{"spec":{"template":{"spec":{"containers":[{"name":"mongo","resources":{"requests":{"cpu":"3"}, "limits":{"cpu":"8"}}}]}}}}'
read line
echo "============================================="
echo "The resized resources of the pod on the k8s."
echo "============================================="
echo "kubectl get statefulset mongo -o json | jq .spec.template.spec.containers[0].resources"
kubectl get statefulset mongo -o json | jq '.spec.template.spec.containers[0].resources'
read line
echo "=================================================================================="
echo "Resizing the pod (increasing the request of CPU to 8, which doesn't fit the host.)"
echo "=================================================================================="
echo "kubectl patch statefulset mongo -p '{"spec":{"template":{"spec":{"containers":[{"name":"mongo","resources":{"requests":{"cpu":"8"}}}]}}}}'"
kubectl patch statefulset mongo -p '{"spec":{"template":{"spec":{"containers":[{"name":"mongo","resources":{"requests":{"cpu":"8"}}}]}}}}'
read line
echo "======================================================================================="
echo "Resizing the pod (increasing the request/limit of CPU to 2/8.)"
echo "======================================================================================="
read line
echo "kubectl patch statefulset mongo -p '{"spec":{"template":{"spec":{"containers":[{"name":"mongo","resources":{"requests":{"cpu":"2"}, "limits":{"cpu":"8"}}}]}}}}'"
kubectl patch statefulset mongo -p '{"spec":{"template":{"spec":{"containers":[{"name":"mongo","resources":{"requests":{"cpu":"2"}, "limits":{"cpu":"8"}}}]}}}}'
read line
echo "============================================="
echo "The resized resources of the pod on the k8s."
echo "============================================="
echo "kubectl get statefulset mongo -o json | jq .spec.template.spec.containers[0].resources"
kubectl get statefulset mongo -o json | jq '.spec.template.spec.containers[0].resources'
