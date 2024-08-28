# Create a target group and attach server on it

resource "aws_lb_target_group" "target" {
  name     = "ALb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc1.id
  protocol_version = "HTTP1"

  health_check {
    enabled             = true
    healthy_threshold   = 3
    interval            = 100
    matcher             = 200
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 6
    unhealthy_threshold = 3
  }
}

resource "aws_lb_target_group_attachment" "atg" {
  count = 2
  target_group_arn = aws_lb_target_group.target.arn
  target_id        = aws_instance.server[count.index].id
  port             = 80
}

/*
resource "aws_lb_target_group_attachment" "atg1" {
  target_group_arn = aws_lb_target_group.target1.arn
  target_id        = aws_instance.server2.id
  port             = 80
}
*/