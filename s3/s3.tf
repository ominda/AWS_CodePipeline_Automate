resource "aws_s3_bucket" "r_source_s3" {
  bucket_prefix = local.source_s3_name
  force_destroy = true
}

resource "aws_s3_bucket_versioning" "r_source_s3_versioning" {
  bucket = aws_s3_bucket.r_source_s3.id
  versioning_configuration {
    status = "Enabled"
  }
}