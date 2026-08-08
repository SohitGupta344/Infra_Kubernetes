###############################################################
# Resource Groups
###############################################################

rgs = {
  "todoapp-rg" = {
    name     = "dev-rg"
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
    name                = "devacrdev001"
    resource_group_name = "dev-rg"
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
    name       = "dev-aks"
    location   = "Central India"
    rg_name    = "dev-rg"
    dns_prefix = "dev-app"

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
    sql_server_name = "dev-sqlserver"
    rg_name         = "dev-rg"
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
    sql_db_name     = "dev-db"
    max_size_gb     = 2
    sql_server_name = "dev-sqlserver"
    rg_name         = "dev-rg"
    tags = {
      Environment = "dev"
      Project     = "todoapp"
      ManagedBy   = "terraform"
    }
  }
}
