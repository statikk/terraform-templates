/*
data "google_client_config" "current" {}

data "google_container_engine_versions" "default" {
  project = "${var.project}"
  zone = "${var.zone}"
}


resource "google_container_cluster" "terraform_cluster_1" {
  name               = "${var.network_name}"
  zone               = "${var.zone}"
  initial_node_count = 1
  network            = "${google_compute_subnetwork.default.name}"
  subnetwork         = "${google_compute_subnetwork.default.name}"
  enable_legacy_abac = true

  provisioner "local-exec" {
    when    = "destroy"
    command = "sleep 90"
  }
}

output network {
  value = "${google_compute_subnetwork.default.network}"
}

output subnetwork_name {
  value = "${google_compute_subnetwork.default.name}"
}

output cluster_name {
  value = "${google_container_cluster.terraform_cluster_1.name}"
}

output cluster_region {
  value = "${var.region}"
}

output cluster_zone {
  value = "${google_container_cluster.terraform_cluster_1.zone}"
}
*/