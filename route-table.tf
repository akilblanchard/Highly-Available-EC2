resource "aws_route_table" "public_route" {
  vpc_id = aws_vpc.main_vpc.id
  route = {
    cidr_block  = "0.0.0.0/0"
    gatyeway_id = aws_internet_gateway.main-gateway.id
  }

}

#Route Table Association with public subnets

resource "aws_route_table_association" "a" {
  count          = length(var.subnets_cidr)
  subnet_id      = element(aws_subnet.public.*.id, count.index)
  route_table_id = aws_route_table.public_route.id

}