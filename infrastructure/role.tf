resource "aws_iam_role" "instance_role" {
  name               = "elb_instance_role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    },
    {
      "Action": "sts:AssumeRole",
      "Condition": {
        "StringEquals": {
          "sts:ExternalId": "elasticbeanstalk"
        }
      },
      "Effect": "Allow",
      "Principal": {
        "Service": "elasticbeanstalk.amazonaws.com"
      }
    }
  ]
}
  EOF
}

resource "aws_iam_role_policy_attachment" "instance_role_attach_elastic_beanstalk_web_tier" {
  role       = aws_iam_role.instance_role.name
  policy_arn = aws_iam_policy.elastic_beanstalk_web_tier.arn
}

resource "aws_iam_role_policy_attachment" "instance_role_attach_elastic_beanstalk_worker_tier" {
  role       = aws_iam_role.instance_role.name
  policy_arn = aws_iam_policy.elastic_beanstalk_worker_tier.arn
}

resource "aws_iam_role_policy_attachment" "instance_role_attach_elastic_beanstalk_enhanced_health" {
  role       = aws_iam_role.instance_role.name
  policy_arn = aws_iam_policy.elastic_beanstalk_enhanced_health.arn
}

resource "aws_iam_role_policy_attachment" "instance_role_attach_elastic_beanstalk_service" {
  role       = aws_iam_role.instance_role.name
  policy_arn = aws_iam_policy.elastic_beanstalk_service.arn
}

resource "aws_iam_role_policy_attachment" "instance_role_attach_ecr_dowload_server" {
  role       = aws_iam_role.instance_role.name
  policy_arn = aws_iam_policy.ecr_dowload_server.arn
}

resource "aws_iam_instance_profile" "ec2" {
  name = "elb_instance_profile"
  role = aws_iam_role.instance_role.name
}
