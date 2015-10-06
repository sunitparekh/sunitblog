---
tags: [agile, testing]
title: Testing emails with Fake/Mock SMTP service
publish_datetime: 2016-10-31T00:00:07.0Z
description: Testing is key activity of every software development projects. However testing certain features is not easy and need special support functions. One of such functionality is email testing. In this article I showcase few ideas/tools that I used in my projects for achieving email testing easily without any side effects.
authors: ["ref:authors:sunitparekh"]
---

Testing is key activity of every software development projects. However testing certain features is not easy and need special support functions. One of such functionality is email testing. In this article I showcase few ideas/tools that I used in my projects to achieve email testing with ease without any side effects.

To test emails effectively we end up using real email addresses, which leads to cluttering mailbox with unwanted emails. For testing different scenarios we need multiple email address, and testing becomes more difficult when it requires checking mailbox of other users. Also we never want to send emails to real users, otherwise they gets confused with test emails and real emails. Also we do not want to make any code modification for testing emails, this leads to code maintenance issues.

To overcome above problems, what we need is, **Fake SMTP server (Email Service) which acts as outgoing server, however, it never delivers email message to users and provides a user interface to check and verify all outgoing emails.** In short application sends email to users however it never goes out of SMTP server. 
   
We need Fake SMTP server for following different scenarios,

### Unit Testing

Embedded version with Assertion support for Unit Testing, so emails can be verified using asserts in unit tests. [Dumbster](http://quintanasoft.com/dumbster/) is handy library here. Some frameworks like [Rails](http://guides.rubyonrails.org/testing.html#testing-your-mailers) has inbuilt support for unit testing emails.
  
```java
public class TestEmail {

    @Test
    public void testSend() {
        SimpleSmtpServer server = SimpleSmtpServer.start();

        sendMessage("Subject", "Test Body", "abc@example.com");

        server.stop();

        assertThat(server.getReceivedEmailSize(),equalTo(1));

        Iterator emails = server.getReceivedEmail();
        SmtpMessage email = (SmtpMessage)emails.next();

        assertThat(email.getHeaderValue("Subject"),equalTo("Subject"));
        assertThat(email.getHeaderValue("To"),equalTo("abc@example.com"));
        assertThat(email.getBody(),equalTo("Test Body"));
    }
}
```  


### Local Developer Box Testing

Local SMTP service with standalone application for developer box testing. So after development developers/testers can verify emails functionality locally.

1.	**FakeSMTP**  (https://nilhcem.github.io/FakeSMTP/) – No installation required. Just run a simple JAR file. Works on any platform.
2.	**Papercut** (https://github.com/jaben/papercut) – Windows only solution. Better UI than FakeSMTP but requires installation


### Hosted Service

Hosted service with Web UI for Non-Production (QA, UAT, Staging) environments, which helps multiple tester to verify email functionality.
  
1.	**Mailcatcher** (http://mailcatcher.me/) It has a web view which allows viewing messages from anywhere, ruby application that can runs independently.
2.	**Mailtrap.io** (https://mailtrap.io) Cloud based SaaS solution, very sophisticated but paid. 
  
  
## Conclusion  

Using tools and techniques which are applicable for different stages of testing, we can effectively test all email scenarios without delivering emails to real users, without cluttering mailboxes and without any person dependency to check mailbox. Above solutions doesn't require any change in production code for testing, just needs diffferent configuration of SMTP server. 
  
Happy Testing !!!  


  
  
     
   
