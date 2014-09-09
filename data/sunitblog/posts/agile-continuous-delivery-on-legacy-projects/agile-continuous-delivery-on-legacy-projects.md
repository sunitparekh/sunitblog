---
tags: [agile, software-development, continuous-delivery]
title: How to begin Agile and Continuous Delivery on Legacy Projects?
publish_datetime: 2014-10-07T00:00:07.0Z
description: Post is to provide guideline on how to get started with Continuous Delivery on Legacy Projects. "Agile and Continuous Delivery works for new green field projects, but we have legacy project. We don't to where to start or we can't do agile". 
---

In my interactions with people, I hear "Agile and Continuous Delivery works for new green field projects, but we have legacy project. We don't know where to start or we can't do agile and continuous delivery on our project". 

Most of the time legacy projects are facing typical issues like fragile codebase, too much technical debt, old libraries &amp; framework resulting into long development and testing cycles. And to solve these problems, lots of team decides following Agile practices. Following agile practices requires specialized skills like Continuous Integration, Test Driven Development, Refactoring and Evolutionary Design... and difficulty is where to start, there are so many agile engineering practices.

Should we start Big Bang, stop all development until we have CI, Automated Tests, ... everything in place.

Now once we have decided that agile and CD is the way to go, here is step by step approach to move towards CD with agile practices which worked for me. Remember this is a journey and can take upto months or years to achieve based on size of the project, so have patience.



## Step 1: Automated build and deployment

On most of the legacy projects I have seen, taking build and performing deployment is quite long process. And one of the reason for this is all steps are manual and long downtime to systems (environments). If we notice all the steps we do to build artifacts and perform deployment are recitative and can be automated using scripts. In case of products we should have automated upgrades for client and distribution channel.  

**Tools and techniques for automated build**

