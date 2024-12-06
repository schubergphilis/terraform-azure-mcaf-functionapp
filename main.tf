resource "azurerm_app_service_plan" "this" {
  name                = var.app_service_plan.name
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  kind                = "FunctionApp"
  sku {
    tier      = var.app_service_plan.sku.tier
    size      = var.app_service_plan.sku.size
    capacity  = var.app_service_plan.sku.capacity
  }
  tags = merge(
    var.tags,
    {
      "Resource Type" = "App Service Plan"
    }
  )
}

resource "azurerm_function_app" "this" {
  name                       = var.function_app.name
  location                   = azurerm_resource_group.this.location
  resource_group_name        = azurerm_resource_group.this.name
  app_service_plan_id        = azurerm_app_service_plan.this.id
  storage_account_name       = var.function_app.storage_account_name
  storage_account_access_key = var.function_app.storage_account_access_key
  os_type                    = var.function_app.os_type
  version                    = var.function_app.version

  identity {
    type = "SystemAssigned"
  }

  app_settings = merge(
    var.function_app.app_settings,
    {
      "FUNCTIONS_WORKER_RUNTIME" = var.function_app.functions_worker_runtime
    }
  )

  tags = merge(
    var.tags,
    {
      "Resource Type" = "Function App"
    }
  )
}