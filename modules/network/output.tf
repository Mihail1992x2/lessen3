output "vpc_1_id" {
  value = aws_vpc.vpc_1.id
}

output "aws_subnet_a_id" {
  value = aws_subnet.subnet_a.id
}

output "aws_security_group_sg_web_id" {
  value = aws_security_group.sg_web.id
}

output "aws_eip_instance1_id" {
    value = aws_eip.instance1.id
}
