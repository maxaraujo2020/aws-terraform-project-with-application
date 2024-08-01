output "sg_egress_id" {
  value = module.security-group-egress.security_group_egress_id
}

output "sg_egress_db_id" {
  value = module.security-group-egress-db.security_group_egress_id
}

output "sg_ingress_alb_id" {
  value = module.security-group-ingress-alb.security_group_ingress_id
}

output "sg_ingress_db_id" {
  value = module.security-group-ingress-db.security_group_ingress_id
}

output "sg_ingress_ec2_id" {
  value = module.security-group-ingress-ec2.security_group_ingress_id
}
