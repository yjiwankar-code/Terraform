variable "my-vpc-tag" {
  description = "defining the vpc name"
  default = ""
  type=string
}

variable "my-subnet-tag" {
  description = "defining my subnet name"
  default = ""
  type = string
}

variable "dev-ec2-name" {
  description = "defining dev ec2 name"
  default = ""
  type = string
}

variable "dev-ec2-ami" {
  description = "adding ami id"
  default = ""
  type = string
}

variable "ec2-instance-type" {
  description = "Instance type specification"
  default = ""
  type = string
}

variable "my-vpc-cidr" {
  description = "defining my vpc cidr"
  default =""
  type = string
}

variable "my-sbnet-cidr" {
  description = "defining my subnet cidr"
  default = ""
  type = string
}