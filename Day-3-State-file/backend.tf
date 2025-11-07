terraform {
  backend "s3" {
    bucket = "yjiwankars3bucket"
    key    = "day-3/terraform.tfstate"
    region = "us-east-1"
  }
}
