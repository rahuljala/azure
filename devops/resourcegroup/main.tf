# Create a resource group if it doesn't exist
resource "azurerm_resource_group" "myterraformgroup" {
    name     = "rr-rg-01"
    location = "eastus"

    tags = {
        environment = "Terraform Demo"
    }
}
