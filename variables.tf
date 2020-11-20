variable "name" {
  type = string
}

variable "save" {
  type = bool
  description = "Should this key be written to the disk?"
  default = false
}