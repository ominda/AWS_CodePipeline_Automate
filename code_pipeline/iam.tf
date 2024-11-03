
data "aws_iam_policy_document" "d_codePipeline_assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["codepipeline.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "r_codePipeline_role" {
  name               = local.codePipeline_role_name
  assume_role_policy = data.aws_iam_policy_document.d_codePipeline_assume_role.json
}

data "aws_iam_policy_document" "d_codePipeline_policyDocument" {
  statement {
    effect = "Allow"

    actions = [
      "S3:*",
      # "s3:GetObject",
      # "s3:GetObjectVersion",
      # "s3:GetBucketVersioning",
      # "s3:PutObjectAcl",
      # "s3:PutObject",
    ]

    resources = [
      "*"
      # aws_s3_bucket.r_codePipeline_bucket.arn,
      # "${aws_s3_bucket.r_codePipeline_bucket.arn}/*"
    ]
  }

  # statement {
  #   effect    = "Allow"
  #   actions   = ["codestar-connections:UseConnection"]
  #   resources = [aws_codestarconnections_connection.example.arn]
  # }

  statement {
    effect = "Allow"

    actions = [
      "codebuild:BatchGetBuilds",
      "codebuild:StartBuild",
    ]

    resources = ["*"]
  }

  statement {
    effect = "Allow"

    actions = [
      "codedeploy:*",
    ]

    resources = ["*"]
  }

}

resource "aws_iam_policy" "r_codePileline_policy" {
  name = local.codePipelinePolicy_name
  policy = data.aws_iam_policy_document.d_codePipeline_policyDocument.json
}

resource "aws_iam_role_policy_attachment" "r_codePipelineRole_attachment" {
  role   = aws_iam_role.r_codePipeline_role.id
  policy_arn = aws_iam_policy.r_codePileline_policy.arn
}
