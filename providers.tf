terraform {
  backend "s3" {
     bucket         = "anaeleboo-terraform-state-backend"
     key            = "terraform.tfstate"
     region         = "us-east-2"
     dynamodb_table = "terraform_state"
   }
  required_providers {
    
    aws = {
      source = "hashicorp/aws"
      version = "~> 4.54.0"
    }
  }
}
provider "aws" {
    region  = "us-east-2"
}