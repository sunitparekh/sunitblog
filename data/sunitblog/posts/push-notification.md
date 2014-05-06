---
tags: [push-notification, pubnub, pusher, websockets, pubsub]
title: Get notified with push notification
publish_datetime: 2012-07-13T00:00:07.0Z
description: Write post description here...
---

Now days it's kind of defacto that every website requires some sort of mechanism to update changes dynamically. On my last project we had a specific need to keep updating the count of messages like Facebook does for unread messages. The website is a dot com site with reasonable user base online. It was challenging to come up with a solution so that we can get this developed quickly and scale well with the load.

We discussed multiple approach and chose one for development.

## Approach 1: Poll for changes

This is kind of classical pull approach where every 'n' second poll for changes and update UI. The problem with polling every 30 sec were,

![poll for changes](/assets/sunitblog/posts/images/push-notification/poll.png)

1. Unnecessary extra load on the server means fake http requests, 1 will have new message out of 100+ requests. Major hurdle in scaling app, suddenly the no of requests on server will increase multiple fold.
2. Delay in data refresh based on poll frequency and it won't be realtime.
3. We can't http cache the request using reverse proxy since it is user's personal data

Approach may be okay for sites like live cricket scores where requests can be http cached and served to multiple users and data changes frequently.

## Approach 2: Push for changes

Second approach we came up with was push messages using websockets and libraries like socket.io etc.  Using push the user experience is really awesome, user gets notified instantaneously about the new messages. No extra fake requests on the server and helps in scaling easily.

![push for changes](/assets/sunitblog/posts/images/push-notification/push.png)

However, there are challenges

1. Setting up the Notification Server. We were using Apache server and it doesn't support websocket connections. Needs upgrade to our infrastructure.
2. Implementing server side component for Notification Server with security and authentication was significant effort.
3. More effort as compared to poll for maintaining state logic on Notification server & Javascript, requires resilience in building edge cases around data loss

To overcome over challenges we though of going to PaaS for Push Notification like PubNub and Pusher. However the challenge with PaaS is data security. Is it okay to send user personal data to 3rd party? The answer in our case of NO.

## Approach 3: Push notification for changes

![push notify for changes](/assets/sunitblog/posts/images/push-notification/push-notify.png)

To overcome the problem of data security we came with the tweaked approach as shown above. We use PaaS for Push Notification only to notify end user about there is new message and no data. When the notification is received we do the poll request on main server to refresh the UI.

Key advantages of using this approach:

1. No effort required for building & maintaining Notification Server. Leverage the PaaS.
2. Just send the change notification, so issues with data security.
3. Less development effort since most of the PaaS provider has their own library to support all browsers.
4. Realtime updates to end user. Better user experience.
5. High availability and scalability using PaaS

We are using [PubNub](http://www.pubnub.com/) as PaaS and experience so far is really good.





