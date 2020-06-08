
locals {
  my_ip_cidr = "${var.my_ip_address}/32"
}

variable "my_ip_address" {
  type = string
  description = "Insert your public IP address"
}

variable "bastion_ami_id" {
  type = string
  default = "ami-0701e7be9b2a77600" # ubuntu 18.04
}

variable "bastion_instance_type" { 
  type = string
  default = "t3.micro"
}

variable "bastion_keypair_name" {
  type = string
  default = "terraform-meetup"
}

variable "bastion_volume_type" {
  type = string
  default = "gp2" # io1
}

variable "bastion_volume_size" {
  type = number
  default = 8 # gigabytes
}