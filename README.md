# AWS_CodePipeline_Automate
IaC AWS Code Pipeline

### Automate Full CI/CD workflow with terraform

#### Create a VPC Module
1. Create a VPC with "10.0.0.0/16" CIDR
2. Create public subnets
3. Create Rbt and update the routes
4. Create IGW

#### Create a S3
1. Create a S3 to hold the Source artifacts
2. Create a S3 to hold the Build/Deploy artifacts

#### Create a EC2
1. Create IAM instance policy and role
2. Create Security Group
3. Create EC2 instances

#### Create Pipeline Components
1. Create a CodeDeploy
    - Create IAM policy and role
    - Create CodeDeploy Application
    - Create CodeDeployment Group

2. Create CodePipeline
    - Create IAM policy and role
    - Create Source Stage
    - Create Deploy Stage