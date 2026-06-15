# Terraform AWS VPC Infrastructure

## Overview

This project provisions a basic AWS networking infrastructure using Terraform. The infrastructure includes:

* Custom VPC
* Public Subnet
* Private Subnet
* Internet Gateway
* Route Table
* Route Table Association
* EC2 Instance deployed in the Public Subnet

This project was created as part of my Terraform learning journey to understand Infrastructure as Code (IaC) and AWS networking fundamentals.

---

## Architecture

```text
Internet
    |
    |
Internet Gateway
    |
    |
+----------------------+
|      AWS VPC         |
|    10.0.0.0/16       |
|                      |
|  Public Subnet       |
|  10.0.2.0/24         |
|       |              |
|       |              |
|      EC2             |
|                      |
|  Private Subnet      |
|  10.0.1.0/24         |
|                      |
+----------------------+
```

---

## Resources Created

### VPC

| Resource   | Value       |
| ---------- | ----------- |
| CIDR Block | 10.0.0.0/16 |

### Subnets

| Subnet         | CIDR        |
| -------------- | ----------- |
| Public Subnet  | 10.0.2.0/24 |
| Private Subnet | 10.0.1.0/24 |

### Internet Gateway

Provides internet access to resources located in the public subnet.

### Route Table

Configured with:

```text
Destination: 0.0.0.0/0
Target: Internet Gateway
```

### EC2 Instance

| Property      | Value         |
| ------------- | ------------- |
| Instance Type | t3.micro      |
| AMI           | Ubuntu        |
| Subnet        | Public Subnet |

---

## Prerequisites

Before deploying this project, ensure you have:

* AWS Account
* IAM User with AdministratorAccess or required permissions
* Terraform Installed
* AWS CLI Installed
* AWS Credentials Configured

Verify installation:

```bash
terraform --version
aws --version
```

Configure AWS credentials:

```bash
aws configure
```

---

## Deployment Steps

### Clone Repository

```bash
git clone <repository-url>
cd terraform-vpc-project
```

### Initialize Terraform

```bash
terraform init
```

### Validate Configuration

```bash
terraform validate
```

### Review Execution Plan

```bash
terraform plan
```

### Deploy Infrastructure

```bash
terraform apply
```

Type:

```text
yes
```

when prompted.

---

## Verify Resources

After deployment, verify:

### VPC

```bash
aws ec2 describe-vpcs
```

### Subnets

```bash
aws ec2 describe-subnets
```

### EC2 Instance

```bash
aws ec2 describe-instances
```

---

## Destroy Infrastructure

To avoid unnecessary AWS charges:

```bash
terraform destroy
```

Confirm by entering:

```text
yes
```

---

## Terraform Concepts Practiced

* Providers
* Resources
* Resource Dependencies
* VPC Creation
* Subnet Creation
* Internet Gateway
* Route Tables
* Route Table Associations
* EC2 Deployment
* Terraform State Management

---

## Author

Anshu Varshney

Learning DevOps, AWS, and Terraform through hands-on projects and real-world cloud infrastructure implementations.
