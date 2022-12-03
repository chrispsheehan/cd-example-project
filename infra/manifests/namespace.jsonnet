local Config = import "./lib/config.libsonnet";

[
  {
    apiVersion: 'v1',
    kind: 'Namespace',
    metadata: {
      name: Config.Namespace,
    },
  },
]