# -------------------------
# AWS Region
# -------------------------
variable "aws_region" {
  description = "AWS region to deploy resources in"
  type        = string
  default     = "eu-west-1"
}

# -------------------------
# AMI ID
# -------------------------
variable "ami_id" {
  description = "AMI ID for EC2 instances (Amazon Linux 2)"
  type        = string
  default     = "ami-0c39dd9b259ec4b27"
}

# -------------------------
# EC2 Instance Types
# -------------------------
variable "bastion_instance_type" {
  description = "Instance type for bastion host"
  type        = string
  default     = "t3.micro"
}

variable "web_instance_type" {
  description = "Instance type for web servers"
  type        = string
  default     = "t3.micro"
}

variable "db_instance_type" {
  description = "Instance type for DB server"
  type        = string
  default     = "t3.small"
}

# -------------------------
# Key Pair Name
# -------------------------
variable "key_pair_name" {
  description = "EC2 Key pair name for SSH access"
  type        = string
}

# -------------------------
# Your IP Address for Bastion SSH
# -------------------------
variable "my_ip_cidr" {
  description = "Your IP in CIDR format for Bastion SSH access"
  type        = string
}