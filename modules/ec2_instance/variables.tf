variable "ami" {
  description = "The AMI ID for the instance"
  type        = string
}

variable "instance_type" {
  description = "The type of instance"
  type        = string
}

variable "key_name" {
  description = "The key name for SSH access"
  type        = string
}

variable "user_data_path" {
  description = "Path to the user data script"
  type        = string
}

variable "instance_name" {
  description = "The name tag for the instance"
  type        = string
}

variable "volume_size" {
  description = "The size of the root block device"
  type        = number
  default     = 20
}

variable "allowed_ports" {
  description = "List of allowed inbound ports"
  type        = list(number)
  default     = [22, 80, 443, 8080, 9000]
}

variable "security_group_id" {
  description = "Optional security group ID to attach to the instance"
  type        = string
  default     = ""
}

variable "create_security_group" {
  description = "Whether to create a new security group"
  type        = bool
  default     = false
}
