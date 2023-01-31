output "aws_instance_web_1_id" {
    value = aws_instance.web_1.id
  
}
output "aws_key_pair_ssh1_id" {
  value = aws_key_pair.ssh_1.key_name
}

output "web_1_instance_id" {
  value = aws_instance.web_1.id
}
