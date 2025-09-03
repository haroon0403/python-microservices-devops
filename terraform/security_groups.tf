resource "aws_security_group" "devops_sg" {
  name        = "devops-sg"
  description = "Allow SSH, 8080, 5000"
  vpc_id      = data.aws_vpc.default.id  # see note below

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # SSH from anywhere
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # HTTP port
  }

  ingress {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # App port
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]  # Allow all outbound
  }

  tags = {
    Name = "DevOpsSG"
  }
}

# Fetch default VPC
data "aws_vpc" "default" {
  default = true
}
