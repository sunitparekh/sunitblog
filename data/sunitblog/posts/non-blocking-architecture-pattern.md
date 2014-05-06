---
tags: [architecture pattern, software development]
title: Building highly scalable and performance application using non-blocking architecture
description: Article shows the modern way of building websites using non-blocking architecture pattern. Why this style of architecture is beneficial and what are the frameworks available to implement.
publish_datetime: 2013-05-07T01:00:01.0Z
---

I have been working on web application development since last 12+ years and had privileged to work on more than 20+ different project. Now days the expectations from web apps are totally different than it was few years back. End users are provided with rich content on single page (Amazon, CNN, ...). On a single page, lots of data needs to be mashed up and data may come from different sources.

![Websites with data mashup](/assets/sunitblog/posts/images/non-blocking-architecture-pattern/1-website-screenshots.jpg)
{: .center}

We know how to put together the N-tier architecture.

![Service oriented architecture](/assets/sunitblog/posts/images/non-blocking-architecture-pattern/2-service-oriented-architecture.svg)
{: .center}

And the request workflow will be as following,

![Request workflow](/assets/sunitblog/posts/images/non-blocking-architecture-pattern/3-request-workflow.png)
{: .center}

Now if we notice the above workflow, it is sequential and most of the time thread on web server and app server spend is waiting for response form app server and database respectively rather than doing some meaningful work (processing). This is what is called BLOCKING. Lets take same example and try to draw web server thread timeline.


![Sequential workflow timeline](/assets/sunitblog/posts/images/non-blocking-architecture-pattern/4-sequencial-timeline.jpg)

![timeline legends](/assets/sunitblog/posts/images/non-blocking-architecture-pattern/5-legends.jpg)


RED is time spend by thread waiting for response/result from app server. And GREEN is the time spend doing some meaningful processing by web server. In above example it was total 10 sec response time and 1 thread involved in processing. Lets assume that above 3 calls to app server can be parallelise to optimise response time to end user.

![Standard parallel processing](/assets/sunitblog/posts/images/non-blocking-architecture-pattern/6-standard-parallel-processing.jpg)

In parallel processing the response time was reduced to 7 sec. However, total 4 threads participated in processing and in total 13 sec of thread time it took. Again here also the processing was BLOCKING. Which means parallel processing provides better performance in terms of response time, but required more resources to process the request.

What we need is parallel processing with non-blocking threads. Means when the thread is waiting for the response from other systems, it should be made available to do some other meaningful work. Something like following,

![Non blocking execution timeline](/assets/sunitblog/posts/images/non-blocking-architecture-pattern/7-non-blocking-execution.jpg)

If we can achieve non-blocking architecture than the response time goes down to as low as 5 sec. And also consumes less thread resources. Now the question is how I can achieve this? In today's polygot programming world, we have plenty of alternatives available.

![Non blocking technical options](/assets/sunitblog/posts/images/non-blocking-architecture-pattern/8-tech-options.jpg)
{: .center}

Non-blocking is not new, Nginx is event based and uses similar principle, Messsage based architecture is another classical example to solve similar problems, however that brings in asynchronous complexity.  MongoDB and similar polygot persistence works on same principles and provides eventual consistency.

I recommend trying out following technology/framework choices to achieve non-blocking architecture,

1. **[NodeJS](http://nodejs.org/)**, this is the most popular choice so far in today's technology choices. And Passanger can provide NodeJS cluster running multiple process on one machine. However, programming in NodeJS is all about callbacks. And lots of OO programmers don't like it. There are plenty of frameworks in NodeJS for web application, the popular ones are is [express.js](http://expressjs.com/), [meteor](http://meteor.com/) ...
2. **[Play Framework](http://www.playframework.com/)**, this is Scala based web application framework. Framework is very mature and easy to adpat for Java shop organisations. It uses internally Netty, Scala and Akka and provides very nice abstracts to avoids callbacks hell. Based on Scala means love for OO programmers as well. Akka can also be used independently.

**Disclaimer:** Consider non-blocking architecture when your application have blocking calls and wait times. If your application has more about computation/processing and less or negligible blocking/waiting time the above architecture pattern may not provide better or favorable results.




