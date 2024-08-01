provider "aws" {
  region = local.aws_region

  default_tags { # This specifies the basic owner tags to resources created by this project
    tags = {
      author   = local.author
      mail     = local.author_mail
      app_name = local.app_name
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"

  registry_auth {
    address  = "${data.aws_caller_identity.caller-identity.account_id}.dkr.ecr.${local.aws_region}.amazonaws.com"
    username = data.aws_ecr_authorization_token.ecr-authorization-token.user_name
    password = data.aws_ecr_authorization_token.ecr-authorization-token.password
  }
}
