variable "region" {
  description = "REQUIRED: AWS Region to deploy the Customer Edge into"
  type        = string
}

variable "aws_access_key" {
  description = "REQUIRED: AWS programatic access key"
  type        = string
}

variable "aws_secret_key" {
  description = "REQUIRED: AWS programatic secret key"
  type        = string
}

variable "name" {
  description = "REQUIRED: AWS vpc name"
  type        = string
}

variable "cred" {
  description = "REQUIRED: Volterra AWS credentials name"
  type        = string
}

variable "tenant" {
  description = "REQUIRED: XC tenant name"
  type        = string
}

variable "instance" {
  description = "REQUIRED: AWS and XC CE Instance size"
  type        = string
}

variable "az1" {
  description = "REQUIRED: AWS AZ"
  type        = string
}

variable "az2" {
  description = "REQUIRED: AWS AZ"
  type        = string
}

variable "az3" {
  description = "REQUIRED: AWS AZ"
  type        = string
}

variable "url" {}
variable "api_p12_file" {}
variable "api_cert" {}
variable "api_key" {}
variable "clustername" {}
variable "tenant_name" {}
variable "aws_region" {}
variable "subnet1" {}
variable "subnet2" {}
variable "subnet3" {}
variable "projectprefix" {}
