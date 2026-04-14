terraform {
  backend "s3" {
    bucket         = "tfstate-multi-cloud-infra-cicd"
    key            = "aws/infra-cicd-demo.tfstate"
    region         = "us-west-2"
    dynamodb_table = "terraform-state-locks"
    encrypt        = true
  }
}
``