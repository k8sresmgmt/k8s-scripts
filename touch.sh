#files=$(find | grep generated.go | grep pkg | grep -v _output | grep -v staging | grep -v client | grep -v make)
generatedfiles=$(find -type f | grep generated | grep .go)
typefiles=$(find -type f | grep types.go)

checkout() {
	file=$1
	size=$2

	if [ $size == "0" ]
	then 
		rm $file
		git checkout $file
		echo $file
	fi
}

for file in $generatedfiles
do
	size=$(ls -la $file | awk '{print $5}')
	echo $file
	checkout $file $size
done

for file in $typefiles
do
	touch $file
	echo $file
done 
