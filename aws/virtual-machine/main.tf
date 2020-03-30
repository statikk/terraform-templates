provider "aws" {
  region = "${var.region}"
}

module "vpc" {
	source  = "320828dff7e0.test-env.scalr.com/org-sgpvfvrkj5ao2j0/vpc/aws"
	version = "2.21.0"
	# insert 8 required variables here.
}

data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"]
}


resource "aws_instance" "terraform-test-instance" {
  ami             = "${data.aws_ami.ubuntu.id}"
  instance_type   = "${var.instance_type}"

  tags = {
    Name = "SashaT-instance-000"
    timestamp = "${timestamp()}"
    test-env-owner = "o.timoshyn@scalr.com"
    owner = "o.timoshyn"
  }
  

  lifecycle {
    ignore_changes = ["tags"]
  }
}
