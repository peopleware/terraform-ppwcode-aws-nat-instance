variable "instance_type" {
  description = "The EC2 instance type"
  default = "t3.nano"
}

variable "key_name" {
  description = "The key to use when launcing NAT instance"
  default = ""
}

variable "security_group_ids" {
  type = "list"
}

variable "subnet_id" {

}

variable "vpc_cidr" {

}
