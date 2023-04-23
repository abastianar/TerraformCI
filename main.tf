terraform {
  required_version = "1.4.5"
  required_providers {
    azurerm = {
        "source" = "hashicorp/azurerm"
        version = "3.43.0" 
    }
  }
    cloud {
    organization = "abastiantf"
    
    workspaces {
      name = "TerraformCI"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}

resource "random_string" "uniquestring" {
    length = 20
    special = false
    upper = false
}

resource "azurerm_resource_group" "rg" {
    name = "811-f194791a-provide-continuous-delivery-with-gith"
    location = "westus"  
}

resource "azurerm_storage_account" "storageaccount" {
    name = "stg${random_string.uniquestring.result}"
    resouresource_group_name = azurerm_resource_group.rg.name
    location = azurerm_resource_group.rg.location
    account_tier = "Standard"
    account_replication_type = "LRS"  
}