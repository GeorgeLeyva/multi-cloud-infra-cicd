# Azure Terraform Configuration

This directory contains Terraform configuration used to support
CI/CD validation and governance workflows for Azure infrastructure.

The configuration is intentionally minimal and designed for
formatting, validation, and planning stages only.

Infrastructure provisioning is intentionally restricted.
Apply actions are gated or disabled to ensure all Azure infrastructure
changes are reviewed, validated, and approved prior to deployment.