provider "google" {
  credentials = "${file("account.json")}"
  project     = "${var.project}"
  zone      = "${var.zone}"
}


resource "google_compute_instance" "terraform-test-instance" {
  count        = "${var.instance_count}"
  name         = "terraform-test-instance-${count.index + 1}"
  machine_type = "f1-micro"
  zone         = "${var.zone}"

  boot_disk {
    initialize_params {
      image = "debian-7-wheezy-v20160301"
    }
  }


  tags = ["test-instance-2"]

  network_interface {
    network = "default"
    access_config {}
  }

  labels = {
    timestamp = "${replace(lower(timestamp()), ":", "_")}"
  }
  lifecycle {
    ignore_changes = ["labels"]
  }

}
