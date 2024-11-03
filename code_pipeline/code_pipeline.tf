resource "aws_codepipeline" "r_codePipeline" {
  name     = "${local.base_name}"
  role_arn = aws_iam_role.r_codePipeline_role.arn

  artifact_store {
    location = aws_s3_bucket.r_codePipeline_bucket.bucket
    type     = "S3"
  }

  stage {
    name = "Source"

    action {
      name             = "Source"
      category         = "Source"
      owner            = "AWS"
      provider         = "S3"
      version          = "1"
      output_artifacts = ["source_output"]

      configuration = {
        S3Bucket = var.source_bucket
        S3ObjectKey = local.source_object_name
        PollForSourceChanges = true #### >>>> Check CloudWatch Events, how to configure <<< ####
      }
    }
  }

  stage {
    name = "DeployStaging"

    action {
      name            = "Deploy"
      category        = "Deploy"
      owner           = "AWS"
      provider        = "CodeDeploy"
      input_artifacts = ["source_output"]
      version         = "1"

      configuration = {
        ApplicationName = var.code_deploy_app
        DeploymentGroupName = var.code_deploy_group_staging
      }
    }
  }

  # stage {
  #   name = "DeployProduction"

  #   action {
  #     name            = "DeployProduction"
  #     category        = "Deploy"
  #     owner           = "AWS"
  #     provider        = "CodeDeploy"
  #     input_artifacts = ["source_output"]
  #     version         = "1"

  #     configuration = {
  #       ApplicationName = var.code_deploy_app
  #       DeploymentGroupName = var.code_deploy_group_production
  #     }
  #   }
  # }

}

