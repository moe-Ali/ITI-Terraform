variable region{
    type=string
}

#Tags
variable project_tag {
    type=string
}

#VPC
variable vpc_cidr {
    type=string
}

#Subnet
variable subnets_cidr{
    description = "public is 0 and private is 1"
    type=list(string)
}

#igw
variable igw-public-route{
    description = "index 0 used for ipv4, index 1 used for ipv6"
    type=list(string)
}

#EC2
variable "ec2-ami" {
  type=string
}
variable "ec2_type" {
  type=string
}
variable "user_data_file" {
  type = string
}
variable "keypair_name" {
  type = string
}
#Security_group
variable sg-ingress-http{
    type = object({
        from_port=number, 
        to_port=number,
        protocol=string, 
        cidr_blocks=list(string)
        })
}
variable sg-ingress-https{
    type = object({
        from_port=number, 
        to_port=number,
        protocol=string, 
        cidr_blocks=list(string)
        })
}
variable sg-ingress-ssh{
    type = object({
        from_port=number, 
        to_port=number,
        protocol=string, 
        cidr_blocks=list(string)
        })
}
variable sg-egress-allowALL{
    type = object({
        from_port=number, 
        to_port=number,
        protocol=string, 
        cidr_blocks=list(string)
        })
}