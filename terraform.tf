# Setup variables. The access_key and secret_key have to
# be passed in or set as environment variables
variable "access_key" {}
variable "secret_key" {}
variable "region" { 
    default = "us-east-1" 
}
variable "amis" {
    default = {
        us-east-1 = "ami-60b6c60a" 
        us-west-1 = "ami-d5ea86b5"
        us-west-2 = "ami-f0091d91"
    }
}

# Establish the provider
provider "aws" {
    access_key = "${var.access_key}"
    secret_key = "${var.secret_key}"
    region = "${var.region}"
}

# Begin building our resources
resource "aws_instance" "example" {
    ami = "${lookup(var.amis, var.region)}"
    instance_type = "t1.micro"

    provisioner "local-exec" {
        command = "echo ${aws_instance.example.public_ip} > inventory"
    }
}

resource "aws_eip" "ip" {
    instance = "${aws_instance.example.id}"
}

# Information to output that can be picked up
# and used again
output "ip" {value = "${aws_eip.ip.public_ip}"}