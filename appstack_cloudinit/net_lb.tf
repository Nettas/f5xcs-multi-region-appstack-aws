# ###create target group###
# resource "aws_lb_target_group" "front" {
#   name     = "k8s-server"
#   port     = 6443
#   protocol = "TCP"
#   vpc_id   = "vpc-0ce2aa67532afd0dd"
#   health_check {
#     enabled             = true
#     healthy_threshold   = 3
#     interval            = 10
#     # matcher             = 200
#     # path                = "/"
#     port                = "6443"
#     protocol            = "TCP"
#     timeout             = 3
#     unhealthy_threshold = 3
#   }
# }

# ### attach to aws instance ###
# resource "aws_lb_target_group_attachment" "attach-ce1" {
#   target_group_arn = aws_lb_target_group.front.arn
#   target_id        = "i-0f94509ddb82d0cdc"
#   port             = 6443
# }
# resource "aws_lb_target_group_attachment" "attach-ce2" {
#   target_group_arn = aws_lb_target_group.front.arn
#   target_id        = "i-0aadd525c0d020322"
#   port             = 6443
# }
# resource "aws_lb_target_group_attachment" "attach-ce3" {
#   target_group_arn = aws_lb_target_group.front.arn
#   target_id        = "i-0c811321b0e40a52b"
#   port             = 6443
# }

# ### create load balancer ###

# resource "aws_lb_listener" "front_end" {
#   load_balancer_arn = aws_lb.front.arn
#   port              = "6443"
#   protocol          = "TCP"

#   default_action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.front.arn
#   }
# }

# ### create listener ###
# resource "aws_lb" "front" {
#   name               = "xc_nlb"
#   internal           = true
#   load_balancer_type = "network"
# #   security_groups    = ["sg-0c0e554294c70bd66"]
#   subnets            = ["subnet-0ee16123c413e1d2d","subnet-0a50e57c8e40f0794","subnet-03736d237d4de2d6f"]

#   enable_deletion_protection = false

#   tags = {
#     Environment = "xc_nlb"
#   }
# }

# output "load_balancer_dns_name" {
#   value = aws_lb.front.dns_name
# }