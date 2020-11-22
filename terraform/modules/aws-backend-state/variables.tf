variable "bucket_name" {
  description = "The name of the bucket to save the state"
  type        = string
}

variable "dynamodb_table_name" {
  description = "The name of the dynamodb table to handle locks"
  type        = string
}
