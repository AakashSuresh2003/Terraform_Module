resource "aws_instance" "Server" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name
  vpc_security_group_ids = var.security_group_id != "" ? [var.security_group_id] : []

  user_data     = templatefile(var.user_data_path, {})

  tags = {
    Name = var.instance_name
  }

  root_block_device {
    volume_size = var.volume_size
  }
}

resource "aws_security_group" "single-server" {
  count       = var.create_security_group ? 1 : 0
  name        = "single-server"
  description = "Allow TLS inbound traffic and all outbound traffic"

  ingress = [
    for port in var.allowed_ports : {
      description        = "Inbound rules"
      from_port          = port
      to_port            = port
      protocol           = "tcp"
      cidr_blocks        = ["0.0.0.0/0"]
      ipv6_cidr_blocks   = []        
      prefix_list_ids    = []        
      security_groups    = []        
      self               = false     
    }
  ]

  egress = [
    {
      description        = "Outbound rules"
      from_port          = 0
      to_port            = 0
      protocol           = "-1"
      cidr_blocks        = ["0.0.0.0/0"]
      ipv6_cidr_blocks   = []        
      prefix_list_ids    = []        
      security_groups    = []        
      self               = false    
    }
  ]

  tags = {
    Name = "single-server"
  }
}
