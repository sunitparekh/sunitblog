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
8. Install required software on each servers e.g JDK, Application Servers like WAS, setup database cluster 
9. Configure installed software e.g. Load balancer, Database cluster, HTTP server etc
10. Configure required application settings such as property files etc.
11. Deploy application 

In above steps there are multiple teams involved to achieve above steps. On top of that all steps are done manually and requires **tickets to be raised which goes to approval process for days**. There are plenty of challenges with manual process and team setup. Also first steps which are just documentation takes most of the time to make sure everyone in organisation is aligned. 

First lets understand the overall DevOps space along with some tips and team structure that worked for me in past. 

To understand DevOps lets divide it into 3 parts,
1. Infrastructure Provisioning
2. OS Provisioning
2. Software Provisioning
3. Application Provisioning

**Infrastructure Provisioning** is all about setting up vanilla server with network topology, security setup... step 1 to 7 in above list. 

Tools like [AWS CloudFormation](http://aws.amazon.com/cloudformation/), [Terraform](https://www.terraform.io/) supports infrastructure setup.

Docker virtual server image serves OS, Software and Applicaiton prvisionig together.. 





