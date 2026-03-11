variable "prefix" {}

variable "vpcid" {}

variable "image_id" {}

variable "instance_type" {}

variable "keypair_name" {}

variable "master_sg" {}  

variable "max_size" {
    type    =   number
}

variable "min_size" {
    type    =   number
}

variable "desired_capacity" {
    type    =   number
}

variable "private_subnets" {
    type = list(object({
        cidr                =   string
        availability_zone   =   string
    }))
}
variable "user09-public-id" {}

variable "admin_access_cidrs" {
    type = list(string)
}
