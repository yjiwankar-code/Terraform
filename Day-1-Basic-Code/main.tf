resource "aws_vpc" "name1" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "dev-vpc1"
  }
}

resource "aws_vpc" "name2" {
  cidr_block="10.1.0.0/16"
  tags={
    Name="dev-vpc2"
  }
}

resource "aws_subnet" "name-subnet-1" {
  vpc_id = aws_vpc.name1.id
  cidr_block = "10.0.0.0/24"
  tags = {
    Name="mysubnest1"
  }
}

resource "aws_subnet" "name-subnet-2" {
  vpc_id = aws_vpc.name2.id 
  cidr_block = "10.1.0.0/24"
  tags = {
    Name="mysubnet2"
  }
}