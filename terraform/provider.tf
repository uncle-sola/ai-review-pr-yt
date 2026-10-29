terraform {

  cloud {

    organization = "logion"

    workspaces {
      name = "ai-review-pr-yt"
    }

  }

}

provider "azurerm" {
  features {}

  storage_use_azuread = true
}