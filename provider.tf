terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.73.0"
    }
  }
}

provider "aws" {
    region = var.v_default_region
    default_tags {
      tags = {
        ProjectName = var.v_default_tags["project"]
        Environment = var.v_default_tags["environment"]
        Owner       = var.v_default_tags["owner"]
        Identifier  = var.v_default_tags["identifier"]
      }
    }
  # Configuration options
}