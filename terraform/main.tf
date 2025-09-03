resource "aws_instance" "devops_app" {
  ami           = "ami-0c4fc5dcabc9df21d" # Amazon Linux 2
  instance_type = var.instance_type
  key_name      = var.key_name

vpc_security_group_ids = [aws_security_group.devops_sg.id]

  user_data = file("user_data.sh")

  tags = {
    Name = "DevOpsApp"
  }
}
