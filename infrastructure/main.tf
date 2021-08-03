terraform {
  backend "s3" {
    bucket = "app-platform-tf-state-5419146949647918"
    key    = "terraform.tfstate"
    region = "eu-west-1"
  }
}
