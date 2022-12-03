local Service = import "./base/service.libsonnet";
local Deployment = import "./base/deployment.libsonnet";
local Replica = import "./base/replicaset.libsonnet";
local Pod = import "./base/pod.libsonnet";
local Base = import "./base/metadata.libsonnet";
local Config = import "./lib/config.libsonnet";

[
    Deployment.Spec(Config.Api.Name) {
        spec: Replica.Spec(Config.Api.Name, Config.Api.Replicas) {
            template: Base.Metadata(Config.Api.Name, Config.Api.Name) {
                spec: Pod.Template(Config.Api.Name) {
                    containers: [
                        {
                            name: Config.Api.Name,
                            image: Config.Api.Image,
                            ports: [
                                {
                                    containerPort: Config.Api.Port,
                                },
                            ],
                        },
                    ],
                },
            },
        },
    },

    Service.Spec(Config.Api.Service) {
        spec: {
            selector: {
                id: Config.Api.Name,
            },
            ports: [
                {
                    name: 'http',
                    protocol: 'TCP',
                    port: 80,
                    targetPort: Config.Api.Port,
                },
            ],
        },
    }
]