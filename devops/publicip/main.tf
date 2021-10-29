data "azurerm_resource_group" "myterraformgroup" {
    name     = "rr-rg-01"
    location = "eastus"

    tags = {
        environment = "Terraform Demo"
    }
}
# Create public IPs
resource "azurerm_public_ip" "myterraformpublicip" {
    name                         = "rr-pub_ip-01"
    location                     = "eastus"
    resource_group_name          = data.azurerm_resource_group.myterraformgroup.name
    allocation_method            = "Static"

    tags = {
        environment = "Terraform Demo"
    }
}