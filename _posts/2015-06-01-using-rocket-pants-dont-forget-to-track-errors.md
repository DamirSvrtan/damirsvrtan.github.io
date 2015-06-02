---
layout: post
title: "Using rocket pants? Don't forget to track errors!"
date: 2015-06-01 00:53:04 +0100
comments: true
categories: Ruby Rails
---

![rocket-img](http://upload.wikimedia.org/wikipedia/commons/9/9d/Rocket.jpg)

[Rocket Pants](https://github.com/Sutto/rocket_pants) is a neat API builder for Rails built on top of Action Controller.

It comes with a lot of functionalities such as automatic response meta data, rspec support and out of box ActiveRecord error mapping, just to name a few.

Rocket pants also captures errors that have happened on the server side and serves the API consumer with a nice json:

{% highlight json %}
{
  error: "system"
  error_description: "An unknown error has occurred."
}
{% endhighlight %}

But since rocket pants handles capturing errors for you, your regular error tracking tool such as Airbrake or Bugsnag won't be able to catch it - e.g. you won't get a notification or an email that something went wrong!

I've crawled around the code base to figure out how to push a notication when something goes wrong. Somebody failed to mention this in the README - but there's also a error tracking support module.

If you're prefered tracking solution is [Airbrake](https://airbrake.io/), [Honeybadger](https://www.honeybadger.io/) or [Bugsnag](https://bugsnag.com/), don't forget to register an exception notifier like this:

{% highlight ruby %}
class ApplicationController < RocketPants::Base
  # Airbrake
  use_named_exception_notifier :airbrake
  # or Honeybadger
  use_named_exception_notifier :honeybadger
  # or Bugsnag
  use_named_exception_notifier :bugsnag
end
{% endhighlight %}

Or if you're using some other service, you can add a custom notifier:

{% highlight ruby %}
class ApplicationController < RocketPants::Base
  self.exception_notifier_callback = lambda do |controller, exception, request|
    # track errors
  end
end
{% endhighlight %}

I ended up submitting some pull requests to get [automatic support for Bugsnag](https://github.com/Sutto/rocket_pants/pull/127) and to [get the documentation updated](https://github.com/Sutto/rocket_pants/pull/129) which got merged pretty fast and released in the version 1.1.2.

I would say that this is an excellent example of contributing with documentation - if someone else did this, (s)he would save me at least a half an hour of going around the codebase, finding a module I didn't know even existed and implementing it in my app.
