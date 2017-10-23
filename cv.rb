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
      technologies "Ruby, Ruby on Rails, Elixir, Phoenix"
      start_date "April 2015"
      end_date "Present"

      bulletin "Leading a team of Rails developers (grown from 4 to 8 members)"
      bulletin "Instituting best practices such as code reviews, pull requests and automated testing"
      bulletin "Increasing deliverability and stability of projects by enforcing overall code quality"
      bulletin "Increasing overall team knowledge by mentoring and onboarding new Rails developers<br/><br/>"

      bulletin "Software architecture decision making and technical leadership on web based projects"
      bulletin "Leading a startup featured on TechCrunch Disrupt London 2015"
      bulletin "Highly involved in the recruitment and hiring process"
    end

    entry do
      title "Rails course instructor"
      company "Infinum Student Academy"
      start_date "July 2015"
      end_date "August 2015"
      bulletin "Held lectures on a month long course on web app development with Ruby On Rails"
      bulletin "Coordinated and led a team responsible for creating and reviewing students homework"
    end

    entry do
      title "Rails Developer"
      company "Infinum"
      technologies "Ruby, Ruby on Rails, Javascript, Node.js"
      start_date "July 2013"
      end_date "April 2015"

      bulletin "Building web applications for U.S. based startups"
      bulletin "Building the Ruby SDK for the Stormpath Authentication Service (a Silicon Valley startup)"
      bulletin "Developed Phrasing, an open source inline content editing Rails engine"
    end
  end

  group "Community work" do
    entry do
      title "Ruby Zagreb Meetup organizer"
      homepage "http://www.meetup.com/rubyzg/"
      start_date "March 2014"
      end_date "Present"
    end
    entry do
      title "Stack Overflow contributor (Top 8%)"
      homepage "http://stackoverflow.com/users/1279707/zippie?tab=profile"
    end
  end

  group "Talks" do
    entry do
      title 'Building Ruby Bots on AWS Lambda @ NYC.rb 2017'
      homepage 'https://www.meetup.com/NYC-rb/events/235117574/'
    end
    entry do
      title 'Stateless Authentication w/ JSON Web Tokens @ South East Ruby Nashville 2017'
      homepage 'https://southeastruby.com/'
    end
    entry do
      title 'Stop Wasting Time Not Writing Tests @ We Are Developers Vienna 2017'
      homepage 'https://www.wearedevelopers.com'
    end
    entry do
      title "Reinventing the Bootcamp Idea @ Rails Israel 2016"
      homepage "https://railsisrael2016.events.co.il/tracks"
    end
    entry do
      title "Two Lines of Defense @ Quest For Quality Ljubljana 2016"
      homepage "http://questforquality.eu/#speakers"
    end
    entry do
      title "Stop wasting time NOT writing tests @ Voxxed Days Belgrade 2016"
      homepage "https://belgrade.voxxeddays.com"
    end
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

  group "Articles" do
    entry do
      title "Trends in Ruby - analyzing rubygems stats for 2015"
      homepage "https://infinum.co/the-capsized-eight/articles/analyzing-rubygems-stats-v2015"
      description "Article featured in the Ruby Weekly, Ruby5 podcast and Green Ruby newsletter"
    end
    entry do
      title "Don't send proposals at the last moment"
      homepage 'https://2017.webcampzg.org/news/dont-send-proposals-last-moment/'
      description "Article featured in the Technically Speaking newsletter"
    end
    entry do
      title "Top 8 tools for Ruby on Rails code optimization and cleanup"
      homepage "https://infinum.co/the-capsized-eight/articles/top-8-tools-for-ruby-on-rails-code-optimization-and-cleanup"
      description "Article featured in the Ruby Weekly, Ruby5 podcast and Green Ruby newsletter"
    end
    entry do
      title "Better login forms without security risks"
      homepage 'https://infinum.co/the-capsized-eight/better-login-forms-without-security-risks'
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
    github_repo "infinum/rails-handbook"
    github_repo "infinum/phrasing"
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

  group "Certificates" do
    entry do
      title "EDX, BerkleyX: CS169.2x: Advanced Software as a Service"
    end
    entry do
      title "EDX, BerkleyX: CS169.1x: Engineering Software as a Service"
    end
  end
end
