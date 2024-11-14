#output "vpcdata" {
# value = aws_vpc.vnet.cidr_block
#}
output "subnetdata" {
  value = aws_subnet.sn1.cidr_block
}
output "subnetiddata" {
  value = aws_subnet.sn1.id
}

output "subnetiddata2" {
  value = aws_subnet.sn2.id
}