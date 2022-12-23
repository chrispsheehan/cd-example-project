{
    Namespace:: 'example-app',

    Api:: {
        Image: importstr "api.image.txt",
        Name: 'example-api',
        Replicas: 2,
        Port: 80,
        Service: 'example-api-service'
    },

    Web:: {
        Image: importstr "web.image.txt",
        Name: 'example-web',
        Replicas: 2,
        Port: 80,
        Service: 'example-web-service'
    },
}