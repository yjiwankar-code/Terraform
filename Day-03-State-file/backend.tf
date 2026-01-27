terraform {
  backend "s3" {
    bucket = "yjiwankar-test-bucket-1234567890-7709798512"
    key="Day-03-State-file/terraform.tfstate"
    region = "us-east-1"
  }
}
