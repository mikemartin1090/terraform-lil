terraform {
  backend "s3" {
    # Replace this with your bucket name!
    bucket         = "glg-terraform-playground-state-mmartin"
    key            = "global/s3/terraform.tfstate"
    region         = "us-east-2"

    # Replace this with your DynamoDB table name!
    dynamodb_table = "glg-terraform-playground-state-mmartin"
    encrypt        = true
  }
}