terraform {
  backend "s3" {
    bucket = "yjiwankars3bucket"
    key = "Day-4/terraform.tfstate"
    //use_lockfile = true
    region = "us-east-1"
    dynamodb_table = "yogesh"
    encrypt = true
  }
}