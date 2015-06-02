---
layout: post
title: "My favorite Ruby On Rails refactoring talks"
date: 2015-04-27 01:53:04 +0100
comments: true
categories: Ruby Rails
---

Refactoring is the craft of improving the design of existing code without changing it's external behaviour. Just like any other skill, it's improved by experience and knowledge. When lacking experience, sometimes the fastest way to improve your skills is through learning from other, more experienced developers. Check out some talks that have changed

I love refactoring code. I love optimization. I love it when my code climate badge shows 4.0. I strive to perfection and I'm never satisfied with my (initial) code. And more than anything I love to learn about new techniques on code refactoring.

I'm presenting you with 5 talks that i'm very keen of. These talks are not only informative but I consider them the best technicaly performed talks. They are fun and the speakers are really the best there is. I know there are some videos....but bored people don't learn

## Sandi Metz - [Nothing is something](https://www.youtube.com/watch?v=9lv2lBq6x4A)

## Sandi Metz - [All the little things](https://www.youtube.com/watch?v=8bZh5LMaSmE)

## Bryan Helmkamp - [Refactoring Fat Models with Patterns](https://www.youtube.com/watch?v=5yX6ADjyqyE)
<br />
Bryan Helmkamp is the CEO of [Code Climate](codeclimate.com), organizer of [NYC.rb meetups](http://www.meetup.com/NYC-rb), the [Goruco conference](http://goruco.com/) and also a winner of the [Ruby Hero award](http://rubyheroes.com/) back in 2009. He did this talk at [LA Ruby Conference](https://www.larubyconf.com/) in 2013 where he explains how to run from the methodology of Thin Controllers, Fat Models and presents other options such as Form Objects, Service Objects, Decorators and etc. There is a also an [associated blogpost](http://blog.codeclimate.com/blog/2012/10/17/7-ways-to-decompose-fat-activerecord-models/) if you're not up for watching the video.

bit out of date because of Reform and Interactor

## Ben Orenstein - [Refactoring from Good to Great](https://www.youtube.com/watch?v=DC-pQPq0acs)
<br />
Ben Orenstein is a developer at [Thoughtbot](thoughtbot.com) and he really kicked ass with his talk at [Aloha Ruby Conf](https://twitter.com/aloharubyconf) in 2012. If you want to know the basics of patterns such as single responsibility principle, the [tell don't ask principle](https://robots.thoughtbot.com/tell-dont-ask), the null object pattern or anti patterns like Shotgun surgery, this is the talk for you.

## Avdi Grimm - [Confident Code](https://www.youtube.com/watch?v=T8J0j2xJFgQ)
<br />
This is a talk that Avdi Grimm gave back in 2011 at [Ruby Midwest](http://www.rubymidwest.com/).

It's an excellent talk on how to construct methods ->

* gather input
-- missinterpreting what duck typing really is, refactoring case equality statements with type coercion
-- Special Case Pattern, the Black Hole NilObject Pattern
-- Problem of too many checking for Nil in code -> Hash#fetch
* perform work
* deliver results
* handle failures. It also talks about

If you're interested more about the stuff he's been talking about beyond this video, checkout out his book called [Confident Ruby](http://www.confidentruby.com/).

## Gregor Witzek - [Patterns, patterns everywhere](https://www.youtube.com/watch?v=xf0QdvA7lO4)

Knowing your design patterns is the mother of all refactoring. Gregor talks about 20 years of Gang of Four patterns and their applicabiliy in Ruby

## [Refactoring "99 Bottles of Beer" in Ruby](https://www.youtube.com/watch?v=cR-bYahAFuc)

This one differes from the previously suggested since it's not a talk but a hands on guide with a real example of refactoring code.
It was also inspired by Sandi Metz.

## Aja Hammerly - [N design patterns you might actually use](https://www.youtube.com/watch?v=Oxd_DBuX8R8)
