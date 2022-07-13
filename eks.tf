module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "~> 18.0"
  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version

  subnet_ids = ["subnet-0fa1b7194074f7e03", "subnet-0dd0d3f2d1f3acdd3", "subnet-0eb1ab00216051a9e"]

  cluster_endpoint_public_access  = false
  cluster_endpoint_private_access = true

  tags = {
    Environment = var.env
    GithubRepo  = "terraform-aws-eks"
    GithubOrg   = "terraform-aws-modules"
  }

  vpc_id = var.vpc_id
  # subnet_ids = module.vpc.private_subnets

  self_managed_node_group_defaults = {
    instance_type                          = "t3.small"
    update_launch_template_default_version = true
    iam_role_additional_policies = [
      "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
    ]
  }
}

