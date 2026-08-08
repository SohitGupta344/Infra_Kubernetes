module "rg" {
  source              = "../../modules/resource_group"
  resource_group_name = var.resource_group_name
  location            = var.location
}

module "acr" {
  source              = "../../modules/container_registry"
  acr_name            = var.acr_name
  resource_group_name = module.rg.resource_group_name
  location            = var.location
  depends_on          = [module.rg]
}

module "aks" {
  source              = "../../modules/kubernetes_cluster"
  aks_name            = var.aks_name
  resource_group_name = module.rg.resource_group_name
  location            = var.location
  dns_prefix          = var.dns_prefix

  default_node_pool = {
    name       = var.default_node_pool_name
    node_count = var.default_node_pool_node_count
    vm_size    = var.default_node_pool_vm_size
  }

  depends_on = [module.acr, module.rg]
}

module "sql_servers" {
  source              = "../../modules/sql_server"
  sql_server_name     = var.sql_server_name
  resource_group_name = module.rg.resource_group_name
  location            = var.location
  admin_username      = var.admin_username
  admin_password      = var.admin_password

  depends_on = [module.rg]
}

module "sql_databases" {
  source              = "../../modules/sql_database"
  sql_database_name   = var.sql_database_name
  resource_group_name = module.rg.resource_group_name
  location            = var.location
  sql_server_name     = module.sql_servers.sql_server_name

  depends_on = [module.sql_servers, module.rg]
}

