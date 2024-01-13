# when we apply this out put is shows the id what ever in data source

output "default_route_table_id" {
  value = data.aws_route_table.default.id

}

output "subnet_id_dev" {
  value = data.aws_subnet.dev.id
}

output "subnet_id_pro" {
  value = data.aws_subnet.pro.id
}