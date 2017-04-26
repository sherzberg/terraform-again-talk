variable "domain" {}

resource "digitalocean_ssh_key" "default" {
  name       = "Terraform Example"
  public_key = "${file("./id_rsa.pub")}"
}

module "apache" {
  source = "./do-webserver"

  package             = "apache2"
  ssh_key_fingerprint = "${digitalocean_ssh_key.default.fingerprint}"
}

module "nginx" {
  source = "./do-webserver"

  package             = "nginx"
  ssh_key_fingerprint = "${digitalocean_ssh_key.default.fingerprint}"
}

provider "godaddy" {}

resource "godaddy_domain_record" "domains" {
  domain = "${var.domain}"

  record {
    name = "nginx"
    type = "A"
    data = "${module.nginx.lb_ip}"
    ttl  = 600
  }

  record {
    name = "apache"
    type = "A"
    data = "${module.apache.lb_ip}"
    ttl  = 600
  }

  addresses   = ["192.168.0.1"]
  nameservers = ["ns63.domaincontrol.com", "ns64.domaincontrol.com"]
}
