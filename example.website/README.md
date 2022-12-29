# example-website

## Setup

```sh
yarn
```

## Develop

```sh
API_HOST="http://localhost:3001" yarn start
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
