resource "aws_instance" "devops_app" {
  ami           = "ami-0c02fb55956c7d316" # Amazon Linux 2
  instance_type = var.instance_type
  key_name      = var.key_name

  user_data = file("user_data.sh")

  tags = {
    Name = "DevOpsApp"
  }
}

