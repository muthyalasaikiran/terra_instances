#  vpc

resource "aws_vpc" "terra_vpc" {
  cidr_block =  var.vpc_cidr


  tags = {
    Name = "terra"
  }
}

# subnet 

resource "aws_subnet" "subnets" {
  count      = length(var.subnames)
  vpc_id     = aws_vpc.terra_vpc.id
  availability_zone = "us-east-1c"
  cidr_block = cidrsubnet(var.vpc_cidr, 8, count.index) #cidr_block = format(var.subnet_cidr_format,count.index)
  tags = {
    Name = var.subnames[count.index]
  }
}

# To make this network work we need to create internet gateway and attaching to vpc 

# to kown route table we using data source 

   data "aws_route_table" "default" {
  vpc_id = aws_vpc.terra_vpc.id

  depends_on = [aws_vpc.terra_vpc]
}


# internet gateway

resource "aws_internet_gateway" "inernetgw" {
  vpc_id = aws_vpc.terra_vpc.id

  tags = {
    Name = "internetgw"
  }
  depends_on = [aws_vpc.terra_vpc]
}


# attaching internet gateway to route table 

resource "aws_route" "igw_route" {
  route_table_id         = data.aws_route_table.default.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.inernetgw.id
  
  depends_on             = [aws_vpc.terra_vpc, aws_internet_gateway.inernetgw]
}