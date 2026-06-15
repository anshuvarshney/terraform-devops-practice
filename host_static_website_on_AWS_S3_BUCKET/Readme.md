# Terraform S3 Static Website Deployment

This project uses Terraform to create an Amazon S3 bucket and upload static website files.

## Files

```text
.
├── main.tf
├── index.html
├── script.js
├── styles.css
└── README.md
```

## Resources Created

* S3 Bucket
* S3 Website Configuration (if configured)
* S3 Objects:

  * `index.html`
  * `script.js`
  * `styles.css`

## Prerequisites

* Terraform installed
* AWS CLI configured
* IAM user with permissions for:

  * S3 Bucket Management
  * S3 Object Upload
  * S3 Bucket Policy Management

Verify AWS authentication:

```bash
aws sts get-caller-identity
```

## Initialize Terraform

```bash
terraform init
```

## Validate Configuration

```bash
terraform validate
```

## Review Planned Changes

```bash
terraform plan
```

## Deploy Infrastructure

```bash
terraform apply
```

Type `yes` when prompted.

## Uploaded Files

The following files are uploaded to the S3 bucket:

| File       | Content Type           |
| ---------- | ---------------------- |
| index.html | text/html              |
| script.js  | application/javascript |
| styles.css | text/css               |

## Verify Uploaded Objects

```bash
aws s3 ls s3://<bucket-name>
```

## Destroy Infrastructure

To remove all created resources:

```bash
terraform destroy
```

## Notes

* Ensure S3 Block Public Access settings are configured appropriately if public website hosting is required.
* If cross-account access is needed, update the bucket policy accordingly.
* Using `etag = filemd5(...)` is recommended so Terraform detects file changes and re-uploads updated content automatically.

## Author

Managed using Terraform and AWS S3.
