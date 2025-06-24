# EC2 Instance Module

This module creates a single EC2 instance with configurable instance type, security group integration, user data script support, key pair integration, and EBS volume configuration.

## Usage

```hcl
module "ec2_instance" {
  source = "path/to/terragrunt-aws-infrastructure-catalog/modules/ec2-instance"

  name               = "my-ec2-instance"
  ami_id             = "ami-0abcdef1234567890"
  instance_type      = "t3.micro"
  subnet_id          = module.vpc.public_subnet_ids[0]
  security_group_ids  = [aws_security_group.instance_sg.id]
  key_name           = "my-key-pair"
  user_data          = file("user-data.sh")
  root_volume_size   = 20
  root_volume_type   = "gp3"
  ebs_device_name    = "/dev/xvdb"
  ebs_volume_size    = 50
  ebs_volume_type    = "gp3"
}
```

## Inputs

| Name              | Description                                  | Type          | Required |
|-------------------|----------------------------------------------|---------------|----------|
| name              | The name tag for the EC2 instance             | string        | yes      |
| ami_id            | The AMI ID to use for the EC2 instance        | string        | yes      |
| instance_type     | The instance type for the EC2 instance        | string        | yes      |
| subnet_id         | The subnet ID to launch the EC2 instance in   | string        | yes      |
| security_group_ids | List of security group IDs to associate       | list(string)  | yes      |
| key_name          | The key pair name to use for the EC2 instance | string        | no       |
| user_data         | User data script to provide to the EC2 instance | string      | no       |
| root_volume_size  | Size of the root EBS volume in GB              | number        | no       |
| root_volume_type  | Type of the root EBS volume                     | string        | no       |
| ebs_device_name   | Device name for the additional EBS volume     | string        | no       |
| ebs_volume_size   | Size of the additional EBS volume in GB        | number        | no       |
| ebs_volume_type   | Type of the additional EBS volume               | string        | no       |

## Outputs

| Name       | Description                    |
|------------|--------------------------------|
| instance_id | The ID of the EC2 instance     |
| public_ip  | The public IP address of the instance |
| private_ip | The private IP address of the instance |