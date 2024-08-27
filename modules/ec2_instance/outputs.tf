output "instance_id" {
  description = "The ID of the created EC2 instance"
  value       = aws_instance.Server.id
}

output "instance_public_ip" {
  description = "The public IP address of the created EC2 instance"
  value       = aws_instance.Server.public_ip
}

output "security_group_id" {
  description = "The ID of the created security group"
  value       = aws_security_group.single-server[0].id
}

output "security_group_name" {
  description = "The name of the created security group"
  value       = aws_security_group.single-server[0].name
}
