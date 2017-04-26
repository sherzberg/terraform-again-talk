variable "input" {}

output "doubled" {
  value = "${2 * var.input}"
}
