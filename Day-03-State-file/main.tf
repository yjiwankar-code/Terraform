resource "aws_instance" "name" {
  ami = var.dev-ec2-ami
  instance_type = var.ec2-instance-type
  tags = {
    Name=var.dev-ec2-name
  }
  subnet_id = aws_subnet.my_subnet.id
}

resource "aws_vpc" "my_vpc" {
  cidr_block = var.my-vpc-cidr
  tags = {
    Name=var.my-vpc-tag
  }
}

resource "aws_subnet" "my_subnet" {
  cidr_block = var.my-sbnet-cidr
  vpc_id= aws_vpc.my_vpc.id
  tags = {
    Name=var.my-subnet-tag
  }
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "yjiwankar-test-bucket-1234567890-7709798512"
}




