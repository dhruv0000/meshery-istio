module github.com/layer5io/meshery-istio

go 1.13

replace (
	github.com/kudobuilder/kuttl => github.com/layer5io/kuttl v0.4.1-0.20200723152044-916f10574334
	github.com/layer5io/learn-layer5/smi-conformance v0.0.0-20201022191033-40468652a54f => ../learn-layer5/smi-conformance
	github.com/layer5io/meshkit v0.2.0 => ../meshkit
	github.com/layer5io/service-mesh-performance v0.3.1 => github.com/dhruv0000/service-mesh-performance v0.3.2-0.20210121151842-880e0308edc5
)

require (
	github.com/Azure/go-autorest/autorest/adal v0.9.0 // indirect
	github.com/aspenmesh/istio-vet v0.0.0-20200806222806-9c8e9a962b9f
	github.com/ghodss/yaml v1.0.0
	github.com/golang/protobuf v1.4.2
	github.com/gophercloud/gophercloud v0.4.0 // indirect
	github.com/layer5io/meshkit v0.2.0
	github.com/layer5io/service-mesh-performance v0.3.1
	github.com/pkg/errors v0.9.1
	github.com/sirupsen/logrus v1.7.0
	golang.org/x/net v0.0.0-20200927032502-5d4f70055728
	google.golang.org/grpc v1.32.0
	istio.io/client-go v0.0.0-20200708142230-d7730fd90478
	k8s.io/apimachinery v0.18.12
	k8s.io/client-go v0.18.12
)
