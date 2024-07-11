provider "aws" {
  region = "eu-central-1"
}

module "ec2_db" {
  source = "./db"
}

module "ec2_web" {
  source              = "./web"
}

output "PrivateIP" {
  value = module.ec2_db.PrivateIP
}

output "PublicIP" {
  value = module.ec2_web.pub_ip
}