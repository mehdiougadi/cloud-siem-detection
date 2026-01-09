provider "aws" {
  region = "ca-central-1"
}

module "networking" {
  source = "./modules/networking"

  vpc_cidr           = "10.0.0.0/16"
  vpc_name           = "main-vpc"
  subnet_cidr        = "10.0.1.0/24"
  availability_zone  = "ca-central-1a"
  enable_nat_gateway = false

  tags = {
    Environment = "dev"
  }
}

module "security" {
  source = "./modules/security"

  sg_name     = "web-sg"
  description = "Security group for web server"
  vpc_id      = module.networking.vpc_id

  rules = [
    {
      direction   = "ingress"
      description = "SSH"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      direction   = "ingress"
      description = "HTTP"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      direction   = "egress"
      description = "All outbound"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}

module "compute" {
  source = "./modules/compute"

  subnet_id         = module.networking.public_subnet_id
  ami_id            = "ami-0c55b159cbfafe1f0"
  instance_type     = "t2.micro"
  instance_name     = "web-server"
  security_group_id = module.security.security_group_id
  key_name          = "your-key-name"
  user_data         = ""
  instance_count    = 1
}