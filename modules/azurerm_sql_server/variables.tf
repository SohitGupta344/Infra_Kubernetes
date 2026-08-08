variable "sql_servers" {
  description = "A map of SQL servers to create"
  type = map(object({
    sql_server_name   = string
    rg_name          = string
    location         = string
    admin_username   = string
    admin_password   = string
    tags             = map(string)
  }))
}