resource "aws_instance" "this" {
  subnet_id     = var.subnet_id
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  user_data     = var.user_data
  count         = var.instance_count

  vpc_security_group_ids = [var.security_group_id]

  tags = {
    Name = var.instance_name
  }

}