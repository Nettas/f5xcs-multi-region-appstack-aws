# Initialize availability zone data from AWS
data "aws_availability_zones" "available" {}

# Vpc resource
resource "aws_vpc" "vpc" {
  cidr_block           = var.aws_vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name        = "${var.environment}-vpc"
    Environment = var.environment
  }
}

### Create IGW ###
resource "aws_internet_gateway" "ig" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name        = "${var.environment}-igw"
    Environment = var.environment
  }
}

### Subnet public ###
resource "aws_subnet" "public_subnet" {
  count                   = "${length(data.aws_availability_zones.available.names)}"
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.${10+count.index}.0/24"
  availability_zone       = "${data.aws_availability_zones.available.names[count.index]}"
  map_public_ip_on_launch = true

  tags = {
    Name        = "${var.environment}-pubsubnet"
    Environment = var.environment
  }
}

### Subnet ###
resource "aws_subnet" "private_subnet" {
  count                   = "${length(data.aws_availability_zones.available.names)}"
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.${20+count.index}.0/24"
  availability_zone       = "${data.aws_availability_zones.available.names[count.index]}"
  map_public_ip_on_launch = false

  tags = {
    Name        = "${var.environment}-privsubnet"
    Environment = var.environment
  }
}

# Routing table for public subnets
resource "aws_route_table" "rtblPublic" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.ig.id}"
  }

  tags = {
    Name        = "${var.environment}-rt_tbl"
    Environment = var.environment
  }
}

resource "aws_route_table_association" "route" {
  count          = "${length(data.aws_availability_zones.available.names)}"
  subnet_id      = "${element(aws_subnet.public_subnet.*.id, count.index)}"
  route_table_id = "${aws_route_table.rtblPublic.id}"
}

# # Elastic IP for NAT gateway
# resource "aws_eip" "nat" {
#   vpc = true
# }

# # NAT Gateway
# resource "aws_nat_gateway" "nat-gw" {
#   allocation_id = "${aws_eip.nat.id}"
#   subnet_id     = "${element(aws_subnet.private_subnet.*.id, 1)}"
#   depends_on    = ["aws_internet_gateway.myInternetGateway"]
# }

# Routing table for private subnets
# resource "aws_route_table" "rtblPrivate" {
#   vpc_id = aws_vpc.vpc.id

#   tags = {
#     Name        = "${var.environment}-privrtb"
#     Environment = var.environment
#   }
# }

# resource "aws_route_table_association" "private_route" {
#   count          = "${length(data.aws_availability_zones.available.names)}"
#   subnet_id      = "${element(aws_subnet.private_subnet.*.id, count.index)}"
#   route_table_id = "${aws_route_table.rtblPrivate.id}"
# }