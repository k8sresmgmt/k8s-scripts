#/bin/sh
wget -O /usr/local/bin/kube-scheduler http://arlab224.austin.ibm.com:8000/_output/local/go/bin/kube-scheduler && chmod +x /usr/local/bin/kube-scheduler
/usr/local/bin/kube-scheduler --address=127.0.0.1 --leader-elect=true --kubeconfig=/etc/kubernetes/scheduler.conf --feature-gates=PodPriority=true
