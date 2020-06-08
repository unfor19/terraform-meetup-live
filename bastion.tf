resource "aws_security_group" "ssh_bastion" {
  name = "my-vpc-ssh-bastion"
  description = "Allow SSH to Bastion"
  vpc_id = module.vpc.vpc_id

  ingress {
    description = "SSH from my IP address"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [local.my_ip_cidr]
  }

  egress {
    from_port = 0
    to_port = 0 
    protocol = "-1" # any
    cidr_blocks = ["0.0.0.0/0" ]
  }

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}

resource "aws_instance" "bastion" {
  ami = var.bastion_ami_id
  instance_type = var.bastion_instance_type
  key_name = var.bastion_keypair_name # terraform-meetup
  
  subnet_id = module.vpc.public_subnets[0]
  vpc_security_group_ids = [aws_security_group.ssh_bastion.id]
  associate_public_ip_address = true
  root_block_device {
    volume_type = var.bastion_volume_type
    volume_size = var.bastion_volume_size
  }

  tags = {
    Terraform = "true"
    Environment = "dev"
  }  
}