variable "name" {
  description = "The name of the ec2 cluster"
  type        = string
}

variable "instances_number" {
  description = "The number of ec2 instances"
  type        = number
}

variable "vpc_id" {
  description = "The id of the vpc"
  type        = string
}

variable "subnet_id" {
  description = "The id of the subnet"
  type        = string
}

variable "instance_type" {
  description = "The instance type of the instances"
  type        = string
}

variable "ebs_type" {
  description = "The ebs type of the disks to associate with the instances"
  type        = string
}

variable "ami" {
  description = "The AMI to install on the the instances"
  type        = string
}
