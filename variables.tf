variable "ami" {
  description = "The AMI ID to use for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "The type of instance to start"
  type        = string
}

variable "key_name" {
  description = "The key name to use for the instance"
  type        = string
}

variable "user_data_path" {
  description = "Path to the user data file"
  type        = string
}

variable "instance_name" {
  description = "Name tag for the instance"
  type        = string
}

variable "volume_size" {
  description = "Size of the root volume in GiB"
  type        = number
}

variable "security_group_id" {
  description = "ID of an existing security group"
  type        = string
  default     = ""
}

variable "create_security_group" {
  description = "Whether to create a new security group"
  type        = bool
  default     = true
}
