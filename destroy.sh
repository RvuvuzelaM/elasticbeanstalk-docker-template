#!/bin/bash

cd infrastructure
terraform init
terraform destroy -auto-approve
