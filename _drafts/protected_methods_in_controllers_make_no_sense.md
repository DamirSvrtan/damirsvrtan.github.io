---
layout: post
title: "Protected methods in controllers make no sense"
date: 2015-06-07 00:53:04 +0100
comments: true
categories: Ruby Rails
---

Every once in a while, I see someone using protected methods in Rails controllers. There are 2 reasons why developers might do this:

  1. They don't realize that protected and private scopes in Ruby differ from other languages.
  2. They're just copy-pasting code snippets from the internet.

When the first reason is at stake, they're probably doing it for a reason so they can inherit methods from a parent controller (most of the time that parent controller being the ApplicationController):

{% highlight ruby %}
class ApplicationController < ActionController::Base
  protected

  def must_be_admin
    unless current_user.admin?
      flash[:error] = 'You do not have permission to view that page.'
      redirect_to root_path
    end
  end
end
{% endhighlight %}

{% highlight ruby %}
class ContractsController < ApplicationController
  before_action :must_be_admin
end
{% endhighlight %}

{% highlight ruby %}
class BillingController < ApplicationController
  before_action :must_be_admin
end
{% endhighlight %}

Not giving such methods private visibility because inheriting controllers won't see private methods **is wrong** - inheriting controllers will also inherit private methods because in **Ruby private methods are inherited**. Unlike other languages - methods of all visibility levels in Ruby are inherited.

Basically in controllers you should use two visibility levels: public and private. Public for public-facing controller actions and private for additional methods that aren't actions such as authorization checks or parameter whitelisting.

The main difference between protected and private methods is that protected methods are accessible from objects of the same class (or children), while privates aren't.

If you've defined a protected method in your controller, a fellow Rubyist could read your code as if you wanted to instantiate your controller in another controller and call that protected method from there. **That will never happen** as it doesn't make any sense:

{% highlight ruby %}
class BillingController < ApplicationController
  def index
    ApplicationController.new.must_be_admin
  end
end
{% endhighlight %}

The second reason I mentioned in the beginning is that devs tend to copy paste code from README's and similar resources. One might find

The reason why the guys and gals from Plataformatec won't change this is the second difference between protected and private methods - private methods enforce a strict implicit receiver and can't be called with an explicit one - you can't call a private method with `self.some_private_method`. When I suggested th

After reading this (or if you already know the difference between protected and privates in Ruby compared to other languages) you'll realize that **nothing bad will happen** if you use protected methods instead of privates. It's just that we are writing Ruby, not Java, so when we leave our code with protected methods, Ruby newcomers will automatically think that method visibility is the same in Ruby as in other programming languages. On the other hand, if we leave private lying around, they might ask themselves how is it possible to call private methods from inherited classes and might read-up on it in one of the numerous articles online about method visibility in Ruby.
