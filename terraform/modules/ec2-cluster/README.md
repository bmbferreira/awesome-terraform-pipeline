# Usage
<!--- BEGIN_TF_DOCS --->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| ebs\_type | The ebs type of the disks to associate with the instances | `string` | n/a | yes |
| instance\_type | The instance type of the instances | `string` | n/a | yes |
| instances\_number | The number of ec2 instances | `number` | n/a | yes |
| name | The name of the ec2 cluster | `string` | n/a | yes |
| subnet\_id | The id of the subnet | `string` | n/a | yes |
| vpc\_id | The id of the vpc | `string` | n/a | yes |

## Outputs

No output.

<!--- END_TF_DOCS --->
