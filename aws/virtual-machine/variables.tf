variable "region" {
  default = "us-east-1"
}

variable "instance_type" {
  default = "m3.medium"
}

resource "aws_instance" "s-tf" {
  ami = var.image_id
  instance_type = var.instance_type
  subnet_id = var.subnet_id
  tags = {
    test-env-owner = "<o.timoshyn@scalr.com>"
}
