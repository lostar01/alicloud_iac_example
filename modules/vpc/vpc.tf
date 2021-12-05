data "alicloud_zones" "default" {
  available_disk_category     = "cloud_efficiency"
  available_resource_creation = "VSwitch"
}

resource "alicloud_vpc" "vpc" {
  vpc_name   = "main-vpc"
  cidr_block = var.vpc_cidr
}

resource "alicloud_vswitch" "vsw1" {
  vpc_id            = alicloud_vpc.vpc.id
  cidr_block        = var.vsw1_cidr
  zone_id           = data.alicloud_zones.default.zones[0].id
  vswitch_name      = var.name
  tags = {
    "user" = "zhijiain"
  }
}

#resource "alicloud_vswitch" "vsw2" {
#  vpc_id            = alicloud_vpc.vpc.id
#  cidr_block        = var.vsw2_cidr
#  zone_id           = data.alicloud_zones.default.zones[1].id
#  vswitch_name      = var.name2
#  tags = {
#    "user" = "zhijiain"
#  }
#}
