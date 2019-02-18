provider "google" {
  credentials = "${file("account.json")}"
  project     = "${var.project}"
  zone      = "${var.zone}"
}

module "module_1" {
  source = "./module_1"
  zone = "${var.zone}"
}