resource "aws_subnet" "public_subnet" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.public_subnet_cidr
  map_public_ip_on_launch = true
  availability_zone       = var.public_subnet_az

  tags = {
    Name = "${var.vpc_name}-public-subnet"
}
}
resource "aws_internet_gateway" "pub_igw" {
  vpc_id = var.vpc_id

  tags = {
    Name = "${var.vpc_name}-public-igw"
  }
}
resource "aws_route_table" "public_route_table" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.pub_igw.id
  }

  tags = {
    Name = "${var.vpc_name}-public-route-table"
  }
}
resource "aws_route_table_association" "public_subnet_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_route_table.id
}
