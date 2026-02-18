#! /bin/bash
sudo yum update -y
sudo yum install -y httpd
sudo systemctl start httpd 
sudo systemctl enable httpd
echo "<h1>Welcome Yogesh Jiwankar on Terraform Userdata</h1>" >/var/www/html/index.html
yum install git -y