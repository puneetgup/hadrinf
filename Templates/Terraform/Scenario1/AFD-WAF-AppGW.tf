provider "azurerm" {
  //   version         >= "1.38.0"
  //   subscription_id = ""
  #(Optional) The Subscription ID which should be used. This can also be sourced from the ARM_SUBSCRIPTION_ID Environment Variable.

  //   client_id = ""
  #(Optional) The Client ID which should be used. This can also be sourced from the ARM_CLIENT_ID Environment Variable.
  //   client_secret = ""
  //   tenant_id     = ""
  #(Optional) The Tenant ID which should be used. This can also be sourced from the ARM_TENANT_ID Environment Variable.

  environment = "public"
  #(Optional) The Cloud Environment which should be used. Possible values are public, usgovernment, german and china. Defaults to public. This can also be sourced from the ARM_ENVIRONMENT environment variable.
}

# Allows what version of Terraform to use.
terraform {
  required_version = ">=0.12.0"
  # Backend for configuring remote state files to Azure Storage
  //   backend "azurerm" {
  //     storage_account_name = "AzureStorageAccount"
  //     container_name       = "StorageContainer"
  //     access_key = ""
  //   }
}

resource "azurerm_resource_group" "AFDRG" {
  name     = "AzureFrontDoorRG"
  location = "WestUS"
}

resource "azurerm_frontdoor" "example" {
  name                                         = "example-FrontDoor-AE"
  location                                     = azurerm_resource_group.AFDRG.location
  resource_group_name                          = azurerm_resource_group.AFDRG.name
  enforce_backend_pools_certificate_name_check = false

  routing_rule {
    name               = "exampleRoutingRule1"
    accepted_protocols = ["Http", "Https"]
    patterns_to_match  = ["/*"]
    frontend_endpoints = ["exampleFrontendEndpoint1"]
    forwarding_configuration {
      forwarding_protocol = "MatchRequest"
      backend_pool_name   = "exampleBackendBing"
    }
  }

  backend_pool_load_balancing {
    name = "exampleLoadBalancingSettings1"
  }

  backend_pool_health_probe {
    name = "exampleHealthProbeSetting1"
  }

  backend_pool {
    name = "exampleBackendBing"
    backend {
      host_header = "www.bing.com"
      address     = "www.bing.com"
      http_port   = 80
      https_port  = 443
    }

    load_balancing_name = "exampleLoadBalancingSettings1"
    health_probe_name   = "exampleHealthProbeSetting1"
  }

  frontend_endpoint {
    name                              = "exampleFrontendEndpoint1"
    host_name                         = "example-FrontDoor.azurefd.net"
    custom_https_provisioning_enabled = false
  }
}