patches=$(ls 00*)

for patch in $patches
do
	echo "patch -p1 < $patch"
	patch -p1 < $patch
done
