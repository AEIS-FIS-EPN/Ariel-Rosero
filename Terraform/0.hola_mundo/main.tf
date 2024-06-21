//Variables
variable  "greeting" {
    type = string
    default = "Hello, World!"
}

variable "terrafor_welcome" {
    type = string
    default = "Welcome to Terraform"
}

//Salida

output "creative_greeting" {
    value = "${var.greeting}, ${var.terrafor_welcome}"
}



