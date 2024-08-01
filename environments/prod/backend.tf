terraform {
  backend "s3" {
    bucket = "medicosmundo-poc-tfstate-prod"
    key    = "tfstate"
    region = "eu-west-1"
  }
}
