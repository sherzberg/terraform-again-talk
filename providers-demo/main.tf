provider "docker" {
}

resource "docker_image" "alpine-three-five" {
  name = "alpine:3.5"
}

resource "docker_image" "alpine-edge" {
  name = "alpine:edge"
}

data "docker_registry_image" "ubuntu-1404" {
  name = "ubuntu:14.04"
}

output "ubuntu-sha" {
  value = "${data.docker_registry_image.ubuntu-1404.sha256_digest}"
}
