resource "aws_instance" "db" {
  ami           = "ami-00cf59bc9978eb266"
  instance_type = "t2.micro"
  tags = {
    Name = "DB Server"
  }
}

output "PrivateIP" {
  value = aws_instance.db.private_ip
}