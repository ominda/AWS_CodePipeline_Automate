locals {
  base_name = "${var.default_tags["project"]}-${var.default_tags["environment"]}"
  codePipeline_role_name = "${var.default_tags["project"]}-${var.default_tags["environment"]}-CodePipelineRole"
  codePipeline_s3_name = lower("${var.default_tags["project"]}-${var.default_tags["environment"]}-pipeline-")
  codePipelinePolicy_name = "${var.default_tags["project"]}-${var.default_tags["environment"]}-CodePipelinePolicy"
  source_object_name = "SampleApp_Linux.zip"
}