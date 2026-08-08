variable "aks" {
  type = map(object({
    name        = string
    location    = string
    rg_name     = string
    dns_prefix = string

    default_node_pool = object({
      name       = string
      node_count = number
      vm_size    = string
    })

    tags = map(string)
  }))
}
