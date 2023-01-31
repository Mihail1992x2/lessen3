resource "aws_instance" "web_1" {
  ami           = "ami-0333305f9719618c7"
  instance_type = var.web_instance_type
  subnet_id     = var.aws_subnet_a_id
  key_name = aws_key_pair.ssh_1.key_name
  vpc_security_group_ids = [var.aws_security_group_sg_web_id]
#  vpc_security_group_ids = [aws_security_group.sg_web.id]
#  user_data = file("bash.sh")
#  user_data = "${file("../instances/bash.sh")}"
 # user_data = << EOF
  #  #!/bin/bash
  #  sudo apt update
  
  #EOF

  tags = {
    Name = var.instance_name
  }

}


resource "aws_key_pair" "ssh_1" {
    key_name = "ssh_1-key"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCVlqlpjwdsJZwIIWfBJyF6NpJmV/LWF18UpMrX0iXFBCB1JBt2k0RJ53cHzmnjgK11SJNze+u4Z6lbUulxBKdv0PJABK3pQgl4yhBwq9DSHMZh5Rk8kPWhlyAfjAHGYn+DfzZz+RsQCz2+g9DgB5clgpU6HwJk9pPF4IChjPMBvmudY9zmwdGOuCKou2MZFi8EKHoE25bd3bmoE8vGablV8+QBGjSJH03PQymr+dBPw6zg3+K2Oj5neuJWVksQsRu15TCG3m71Ok3TzZaSUKlH0NR9/rtH0mm/5TXaI5ph8NUaPkGU5CytoriGoFgwCF5eD780aZBBhDOF6Dk7zIPq385jt1MHohuHJDh9EkYkVvKbrxkJS89tpYPnLXNKimomedAC5MGTDGaoKPMDMOPfypc8NLpLg29/caDM0drTmAmy5KSnID8RyRgtIJlCEo7/e/Qf5apSgXMF6SWQU4UxmRG65gX2vLywQmFn7UsmJ2T3GDtx3MlPEtdPEnZ+2I8= sysadmin@sysadmin-LIFEBOOK-E752"
}
#resource "aws_launch_configuration" "launch_config" {
#    user_data = "${file("bash.sh")}"
#}