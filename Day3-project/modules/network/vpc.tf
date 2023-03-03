resource "aws_vpc" "main" {
  cidr_block = var.network_vpc_cidr

  tags = {
    Name = var.project_tag
    Project = var.project_tag
  }
}