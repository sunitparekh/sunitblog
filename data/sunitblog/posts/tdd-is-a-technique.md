---
tags: [tdd, software-development, agile, testing]
title: TDD is a technique, thought process for software development
publish_datetime: 2014-06-19T00:00:07.0Z
description: Why I follow TDD. For me TDD is a technique, a thought process, I would never like to write production code without thinking of use case (a test scenario), and for me TDD is starts here.
---

After hearing discussions of Martin Fowler, Kent Beck and DHH. I thought of putting down, my thoughts on why I follow TDD. For me TDD is a technique, a thought process for solving business problems. I do not like to write production code without thinking of a use case first. I think of a use case (lets call it test case) and this thinking it-self is 'test driven' for me. And based on my test cases identified, I will start thinking about my design. No one like to go, let me implement strategy pattern and later I will find use case for it. 

To know my code works, I need to test it. To test I prefer automated tests, which I can run as many times as I want. So to me, I need write the test before I run it to verify it is working. Now take a step further and write it first, no harm. However, sometime it is difficult to write test without even having a 'code structure skeleton' in place. So according to me putting 'code structure skeleton' in place is okay. Hold on, do not start implementing methods. My tip, if we don't get into thinking of 'test class' should map one-to-one with class, you can write test without 'code structure skeleton'. Lot of times, I write all the test cases as pending tests, and then I start thinking of abstraction based on all test I see in front of my eyes, come up with design to cover all test cases. Now start implementing step by step, one test case a time, with feedback loop in place from first test. And you are in TDD cycle.

While building test cases on whiteboard or as pending test cases, I might have identified design pattern to implement. Now should I start writing my test and code, without design pattern abstraction and refactor to the desired design pattern or jump directly into defining classes and it's test in desired design pattern? Both approaches works for me. Lots of time I don't have a clue, can't think of abstraction and design upfront, in that case starting flat is good. And after few test case implementation, my code starts shaping up and I will have more insight to find better abstractions.
 
And with similar technique, **practicing TDD helps me with slicing and dicing stories**, because TDD is a technique that helps me think what is minimal use-case that I can be implemented to get started.

**TDD helps me with better naming**, since I start from the use-case. White write test, I write **client (call)** first, that helps me in naming it from usage perspective and not from implementation perspective. 

### Lets look at some history

Looking at old days of software development, any I/O calls were costly, database queries where slow, 10 sec page load was considered good, lack of tools available. Today, SSD is faster than old days RAM, NIO libraries used by default, and it is very fast, database calls are cheap. With help of libraries like [factory-girl](https://github.com/thoughtbot/factory_girl) it is very easy to setup data in database. So today, might be okay if you test hits the database in unit tests. However remember, one of the easy way to make test suite complete faster is to run them in parallel, with hitting database in unit tests you limit your option to run tests in parallel. 


### TDD and Design?
TDD helps me to identify smells in my design. I have seen a code test driven, but full of if/else and switch/case constructs without abstractions. In my view, If I am following TDD does not mean my design is good. Here are few obvious test smells that helps me identify bad design,

- **Difficult to write tests,** because to too many dependencies which requires too much setup code. In Rails world example of 'Fat Controllers' without services or helper classes.
- **Too many tests for single unit**, class having just too many responsibility. In Rails world example of 'Fat Models'.
- **Way too many assertions**, this happens when one method doing too many things or I have written test at wrong level. One test trying test too many things at once.  
- **Way too many tests for a component, and takes very long to run all test.** Individual tests are very fast. This may be architecture smell of monolithic application. Break it down into small components. On my last project we had UI as separate repo with only Views (templates), CSS and JS, includes unit tests for Views and JavaScript. 


### When to go for TestDouble, Mocking or Stubbing?
- **Test depends on external components which is out of test control.** e.g. web-service calls. Also think about multiple developers running the test at the same time, with single backend system everyone connecting to. 
- **Failing test doesn't point broken code.** When I write course grain test, this happens more often. This tells me my unit for tests is not well defined, trying to test too many things at once. Isolate code not under test using TestDouble. 
- **Running test suite, takes lots of time.** Isolate time consuming code with TestDouble. If my test are taking too long to finish due to one remote call. I might just mock it and have another test to cover it and not pay cost in every test. One of the easy way to make test suite complete faster is to run them in parallel. If I write unit test with database, you give away option of running them in parallel. 

> Choose mocking or stubbing, which ever is best suited in the context. I find lot of time mocking is easy for writing and maintaining tests. Too much mocking in one test is smell for me.

![TDD is a technique, thought process for software development](/assets/sunitblog/posts/images/tdd-is-a-technique/tdd-is-a-technique.svg){: .full-width}


### Avoid writing test later 
- Manually testing is more time consuming than writing a automated unit test. 
- Sometime I miss writing tests for certain scenario.
- Evil kicks-in and I loose motivation and interest in writing test.  

 
To decide what kind of test I should write, how many tests to write where, and how long is acceptable time for test to run. Read more on this in another post [here](/posts/test-structure)...
  







