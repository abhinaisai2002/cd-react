resource "aws_vpc" "main" {
  cidr_block       = var.aws_vpc_cidr

  tags = {
    Name = "cicd vpc" 
  }

  enable_dns_hostnames = true
  enable_dns_support = true
}