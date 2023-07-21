terraform
# Define the required variables
variable "enable_s3_bucket" {
  description = "Enable creation of S3 bucket"
  type        = bool
  default     = true
}

variable "s3_bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
  default     = "my-s3-bucket"
}

variable "s3_bucket_prefix" {
  description = "Prefix for the S3 bucket name"
  type        = string
  default     = null
}

variable "s3_bucket_force_destroy" {
  description = "Enable forceful deletion of S3 bucket"
  type        = bool
  default     = false
}

variable "s3_bucket_object_lock_enabled" {
  description = "Enable object lock for S3 bucket"
  type        = bool
  default     = false
}

variable "tags" {
  description = "Additional tags for the S3 bucket"
  type        = map(string)
  default     = {}
}

# Import the S3 bucket module
module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  enable_s3_bucket             = var.enable_s3_bucket
  s3_bucket_name               = var.s3_bucket_name
  s3_bucket_prefix             = var.s3_bucket_prefix
  s3_bucket_force_destroy      = var.s3_bucket_force_destroy
  s3_bucket_object_lock_enabled = var.s3_bucket_object_lock_enabled
  tags                         = var.tags
}


shell
terraform init


shell
terraform plan


shell
terraform apply
