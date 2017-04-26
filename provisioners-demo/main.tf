
variable "version" {
    default = 2
}

resource "null_resource" "current_date" {

    provisioner "local-exec" {
        command = "echo $(date) > current.date.${var.version}"
    }

    triggers {
        VERSION = "${var.version}"
    }

}
