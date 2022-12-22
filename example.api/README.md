# example-api

## Develop

```sh
yarn start
```

## Usage

```sh
curl localhost:3001/health
```

## Debug Docker

```sh
docker run -i --rm -p 3001:3001 -v $PWD/dist:/dist -v $PWD/src:/src node:16 yarn start
```
