#/bin/sh
wget -O /usr/local/bin/kube-proxy http://arlab224.austin.ibm.com:8000/_output/local/go/bin/kube-proxy && chmod +x /usr/local/bin/kube-proxy
/usr/local/bin/kube-proxy --kubeconfig=/var/lib/kube-proxy/kubeconfig.conf
