data "alicloud_images" "images_ds" {
  owners     = "system"
  name_regex = "^ubuntu_18"
}

resource "alicloud_instance" "myvps" {
  
  availability_zone = "${var.region}a"
  security_groups   = [ "${alicloud_security_group.mysg.id}" ]

  instance_type              = var.instance_type
  host_name                  = "myvps"
#  spot_strategy              = "SpotWithPriceLimit"
  system_disk_category       = "cloud_efficiency"
  system_disk_name           = "system_disk_name"
  system_disk_description    = "system_disk_description"
  #image_id                   = data.alicloud_images.images_ds.images.0.id
  image_id                   = "ubuntu_18_04_64_20G_alibase_20190624.vhd"
  instance_name              = "myvps"
  vswitch_id                 = var.vsw1_id
  internet_max_bandwidth_out = 100
  key_name                   = var.key_name
#  data_disks {
#    name        = "disk2"
#    size        = 20
#    category    = "cloud_efficiency"
#    description = "disk2"
#    encrypted   = true
#    kms_key_id  = alicloud_kms_key.key.id
#  }
  tags = {
    "user" = "zhijian"
  }
}
