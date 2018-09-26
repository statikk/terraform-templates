provider "openstack" {
  user_name   = "my-username"
  tenant_name = "my-tennantname"
  password    = "my-password"
  auth_url    = "http://my.openstack.cloud:5000/v2.0"
  region = "${var.region}"
}

resource "openstack_compute_instance_v2" "terraform-test-instance" {
    name = "terraform-test-instance"
    image_name = "mbeh1-ubuntu1404-devel-10072018"
    flavor_name = "${var.instance_type}"
    security_groups = ["default"]
    region = "${var.region}"

    network {
        name = "public"
    }
    metadata {
        Name = "test-instance"
    }
}