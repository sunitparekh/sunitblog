---
tags: [agile, git, branching]
title: Simple 3 branch model for agile software development 
publish_datetime: 2016-08-21T00:00:07.0Z
description: On large teams it is very important that everyone understands and follow the same branching model/workflow. One of very popular branching workflow is [GitFlow](http://nvie.com/posts/a-successful-git-branching-model/), however with largely distributed team and novice team following GitFlow is difficult. So over a period of time I have been following simple 3 branch model for development which works fine for agile and continuous delivery software development method.    
---

On large teams it is very important that everyone understands and follow the same branching model/workflow. One of very popular branching workflow is [GitFlow](http://nvie.com/posts/a-successful-git-branching-model/), however with distributed and novice team following GitFlow is difficult. So over a period of time I have been following simple 3 branch model for development which works fine for agile and continuous delivery software development method.   


## 3 Branch workflow model

<iframe id="ytplayer" type="text/html" width="768" height="432" src="https://www.youtube.com/embed/xXc3YvzJPD4?html5=1" frameborder="0" allowfullscreen autohide="1" rel="0" />


***

## Challenges with following GitFlow on large distributed teams

1. Team to be at advance level of using Git version control with good hold on branching, merging techniques.  
2. Limited number of downstream environments (DEV, QAT, UAT, ...) it is not possible to deploy all features changes for testing, showcase/demo purpose at a time.
3. Refactoring becomes difficult since it creates lot of merge issues across feature branches.    

***

## Slides    
    
> Slides are available [here](https://docs.google.com/presentation/d/117bnmIVoBOLtDqgHSPta2guzlCEBNNyaFA-Oz7dyGaI/edit?usp=sharing)


