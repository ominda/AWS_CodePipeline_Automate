module "m_vpc" {
    source = "./vpc"
    default_tags =   var.v_default_tags
    cidr_block = var.v_main_cidr
    public_subnets = var.v_subnets["public_subnets"]

}

module "m_s3" {
    source = "./s3"
    default_tags = var.v_default_tags
}

module "m_ec2" {
    source = "./ec2"  
    vpc_id = module.m_vpc.o_vpc.id
    default_tags = var.v_default_tags
    public_ec2_count = var.v_public_ec2_count
    ssh_key = var.v_ssh_key_pair
    public_ip = var.v_associate_public_ip
    public_subnets = module.m_vpc.o_public_subnet_ids
    region = var.v_default_region
}

module "m_codeDeploy" {
    source = "./code_deploy"
    default_tags = var.v_default_tags
}

module "m_codePipeline" {
    source = "./code_pipeline"
    default_tags = var.v_default_tags
    source_bucket = module.m_s3.o_s3_source_bucket
    code_deploy_app = module.m_codeDeploy.o_codeDeployApplication
    code_deploy_group = module.m_codeDeploy.o_codeDeployGroup
}

    
