locals {
  base_name = "${var.default_tags["project"]}-${var.default_tags["environment"]}"
  codeDeploy_role_name = "${var.default_tags["project"]}-${var.default_tags["environment"]}-CodeDeployRole"
}