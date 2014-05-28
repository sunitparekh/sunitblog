---
tags: [software-development, logging]
title: Structured Logging
publish_datetime: 2014-05-26T00:00:07.0Z
description: Logging is being followed in software development since long. How structured logging technique can be used not just for debugging, but for reporting, monitoring and alerting, performance benchmarking and in analytics as well.
---

Distributed system architecture is kind of de-facto for complex systems. However, this brings in complexity of debugging, reporting, monitoring and benchmarking of overall system. It is quite difficult to know, what is the overall time to complete the transaction across systems. Debugging becomes difficult, when component failing is not the source of error. In such situations, structured logging can help. Here is, what to be followed while logging and how to setup infrastructure to achieve it.
 
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
  
Above structured message is self explanatory and easy to parse and index. This is also know as _logging with context_. With structured logging, to find all slow pages we can query _collect urls with `status = 200` and `responseTime > 2000`_.


> **Unique identifier across systems for transaction tracking**
>
> Use unique identifier to connect logs of a single transaction across multiple systems. This is useful technique in debugging and performance monitoring transactions with distributed systems. This technique is useful for 'incident tracking'.

## How to aggregate logs?
*******
There are multiple approaches available for log aggregation. 

#### Log File Replication
Simplest one is, continue logging to file system on application server and setup a independent process to monitor files and send logs to central log server every 'n' milliseconds. 

#### Syslog
To achieve real time monitoring and alerting we can use `syslog` approach, directly feeding logs to central log server. Syslog is available by default on most of the linux machines. [rsyslog](http://www.rsyslog.com/) or [syslog-ng](http://www.balabit.com/network-security/syslog-ng/opensource-logging-system/) are two popular syslog implementations.
 
#### Agents
 Most of the products in this space provides there own agents, which runs on client and sends logs real-time to central log server. e.g. [Splunk](http://wiki.splunk.com/Community:Getting_data_into_Splunk), [LogEntries](https://logentries.com/doc/forwarders/) etc.  There are specific tools available just for aggregation purpose [Apache Flume](http://flume.apache.org/).    
 
![Centralised Logging](/assets/sunitblog/posts/images/structured-logging/centralised-logging.svg){: .full-width} 

> **Time on all application servers should be synced.** Since a milli-second differences can lead to confusion and errors.
 
## Usage
*******

#### Debugging
- We generate mongoDB slow running query report, which helps us to identify full table scans due to lack of indexes.  
- 'Single unique identifier across system' can help debug incidents of eCommerce systems, like payment failure etc.

#### Reporting
- Log Servers like Splunk and LogEntries can generate nice reports with graphs, dashboards.  
- We have daily reports configured for number of occurrences of 404's. Using report like this we found 404 for [browserconfig.xml](http://msdn.microsoft.com/en-us/library/ie/dn320426(v=vs.85).aspx).
- By logging eCommerce transaction data, we can generate sales reports. Such reports can be really useful sale campaign are successful or not is good enough.

#### Monitoring & Alerting
- We have email alert setup for job failure notification. If centralised server received message with `action=job-exec job=publish status=failed error="..."`, it sends alert to configured user stating failed job with error details.
- Logging of server memory, cpu, disk and network utilisation provides server monitoring.
- Dashboard can be setup with such monitoring and alerting mechanism.

#### Performance Benchmarking
- We have daily report for server response time, with alerts, when 90 percentile of response time goes higher than 3 seconds.
  
#### Analytics 
- Logs collected over years is the biggest data available for analytics. We could also achieve real-time analytics such as most popular products. 
 
## Tools
******* 
- **[Splunk](http://www.splunk.com/)**, best in class, commercial product. We are using it in production for large system generating more than 100GB of logs per day.
- **[LogEntries](https://logentries.com/)**, feature rich SaaS solution. Other options are **[Loogly](https://www.loggly.com/)**, **[PaperTrail](https://papertrailapp.com/)**
- **[GrayLog2](http://graylog2.org/)**, open-source log analytics solutions. Used with syslog to aggregate logs. **[LogStash](http://logstash.net/)** is another open-source one in this space.    

> Tools like _Splunk_ and _LogEntries_ are capable of parsing default log messages from standard application such as access logs from Apache and nginx, MongoDB logs.  

![Structured Logging overview](/assets/sunitblog/posts/images/structured-logging/structured-logging.svg){: .full-width}
{: .col-md-8}








