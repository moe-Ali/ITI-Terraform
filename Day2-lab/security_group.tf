resource "aws_security_group" "ec2_sg" {
  name        = var.project_tag
  description = "Allow HTTP/S and SSH trafic to ec2"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port        = var.sg-ingress-http.from_port
    to_port          = var.sg-ingress-http.to_port
    protocol         = var.sg-ingress-http.protocol
    cidr_blocks      = var.sg-ingress-http.cidr_blocks
  }

  ingress {
    from_port        = var.sg-ingress-https.from_port
    to_port          = var.sg-ingress-https.to_port
    protocol         = var.sg-ingress-https.protocol
    cidr_blocks      = var.sg-ingress-https.cidr_blocks
  }

  ingress {
    from_port        = var.sg-ingress-ssh.from_port
    to_port          = var.sg-ingress-ssh.to_port
    protocol         = var.sg-ingress-ssh.protocol
    cidr_blocks      = var.sg-ingress-ssh.cidr_blocks
  }

  egress {
    from_port        = var.sg-egress-allowALL.from_port
    to_port          = var.sg-egress-allowALL.to_port
    protocol         = var.sg-egress-allowALL.protocol
    cidr_blocks      = var.sg-egress-allowALL.cidr_blocks
  }
}