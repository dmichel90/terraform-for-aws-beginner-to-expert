provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "db" {
  ami           = "ami-00cf59bc9978eb266"
  instance_type = "t2.micro"
  count         = 3
}