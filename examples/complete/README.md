# complete

Configuration in this directory create ApsaraDB for ClickHouse Enterprise Edition for Alibaba Cloud.
## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note that this example may create resources which cost money. Run `terraform destroy` when you don't need these resources.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_complete"></a> [complete](#module\_complete) | ../.. | n/a |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | alibaba/vpc/alicloud | >= 1.8.0 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_backup_retention_period"></a> [backup\_retention\_period](#input\_backup\_retention\_period) | Backup retention time of clickhouse cluster enterprise edition backup policy. | `string` | `"7"` | no |
| <a name="input_create_cluster"></a> [create\_cluster](#input\_create\_cluster) | Controls if clickhouse cluster enterprise edition should be created | `bool` | `true` | no |
| <a name="input_preferred_backup_period"></a> [preferred\_backup\_period](#input\_preferred\_backup\_period) | Preferred backup period of clickhouse cluster enterprise edition backup policy. | `string` | `"Monday"` | no |
| <a name="input_preferred_backup_time"></a> [preferred\_backup\_time](#input\_preferred\_backup\_time) | Preferred backup time of clickhouse cluster enterprise edition backup policy. | `string` | `"04:00Z-05:00Z"` | no |
| <a name="input_scale_max"></a> [scale\_max](#input\_scale\_max) | The maximum value of serverless auto scaling of clickhouse cluster enterprise edition. | `string` | `"16"` | no |
| <a name="input_scale_min"></a> [scale\_min](#input\_scale\_min) | The minimum value of serverless auto scaling of clickhouse cluster enterprise edition. | `string` | `"8"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_click_house_enterprise_db_cluster_account_ids"></a> [click\_house\_enterprise\_db\_cluster\_account\_ids](#output\_click\_house\_enterprise\_db\_cluster\_account\_ids) | The ids of clickhouse cluster enterprise edition accounts. |
| <a name="output_click_house_enterprise_db_cluster_backup_policy_id"></a> [click\_house\_enterprise\_db\_cluster\_backup\_policy\_id](#output\_click\_house\_enterprise\_db\_cluster\_backup\_policy\_id) | The id of clickhouse cluster enterprise edition backup policy. |
| <a name="output_click_house_enterprise_db_cluster_id"></a> [click\_house\_enterprise\_db\_cluster\_id](#output\_click\_house\_enterprise\_db\_cluster\_id) | The id of clickhouse cluster enterprise edition. |
| <a name="output_click_house_enterprise_db_cluster_security_ip_ids"></a> [click\_house\_enterprise\_db\_cluster\_security\_ip\_ids](#output\_click\_house\_enterprise\_db\_cluster\_security\_ip\_ids) | The ids of clickhouse cluster enterprise edition security ip groups. |
| <a name="output_click_house_enterprise_db_cluster_status"></a> [click\_house\_enterprise\_db\_cluster\_status](#output\_click\_house\_enterprise\_db\_cluster\_status) | The status of clickhouse cluster enterprise edition. |
<!-- END_TF_DOCS -->