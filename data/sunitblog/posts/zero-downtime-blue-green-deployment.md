---
# blog post attributes in front matter format
tags: [devops, continuous delivery]
title: Zero downtime using blue-green deployment strategy

---
Zero downtime during application deployment is one of the key requirements for continuos delivery. And no business would like their site to be down and showing maintenance page every few days/weeks during deployment.

To achieve this we decide to go for [blue-green deployment](http://martinfowler.com/bliki/BlueGreenDeployment.html). However, we were challenged with how to do this in legacy style data center infrastructure where we are,

1. Not able to spin new and throw away machines automatically using scripts
2. Don't have ability to add/remove instances using scripts from load-balancer
3. Network level configurations are done manually like firewall setting

Also keeping full in-active stack didn't sound good idea. Now we had to made some modifications to achieve zero downtime using blue-green deployment.

**Decision 1:** We took out database from the application deployment stack. Since we were using NoSQL MongoDB database, it didn't require any schema migration etc. However, we required to follow design principle, always write code which is backward compatible with the data models. And if there is any database migration required it should be run after deployment.

**Decision 2:** Use RPM to package apps and run like a service to start and stop. This enabled us to deploy application easily with the standard chef recipes. All application components are packaged as RPMs and published to repository from CI pipeline. Standardise deployment process across all components/application. We used FPM gem to build RPMs.

**Decision 3:** All application/component should provide 2 state heartbeat, live or standby, with ability to change the current state of the heartbeat at runtime using api call. Configure one load-balance to listen to live heartbeat and another to standby. Allows to add/remove instances from load-balancer by changing heartbeat state.

And with above changes the deployment steps are,

![Pre deployment state](/assets/sunitblog/posts/images/zero-downtime-blue-green-deployment/1-state-before-deployment.png "pre deployment state")
{: .center}

**Step 1:** Change heartbeat of the green stack to state 'standby'. This will remove green stack from LIVE load-balancer pool and no new request send to green stack.

![Change heartbeat of the green stack](/assets/sunitblog/posts/images/zero-downtime-blue-green-deployment/2-green-standby.png "Change heartbeat of the green stack")
{: .center}

**Step 2:** Deploy latest version of the application to green stack. Wait sometime to complete the inflight request on green stack before deployment.

![Deploy latest version to green stack](/assets/sunitblog/posts/images/zero-downtime-blue-green-deployment/3-green-v2.png "Deploy latest version to green stack")
{: .center}

**Step 3:** Sanity test green stack using standby load-balancer. Ideally automated, this will make sure deployment is good.

**Step 4:** Revert heartbeat of the green stack to state 'live'. This will put the green stack back to LIVE load-balancer pool.

![Revert heartbeat of the green stack to state 'live'](/assets/sunitblog/posts/images/zero-downtime-blue-green-deployment/4-green-v2-live.png "Revert heartbeat of the green stack to state 'live'")

If you notice the blue stack running on v1 and green stack running on v2. And both the stacks are connected to same database. Which means v2 codebase should work with old data models. And if there is any database migration should be carried only after all stack upgraded to latest version.

**Step 5:** Repeat above steps for blue stack,

![Change heartbeat of the blue stack](/assets/sunitblog/posts/images/zero-downtime-blue-green-deployment/5-blue-standby.png "Change heartbeat of the blue stack")

![Deploy latest version to blue stack](/assets/sunitblog/posts/images/zero-downtime-blue-green-deployment/6-blue-v2.png "Deploy latest version to blue stack")

And finally v2 deployed fully,

![latest version deployed on all stacks](/assets/sunitblog/posts/images/zero-downtime-blue-green-deployment/7-blue-v2-live.png "latest version deployed on all stacks")

**Step 6:** Optional, run database migration (independent of the deployment)

What we achieved is, at any give point of time either blue or green stack is actively servicing the requests without downtime.

However, the one point to note here is that during deployment only half capacity available, which means deployment should be avoided at peak load time.


