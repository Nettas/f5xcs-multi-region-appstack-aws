provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

# provider "volterra" {
#     #   volterra = {
#     #   # sousource = "volterraedge/volterra"
#     #   # version = "0.11.6"
#     # }
# }
# provider "volterra" {
#   api_p12_file = var.api_p12_file
#   api_cert     = var.api_p12_file != "" ? "" : var.api_cert
#   api_key      = var.api_p12_file != "" ? "" : var.api_key
#   url          = var.url
# }