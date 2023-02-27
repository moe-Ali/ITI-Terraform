resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.nat-eip.id
  subnet_id     = aws_subnet.subnet[0].id

  tags = {
    Name = var.project_tag
  }

  #to ensure that there is an internet gateway up
  depends_on = [aws_internet_gateway.main]
}

resource "aws_eip" "nat-eip" {
  vpc      = true
}