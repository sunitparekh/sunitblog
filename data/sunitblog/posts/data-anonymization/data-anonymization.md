---
tags: [data-anonymization, testing]
title: Data Anonymization, need for every site in production
publish_datetime: 2012-09-04T00:00:07.0Z
description: Afraid of getting production data due to privacy issues. Data Anonymization tool can help you to build anonymized production data dump to use for performance and security testing, debugging production issues and development purpose.
---

On one of my previous projects, we wrote a jMeter performance test suite, which runs periodically on performance environment. Once the application was in production, we enhanced our performance test suite based on actual user behaviours from Apache access logs and Omniture analytics. That provided us a great level of confidence in development for scaling. Now the next step was to get the production dataset so our performance testing becomes almost like production peak load.

Also we had few bugs manifesting themselves only in production and we were not able to reproduce the same on our local environment due to the dataset. In production the data has evolved over a period of time and might have some bad/inconsistent data leading to edge cases or defects not happening in other environments. To fix such issues it was required to have a production dataset to enable our team to debug and fix such issues with confidence rather than guess-work.

One other time, we had issues with our migration scripts, when the migration script failed during production release. The reason was again the kind of data that had evolved in the production system. It could have been avoided if we had a production dump to rehearse the production deployment.

![Why data anonymization](/assets/sunitblog/posts/images/data-anonymization/data-anonymization.png)

Considering all the above hurdles, we got together our Product Owner, and the Dev ops and Security team mates for a production dump. The initial reaction was a NO: the primary reason it being 'Users' Personal Data' and according to Data Protection Act "No one should have access to users personal data". Now what? the answer was, we can get production dataset if we sanitize/mask/anonaymize users personal data, we can get the data from production. We quickly started googling around to findout is there a quick and easy tool available to achieve anonymization of the database. Hmm.... no luck.

Considering distributed teams spanning out of country, concern of security with data is increased multiple fold.

We thought lets write some scripts and anonymize production data. However, it has some serious security and data protection issues. Such as there is possiblity of missing out on certain attributes at all and those data slips into non production environments. Also it has issues with new content gets passed into non production as is without anonymization by default. There are two techniques for anonymization blacklist and whitelist.

![Data anonymization techniques](/assets/sunitblog/posts/images/data-anonymization/data-anonymization-techniques.png)

As this is quite a common requirement across projects, I started working on this idea with a few colleagues at ThoughtWorks to build a simple tool in Ruby based on ActiverRecord to support multiple databases.

Data Anonymization tool supports both blacklist and whitelist approach for anonymization. Read more here about the tool and how easy to use it is .

Data Anonymization tool [home page](http://sunitparekh.github.com/data-anonymization)

In my [next post](/posts/data-anonymization-techniques) I describe blacklist and whitelist anonymization techniques in more detail. Write to me (Twitter: @sunitparekh) or comment on this blog for any questions, feedback and suggestions.







