# Create a resource group if it doesn't exist
data "azurerm_resource_group" "myterraformgroup" {
    name     = "rr-rg-01"
    location = "eastus"

    tags = {
        environment = "Terraform Demo"
    }
}
# Create network interface
resource "azurerm_network_interface" "myterraformnic" {
    name                      = "rr-nic-01"
    location                  = "eastus"
    resource_group_name       = azurerm_resource_group.myterraformgroup.name

    ip_configuration {
        name                          = "myNicConfiguration"
        subnet_id                     = azurerm_subnet.myterraformsubnet.id
        private_ip_address_allocation = "Dynamic"
        public_ip_address_id          = azurerm_public_ip.myterraformpublicip.id
    }

    tags = {
        environment = "Terraform Demo"
    }
}
