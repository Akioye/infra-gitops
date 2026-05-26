terraform {
  backend "s3" {
    bucket         = "gitops-terraform-state-akioye"
    key            = "gitops/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}