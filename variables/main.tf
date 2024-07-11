provider "aws" {
  region = "eu-central-1"
}

variable "vpcname" {
  type        = string
  description = "VPC name"
  default     = "myvpc"
}

variable "sshport" {
  type        = number
  description = "SSH port"
  default     = 22
}

variable "enabled" {
  type        = bool
  description = "Enable or disable the resource"
  default     = true
}

variable "mylist" {
  type    = list(string)
  default = ["a", "b", "c"]
}

variable "mymap" {
  type    = map(string)
  default = {
    key1 = "value1"
    key2 = "value2"
  }
}

variable "inputname" {
  type        = string
  description = "Set the name of the vpc"
}

variable "mytuple" {
  type    = tuple([string, number, string])
  default = ["cat", 1, "dog"]
}

variable "myobject" {
  type = object({
    name = string
    port  = list(number)
  })
  default = {
    name = "myvpc"
    port = [22, 25, 80]
  }
}

resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = var.inputname
  }
}

output "vpcid" {
  value = aws_vpc.myvpc.id
}