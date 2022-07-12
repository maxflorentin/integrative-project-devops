resource "aws_iam_policy_attachment" "ec2_admin_access_me" {
  name       = "ec2_admin_access_me"
  roles      = ["AWSReservedSSO_AdministratorAccess_601dd0781d6ee9eb"]
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
