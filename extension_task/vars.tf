
# variable "example" {
#   default = {
#     "username" = var.username
#     "password" = var.password
#   }
#   sensitive = true
#   type      = map(string)
# }
variable "username" {
  description = "username"
  type        = string
  sensitive   = true
}
variable "password" {
  description = "username"
  type        = string
  sensitive   = true
}
