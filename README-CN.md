Terraform module to build ApsaraDB for ClickHouse Enterprise Edition for Alibaba Cloud

terraform-alicloud-enterprise-clickhouse
======================================

[English](https://github.com/alibabacloud-automation/terraform-alicloud-enterprise-clickhouse/blob/main/README.md) | 简体中文

本 Module 用于自动化管理云数据库ClickHouse企业版，包括集群管理、账号管理等。


## 用法

<div style="display: block;margin-bottom: 40px;"><div class="oics-button" style="float: right;position: absolute;margin-bottom: 10px;">
  <a href="https://api.aliyun.com/terraform?source=Module&activeTab=document&sourcePath=alibabacloud-automation%3A%3Aenterprise-clickhouse&spm=docs.m.alibabacloud-automation.enterprise-clickhouse" target="_blank">
    <img alt="Open in AliCloud" src="https://img.alicdn.com/imgextra/i1/O1CN01hjjqXv1uYUlY56FyX_!!6000000006049-55-tps-254-36.svg" style="max-height: 44px; max-width: 100%;">
  </a>
</div></div>

创建一个云数据库ClickHouse企业版实例：


```hcl
module "complete" {
  source = "alibabacloud-automation/enterprise-clickhouse/alicloud"

  #alicloud_click_house_enterprise_db_cluster
  create_cluster = true
  scale_max      = "16"
  scale_min      = "8"
  vswitch_id     = "vsw-test"
  vpc_id         = "vpc-test"
  zone_id        = "zone-id-test"
  multi_zones = []

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
    }
  ]

  #alicloud_click_house_enterprise_db_cluster_backup_policy
  preferred_backup_period = "Monday"
  preferred_backup_time   = "04:00Z-05:00Z"
  backup_retention_period = "7"

  #alicloud_click_house_enterprise_db_cluster_security_ip
  security_ip_group_list = [
    {
      group            = "testgroup1"
      security_ip_list = "127.0.0.1"
    }
  ]
}
```

## 示例

* [完整示例](https://github.com/alibabacloud-automation/terraform-alicloud-enterprise-clickhouse/tree/main/examples/complete)


<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [alicloud_click_house_enterprise_db_cluster.cluster](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/click_house_enterprise_db_cluster) | resource |
| [alicloud_click_house_enterprise_db_cluster_account.accounts](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/click_house_enterprise_db_cluster_account) | resource |
| [alicloud_click_house_enterprise_db_cluster_backup_policy.backup_policy](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/click_house_enterprise_db_cluster_backup_policy) | resource |
| [alicloud_click_house_enterprise_db_cluster_security_ip.security_ip_groups](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/click_house_enterprise_db_cluster_security_ip) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_list"></a> [account\_list](#input\_account\_list) | The account info list for creating several accounts | <pre>list(object({<br/>    account             = string<br/>    account_type        = string<br/>    account_description = string<br/>    password            = string<br/>    dml_auth_setting = object({<br/>      allow_databases    = list(string)<br/>      allow_dictionaries = list(string)<br/>      ddl_authority      = bool<br/>      dml_authority      = string<br/>    })<br/>  }))</pre> | `[]` | no |
| <a name="input_backup_retention_period"></a> [backup\_retention\_period](#input\_backup\_retention\_period) | Backup retention time. | `string` | `"7"` | no |
| <a name="input_create_backup_policy"></a> [create\_backup\_policy](#input\_create\_backup\_policy) | Controls if backup policy should be created | `bool` | `true` | no |
| <a name="input_create_cluster"></a> [create\_cluster](#input\_create\_cluster) | Controls if clickhouse cluster should be created | `bool` | `true` | no |
| <a name="input_db_cluster_id"></a> [db\_cluster\_id](#input\_db\_cluster\_id) | The db cluster id. If `create_cluster` is set to false, `db_cluster_id` must be set to be the id of an existing cluster. | `string` | `null` | no |
| <a name="input_multi_zones"></a> [multi\_zones](#input\_multi\_zones) | (Optional) The zone IDs and corresponding vswitch IDs of multi-zone setup. | <pre>list(object({<br/>    zone_id     = string<br/>    vswitch_ids = list(string)<br/>  }))</pre> | `[]` | no |
| <a name="input_preferred_backup_period"></a> [preferred\_backup\_period](#input\_preferred\_backup\_period) | Preferred backup period. | `string` | `"Monday"` | no |
| <a name="input_preferred_backup_time"></a> [preferred\_backup\_time](#input\_preferred\_backup\_time) | Preferred backup time. | `string` | `"04:00Z-05:00Z"` | no |
| <a name="input_scale_max"></a> [scale\_max](#input\_scale\_max) | The maximum value of serverless auto scaling. | `string` | `"16"` | no |
| <a name="input_scale_min"></a> [scale\_min](#input\_scale\_min) | The minimum value of serverless auto scaling. | `string` | `"8"` | no |
| <a name="input_security_ip_group_list"></a> [security\_ip\_group\_list](#input\_security\_ip\_group\_list) | The info list for creating several security ip groups | <pre>list(object({<br/>    group            = string<br/>    security_ip_list = string<br/>  }))</pre> | `[]` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The VPC ID. | `string` | `null` | no |
| <a name="input_vswitch_id"></a> [vswitch\_id](#input\_vswitch\_id) | The vSwitch ID. | `string` | `null` | no |
| <a name="input_zone_id"></a> [zone\_id](#input\_zone\_id) | The zone ID of EnterpriseDBCluster. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_click_house_enterprise_db_cluster_account_ids"></a> [click\_house\_enterprise\_db\_cluster\_account\_ids](#output\_click\_house\_enterprise\_db\_cluster\_account\_ids) | The ids of clickhouse cluster enterprise edition accounts. |
| <a name="output_click_house_enterprise_db_cluster_backup_policy_id"></a> [click\_house\_enterprise\_db\_cluster\_backup\_policy\_id](#output\_click\_house\_enterprise\_db\_cluster\_backup\_policy\_id) | The id of clickhouse cluster enterprise edition backup policy. |
| <a name="output_click_house_enterprise_db_cluster_id"></a> [click\_house\_enterprise\_db\_cluster\_id](#output\_click\_house\_enterprise\_db\_cluster\_id) | The id of clickhouse cluster enterprise edition. |
| <a name="output_click_house_enterprise_db_cluster_security_ip_ids"></a> [click\_house\_enterprise\_db\_cluster\_security\_ip\_ids](#output\_click\_house\_enterprise\_db\_cluster\_security\_ip\_ids) | The ids of clickhouse cluster enterprise edition security ip groups. |
| <a name="output_click_house_enterprise_db_cluster_status"></a> [click\_house\_enterprise\_db\_cluster\_status](#output\_click\_house\_enterprise\_db\_cluster\_status) | The status of db cluster enterprise edition. |
<!-- END_TF_DOCS -->

## 提交问题

如果在使用该 Terraform Module 的过程中有任何问题，可以直接创建一个 [Provider Issue](https://github.com/aliyun/terraform-provider-alicloud/issues/new)，我们将根据问题描述提供解决方案。

**注意:** 不建议在该 Module 仓库中直接提交 Issue。

## 作者

Created and maintained by Alibaba Cloud Terraform Team(terraform@alibabacloud.com).

## 许可

MIT Licensed. See LICENSE for full details.

## 参考

* [Terraform-Provider-Alicloud Github](https://github.com/aliyun/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs)
