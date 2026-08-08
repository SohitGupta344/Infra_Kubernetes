output "server_ids" {
  value = {
    for key, server in azurerm_mssql_server.sql_server :
    key => server.id
  }
}
