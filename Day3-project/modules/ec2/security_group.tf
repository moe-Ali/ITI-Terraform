resource "aws_security_group" "ec2_sg" {
  for_each = var.ec2_sg
  name        = each.key
  description = "Allow HTTP/S and SSH trafic to ec2"
  vpc_id      = var.vpc_id

  ingress {
    from_port        = each.value["port"][0]
    to_port          = each.value["port"][0]
    protocol         = each.value["protocol"][0]
    cidr_blocks      = each.value["cidr_blocks"][0]
  }

  ingress {
    from_port        = each.value["port"][1]
    to_port          = each.value["port"][1]
    protocol         = each.value["protocol"][0]
    cidr_blocks      = each.value["cidr_blocks"][1]
  }

  ingress {
    from_port        = each.value["port"][2]
    to_port          = each.value["port"][2]
    protocol         = each.value["protocol"][0]
    cidr_blocks      = each.value["cidr_blocks"][2]
  }

  egress {
    from_port        = each.value["port"][3]
    to_port          = each.value["port"][3]
    protocol         = each.value["protocol"][3]
    cidr_blocks      = each.value["cidr_blocks"][3]
  }

  tags = {
    "projact" = var.project_tag
  }
}