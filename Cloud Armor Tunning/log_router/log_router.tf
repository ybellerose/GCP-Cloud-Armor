variable "project_id" {}
variable "dataset_name" {}
variable "log_router_name" {}

resource "google_logging_project_sink" "sink" {

    project  = var.project_id
    
    # Log sink name
    name = var.log_router_name
    
    # Export to bigquery
    destination = "bigquery.googleapis.com/projects/${var.project_id}/datasets/${var.dataset_name}"

    # Log all from ids threat & traffic + Cloud Armor
    filter = "logName=projects/${var.project_id}/logs/requests"
    
    # Use a unique writer (creates a unique service account used for writing)
    unique_writer_identity = true

    #Enabling this option will store logs into a single table that is internally partitioned by day which can improve query performance
    bigquery_options {
        use_partitioned_tables  = true
    }
}

# Because our sink uses a unique_writer, we must grant that writer access.
resource "google_project_iam_binding" "log-writer" {
  project = var.project_id
  role = "roles/bigquery.dataEditor"

  members = [
    google_logging_project_sink.sink.writer_identity,
  ]
}