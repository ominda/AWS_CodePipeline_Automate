data "aws_iam_policy_document" "r_codeDeploy_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["codedeploy.amazonaws.com"]
    }
  }
}


resource "aws_iam_role" "r_codeDeploy_role" {
  name               = local.codeDeploy_role_name
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.r_codeDeploy_policy.json
}


resource "aws_iam_role_policy_attachment" "r_codeDeployRole_attachment" {
    role = aws_iam_role.r_codeDeploy_role.name
    policy_arn =  "arn:aws:iam::aws:policy/service-role/AWSCodeDeployRole"
}
