resource "aws_vpc" "name" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name="Test-VPC"
  }
}

resource "aws_subnet" "name" {
  cidr_block = "10.0.0.0/24"
  vpc_id = aws_vpc.name.vpc_id
  tags = {
    Name="Test-Subnet"
  }
}