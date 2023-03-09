terraform {
  required_version = ">= 1.3.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0"
    }
    volterra  = {
      source  = "volterraedge/volterra"
      version = "0.11.19"
    }
  }
}

# terraform {
#   required_providers {
#     volterra = {
#       source = "volterraedge/volterra"
#       version = "0.11.19"
#     }
#   }
# }
