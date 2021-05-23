
data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

data "azurerm_app_service_plan" "existing-plan" {
  count               = var.existing_app_service_plan_name == "" ? 0 : 1
  name                = var.existing_app_service_plan_name
  resource_group_name = data.azurerm_resource_group.rg.name
}


resource "azurerm_app_service_plan" "service-plan" {
  count               = var.existing_app_service_plan_name == "" ? 1 : 0
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = var.location
  name                = var.new_app_service_plan_name != "" ? var.new_app_service_plan_name : "${var.app_name}-plan"
  kind                = var.linux_host ? "Linux" : "Windows"

  ## When creating a Linux App Service Plan, the reserved field must be set to true, and when creating a Windows/app App Service Plan the reserved field must be set to false.
  reserved            = var.linux_host ? true : false


  maximum_elastic_worker_count = var.app_service_plan_maximum_elastic_worker_count == "" ? 0 : var.app_service_plan_maximum_elastic_worker_count

  # Consumption Plan Skus name is "Y1" and Tier is "Dynamic".
  # SKU names available for Dedicated App Service (D1,F1,B1,B2,B3S1,S2,S3,P1,P2,P3,P1V2,P2V2,P3V3,I1,I2,I3), Tiers are (Basic, Standard, Premium, PremiumV2)
  # SKU Names available for Elastic Premium (EP1,EP2,EP3), Tier is "ElasticPremium"

  sku {
    size     = var.app_service_plan_sku_size
    capacity = var.number_of_workers
    tier     = var.app_service_plan_sku_tier
  }

}

locals {
  app_settings = {
    for i in var.app_service_app_settings :
    i.name => i.value
  }

}

resource "azurerm_app_service" "app-service" {
  depends_on = [
    azurerm_app_service_plan.service-plan,
    data.azurerm_app_service_plan.existing-plan
  ]
  app_service_plan_id     = var.existing_app_service_plan_name != "" ? data.azurerm_app_service_plan.existing-plan[0].id : azurerm_app_service_plan.service-plan[0].id
  location                = var.location
  name                    = var.app_service_name == "" ? "${var.app_name}-${var.environment}" : var.app_service_name
  resource_group_name     = data.azurerm_resource_group.rg.name
  tags                    = var.tags
  app_settings            = local.app_settings
  client_affinity_enabled = var.app_service_client_affinity_enabled == "" ? false : var.app_service_client_affinity_enabled
  enabled                 = var.app_service_enabled
  https_only              = var.app_service_https_only

  site_config {
    always_on                 = var.app_service_site_config_alwaysOn
    dotnet_framework_version  = var.app_service_site_config_dotnet_framework_version
    ftps_state                = var.app_Service_site_config_ftps_state
    http2_enabled             = var.app_service_site_config_http2_enabled
    linux_fx_version          = var.app_service_site_config_linux_fx_version
    scm_type                  = var.app_service_site_config_scm_type
    use_32_bit_worker_process = var.app_service_site_config_use_32_bit_worker_process
    websockets_enabled        = var.app_service_site_config_websockets_enabled
    managed_pipeline_mode     = var.app_service_site_config_managed_pipeline_mode
    php_version               = var.app_service_site_config_php_version
    python_version            = var.app_service_site_config_python_version
    local_mysql_enabled       = var.app_service_site_config_local_mysql_enabled
    windows_fx_version        = var.app_service_site_config_windows_fx_version
    min_tls_version           = var.app_service_site_config_min_tls_version
    java_version              = var.app_service_site_config_java_version
    java_container            = var.app_service_site_config_java_container
    java_container_version    = var.app_service_site_config_java_container_version

    cors {
      support_credentials = var.app_service_site_config_cors_support_credentials
      allowed_origins     = var.app_service_site_config_cors_allowed_origins
    }

    dynamic "ip_restriction" {
      for_each = var.app_service_site_config_ip_restrictions
      content {
        name                      = ip_restriction.value.name
        ip_address                = ip_restriction.value.ip_address != "" && ip_restriction.value.virtual_network_subnet_id == "" ? ip_restriction.value.ip_address : null
        priority                  = ip_restriction.value.priority == "" || ip_restriction.value.priority == null ? null : ip_restriction.value.priority
        virtual_network_subnet_id = ip_restriction.value.ip_address == "" && ip_restriction.value.virtual_network_subnet_id != "" ? ip_restriction.value.ip_address : null
        action                    = ip_restriction.value.action
      }
    }

  }

  dynamic "auth_settings" {
    for_each         = var.app_service_auth_settings == [] ? [] : var.app_service_auth_settings
    content {
    enabled          = auth_settings.value.enabled
    issuer           = auth_settings.value.issuer_url
      active_directory {
        client_id      = auth_settings.value.active_directory_client_id
        client_secret  = auth_settings.value.active_directory_client_secret
      }
    }
  }


  dynamic "connection_string" {
    for_each = var.app_service_connection_strings == [] ? [] : var.app_service_connection_strings
    content {
    name  = connection_string.value.name
    type  = connection_string.value.type
    value = connection_string.value.value
    }
  }


  identity {
    type = "SystemAssigned"
  }

}
