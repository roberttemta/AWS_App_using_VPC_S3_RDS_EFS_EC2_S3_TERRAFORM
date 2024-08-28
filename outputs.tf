
# display the outputs

output "alb-dns-link" {
  value = aws_lb.load-balancer.dns_name
}


output "public-ip" {
  value = aws_instance.server[*].public_ip
}


output "private-ip" {
  value = aws_instance.server[*].private_ip
}
/*
output "server2-private-ip" {
  value = aws_instance.server2.private_ip
}


output "ssh" {
  value = "ssh -i ${aws_instance.server1.key_name} ec2-user@${aws_instance.server1.public_ip}"
}
*/