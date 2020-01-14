terraform {
  backend "s3" {
    bucket = "glg-terraform-playground"
    key    = "mike-terraform-testing"
    region = "us-east-1"
  }
}