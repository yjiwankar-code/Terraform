resource "aws_instance" "name" {
  instance_type = "t3.micro"
  ami = "ami-0532be01f26a3de55"
  availability_zone = "us-east-1a"
  tags = {
    Name="dev"
  }
}

resource "aws_s3_bucket" "name" {
  bucket = "yjiwankar-terraform-bucket-2026"
}


//target resource, we can use to apply changes to specific resource only
//$ terraform apply -target=aws_s3_bucket.name


//target resource, we can use to destroy changes to specific resource only
//$ terraform destroy -target=aws_s3_bucket.name


//We can give multple targest like below 
//$ terraform apply -target=aws_s3_bucket.name -target=aws_instance.name