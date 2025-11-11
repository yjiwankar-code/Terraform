//Create VPC
resource "aws_vpc" "name" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name="Custom_VPC"
  }
}

//Create Subnets
resource "aws_subnet" "name" {
  cidr_block="10.0.0.0/24"
  vpc_id=aws_vpc.name.id
  availability_zone="us-east-1a"
  tags = {
      Name="custom_Subnet1"
    }
}

resource "aws_subnet" "name-2" {
  cidr_block = "10.0.1.0/24"
    vpc_id = aws_vpc.name.id
    availability_zone = "us-east-1b"
    tags = {
      Name="custom_Subnet2"
    }
}

//Create Internet Gateway and attach to VPC
resource "aws_internet_gateway" "name" {
  vpc_id = aws_vpc.name.id
}

//Create Route Table and Edit Routes
resource "aws_route_table" "name" {
  vpc_id = aws_vpc.name.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.name.id
    }
}

//Associate Subnets with Route Table
resource "aws_route_table_association" "name" {
    subnet_id = aws_subnet.name.id
    route_table_id = aws_route_table.name.id
}

//Create Security Group and add Inbound Rules
resource "aws_security_group" "name" {
  vpc_id = aws_vpc.name.id
    name = "Allow_tls"
    tags = {
      Name="custom-SG"
    }
    ingress {
      description = "HTTP"
      from_port = 80
      to_port = 80
      protocol = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
      description = "SSH"
      from_port = 22
      to_port = 22
      protocol = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
      description = "HTTPS"
      from_port = 443
      to_port = 443
      protocol = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
}

//Create EC2 Instances
resource "aws_instance" "ec2-public" {
    ami="ami-0cae6d6fe6048ca2c"
    instance_type = "t3.micro"
    subnet_id = aws_subnet.name.id
    vpc_security_group_ids = [aws_security_group.name.id]
    associate_public_ip_address = true
    tags = {
        Name="custom-ec2-public"
    }    
}

resource "aws_instance" "ec2-private" {
  ami = "ami-0157af9aea2eef346"
  instance_type = "t3.micro"
  subnet_id = aws_subnet.name-2.id
  vpc_security_group_ids = [aws_security_group.name.id]
  tags = {
    Name="custom-ec2-private"
  }
}

//Create EIP

//Create NAT Gateway

//Create Route Table for Private Subnet and Edit Routes

//Associate Private Subnet with Route Table