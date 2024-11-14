#resource "aws_vpc" "vnet" {
 # cidr_block = var.vpccidrinfo
  #tags = {
  #  Nmae = "vpc - ${var.env}"
  #}
#}

resource "aws_subnet" "sn1" {
  cidr_block = var.wsnet
  vpc_id = "vpc-094579365b61b900d"
  tags = {
    Name = "subnet1-6738"
  }
}

resource "aws_subnet" "sn2" {
  cidr_block = var.wsnet2
  vpc_id = "vpc-094579365b61b900d"
  tags = {
    Name = "subnet2-6738"
  }
}
