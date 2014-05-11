---
tags: [NoSQL, mongoDB]
title: NoSQL learning & gotchas based on MongoDB experience
publish_datetime: 2012-02-14T00:00:07.0Z
description: I have been working on NoSQL database had some interesting learning on when not to use NoSQL database. All following learning are based on my NoSQL experience with mongoDB. This is an ongoing document which I am planning to keep updating as I keep learning.
---

I have been working on NoSQL database had some interesting learning on when not to use NoSQL database. All following learning are based on my NoSQL experience with mongoDB. This is an ongoing document which I am planning to keep updating as I keep learning.

![mongodb](/assets/sunitblog/posts/images/nosql-learning-n-gotchas/mongodb-logo.png)

### When NOT to choose NoSQL database

One primary gotcha of new technology is, when to use it by knowing when not to use it. Here is list of reasons, when you have to be careful choosing NoSQL,

1. If your data is structured. Means your data follows predefined structure for all records like online web store, ticketing system etc.
2. Your data has lots of relationships, including bidirectional like many to many etc. You need to carry references around in the dataset like customer has orders and order belongs to customer.
3. Need lots of indexes on a document. You need search your document by multiple search criteria, means either your data is structured or multiple document stored as single document in database. Need to revisit your document design.
4. Transaction is important. need to update multiple dataset and it should either all succeed or fail like financial transaction of transfer from one account to another and required multiple data updates.

### NoSQL gotchas

Once you choose NoSQL don't fall into trap of designing and applying SQL best practices to NoSQL. Here is few example where SQL and NoSQL database differs.

1. Do not assume your query is successful if it returns successfully. MongoDB query returns immediately and queues up queries on server for execution.
2. It's not good practice to let your document grow over time.  MongoDB stores document in sequential manner without much buffer, assuming the document doesn't grow over a period of time. And if you add more content in your document it has to move your whole document in new place. Trick is to create document with full content and default values OR adding some temp content while creating and removing it immediately.
3. Indexes are more costly in NoSQL than standard SQL database.







