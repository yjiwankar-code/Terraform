resource "aws_instance" "name" {
  ami = "ami-0cae6d6fe6048ca2c"
  instance_type = "t3.micro"
  tags = {
    Name="ec2-test"
  }

    # lifecycle {
    #   prevent_destroy = true
    # }

    # lifecycle {
    #   ignore_changes = [ tag, ]
    # }

    # lifecycle {
    #   create_before_destroy = true
    # }
}

