# Alpine Docker image for building alpine packages

Based on <https://wiki.alpinelinux.org/wiki/Creating_an_Alpine_package>.

## What is Alpine Linux

Alpine Linux is a Linux distribution built around [musl
libc](https://www.musl-libc.org/) and
[BusyBox](https://busybox.net/about.html). The pure image is only 5 MB in size
and has access to a package repository that is much more complete than other
BusyBox based images.

## Befor build image

Insert / replace `USERNAME`, `GITUSERNAME` and `GITUSEREMAIL` in `Dockerfile`.

## Build image

```shell
docker build -t alpine-buildenv .
```

## Start new container

```shell
docker run -t -i alpine-buildenv:latest /bin/sh
```

## Enter a running container via shell

```shell
docker exec -it <CONTAINER ID> /bin/ash
```

`ash` is the [Almquist Shell](https://en.wikipedia.org/wiki/Almquist_shell),
the default shell under [Alpine Linux](https://alpinelinux.org/) provided by
[BusyBox](https://busybox.net/about.html).