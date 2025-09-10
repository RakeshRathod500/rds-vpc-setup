variable "name_prefix" { type = string }
variable "db_name" { type = string }
variable "username" { type = string }
variable "password" {
  type      = string
  sensitive = true
  default   = null
}
variable "engine" { type = string }
variable "engine_version" { type = string }
variable "instance_class" { type = string }
variable "subnet_ids" { type = list(string) }
variable "vpc_security_group_ids" { type = list(string) }
variable "multi_az" {
  type    = bool
  default = false
}
variable "backup_retention" {
  type    = number
  default = 7
}
variable "allocated_storage" {
  type    = number
  default = 20
}
variable "storage_type" {
  type    = string
  default = "gp2"
}
variable "region" { type = string }
