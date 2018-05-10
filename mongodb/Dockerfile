FROM ubuntu:16.04
RUN apt-get update
RUN apt-get install -y openjdk-8-jdk wget curl dnsutils python vim mongodb-clients jq
RUN wget -O /root/ycsb-0.12.0.tar.gz https://github.com/brianfrankcooper/YCSB/releases/download/0.12.0/ycsb-0.12.0.tar.gz
RUN tar -C /root/ -xzf /root/ycsb-0.12.0.tar.gz
