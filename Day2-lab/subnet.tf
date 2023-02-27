resource "aws_subnet" "subnet" {
  count = length(var.subnets_cidr)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnets_cidr[count.index]

  tags = {
    Name = var.project_tag
  }
}

#public
resource "aws_route_table_association" "publicSubnet-publicRt" {
  subnet_id      = aws_subnet.subnet[0].id
  route_table_id = aws_route_table.public.id
}

#private
resource "aws_route_table_association" "privateSubnet-privateRt" {
  subnet_id      = aws_subnet.subnet[1].id
  route_table_id = aws_route_table.private.id
}
