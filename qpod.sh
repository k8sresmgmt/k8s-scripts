pods=$(kubectl get pod | awk '{print $1}')

for id in $pods
do
    ret=$(kubectl get pod $id -o json | jq '.spec.nodeName + " " + .status.qosClass + " " + .spec.containers[0].resources.requests.cpu')
    echo "$id $ret"
done
