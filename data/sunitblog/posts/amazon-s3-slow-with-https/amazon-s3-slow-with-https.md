---
tags: [aws]
title: Amazon S3 learning with HTTPS serving very slow
publish_datetime: 2012-02-25T00:00:07.0Z
description: Serving images from S3 over HTTPS is slow, using CloudFront to serve S3 content over HTTPS gives significant improvement in time.
---

On our site we have lots of images thumbnail getting served on HTTPS by Amazon S3. We were seeing very high load time in browsers upto 2-3 sec for approx 40-50KB size.

We tried following load test on S3 and the results helped us making decision.

![amazon s3 performance issue with serving images over HTTPS](ref:images:posts/amazon-s3-slow-with-https/amazon-s3-slow-with-https.png)


### Conclusion:

1. Serving S3 content over HTTPS is slow
2. S3 performance is not effected (does not degred by # of objects in bucket
3. Using CloudFront to serve S3 content over HTTPS gives significant improvement in time





