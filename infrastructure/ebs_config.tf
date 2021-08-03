resource "null_resource" "create_dockerrun_file" {
  provisioner "local-exec" {
    command = "bash ./create_dockerrun_file.sh ${aws_ecr_repository.server.repository_url}:latest 3000}"
  }
}

resource "null_resource" "create_ebs_config_zip_file" {
  provisioner "local-exec" {
    command = "bash ./install_and_zip_ebs_config.sh"
  }

  depends_on = [
    null_resource.create_dockerrun_file
  ]
}
