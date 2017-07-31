files=(
./pkg/kubectl/testing/types.generated.go
./pkg/apis/apps/v1beta1/types.generated.go
./pkg/apis/certificates/v1beta1/types.generated.go
./pkg/apis/imagepolicy/v1alpha1/types.generated.go
./pkg/apis/storage/v1beta1/types.generated.go
./pkg/apis/rbac/v1beta1/types.generated.go
./pkg/apis/rbac/v1alpha1/types.generated.go
./pkg/apis/authorization/v1beta1/types.generated.go
./pkg/apis/authorization/v1/types.generated.go
./pkg/apis/batch/v2alpha1/types.generated.go
./pkg/apis/batch/v1/types.generated.go
./pkg/apis/authentication/v1beta1/types.generated.go
./pkg/apis/policy/v1beta1/types.generated.go
./pkg/apis/autoscaling/v2alpha1/types.generated.go
./pkg/apis/autoscaling/v1/types.generated.go
./pkg/apis/extensions/v1beta1/types.generated.go
./pkg/controller/garbagecollector/metaonly/types.generated.go
./pkg/api/v1/types.generated.go
./cmd/libs/go2idl/client-gen/test_apis/testgroup/v1/types.generated.go
./federation/apis/federation/v1beta1/types.generated.go
)

for file in ${files[@]}
do
	cp ~/temp/kubernetes-1.6.0/$file $file
done
