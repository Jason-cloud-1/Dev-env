variable "environment-prefix" {
  type        = string
  description = "A prefix to be prepended to every resource name"
  default     = "ec2"
}

variable "tags" {
  type        = map(string)
  description = "Tags to be attached to every resource"
  default     = {}
}
