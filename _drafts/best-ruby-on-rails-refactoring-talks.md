---
layout: post
title: "My favorite Ruby On Rails refactoring talks"
date: 2015-04-27 01:53:04 +0100
comments: true
categories: Ruby Rails
---

Refactoring is the craft of improving the design of existing code without changing it's external behaviour.
Check out a couple of talks given by some of the best Ruby developers pointing out common problems and mistakes and how to deal with them.

Just like any other skill, it's improved by gaining experience and knowledge. When lacking experience, sometimes the fastest way to improve your skills is through learning from other, more experienced developers.



Do you love code refactoring?


I love refactoring code. I love optimization. I love it when my code climate badge shows 4.0. I strive to perfection and I'm never satisfied with my (initial) code. And more than anything I love to learn about new techniques on code refactoring.

I've curated my favorite 5 talks on code refactoring taking into consideration the information spread out to them, the quality of examples and the quality of the presentation it self.
Some of the talks are closely tied to Ruby On Rails but most refactoring techniques are often language agnostic, so even if you're not in the Ruby world, don't hesitate to watch them.

added some notes behind each one. These talks are not only informative but I consider them the best technically performed talks






I'm presenting you with 5 talks that i'm very keen of. These talks are not only informative but I consider them the best technicaly performed talks. They are fun and the speakers are really the best there is.


I know there are some videos....but bored people don't learn

## Sandi Metz - [Nothing is something](https://www.youtube.com/watch?v=9lv2lBq6x4A)

Sandi Metz gave this talk at multiple conferences this year and it gained lot of traction - for a reason, it's awesome! The talk is split up into two parts.. The first half of the talks is more oriented on her adversity to conditionals, the dirtyness of nil checks and advocating the use of the Null Object pattern.

The second part is a real life example of misleading usage of inheritance (used for shared behavior instead of specialization) and a step by step explanation on how to refactor the given code using composition with dependency injection.


## Sandi Metz - [All the little things](https://www.youtube.com/watch?v=8bZh5LMaSmE)

## Bryan Helmkamp - [Refactoring Fat Models with Patterns](https://www.youtube.com/watch?v=5yX6ADjyqyE)
<br />
Bryan Helmkamp is the CEO of [Code Climate](codeclimate.com), organizer of [NYC.rb meetups](http://www.meetup.com/NYC-rb), the [Goruco conference](http://goruco.com/) and also a winner of the [Ruby Hero award](http://rubyheroes.com/) back in 2009. He gave this talk at [LA Ruby Conference](https://www.larubyconf.com/) in 2013 where he explains how to run from the methodology of Thin Controllers, Fat Models and presents other options such as Form Objects, Service Objects, Decorators and etc. There is a also an [associated blogpost](http://blog.codeclimate.com/blog/2012/10/17/7-ways-to-decompose-fat-activerecord-models/) if you're not up for watching the video.

The talk and the blog post are quite theoretical and don't mention Rails gems that are used in practice to accomplish these refactorings:

  * Form Objects - [Reform](https://github.com/apotonick/reform)
  * Serivce Objects - [Interactor](https://github.com/collectiveidea/interactor)
  * Decorators - [Draper](https://github.com/drapergem/draper)

## Ben Orenstein - [Refactoring from Good to Great](https://www.youtube.com/watch?v=DC-pQPq0acs)
<br />
Ben Orenstein is a developer at [Thoughtbot](thoughtbot.com) and he really kicked ass with his talk at [Aloha Ruby Conf](https://twitter.com/aloharubyconf) in 2012. If you want to know the basics of patterns such as single responsibility principle, the [tell don't ask principle](https://robots.thoughtbot.com/tell-dont-ask), the null object pattern or anti patterns like Shotgun surgery, this is the talk for you.

## Avdi Grimm - [Confident Code](https://www.youtube.com/watch?v=T8J0j2xJFgQ)
<br />
This is a talk that Avdi Grimm gave back in 2011 at [Ruby Midwest](http://www.rubymidwest.com/).

It's an excellent talk on how to construct methods and separate them into 4 parts:

  * gather input
  * perform work
  * deliver results
  * handle failures.

There are examples of each part of a method, common mistakes that are usually made and how to fix them: embracing duck typing instead of using class checks, refactoring case equality statements with type coercion, using Hash#fetch for easier debugging, the Black Hole NilObject Pattern etc.

-- Special Case Pattern,

If you're interested more about the stuff he's been talking about beyond this video, checkout out his book called [Confident Ruby](http://www.confidentruby.com/).

## Gregor Witzek - [Patterns, patterns everywhere](https://www.youtube.com/watch?v=xf0QdvA7lO4)

Knowing your design patterns is the mother of all refactoring. Gregor talks about 20 years of Gang of Four patterns and their applicabiliy in Ruby

## [Refactoring "99 Bottles of Beer" in Ruby](https://www.youtube.com/watch?v=cR-bYahAFuc)

This one differes from the previously suggested since it's not a talk but a hands on guide with a real example of refactoring code.
It was also inspired by Sandi Metz.

## Aja Hammerly - [N design patterns you might actually use](https://www.youtube.com/watch?v=Oxd_DBuX8R8)

Knowing your design patterns is the mother of all refactoring and Aja talks about design patterns you might actually use in Ruby. She covered lots of ground in this talk, goes fast through the examples in a sarcastic manner and wastes no time. The talk covers the following patterns: template, strategy, composite, command and decorators. For each she gives real world examples and handsout code snippets.

Many of these patterns developers use on a daily basis but aren't calling them any names since they somewhat come natural to implement.

She mentions how the [Gang Of Four book]( https://www.wikiwand.com/en/Design_Patterns) is always lying around her office and also recommends to read a more applicable [book to Rubyists on Designs Patterns](http://designpatternsinruby.com/) by Russ Olsen.

[Doug Yun](https://twitter.com/dougyun) from Dockyard covered most of them well in a [series of blog posts on design patterns](https://dockyard.com/blog/categories/design-patterns).


quite funny
I love the speed of this talk, covering lots of ground in a precise manner
not implemented error 08:00
template
strategy
coposite pattern - potrazit to u Rubyu
use procs or lambdas instead of the command pattern



https://dockyard.com/blog/2013/10/01/design-patterns-composite-pattern
