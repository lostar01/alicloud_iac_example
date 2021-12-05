variable vpc_cidr {
  default = "172.16.0.0/16"
}

variable vsw1_cidr {
  default = "172.16.0.0/21"
}

variable vsw2_cidr {
  default = "172.16.8.0/21"
}

variable region {}

variable name {
  default = "main-sub1"
}

variable name2 {
  default = "main-sub2"
}
