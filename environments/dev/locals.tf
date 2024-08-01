locals {
  app_name    = "infoot-fun"
  aws_region  = "eu-west-1"
  author      = "devoteam-a-cloud"
  author_mail = "devoteam"

  container_definitions_path = abspath("${path.root}/../../application/container_definitions.tftpl")
  docker_host                = "unix:///var/run/docker.sock"

  db_instance_name     = "postgres"
  db_instance_port     = 5432
  db_instance_username = "postgres_admin"

  listener_port   = 443
  path_pattern    = ["/*"]
  fqdn_list       = ["dev-app.inpark.pt"]
  certificate_arn = "arn:aws:acm:eu-west-1:767398084915:certificate/cf4d084e-43f0-4329-add0-2e3b8332f2e9"
}
