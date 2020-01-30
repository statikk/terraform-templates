provider "aws" {
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
