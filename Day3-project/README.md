# Terraform Day3 Lab at ITI 

## Project:
![Lab](https://github.com/moe-Ali/ITI-Terraform/blob/main/Day3-project/Screenshots/Lab.png)

## How i did it:
- changed the namespace to dev and made the terraform.tfstate (backend) on S3 and the terraform lock on DynamoDB
- used Terraform to build the infrastructure on AWS and get the IPs at output_info.txt
- then used the output_info.txt that Terraform generated to make the inventory file for Ansible
- then used ansible to deploy and configure Nginx to work as a proxy on the 2 public ec2 and Apache on the 2 private ec2

## Outputs:
### Working on dev namespace
![namespace](https://github.com/moe-Ali/ITI-Terraform/blob/main/Day3-project/Screenshots/namespace.png)
### terraform.tfstate on S3
![S3](https://github.com/moe-Ali/ITI-Terraform/blob/main/Day3-project/Screenshots/s3_tfstate.png)
### Running Ec2
![EC2](https://github.com/moe-Ali/ITI-Terraform/blob/main/Day3-project/Screenshots/ec2.png)
### Running LoadBalancers
![LB](https://github.com/moe-Ali/ITI-Terraform/blob/main/Day3-project/Screenshots/LB.png)
### Nginx Proxy configuration on the 2 public EC2
![proxy](https://github.com/moe-Ali/ITI-Terraform/blob/main/Day3-project/Screenshots/proxy.png)
### Useing the Public LoadBalancer DNS to display the Apache on the 2 private EC2
![private1](https://github.com/moe-Ali/ITI-Terraform/blob/main/Day3-project/Screenshots/private1_from_publiclb.png)
![private2](https://github.com/moe-Ali/ITI-Terraform/blob/main/Day3-project/Screenshots/private2_from_publiclb.png)
