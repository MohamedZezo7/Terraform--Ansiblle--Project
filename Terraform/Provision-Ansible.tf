resource "null_resource" "ansible_inventory" {
  provisioner "local-exec" {
    interpreter = ["bash", "-c"]
    command     = <<EOT
            echo "
              [front]
              ${aws_instance.web-instance1.public_ip}
              ${aws_instance.web-instance2.public_ip}

              [application:vars]
              ansible_user = ec2-user

              [application]
              ${aws_instance.app-instance1.public_ip}
              ${aws_instance.app-instance2.public_ip}

              [application:vars]
              ansible_user = ec2-user

              ansible_port = 22 
              private_key_file = /Desktop/Terraform-Ansible-3-Tier-Architecture-Project/Ansible/lab-key.pem

               >> /Desktop/Terraform-Ansible-3-Tier-Architecture-Project/Ansible/inventory "
    
               EOT
  }

}

resource "null_resource" "run_ansible" {
  provisioner "local-exec" {

    interpreter = ["bash", "-c"]
    command     = <<EOT
           cd ./ansible && ansible-playbook --private-key ./lab-key.pem playbook.yaml -vvv
     EOT
  }

  depends_on = [
    null_resource.ansible_inventory
  ]
}
