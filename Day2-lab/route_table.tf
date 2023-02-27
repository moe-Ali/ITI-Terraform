resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = var.igw-public-route[0]
    gateway_id = aws_internet_gateway.main.id
  }

  route {
    ipv6_cidr_block = var.igw-public-route[1]
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = var.project_tag
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = var.igw-public-route[0]
    gateway_id = aws_nat_gateway.main.id
  }

  tags = {
    Name = var.project_tag
  }
}
