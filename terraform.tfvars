# AWS region
aws_region = "eu-west-1"

# AMI ID for Amazon Linux 2 (update per region)
ami_id = "ami-0c39dd9b259ec4b27"

# EC2 instance types
bastion_instance_type = "t3.micro"
web_instance_type     = "t3.micro"
db_instance_type      = "t3.small"

# EC2 key pair name 
key_pair_name = "Adejare"

# Your IP address in CIDR format for Bastion SSH
my_ip_cidr = "102.89.45.136/32"