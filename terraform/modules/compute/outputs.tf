output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.this[0].id
}

output "instance_public_ip" {
  description = "The public IP address of the EC2 instance"
  value       = aws_instance.this[0].public_ip
}

output "instance_private_ip" {
  description = "The private IP address of the EC2 instance"
  value       = aws_instance.this[0].private_ip
}

output "instance_arn" {
  description = "The ARN of the EC2 instance"
  value       = aws_instance.this[0].arn
}