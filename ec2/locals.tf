locals {
  base_name = "${var.default_tags["project"]}-${var.default_tags["environment"]}"
  ec2_instance_role_name = "${var.default_tags["project"]}-${var.default_tags["environment"]}-InstanceRole"
}