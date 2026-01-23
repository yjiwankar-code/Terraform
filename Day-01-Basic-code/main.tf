resource "aws_vpc" "name" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "my_vpc1"
    }
}

resource "aws_vpc" "my_vpc2" {
  cidr_block = "10.1.0.0/16"   
  tags = {
    Name="my_vpc2"
  }
}

resource "aws_subnet" "my_subnet1" {
  vpc_id            = aws_vpc.name.id
  cidr_block        = "10.0.1.0/24"
  tags = {
    Name = "my_subnet1"
  }
}