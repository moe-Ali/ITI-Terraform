resource "aws_lb" "public_lb" {
  name               = var.public_lb_name
  internal           = false
  load_balancer_type = "network" 
  subnets            = var.subnets_id

  tags = {
    "Name" : var.project_tag
    "project" : var.project_tag
  }

provisioner "local-exec"{
    command = "echo Public Loadbalncer DNS = ${self.dns_name} >> ./output_info.txt"
  }
}

resource "aws_lb_listener" "public_lb_listener" {
  load_balancer_arn = aws_lb.public_lb.arn
  port              = "80"
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.public_lb_tg.arn
  }
}

resource "aws_lb_target_group" "public_lb_tg" {
  name     = "${var.public_lb_name}-tg"
  target_type = "instance"
  port     = 80
  protocol = "TCP"
  vpc_id   = var.vpc_id
}

resource "aws_lb_target_group_attachment" "public_lb_tg_attachment" {
    count= 2
    target_group_arn = aws_lb_target_group.public_lb_tg.arn
    target_id        = var.type_public_id[count.index]
    port             = 80
}