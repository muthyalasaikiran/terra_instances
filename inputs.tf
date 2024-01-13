
variable "vpc_cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = "this is cidr range for vpc" # for dynamic nature creating variables this inputs file
}
