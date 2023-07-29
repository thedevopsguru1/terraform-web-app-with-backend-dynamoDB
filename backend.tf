resource "aws_s3_bucket" "bucket" {
    bucket = "anaeleboo-terraform-state-backend"
 
    object_lock_enabled = true
    
    tags = {
        Name = "S3 Remote Terraform State Store"
    }
}

# Add version of the bucket

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

# Create Bucket Encryption
resource "aws_s3_bucket_server_side_encryption_configuration" "example" {
  bucket = aws_s3_bucket.bucket.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# Lock configuration
resource "aws_s3_bucket_object_lock_configuration" "example" {
  bucket = aws_s3_bucket.bucket.bucket

  rule {
    default_retention {
      mode = "COMPLIANCE"
      days = 5
    }
  }
}