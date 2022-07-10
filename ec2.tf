module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "sb-ec2-instance"

  ami                    = "ami-052efd3df9dad4825"
  instance_type          = "t2.small"
  key_name               = "tf_key_sandbox"
  monitoring             = false
  vpc_security_group_ids = var.ec2_sg
  subnet_id              = var.ec2_subnet_id

  tags = {
    Terraform   = "true"
    Environment = "sandbox"
  }
}
