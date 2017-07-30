#/bin/bash
docker logs -f $(docker ps -q -f 'name=k8s_kube-scheduler')
