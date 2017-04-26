variable "input" {
  default = 6
}

module "doubler" {
  source = "./doubler"

  input = "${var.input}"
}

module "fileoutputer" {
  source = "./fileoutputer"

  input = "${module.doubler.doubled}"
}

output "fileoutput" {
  value = "${module.fileoutputer.filepath}"
}
