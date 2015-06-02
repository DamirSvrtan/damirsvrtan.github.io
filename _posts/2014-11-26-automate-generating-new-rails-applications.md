---
layout: post
title: "Automate generating new rails applications"
date: 2014-11-26 19:57:04 +0100
comments: true
categories: Ruby Rails
---

In the last year and a half since I've started working at [Infinum](https://infinum.co), a software development agency based in Croatia, I've found my self quite often in situations where I have to create a Rails application from scratch. Those situations come accross when I have to do a new application for work, for a hackathon or just for plain fun (when I want to try out a new gem or a new release of Rails, Ruby and similar).

I've become comfortable with a set of gems and a Rails setup that I use everyday, and it's quite an annoiance to do a fresh setup when I generate new apps.

There are a few ways to approach this problem:


<!--
  1. clone an already bootstrapped Rails application
  2. create a gem for generating new applications
  3. create a Rails application template file -->

## Clone an already bootstrapped Rails application

I've seen multiple software agencies do this, one of the latest being [Flatstack](http://www.flatstack.com/) with their [rails-base](https://github.com/fs/rails-base) repo.

This is probably the easist way to have an already bootstrapped application, but it has it's downsides. The biggest downside is changing the skeleton once a new Rails version is released. With the plans for Rails 5 which [DHH](https://twitter.com/dhh) announced on [his talk with the Amsterdam Ruby Group](https://www.youtube.com/watch?v=oQyL5rQrWu0), everybody having a solution like this will probably have to start from scratch.

