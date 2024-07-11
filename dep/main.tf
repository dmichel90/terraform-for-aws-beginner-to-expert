provider "aws" {
  region = "eu-central-1"
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

  depends_on = [aws_instance.db]
}

data "aws_instance" "dbsearch" {
  filter {
    name = "tag:Name"
    values = ["DB Server"]
  }
}

output "dbservers" {
  value = data.aws_instance.dbsearch.availability_zone
}