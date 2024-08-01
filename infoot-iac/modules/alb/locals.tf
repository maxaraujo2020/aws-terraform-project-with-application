locals {
  raw_data       = jsondecode(file(var.container_definitions_path))
  container_port = tonumber(local.raw_data[0].portMappings[0].containerPort)
}
