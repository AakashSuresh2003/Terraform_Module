module "ec2_instance" {
  source              = "./modules/ec2_instance"
  ami                 = var.ami
  instance_type       = var.instance_type
  key_name            = var.key_name
  user_data_path      = var.user_data_path
  instance_name       = var.instance_name
  volume_size         = var.volume_size
  security_group_id   = var.security_group_id
  create_security_group = var.create_security_group
}
