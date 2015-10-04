---
tags: [agile, testing]
title: Testing emails with Fake/Mock SMTP service
publish_datetime: 2016-10-31T00:00:07.0Z
description: Testing is key activity of every software development projects. However testing certain features is not easy and need special support functions. One of such functionality is email testing. In this article I showcase few ideas/tools that I used in my projects for achieving email testing easily without any side effects.
authors: ["ref:authors:sunitparekh"]
---

Testing is key activity of every software development projects. However testing certain features is not easy and need special support functions. One of such functionality is email testing. In this article I showcase few ideas/tools that I used in my projects for achieving email testing easily without any side effects.

To test email effectively we end up using real email address, which leads to cluttering our mailbox with unwanted emails and for testing different scenarios we need multiple email address. And testing becomes more difficult when it requires checking mailbox of other users. Also we never like to send emails to real users, otherwise they gets confused with test emails and real emails.

To overcome above problems, what needed is, **Fake SMTP server (Email Service) which acts as outgoing server, however, it never sends email out to actual users and provides a user interface for tester to check and verify emails.** So application sends email to users however it never goes out of SMTP server.
   
We need Fake SMTP server for following scenarios,

### Unit Testing

Embedded version with Assertion support for Unit Testing, so emails can be verified using asserts in unit tests.


### Local Developer Box Testing

Local service with Standalone application for Developer Box testing, so after development developer/tester can verify emails locally.

## Hosted Service

Hosted service with Web UI for Non-Production (QA, UAT, Staging) environments, which helps multiple tester to verify email functionality.
  

  
  
     
   