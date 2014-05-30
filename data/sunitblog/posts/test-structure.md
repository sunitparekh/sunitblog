---
tags: [software-development, tdd]
title: Test structure
publish_datetime: 2014-06-19T00:01:07.0Z
description: On every project question comes up, what kind of test we should write? what is the right level? how much? 
---

Always on every project question comes up, What kind of test we should write? What is the right level? How much?  

### My guideline for automated tests?

1. **It should be fast.** definition of fast is debatable. Team should decide collectively, what is the acceptable time for test suite to run and define it for all test suites unit, integration and acceptance. Some guideline on deciding the time,  
    1. How frequently your team check-ins the code (remote push)? In case of 2-3 times a day, 10 min is acceptable. However if 20 times a day, 10 min is not acceptable. I need faster test suite. Remember making test run 1 min faster, can save 1000 minutes collectively across team. 
    2. How much time is acceptable to roll-out critical bug fix in production? Which means all your CI pipeline should run within 'n' min, including builds, tests etc. Lower is better, but don't kill yourself in getting tests faster and faster, be pragmatic. In most of the projects upto 30 min is acceptable time for check-in to deployment.
    3. One of the easy way to make test suite complete faster is to run them in parallel. 
2. **When it fails, it should point broken code.** When test fails, if it takes 1 hour to find why this test failed, than something wrong with the test. In one test we are trying to test too many things, tests are course grained.  
3. **It should NOT be fragile.** Test should not fail without reasons. And re-running tests should not pass. Watch more closely on time dependent tests. 
4. **Value vs Effort** Based on project domain and complexity decide what kind of test we would like to have automated, and if that fails what is the impact. Writing CSS tests is difficult and more effort in maintaining it, so I might think twice before building automated tests for CSS. However, javascript testing provides value with business logic being getting written on client side, easy to get started with more mature toolset, so do it.  
5. **Do not test library you borrowed.** If I decide to write test for the external libraries, I write in separate repo and run it every time I update the library version.  


### Test structure Pyramid
I like to divide my automation tests in following structure.

1. **Unit tests:** runs fast, points exactly what failed. Write unit tests for models, controllers & views. Javascript tests also comes under this category.  
    - I have client side filtering logic in browser. Should I write Cypebara acceptance tests or JavaScript unit tests to cover all variations? The answer is fast JavaScript tests. I encourage writing unit test for each and every test case.
    - Runs within 5 min, max unto 10 min.
    - Is hitting database okay in unit tests? With unit test with database, I give away option of running them in parallel. So if my unit test runs pretty fast and don't need parallel execution, may be fine.
2. **Integration tests:** runs slower than unit but helps tests across the components. Most of time there covered in the acceptance tests. 
    - Test covering interactions and contract between systems and external system. 
    - Runs within 5 min, max unto 15 min.
3. **Acceptance tests:** E2E test cases. Most of the time happy user journeys, and critical failure scenario which can not be tested by unit tests. This also helps me to verify my E2E integration flow is working for me. 
    - Generally I like to run these test in production like environment using artifacts build for deployment.
    - Runs within 10 min, max 30 min.
4. **Performance tests:** I should be able to run multiple times a day and within acceptable time frame of the critical production fix. 
    - Upto 2 hours
    
> One test strategy including all automated tests following [Test Pyramid](http://martinfowler.com/bliki/TestPyramid.html). Prefer unit tests to cover test scenario over any other test where ever possible.    
   
### Example, sign-up scenario

![Multi-tier application](/assets/sunitblog/posts/images/test-structure/multi-tier-app.svg){: .full-width}
{: .col-md-8}

#### FrontEnd   
{: .clear}

- Write controller level unit test to cover all scenarios with TestDouble service call to API components
- View level unit tests are NOT require since not many variations in sign-up view and it will get covered in acceptance test. View level unit tests are valuable, when view changes based on data-set.
- Write unit tests for all client validation cases. e.g. email, phone, etc. JavaScript unit tests.

#### API
- Service level unit tests (API controller tests) with mocking repository classes.
- Write model level unit test for all the validation cases. e.g. email, phone, etc. 
- Repository level unit tests with hitting database. Some extremist might qualify this as integration test, fair. Since these tests runs fast and provides exact details of what's wrong when it fails, I am okay to put them as unit tests.

#### End 2 End
- E2E acceptance tests with one happy path and one failure case scenario only. Avoid testing validation in acceptance tests. Also avoid making assertion on validation error message, it should just verify the error case by virtue of redirect to same page. All validation scenario's are already covered with messages, in unit tests.
- May NOT require performance test, since this use case is used only once by the user.

### How my CI pipeline will look?

![CI Pipeline workflow](/assets/sunitblog/posts/images/test-structure/ci-test-workflow.svg){: .full-width}

### Guideline in deciding test structure
    
1. **Avoid repeating tests.** Collectively build the test suites. Avoid retesting scenario if it it already covered in another test suite. Ask yourself, if I can write unit test, should I write acceptance test? 
2. **Cove more scenarios in fast test suite.** Write JavaScript unit tests to test client side validations, Avoid Selenium based acceptance tests to do so.
3. **Revisit and adapt test structure periodically.** Time to time keep revisiting the test suite and refactor tests to keep Test Pyramid in shape.  
   
![Test structure](/assets/sunitblog/posts/images/test-structure/test-structure.svg){: .full-width}
{: .col-md-8}

Please share your feedback and experience by commenting on this article.
{: .clear}




