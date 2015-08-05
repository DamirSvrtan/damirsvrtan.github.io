---
layout: post
title: "Protected methods in controllers make no sense"
date: 2015-06-07 00:53:04 +0100
comments: true
categories: Ruby Rails
---

Every once in a while, I see someone using protected methods in Rails controllers.

There are 2 reasons why developers might do this:

  1. They don't realize that protected and private scopes in Ruby differ from other languages.
  2. They're just copy-pasting code snippets from the internet.

## Private methods are also inherited

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

## Specifically needing a protected method in a controller

Basically in controllers you should use two visibility levels: **public** and **private**.

  1. Public for public-facing controller actions
  2. Private for additional methods that aren't actions such as authorization checks or parameter whitelisting.

The main difference between protected and private methods is that protected methods are accessible from objects of the same class (or child classes), while privates aren't.

If you've defined a protected method in your controller, a fellow Rubyist could read your code as if you wanted to instantiate your controller in another controller and call that protected method from there.
Since controllers need the request information to work properly, **you will never instantiate controllers yourself**, as it does not make any sense:

{% highlight ruby %}
class BillingController < ApplicationController
  def index
    ApplicationController.new.must_be_admin
  end
end
{% endhighlight %}

## Copy/pasting code with already defined protected methods

The second reason I mentioned in the beginning is that devs tend to copy paste code from README's and stackoverflow answers. You can find an example of this even in the Devise's README [section on strong parameters](https://github.com/plataformatec/devise#strong-parameters).

The reason why the guys and gals from Plataformatec won't change this is the second difference between protected and private methods - private methods enforce a strict implicit receiver and can't be called with an explicit one - you can't call a private method with `self.private_method`. So if anyone used `self.authenticate_admin!` in a legacy codebase, this switch to private visibility from protected would break their code.

## Conclusion

After reading this you'll realize that **nothing bad will happen** if you use protected methods instead of privates. It's just that we are writing Ruby, not Java, so when we leave our code with protected methods, Ruby newcomers will automatically think that method visibility is the same in Ruby as in other programming languages.

On the other hand, if we leave privates lying around, they might ask themselves how is it possible to call private methods from inherited classes and might read-up on it in one of the numerous articles online about method visibility in Ruby.
