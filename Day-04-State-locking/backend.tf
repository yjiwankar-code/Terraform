terraform {
  backend "s3" {
    bucket = "yjiwankar-test-bucket-1234567890-7709798512"
    key = "Day-04-State-locking/terraform-tfstate"
    region = "us-east-1"
  }
}