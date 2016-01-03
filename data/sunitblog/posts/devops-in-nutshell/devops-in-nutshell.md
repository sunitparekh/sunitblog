---
tags: [agile, software-development, continuous-delivery]
title: DevOps in Nutshell
publish_datetime: 2016-10-31T00:00:07.0Z
description: Many organisations and teams are looking to use cloud infrastructure to achieve continuous delivery in software development. Continuous Delivery has pushed DevOps into mainstream of software development from just support function. However, DevOps is new to lot of people in the industry and jargon like "Infrastructure as code" makes it more complex to understand. Here is my attempt to explain DevOps to newbies and non technical folks. 
authors: ["ref:authors:sunitparekh"]
---

Many organisations and teams are looking to use cloud infrastructure to achieve continuous delivery in software development. Continuous Delivery has pushed DevOps into mainstream of software development from just support function. However, DevOps is new to lot of people in the industry and jargon like "Infrastructure as code" makes it more complex to understand. Here is my attempt to explain DevOps to newbies and non technical folks. 

To understand DevOps better, lets first put down how it is done in more traditional world. For any new application to be deployed to production, following steps are performed,

1. Decide all the required environments e.g. QA, UAT, Staging, Production ...
2. Create infrastructure diagram for each environment with network topology, firewall and security settings, ...
3. Estimate and procure required hardware and software
4. Implement network topology such as Virtual Private Cloud
5. Setup gateways for incoming and outing traffic
6. Build vanilla servers as just OS 
7. Attach special storage such as SAN or SSD drive to OS 
8. Implement security measures such as setup firewalls etc 
9. Install required software on each servers e.g JDK, Application Servers like WAS, setup database cluster 
10. Configure installed software e.g. Load balancer, Database cluster, HTTP server etc
11. Configure required application settings such as property files etc.
12. Build and deploy application with configuration
13. Run migrations scripts (optional) 

In above steps there are multiple teams involved to achieve above steps. Initial steps are just documentation and takes most of the time to make sure everyone in organisation is aligned. On top of that most steps are done manually and requires **tickets to be raised which goes for approval process for days**. There are plenty of challenges with manual process and team setup. Procurement is the longest and it can take upto months. Also if we required to make any change in later stage, it is almost impossible. 

To understand DevOps lets divide it into 4 parts,
1. **Planning** is documenting all required hardware and software and getting necessary approvals
2. **Infrastructure Provisioning** is all about setting up vanilla server with network topology, security setup... step 4 to 8 in above list.
3. **OS Provisioning** is about spinning new machines with specific memory, CPU and disk space etc
4. **Software Provisioning** is about installing required software such as JDK, Application Servers, MongoDB Cluster, load balancer     q...  
5. **Application Deployment** takes care of deploying application 
 

Tools like [AWS CloudFormation](http://aws.amazon.com/cloudformation/), [Terraform](https://www.terraform.io/) supports infrastructure setup.

Docker virtual server image serves OS, Software and Applicaiton prvisionig together.. 





