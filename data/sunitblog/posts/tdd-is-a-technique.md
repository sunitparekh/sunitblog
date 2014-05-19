---
tags: [tdd, sofware-development, agile]
title: TDD is a technique, thought process for software development
publish_datetime: 2015-01-01T00:00:07.0Z
description: Why I love TDD. For me TDD is a technique, a thought process, I would never like to write down a piece of code without thinking of use case (a test scenario), and for me TDD is starts here.
---

After hearing to discussions of Martin Fowler, Kent Beck and DHH. I thought of putting down, why I love TDD. For me TDD is a technique, a thought process, I would never like to write down a piece of code without thinking of use case (a test scenario), and for me TDD is starts here.

I think of a use case (lets call is test case) for which I want to write code. Now this thinking it-self is 'test driven' for me. And based on my test cases I will start thinking about my design. And If I am correct no one thiks like let me implement strategy pattern and later I will find use case of it. 

I like to start small, so I write my first test case and write code to implement that. However, sometime I like thinking of design little upfront to avoid immediate test cases implementation rework, but will not code for it. Sometime I write test-case with already though of design in mind.

My take is, you need to write test before you run the code. Because, to know your code works, you need to test it. And to test, I would prefer automated tests so I can run as many times I want. So to me, I write the test before I run it. Now if you think more, writing it first is no harm. However, I understand sometime it is difficult to write test without even having a 'class structure skeleton' in place. So according to me putting "class structure skeleton" in place is okay, but do not start implementing methods. My tip, if you don't get into thinking of test class should map one-2-one with class, you can write test without code structure skeleton in place. Lot of time, I write all the test cases as pending tests, and then I start thinking of abstraction based on all test I see in front of my eyes, come up with design to cover all test cases and start implementing step by step, one test case a time with feedback loop in place from beginning. 

While building of test cases (on whiteboard, in mind), I might have identified design pattern to implement. e.g. strategy pattern. Now should I start writing my test and code without strategy pattern abstraction and refactor to strategy pattern or jump directly into defining classes and its test in strategy pattern? Both approaches works for me. Sometime I don't have a clue, can't think of better abstraction and design, in that case starting flat is good,  so after some test case implementation my code starts shaping up and I will more insight how to find better abstractions. If my decision of strategy pattern is bad I can refactor it to right design, provided I have a tests safety net. 

And with that thought **practicing TDD helps me with siding and dicing stories**, because TDD is a technique that helps me think what is minimal use-case that I can implement and get started.

**TDD helps me with good naming**, since I started from the use-case. I code call first than implementation. That helps me in naming it from usage perspective and not from implementation perspective. 

### Old days

I am privileged that I have seen some old days of software development. And hence can understand the evolution better. 
In old days, any call to I/O was costly. Database queries where slow, 10 sec page load was considered good. Lack of tools available for unit testing, refactoring. And hence some approaches were taken, e.g. in unit test, do not make database calls. otherwise your test will be slow, setting up data in database was tedious,
Now, SSD is better than old days RAM, NIO libraries used by default, and it is very fast, hence database calls are cheap. With help of libraries like factory-girl it is very easy to setup data in database. So no problem if you test hits the database.  

So I would say we need to understand why's of old days and keep adapting our approaches to the new days. 


### TDD and design?
TDD helps me to identify smells in my design. I have seen a code all test driven, but full of switch case constructs without abstractions. In my view, If I am following TDD does not mean my design is good. Here are few test smells that helps me identify bad design,

- **Difficult to write tests,** due to too many dependencies indirectly requires too much setup code (In rails world example of 'Controllers' without services for complex business logic)
- **Too many # of tests for single unit**, class having just too many responsibility  (In rails world example of 'Heavy/Thick Models')
- **Way too many assertions**, this happens classically when one method doing too many things or I have written test at wrong level. 
- **Way too many tests for a component, and takes very long to run all test.** Individual tests are very fast. This is architecture smell of monolithic application. Break it down into small components. On my last project we had UI as separate repo which includes only views (templates), CSS and JS, includes unit tests for views and JavaScript. 


### When to go for TestDouble, Mocking or Stubbing?
- **Test depends on external components which is out of test control.** e.g. web-service calls, consider even multiple developers running the test at the same time. 
- **Failing test doesn't point broken code, isolation is required.** If I I write course grain test, this becomes more and more difficult. This tells me my unit for tests is not well defined, trying to test too many things at once.
- **Running test suite, takes lots of time.** Isolated time consuming code with TestDouble. if my test are taking too long to finish due to one remote call. I might just mock it and have another test to cover it once and not pay cost in every test. One of the easy way to make test suite complete faster is to run them in parallel.  If I write unit test with database, you give away option of running them in parallel, since multiple tests tries to setup data in parallel. 

Choose mocking or stubbing, which ever is best suited in the context. I find lot of time mocking is easy for writing and maintaining tests. Over mocking is smell for me. 

![TDD is a technique, thought process for software development](/assets/sunitblog/posts/images/tdd-is-a-technique/tdd-is-a-technique.svg)
{: .full-width}

### Writing test later? 
- How do I test the code written in first place? Manually. In my It is more time consuming than writing a automated unit test.
- I miss writing test for few scenarios.
- Evil kicks-in and I loose motivation and interest in writing test.  
 
To decide what kind of test I should write, how many tests to write where, and how long it is acceptable time for test to run. Read more on this in another post [here](/post/test-structure)...
  







