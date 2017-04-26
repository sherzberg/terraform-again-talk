# providers demo

## Setup

Ensure docker is installed locally and reachable at `DOCKER_HOST=tcp://127.0.0.1:2376/`

```bash
$ docker info
```

## Exersize

```bash
$ terraform plan
$ terraform apply
```

View your new docker images:

```bash
$ docker images | grep alpine
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
alpine              edge                8914de95a28d        7 weeks ago         4MB
alpine              3.5                 4a415e366388        7 weeks ago         3.99MB
```

View data resource information:

```bash
$ terraform output
ubuntu-sha = sha256:f9c498e5bfbd92c5ca9dc992ea0738ecaa8f85ccce1aca41aa11f83a7454d08a
```

_NOTE_ docker image data provider sha has a bug in terraform...
