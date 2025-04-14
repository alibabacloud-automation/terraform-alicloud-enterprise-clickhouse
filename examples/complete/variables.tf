variable "create_cluster" {
  description = "Controls if clickhouse cluster enterprise edition should be created"
  type        = bool
  default     = true
}

variable "scale_max" {
  description = "The maximum value of serverless auto scaling of clickhouse cluster enterprise edition."
  type        = string
  default     = "16"
}

variable "scale_min" {
  description = "The minimum value of serverless auto scaling of clickhouse cluster enterprise edition."
  type        = string
  default     = "8"
}

#################
# Click House EnterpriseDBClusterBackupPolicy
#################
variable "preferred_backup_period" {
  description = "Preferred backup period of clickhouse cluster enterprise edition backup policy."
  type        = string
  default     = "Monday"
}

variable "preferred_backup_time" {
  description = "Preferred backup time of clickhouse cluster enterprise edition backup policy."
  type        = string
  default     = "04:00Z-05:00Z"
}

variable "backup_retention_period" {
  description = "Backup retention time of clickhouse cluster enterprise edition backup policy."
  type        = string
  default     = "7"
}
