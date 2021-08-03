resource "aws_s3_bucket" "ebs_config_bucket" {
  bucket = "ebs-config-5945686633"
  acl    = "private"
}

resource "aws_s3_bucket_object" "ebs_config_object" {
  bucket = "ebs-config-5945686633"
  key    = "ebs_config.zip"
  source = "./ebs_config.zip"

  depends_on = [
    null_resource.create_ebs_config_zip_file
  ]
}
