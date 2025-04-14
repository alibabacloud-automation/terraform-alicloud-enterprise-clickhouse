output "click_house_enterprise_db_cluster_id" {
  value       = one(alicloud_click_house_enterprise_db_cluster.cluster[*].id)
  description = "The id of clickhouse cluster enterprise edition."
}

output "click_house_enterprise_db_cluster_status" {
  value       = one(alicloud_click_house_enterprise_db_cluster.cluster[*].status)
  description = "The status of db cluster enterprise edition."
}

output "click_house_enterprise_db_cluster_backup_policy_id" {
  value       = one(alicloud_click_house_enterprise_db_cluster_backup_policy.backup_policy[*].id)
  description = "The id of clickhouse cluster enterprise edition backup policy."
}

output "click_house_enterprise_db_cluster_account_ids" {
  value       = alicloud_click_house_enterprise_db_cluster_account.accounts[*].id
  description = "The ids of clickhouse cluster enterprise edition accounts."
}

output "click_house_enterprise_db_cluster_security_ip_ids" {
  value       = alicloud_click_house_enterprise_db_cluster_security_ip.security_ip_groups[*].id
  description = "The ids of clickhouse cluster enterprise edition security ip groups."
}