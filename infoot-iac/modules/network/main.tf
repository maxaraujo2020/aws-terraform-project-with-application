# Creates VPC, subnet, internet gateway and route table

module "vpc" {
  source     = "../../../cdo-terraform-models/aws/vpc"
  name       = "${var.app_name}-vpc"
  cidr_block = var.vpc_cidr_block
}

module "subnet-public" {
  source                  = "../../../cdo-terraform-models/aws/subnet"
  availability_zone       = data.aws_availability_zones.availability-zones.names[count.index]
  cidr_block              = cidrsubnet(module.vpc.vpc_cidr_block, 8, count.index)
  count                   = var.availability_zones_count
  map_public_ip_on_launch = true
  name                    = "${var.app_name}-subnet-public"
  vpc_id                  = module.vpc.vpc_id
  depends_on              = [module.vpc]
}

module "subnet-private" {
  source            = "../../../cdo-terraform-models/aws/subnet"
  availability_zone = data.aws_availability_zones.availability-zones.names[count.index]
  cidr_block        = cidrsubnet(module.vpc.vpc_cidr_block, 8, var.availability_zones_count + count.index)
  count             = var.availability_zones_count
  name              = "${var.app_name}-subnet-private"
  vpc_id            = module.vpc.vpc_id
  depends_on        = [module.vpc]
}

module "internet-gateway" {
  source     = "../../../cdo-terraform-models/aws/internet_gateway"
  name       = "${var.app_name}-internet-gateway"
  vpc_id     = module.vpc.vpc_id
  depends_on = [module.vpc]
}

module "eip" {
  source     = "../../../cdo-terraform-models/aws/eip"
  name       = "${var.app_name}-internet-gateway"
  depends_on = [module.vpc]
}

module "nat_gateway" {
  source        = "../../../cdo-terraform-models/aws/nat_gateway"
  name          = "${var.app_name}-nat-gateway"
  allocation_id = module.eip.eip_id
  subnet_id     = module.subnet-public.0.subnet_id
  depends_on    = [module.vpc, module.internet-gateway]
}

module "route-table-public" {
  source     = "../../../cdo-terraform-models/aws/route_table/route"
  name       = "${var.app_name}-route-table-public"
  gateway_id = module.internet-gateway.internet_gateway_id
  vpc_id     = module.vpc.vpc_id
  depends_on = [
    module.internet-gateway,
    module.vpc
  ]
}

module "route-table-private" {
  source     = "../../../cdo-terraform-models/aws/route_table/route"
  name       = "${var.app_name}-route-table-private"
  gateway_id = module.nat_gateway.nat_gateway_id
  vpc_id     = module.vpc.vpc_id
  depends_on = [
    module.nat_gateway,
    module.vpc
  ]
}

module "route-table-association-public" {
  source         = "../../../cdo-terraform-models/aws/route_table_association"
  count          = var.availability_zones_count
  route_table_id = module.route-table-public.route_table_id
  subnet_id      = element(module.subnet-public.*.subnet_id, count.index)
  depends_on = [
    module.route-table-public,
    module.subnet-public
  ]
}

module "route-table-association-private" {
  source         = "../../../cdo-terraform-models/aws/route_table_association"
  count          = var.availability_zones_count
  route_table_id = module.route-table-private.route_table_id
  subnet_id      = element(module.subnet-private.*.subnet_id, count.index)
  depends_on = [
    module.route-table-private,
    module.subnet-private
  ]
}

module "main-route-table-association" {
  source         = "../../../cdo-terraform-models/aws/main_route_table_association"
  route_table_id = module.route-table-public.route_table_id
  vpc_id         = module.vpc.vpc_id
  depends_on = [
    module.route-table-public,
    module.vpc
  ]
}
