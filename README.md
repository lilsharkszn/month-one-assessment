🚀 TechCorp Infrastructure

Terraform-based infrastructure for deploying a secure, scalable, and highly available web application on AWS.

This project demonstrates a production-style multi-tier architecture with proper network isolation, controlled access, and modular infrastructure design.

---

🏗️ Architecture Overview

The infrastructure is designed using a 3-tier architecture:

- Networking Layer
  
  - Custom VPC with CIDR block
  - Public and private subnets across multiple Availability Zones
  - Internet Gateway and NAT Gateway

- Access Layer
  
  - Bastion Host for secure SSH access to private resources

- Application Layer
  
  - Web servers (Apache) deployed in private subnets
  - Application Load Balancer (ALB) distributing traffic

- Data Layer
  
  - PostgreSQL database hosted in a private subnet (no public access)

---

🔐 Security Design

- SSH access restricted using IP-based CIDR whitelisting
- No direct public access to private instances
- Bastion host acts as a controlled entry point
- Database is isolated in private subnet
- Sensitive files are excluded via ".gitignore"

«⚠️ This project is for learning purposes. For production, secrets manager should be integrated (AWS SSM or Secrets Manager).»

---

📦 Infrastructure Components

Component| Description
VPC| Isolated AWS network
Subnets| Public + Private across 2 AZs
Bastion Host| Secure SSH access
Web Servers| Apache-based EC2 instances
Load Balancer| Application Load Balancer
Database| PostgreSQL instance
NAT Gateway| Outbound internet for private resources

---

⚙️ Prerequisites

- AWS account with appropriate IAM permissions
- Terraform ≥ 1.0 installed
- AWS CLI configured ("aws configure")
- Existing EC2 Key Pair in your AWS region

---

🛠️ Configuration

Create a "terraform.tfvars" file locally:

aws_region    = "eu-west-1"
key_pair_name = "your-keypair-name"
my_ip_cidr    = "YOUR_IP/32"

- Replace "YOUR_IP" with your public IP address
- Use "/32" to restrict access to your IP only

«⚠️ This file is not committed to version control.»

---

🚀 Deployment

terraform init
terraform validate
terraform plan
terraform apply

---

🌐 Access

After deployment, Terraform outputs will provide:

- Web Application URL
  
  http://<alb_dns_name>

- Bastion Host Access
  
  ssh -i /path/to/key.pem ec2-user@<bastion_public_ip>

---

🔑 Accessing Private Instances

From the bastion host:

ssh -i /path/to/key.pem ec2-user@<private-ip>

---

🗄️ Database

Database credentials are not stored in this repository.

They should be managed securely using:

- environment variables
- ".tfvars" (local only)
- or a secrets manager (recommended)

---

🧹 Cleanup

To destroy all infrastructure:

terraform destroy

---

💰 Cost Considerations

This setup provisions billable AWS resources:

- EC2 instances
- NAT Gateway (hourly + data charges)
- Application Load Balancer

«Use the AWS Pricing Calculator to estimate costs before deployment.»

---

📁 Project Structure

.
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars 
├── user_data/
│   └── db_server_setup.sh
└── README.md

---

📌 Future Improvements

- Auto Scaling Group for web tier
- HTTPS with ACM and ALB
- Remote backend (S3 + DynamoDB)
- CI/CD pipeline (GitHub Actions)
- Secrets management (SSM / Secrets Manager)
- Monitoring (CloudWatch, Prometheus, Grafana)

---

👨‍💻 Author - **Adejare Hassan**
https://linkedin.com/in/jare

Built as part of a Cloud/DevOps engineering learning project, focused on real-world infrastructure design and best practices.

---
