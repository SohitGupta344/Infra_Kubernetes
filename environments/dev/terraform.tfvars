###############################################################
# Resource Groups
###############################################################

rgs = {
  "todoapp-rg" = {
    name     = "todoapp-dev-rg"
    location = "Central India"
    tags = {
      Environment = "dev"
      Project     = "todoapp"
      ManagedBy   = "terraform"
    }
  }
}

###############################################################
# Azure Container Registry
###############################################################

acr = {
  "todoapp-acr" = {
    name                = "todoappacrdev001"
    resource_group_name = "todoapp-dev-rg"
    location            = "Central India"
    tags = {
      Environment = "dev"
      Project     = "todoapp"
      ManagedBy   = "terraform"
    }
  }
}

###############################################################
# Azure Kubernetes Service
###############################################################

aks = {
  "todoapp-aks" = {
    name       = "todoapp-dev-aks"
    location   = "Central India"
    rg_name    = "todoapp-dev-rg"
    dns_prefix = "todoapp-dev"

    default_node_pool = {
      name       = "default"
      node_count = 1
      vm_size    = "Standard_B2s_v2"
    }

    tags = {
      Environment = "dev"
      Project     = "todoapp"
      ManagedBy   = "terraform"
    }
  }
}

###############################################################
# SQL Servers
###############################################################

sql_servers = {
  "todoapp-sql" = {
    sql_server_name = "todoapp-dev-sqlserver"
    rg_name         = "todoapp-dev-rg"
    location        = "Central India"
    admin_username  = "sqladminuser"
    admin_password  = "P@ssw0rd!2026#Secure"
    tags = {
      Environment = "dev"
      Project     = "todoapp"
      ManagedBy   = "terraform"
    }
  }
}

###############################################################
# SQL Databases
###############################################################

sql_databases = {
  "todoapp-db" = {
    sql_db_name     = "todoapp-dev-db"
    max_size_gb     = 2
    sql_server_name = "todoapp-dev-sqlserver"
    rg_name         = "todoapp-dev-rg"
    tags = {
      Environment = "dev"
      Project     = "todoapp"
      ManagedBy   = "terraform"
    }
  }
}
