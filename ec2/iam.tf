data "aws_iam_policy_document" "r_instanceAssumeRole_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "r_instance_role" {
  name               = local.ec2_instance_role_name
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.r_instanceAssumeRole_policy.json
}

resource "aws_iam_role_policy_attachment" "r_instanceRole_attachment" {
    for_each = toset(["arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforAWSCodeDeploy", "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"] )
    role = aws_iam_role.r_instance_role.name
    policy_arn =  each.value
}

# Create iam instance profile
resource "aws_iam_instance_profile" "r_iam_instance_profile" {
  name = "SSM-instance-profile"
  role = aws_iam_role.r_instance_role.name
}