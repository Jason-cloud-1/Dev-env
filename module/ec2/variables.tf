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



variable "ssh-key-pair-name" {
  type        = string
  description = "Name of an SSH key pair to use for login to bastion VM"
}

variable "ssh-private-key" {
  type        = string
  description = "Private key to use for login to bastion VM"
}
variable "ingress_ports" {
  type    = list(any)
  default = [80, 22, 433, 8080, 8282]
}

variable "instance_type" {
  type        = string
  description = "The instance type to use for running the database. See AWS homepage for available types"

}

