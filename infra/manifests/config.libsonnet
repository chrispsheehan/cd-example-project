{
    Namespace:: 'example-app',

    Api:: {
        Image: 'chrispsheehan/example-api:a63557',
        Name: 'example-api',
        Replicas: 2,
        Port: 80,
        Service: 'example-api-service'
    },
}