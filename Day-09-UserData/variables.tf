variable "type" {
  description = "Type of the instance"
  default     = ""
  type=string
}

variable "ami_id" {
    description = "AMI ID for the instance"
    default     = ""
    type=string
}

variable "tag_name" {
  description = "Name of the tag to be applied"
  default     = ""
  type=string
}