variable "sg_name" {
    description = "Name of the security group"
    type = string
}

variable "description" {
    description = "Description of the security group"
    type = string
}

variable "vpc_id" {
    description = "ID of the VPC where security groups will be created"
    type = string
}

variable "rules" {
    description = "Security group rules (ingress and egress)"
    type = list(object({
        direction = string
        description = optional(string)
        from_port = number
        to_port = number
        protocol = string
        cidr_blocks = optional(list(string))
        ipv6_cidr_blocks = optional(list(string))
        security_groups = optional(list(string))
        self = optional(bool)
    }))
}
