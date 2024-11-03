output "o_codeDeployApplication" {
    value = aws_codedeploy_app.r_codeDeployApplication.name
}

output "o_codeDeployGroup" {
    value = aws_codedeploy_deployment_group.r_codeDeploymentGroup.app_name  
}