# Create a listener and an Elastic Application Load Balancer

resource "aws_lb_listener" "lt1" {
  load_balancer_arn = aws_lb.load-balancer.arn
  port              = 443 # If you have a certificate
  protocol          = "HTTPS"

  ssl_policy      = "ELBSecurityPolicy-2016-08"
  certificate_arn = data.aws_acm_certificate.amazon_issued.arn

  //port              = 80    # If you don't have a certificate
  //protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target.arn

  }
}


resource "aws_lb" "load-balancer" {
  name                       = "alb-project"
  internal                   = false
  load_balancer_type         = "application"
  security_groups            = [aws_security_group.sg-alb1.id]
  subnets                    = [aws_subnet.public[0].id, aws_subnet.public[1].id]
  enable_deletion_protection = false
  depends_on                 = [aws_lb_target_group.target]
}