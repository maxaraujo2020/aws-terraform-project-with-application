terraform {
  backend "s3" {
    bucket = "infoot-tfstate-dev"
    key    = "tfstate"
    region = "eu-west-1"
  }
}
