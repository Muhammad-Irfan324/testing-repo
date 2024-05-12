terraform {
  backend "s3" {
    bucket         = "remote-backend-state-file-with-encryption"
    key            = "tf-state/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform_dynamo_table_locking"
    encrypt        = true
  }
}