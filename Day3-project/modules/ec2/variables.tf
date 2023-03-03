variable "project_tag" {
  type = string
}
variable "vpc_id" {
  type = string
}

#ec2
variable "ec2_instance_type" {
  type = string
}
variable "ec2_instance_keypair" {
  type = string
}
variable ec2_instance{
    type=map(object({
        associate_public_ip_address = bool
        subnet = string
        security_group = string
    }))
}

#ec2 ami
variable "ec2_ami" {
  type = object({
    owners = list(string)
    name_values = list(string)
  })
}

#ec2 security_group
variable ec2_sg{
    description = "first 3 objects is ingress the 4th is egress"
    type=map(object({
        port = list(number)
        protocol = list(string)
        cidr_blocks = list(list(string))
    }))
}
