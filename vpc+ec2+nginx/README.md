# Terraform AWS VPC + EC2 + Nginx

## Overview

This project uses Terraform to provision AWS infrastructure consisting of:

* Custom VPC
* Public Subnet
* Internet Gateway
* Route Table and Route Table Association
* Security Group
* EC2 Instance
* Automated Nginx Installation using User Data

The EC2 instance is launched inside the public subnet and is accessible via HTTP (Port 80) and SSH (Port 22).

---

## Architecture

```text
Internet
    |
Internet Gateway
    |
Public Route Table
    |
Public Subnet
    |
EC2 Instance
    |
Nginx Web Server
```

---

## Project Structure

```text
.
├── providers.tf
├── resources.tf
├── security_groups.tf
├── outputs.tf
├── userdata.sh
├── terraform.tfstate
├── terraform.tfstate.backup
└── README.md
```

### File Description

| File               | Description                                                   |
| ------------------ | ------------------------------------------------------------- |
| providers.tf       | AWS provider configuration                                    |
| resources.tf       | VPC, subnet, route table, internet gateway, and EC2 resources |
| security_groups.tf | Security group rules                                          |
| outputs.tf         | Output values such as public IP                               |
| userdata.sh        | Bootstrap script that installs and starts Nginx               |

---

## Prerequisites

Before running this project, ensure you have:

* AWS Account
* AWS CLI configured
* Terraform installed
* IAM user with required permissions

Verify installation:

```bash
terraform --version
aws --version
```

---

## Deployment Steps

### 1. Clone Repository

```bash
git clone <repository-url>
cd terraform/vpc+ec2+nginx
```

### 2. Initialize Terraform

```bash
terraform init
```

### 3. Review Execution Plan

```bash
terraform plan
```

### 4. Deploy Infrastructure

```bash
terraform apply
```

Type:

```text
yes
```

when prompted.

---

## Verify Deployment

Check the outputs:

```bash
terraform output
```

Copy the EC2 Public IP and access:

```text
http://<EC2_PUBLIC_IP>
```

You should see the default Nginx welcome page.

---

## Security Group Rules

| Port | Protocol | Purpose                 |
| ---- | -------- | ----------------------- |
| 22   | TCP      | SSH Access              |
| 80   | TCP      | HTTP Access             |
| 443  | TCP      | HTTPS Access (Optional) |

---

## User Data Script

The EC2 instance executes `userdata.sh` during launch to:

* Update system packages
* Install Nginx
* Enable Nginx service
* Start Nginx automatically

---

## Useful Terraform Commands

### View Current Resources

```bash
terraform state list
```

### Show Outputs

```bash
terraform output
```

### Destroy Infrastructure

```bash
terraform destroy
```

---

## Learning Objectives

This project demonstrates:

* Infrastructure as Code (IaC)
* AWS Networking Fundamentals
* VPC and Subnet Configuration
* Security Group Management
* EC2 Provisioning
* Automated Server Configuration using User Data
* Terraform State Management

---

## Author

Anshu Varshney

AWS | DevOps | Terraform | Cloud Infrastructure
