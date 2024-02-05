# Extension Tasks

Great work getting this far. Below are some tasks that will require some additional research using the terraform and AWS docs. 

## Secrets Manager

When interacting with resources our applications will sometimes need access to values that need to be kept secret, such as database credentials or API keys. 

AWS offers a service for storing these values [Secrets Manager](https://aws.amazon.com/secrets-manager/)

Create a secret in Secrets Manager using Terraform.

In order to set the value of this secret we won't be able to hard code it into the Terraform files. Research how to use Terraform `variables` and pass the secret in via the command line when running `terraform apply`. 

You can use the console to check the value has been set correctly in Secrets Manager.
1. variable in variable file .tfvars file (keep secret variable)
2. aws_secetsmanager_secret
3. aws_secretmanager_secret_version


## Lambda File converter

Create a file converter for converting JSON files to parquet format.

Parquet is a file format very commonly used in data lakes and your job is to research how to convert a JSON list and store the converted parquet files for later use. 

You'll then need to perform this process in a lambda function.

If you need any dependencies to do this conversion research how to include them in your lambda. 

You should create:

- An S3 raw data bucket that you can upload JSON files to.
- An S3 bucket to store the parquet files once they have been converted.
- A lambda function that is invoked whenever a JSON file is uploaded. It should convert the JSON file to parquet format and upload the results to the target bucket.

JSON uploads will be list of items sold in an online store. They will be of the form:

```json
[
  {
    "item_name": "1990s Gameboy",
    "description": "But mom I want one!",
    "price": 1599,
    "category_name": "Electronics"
  },
  {
    "item_name": "Antique Bookshelf",
    "description": "Makes your apartment smell like rich mahogany",
    "price": 7999,
    "category_name": "Household"
  }
]
```

## EC2

### Create an EC2

Terraform an EC2 server that you can connect to with `ssh`.

Create an EC2 instance with the Amazon Linux AMI using terraform.

Check that it has been created using the AWS console, you won't be able to connect to it yet, that'll be the next task, just make sure that it's been created successfully for the moment.

### Allow public ssh access

Next will be to update the existing EC2 instance you made in the previous step so that you can connect to it via `ssh`.

If you were doing this on the AWS console you'd need to set the following:

1. *Assign a key-pair to connect with* For the sake of this exercise this can be a pre-existing key-pair or make one manually on the console.

2. *Create a new security group* Create a new security group that allows ssh traffic from the internet. Tip: ssh runs on port 22 and to allow incoming traffic from anywhere `CIDR blocks` can be set to `0.0.0.0/0`.

3. *Add the security group to a VPC* If we were using the console wizard we would normally use the default VPC for our security group. You should already have one in your account but if you don't or it gets deleted you can [create a new one](https://docs.aws.amazon.com/vpc/latest/userguide/default-vpc.html#create-default-vpc)

4. *Add the security group to the EC2* Once the security group is made it should be attached to the EC2 instance. 

Research how to do the above using the Terraform and AWS documentation. Apply your changes using Terraform (no need to destroy the existing infrastructure, Terraform will create or destroy anything it needs to when applying changes.)

To check everything has worked use `ssh` to connect to your EC2 instance.

Once you have this working then add some functionality to your server. Research how you could create the instance with pre-configured software. For example, make your instance be created with a server that is publicly accessible?