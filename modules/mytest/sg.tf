resource "alicloud_security_group" "mysg" {
  name   = "mytest-sg"
  vpc_id = var.vpc_id
}

resource "alicloud_security_group_rule" "ingress_rule_1" {
  type              = "ingress"
  ip_protocol       = "tcp"
  #nic_type          = "internet"
  nic_type          = "intranet"
  policy            = "accept"
  port_range        = "22/22"
  priority          = 1
  security_group_id = alicloud_security_group.mysg.id
  cidr_ip           = "0.0.0.0/0"
}
