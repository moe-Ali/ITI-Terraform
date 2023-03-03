resource "aws_subnet" "subnets" {
  for_each = var.network_subnets
  vpc_id     = aws_vpc.main.id
  cidr_block = each.value["cidr"]
  availability_zone = each.value["az"]
  
  tags = {
    Name = each.key
    Project = var.project_tag
  }
}

resource "aws_route_table_association" "publicSubnet-publicRt" {
  for_each = var.network_subnets
  subnet_id      = aws_subnet.subnets[each.key].id
  route_table_id = aws_route_table.rt[each.value["route_table"]].id
}