output "alb_arn" {
  description = "The ARN of the Application Load Balancer"
  value       = aws_lb.this.arn
}

output "alb_dns_name" {
  description = "The DNS name of the Application Load Balancer"
  value       = aws_lb.this.dns_name
}

output "alb_security_group_ids" {
  description = "The security group IDs associated with the ALB"
  value       = var.security_group_ids
}

output "http_target_group_arn" {
  description = "The ARN of the HTTP target group"
  value       = aws_lb_target_group.http.arn
}

output "https_target_group_arn" {
  description = "The ARN of the HTTPS target group, if created"
  value       = length(aws_lb_target_group.https) > 0 ? aws_lb_target_group.https[0].arn : ""
}