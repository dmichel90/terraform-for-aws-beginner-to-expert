variable "server_names" {
  type = list(string)
}

resource "aws_instance" "db" {
  ami           = "ami-00cf59bc9978eb266"
  instance_type = "t2.micro"
  count = length(var.server_names)
  tags = {
    Name = var.server_names[count.index]
  }
}

output "PrivateIP" {
  value = [aws_instance.db.*.private_ip]
}