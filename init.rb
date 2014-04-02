require 'redmine_airbrake_notifier/settings_helper_patch'

Rails.configuration.to_prepare do
  unless SettingsHelper.included_modules.include? RedmineAirbrakeNotifier::SettingsHelperPatch
    SettingsHelper.send(:include, RedmineAirbrakeNotifier::SettingsHelperPatch)
  end
end

Redmine::Plugin.register :redmine_airbrake_notifier do
  name 'Redmine Airbrake Notifier plugin'
  author 'suer'
  description 'notification to Airbrake'
  version '0.0.1'
  url 'https://github.com/suer/redmine_airbrake_notifier'
  author_url 'http://d.hatena.ne.jp/suer'

  settings :default => {
    'url' => '',
    'api_key' => ''
  }
end
