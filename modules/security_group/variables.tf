variable "name_prefix" { type = string }
variable "vpc_id" { type = string }
variable "allowed_bastion_cidrs" {
  type = list(string)
  default = ["10.0.0.0/8"]
}
variable "db_port" {
  type    = number
  default = 3306
}
