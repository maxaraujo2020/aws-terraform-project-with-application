resource "aws_key_pair" "key-pair" {
  key_name   = var.key_name
  public_key = var.public_key
}

output "key_pair_name" {
  value = aws_key_pair.key-pair.key_name
}
