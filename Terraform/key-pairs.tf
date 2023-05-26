# Use RSA Algorithm to Create Keys 

resource "tls_private_key" "demo_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# resource to create key pair
resource "aws_key_pair" "generated_key" {
  key_name   = "lab-key"
  public_key = tls_private_key.demo_key.public_key_openssh
}

# resource to save the private key on my local 
resource "null_resource" "foo" {


  provisioner "local-exec" {
    command = "echo '${tls_private_key.demo_key.private_key_pem}' > /Desktop/Terraform-Ansible-3-Tier-Architecture-Project/Ansible/lab-key.pem | sudo chmod 600 /Desktop/Terraform-Ansible-3-Tier-Architecture-Project/Ansible/lab-key.pem"
  }
}
