# AWS_CodePipeline_Automate
IaC AWS Code Pipeline

### Automate Full CI/CD workflow with terraform

### Steps
- Download sample code from https://docs.aws.amazon.com/codepipeline/latest/userguide/samples/SampleApp_Linux.zip
- Upload the code to the source S3 bucket 
    - It should trigger the CodePipeline and deploy the code to the EC2 servers
- Grab a public IP of a server and past it into address bar. Only http is working, this should show a sample message.

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
        - ***Broder permission granted on S3. need to restrict the permission***
    - Create Source Stage
        - ***Need to update the code to trigger by CloudWatch event***
    - Create Deploy Stage