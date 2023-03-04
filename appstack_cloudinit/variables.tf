variable "aws_region" {
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

variable "f5xc_ce_gateway_multi_node" {
  description = "OPTIONAL: Set to true to deploy a 3 node cluster of Customer Edges"
  type        = bool
  default     = true
}
variable "az1" {
  description = "OPTIONAL: AWS availability zone to deploy first Customer Edge into"
  type        = string
  default     = ""
}

variable "az2" {
  description = "OPTIONAL: AWS availability zone to deploy second Customer Edge into"
  type        = string
  default     = ""
}

variable "az3" {
  description = "OPTIONAL: AWS availability zone to deploy third Customer Edge into"
  type        = string
  default     = ""
}

variable "project_prefix" {
  description = "OPTIONAL: Provide a project name prefix that will be applied"
  type        = string
  default     = "demo"
}

variable "resource_owner" {
  description = "OPTIONAL: Provide owner of the deployment for tagging purposes"
  type        = string
  default     = "demo.user"
}

variable "ce1_outside_subnet_id" {
  description = "REQUIRED: The AWS subnet ID for the outside subnet of Customer Edge 1"
  type        = string
}

variable "ce1_inside_subnet_id" {
  description = "REQUIRED: The AWS subnet ID for the inside subnet of Customer Edge 1"
  type        = string
}


variable "ce2_outside_subnet_id" {
  description = "OPTIONAL: The AWS subnet ID for the outside subnet of Customer Edge 2"
  type        = string
  default     = ""
}

variable "ce2_inside_subnet_id" {
  description = "OPTIONAL: The AWS subnet ID for the inside subnet of Customer Edge 2"
  type        = string
  default     = ""
}

variable "ce3_outside_subnet_id" {
  description = "OPTIONAL: The AWS subnet ID for the outside subnet of Customer Edge 3"
  type        = string
  default     = ""
}

variable "ce3_inside_subnet_id" {
  description = "OPTIONAL: The AWS subnet ID for the inside subnet of Customer Edge 3"
  type        = string
  default     = ""

}

variable "outside_security_group" {
  description = "REQUIRED: The AWS security group ID for the outside interfaces"
  type        = string
}

variable "inside_security_group" {
  description = "REQUIRED: The AWS security group ID for the inside interfaces"
  type        = string
}


variable "amis" {
  description = "REQUIRED: The AWS amis for the Customer Edge image"
  type        = map(any)
  default = {
    "ca-central-1"   = "ami-0e1d39ac2c1c6ef2b"
    "af-south-1"	 = "ami-055ba977ad1ac6c6c"
    "ap-east-1"	     = "ami-05673740d6f3baee9"
    "ap-south-1"	 = "ami-00788bd38d0fa4ff0"
    "ap-northeast-2" = "ami-001dd539455cd4038"
    "ap-southeast-2" = "ami-0538af7edde340eb1"
    "ap-northeast-1" = "ami-030863f8dfd7029f5"
    "ap-southeast-1" = "ami-0615e371749491e5f"
    "eu-central-1"	 = "ami-094c24e0ff9141647"
    "eu-west-1"      = "ami-01ef385d886b812d2"
    "eu-west-3"	     = "ami-0e576d6275f207196"
    "eu-south-1"     =	"ami-0648b746bb1341bf4"
    "eu-north-1"     =	"ami-0e939f8711e36b456"
    "eu-west-2"	     = "ami-041138a60e1cb4314"
    "me-south-1"     =	"ami-06603c1772bd574c2"
    "sa-east-1"	     = "ami-082f0a654c0936aa5"
    "us-east-1"	     = "ami-0f0926d6b6838b9cb"
    "us-east-2"	     = "ami-0d011fcc6cae3ed0a"
    "us-west-1"	     = "ami-0bec6c226bff67de2"
    "us-west-2"	     = "ami-0d2f1966d883656cd"
  }
}

variable "instance_type" {
  description = "REQUIRED: The AWS instance type for the Customer Edge"
  type        = string
  default     = "t3.xlarge"
}

variable "instance_disk_size" {
  description = "OPTIONAL: The AWS disk size for the Customer Edge"
  type        = string
  default     = "40"
}
variable "sitelatitude" {
  description = "REQUIRED: Site Physical Location Latitude. See https://www.latlong.net/"
  type        = string
}
variable "sitelongitude" {
  description = "REQUIRED: Site Physical Location Longitude. See https://www.latlong.net/"
  type        = string
}
variable "clustername" {
  description = "REQUIRED: Customer Edge site cluster name."
  type        = string
}
variable "sitetoken" {
  description = "REQUIRED: Distributed Cloud Customer Edge site registration token."
  type        = string
  sensitive   = true
}

variable "url" {}
variable "api_p12_file" {}
variable "api_cert" {}
variable "api_key" {}
