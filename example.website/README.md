# example-website

## Develop

```sh
npm start
```

## Usage

Access via `localhost:3000`

## Debug Build

```sh
docker build . -t example-website:debug
```

## Debug Docker

```sh
docker run -i --rm -p 3000:3000 -v $PWD:/app  example-website:debug
```
