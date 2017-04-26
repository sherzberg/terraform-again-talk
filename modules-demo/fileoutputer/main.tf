variable "input" {}

variable "filepath" {
  default = "/tmp/fileoutputer.txt"
}

resource "null_resource" "current_date" {

    provisioner "local-exec" {
        command = "echo ${var.input} > ${var.filepath}"
    }

    triggers {
        VERSION = "${var.input}"
    }

}

output "filepath" {
  value = "${var.filepath}"
}
