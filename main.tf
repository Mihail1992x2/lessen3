terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}


#Configure the AWS Provider
provider "aws" {
  region     = "eu-west-1"
 # shared_credentials_files = ["credentials"]
 # [default]

}


module "instances" {
  source = "./modules/instances" 
    vpc_1_id = module.network.vpc_1_id
    aws_subnet_a_id = module.network.aws_subnet_a_id
    aws_security_group_sg_web_id = module.network.aws_security_group_sg_web_id
    aws_eip_instance1_id = module.network.aws_eip_instance1_id
    web_1_instance_id = module.instances.web_1_instance_id 
   #launch_config_id = module.instance.launch_config_id
} 

module "network" {
  source = "./modules/network"
   aws_instance_web_1_id = module.instances.aws_instance_web_1_id
# web_1_instance_id = module.instances.web_1_instance_id 
}
#dfkljsdgffghfghfghyuikdfgdfggj
