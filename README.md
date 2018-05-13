# Docker Terraform AWS
This docker image helps you get around all the problems you encouter dealing with permissions when using terraform from another AWS account using an assume role. This is a very common scenario if you are using gitlab for deployments and are using the shared runner which belongs to another AWS account.

## How does this work ?
Say you have an AWS account A and you deploy using a shared runner running on AWS account B. You normally create a role and define a trust relationship with B. Thereby allowing B to assume this role. Now if you are running the runner in kubernates, you may use something called Kube2IAM that hacks into the EC2 metadata service and provides you access to your resources running on A by making a temporary credentials request to AWS and passing it to the caller. You can find more about it [here](https://github.com/jtblin/kube2iam#solution "here").

However this setup doesn't work when you directly try to do a ``terraform init`` from the base ``terraform`` image. We use similar hack like Kube2IAM to get temporary credentials and provide these credentials to terraform before you run your ``plan`` or ``apply``.

## Usage
`` docker run -e roleArn=your-assume-role-arn-here dipayan90/docker-terraform-aws``
