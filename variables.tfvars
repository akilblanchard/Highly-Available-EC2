#vpc
main_vpc = "10.0.0.0/16"

#ami for ec2 instances
ami_id = "ami-0557a15b87f6559cf"

#Instance type for instances
instance_type = "t2.micro"

ssh_private_key = "./key-pair.pem"

#CIDRs for subnets
subnets_cidr = ["10.0.1.0/24, 10.0.2.0/24, 10.0.3.0/24"]

#Availability Zones
azs = ["us-east-1a", "us-east-1b", "us-east-1c"]