resource "aws_instance" "public-ec2" {
  ami           = var.ec2-ami 
  instance_type = var.ec2_type
  associate_public_ip_address = true
  subnet_id     = aws_subnet.subnet[0].id
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  key_name = var.keypair_name
  user_data = "${file(var.user_data_file)}"

  tags = {
    "Name" = var.project_tag
  }
}

resource "aws_instance" "private-ec2" {
  ami           = var.ec2-ami 
  instance_type = var.ec2_type
  associate_public_ip_address = false
  subnet_id     = aws_subnet.subnet[1].id
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  key_name = var.keypair_name
  user_data = "${file(var.user_data_file)}"

  tags = {
    "Name" = var.project_tag
  }
}