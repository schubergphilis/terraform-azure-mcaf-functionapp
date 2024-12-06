variable "resource_group" {
  description = "The name and location of the resource group in which to create the resources."
  type = object({
    name     = string
    location = string
  })
  default = {
    name     = null,
    location = null
  }
  nullable = false
}

variable "app_service_plan" {
  description = "Configuration for the App Service Plan."
  type = object({
    name = string
    sku = object({
      tier      = string
      size      = string
      capacity  = number
    })
  })
  nullable = false
}

variable "function_app" {
  description = "Configuration for the Function App."
  type = object({
    name                       = string
    storage_account_name       = string
    storage_account_access_key = string
    os_type                    = string
    version                    = string
    functions_worker_runtime   = string
    app_settings               = map(string)
  })
  nullable = false
}

variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
  default     = {}
}