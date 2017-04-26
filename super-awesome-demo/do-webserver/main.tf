variable "package" {}

variable "count" {
  default = 3
}

variable "ssh_key_fingerprint" {}

variable "dns_zone" {}

resource "digitalocean_droplet" "webserver" {
  image    = "ubuntu-14-04-x64"
  count    = "${var.count}"
  name     = "webserver-${var.package}-${count.index}"
  region   = "nyc2"
  size     = "2gb"
  ssh_keys = ["${var.ssh_key_fingerprint}"]

  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = "root"
      private_key = "${file("./id_rsa")}"
    }

    inline = [
      "apt-get update -qq",
      "apt-get install -y ${var.package}",
    ]
  }
}

output "webserver_ip_addresses" {
  value = ["${digitalocean_droplet.webserver.*.ipv4_address}"]
}

resource "digitalocean_loadbalancer" "public" {
  name   = "loadbalancer-${var.package}"
  region = "nyc2"

  forwarding_rule {
    entry_port     = 80
    entry_protocol = "http"

    target_port     = 80
    target_protocol = "http"
  }

  healthcheck {
    port     = 80
    protocol = "tcp"
  }

  droplet_ids = ["${digitalocean_droplet.webserver.*.id}"]
}

output "lb_ip" {
  value = "${digitalocean_loadbalancer.public.ip}"
}

resource "dnsimple_record" "public_record" {
  domain = "${var.dns_zone}"
  name   = "${var.package}"
  value  = "${digitalocean_loadbalancer.public.ip}"
  type   = "A"
  ttl    = 600
}

output "dns" {
  value = "${dnsimple_record.public_record.hostname}"
}
