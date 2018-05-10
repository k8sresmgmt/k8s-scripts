#/bin/bash


n=$(kubectl get statefulset ycsb-run-mem -o json | jq -r .spec.replicas)
total=0

while true; do
n=$(kubectl get statefulset ycsb-run-mem -o json | jq -r .spec.replicas)
for idx in `seq 0 $(($n - 1))`
do
	ops=$(tail -n 1 ycsb-run-mem-$idx.output | grep ops | awk '{print $7}')
	#printf "$ops "
	OPS[$idx]=$ops
	total=$(echo "$total + $ops" | bc -l)
done
#printf "$total\n"
#echo ${OPS[0]}

for idx in `seq 0 $(($n - 1))`
do
	printf "CLI-$idx\t"
done
printf "TOTAL\n"
for idx in `seq 0 $(($n - 1))`
do
	printf "${OPS[$idx]}\t"
done
printf "$total\n"
total=0
sleep 1
done
