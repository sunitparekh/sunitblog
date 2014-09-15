---
tags: [envisioning, agile, software-design]
title: Ruby vs Java vs .NET - How much does it matter on web projects?
publish_datetime: 2012-04-25T00:00:07.0Z
description: On most of the projects we just talk and talk about which language is the right choice (Java vs Ruby vs .NET vs ...) for your web application development. This post talks about what all other things matter equally and we should pay attention to.
---

I was looking into some statistics on my multiple web project and found one very interesting stats on simple Lines of Code (LOC).

![code distribution metrics](ref:images:posts/programming-language/code-distribution-metrics.png)

<small>* numbers are pure production code and does not include test code</small>

After looking at above metrics, I asked myself: during initial stage of the project, are we thinking enough about every part of the software and doing enough research around which language, technology & framework to use for project?


On most of the projects we just talk and talk about which language is the right choice (Java vs Ruby vs .NET vs ...) for your web application development. We are in so much rush to start that we don't even have time to do enough study/spike on each technology decision and provide right technical solution to client.

So what should I be thinking about, apart from core language and framework while deciding on architecture in initial stage of the project?

1. Understand project and its components/parts during inception, discuss & make initial decision about choosing framework & library of different technologies. Make sure all components fit well with each other.
2. **Web 2.0:** JavaScript, HTML and CSS is big part of your web application code. Do not ignore that.
    1. Is my application AJAX heavy? (page reload is kind of old fashioned now days). Choosing framework like angularjs, backbone.js, knockoutjs
    2. Does my application has image cropping or chart need. Should I do it in browser using JavaScript such as raphaeljs.
    3. Check out templating engine and its support e.g. mustache, haml and its port for specific language.
    4. how about using less or saas for CSS. This can help reducing your css effort significantly and more beautiful, concise, clean code.
3. **Data Store:** Which data store is the right choice for kind of data processed and maintained by application?
    1. Choices are plenty now days, starting from traditional relational database, NoSQL databases (mongodb, riak, couchdb ...), graph database (neo4j), fast in-memory like databases (redis & memcached).
    2. Can I leverage client side data store (browser datastore) for features like storing user preferences, session information etc.
4. **Evaluate Product as a Service:** Can I leverage on PaaS for any feature in application?
    1. Do I need push notification service to serve dynamic content on my pages? checkout pubnub
    2. Is image processing such as resize and cropping is required for website? checkout services like lightspun and boxresizer
5. **Go Could:** Discuss and make initial thoughts on production environment setup and deployment. This helps on setting up local env which can be as close as production env and other non production setup.
    1. Leverage could as much as possible.
    2. Do I need to provision env using Chef or Puppet? Can I use same for local env setting and using tools like vagrant?
    3. Can I use S3 with ColudFront to serve my static content?
6. **Automated testing:** how much and at which level? Decide on unit tests, integration tests and functional tests distribution. Make sure not to repeat same tests.  Follow software testing pyramid structure.
    1. Unit can be at different levels
        1. core programming level unit tests
        2. javascript unit tests are important since most of the sites now days are javascript heavy.  Check out Jasmine for JavaScript unit testing.
        3. template level unit tests
    2. Service level integration tests using your choice of unit testing framework.
    3. end2end functional tests, their are plenty of tools now days for browser functional testing. checkout phantomjs, tobi, cucumber, capybara and last but most popular selenium webdriver.


Rest all that should continue such as choosing right technology with framework for server side development such as RoR or Java/Spring or Python/django etc...

Happy project envisioning.






