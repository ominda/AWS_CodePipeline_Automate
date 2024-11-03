resource "aws_s3_bucket" "r_codePipeline_bucket" {
  bucket_prefix = local.codePipeline_s3_name
  force_destroy = true
}
