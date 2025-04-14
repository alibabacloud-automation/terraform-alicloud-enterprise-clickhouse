locals {
  this_cluster_id = var.create_cluster ? one(alicloud_click_house_enterprise_db_cluster.cluster[*].id) : var.db_cluster_id
}

resource "alicloud_click_house_enterprise_db_cluster" "cluster" {
  count      = var.create_cluster ? 1 : 0
  scale_max  = var.scale_max
  scale_min  = var.scale_min
  vpc_id     = var.vpc_id
  vswitch_id = var.vswitch_id
  zone_id    = var.zone_id
  dynamic "multi_zones" {
    for_each = var.multi_zones
    content {
      zone_id     = multi_zones.value.zone_id
      vswitch_ids = multi_zones.value.vswitch_ids
    }
  }
}

resource "alicloud_click_house_enterprise_db_cluster_account" "accounts" {
  count        = length(var.account_list)
  account      = var.account_list[count.index].account
  description  = var.account_list[count.index].account_description
  account_type = var.account_list[count.index].account_type
  password     = var.account_list[count.index].password
  dml_auth_setting {
    ddl_authority      = var.account_list[count.index].dml_auth_setting.ddl_authority
    dml_authority      = var.account_list[count.index].dml_auth_setting.dml_authority
    allow_databases    = var.account_list[count.index].dml_auth_setting.allow_databases
    allow_dictionaries = var.account_list[count.index].dml_auth_setting.allow_dictionaries
  }
  db_instance_id = local.this_cluster_id
}

resource "alicloud_click_house_enterprise_db_cluster_backup_policy" "backup_policy" {
  count                   = var.create_backup_policy ? 1 : 0
  preferred_backup_period = var.preferred_backup_period
  preferred_backup_time   = var.preferred_backup_time
  backup_retention_period = var.backup_retention_period
  db_instance_id          = local.this_cluster_id
}

resource "alicloud_click_house_enterprise_db_cluster_security_ip" "security_ip_groups" {
  count            = length(var.security_ip_group_list)
  group_name       = var.security_ip_group_list[count.index].group
  security_ip_list = var.security_ip_group_list[count.index].security_ip_list
  db_instance_id   = local.this_cluster_id
}

