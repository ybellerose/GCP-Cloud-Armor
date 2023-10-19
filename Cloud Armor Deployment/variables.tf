variable "project_id" {
  type = string
  description = "The project id"  
}

variable "log_level"{
  type = string
  description = "Log Level"
  default = "VERBOSE"  #Options are VERBOSE or NORMAL
  # https://cloud.google.com/armor/docs/request-logging#verbose-logging
}

variable "json_parsing"{
  type = string
  description = "JSON Parsing support"
  default = "DISABLED"  #Options are DISABLED or STANDARD
}