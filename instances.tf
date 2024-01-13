# creating data source to find the subnet id through it for instances

data "aws_subnet" "dev" {
  filter {
    name   = "tag:Name"
    values = ["web1"]
  }
  depends_on = [aws_subnet.subnets]
}


# development instance  with dev security group rule

resource "aws_instance" "dev" {
  ami                         = var.ubuntu_ami_id
  instance_type               = var.app_ec2_size
  associate_public_ip_address = true
  key_name                    = aws_key_pair.private.key_name
  vpc_security_group_ids      = [aws_security_group.dev.id]
  subnet_id                   = data.aws_subnet.dev.id

 tags = {
    Name = "Development"
  }

  depends_on = [aws_subnet.subnets]

}

# production instance with pro security group rule 

data "aws_subnet" "pro" {
  filter {
    name   = "tag:Name"
    values = ["app2"]
  }
   depends_on = [aws_subnet.subnets ]
}

resource "aws_instance" "pro" {
  ami                         = var.ubuntu_ami_id
  instance_type               = var.app_ec2_size
  associate_public_ip_address = true
  key_name                    = aws_key_pair.private.key_name
  vpc_security_group_ids      = [aws_security_group.pro.id]
  subnet_id                   = data.aws_subnet.pro.id

 tags = {
    Name = "production"
  }

  depends_on = [aws_subnet.subnets ]

}