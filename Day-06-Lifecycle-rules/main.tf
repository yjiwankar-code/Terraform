resource "aws_instance" "name" {
  instance_type = "t3.micro"
  ami = "ami-0532be01f26a3de55"
  tags = {
    Name="test"
  }
# lifecycle {
#     prevent_destroy = true
# }

# lifecycle {
#   ignore_changes = [ tags, ]
# }

lifecycle {
  create_before_destroy = true
}

}