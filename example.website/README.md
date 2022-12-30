# example-website

## Setup

```sh
yarn
```

## Develop

```sh
yarn start-local
```

## Minikube port-forward

- NOT required when running locally (`yarn start-local`)

```sh
kubectl port-forward svc/example-web-service -n example-app 3000:3000
```

## Usage

Access via `localhost:3000`

## Debug Build

```sh
docker build . -t example-website:debug
```

## Debug Docker

```sh
docker run -i --rm -p 3000:3000 -e API_HOST="http://host.docker.internal:3001" example-website:debug
```

## Test API connnection within minikube

```sh
kubectl run --rm --restart=Never -n example-app -i tempy --image=nginx:alpine -- curl example-api-service.example-app.svc.cluster.local:3001/uuid
```
