terraform {
  backend "s3" {
    bucket = "dmi-remote-backend-2024"
    key = "terraform/tfstate.tfstate"
    region = "eu-central-1"
    access_key = <<YOUR_ACCESS_KEY>>
    secret_key = <<YOUR_SECRET_KEY>>
  }
}