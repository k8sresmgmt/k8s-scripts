#/bin/bash

set -x

ssh -p 3333 root@localhost KUBECONFIG="/root/admin.conf" kubectl drain worker1-1 --ignore-daemonsets
ssh -p 3333 root@localhost KUBECONFIG="/root/admin.conf" kubectl drain worker2-1 --ignore-daemonsets
ssh -p 4444 root@localhost systemctl stop kubelet
ssh -p 5555 root@localhost systemctl stop kubelet
ssh -p 3333 root@localhost systemctl stop kubelet
#ssh -p 3333 root@localhost systemctl start kubelet
#ssh -p 4444 root@localhost systemctl start kubelet
#ssh -p 5555 root@localhost systemctl start kubelet
#ssh -p 3333 root@localhost KUBECONFIG="/root/admin.conf" kubectl uncordon worker1-1
#ssh -p 3333 root@localhost KUBECONFIG="/root/admin.conf" kubectl uncordon worker2-1
