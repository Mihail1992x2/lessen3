 variable "web_instance_type" {
    default = "t1.micro"
  
}


variable "instance_name" {
    default = "MyPC"
  
}

variable "vpc_1_id" {}
variable "aws_subnet_a_id" {}
variable "aws_security_group_sg_web_id" {}
variable "aws_eip_instance1_id" {}
variable "web_1_instance_id" {}
#variable "launch_config_id" {
  
#}
#variable "aws_route_table_def_route_1" {}
#variable "aws_route_table_association_a" {  }