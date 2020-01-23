# define variables to be used in multiple spots
variable "server_port" {
  description = "The port the server will use for HTTP requests"
  type        = number
  default     = 8080
}