- Packaging application in native format using tools like [FPM](https://github.com/jordansissel/fpm) to build RPM, DEB packages to deploy application in native way. For products this approach is ideal and we can leverage system default package manager for automated upgrade. And this quite common in applications distributions like Apache HTTP Server, JDK etc. 
- Use Continuous Integration servers like [Go](http://www.go.cd/) to build artifacts and trigger deployment.
- Use [Chef](http://www.getchef.com/chef/) to provision servers and deploy applications triggered via downstream pipelines in CI server.
- Use [Flyway](http://flywaydb.org/) or [Liquibase](http://www.liquibase.org/) for running database migrations in incremental way.


![simple deployment pipeline](/assets/sunitblog/posts/images/agile-continuous-delivery-on-legacy-projects/simple-pipeline.svg){: .full-width}


Next question comes in mind is, what should be the branching strategy? I recommend following 3 active branch strategy. 

1. **Master development branch**, used continuously for active development
2. **Release Candidate branch**, is very short lived branch, created as release candidate for production and cut from master. Once deployed to production this becomes the _Production branch_ This is also known as **beta** branch. 
3. **Production branch**, used for defect and emergency fixes (hotfix)



![3 branch deployment pipeline](/assets/sunitblog/posts/images/agile-continuous-delivery-on-legacy-projects/3-branch-pipeline.svg){: .col-md-9}
{:full-width}


Doing automated deployment enables us to deploy any build at will even for small bug fix. This enables QA to get latest code for testing anytime as soon as it is checked in by developers. At this step we are still doing manual testing. 
{: .clear}

## Step 2: Automated sanity test suite

Building full automation suite to get good coverage for CD is long way to go. My suggestion here it start small, identify blocker or critical end user scenarios and write automated tests for just for those. Blocker means if this fails, end user is unable to use application or critical for business to continue. e.g. in retail website purchase workflow, search for product. Lets call this test suite as sanity. Remember to keep this as small as possible, I would say this test suite should run in 10 min max. 
  
![automated sanity test](/assets/sunitblog/posts/images/agile-continuous-delivery-on-legacy-projects/automated-sanity-test.svg){: .full-width}
  
Once the 'Sanity automated tests' are ready lets put them to run on every check-in using CI setup done before. This provides safety net against critical paths for every check-in done by developer.  

**Tools and techniques for automated build**

1. Perform headless website testing using [PhantomJS](http://phantomjs.org/headless-testing.html) in combination with [Jasmine](http://jasmine.github.io/) and [Testem](https://github.com/airportyh/testem). Other alternatives are [Selenium](http://docs.seleniumhq.org/) and [Sahi](http://sahi.co.in/sahi-open-source/).

 
> Same Sanity test suite can be run against all environments with different configurations and parameters. This helps in verification and confidence in our build and deployments in each environment.  

Evolve automated sanity test suite to achieve acceptance test suite with more End-2-End type of tests. However, please make sure you follow [Test Pyramid](http://martinfowler.com/bliki/TestPyramid.html) 
 
## Step 3: Development with automated unit tests and refactoring 

Now the tough one. Big bang unit testing and refactoring is *big NO*. You need to be most careful in this part of CD adoption. First step is to define single [Automated Tests Strategy](). Make sure everyone understands [Test Pyramid](http://martinfowler.com/bliki/TestPyramid.html) and follows principle of write more unit tests and less acceptance tests. Avoid repeating same tests in different test suites. There is one and only one test stratergy across team, do not fall into trap of different strategy for development team and testing team, remember ONE team.    

I recommend baby steps again here, do refactoring and write unit tests only for features which are under development and touched for enhancement. Do not try to cover non-touched code. In case of Registration feature not changing, do not write unit tests or refactor code related to registration feature. 

![automated unit test](/assets/sunitblog/posts/images/agile-continuous-delivery-on-legacy-projects/automated-unit-test.svg){: .full-width}

> Do progressive refactoring and test coverage for code under heavy development, do just enough for others. In short invest more in changing codebase and less in dead code.  

*Steps for development,*

1. Write unit test for existing functionality, provide safety net before you make the enhancements. Sometime code is not in a shape of writing unit tests and without refactoring you won't be able to write unit tests. In such cases just do enough refactoring which enables you to write unit tests
3. Once you have safety net of automated tests, do heavy refactoring if needed 
4. Now make enhancements either by following test first or test last approach.
5. If needed, do refactoring of the code you just wrote before you call it done.

Watch Martin Flower's [Workflow of Refactoring](https://www.youtube.com/watch?v=vqEg37e4Mkw) to learn more.
 
### Test last to test first journey

Lots of time I realise that team is not familiar with the xUnit frameworks and not written any unit tests in past. Have patience, give them space to learn how to write effective unit test, learn good practices and patterns in unit testing. Let them start with test last and slowly move them towards test first journey. Since we are looking at legacy project here we are doing test last anyways. Even if you are following test last do one change to code and write test, do not wait for everything to finish and then write all tests.

### Three levels of refactoring

#### Code level refactoring

This is first level of refactoring that each and every team member should do ruthlessly. Such better naming, smaller methods, ...
 
#### Design level refactoring

Team should change design within codebase to apply design patterns wherever necessary to represent code in better way which allows to make future enhancements easily. like removing large if/else and switch/case chain to appropriate design pattern. Make sure we share such refactoring with all developers to have knowledge spread across and learning by examples.
 
#### Architecture level refactoring

Most of the time team ask me, Code and Design level refactoring we are able to do but we find it difficult to go for architecture level refactoring. And this is the most important refactoring to break the ice of legacy code. Most of the time legacy codebase is monolithic in nature and would like to move towards service oriented architecture. How to do it? You can't go back to business and say we are stopping all other development and no release for next 3 months since we are doing architecture refactoring. Here is my way for approaching such refactoring, 
  
1. Build services as method calls using design level refactoring
2. Move method calls to services, however, this services coded and deployed in same monolithic way, make localhost calls 
3. Move services to separate codebase, but deploy in same monolithic way, make localhost calls
4. Move service as separate independent deployment, but deploy on same box, make localhost calls
5. Make service totally independent as you would liked it to be, make remote calls

Above steps can take weeks or months based on the complexity and size. My guideline is to divide into steps that you could complete within one iteration, so that you keep it green and always running.

> Above steps can be done simultaneously without any restrictions. This is just a guideline and feel free to try different approaches that works for you and your team.

## Support needed during CD journey

During the agile adoption journey it is important that team gets required support in terms of,

- Team needs necessary initial training and coaching on Agile practices like Continuous Integration, Test Driven Development, Refactoring and Evolutionary Design...
- Have a coach, internal or external, who mentors team on Agile adoption journey. It is important that someone constantly looking at how are team is progressing on CD journey? Is team getting benefits? Is team getting enough support to adopt new way of development?
- All stakeholder needs to understand that during this journey initially when team is learning, refactoring & building automated test suites, it might take little longer to deliver. However after sometime trend should shift and start showing benefits with quicker & quality deliveries.

> Run regular retrospective on Agile adoption and CD progress as health check.

Please share your experience with Agile adoption on legacy project and challenges faced using comments.
   




