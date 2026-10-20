# Azure Storage Container — Terraform

[![Azure](https://img.shields.io/badge/Azure-Cloud%20Infrastructure-0078D4?logo=microsoftazure&logoColor=white)](https://www.google.com/search?q=Microsoft+Azure+Cloud+Infrastructure)  [![Terraform](https://img.shields.io/badge/Terraform-Infrastructure%20as%20Code-7B42BC?logo=terraform&logoColor=white)](https://www.google.com/search?q=Terraform+Infrastructure+as+Code)  [![GitHub](https://img.shields.io/badge/Version%20Control-GitHub-181717?logo=github&logoColor=white)](https://www.google.com/search?q=GitHub+Version+Control)

## 📌 Project Overview

This repository contains Terraform configuration to create and manage **Azure Blob Storage Containers** using Infrastructure as Code (IaC).

The configuration uses Terraform data sources to retrieve information about existing Azure Storage Accounts and `for_each` to manage container resources dynamically.

This repository is part of a modular Azure infrastructure project for a Loan Management System.

## 🏗️ Architecture

The project uses separate Terraform repositories to manage Azure resources:

- Resource Group
- Storage Account
- Storage Container
- Blob Storage

Each repository manages a specific resource type, helping improve code reusability, maintainability, and organization.

## ☁️ Azure Configuration

| Property | Value |
|---|---|
| Cloud Provider | Microsoft Azure |
| Resource | Azure Blob Storage Container |
| Infrastructure as Code | Terraform |
| Resource Group | `rg-lms-idn-dev-01` |
| Storage Account | `stlmsidndev001` |
| Container Name | `loan-documents` |
| Access Level | Private |

*Verify these values against your actual Terraform configuration and Azure Portal.*

## 📂 Repository Structure

```text
terraform-azure-container/
├── main.tf
├── variables.tf
├── terraform.tfvars
├── provider.tf
├── .gitignore
└── README.md
```

*Adjust the file structure to match your actual repository.*

## ⚙️ Terraform Configuration

### 1. Data Block

A Terraform data source retrieves information about an existing Azure resource. It does not create the Storage Account.

Example:

```hcl
data "azurerm_storage_account" "storage_account" {
  for_each = var.containers

  name                = each.value.storage_account_name
  resource_group_name = each.value.resource_group_name
}
```

**Benefits:**

- Retrieves information about an existing Storage Account.
- Allows Terraform to reference an existing resource.
- Avoids recreating the Storage Account.

### 2. `for_each`

The `for_each` meta-argument allows Terraform to manage multiple containers using a map of configuration values.

Example:

```hcl
resource "azurerm_storage_container" "container" {
  for_each = var.containers

  name                  = each.value.name
  storage_account_id    = data.azurerm_storage_account.storage_account[each.key].id
  container_access_type = each.value.container_access_type
}
```

The data source and resource use matching keys to reference the correct Storage Account.

*These code examples are illustrative. Keep the arguments and variable names consistent with your actual Terraform files.*

## 🚀 Deployment Steps

### Step 1: Login to Azure

```powershell
az login
```

### Step 2: Initialize Terraform

```powershell
terraform init
```

### Step 3: Validate Configuration

```powershell
terraform validate
```

### Step 4: Review the Execution Plan

```powershell
terraform plan
```

### Step 5: Apply Configuration

```powershell
terraform apply
```

Review the proposed changes and approve the plan when prompted.

## 🔍 Verify Deployment in Azure Portal

1. Open the Azure Portal.
2. Navigate to **Storage accounts**.
3. Open the target Storage Account.
4. Select **Data storage → Containers**.
5. Verify that the expected container exists.
6. Confirm the container access level is set to **Private**.

## 🔐 Best Practices

- Use data sources to reference existing Azure resources.
- Use `for_each` to manage multiple containers efficiently.
- Keep containers private unless public access is required.
- Use variables instead of hardcoding configuration.
- Never commit credentials or secrets to GitHub.
- Review `terraform plan` before applying changes.
- Use a properly configured remote backend for shared Terraform state.

## 🎯 Key Learnings

- Creating Azure Blob Storage Containers using Terraform.
- Referencing existing resources through data sources.
- Managing multiple resources with `for_each`.
- Organizing Terraform code into separate repositories.
- Verifying Azure resources through the Azure Portal.

`Azure` `Terraform` `Blob Storage` `Storage Container` `Data Sources` `for_each` `IaC` `DevOps` `Automation`
