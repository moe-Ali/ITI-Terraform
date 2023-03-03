variable "project_tag" {
  type = string
}

variable "vpc_id" {
  type = string
}

#target group
variable "type_public_id" {
  type = list(string)
}
variable "type_private_id" {
  type = list(string)
}


#load balancer
variable "public_lb_name" {
  type = string
}
variable "private_lb_name" {
  type = string
}
variable "subnets_id" {
  type= list(string)
}
variable "security_group_id" {
  type = string
}