Multi‑Cloud Terraform CI/CD Governance Pipeline
This repository demonstrates a governance‑first CI/CD pipeline for Terraform implemented in Azure DevOps, designed to validate and plan infrastructure changes across cloud environments without automatically applying them.
The pipeline emphasizes safety, predictability, and reviewability over speed, reflecting how infrastructure is managed in enterprise and regulated environments.

Project Goals

Enforce Terraform formatting and configuration correctness
Provide clear visibility into infrastructure changes via terraform plan
Prevent unreviewed or accidental infrastructure deployment
Demonstrate enterprise‑grade authentication and state management
Serve as a reusable CI/CD pattern for cloud infrastructure teams


Key Design Principles
✅ Validation First
All infrastructure changes must pass:

terraform fmt -check
terraform validate
terraform plan

No changes reach a deployment phase unless they first pass these gates.
✅ No Automatic Apply
This pipeline intentionally stops at the plan phase.
There is no terraform apply step by design.
This ensures:

Human review of proposed changes
Reduced blast radius
Audit‑friendly workflows
Alignment with change‑management practices

✅ Infrastructure as a Long‑Lived Product
The pipeline treats infrastructure as a platform, not a one‑off script.
Repeatability, clarity, and governance take priority over rapid mutation.

CI/CD Platform

Azure DevOps Pipelines (primary)
Uses a YAML‑defined pipeline
Executes Terraform via the Terraform CLI, not legacy pipeline tasks

Terraform runs inside an authenticated Azure CLI context provided by an Azure DevOps service connection, which avoids hard‑coded credentials and supports secure enterprise workflows.

Authentication Model

Uses an Azure DevOps service connection
Terraform is executed within an authenticated AzureCLI@2 task
No client secrets or storage keys are embedded in code or YAML
Authentication is handled centrally through Azure DevOps

This mirrors how Terraform is commonly run in real enterprise environments.

Terraform State Management

Terraform state is stored in an Azure Storage Account (Blob Storage)
State is centralized, remote, and shared
Backend configuration lives in Terraform code, not pipeline YAML

This ensures:

Consistent state handling across runs
Support for collaboration
Reduced risk of state corruption


Pipeline Overview
Stages:


Terraform Validate

Initialize backend
Enforce formatting
Validate configuration



Terraform Plan

Generate an execution plan
Publish the plan as a pipeline artifact



Outputs:

A published tfplan artifact for review
No infrastructure is modified


Repository Structure
.
├── azure-pipelines.yml        # Azure DevOps pipeline definition
├── terraform/
│   ├── azure/                 # Terraform configuration for Azure
│   └── aws/                   # Terraform configuration for AWS (pattern parity)
├── scripts/                   # Supporting documentation and notes
└── README.md


Supported Cloud Platforms

Microsoft Azure (primary implementation)
Amazon Web Services (AWS) (structure included for parity and extension)

The pipeline design is cloud‑agnostic and can be extended to additional providers.

Why This Approach Matters
In many environments, the biggest infrastructure risks come from:

Unreviewed changes
Credential sprawl
Implicit or invisible deployments

This project demonstrates how CI/CD can be used as a guardrail rather than a deployment accelerator — helping teams move deliberately while maintaining operational trust.

Real‑World Applicability
This pattern applies well to:

Enterprise infrastructure teams
Cloud platform and identity teams
Managed service providers (MSPs)
Regulated industries (finance, healthcare, government)
Organizations transitioning to Terraform‑based governance


Technologies Used

Terraform
Azure DevOps Pipelines
Azure CLI
Azure Resource Manager
Azure Blob Storage
Git‑based CI/CD workflows


Author
George Leyva
Senior Systems Engineer / Cloud Infrastructure Engineer