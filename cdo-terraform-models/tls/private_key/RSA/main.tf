resource "tls_private_key" "private-key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

output "private_key_public" {
  value = tls_private_key.private-key.public_key_openssh
}
