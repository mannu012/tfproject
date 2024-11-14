#create vpc,subnet, atach ec2 instance with subnet
#variable "vpccidrinfo" {
#  description = "Supply VPC cidr block"
#  default = "10.199.0.0/16"
#}

variable "env" {
  description = "Supply env requirement"
  default = "default dev"
}
variable "wsnet" {
  description = "supply first subnet cidr"
  default = "10.122.13.0/24"
}

variable "wsnet2" {
  description = "supply second subnet cidr"
  default = "10.122.110.0/24"
}


# variable "env" {
#   description = "Supply env requirement"
#  default = "network env"
#}
#//