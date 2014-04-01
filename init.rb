require File.expand_path('./config/initializers/airbrake.rb', File.dirname(__FILE__))

Redmine::Plugin.register :redmine_airbrake_notifier do
  name 'Redmine Airbrake Notifier plugin'
  author 'suer'
  description 'notification to Airbrake'
  version '0.0.1'
  url 'https://github.com/suer/redmine_airbrake_notifier'
  author_url 'http://d.hatena.ne.jp/suer'
end
