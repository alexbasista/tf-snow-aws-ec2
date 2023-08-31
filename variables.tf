variable "region" {
  type        = string
  description = "AWS region to create resources in."
  default     = "us-east-1"
}

variable "instance_type" {
  type        = string
  description = "Size of EC2 instance to create."
  default     = "t2.micro"
}

variable "ami_id" {
  type        = string
  description = "ID of AMI to use for EC2 instance."
  default     = null
}