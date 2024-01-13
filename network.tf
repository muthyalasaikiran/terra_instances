resource "aws_vpc" "terra_vpc" {
  cidr_block =  var.vpc_cidr


  tags = {
    Name = "terra"
  }
}

