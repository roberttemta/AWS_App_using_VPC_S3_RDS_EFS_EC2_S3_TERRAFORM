
# Varaibles creation

variable "region" {
  default = "us-east-1"
}

variable "INSTANCE_TYPE" {
  default = "t2.micro"
}


variable "ENVIRONMENT" {
  default = "dev"
}

variable "Team" {
  default = "config management"
  
}

variable "vpc-name" {
  default = "utc-vpc"
}

variable "filename" {
  default = "utc-app_key.pem"
}

variable "key-name" {
  default = "utc_key"
}
variable "ami-bastion" {
  default = "ami-02c21308fed24a8ab"
}

variable "ami-app-servers" {
  default = "ami-02c21308fed24a8ab"
}
variable "bastion-host-server-name" {
  default = "Utc-bastion-host"
}

variable "server-name" {
  default = "utc-server"
}

variable "az" {
  description = "availability zones for the public subnets"
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
  type        = list(any)
}

variable "subnet_cidr_public" {
  description = "cidr blocks for the public subnets"
  default     = ["10.10.1.0/24", "10.10.2.0/24", "10.10.3.0/24"]
  type        = list(any)
}

variable "subnet_cidr_private" {
  description = "cidr blocks for the private subnets"
  default     = ["10.10.10.0/24", "10.10.20.0/24", "10.10.30.0/24", "10.10.40.0/24", "10.10.50.0/24", "10.10.60.0/24"]
  type        = list(any)
}

# route-53 variables
variable "domain_name" {
  description = "The domain I have in aws"
  default     = "temtagroup.com"
}
variable "record_name" {
  description = "The domain I have in aws"
  default     = "learning.temtagroup.com"
}

# DB variables
variable "db_name" {
  description = "The name of the Database in utc-vpc"
  default     = "utc-dev-database"
}

variable "db-username" {
  description = "The admin of DB name"
  default     = ""
  sensitive = true
  # How  do you manage sensitive data?
}
variable "db-password" {
  description = "The password of DB"
  default     = ""
  sensitive = true
  # How  do you manage sensitive data?
}

# S3 variables

variable "bucket-name" {
  default = "utc-vpc-bucket-backup1"
}

# IAM Variables

variable "iam-role-name" {
  default = "ec2_s3_access_role"
}

variable "ec2-s3-access-policy-name" {
  default = "s3_access_policy"
}