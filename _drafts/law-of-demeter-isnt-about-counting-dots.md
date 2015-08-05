---
layout: post
title: "Law od Demeter is not about counting dots"
date: 2015-06-07 00:53:04 +0100
comments: true
categories: Ruby Rails
---

I've heard from some developers that they

For some reason, developers have started tracking if code breaks the law of Demeter
by counting dots or sequential method calls without wondering what the Law of Demeter
really represents. In a sentence:

### *The Law of Demeter is a design guideline advising how much to couple code. To be more precise: never to let any object know too much about our systems architecture*


<br/>
  The Law of Demeter clearly states:

    A method of an object may only invoke methods on the followings:

      1. On the object itself
      2. On the methods parameters
      3. On the objects instantited inside the object
      4. On the objects direct components

![dont-talk-to-strangers](http://ircmaxell.github.io/solid-presentation-tnphp/assets/images/strangers.jpg)

  But one thing programmers forget is that we are **NOT** reveling any information about the structure
  of our code when we call multiple sequential methods like this:

{% highlight ruby %}
  [id, name].join.underscore.dasherize.upcase
{% endhighlight %}

{% highlight ruby %}
  [33,22,543,12,37].select(&:odd?).sort.map { |x| x.gcd(3) }
{% endhighlight %}

{% highlight ruby %}
  user.posts.published.with_tags(:rails, :demeter).min_release_date('12-12-2014')
{% endhighlight %}
