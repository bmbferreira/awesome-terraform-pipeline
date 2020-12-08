module "security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 3.0"

  name        = "example"
  description = "Security group for example usage with EC2 instance"
  vpc_id      = var.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["ssh-tcp", "all-icmp"]
  egress_rules        = ["all-all"]
}

module "ec2_cluster" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 2.0"

  instance_count = var.instances_number

  name                        = var.name
  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [module.security_group.this_security_group_id]
  associate_public_ip_address = true
}

resource "aws_volume_attachment" "this_ec2" {
  count = var.instances_number

  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.this[count.index].id
  instance_id = module.ec2_cluster.id[count.index]
}

resource "aws_ebs_volume" "this" {
  count = var.instances_number

  availability_zone = module.ec2_cluster.availability_zone[count.index]
  size              = 1
  type              = var.ebs_type
  encrypted         = true
}
