require 'jobless'

Jobless.cv do
  name "Damir Svrtan"
  email "damir.svrtan@gmail.com"
  location "Zagreb, Croatia"
  address "Bozidara Magovca 111"
  homepage "http://damir.svrtan.me"

  employment do
    entry do
      title "Rails Team Lead"
      company "Infinum"
      technologies "Ruby, Ruby on Rails"
      bulletin "Leading a team of 6 Rails developers"
      bulletin "Instituting best practices such as code reviews, pull requests and automated testing"
      bulletin "Enforcing overall code quality"
      bulletin "Leading a startup featured on TechCrunch Disrupt London 2015"
      start_date "April 2015"
      end_date "Present"
    end
    entry do
      title "Rails Developer"
      company "Infinum"
      technologies "Ruby, Ruby on Rails, Javascript"
      bulletin "Building various software for international clients"
      bulletin "Building a Ruby SDK for the Stormpath Authentication Service"
      bulletin "Building Phrasing, an open source inline content editing Rails engine"
      start_date "July 2013"
      end_date "April 2015"
    end
  end

  education do
    entry do
      title "M.S. Software Engineering"
      company "The University of Zagreb"
      start_date "2012"
      end_date "2014"
    end
    entry do
      title "B.S. Software Engineering"
      company "The University of Zagreb"
      start_date "2008"
      end_date "2012"
    end
  end

  group "Talks" do
    entry do
      title "Stop wasting time NOT writing tests @ Ruby Conf Lithuania 2016"
      homepage "http://rubyconf.lt/"
    end
    entry do
      title "Stop wasting time NOT writing tests @ Webcamp Zagreb 2015"
      homepage "https://2015.webcampzg.org/talks/view/stop-wasting-time-not-writing-tests/"
    end
    entry do
      title "Has anyone seen puts? @ Ruby Zagreb Meetup 2015"
      homepage "http://www.meetup.com/rubyzg/events/220554135/"
    end
    entry do
      title "Building a bidirectional web framework in Ruby @ Week of Webcamp 2014"
      homepage "https://2014.webcampzg.org/week-of-webcamp/wednesday/"
    end
    entry do
      title "Phrasing @ Code at Six 2013"
      homepage "http://codeatsix.infinum.co/meetup"
    end
  end

  group "Community work" do
    entry do
      title "Ruby Zagreb Meetup organizer"
      homepage "http://www.meetup.com/rubyzg/"
    end
    entry do
      title "Volunteer help @ Webcamp Zagreb (the largest Web conference in the Balkans), 2014-2015"
      homepage "https://2016.webcampzg.org/"
    end
    entry do
      title "Stack Overflow contributor (Top 9%)"
      homepage "http://stackoverflow.com/users/1279707/zippie?tab=profile"
    end
  end

  group "Articles" do
    entry do
      title "Trends in Ruby - analyzing rubygems stats for 2015"
      homepage "https://infinum.co/the-capsized-eight/articles/analyzing-rubygems-stats-v2015"
      description "Article featured in the Ruby Weekly, Ruby5 podcast and Green Ruby newsletter"
    end
    entry do
      title "Top 8 tools for Ruby on Rails code optimization and cleanup"
      homepage "https://infinum.co/the-capsized-eight/articles/top-8-tools-for-ruby-on-rails-code-optimization-and-cleanup"
      description "Article featured in the Ruby Weekly, Ruby5 podcast and Green Ruby newsletter"
    end
    entry do
      title "Tips for participating in the Rails Rumble"
      homepage "https://infinum.co/the-capsized-eight/articles/tips-for-participating-in-the-rails-rumble"
      description "Article featured in the Ruby Weekly, Ruby5 podcast and Green Ruby newsletter"
    end
    entry do
      title "Multiline strings in Ruby 2.3 - the squiggly heredoc"
      homepage "https://infinum.co/the-capsized-eight/articles/multiline-strings-ruby-2-3-0-the-squiggly-heredoc"
      description "Article featured in the Ruby Weekly, Ruby5 podcast and Green Ruby newsletter"
    end
    entry do
      title "Whitelisting with the lesser known presence in method"
      homepage "https://infinum.co/the-capsized-eight/articles/whitelisting-with-the-lesser-known-presence-in-method"
      description "Article featured in the Ruby Weekly, Ruby5 podcast and Green Ruby newsletter"
    end
  end

  open_source do
    github_repo "DamirSvrtan/fasterer"
    github_repo "infinum/phrasing"
  end

  group "Certificates" do
    entry do
      title "EDX, BerkleyX: CS169.2x: Advanced Software as a Service"
    end
    entry do
      title "EDX, BerkleyX: CS169.1x: Engineering Software as a Service"
    end
  end
end
