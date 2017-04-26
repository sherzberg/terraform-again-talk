variable "number" {}

module "doubler" {
  source = "../"

  input = "${var.number}"
}
