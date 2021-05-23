module "azure-app-service" {
  source                                                   = "../../Terraform_Modules/AzureAppService"
  resource_group_name                                      = var.usr_resource_group_name
  location                                                 = var.usr_location
  environment                                              = var.usr_environment
  app_name                                                 = var.usr_app_name
  linux_host                                               = var.usr_linux_host
  new_app_service_plan_name                                = var.usr_new_app_service_plan_name
  app_service_plan_sku_tier                                = var.usr_app_service_plan_sku_tier
  app_service_plan_maximum_elastic_worker_count            = var.usr_app_service_plan_maximum_elastic_worker_count
  number_of_workers                                        = var.usr_number_of_workers
  app_service_plan_sku_size                                = var.usr_app_service_plan_sku_size
  existing_app_service_plan_name                           = var.usr_existing_app_service_plan_name
  app_service_connection_strings                           = var.usr_app_service_connection_strings
  app_service_auth_settings                                = var.usr_app_service_auth_settings
  app_service_site_config_ip_restrictions                  = var.usr_app_service_site_config_ip_restrictions
  app_service_site_config_java_container_version           = var.usr_app_service_site_config_java_container_version
  app_service_site_config_java_container                   = var.usr_app_service_site_config_java_container
  app_service_site_config_java_version                     = var.usr_app_service_site_config_java_version
  app_service_site_config_min_tls_version                  = var.usr_app_service_site_config_min_tls_version
  app_service_site_config_windows_fx_version               = var.usr_app_service_site_config_windows_fx_version
  app_service_site_config_local_mysql_enabled              = var.usr_app_service_site_config_local_mysql_enabled
  app_service_site_config_python_version                   = var.usr_app_service_site_config_python_version
  app_service_site_config_php_version                      = var.usr_app_service_site_config_php_version
  app_service_site_config_managed_pipeline_mode            = var.usr_app_service_site_config_managed_pipeline_mode
  app_service_site_config_websockets_enabled               = var.usr_app_service_site_config_websockets_enabled
  app_service_site_config_use_32_bit_worker_process        = var.usr_app_service_site_config_use_32_bit_worker_process
  app_service_site_config_cors_support_credentials         = var.usr_app_service_site_config_cors_support_credentials
  app_service_site_config_cors_allowed_origins             = var.usr_app_service_site_config_cors_allowed_origins
  app_service_site_config_scm_type                         = var.usr_app_service_site_config_scm_type
  app_service_site_config_linux_fx_version                 = var.usr_app_service_site_config_linux_fx_version
  app_service_site_config_http2_enabled                    = var.usr_app_service_site_config_http2_enabled
  app_Service_site_config_ftps_state                       = var.usr_app_Service_site_config_ftps_state
  app_service_site_config_dotnet_framework_version         = var.usr_app_service_site_config_dotnet_framework_version
  app_service_site_config_alwaysOn                         = var.usr_app_service_site_config_alwaysOn
  app_service_https_only                                   = var.usr_app_service_https_only
  app_service_enabled                                      = var.usr_app_service_enabled
  app_service_client_affinity_enabled                      = var.usr_app_service_client_affinity_enabled
  tags                                                     = var.usr_tags
  app_service_name                                         = var.usr_app_service_name
  app_service_app_settings                                 = var.usr_app_service_app_settings
}