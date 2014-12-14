---
tags: [data-anonymization, testing]
title: Data Anonymization techniques, Blacklist and Whitelist?
publish_datetime: 2012-09-04T00:00:07.0Z
description: In this post I describe the two techniques used for data anonymization, Blacklist and Whitelist. Blacklist is easy to implement and get started, whereas Whitelist is more secure and preferred.
---

Continuation of my [previous post](ref:posts:data-anonymization) about the need for anonymized production data dump, here is more details on two anonymization approaches blacklist and whitelist. Lets take one simple example and understand both the approaches. Consider two tables of database: Customers and Config.

![sample data set](ref:images:posts/data-anonymization-techniques/sample-data.png)


## Blacklist

This approach essentially leaves all fields unchanged with the exception of those specified by the user, which are scrambled/anonymized (hence the name Blacklist!).
For Blacklist, create a copy of the prod database and choose the fields to be anonymized e.g. username, password, email, name, geo location etc. Fields are anonymized based on user-defined rules. Most of the fields have different rules e.g. password should be set to same value for all users, email needs to be valid.

Considering above example. Lets anonymize data using blacklist approach. In above we want to anonymize Customers.Name and Customers.Email, so that we can not identify user. After anonymization the data will look like following.

![data set after blacklist](ref:images:posts/data-anonymization-techniques/blacklist.png)

Look at the Age field and config table, they remained as is.  That is, apart from data specified in anonymization rules, all other data remains as is after anonymization. This could be a data security issue. Such as when new fields are added they will not be anonymized by default. Human error in missing any users personal data could be damaging.

## Whitelist

This approach, by default scrambles/anonymizes all fields except a list of fields which are allowed to copied as is. Hence the name whitelist! By default all data needs to be anonymized. So from production database data is sanitized record by record and inserted as anonymized data into destination database. Source database needs to be read-only. All fields would be anonymized using default anonymization strategy which is based on the datatype, unless an anonymization strategy is specified. For instance, special strategies could be used for emails, passwords, usernames etc. A whitelisted field implies that it's okay to copy the data as is and anonymization isn't required.

Using whitelist approach and applying similar rules to anonymize only Name and Email for above example will produce output like following.

![data set after whitelist](ref:images:posts/data-anonymization-techniques/whitelist.png)

Age field value is anonymized. Which means if u haven't specified any rule for anonymization the system should anonymize it using default anonymization rules for the data type. To get Age field as-is it is required to mention it as whitelist. Also, the config table didn't show up at all, means if I don't ask for the table explicitly it should not be copied at all.

This way any new field will be anonymized by default and if we need them as is add it to the whitelist explicitly. This prevents any human error and protects sensitive information.


Data Anonymization tool supports both blacklist and whitelist approach for anonymization. Read more here about the tool and how easy to use it is .

Data Anonymization tool [home page](http://sunitparekh.github.com/data-anonymization)





