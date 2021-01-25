package istio

import (
	"context"
	"encoding/json"
	"fmt"

	"github.com/layer5io/meshery-istio/meshes"
	"github.com/layer5io/meshkit/smi"
	smp "github.com/layer5io/service-mesh-performance/spec"
)

func (iClient *Client) runConformanceTest(id string, meshType smp.ServiceMesh_Type, version string) error {

	labels := map[string]string{
		"istio-injection": "enabled",
	}

	test, err := smi.New(context.TODO(), id, version, meshType, iClient.k8sClientset)
	if err != nil {
		iClient.eventChan <- &meshes.EventsResponse{
			OperationId: id,
			EventType:   meshes.EventType_ERROR,
			Summary:     "Error while creating smi-conformance tool",
			Details:     err.Error(),
		}
		return err
	}

	result, err := test.Run(labels, nil)
	if err != nil {
		iClient.eventChan <- &meshes.EventsResponse{
			OperationId: id,
			EventType:   meshes.EventType_ERROR,
			Summary:     fmt.Sprintf("Error while %s running smi-conformance test", result.Status),
			Details:     err.Error(),
		}
		return err
	}

	jsondata, _ := json.Marshal(result)
	iClient.eventChan <- &meshes.EventsResponse{
		OperationId: id,
		EventType:   meshes.EventType_INFO,
		Summary:     fmt.Sprintf("Smi conformance test %s successfully", result.Status),
		Details:     string(jsondata),
	}

	return nil
}
