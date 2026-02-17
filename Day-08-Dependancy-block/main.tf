resource "aws_instance" "name" {
  instance_type = var.type
  ami = var.ami_id
  tags = {
    Name="prod"
  }
  depends_on = [ aws_s3_bucket.name ]
}

resource "aws_s3_bucket" "name" {
  bucket = "yjiwankar-unique-bucket-name-1234567890"
}