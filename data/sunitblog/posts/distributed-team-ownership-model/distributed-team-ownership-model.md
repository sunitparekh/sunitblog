---
tags: [software-development, distributed-teams]
title: Ownership model for distributed team
publish_datetime: 2016-04-13T00:00:07.0Z
description: In distributed teams it is very important that each team operates in complete autonomy. And there is need for team to be independent and takes ownership. However, everyone has different views and understanding of ownership. Here is what worked for me in terms of distributed team and clear definition of ownership across teams.
authors: ["ref:authors:sunitparekh"]
---

Setting up distributed team is very common in new world of software development. However, it is equally important that each team operates in complete autonomy and there is a need for teams to be independent, taking ownership and deliver. However, everyone has different views and understanding of ownership. I would like to take this opportunity to explain my view on different aspects of ownership which can help stakeholders and team in having common understanding of expectations and help deliver with ownership and accountability.   

Let's start with first understanding different aspects of ownership. Software development ownership can be viewed as three types **technical**, **solution** and **business**. 

### 3 Types of ownership 

![3 Types of Ownership for Distributed Teams](ref:images:posts/distributed-team-ownership-model/distributed-team-ownership-model.png "3 Types of Ownership for Distributed Teams")
{: .center}
 
 
1. **Technical ownership** means delivering quality product (code) by following engineering practices such as unit testing, refactoring, continuous integration, automated build and deployment etc. with full autonomy. Technical ownership also includes owning technical decisions at low level including following design patterns, cleaner API development for software development. 

> In *technical ownership* delivering quality code could be the first step and reaching continuous delivery with automated build and deployment could be the higher level of maturity.
 
2. **Solution ownership** is about providing solutions to solve business problems. e.g. a) for retail website building recommendation engine based on what a user is searching for, b) to achieve mobile first build UX/UI with responsive web design approach. Solution also involves how we can deliver the feature e.g. define MVP and roll out as first cut to end users and with each release keep enhancing the feature as needed. 

> For *solution ownership* deciding appropriate technology to solve the problem (using ElasticSearch for free text search) is first and making tech stack, frameworks and architecture decisions and delivering it (Java vs .NET, microservice architecture, NoSQL datastore), is higher level of maturity 
 
3. **Business ownership** involves working closely with business in defining business needs and helps in building digital solution to solve the problem. e.g. on retail website defining the reward scheme and to promote mobile applications give more reward. Plays partner role with business owners and gets involved in defining long term business strategies as well.  

> The most tricky one is *business ownership* where it is very difficult to define what is expected. One way to detect this maybe how early do you get involved in the discussion. Do you get to define the requirement, and identify the problem or does get involved only after the requirement and likely solution have been decided. 
 
### Distributed team models based on ownership

Lets take example of retail business and see two classical distributed team models,

**Vertical (Feature) based full ownership team model**: setup teams with all roles to take up full ownership of feature. E.g. Product Catalog team, Order management team, Shipping management team. Each team has full autonomy to operate from business decision to technology choices made in respective area. 

**Horizontal (Competency) based ownership team model**: Front end web team, Mobile team, API team, Operations team... each team has specific role to play and take ownership of each area specifically technical and solution ownership. 

![Horizontal/Competency based Distributed Team Model](ref:images:posts/distributed-team-ownership-model/distributed-team.png "Horizontal/Competency based Distributed Team Model")
{: .center}

Feature based full ownership team is what I think better for ownership and accountability. However, I have see more horizontal/competency based ownership model in practice. In my view having clarify with all members about the team model is more important and choose whatever works for you.  

### Type of ownership and roles

It is important to understand, what is expected from the team and capability &amp; strength of each team? Above becomes less relevant when team is co-located since everyone is within walk and talk reach. And it becomes more relevant in distributed team, each team requires specific roles to achieve each type of ownership. 

1. Developers, QAs and BAs can help achieve Technical ownership. 
2. We need tech leadership to provide architecture solution along with supporting roles like project management for execution and planning. 
3. Similarly we need Product Owners and Senior BAs to achieve Business ownership. 
