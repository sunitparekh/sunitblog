---
tags: [agile, sprint]
title: Distributed Agile - What should be the Sprint duration?
publish_datetime: 2016-08-17T00:00:07.0Z
description: What should be the  Sprint duration? this question comes up quite commonly on agile projects and opinions vary from as short as a week to as long as 6 weeks. Decision on an appropriate Sprint length depend on many factors. Few of the factors that I consider while deciding on the Sprint length are as follows, however, each factor adds different dimensions when the team is distributed across time zones.
---

**What should be the  Sprint duration?** this question comes up quite commonly on agile projects and opinions vary from as short as a week to as long as 6 weeks. Decision on an appropriate Sprint length depend on many factors. Few of the factors that I consider while deciding on the Sprint length are as follows, however, each factor adds different dimensions when the team is distributed across time zones.


![sprint duration factors](ref:images:posts/what-should-be-the-sprint-duration/what-should-be-the-sprint-duration.png)


### Decision Making:
 
In most agile team all decision makers from business to technical people are co-located or available within a working day. Sometimes business and product owners are sitting in different locations and it takes a minimum of two working days to make decisions. And if one of them is on leave, decisions gets further delayed. Faster decision-making drives towards shorter sprint cycles and longer decision making drives towards longer cycles.

### Team Distribution: 

Nowadays it is quite common to have a distributed team. Number of locations includes everyone from business stakeholders, users, product owner, technical stakeholders, developers, testers, infrastructure and release teams. With a  distributed team, there are overheads including prioritisation and planning to tracking and  development to testing and release. The maximum overhead with distributed teams is the communication effort and time to make sure all are on same page and similar expectations. Having a healthy overlap (2 to 4 working hrs) between teams works in favor, however, with time zone differences such as India and US West Coast this becomes particularly impossible. The more the teams are distributed, the longer the sprint cycle become.


### Story Size (E2E elapsed time):

Every story that is part of the Sprint should be completed end 2 end from low level design to development and testing within the Sprint. A simple rule is  that the largest sized story should fit within a Sprint. E.g. if my largest and most complex story takes 2-3 elapsed days for design,  6-8 elapsed days for development and 3-4 elapsed days for testing, then having a 2 weeks cycle of is NOT ideal. This is a very important aspect to consider if one would like to deliver meaty features to users every sprint. Either figure out creative ways to fit stories within sprint, or, as a last resort, increase the length of your sprint.

### Regression testing effort and size: 

For frequent releases and continuous delivery, it is very important to have shorter testing cycles. Automation is a key, starting from unit testing till end2end functional testing, performance testing, capacity testing and security testing - everything should be automated in an optimal manner. Shorter the full testing cycle, shorter the Sprint length. Read more about testing automation [here](https://www.thoughtworks.com/insights/blog/guidelines-structuring-automated-tests)

### Release sign-off and deployment process: 

This factor is very important in deciding the duration of the Sprint cycle as well. In large organisations regular releases are scheduled during weekends (off hours) and done by independent teams (release management and infrastructure team). Also the process of reserving the release slot needs multiple level of approval with all the details and testing evidences attached. Now all these processes with these teams distributed across time zones makes releases more complicated and lengthy even though we have a fully automated deployment using CI/CD infrastructure in place. So effort and time for the release signoff and deployment process directly impacts the Sprint duration. Read more about CI/CD [here](http://www.slideshare.net/gsluthra/recipes-for-continuous-delivery)

### Agile maturity of team:

When the team is new to agile practices, initial time gets spent in learning agile practices such as sprint prioritisation and planning, automated testing, continuous integration, automated deployment, retrospectives, etc. While learning agile practices if the team tries to follow shorter sprint cycle, then the team is going to find it difficult to follow and learn agile practices effectively, as it will be busy doing sprint ceremonies. So sometimes it is recommended that you start with longer spring cycle and as the team maturity increases, shorten the sprint duration in a planned manner. 


## Conclusion

The above factors help in defining the Sprint cycle and help deliver sizeable number of features to production considering distributed team overheads. Balancing pure development effort vs. all other non-development effort is the key here, otherwise the team will deliver lesser features against effort spent on non-development activities.

> In my view, for co-located teams or distributed teams with healthy overlap time and at intermediate level of agile engineering practices I would suggest 2 week sprint duration. And for highly distributed team which is mostly new to Agile (and CD) practices, I recommend 4 weeks of initial Sprint duration.

Philosophy of "shorter sprints are better" is not always right. Sometimes with shorter sprints and significant non-development effort, team's stress level increases while stakeholder sees less deliverable, watch-out for such cases. 

## Real-life project example

> On one of my project initially after project inception with distributed team in 4 location (US West Coast, Brussels, London, India) we started with 4 week sprint. Our go-live was after 8 sprints (almost 7 months) and after that we moved to 3 week sprint and every 2 sprint release to production. We kept release every 2 sprint till we smooth out overall processes with multiple team having minimum overheads. After six months team re-visited release duration, and moved to releasing to production every sprint i.e. 3 weeks. However sprint duration was kept at 3 week only so release has some meaty features in it. 
