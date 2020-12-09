# AWS EC2 Cluster Terraform module

Basic and dummy module to create a "cluster" of identical ec2 instances with the same subgroup, 
on the same vpc and on the same subnet.

## Usage

```hcl
module "ec2_cluster" {
  source           = "../modules/ec2-cluster"
  name             = "awesome-ec2-cluster"
  instances_number = 10
  vpc_id           = "vpc-id-123"
  subnet_id        = "subnet-id-123"
  instance_type    = "t3.xlarge"
  ebs_type         = "gp2"
  ami              = "ami-09b9e380df60300c8"
}
```

<!--- BEGIN_TF_DOCS --->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13.5 |
| aws | >= 3.15.0 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 3.15.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| ami | The AMI to install on the the instances | `string` | n/a | yes |
| ebs\_type | The ebs type of the disks to associate with the instances | `string` | n/a | yes |
| instance\_type | The instance type of the instances | `string` | n/a | yes |
| instances\_number | The number of ec2 instances | `number` | n/a | yes |
| name | The name of the ec2 cluster | `string` | n/a | yes |
| subnet\_id | The id of the subnet | `string` | n/a | yes |
| vpc\_id | The id of the vpc | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| sg\_id | The id of the security group |

<!--- END_TF_DOCS --->
