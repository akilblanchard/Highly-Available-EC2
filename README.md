# Highly-Available-EC2
In this project I will deploy a group of highly available EC2 
Instances using Terraform, Load balancer and an Autoscaling Group.


To achieve high availability the EC2 instances will be launched in multiple Availability zones.
Autoscaling and load-balancing would be needed to attain high availability, as they both play an essential role in ensureing that the instances are availble at all times. 

To satisfy these requirements I have used a an architecture in which the client will interact with the Application load balancer and from there it will direct the client to one of the two available instances in one of the three availability zones.

This project is configured to ensure that there will always be two instances running at any given point in time.

Scaling up and Scaling down are both done based on CPU utilization.
