variable "resource_group_name" {
  type = string
  default = ""
}
variable "location" {
  type = string
  default = ""
}
variable "environment" {
  type = string
  default = ""
}
variable "app_name" {
  type = string
  default = ""
}
variable "linux_host" {
  type = bool
  default = true
}
variable "new_app_service_plan_name" {
  type = string
  default = ""
}
variable "app_service_plan_sku_tier" {
  type = string
  default = ""
}
variable "app_service_plan_maximum_elastic_worker_count" {
  type = number
  default = 0
}
variable "number_of_workers" {
  type = number
  default = 1
}
variable "app_service_plan_sku_size" {
  type = string
  default = ""
}
variable "existing_app_service_plan_name" {
  type = string
  default = ""
}
variable "app_service_connection_strings" {
  type = list(object({
    name = string
    type = string
    value= string
  }))
  default = []
}
variable "app_service_auth_settings" {
  type = list(object({
    enabled = bool
    active_directory_client_id = string
    active_directory_client_secret = string
    issuer_url = string
  }))
  default = [  ]
}
variable "app_service_site_config_ip_restrictions" {
  type  = list(object({
    name                      = string
    ip_address                = string
    priority                  = number
    virtual_network_subnet_id = string
    action                    = string
  }))
  description = ""
  /*
  name - (Optional) The name for this IP Restriction.
  priority - (Optional) The priority for this IP Restriction. Restrictions are enforced in priority order. By default, the priority is set to 65000 if not specified.
  action - (Optional) Does this restriction Allow or Deny access for this IP range. Defaults to Allow."
  ip_address - (Optional) The IP Address used for this IP Restriction in CIDR notation.
  virtual_network_subnet_id - (Optional) The Virtual Network Subnet ID used for this IP Restriction.
  Either IP address or subnet ID needs to be passed
  */
  default = []
}
variable "app_service_site_config_java_container_version" {
  type = string
  default = ""
}
variable "app_service_site_config_java_container" {
  type = string
  default = ""
}
variable "app_service_site_config_java_version" {
  type = string
  default = ""
}
variable "app_service_site_config_min_tls_version" {
  type = string
  default = ""
}
variable "app_service_site_config_windows_fx_version" {
  type = string
  default = ""
}
variable "app_service_site_config_local_mysql_enabled" {
  type = bool
  default = false
}
variable "app_service_site_config_python_version" {
  type = string
  default = ""
}
variable "app_service_site_config_php_version" {
  type = string
  default = ""
}
variable "app_service_site_config_managed_pipeline_mode" {
  type  = string
  default = "Integrated"
}
variable "app_service_site_config_websockets_enabled" {
  type = bool
  default = false
}
variable "app_service_site_config_use_32_bit_worker_process" {
  type = bool
  default = false
}
variable "app_service_site_config_cors_support_credentials" {
  type = bool
  default = false
}
variable "app_service_site_config_cors_allowed_origins" {
  type = list(string)
  default = []
}
variable "app_service_site_config_scm_type" {
  type = string
  default = ""
}
variable "app_service_site_config_linux_fx_version" {
  type = string
  default = ""
}
variable "app_service_site_config_http2_enabled" {
  type = bool
  default = false
}
variable "app_Service_site_config_ftps_state" {
  type = string
  default = "AllAllowed"
}
variable "app_service_site_config_dotnet_framework_version" {
  type = string
  default = ""
}
variable "app_service_site_config_alwaysOn" {
  type = bool
  default = false
}
variable "app_service_https_only" {
  type = bool
  default = false
}
variable "app_service_enabled" {
  type = bool
  default = true
}
variable "app_service_client_affinity_enabled" {
  type = bool
  default = false
}
variable "tags" {
  type = map(string)
  default = {}
}
variable "app_service_name" {
  type = string
  default = ""
}
variable "app_service_app_settings" {
  type        = list(object({
    name  = string
    value = string
  }))
  description = "A map of key-value pairs for App Settings and custom values."
  default     = []
}

