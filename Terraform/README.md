---
Date: 2025-10-25
Technology: Terraform
tags:
  - DevOps
  - IaC
---
# Terraform

Terraform is a **IaC (Infrastructure as Code) tool**, developed by HashiCorp that can be used to build, change, and **manage infrastructure** by defining resource configurations that can be versioned, reused, and shared.

<div align="center">
  <img src="../Assets/Images/Logos/Terraform.png" alt="Terraform" width="200" height="200"/>
</div>


**Key Principles:**

- **Declarative**: You describe the desired state, Terraform figures out how to achieve it
- **Idempotent**: Running the same configuration multiple times produces the same result
- **State-based**: Terraform tracks infrastructure state to determine changes
- **Provider-agnostic**: Works with multiple cloud providers and services

Terraform is available for Linux, MacOS and Windows.

See the [official Hashicorp documentation](https://developer.hashicorp.com/terraform/install) for detailed install instructions.

## Notes
 
- [00. Best Practices](./00.%20Best%20Practices.md)
- [01. State file](01.%20State%20file.md)
- [02. Providers](02.%20Providers.md)
- [03. Block Types](03.%20Block%20Types.md)
- [04. Variable Types](04.%20Variable%20Types.md)
- [05. Terraform Commands](05.%20Terraform%20Commands.md)

## Projects

- [(AWS) Small Dev Environment](./Projects/Dev-Environment)