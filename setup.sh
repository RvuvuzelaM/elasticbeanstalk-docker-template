#!/bin/bash

cd infrastructure 
terraform init
terraform apply -auto-approve 
