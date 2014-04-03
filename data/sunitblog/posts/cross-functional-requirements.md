---
# blog post attributes in front matter format
tags: [nfr, software development]
title: Cross functional requirements
description: "It is always been difficult to identify stories for cross functional requirement (XFR) a.k.a NonFunctional requirements (NFR) during inception (2-3 weeks of project kick-off/initiation phase). Here is the technique to do that in short 2-3 weeks project inception."
---

It's always been difficult to identify and easy to miss-out on creating stories for cross functional requirement (XFR) a.k.a NonFunctional requirements (NFR) during inception. Inception is a short, time boxed, 2-3 weeks initial requirement gathering phase of the software development project lifecycle. I have been to multiple inception and figured out a nice and collaborating way of capturing and converting cross functional requirements into stories. We run it like a workshops, collaborating with client to identify and capture XFRs.

After understanding and going to functional requirement, plan for XFR session with all the members of the team including stakeholders. We have list of XFRs printed on the cards at ThoughtWorks similar to the one shown below.

![cross functional bilities](/assets/sunitblog/posts/images/cross-functional-requirements/cards.png)
{: .left}

There are around 35 such "bility" that need to be discussed. During the session we take one 'bility' at a time and not down on stickies what are the requirements related to that 'bility'. It is important to discuss each and every 'bility' and there is a possibility few are not application to the project we are working on. Mark them as NA.

Once all the 'bility' is discussed break out in small team, discuss each XFR requirements and convert them into stories.
{: .clear}

![cross functional requirement wall](/assets/sunitblog/posts/images/cross-functional-requirements/cards-wall.jpg)
{: .full-width}

After creating the story list of XFRs, treat them as other stories. Combine the backlog of functional and XFR stories, estimate and prioritise stories together.

As documentation,  I like to use mind map since it fits that format nicely. Please have a look at the one displayed below for your reference.

![cross functional requirement mindmap](/assets/sunitblog/posts/images/cross-functional-requirements/mind-map.png)
{: .full-width}

I like calling NFRs as cross functional requirements (XFR) rather than non-functional, since most of the non-functional requirements are kind of indirect functional requirements. e.g. page load time for end user is performance requirement which indirectly related to better user experience.



