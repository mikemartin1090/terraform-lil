locals {
  common_tags = {
    Owner   = "Mike Martin"
    Project = "Terraform Infrastructure"
  }
  key_pair  = "mmartin-terraform"
  subnet_id = "subnet-04dcbaca87b5c530f"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}

resource "aws_instance" "m5example" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "m5.large"
  ebs_optimized = true

  tags = local.common_tags

  ebs_block_device {
    device_name           = "/dev/sdg"
    delete_on_termination = true
    volume_size           = 100
    volume_type           = "gp2"
  }

  subnet_id = local.subnet_id

  key_name = local.key_pair

  user_data = file("./aws-instance-userdata.sh")
}