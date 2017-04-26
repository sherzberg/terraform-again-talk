variable "dns_zone" {}

resource "digitalocean_ssh_key" "default" {
  name       = "Terraform Example"
  public_key = "${file("./id_rsa.pub")}"
}

module "apache" {
  source = "./do-webserver"

  package             = "apache2"
  ssh_key_fingerprint = "${digitalocean_ssh_key.default.fingerprint}"
  dns_zone            = "${var.dns_zone}"
}

module "nginx" {
  source = "./do-webserver"

  package             = "nginx"
  ssh_key_fingerprint = "${digitalocean_ssh_key.default.fingerprint}"
  dns_zone            = "${var.dns_zone}"
}
