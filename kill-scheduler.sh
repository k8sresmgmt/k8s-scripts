#/bin/bash
docker kill $(docker ps -q -f 'name=k8s_kube-scheduler')
