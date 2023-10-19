variable "project_id" {}
variable "dataset_name" {}
variable "dataset_location" {}

resource "google_bigquery_dataset" "dataset" {
    project                     = var.project_id
    dataset_id                  = var.dataset_name
    friendly_name               = "CloudArmor"
    description                 = "Cloud Armor tunning dataset"
    location                    = var.dataset_location
    delete_contents_on_destroy  = true
}

resource "google_bigquery_dataset_iam_member" "editor" {
    project    = var.project_id
    dataset_id = google_bigquery_dataset.dataset.dataset_id
    role       = "roles/bigquery.dataEditor"
    member     = "serviceAccount:cloud-armor-tunning-sa@${var.project_id}.iam.gserviceaccount.com"
}