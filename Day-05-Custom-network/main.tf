// Creat VPC
resource "aws_vpc" "name" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name="custom-vpc"
  }
}

// Create Subnet
resource "aws_subnet" "primary" {
  vpc_id = aws_vpc.name.id
  tags = {
    Name="custom-subnet-1"
  }
  availability_zone = "us-east-1a"
  cidr_block = "10.0.0.0/24"
}

resource "aws_subnet" "secondary" {
  vpc_id = aws_vpc.name.id
  tags = {
    Name="custom-subnet-2"
  }
  availability_zone = "us-east-1b"
  cidr_block = "10.0.1.0/24"
}

// Create Internet Gateway and attche to VPC
resource "aws_internet_gateway" "name" {
  tags = {
    Name="custom-igw"
  }
  vpc_id = aws_vpc.name.id
}

// Create Route Table and route to Intenet Gateway
resource "aws_route_table" "name" {
  tags = {
    Name="custom-rt"
  }
  vpc_id = aws_vpc.name.id

  route{
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.name.id
  }
}

// Create Route table association with Subnet (Only associate firdst subnt)
resource "aws_route_table_association" "name" {
  subnet_id =  aws_subnet.primary.id
  route_table_id = aws_route_table.name.id
}

// Create Security Group with HTTP, HTTPS and SSH access from anywhere 
resource "aws_security_group" "name" {
  name = "custom-sg"
  description = "Allow HTTP, HTTPS and SSH"
  vpc_id = aws_vpc.name.id
  tags = {
    Name="custom-sg"
  }
  
  ingress {
    from_port = 80
    to_port = 80
    cidr_blocks = ["0.0.0.0/0"]
    protocol = "tcp"
    description = "Allow HTTP"
  }
  ingress {
    from_port = 443
    to_port = 443
    cidr_blocks = ["0.0.0.0/0"]
    protocol = "tcp"
    description = "Allow HTTPS"
  }
  ingress {
      from_port = 22
      to_port = 22
      cidr_blocks = ["0.0.0.0/0"]
      protocol = "tcp"
      description = "Allow SSH"
  }
  ingress {
      from_port = 0
      to_port = 0
      cidr_blocks = ["0.0.0.0/0"]
      protocol = "-1"
      description = "Allow all traffic"
  }

  egress {
    to_port = 80  
    from_port = 80
    cidr_blocks = ["0.0.0.0/0"]
    protocol = "tcp"
    description = "Allow HTTP"
  }
  egress {
    to_port = 443  
    from_port = 443
    cidr_blocks = ["0.0.0.0/0"]
    protocol = "tcp"  
    description = "Allow HTTPS"
  }
  egress {
    to_port = 22  
    from_port = 22
    cidr_blocks = ["0.0.0.0/0"]
    protocol = "tcp"
    description = "Allow SSH"
  }
  egress {
    to_port = 0  
    from_port = 0
    cidr_blocks = ["0.0.0.0/0"]
    protocol = "-1"
    description = "Allow all traffic"
  }
}

// Create EC2 instance in the subnet with above secrity group
resource "aws_instance" "public" {
  tags = {
    Name = "custom-ec2-public"
  }
  ami = "ami-0532be01f26a3de55"
  instance_type = "t3.micro"
  subnet_id = aws_subnet.primary.id
  vpc_security_group_ids = [aws_security_group.name.id] 
  associate_public_ip_address = true
}

resource "aws_instance" "private" {
  tags = {
    Name = "custom-ec2-private"
  }
  ami = "ami-0532be01f26a3de55"
  instance_type = "t3.micro"
  subnet_id = aws_subnet.secondary.id
  vpc_security_group_ids = [aws_security_group.name.id] 
}

// Create EIP
// Create NAT
// Create route table and edit route table association
// Route table association