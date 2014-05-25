---
tags: [software-development, tdd]
title: Test structure
publish_datetime: 2014-05-19T00:01:07.0Z
description: Always on every project question comes up, What kind of test we should write? What is the right level? How much? 
---

Always on every project question comes up, What kind of test we should write? What is the right level? How much? 

### My guideline for automated tests?

1. **It should be fast.** definition of fast itself is debatable. Team decides collectively, tests should run within 'n' min and define it for all test suites (unit, integration, acceptance).  
    1. How frequently your team check-ins the code (remote push)? 2-3 times a day, 10 min is acceptable. However if 20 times a day 10 min is not okay, I need faster test suite. Remember how many times you run these tests and making it 1 min faster sometime saves 1000 min collectively across team. 
    2. How much time is acceptable to roll-out critical bug fix in production? all your CI pipeline should run within 30 min, including builds, tests etc. Lower is better, but don't kill yourself in getting tests faster and faster. be pragmatic. 
2. **When it fails, it should point broken code.** When test fails, If I have to spend 1 hour just debugging why this test failed, than a test is trying to test way too many things in one test. Tests are course grained. this is the way I know what is unit for me. 
3. **It should NOT be fragile.** Test should not fail without reasons. And re-running tests should not pass. Watch more closely your time dependent tests. 
4. **Value vs Effort.** Based on project domain and complexity decide what you want to have automated tests e.g. still today writing CSS tests is difficult and more effort in writing and maintaining it, and if that fails what is the impact. However, javascript testing is now days very easy to get started, not fragile, provides value in testing cross browser, so do it.  
5. **Do not test library you borrowed.** write test around code which is in your control. In some case if I decide to write test for the external libraries, I write in separate repo and run it every time I update the library version. This is true even for the case of testing external dependencies. 


### Test structure Pyramid
I like to divide my automation tests in following structure.

1. **Unit tests:** runs fast, I should be able to run before every check-in without getting frustrated. provide me exactly what failed. model, controller & view tests, javascript tests all comes under this category. I encourage covering any test cases with fastest test possible. e.g. I have client side filtering in my code. Should I write Cypebara acceptance test to cover all scenario or write simple JavaScript tests to cover all scenario. The answer is fast, isolated JavaScript tests.
    - within 5 min, max unto 10 min.
2. **Integration tests:** runs slower than unit but helps tests across the components. However, faster than acceptance tests, which are E2E.  contract tests across systems. Sometime I do not need this.
    - within 5 min, max unto 15 min.
3. **Acceptance tests:** runs E2E test cases. most of the time happy user journeys, and critical failure scenario which can not be tested by unit tests. This proves to me that my E2E integration flow is working for me.
    - within 10 min, max 30 min.
4. **Performance tests:** I should be able to run multiple times a day and within acceptable time frame of the critical production fix. 
    - Upto 2 hours is okay for me.
   
### Example, sign-up scenario

![Multi-tier application](/assets/sunitblog/posts/images/test-structure/multi-tier-app.svg){: .full-width}
{: .col-md-8}

#### FrontEnd   
{: .clear}

- Controller level unit test to cover all scenarios with TestDouble service call to API components
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
    
1. **Avoid repeating tests.** Collectively build the test suites. Avoid retesting scenario if it it already covered in another test suite.
2. **Cove more scenarios in fast test suite.** Write JavaScript unit tests to test client side validations, Avoid Selenium based acceptance tests to do so.
3. **Revisit and adapt test structure periodically.**
   
![Test structure](/assets/sunitblog/posts/images/test-structure/test-structure.svg){: .full-width}
{: .col-md-8}

Please share your feedback and experience by commenting on this article.
{: .clear}




