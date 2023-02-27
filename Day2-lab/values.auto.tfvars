region = "us-east-1"

#Tags
project_tag = "terraform-lab-day2"

#VPC
vpc_cidr = "10.0.0.0/16"

#Subnet
subnets_cidr=["10.0.0.0/24","10.0.1.0/24"]

#igw
igw-public-route=["0.0.0.0/0","::/0"]

#EC2
ec2-ami = "ami-0557a15b87f6559cf"
ec2_type = "t2.micro"
user_data_file = "install_apache.sh"
keypair_name= "windwos-key"

#security_group
sg-ingress-http={
    from_port=80,
    to_port=80,
    protocol="tcp",
    cidr_blocks=["0.0.0.0/0"]
    }
sg-ingress-https={
    from_port=443,
    to_port=443,
    protocol="tcp",
    cidr_blocks=["0.0.0.0/0"]
    }
sg-ingress-ssh={
    from_port=22,
    to_port=22,
    protocol="tcp",
    cidr_blocks=["0.0.0.0/0"]
    }
sg-egress-allowALL={
    from_port=0,
    to_port=0,
    protocol="-1",
    cidr_blocks=["0.0.0.0/0"]
    }