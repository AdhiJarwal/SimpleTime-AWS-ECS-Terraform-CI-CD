resource "aws_vpc" "simpletimeservice_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "${var.project_name}-vpc"
  }
}

resource "aws_subnet" "simpletimeservice_public" {
  count                   = length(var.public_subnet_cidrs)
  vpc_id                  = aws_vpc.simpletimeservice_vpc.id
  cidr_block              = var.public_subnet_cidrs[count.index]
  availability_zone       = element(var.availability_zones, count.index)
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.project_name}-public-subnet-${count.index + 1}"
  }
}

resource "aws_subnet" "simpletimeservice_private" {
  count                   = length(var.private_subnet_cidrs)
  vpc_id                  = aws_vpc.simpletimeservice_vpc.id
  cidr_block              = var.private_subnet_cidrs[count.index]
  availability_zone       = element(var.availability_zones, count.index)
  map_public_ip_on_launch = false

  tags = {
    Name = "${var.project_name}-private-subnet-${count.index + 1}"
  }
}

resource "aws_internet_gateway" "simpletimeservice_igw" {
  vpc_id = aws_vpc.simpletimeservice_vpc.id

  tags = {
    Name = "${var.project_name}-igw"
  }
}

resource "aws_eip" "simpletimeservice_nat" {
  count  = length(var.public_subnet_cidrs)
  domain = "vpc"

  tags = {
    Name = "${var.project_name}-eip-${count.index + 1}"
  }
}

resource "aws_nat_gateway" "simpletimeservice_nat" {
  count         = length(var.public_subnet_cidrs)
  allocation_id = aws_eip.simpletimeservice_nat[count.index].id
  subnet_id     = aws_subnet.simpletimeservice_public[count.index].id

  tags = {
    Name = "${var.project_name}-nat-${count.index + 1}"
  }

  depends_on = [aws_internet_gateway.simpletimeservice_igw]
}

resource "aws_route_table" "simpletimeservice_public" {
  vpc_id = aws_vpc.simpletimeservice_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.simpletimeservice_igw.id
  }

  tags = {
    Name = "${var.project_name}-public-rt"
  }
}

resource "aws_route_table" "simpletimeservice_private" {
  count  = length(var.private_subnet_cidrs)
  vpc_id = aws_vpc.simpletimeservice_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.simpletimeservice_nat[count.index].id
  }

  tags = {
    Name = "${var.project_name}-private-rt-${count.index + 1}"
  }
}

resource "aws_route_table_association" "simpletimeservice_public" {
  count          = length(var.public_subnet_cidrs)
  subnet_id      = aws_subnet.simpletimeservice_public[count.index].id
  route_table_id = aws_route_table.simpletimeservice_public.id
}

resource "aws_route_table_association" "simpletimeservice_private" {
  count          = length(var.private_subnet_cidrs)
  subnet_id      = aws_subnet.simpletimeservice_private[count.index].id
  route_table_id = aws_route_table.simpletimeservice_private[count.index].id
}
