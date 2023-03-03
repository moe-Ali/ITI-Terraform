resource "aws_lb" "private_lb" {
  name               = var.private_lb_name
  internal           = true
  load_balancer_type = "application" 
  security_groups    = [var.security_group_id]
  subnets            = var.subnets_id

  tags = {
    "Name" : var.project_tag
    "project" : var.project_tag
  }

  provisioner "local-exec"{
    command = "echo Private Loadbalncer DNS = ${self.dns_name} >> ./output_info.txt"
  }
}

resource "aws_lb_listener" "private_lb_listener" {
  load_balancer_arn = aws_lb.private_lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.private_lb_tg.arn
  }
}

resource "aws_lb_target_group" "private_lb_tg" {
  name     = "${var.private_lb_name}-tg"
  target_type = "instance"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

resource "aws_lb_target_group_attachment" "private_lb_tg_attachment" {
    count= 2
    target_group_arn = aws_lb_target_group.private_lb_tg.arn
    target_id        = var.type_private_id[count.index]
    port             = 80
}