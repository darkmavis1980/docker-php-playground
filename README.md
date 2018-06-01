# PHP Playground

Simple PHP7.2 with Apache 2 docker container to play with PHP

## With Docker

Build it with:

```
docker build -t <username>/php-playground .
```

Run it with:

```
docker run -p 8300:80 <username>/php-playground
```

## With Docker Compose

Build it first with `docker-compose build` and then `docker-compose up`.
If you run with docker compose, you can do live editing of the files.

Everything is served from the `web` folder.

In either way you choose, the content will be visible at the address `http://localhost:8300`

