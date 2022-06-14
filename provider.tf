terraform {
  required_providers {
    exoscale = {
      source = "exoscale/exoscale"
      version = "0.37.0"
    }
  }
}

provider "exoscale" {
}