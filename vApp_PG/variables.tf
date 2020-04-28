variable "vcd_user" {
  type = string
}
variable "vcd_pass" {
  type = string
}

variable "org" {
  default = "193331498"
}
variable "vdc" {
  default = "193331498_001"
}
variable "url" {
  default = "https://vmw.a1.by/api"
}

variable "template_folder" {
  default = "templates"
}