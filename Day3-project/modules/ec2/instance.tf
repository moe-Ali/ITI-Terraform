resource "aws_instance" "ec2_instance" {
  for_each = var.ec2_instance
  ami           = data.aws_ami.ec2_ami.id
  instance_type = var.ec2_instance_type
  associate_public_ip_address = each.value["associate_public_ip_address"]
  key_name = var.ec2_instance_keypair

  subnet_id     = each.value["subnet"]
  vpc_security_group_ids = [aws_security_group.ec2_sg[each.value["security_group"]].id]

  tags = {
    "Name" = each.key
    "project" = var.project_tag
    "type" = each.value["associate_public_ip_address"] == true ?  "public" : "private"
  }

  provisioner "local-exec"{
    command = "echo ${self.tags_all["Name"]} private_ip = ${self.private_ip}, public_ip = ${self.public_ip} >> ./output_info.txt"
  }
}

data "aws_instances" "type_public"{
  depends_on = [aws_instance.ec2_instance]
  filter {
    name = "tag:type"
    values = ["public"]
  }
}
data "aws_instances" "type_private"{
  depends_on = [aws_instance.ec2_instance]
  filter {
    name = "tag:type"
    values = ["private"]
  }
}

data "aws_ami" "ec2_ami"{
    most_recent = true
    owners=var.ec2_ami["owners"]
    filter {
        name ="name"
        values=var.ec2_ami["name_values"]
    }
}