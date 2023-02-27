output "public-ec2-ip" {
  value = aws_instance.public-ec2.public_ip
}