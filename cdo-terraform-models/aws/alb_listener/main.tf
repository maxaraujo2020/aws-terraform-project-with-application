resource "aws_lb_listener" "shared_lb_external_redirect_80" {
  load_balancer_arn = var.load_balancer_arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

resource "aws_lb_listener" "shared_lb_external_redirect_443" {
  load_balancer_arn = var.load_balancer_arn
  port              = var.port
  protocol          = "HTTPS"
  certificate_arn   = var.certificate_arn
  ssl_policy        = "ELBSecurityPolicy-TLS-1-2-2017-01"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "503"
      status_code  = "503"
    }
  }
}

resource "aws_lb_listener_rule" "this" {
  listener_arn = aws_lb_listener.shared_lb_external_redirect_443.id

  action {
    type             = "forward"
    target_group_arn = var.target_group_arn
  }

  condition {
    host_header {
      values = var.fqdn_list
    }
  }

  condition {
    path_pattern {
      values = var.path_pattern
    }
  }
}
