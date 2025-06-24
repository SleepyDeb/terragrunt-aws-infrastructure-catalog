resource "aws_dynamodb_table" "table" {
  name         = "${var.deployment_name}-123-table"
  billing_mode = var.billing_mode
  hash_key     = var.hash_key
  attribute {
    name = var.hash_key
    type = var.hash_key_type
  }
}
