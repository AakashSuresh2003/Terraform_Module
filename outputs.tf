output "instance_id" {
  description = "The ID of the created EC2 instance"
  value       = module.ec2_instance.instance_id
}

output "instance_public_ip" {
  description = "The public IP address of the created EC2 instance"
  value       = module.ec2_instance.instance_public_ip
}

output "security_group_id" {
  description = "The ID of the created security group"
  value       = module.ec2_instance.security_group_id
}

output "security_group_name" {
  description = "The name of the created security group"
  value       = module.ec2_instance.security_group_name
}
