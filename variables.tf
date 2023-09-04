variable "aws_region" {
  description = "region of aws"
  type = string
  default = "ap-south-1"
}

variable "aws_vpc_cidr" {
  description = "cidr  of aws vpc"
  type = string
  default = "10.0.0.0/16"
}