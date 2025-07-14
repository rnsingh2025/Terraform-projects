resource "aws_subnet" "private_subnet" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.private_subnet_cidr
  availability_zone       = var.private_subnet_az
  map_public_ip_on_launch = false

  tags = {
    Name = "${var.vpc_name}-private-subnet"
  }
}

resource "aws_eip" "nat_gateway_eip" {
  vpc = true
  tags = {
    Name = "${var.vpc_name}-nat-eip"
  }
}
resource "aws_nat_gateway" "pri_nat_gateway" {
  allocation_id = aws_eip.nat_gateway_eip.id
  subnet_id     = var.public_subnet_id
  tags = {
    Name = "${var.vpc_name}-nat-gateway"
  }
}

resource "aws_route_table" "private_route_table" {
  vpc_id = var.vpc_id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.pri_nat_gateway.id
  }

  tags = {
    Name = "${var.vpc_name}-private-route-table"
  }
}
resource "aws_route_table_association" "private_subnet_association" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private_route_table.id
}