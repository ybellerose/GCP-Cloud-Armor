
module "cloud_armor_sec_policy" {
  source            = "./cloud_armor_sec_policy"
  project_id        = var.project_id
  log_level         = var.log_level
  json_parsing      = var.json_parsing
}