module "modcompute" {
  source = "./modules/compute"
  #env = "dev"
  #ec2size = "t2.micro"
  subnetid = module.modnet.subnetiddata
}

module "modnet" {
  source = "./modules/network"
}

output "moudout" {
  value = module.modnet
}
output "modoutcompute" {
  value = module.modcompute
}

