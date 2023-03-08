module "dev-network"{
        source= "./modules/network"
        project_tag="iti-tera-project-${terraform.workspace}"

        network_vpc_cidr ="10.0.0.0/16"

        network_subnets= {
            "public1" = {
                cidr = "10.0.0.0/24"
                az = "us-east-1a"
                route_table = "public_route"
            }
            "private1" = {
                cidr = "10.0.1.0/24"
                az = "us-east-1a"
                route_table = "private_route"
            }
            "public2" = {
                cidr = "10.0.2.0/24"
                az = "us-east-1b"
                route_table = "public_route"
            }
            "private2" = {
                cidr = "10.0.3.0/24"
                az = "us-east-1b"
                route_table = "private_route"
            }
        }

        network_route_table ={
            "public_route" ={
                cidr = "0.0.0.0/0"
                gateway_id = module.dev-network.igw_main_id
            }
            "private_route" = {
                cidr = "0.0.0.0/0"
                gateway_id = module.dev-network.nat_main_id
            }
        }
}

module "dev-ec2" {
        source= "./modules/ec2"
        project_tag="iti-tera-project-${terraform.workspace}"

        vpc_id = module.dev-network.vpc_main_id

        ec2_instance_type = "t2.micro"
        ec2_instance_keypair = "windwos-key"
        ec2_instance = {
          "public1" = {
            associate_public_ip_address = true
            security_group = "public_sg"
            subnet = module.dev-network.subnet_id["public1"] 
          }
          "private1" = {
            associate_public_ip_address = false
            security_group = "private_sg"
            subnet = module.dev-network.subnet_id["private1"]
          }
          "public2" = {
            associate_public_ip_address = true
            security_group = "public_sg"
            subnet = module.dev-network.subnet_id["public2"] 
          }
          "private2" = {
            associate_public_ip_address = false
            security_group = "private_sg"
            subnet = module.dev-network.subnet_id["private2"] 
          }
        }

        ec2_ami = {
          name_values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
          owners = ["amazon"]
        }

        ec2_sg = {
          "public_sg" = {
            cidr_blocks = [ ["0.0.0.0/0"],["0.0.0.0/0"],["0.0.0.0/0"],["0.0.0.0/0"] ]
            port = [ 80,443,22,0 ]
            protocol = ["tcp","tcp","tcp","-1"]
          }
          "private_sg" = {
            cidr_blocks = [ ["0.0.0.0/0"],["0.0.0.0/0"],["0.0.0.0/0"],["0.0.0.0/0"] ]
            port = [ 80,443,22,0 ]
            protocol = ["tcp","tcp","tcp","-1"]
          }
          "lb_sg" = {
            cidr_blocks = [ ["0.0.0.0/0"],["0.0.0.0/0"],["0.0.0.0/0"],["0.0.0.0/0"] ]
            port = [ 80,443,22,0 ]
            protocol = ["tcp","tcp","tcp","-1"]
          }
        }
}

module "dev-lb" {
        source= "./modules/load_balancer"
        project_tag="iti-tera-project-${terraform.workspace}"

        vpc_id = module.dev-network.vpc_main_id
        type_public_id = module.dev-ec2.type_public_id
        type_private_id = module.dev-ec2.type_private_id

        public_lb_name = "publiclb"
        private_lb_name = "privatelb"
        security_group_id = module.dev-ec2.security_group_id[2] 
        subnets_id=[module.dev-network.subnet_id["public1"],module.dev-network.subnet_id["public2"]]
        
}
