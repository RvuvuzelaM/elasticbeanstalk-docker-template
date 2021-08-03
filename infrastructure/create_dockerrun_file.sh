#!/bin/bash

dockerrun_aws_json_file_content=$(cat ./ebs_config/Dockerrun.aws.json.tmp)

echo "${dockerrun_aws_json_file_content/ECR_REPOSITORY_NAME/$1}" > ./ebs_config/Dockerrun.aws.json

dockerrun_aws_json_file_content=$(cat ./ebs_config/Dockerrun.aws.json)

echo "${dockerrun_aws_json_file_content/ECR_CONTAINER_PORT/$2}" > ./ebs_config/Dockerrun.aws.json
