---
tags: [software-design, agile]
title: Design for feature and code for story
publish_datetime: 2011-04-15T00:00:07.0Z
description: With this article I would like to extend the concept of code just enough to pass the story. As important it is to just code for the story, design for the feature is also important to avoid rework and clean design.
---

I have been practicing agile development engineering practices for almost more than 4 yrs now. One of practice about agile development is it talks about 'code for story', which means you just do simple enough implementation required for the story. Why? because you don't know what's required in future and will remain as it is or change.

Now considering 'code for story' practice, this is what happens on the ground. Pair picks up a first story of a feature and 'just did what was required for the story to implement', after few days another pair picks up a story on same feature and says 'Ohh... I have to first refactor the code so that it can be extended to implement next story', which means the work done by first story is partially or fully refactored. Fine, but similar approach continues as we keep picking up subsequent stories and Project Manager freaks out saying 'Refactoring is good, but when it required for every story that we implement is not just right OR something wrong with my understanding of refactoring.'

Let me take a very trivial example to explain above scenario. For the first story, I just used simple member variable since that story deals with only one item,

~~~java
public class Employee {
    String department;
}
~~~

next story extends the feature by changing simple member variable to List of objects which means changing all signatures and yes changing all tests as part of refactoring.

~~~java
public class Employee {
    List<Department> departments;
}
~~~

Now next story requires extending the feature again with changing List to Map and again same refactoring but more tedious.

~~~java
public class Employee {
    Map<string, Department> departments;
}
~~~

And we end up refactoring (throwing away) work done in previous stories. This scenario happens quite lot of time on projects.

We can avoid such scenarios on project by redefining a practice as 'Design for Feature and Code for Story'. Which means when I am working on any story I keep in mind the all feature stories and design my application to cater for feature while making sure I just code what is required for the story in play.

To achieve this

- developers and business analyst needs to make sure developers implementing the story has enough context about feature and understands the story scope within feature.
- leads on the project to participate in discussion during first few stories of the feature development, call huddles initially to gather different ideas in designing for feature.
- it might be that your first few stories takes little extra time that just doing simple way, however make sure to weight that extra time & effort vs. benefits in future story implementation.

Doing high level design early in cycle helps in faster development due to reduced rework and less throw away on project.

Watch Out and avoid following when you 'Design for Feature and Code for Story',

- Doing low-level design and putting lots of effort in just design. Going into mode of 'upfront low level design for feature'.
- Do not implement or start writing code for future stories. It's okay if your future stories may take just few hours, don't do it now.
- Design for Feature doesn't mean you freeze it once decided. Let design still evolve as you keep implementing stories of the feature.







