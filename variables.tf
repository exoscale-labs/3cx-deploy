variable "zone" {
  type    = string
  default = "de-fra-1"
}

variable "instance_type" {
  type    = string
  default = "standard.medium"
}

variable "nbr" {
  description = "Number of instances"
  type        = number
  default     = 2
}

variable "ssh_key" {
  type    = string
  default = "ssh-key"
}

variable "operatorfirstname" {
  type    = string
  default = "operatorfirstname"
}

variable "adminpassword" {
}
