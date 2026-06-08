terraform {
  backend "s3" {
    bucket       = "sre-stack-terraform-state"
    key          = "monitoring/terraform.tfstate"
    region       = "eu-west-1"
    encrypt      = true
    use_lockfile = true
  }
}
