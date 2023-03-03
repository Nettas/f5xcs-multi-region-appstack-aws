variable "environment" {
	default		= "sse-on-xc-in-aws"
	description = "Environment Name"
}

variable "aws_access_key" {
  description = "REQUIRED: AWS programatic access key"
  type        = string
}

variable "aws_secret_key" {
  description = "REQUIRED: AWS programatic secret key"
  type        = string
}

variable "aws_region" {
	description = "Region in which environment will be launched"
	type = string
	default = "us-east-2"
}

variable "aws_vpc_cidr" {
	type 		= string
	default 	= "10.0.0.0/16"
	description = "CIDR block of the vpc"
}
