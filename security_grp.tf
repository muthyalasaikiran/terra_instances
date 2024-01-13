resource "aws_security_group" "dev" {
  name        = var.dev_config.name
  description = var.dev_config.description
  vpc_id      = aws_vpc.terra_vpc.id
}
resource "aws_security_group_rule" "dev_sg_rule" {
  count             = length(var.dev_config)
  type              = var.dev_config.rules[count.index].type
  from_port         = var.dev_config.rules[count.index].from_port
  to_port           = var.dev_config.rules[count.index].to_port
  protocol          = var.dev_config.rules[count.index].protocol
  cidr_blocks       = [var.dev_config.rules[count.index].cidr_blocks]
  security_group_id = aws_security_group.dev.id
}
resource "aws_security_group" "pro" {
  name        = var.pro_config.name
  description = var.pro_config.description
  vpc_id      = aws_vpc.terra_vpc.id
}
resource "aws_security_group_rule" "production_sg_rule" {
  count             = length(var.pro_config)
  type              = var.pro_config.rules[count.index].type
  from_port         = var.pro_config.rules[count.index].from_port
  to_port           = var.pro_config.rules[count.index].to_port
  protocol          = var.pro_config.rules[count.index].protocol
  cidr_blocks       = [var.pro_config.rules[count.index].cidr_blocks]
  security_group_id = aws_security_group.pro.id
}
