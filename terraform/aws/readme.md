# AWS Terraform Configuration

This directory contains Terraform configuration used to support
CI/CD validation and governance workflows for AWS infrastructure.

The configuration is intentionally minimal and designed for
formatting, validation, and planning stages only.

Infrastructure provisioning is intentionally restricted.
Apply actions are gated or disabled to ensure all AWS infrastructure
changes are reviewed, validated, and approved prior to deployment.