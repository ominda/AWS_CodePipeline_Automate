resource "aws_codedeploy_app" "r_codeDeployApplication" {
  compute_platform = "Server"
  name             = local.base_name
}

resource "aws_codedeploy_deployment_group" "r_codeDeploymentGroup_staging" {
  app_name              = aws_codedeploy_app.r_codeDeployApplication.name
  deployment_group_name = local.stagingDeploymentGroup_name
  service_role_arn      = aws_iam_role.r_codeDeploy_role.arn

  ec2_tag_set {
    ec2_tag_filter {
      key   = "Name"
      type  = "KEY_AND_VALUE"
      value = "${local.base_name}-Staging-01"
    }

    ec2_tag_filter {
      key   = "Name"
      type  = "KEY_AND_VALUE"
      value = "${local.base_name}-Staging-02"
    }

  }

  ## Load Balancer configuration
  # deployment_style {
  #   deployment_option = "WITHOUT_TRAFFIC_CONTROL"
  #   deployment_type   = "IN_PLACE"
  # }

  # trigger_configuration {
  #   trigger_events     = ["DeploymentFailure"]
  #   trigger_name       = "example-trigger"
  #   trigger_target_arn = aws_sns_topic.example.arn
  # }

  auto_rollback_configuration {
    enabled = true
    events  = ["DEPLOYMENT_FAILURE"]
  }

#   alarm_configuration {
#     alarms  = ["my-alarm-name"]
#     enabled = true
#   }

  outdated_instances_strategy = "UPDATE"
}

resource "aws_codedeploy_deployment_group" "r_codeDeploymentGroup_production" {
  app_name              = aws_codedeploy_app.r_codeDeployApplication.name
  deployment_group_name = local.productionDeploymentGroup_name
  service_role_arn      = aws_iam_role.r_codeDeploy_role.arn

  ec2_tag_set {

    ec2_tag_filter {
      key   = "Name"
      type  = "KEY_AND_VALUE"
      value = "${local.base_name}-Production-01"
    }

    ec2_tag_filter {
      key   = "Name"
      type  = "KEY_AND_VALUE"
      value = "${local.base_name}-Production-02"
    }
  }

  auto_rollback_configuration {
    enabled = true
    events  = ["DEPLOYMENT_FAILURE"]
  }

  outdated_instances_strategy = "UPDATE"
}