variable "ami_id" {
  description = "addig ami id"
  default = ""
  type = string
}

variable "instance_type" {
  description = "providing instance type"
  default = ""
  type = string
}

variable "tag_name" {
  description = "instance tag name"
  default = ""
  type = string
}

variable "vpc_tag_name" {
  description = "Adding tag name to vpc"
  default = ""
  type = string
}

variable "subnet_tag_name" {
  description = "Adding tag name to subnet"
  default = ""
  type = string
}