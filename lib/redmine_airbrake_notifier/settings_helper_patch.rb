require_dependency 'settings_helper'

module RedmineAirbrakeNotifier::SettingsHelperPatch
  def self.included(base)
    base.send(:include, SettingsHelperMethods)
    base.class_eval do
      alias_method_chain :administration_settings_tabs, :redmine_airbrake_notifier_helper
    end
  end

  module SettingsHelperMethods
    def administration_settings_tabs_with_redmine_airbrake_notifier_helper
      administration_settings_tabs_without_redmine_airbrake_notifier_helper << {
        :name => 'redmine_airbrake_notifier',
        :partial => 'redmine_airbrake_notifier_settings/show',
        :label => :redmine_airbrake_notifier_settings
      }
    end
  end
end
