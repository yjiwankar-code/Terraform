ami_id ="ami-07ff62358b87c7116"
instance_type="t3.micro"
tag_name="dev"
vpc_tag_name="my-vpc" 
subnet_tag_name="my-subnet"


# terraform plan -var-file="dev.tfvars" 
# terraform apply -var-file="dev.tfvars" 
# if var file is different than default name like dev.tfvars 
# instead of terraform.tfvars