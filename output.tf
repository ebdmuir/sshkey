output "privkey" {
  value = ls_private_key.tls_key.private_key_pem
}

output "pubkey" {
  value = ls_private_key.tls_key.public_key_openssh
}