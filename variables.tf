#################
# Click House EnterpriseDBCluster
#################
variable "create_cluster" {
  description = "Controls if clickhouse cluster should be created"
  type        = bool
  default     = true
}

variable "db_cluster_id" {
  description = "The db cluster id. If `create_cluster` is set to false, `db_cluster_id` must be set to be the id of an existing cluster."
  type        = string
  default     = null
}


variable "scale_max" {
  description = "The maximum value of serverless auto scaling."
  type        = string
  default     = "16"
}

variable "scale_min" {
  description = "The minimum value of serverless auto scaling."
  type        = string
  default     = "8"
}

variable "vswitch_id" {
  description = "The vSwitch ID."
  type        = string
  default     = null
}

variable "vpc_id" {
  description = "The VPC ID."
  type        = string
  default     = null
}

variable "zone_id" {
  description = "The zone ID of EnterpriseDBCluster."
  type        = string
  default     = null
}

variable "multi_zones" {
  description = "(Optional) The zone IDs and corresponding vswitch IDs of multi-zone setup."
  type = list(object({
    zone_id     = string
    vswitch_ids = list(string)
  }))
  default = []
}


#################
# Click House EnterpriseDBClusterAccount
#################
variable "account_list" {
  description = "The account info list for creating several accounts"
  type = list(object({
    account             = string
    account_type        = string
    account_description = string
    password            = string
    dml_auth_setting = object({
      allow_databases    = list(string)
      allow_dictionaries = list(string)
      ddl_authority      = bool
      dml_authority      = string
    })
  }))
  default = []
}

#################
# Click House EnterpriseDBClusterBackupPolicy
#################
variable "create_backup_policy" {
  description = "Controls if backup policy should be created"
  type        = bool
  default     = true
}

variable "preferred_backup_period" {
  description = "Preferred backup period."
  type        = string
  default     = "Monday"
}

variable "preferred_backup_time" {
  description = "Preferred backup time."
  type        = string
  default     = "04:00Z-05:00Z"
}

variable "backup_retention_period" {
  description = "Backup retention time."
  type        = string
  default     = "7"
}

#################
# Click House EnterpriseDBClusterSecurityIP
#################
variable "security_ip_group_list" {
  description = "The info list for creating several security ip groups"
  type = list(object({
    group            = string
    security_ip_list = string
  }))
  default = []
}
