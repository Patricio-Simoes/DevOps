# Dev Environment

This repository contains a Terraform mini project that provisions a simple, publicly accessible development environment on AWS.

<div align="center">
    <img src="./assets/Scenario.png" alt="Architecture Diagram">
</div>

## Architecture breakdown

The environment is designed with a minimal and clean AWS setup suitable for development or testing workloads.

- A **VPC** that provides an isolated virtual network for resources;
- A **public subnet** that hosts the public-facing web server;
- An **internet gateway** (IGW) that enables outbound and inbound internet connectivity;
- A **public route table** that routes external traffic through the IGW;
- An **EC2 Instance** that acts as a simple web server secured by a **security group** allowing inbound and outbound HTTP traffic.

Together, these resources form a lightweight, public-facing web server environment deployed on AWS.

## Deploying the infrastructure

This project uses Terraform for infrastructure as code (IaC).

You can deploy the environment manually or via the included automated CI/CD workflow.

After applying, Terraform will output the public IP address of your EC2 instance open it in a browser to verify if the web server is running.

### Pre-requisites

1. Terraform installed (v1.5+ recommended);
2. AWS account with programmatic access (IAM credentials or role);
3. (Optional) GitHub Actions or another CI/CD tool configured with your AWS credentials.

### Manual deployment

```bash
# Initialize Terraform
terraform init
# Review the plan
terraform plan
# Apply the configuration
terraform apply
```

### CI/CD Automation

This project includes a CI/CD component that automates Terraform deployment. (Check the .github folder on the root of this repository).

The pipeline authenticates with AWS using a configured IAM credentials pair and runs Terraform commands to validate, plan, and apply changes automatically.

### Cleanup

To avoid incurring charges:

```bash
terraform destroy
```