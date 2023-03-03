variable "project_tag" {
    type = string
}

#VPC
variable network_vpc_cidr {
    type= string
}

#Subnet
variable network_subnets{
    type=map(object({
        cidr = string
        az = string
        route_table = string
    }))
}

#route table
variable network_route_table{
    type=map(object({
        cidr = string
        gateway_id = string
    }))
}