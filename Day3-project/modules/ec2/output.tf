output "type_public_id" {
  value = data.aws_instances.type_public.ids
}
output "type_private_id" {
  value = data.aws_instances.type_private.ids
}
output "security_group_id" {
  value = [for security_group in aws_security_group.ec2_sg : security_group.id]
}