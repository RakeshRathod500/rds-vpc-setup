variable "region" {
  type    = string
  default = "ap-south-1"
}

variable "name_prefix" {
  type    = string
  default = "rakesh"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "public_subnets" {
  type    = list(string)
  default = ["10.0.1.0/24","10.0.2.0/24"]
}

variable "private_subnets" {
  type    = list(string)
  default = ["10.0.101.0/24","10.0.102.0/24"]
}

variable "db_instance_class" {
  type    = string
  default = "db.t3.micro"
}

variable "db_engine" {
  type    = string
  default = "postgres"
}

variable "db_engine_version" {
  type    = string
  default = "16.4"
}

variable "db_name" {
  type    = string
  default = "appdb"
}

variable "db_username" {
  type    = string
  default = "dbadmin"
}

variable "db_password" {
  type      = string
  sensitive = true
  default   = null
}

variable "multi_az" {
  type    = bool
  default = false
}

variable "public_access_cidr" {
  type    = string
  default = "0.0.0.0/0"
}

variable "tfstate_bucket" {
  type = string
}

variable "tfstate_lock_table" {
  type = string
}


variable "backup_retention" {
  description = "The days to retain backups for the RDS instance"
  type        = number
  default     = 7
}


variable "storage_type" {
  description = "The storage type to be associated with the RDS instance (e.g., gp2, io1, standard)"
  type        = string
  default     = "gp2"
}


variable "allocated_storage" {
  description = "The amount of storage (in gigabytes) to allocate for the RDS instance"
  type        = number
  default     = 20
}
