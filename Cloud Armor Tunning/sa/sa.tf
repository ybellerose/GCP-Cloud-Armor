variable "project_id" {}

resource "google_service_account" "service_account" {
    project  = var.project_id
    account_id   = "cloud-armor-tunning-sa"
    display_name = "Cloud Armor account for Cloud Armor tunning"
}