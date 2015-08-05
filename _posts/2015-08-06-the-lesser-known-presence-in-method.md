---
layout: post
title: "The lesser known #presence_in method"
date: 2015-08-06 00:00:04 +0100
comments: true
categories: Ruby Rails
---

When building web applications with Ruby on Rails you can find yourself in a situation where you want to call user input as a scope on a model.

## Writing an app with multiple sorting options

Let's say your webapp presents a list of articles and offers multiple ways of sorting them: by upload date, by number of upvotes and by number of comments. One of the possible techniques to support this behavior is by defining 3 types of scopes on your Article model: **newest**, **top** and **most_commented**.

{% highlight ruby %}
class Article < ActiveRecord::Base
  scope :newest, -> { order(updated_at: :desc) }
  scope :top, -> { order(upvotes_count: :desc) }
  scope :most_commented, -> { order(comments_count: :desc) }
end
{% endhighlight %}

You want to call those scopes depending on a query parameter passed to your controller, e.g. `/articles?sort_by=newest`

As a responsible developer you don't want to send those user inputs directly to your model since you would leave yourself vulnerable to remote code execution, so you sanitize it:

{% highlight ruby %}
class ArticlesController < ApplicationController
  def index
    Article.public_send(sorting_technique)
  end

  private

  def sorting_technique
     if %w(newest most_commented top).include? params[:sort_by]
       params[:sort_by]
     else
       :newest
     end
  end
end
{% endhighlight %}

Although that code has put us on the safe side, it's still not very nice - I've wrote similar code multiple times and have never felt happy about it since I believe it could be written shorter.

## The #presence_in method

That's where the lesser known method from the [ActiveSupport](http://guides.rubyonrails.org/active_support_core_extensions.html) module called [Object#presence_in](http://api.rubyonrails.org/classes/Object.html#method-i-presence_in) comes along.

### Description:

*Returns the receiver if it's included in the argument otherwise returns nil. Argument must be any object which responds to #include?.*

### Source:

{% highlight ruby %}
def presence_in(another_object)
  self.in?(another_object) ? self : nil
end
{% endhighlight %}

### Usage:

With the `presence_in` method we can write our `sorting_technique` method with a nice one liner:

{% highlight ruby %}
def sorting
  params[:sort_by].presence_in(%w(newest most_commented top)) || :newest
end
{% endhighlight %}

It's usage doesn't stop here but I've found it to be most useful when sanitizing user input.
