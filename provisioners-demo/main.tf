variable "version" {
  default = 1
}

resource "null_resource" "current_date" {
  provisioner "local-exec" {
    command = "echo $(date) > current.date.${var.version}"
  }

  triggers {
    VERSION = "${var.version}"
  }
}
