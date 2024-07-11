provider "aws" {
  region = "eu-central-1"
}

variable "vpcname" {
  type = string
  description = "Name of the VPC"
  default = "TerraformVPC"
}

resource "aws_vpc" "myvpc" {
  cidr_block = "192.168.0.0/24"
  tags = {
    Name = var.vpcname
  }
}