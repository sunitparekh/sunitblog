---
tags: [agile, software-development, continuous-delivery]
title: DevOps in Nut shell
publish_datetime: 2016-10-31T00:00:07.0Z
description: Many organisations and teams are looking to use cloud infrastructure to achieve continuous delivery in software development. Continuous Delivery has pushed DevOps into mainstream of software development from just support function. However, DevOps is new to lot of people in the industry and jargon like "Infrastructure as code" makes it more complex to understand. Here is my attempt to explain DevOps to newbies and non technical folks. 
authors: ["ref:authors:sunitparekh"]
---

Many organisations and teams are looking to use cloud infrastructure to achieve continuous delivery in software development. Continuous Delivery has pushed DevOps into mainstream of software development from just support function. However, DevOps is new to lot of people in the industry and jargon like "Infrastructure as code" makes it more complex to understand. Here is my attempt to explain DevOps to newbies and non technical folks. 

To understand DevOps better, lets first put down how it is done in today's world. Today, for any new software project to be deployed to production following steps are performed,
1. Decide all the required environments e.g. QA, UAT, Staging, Production ...
2. Create infrastructure diagram for each environment with network topology, firewall and security settings, ...
3. Procure required hardware and software
4. Build vanilla servers as just OS 
5. Attach special storage such as SAN or SSD drive to OS 
6. Implement network topology
7. Implement security measures such as setup firewalls etc 
8. Install required software on each servers 
9. Configure installed software e.g. Load balancer, Database cluster, HTTP server etc
10. Configure required application settings such as property files etc.
11. Deploy application 

Also note in above steps there are multiple teams involved in above steps (minimum 5 teams). On top of that all steps are done manually and required **tickets to be raised which goes to approval process for days**. There are plenty of challenges in above process and team setup. 

First lets understand the overall DevOps space and later I will share some tips and team structure that worked for me in past. 

To understand DevOps lets divide it into 3 parts,
1. Infrastructure Provisioning
2. Server Provisioning
3. Application Provisioning

**Infrastructure Provisioning** is all about setting up vanilla server with network topology, security setup... in above list takes care of step 1 to 7. 

Tools like [AWS CloudFormation](http://aws.amazon.com/cloudformation/), [Terraform](https://www.terraform.io/) supports infrastructure setup.




