locals {
  source_s3_name = lower("${var.default_tags["project"]}-${var.default_tags["environment"]}-source-")
}