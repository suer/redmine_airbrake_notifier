class AirbrakeNotifierSettingsController < ApplicationController
  unloadable

  def update
    url = params[:url]
    api_key = params[:api_key]

    save_plugin_settings(url, api_key)

    redirect_to :controller => 'settings', :action => 'index', :tab => 'redmine_airbrake_notifier'
  end

  private
  def save_plugin_settings(url, api_key)
    Setting.plugin_redmine_airbrake_notifier[:url] = url
    Setting.plugin_redmine_airbrake_notifier[:api_key] = api_key
  end
end
