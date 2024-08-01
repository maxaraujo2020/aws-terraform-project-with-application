output "network_vpc_id" {
  value = module.vpc.vpc_id
}

output "network_subnet_public" {
  value = module.subnet-public
}

output "network_subnet_private" {
  value = module.subnet-private
}

output "network_vpc_cidr" {
  value = module.vpc.vpc_cidr_block
}