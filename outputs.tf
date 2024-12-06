output "resource_group_id" {
  description = "The ID of the Resource Group"
  value       = azurerm_resource_group.this.id
}

output "app_service_plan_id" {
  description = "The ID of the App Service Plan"
  value       = azurerm_app_service_plan.this.id
}

output "function_app_id" {
  description = "The ID of the Function App"
  value       = azurerm_function_app.this.id
}