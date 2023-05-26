output "public_ip_of_Bastion1" {
  value = aws_instance.nat_instance1.public_ip
}

output "public_ip_of_bastion2" {
  value = aws_instance.nat_instance2.public_ip
}

output "lb_dns_name" {
  description = "The DNS name of the load balancer"
  value       = aws_lb.external-alb.dns_name
}
