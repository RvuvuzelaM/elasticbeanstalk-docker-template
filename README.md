# elasticbeanstalk-template

## Introduction

This repository aims to be a template that will work for your single-container applications, for multiple containers there would have to be slight modifications.

### Setup

1. Install `Terraform` [here](https://learn.hashicorp.com/terraform/getting-started/install.html).
2. Setup your application environment variables in `infrastructure/ebs.tf` file under `TODO: Add your environments here` comment
2. Create `.env` file or export environment variables named: `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY` and `AWS_DEFAULT_REGION`.
3. Create file `secrets.auto.tfvars` in infrastructure directory.
4. Fill content of `secrets.auto.tfvars` like so:  
```
db_username = "secret_username"
db_password = "secret_password"
```
5. Run `terraform apply -auto-aprove` to setup everything.

## Problems

### ECR

Regarding `Elastic Container Registry` - when `ECR` is created you will have to push there your image.  
It sounds problematic but in fact it is really a small issue, as you will have to do that one-time, and creating database will take somewhere around 5-10 minutes, so you have a lot of time to push it out.  
If you already built image then you will have to tag it properly, and push it out to the registry.

### Adding HTTPS

If you have `DNS` bought with `Route 53`, then attaching your DNS to your Application Load Balancer should be trivial.  
As you only have to add SSL certificate to the port `443` on your load balancer. Here is a [guide](https://aws.amazon.com/premiumsupport/knowledge-center/elastic-beanstalk-https-configuration/) on how to do that.  

### Mutliple images

If you would like to update this project to work with multiple containers I think those resources would be useful: [AWS doc](https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/create_deploy_docker_ecs.html), and [Terraform doc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elastic_beanstalk_application).

### .ebextensions

Adding support for [.ebextensions](https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/ebextensions.html) would really be useful, as it would allow further customization of your environment.