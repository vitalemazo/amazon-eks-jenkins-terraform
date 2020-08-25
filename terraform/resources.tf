resource "aws_s3_bucket" "jenkins-bucket" {
  bucket = "my-tf-jenkins-bucket"
  acl    = "private"

  tags = {
    Name        = "Jenkins bucket"
    Environment = "Dev"
  }
}





resource "aws_iam_role" "CodeDeploy" {
  name = "CodeDeploy"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

  tags = {
    tag-key = "tag-CodeDeploy"
  }
}
