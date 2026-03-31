# TechCorp Infrastructure

Terraform configuration to deploy a scalable web application infrastructure on AWS with a bastion host, load-balanced web servers, and a PostgreSQL database.

## What Gets Deployed

- **VPC** with public and private subnets across 2 availability zones
- **Bastion host** for secure SSH access to private instances
- **2x Web servers** (Apache) behind an Application Load Balancer in public subnets
- **PostgreSQL database** in a private subnet
- **NAT Gateway** for outbound internet access from private instances

## Prerequisites

- AWS account and credentials configured locally
- Terraform >= 1.0
- An EC2 Key Pair in your AWS region (specified in vars)

## Configuration

1. Copy the example config:
```bash
cp terraform.tfvars.example terraform.tfvars
```

2. Edit `terraform.tfvars` with your values:
```hcl
aws_region            = "eu-west-1"  # Change as needed
key_pair_name         = "your-key-pair-name"
my_ip_cidr            = "YOUR_IP/32"  # Your public IP for bastion access
```

> Use `/32` for a single IP address; use `/24` for a /24 subnet, etc.

3. Verify the AMI ID for your region (Amazon Linux 2):
```bash
aws ec2 describe-images --owners amazon --filters "Name=name,Values=amzn2-ami-hvm-*-x86_64-gp2" --region eu-west-1 --query 'Images | sort_by(@, &CreationDate) | [-1].[ImageId]'
```

## Deploy

```bash
terraform init
terraform plan
terraform apply
```

## Access

After deployment, outputs will show:

- **Web App**: `http://<alb_dns_name>` (from `alb_dns_name` output)
- **Bastion Host**: SSH via the elastic IP (from `bastion_public_ip` output)

### SSH into instances:

```bash
# Access bastion
ssh -i /path/to/key.pem ec2-user@<bastion_public_ip>

# From bastion, access web/db servers on private IPs
ssh -i /path/to/key.pem ec2-user@10.0.3.10  # example private IP
```

## Database

PostgreSQL is pre-configured with:
- **User**: techcorp
- **Password**: Tech1234
- **Database**: techcorp_db

Change these credentials in `user_data/db_server_setup.sh` before deploying to production.

## Cleanup

```bash
terraform destroy
```

## Cost

These t3 instances and NAT Gateway incur AWS charges. Estimate costs in the AWS pricing calculator before deploying.
