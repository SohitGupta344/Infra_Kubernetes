module "rg" {
  source = "../../modules/azurerm_resource_group"
  rgs    = var.rgs

}

module "acr" {
  source     = "../../modules/azurerm_container_registry"
  acr        = var.acr
  depends_on = [module.rg]
}

module "aks" {
  source     = "../../modules/azurerm_kubernetes_cluster"
  aks        = var.aks
  depends_on = [module.acr, module.rg]
}

module "sql_servers" {
  source      = "../../modules/azurerm_sql_server"
  sql_servers = var.sql_servers
  depends_on  = [module.rg]
}

module "sql_databases" {
  source        = "../../modules/azurerm_sql_database"
  sql_databases = var.sql_databases

  depends_on = [module.sql_servers, module.rg]
}
