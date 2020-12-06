module "vpc" {
  source = "../modules/vpc"
  name   = "awesome-vpc"
}

module "ec2_cluster" {
  source           = "../modules/ec2-cluster"
  name             = "awesome-ec2-cluster"
  instances_number = 4
  vpc_id           = module.vpc.vpc_id
  subnet_id        = module.vpc.private_subnets[0]
  instance_type    = "t3.micro"
  ebs_type         = "gp2"

}
