terraform {
  backend "s3" {
    bucket = "yjiwankar-test-bucket-1234567890-7709798512"
    key = "Day-04-State-locking/terraform-tfstate"
    #use_lockfile = true  # to se s3 native locking version 1.19 and above
    region = "us-east-1"
    dynamodb_table = "yogesh" # for any version we can use dynamodb table for locking
    encrypt = true
  }
}