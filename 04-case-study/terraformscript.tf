# aws environment connection
provider "aws" {
  region = var.AWS_REGION
  shared_credentials_file  = "~/.aws/credentials"
  profile = "default"
}

# provision a default vpc and a fully functional private subnet
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "default-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Default = "Main"
  }
}

# deploy an ubuntu instance in the subnet
resource "aws_instance" "example" {

  # the ami id
  ami           = "ami-0a8e758f5e873d1c1"
  # the instance type
  instance_type = "t2.micro"
  # the VPC subnet
  subnet_id = element(module.vpc.private_subnets, 0)
  # the security group
  security_groups = [security_group_id]
  # the public SSH key
  key_name = "key_pair_name"
}