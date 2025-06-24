resource "aws_security_group" "this" {
  name        = var.name
  description = var.description
  vpc_id      = var.vpc_id

  tags = {
    Name = var.name
  }
}

resource "aws_security_group_rule" "ingress" {
  count              = length(var.ingress_rules)
  type               = "ingress"
  from_port          = lookup(var.ingress_rules[count.index], "from_port", 0)
  to_port            = lookup(var.ingress_rules[count.index], "to_port", 0)
  protocol           = lookup(var.ingress_rules[count.index], "protocol", "-1")
  cidr_blocks        = lookup(var.ingress_rules[count.index], "cidr_blocks", [])
  ipv6_cidr_blocks   = lookup(var.ingress_rules[count.index], "ipv6_cidr_blocks", [])
  security_group_id  = aws_security_group.this.id
  source_security_group_id = lookup(var.ingress_rules[count.index], "source_security_group_id", null)
  description        = lookup(var.ingress_rules[count.index], "description", null)
}

resource "aws_security_group_rule" "egress" {
  count              = length(var.egress_rules)
  type               = "egress"
  from_port          = lookup(var.egress_rules[count.index], "from_port", 0)
  to_port            = lookup(var.egress_rules[count.index], "to_port", 0)
  protocol           = lookup(var.egress_rules[count.index], "protocol", "-1")
  cidr_blocks        = lookup(var.egress_rules[count.index], "cidr_blocks", [])
  ipv6_cidr_blocks   = lookup(var.egress_rules[count.index], "ipv6_cidr_blocks", [])
  security_group_id  = aws_security_group.this.id
  source_security_group_id = lookup(var.egress_rules[count.index], "source_security_group_id", null)
  description        = lookup(var.egress_rules[count.index], "description", null)
}