---
tags: [tdd, sofware-development, agile]
title: TDD is a technique, thought process for software development
publish_datetime: 2014-05-19T00:00:07.0Z
description: Why I follow TDD. For me TDD is a technique, a thought process, I would never like to write production code without thinking of use case (a test scenario), and for me TDD is starts here.
---

After hearing discussions of Martin Fowler, Kent Beck and DHH. I thought of putting down, why I follow TDD. For me TDD is a technique, a thought process, I would never like to write production code without thinking of use case (a test scenario).

I think of a use case (lets call it test case) for which I want to write code. Now this thinking it-self is 'test driven' for me. And based on my test cases I will start thinking about my design. And If I am correct no one like to go, let me implement strategy pattern and later I will find use case for it. 

My take is, I need to write test before I run the code, and to know my code works, I need to test it. And to test, I prefer automated tests, which can run as many times I want. So to me, I write the test before I run it. Now take a step further and write it first, no harm. However, I understand sometime it is difficult to write test without even having a 'code structure skeleton' in place. So according to me putting "code structure skeleton" in place is okay, Hold on, do not start implementing methods. My tip, if we don't get into thinking of 'test class' should map one-2-one with class, you can write test without 'code structure skeleton'. Lot of time, I write all the test cases as pending tests, and then I start thinking of abstraction based on all test I see in front of my eyes, come up with design to cover all test cases and start implementing step by step, one test case a time with feedback loop in place from first test, and for me TDD is starts here.

While building test cases on whiteboard or as pending test cases, I might have identified design pattern to implement. Now should I start writing my test and code, without design pattern abstraction and refactor to the desired design pattern, or jump directly into defining classes and it's test in desired design pattern? Both approaches works for me. Lots of time I don't have a clue, can't think of abstraction and design upfront, in that case starting flat is good. And after few test case implementation, my code starts shaping up and I will have more insight to find better abstractions.
 
I like to start small, so I write my first test case and write code to implement that. However, sometime I like thinking of design little upfront to avoid immediate test cases implementation rework, but will not code for it. Sometime I write test-case with already though of design in mind.

And with similar technique, **practicing TDD also helps me with siding and dicing stories**, because TDD is a technique that helps me think what is minimal use-case that I can implement and get started.

**TDD helps me with good naming**, since I started from the use-case. Since I code **call** first, that helps me in naming it from usage perspective and not from implementation perspective. 

### Old days

I am privileged that I have seen some old days of software development. And hence can understand the evolution better. 
In old days, any call to I/O was costly. Database queries where slow, 10 sec page load was considered good. Lack of tools available for unit testing, refactoring. And hence some approaches were taken, e.g. in unit test, do not make database calls. otherwise your test will be slow, setting up data in database was tedious,
Now, SSD is better than old days RAM, NIO libraries used by default, and it is very fast, hence database calls are cheap. With help of libraries like factory-girl it is very easy to setup data in database. So no problem if you test hits the database.  

So I would say we need to understand why's of old days and keep adapting our approaches to the new days. 


### TDD and design?
TDD helps me to identify smells in my design. I have seen a code all test driven, but full of switch case constructs without abstractions. In my view, If I am following TDD does not mean my design is good. Here are few obvious test smells that helps me identify bad design,

- **Difficult to write tests,** due to too many dependencies which requires too much setup code. In rails world example of 'Fat Controllers' without services or helper classes.
- **Too many # of tests for single unit**, class having just too many responsibility. In rails world example of 'Fat Models'.
- **Way too many assertions**, this happens when one method doing too many things or I have written test at wrong level. One test trying test too many things at once.  
- **Way too many tests for a component, and takes very long to run all test.** Individual tests are very fast. This may be architecture smell of monolithic application. Break it down into small components. On my last project we had UI as separate repo with only Views (templates), CSS and JS, includes unit tests for Views and JavaScript. 


### When to go for TestDouble, Mocking or Stubbing?
- **Test depends on external components which is out of test control.** e.g. web-service calls. Also think about multiple developers running the test at the same time, with single backend system everyone connecting to. 
- **Failing test doesn't point broken code.** When I write course grain test, this happens more often. This tells me my unit for tests is not well defined, trying to test too many things at once. Isolate code not under test using TestDouble. 
- **Running test suite, takes lots of time.** Isolate time consuming code with TestDouble. If my test are taking too long to finish due to one remote call. I might just mock it and have another test to cover it and not pay cost in every test. One of the easy way to make test suite complete faster is to run them in parallel. If I write unit test with database, you give away option of running them in parallel, since multiple tests tries to setup data in parallel. 

Choose mocking or stubbing, which ever is best suited in the context. I find lot of time mocking is easy for writing and maintaining tests. Too much mocking in one test is smell for me.

![TDD is a technique, thought process for software development](/assets/sunitblog/posts/images/tdd-is-a-technique/tdd-is-a-technique.svg)
{: .full-width}

### Writing test later? 
- Manually testing is more time consuming than writing a automated unit test. 
- I miss writing test for few scenarios.
- Evil kicks-in and I loose motivation and interest in writing test.  
 
To decide what kind of test I should write, how many tests to write where, and how long is acceptable time for test to run. Read more on this in another post [here](/post/test-structure)...
  







