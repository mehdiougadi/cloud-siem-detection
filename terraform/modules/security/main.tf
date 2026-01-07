resource "aws_security_group" "this" {
  name        = var.sg_name
  description = var.description
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = [for rule in var.rules : rule if rule.direction == "ingress"]
    content {
      description      = ingress.value.description
      from_port        = ingress.value.from_port
      to_port          = ingress.value.to_port
      protocol         = ingress.value.protocol
      cidr_blocks      = ingress.value.cidr_blocks
      ipv6_cidr_blocks = ingress.value.ipv6_cidr_blocks
      security_groups  = ingress.value.security_groups
      self             = ingress.value.self
    }
  }

  dynamic "egress" {
    for_each = [for rule in var.rules : rule if rule.direction == "egress"]
    content {
      description      = egress.value.description
      from_port        = egress.value.from_port
      to_port          = egress.value.to_port
      protocol         = egress.value.protocol
      cidr_blocks      = egress.value.cidr_blocks
      ipv6_cidr_blocks = egress.value.ipv6_cidr_blocks
      security_groups  = egress.value.security_groups
      self             = egress.value.self
    }
  }

  tags = {
    Name = var.sg_name
  }
}