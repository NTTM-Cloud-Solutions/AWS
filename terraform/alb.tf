resource "aws_lb" "myalb" {
  name               = "myALB"
  internal           = false
  security_groups    = [aws_security_group.web_server_lb.id]
  load_balancer_type = "application"
  subnets            = module.vpc.public_subnets
}

resource "aws_lb_target_group" "app3000" {
  name        = "app3000"
  target_type = "instance"
  port        = 3000
  protocol    = "HTTP"
  vpc_id      = module.vpc.vpc_id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 7
    timeout             = 6
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  tags = {
    Name = "myTargetGroup3000"
  }
}

resource "aws_lb_target_group" "app3010" {
  name        = "app3010"
  target_type = "instance"
  port        = 3010
  protocol    = "HTTP"
  vpc_id      = module.vpc.vpc_id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 15
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  tags = {
    Name = "myTargetGroup3010"
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.myalb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"
    fixed_response {
      content_type = "text/plain"
      message_body = "404: Not Found"
      status_code  = "404"
    }
  }
}

resource "aws_lb_listener_rule" "app_3010_rule" {
  listener_arn = aws_lb_listener.http.arn
  priority     = 10

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app3010.arn
  }

  condition {
    path_pattern {
      values = ["/api/*"]
    }
  }
}

resource "aws_lb_listener_rule" "app_3000_rule" {
  listener_arn = aws_lb_listener.http.arn
  priority     = 20

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app3000.arn
  }

  condition {
    path_pattern {
      values = ["/*"]
    }
  }
}

output "elb_dns_name" {
  value       = aws_lb.myalb.dns_name
  description = "The domain name of the load balancer"
}
