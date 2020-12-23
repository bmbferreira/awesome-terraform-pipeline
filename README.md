![Awesome terraform pipeline](https://github.com/bmbferreira/awesome-terraform-pipeline/workflows/Awesome%20Terraform%20Workflow/badge.svg)

# Awesome terraform pipeline

This repository is a collection of experiments with different terraform tools
to automate tests, infrastructure cost management, documentation, static code analysis and security checks 
on the [pipeline, using Github Actions](./.github/workflows/awesome-terraform-pipeline.yml).
The main goal of this repository is to learn more about terraform and related tools. 

The following tools are executed on the pipeline:
* [TfLint](https://github.com/terraform-linters/tflint)
* [Terraform-docs](https://github.com/terraform-docs/terraform-docs)
* [Infracost](https://github.com/infracost/infracost)
* [Checkov](https://github.com/bridgecrewio/checkov)
* [Terratest](https://github.com/infracost/infracost)

It contains the following terraform modules (most of them are just simple "extensions" of the popular [Anton Babenko's terraform-aws-modules](https://github.com/terraform-aws-modules)):
* [ec2-cluster](./terraform/modules/ec2-cluster/README.md)
* [iam](./terraform/modules/iam/README.md)
* [s3](./terraform/modules/s3/README.md)
* [vpc](./terraform/modules/vpc/README.md)
* [aws-backend-state](./terraform/modules/aws-backend-state/README.md)
