resource "aws_instance" "main-ec2" {
  ami           = "ami-0557a15b87f6559cf" 
  instance_type = "t2.micro"
  associate_public_ip_address = true
  subnet_id     = aws_subnet.main.id
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  user_data = "${file("install_apache.sh")}"

  tags = {
    "Name" = "tera-day1"
  }
}

resource "aws_security_group" "ec2_sg" {
  name        = "tera-day1"
  description = "Allow HTTP/S and SSH trafic to ec2"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}