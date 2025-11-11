resource "aws_instance" "name" {
  ami="ami-0cae6d6fe6048ca2c"
  instance_type = "t3.micro"
  tags = {
    Name="ec2-dev"
  }
}

resource "aws_s3_bucket" "name" {
  bucket = "yjiwankars3bucket"
}


//terraform plan -target=aws_s3_bucket.name
//terraform apply -target=aws_s3_bucket.name

//First, it will show the plan only the s3 bucket.
//Then create only the s3 bucket.

//target resources refer to the specific resources you want to apply or destroy 
//instead of running Terraform operations on all resources in your configuration.