terraform {
  backend "remote" {
    hostname = "2e42503f36eb.test-env.scalr.com"
    organization = "tf-acc1env1"
    token = ""
    workspaces {
      name = "noVCS03"
    }
  }
}

provider "aws" {
  secret_key = "${var.scalr_aws_secret_key}"
  access_key = "${var.scalr_aws_access_key}"
  region = "${var.region}"
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
    Name = "ST-test-instance"
    timestamp = "${timestamp()}"
    test-env-owner = "o.timoshyn@scalr.com"
    owner = "o.timoshyn"
  }
  

  lifecycle {
    ignore_changes = ["tags"]
  }
}
