#!/bin/bash

apt-get -qy install zip
cd ./ebs_config
zip -r ../ebs_config.zip ./Dockerrun.aws.json
