locals {
  base_name = "${var.default_tags["project"]}-${var.default_tags["environment"]}"
  stagingDeploymentGroup_name = "${var.default_tags["project"]}-${var.default_tags["environment"]}-Staging"
  productionDeploymentGroup_name = "${var.default_tags["project"]}-${var.default_tags["environment"]}-Production"
  codeDeploy_role_name = "${var.default_tags["project"]}-${var.default_tags["environment"]}-CodeDeployRole"
}