---
tags: [software-development, logging]
title: Structured Logging
publish_datetime: 2014-05-26T00:00:07.0Z
description: Logging is being followed in software development since long. Structured logging technique is not just limited for debugging, it can be used for reporting, monitoring and alerting, performance benchmarking and in analytics as well.
---

Distributed system architecture is kind of de-facto for complex systems. However, this brings in complexity of debugging, reporting, monitoring and benchmarking of overall system. It is quite difficult to know, what is the overall time to complete the transaction across systems? Debugging becomes difficult when component failing is not the source of error. In such situations, structured logging can help, here is what needs to be followed while logging and how to setup infrastructure to achieve it.
 
## What is structured logging?
*******
Not only log level is important, but how and what message are logged also matters. Log messages most of the time looks like following, 
 
~~~
127.0.0.1 [25/May/2014:01:37:44 -0400] "GET /api/modules/doc_id/navigation HTTP/1.1" 200 476  
~~~ 

Above message is interpreted well by humans since we know, `120.0.0.1` is IP,  `25/May/2014:01:37:44 -0400` is timestamp, `GET` is request methods, `200` is response status and `476` is server response time... 
And such interpretation is required for each message logging. With number of system involved it is difficult to parse and build indexes for such messages. 
  
~~~
ip="127.0.0.1" timestamp="25/May/2014:01:37:44 -0400" method=GET url="/api/modules/doc_id/navigation" protocol=HTTP/1.1 status=200 responseTime=476
~~~ 
  
Above structured message is self explanatory and easy to parse and index. This is also know as _logging with context_. With structured logging, we can perform queries like find all slow pages, _collect urls with `status = 200` and `responseTime > 2000`_.


> **Unique identifier across systems for transaction tracking,**
>
> Use unique identifier to connect logs of a single transaction across multiple systems. This is useful technique in debugging and performance monitoring transactions with distributed systems. This technique is also known as 'incident tracking' for eCommerce transactions.

## Aggregate logs
*******
There are multiple approaches available for log aggregation. 

#### Log File Replication
Simplest one is, continue logging to file system and setup a independent process to monitor files and send logs to server every 'n' milliseconds. 

#### Syslog
To achieve real time monitoring and alerting you can use syslog approach, directly feeding logs to central server. Syslog is available by default on most of the linux machines. [rsyslog](http://www.rsyslog.com/) or [syslog-ng](http://www.balabit.com/network-security/syslog-ng/opensource-logging-system/) which are two popular syslog implementations.
 
#### Agents
 Most of the products in this space provides there own agents, which runs on client and sends logs real-time to central log server. [Splunk](http://wiki.splunk.com/Community:Getting_data_into_Splunk), [LogEntries](https://logentries.com/doc/forwarders/)...  There are specific tools also available just aggregation purpose like [Apache Flume](http://flume.apache.org/).    
 
![Centralised Logging](/assets/sunitblog/posts/images/structured-logging/centralised-logging.svg){: .full-width} 

> **Time on each machines, should be synced accurately,** since a milli-second differences can lead to confusion and errors.
 
## Usage
*******

#### Debugging
- We generate mongoDB slow running query report, which helps us to identify full table scans due to lack of indexes.  
- Using 'single unique identifier across system' can help debug incidents of eCommerce systems, like payment failure etc.

#### Reporting
- We have daily reports configured for, number of occurrences for each 404's. Using above report we found 404's for [browserconfig.xml](http://msdn.microsoft.com/en-us/library/ie/dn320426(v=vs.85).aspx) and fixed it by adding simple meta tag.
- By logging eCommerce transaction data, we can generated sales reports. This may not be as reliable and accurate as backend system reports, but getting some real-time indication such as, sale campaign are successful or not is good enough.
- Tools like Splunk and LogEntries can generate nice graphs based on reporting data. 

#### Monitoring & Alerting
- We have email alert setup for job failure notification. If centralised server received message with `action=job-exec job=publish status=failed error="..."`, it sends alert to configured user stating failed job with error details.
- Logging of server memory, cpu , disk and network utilisation can provide server monitoring.
- Dashboard can be setup with such monitoring and alerting mechanism.

#### Performance Benchmarking
- We have daily report for server response time, with alerts, if 90 percentile of response time goes higher than 3 seconds.
  
#### Analytics 
- Logs collected over years is the biggest data available for analysis. And if we follow structured logging it can be really useful in analytics as well, we could also achieve real-time analytics with it. e.g. Most popular products, which added to shopping cart. 
 
## Tools
******* 
- **[Splunk](http://www.splunk.com/)**, best in class, commercial product. I am using it in production for large scale system, which generates more than 100GB of logs per day.
- **[LogEntries](https://logentries.com/)**, feature rich SaaS solution available in market. Other options are **[Loogly](https://www.loggly.com/)**, **[PaperTrail](https://papertrailapp.com/)**
- **[GrayLog2](http://graylog2.org/)**, open-source log analytics solutions. Used with syslog to aggregate logs. **[LogStash](http://logstash.net/)** is another open-source one in this space.    

> Tools like _Splunk_ and _LogEntries_ are capable of parsing default log messages from standard application such as, access logs from Apache and Nginx, mongoDB logs.  

![Structured Logging overview](/assets/sunitblog/posts/images/structured-logging/structured-logging.svg){: .full-width}
{: .col-md-8}








