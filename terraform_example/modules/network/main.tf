resource "aws_vpc" "vpc_1" {
    cidr_block = "10.0.0.0/16"
}
resource "aws_subnet" "subnet_a" {
  vpc_id = aws_vpc.vpc_1.id
  cidr_block = "10.0.10.0/24"
 # availability_zone = "eu-west-1"
}
#resource "aws_subnet" "subnet_b" {
#  vpc_id = aws_vpc.vpc_1.id
#  cidr_block = "10.0.64.0/24"
#}
resource "aws_internet_gateway" "gw_1" {
    vpc_id = aws_vpc.vpc_1.id
}

resource "aws_security_group" "sg_web" {
    name = "sg_web"
    description = "Allow TLS inbound traffic"
    vpc_id = aws_vpc.vpc_1.id
    
    ingress   {
      description = "TLS from VPC"
      from_port = "80"
      protocol = "tcp"
      to_port = "80"
      cidr_blocks = ["0.0.0.0/0"]
    } 
        ingress   {
      description = "443"
      from_port = 443
      protocol = "tcp"
      to_port = 443
      cidr_blocks = ["0.0.0.0/0"]
    } 

            ingress   {
      description = "ssh"
      from_port = 22
      protocol = "tcp"
      to_port = 22
      cidr_blocks = ["0.0.0.0/0"]
    } 
        egress   {
      from_port = 0
      protocol = "-1"
      to_port = 0
      cidr_blocks =    ["0.0.0.0/0"]
    } 
    tags = {
      "Name" = "TLS"
    }
}
resource "aws_route_table" "def_route_1" {
    vpc_id = aws_vpc.vpc_1.id
}
resource "aws_route_table_association" "a" {
    subnet_id = aws_subnet.subnet_a.id
    route_table_id = aws_route_table.def_route_1.id
}

resource "aws_route" "route_1" {
    route_table_id = aws_route_table.def_route_1.id
    gateway_id = aws_internet_gateway.gw_1.id
    destination_cidr_block = "0.0.0.0/0"
  
}


resource "aws_eip" "instance1" {
      vpc      = true
      instance = var.aws_instance_web_1_id

}