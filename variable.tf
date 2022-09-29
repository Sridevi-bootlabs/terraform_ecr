variable "name" {
  description = "Name of the repository"
  type        = string
}
variable "image_tag_mutability" {
  description = "The tag mutability setting for the repository"
  type        = string
}
variable "scan_on_push" {
  description = "Indicates whether images are scanned after being pushed to the repository (true) or not scanned (false)"
  type        = bool
}