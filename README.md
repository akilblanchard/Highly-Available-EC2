# High Availability Group of EC2 Instances with Auto Scaling via Terraform
In this project I will deploy a highly available group of EC2 Instances using Terraform.

## AWS services used:
~ EC2 instances will be launched in multiple Availability zones (3)

~ Furthermore, autoscaling scaling and load-balancing would be imperative to achieve high availability.

~ Autoscaling Scaling and load-balancing will be used to achieve high availability.


## How it works
To satisfy these requirements I have used a an architecture in which the client will interact with the Application load balancer and from there it will direct the client to one of the two available instances in one of the three availability zones.

This project is configured to ensure that there will always be two instances running at any given point in time.
Scaling up and Scaling down are both done based on CPU utilization.
