terraform {
  backend "s3" {
    bucket = "yjiwankars3bucket"
    key = "Day-4/terraform.tfstate"
    region = "us-east-1"
  }
}