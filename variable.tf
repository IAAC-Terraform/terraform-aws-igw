variable "vpc_id" {}

variable "env" {}

variable "create_vpc" {}

variable "route_table_id" {
    type = "list"
}

variable "destination_cidr_block" {}

variable "igw_route" {}

variable "igw_route_count" {}

variable "name" {}