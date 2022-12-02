# example-api

## Develop

```sh
yarn start
```

## Usage

```sh
curl localhost:3000/health
```

## Debug Docker

docker run -i --rm -p 3000:3000 -v $PWD/dist:/dist -v $PWD/src:/src node:16 yarn start
