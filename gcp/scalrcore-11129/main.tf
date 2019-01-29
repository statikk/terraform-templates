provider "google" {
  credentials = "${file("account.json")}"
  project     = "${var.project}"
  region      = "${var.region}"
}

module "module_1" {
  source = "./module_1"
  zone = "${var.zone}"
}