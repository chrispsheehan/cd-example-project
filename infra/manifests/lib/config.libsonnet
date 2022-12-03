{
    Namespace:: 'example-app',

    Api:: {
        Image: importstr "api.image.txt",
        Name: 'example-api',
        Replicas: 2,
        Port: 80,
        Service: 'example-api-service'
    },
}