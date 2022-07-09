module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "sb-ec2-instance"

  ami                    = "ami-052efd3df9dad4825"
  instance_type          = "t2.small"
  key_name               = "tf_key_sandbox"
  monitoring             = false
  vpc_security_group_ids = ["sg-0ffdf4f5aea5d6713"]
  subnet_id              = "subnet-0dd0d3f2d1f3acdd3"

  tags = {
    Terraform   = "true"
    Environment = "sandbox"
  }
}
