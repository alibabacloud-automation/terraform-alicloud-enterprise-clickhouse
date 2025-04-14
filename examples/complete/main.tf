provider "alicloud" {
  region = "cn-beijing"
}


module "vpc" {
  source             = "alibaba/vpc/alicloud"
  create             = true
  vpc_name           = "tf-test-clickhouse"
  vpc_cidr           = "172.16.0.0/16"
  vswitch_name       = "tf-test-clickhouse"
  vswitch_cidrs      = ["172.16.0.0/21"]
  availability_zones = ["cn-beijing-k"]
  version            = ">= 1.8.0"
}

module "complete" {
  source = "../.."

  #alicloud_click_house_enterprise_db_cluster
  create_cluster = var.create_cluster
  scale_max      = var.scale_max
  scale_min      = var.scale_min
  vswitch_id     = module.vpc.this_vswitch_ids[0]
  vpc_id         = module.vpc.this_vpc_id
  zone_id        = module.vpc.availability_zones[0]
  multi_zones    = []

  #alicloud_click_house_enterprise_db_cluster_account
  account_list = [
    {
      account             = "testaccount1"
      account_description = "testaccountdesc1"
      account_type        = "NormalAccount"
      password            = "Tf-testpwd"
      dml_auth_setting = {
        allow_databases    = []
        allow_dictionaries = []
        ddl_authority      = true
        dml_authority      = "0"
      }
    },
    {
      account             = "testaccount2"
      account_description = "testaccountdesc2"
      account_type        = "NormalAccount"
      password            = "Tf-testpwd"
      dml_auth_setting = {
        allow_databases    = ["*"]
        allow_dictionaries = ["*"]
        ddl_authority      = true
        dml_authority      = "0"
      }
    }
  ]

  #alicloud_click_house_enterprise_db_cluster_backup_policy
  preferred_backup_period = var.preferred_backup_period
  preferred_backup_time   = var.preferred_backup_time
  backup_retention_period = var.backup_retention_period

  #alicloud_click_house_enterprise_db_cluster_security_ip
  security_ip_group_list = [
    {
      group            = "testgroup1"
      security_ip_list = "127.0.0.3,127.0.0.1"
    },
    {
      group            = "testgroup2"
      security_ip_list = "127.0.0.2"
    }
  ]
}