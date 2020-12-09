output "sg_id" {
  value = module.security_group.this_security_group_id
  description = "The id of the security group"
}
