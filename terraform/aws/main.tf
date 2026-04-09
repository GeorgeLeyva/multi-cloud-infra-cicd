# Placeholder configuration for CI/CD validation and planning.
# No resources are deployed by this configuration.

locals {
  naming_prefix = "cicd-${var.environment}"
}


resource "aws_security_group" "core" {
  name        = "${local.naming_prefix}-sg"
  description = "Plan-only security group for CI/CD validation"

  ingress {
    description = "HTTPS only"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Environment = var.environment
    Owner       = "infra-team"
    ManagedBy   = "terraform"
  }
}
