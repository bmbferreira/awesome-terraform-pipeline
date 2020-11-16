variable "name" {
  description = "The name of the API"
  type        = string
  default = "Awesome store"
}

variable "description" {
  description = "The description of the API"
  type        = string
  default = "An awesome store serverless API Gateway"
}

variable "protocol_type" {
  description = "The protocol of the API"
  type        = string
  default = "HTTP"
}
