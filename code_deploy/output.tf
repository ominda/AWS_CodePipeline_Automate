output "o_codeDeployApplication" {
    value = aws_codedeploy_app.r_codeDeployApplication.name
}

output "o_codeDeployGroup_staging" {
    value = aws_codedeploy_deployment_group.r_codeDeploymentGroup_staging.deployment_group_name  
}

output "o_codeDeployGroup_production" {
    value = aws_codedeploy_deployment_group.r_codeDeploymentGroup_production.deployment_group_name
}