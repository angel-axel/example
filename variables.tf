variable "filters" {
  type = string(map)
  default = {
    name = "al2023-ami-2023*"
  }
}

variable "allowed_instances" {
  type = list(string)
  default = ["t3.nano", "t3.small"]
}

variable "instance_type" {
  type = string

  validation {
    condition = contains(var.allowed_instances, var.instance_type)
    error_message = "Invalid instance type"
  }
}