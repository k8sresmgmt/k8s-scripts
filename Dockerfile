FROM ubuntu:16.04
RUN apt-get update
RUN apt-get install -y wget
RUN wget -q -O- 'https://download.ceph.com/keys/release.asc' | apt-key add -
RUN echo deb http://download.ceph.com/debian-jewel/ xenial main | tee /etc/apt/sources.list.d/ceph.list
RUN apt-get update
RUN apt-get install -y ceph-osd ceph-mds ceph-mon radosgw
RUN apt-get install -y gdb wget git conntrack
RUN wget -O /run-custom-scheduler.sh http://arlab224.austin.ibm.com:8000/run-custom-scheduler.sh && chmod +x /run-custom-scheduler.sh
RUN wget -O /run-custom-apiserver.sh http://arlab224.austin.ibm.com:8000/run-custom-apiserver.sh && chmod +x /run-custom-apiserver.sh
RUN wget -O /run-custom-controller-manager.sh http://arlab224.austin.ibm.com:8000/run-custom-controller-manager.sh && chmod +x /run-custom-controller-manager.sh
RUN wget -O /go.tar.gz https://storage.googleapis.com/golang/go1.8.3.linux-amd64.tar.gz
RUN tar -C /usr/local -xzf /go.tar.gz
RUN echo "export PATH=\$PATH:/usr/local/go/bin" >> /root/.bashrc
RUN mkdir /root/go-home
RUN echo "export GOPATH=\$HOME/go-home" >> /root/.bashrc
RUN echo "export PATH=\$PATH:\$GOPATH/bin" >> /root/.bashrc
RUN GOPATH=/root/go-home /usr/local/go/bin/go get github.com/derekparker/delve/cmd/dlv
RUN echo "add-auto-load-safe-path /usr/local/go/src/runtime/runtime-gdb.py" > /root/.gdbinit
