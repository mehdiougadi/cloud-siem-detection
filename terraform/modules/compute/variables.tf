variable "subnet_id" {
  description = "The ID of the VPC subnet where the EC2 instance will be launched"
  type        = string
}

variable "instance_type" {
  description = "The EC2 instance type"
  type        = string
}

variable "ami_id" {
  description = "The ID of the Amazon Machine Image (AMI) to use for the instance"
  type        = string
}

variable "instance_name" {
  description = "The name tag to assign to the EC2 instance"
  type        = string
}

variable "security_group_id" {
  description = "The ID of the security group to attach to the instance"
  type        = string
}

variable "user_data" {
  description = "The user data script or configuration to run at instance launch"
  type        = string
}

variable "key_name" {
  description = "The name of the SSH key pair to use for instance access"
  type        = string
}

variable "count" {
  description = "The number of EC2 instances to create"
  type        = number
}