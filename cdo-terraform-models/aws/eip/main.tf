resource "aws_eip" "eip" {
  domain = "vpc"
  tags = {
    Name = var.name
  }
}

output "eip_id" {
  value = aws_eip.eip.id
}
