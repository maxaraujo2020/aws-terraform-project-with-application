resource "aws_nat_gateway" "nat-gateway" {
  allocation_id = var.allocation_id
  subnet_id     = var.subnet_id
  tags = {
    Name = var.name
  }
}

output "nat_gateway_id" {
  value = aws_nat_gateway.nat-gateway.id
}
