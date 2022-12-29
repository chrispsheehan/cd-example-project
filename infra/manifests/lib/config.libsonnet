{
    Namespace:: 'example-app',

    Api:: {
        Image: importstr "api.image.txt",
        Name: 'example-api',
        Replicas: 2,
        Port: 3001,
        Service: 'example-api-service'
    },

    Web:: {
        Image: importstr "website.image.txt",
        Name: 'example-web',
        Replicas: 2,
        Port: 3000,
        Service: 'example-web-service'
    },
}