Besides that, I see the rails-base repo has over 800 commits, and it kinda seems too much work for a base application (even if it's been 4 years since the first commit).

## Use a gem for generating new applications

One of the most popular solution for doing this is the [suspenders](https://github.com/thoughtbot/suspenders) gem by [Thoughtbot](http://thoughtbot.com/).

What they basically do is generate a new rails application and hookup after the generating process to do LOTS of setting up. They add their set of gems used on the front-end, setup the database, configure deployment on Heroku, tracking for New Relic and similar.

Suspenders however are very opinionated and aren't prone for tweaking. If you're looking for a unopinionated suspenders alternative, checkout [RailsBricks](http://www.railsbricks.net/), or even a more flexible solution, the [rails_apps_composer](https://github.com/RailsApps/rails_apps_composer) by Daniel Kehoe.

## Use a Rails application template

The Rails application generator can accept an '--template' option which can be a path or an URL to a Ruby script:

{% highlight ruby %}
  rails new my_application --template 'path_or_url_to_the_template'
{% endhighlight %}

Once the basic application generating is done, the generator will start executing the given template. Besides writting plain Ruby, you can use [Thor](https://github.com/erikhuda/thor/wiki/Getting-Started) methods (Rails generators also use Thor) to write more readable and expressive code. Methods such as `ask?`, `add_file`, `copy_file`, and `run` come in quite handy with scripts like these.

Since i don't need as much stuff as most agencies to get started, a [simple script with merely 100 lines of code hosted on gist.github.io](https://gist.github.com/DamirSvrtan/28a28e50d639b9445bbc) is totally sufficient for me.

I create my projects with this command ('-m' is short for '--template' ):

{% highlight ruby %}
rails new _app_name_ -m https://gist.githubusercontent.com/DamirSvrtan/28a28e50d639b9445bbc/raw/app_template.rb
{% endhighlight %}

Let's go through each part of the template I use:

Create a [bin/setup](http://robots.thoughtbot.com/bin-setup) file so new developers can start right away by executing just one command (I'll move this part once Rails 4.2.0 comes out, the bin/setup script will be in [new Rails projects by default](https://github.com/rails/rails/blob/master/railties/lib/rails/generators/rails/app/templates/bin/setup)):

{% highlight ruby %}
bin_setup_file = <<-FILE
#!/bin/sh
bundle install
bundle exec rake db:setup
FILE
create_file 'bin/setup', bin_setup_file
{% endhighlight %}

Swap the rdoc README format with markdown:

{% highlight ruby %}
remove_file "README.rdoc"
create_file "README.md", "Development: run ./bin/setup"
{% endhighlight %}

Since I always use SASS, I would always have to change the main stylesheet extension (would often wonder why my sassy stylesheets aren't working as expected):

{% highlight ruby %}
run 'mv app/assets/stylesheets/application.css app/assets/stylesheets/application.scss'
{% endhighlight %}

I either use postgres or mysql (merging soon to postgres exclusivly) so I add the appropriate database driver and change the configuration file. A cool thing with Thor is that you can ask the user questions, which I actually prefer prompting opposed to handing out configuration options before script execution.

{% highlight ruby %}
database_type = ask("Do you want to use postgres or mysql?", limited_to: ["pg", "mysql"])

adapter = if database_type == 'pg'
  gem 'pg'
  'postgresql'
else
  gem 'mysql2'
  'mysql2'
end

database_file = <<-FILE
default: &default
  adapter: <%= adapter %>
  pool: 5
  timeout: 5000
  host: localhost
  username: root

development:
  <<: *default
  database: <%= @app_name %>_development
  password:

test:
  <<: *default
  database: <%= @app_name %>_test

production:
  <<: *default
  database: <%= @app_name %>_production
FILE

create_file 'config/database.yml', ERB.new(database_file).result(binding), force: true
{% endhighlight %}


Remove unwanted gems (I never use sqlite nor coffescript). Spring will be added later in the development group of gems.
{% highlight ruby %}
%w(spring coffee-rails sqlite3).each do |unwanted_gem|
  gsub_file("Gemfile", /gem '#{unwanted_gem}'.*\n/, '')
end
{% endhighlight %}
I use [slim](http://slim-lang.com/) as a templating engine, so I replace the ERB layout:
{% highlight ruby %}
layout_file = <<-FILE
doctype html
html
  head
    title <%= @app_name.titleize %>

    = stylesheet_link_tag    'application', media: 'all', 'data-turbolinks-track' => true
    = javascript_include_tag 'application', 'data-turbolinks-track' => true
    = csrf_meta_tags

  body
    = yield
FILE

remove_file 'app/views/layouts/application.html.erb'
create_file 'app/views/layouts/application.html.slim', ERB.new(layout_file).result(binding)
{% endhighlight %}


Remove comments and double newlines from the Gemfile:
{% highlight ruby %}
gsub_file("Gemfile", /#.*\n/, '')
gsub_file("Gemfile", /^\n\n/, '')
{% endhighlight %}

I oftenly use [simple form](https://github.com/plataformatec/simple_form/), and the question is only if I'll use bootstrap. 99% of times it's yes:
{% highlight ruby %}
simple_form_installation = "simple_form:install"

if yes?('Use bootstrap?')
  gem 'bootstrap-sass'
  simple_form_installation << " --bootstrap"
end
{% endhighlight %}

Now the fun part, adding my usual gem toolbelt. I use [draper](https://github.com/drapergem/draper) for better separation of presentation and business logic.
[Better errors](https://github.com/charliesome/better_errors) & [binding of caller](https://github.com/banister/binding_of_caller) for nicer error pages (will see if I'll stay with it since Rails 4.2.0 will come out with it's own [web-console](https://github.com/rails/web-console)).
I love to use [pry](http://pryrepl.org/) for easier debugging and for surfing around the codebase, so I added the [pry-rails](https://github.com/rweng/pry-rails) gem. I also use [Bullet](https://github.com/flyerhzm/bullet) for optimizing my SQL queries, [traceroute](https://github.com/amatsuda/traceroute) for keeping my routes nice and tidy and the [letter opener](https://github.com/ryanb/letter_opener) gem for easier mail previewing (I still have to try [Action mailer previews](http://richonrails.com/articles/action-mailer-previews-in-ruby-on-rails-4-1) to see if they're a better fit):

{% highlight ruby %}
gem 'simple_form'
gem 'slim-rails'
gem 'draper'

gem_group :development do
  gem 'spring'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'quiet_assets'
  gem 'pry-rails'
  gem 'bullet'
  gem 'traceroute'
  gem 'letter_opener'
end
{% endhighlight %}

Run bundle install and install simple form:
{% highlight ruby %}
run "bundle install"

generate simple_form_installation
{% endhighlight %}

Initialize a git repository and append usual pesky files (this can also be done through global config):
{% highlight ruby %}
git :init
%w(.sass-cache powder public/system dump.rdb logfile .DS_Store).each do |gitignored|
  append_file ".gitignore", gitignored
end
git add: ".", commit: "-m 'Initial commit'"
{% endhighlight %}


As you see, I don't have that much of setting up to do (since the apps I do often differ from each other quite a lot) so rails application templates are just the right tool for me.

The nice part about this is that if I don't need some tools included in the script, I can always copy the file locally, remove it manually and roll the script. However, since I've added just the minimal amount of tools to get me started I've never needed to kick something out.

If you're not so used to a set of gems and can get on having a relativly generic but very flexible template, I would suggest Daniel Kehoes template [rails-composer](https://github.com/RailsApps/rails-composer).

That's it, hope you find this useful, and if you've got suggestions, do share them.
