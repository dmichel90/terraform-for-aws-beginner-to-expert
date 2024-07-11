provider "aws" {
  region = "eu-central-1"
}

variable "ingressrules" {
  type = list(number)
  default = [80,443]
}

variable "egressrules" {
  type = list(number)
  default = [80,443]
}

resource "aws_instance" "db" {
  ami           = "ami-00cf59bc9978eb266"
  instance_type = "t2.micro"
  tags = {
    Name = "DB Server"
  }
}

resource "aws_instance" "web" {
  ami           = "ami-00cf59bc9978eb266"
  instance_type = "t2.micro"
  tags = {
    Name = "Web Server"
  }
  security_groups = [aws_security_group.webtraffic.name]
  user_data = file("userdata.sh")
}

resource "aws_eip" "web_ip" {
  instance = aws_instance.web.id
}

resource "aws_security_group" "webtraffic" {
  name = "Allow web traffic"
  dynamic "ingress" {
    iterator = port
    for_each = var.ingressrules
    content {
      to_port = port.value
      from_port = port.value
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  dynamic "egress" {
    iterator = port
    for_each = var.egressrules
    content {
      to_port = port.value
      from_port = port.value
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

output "PrivateIP" {
  value = aws_instance.db.private_ip
}

output "PublicIP" {
  value = aws_eip.web_ip.public_ip
}