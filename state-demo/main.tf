
variable "location" {
    default = "sparta"
}

data "template_file" "my_template" {
    template = "this is $${location}"

    vars {
        location = "${var.location}"
    }
}
