variable "v_default_tags" {
    type = map(string)  
}

variable "v_default_region" {
    type = string
    default = "ap-southeast-1"  
}

variable "v_main_cidr" {
    type = string
    default = "10.0.0.0/16"  
}

# Public subnets
variable "v_subnets" {
  type = map(list(string))
}

variable "v_staging_ec2_count" {
    type = number  
}

variable "v_production_ec2_count" {
  type = number 
}

variable "v_ssh_key_pair" {
    type = string  
}

variable "v_associate_public_ip" {
    type = bool  
}