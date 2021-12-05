module "vpc" {
   source      = "./modules/vpc"
   region = var.region
}

module "mytest" {
  source = "./modules/mytest"
  region = var.region
  vpc_id = module.vpc.vpc_id
  vsw1_id = module.vpc.vsw1_id
  key_name = alicloud_ecs_key_pair.publickey.id
}
