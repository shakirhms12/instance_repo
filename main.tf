provider "aws" {
  region     = "us-east-1" 
  access_key = var.access_key
  secret_key = var.secret_key
}

resource "aws_instance" "ec2_example_01" {
  ami           = var.ami_id
  instance_type = var.instance_type
  # subnet_id     = aws_subnet.subnet_aws.id
  security_groups = [aws_security_group.security_group.id]
  key_name      = var.key_name

  tags = {
    Name = var.tags
  }

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}

