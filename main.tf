resource "tls_private_key" "tls_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  depends_on = [
    tls_private_key.tls_key
  ]

  key_name   = var.name
  public_key = tls_private_key.tls_key.public_key_openssh
}

resource "local_file" "key_file" {
  count = var.save ? 1 : 0
  depends_on = [
    tls_private_key.tls_key
  ]

  sensitive_content = tls_private_key.tls_key.private_key_pem
  filename = "${var.name}.pem"
}

resource "local_file" "pub_file" {
  count = var.save ? 1 : 0
  depends_on = [
    tls_private_key.tls_key
  ]

  content = tls_private_key.tls_key.public_key_openssh
  filename = "${var.name}.pub"
}