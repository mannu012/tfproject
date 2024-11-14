# Generate Private Key
resource "tls_private_key" "key1" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

# Create AWS Key Pair
resource "aws_key_pair" "ec2_key" {
  key_name   = "ec2-dev-250-key6738"
  public_key = tls_private_key.key1.public_key_openssh

  tags = {
    Name = "ec2-dev-tls-key"
  }
}

# Save the Private Key to a .pem File
resource "local_file" "key1_pem" {
  filename        = "ec2-dev-250-key6738.pem"
  content         = tls_private_key.key1.private_key_pem
  file_permission = "0400" # Ensure the file is only readable by the owner
}

output "private_key_path" {
  value = local_file.key1_pem.filename
}

//Creating security group
resource "aws_security_group" "dev-sg6738" {
  name        = "dev-sg6738-ssh-http"
  vpc_id      = "vpc-094579365b61b900d"
  description = "Allowing ssh and web traffic from server"
}

//Allowing incoming ssh traffic
resource "aws_vpc_security_group_ingress_rule" "dev-ingress-ssh" {
  security_group_id = aws_security_group.dev-sg6738.id
  from_port         = 22
  to_port           = 22
  ip_protocol       = "tcp"
  cidr_ipv4         = "0.0.0.0/0"
}

//Allowing income web traffic
resource "aws_vpc_security_group_ingress_rule" "dev-ingress-http" {
  security_group_id = aws_security_group.dev-sg6738.id
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
  cidr_ipv4         = "0.0.0.0/0"
}

//Allowing all outgoing traffing
resource "aws_vpc_security_group_egress_rule" "dev-egress" {
  security_group_id = aws_security_group.dev-sg6738.id
  ip_protocol       = "all"
  cidr_ipv4         = "0.0.0.0/0"
}



resource "aws_instance" "dev-web1" {
  ami =  "ami-0866a3c8686eaeeba"
  instance_type = "t2.micro"
  #vpc_security_group_ids = [ aws_security_group.dev-sg6738.id ]
  key_name = "ec2-dev-250-key6738"
  tags = {
    Name = "${var.env}-user13"
  }
}

output "vmpubip" {
  description = "This is public IP:"
  value = aws_instance.dev-web1.public_ip
}

output "vmpriip" {
  description = "This is private IP:"
  value = aws_instance.dev-web1.private_ip
}

resource "local_file" "vmdata" {
  filename = "vmIPdata.txt"
  content = <<-EOF
  public ip of vm is ${aws_instance.dev-web1.public_ip}
  with the private ip is ${aws_instance.dev-web1.private_ip}
  EOF
}

