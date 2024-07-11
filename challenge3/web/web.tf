resource "aws_instance" "web" {
  ami           = "ami-00cf59bc9978eb266"
  instance_type = "t2.micro"
  tags = {
    Name = "Web Server"
  }
  security_groups = [module.security_group_web.security_group_name]
  user_data = file("userdata.sh")
}

module "security_group_web" {
  source = "../sg"
}

module "eip" {
  source      = "../eip"
  instance_id = aws_instance.web.id
}

output "pub_ip" {
  value = module.eip.PublicIP
}