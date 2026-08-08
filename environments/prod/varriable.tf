variable "rgs" {
  description = "A map of resource groups to create"
  type = map(object({
    name     = string
    location = string
    tags     = map(string)
  }))
}

variable "acr" {
  description = "A map of Azure Container Registries to create"
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    tags                = map(string)
  }))

}

variable "aks" {
  description = "A map of Azure Kubernetes Service clusters to create"
  type = map(object({
    name       = string
    location   = string
    rg_name    = string
    dns_prefix = string

    default_node_pool = object({
      name       = string
      node_count = number
      vm_size    = string
    })

    tags = map(string)
  }))
}

variable "sql_servers" {
  description = "A map of SQL servers to create"
  type = map(object({
    sql_server_name = string
    rg_name         = string
    location        = string
    admin_username  = string
    admin_password  = string
    tags            = map(string)
  }))
}


variable "sql_databases" {
  description = "A map of SQL databases to create"
  type = map(object({
    sql_db_name     = string
    max_size_gb     = number
    sql_server_name = string
    rg_name         = string
    tags            = map(string)
  }))
}


