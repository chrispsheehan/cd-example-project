local Service = import "./base/service.libsonnet";
local Deployment = import "./base/deployment.libsonnet";
local Replica = import "./base/replicaset.libsonnet";
local Pod = import "./base/pod.libsonnet";
local Base = import "./base/metadata.libsonnet";
local Config = import "./lib/config.libsonnet";

[
    Deployment.Spec(Config.Web.Name) {
        spec: Replica.Spec(Config.Web.Name, Config.Web.Replicas) {
            template: Base.Metadata(Config.Web.Name, Config.Web.Name) {
                spec: Pod.Template(Config.Web.Name) {
                    containers: [
                        {
                            name: Config.Web.Name,
                            image: Config.Web.Image,
                            ports: [
                                {
                                    containerPort: Config.Web.Port,
                                },
                            ],
                            env: [
                                {
                                    name: 'REACT_APP_API_HOST',
                                    value: 'http://' + Config.Api.Service + '.' + Config.Namespace + '.svc.cluster.local:' + Config.Api.Port,
                                },
                            ],
                        },
                    ],
                },
            },
        },
    },

    Service.Spec(Config.Web.Service) {
        spec: {
            selector: {
                id: Config.Web.Name,
            },
            ports: [
                {
                    name: 'http',
                    protocol: 'TCP',
                    port: Config.Web.Port,
                    targetPort: Config.Web.Port,
                },
            ],
        },
    }
]