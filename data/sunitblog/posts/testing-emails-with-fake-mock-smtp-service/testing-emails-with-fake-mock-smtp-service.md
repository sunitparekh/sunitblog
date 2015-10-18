---
tags: [agile, testing]
title: Testing emails with Fake SMTP service
publish_datetime: 2015-10-17T00:00:07.0Z
description: Testing is key activity of every software development projects. However testing certain features is not easy and need special support functions. One of such functionality is email testing. In this article I introduce few tools that I used in my projects for achieving email testing easily without any side effects.
---

Testing is key activity of every software development projects. However testing certain features is not easy and need special support functions. One of such functionality is email testing. In this article I introduce few tools that I used in my projects for achieving email testing easily without any side effects.

To test emails effectively we end up using real email addresses, which leads to cluttering mailbox with unwanted emails. For testing different scenarios we need multiple email address, and testing becomes more difficult when it requires checking mailbox of other users. Also we never want to send emails to real users, otherwise they gets confused with test emails and real emails. Also we do not want to make any code modification for testing emails, this leads to code maintenance issues.

To overcome above problems, what we need is, **Fake SMTP server (Email Service) which acts as outgoing server, however, it never delivers email message to users and provides a user interface to check and verify all outgoing emails.** In short application sends email to users however it never goes out of SMTP server. 
   


  
  
     
   
