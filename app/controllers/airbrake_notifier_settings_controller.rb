class AirbrakeNotifierSettingsController < ApplicationController
  unloadable

  def update
    url = params[:url]
    api_key = params[:api_key]

    configure_airbrake(url, api_key)

    save_plugin_settings(url, api_key)

    flash[:notice] = l(:notice_successful_update)
    redirect_to :controller => 'settings', :action => 'index', :tab => 'redmine_airbrake_notifier'
  rescue => e
    flash[:error] = e.message
    redirect_to :controller => 'settings', :action => 'index', :tab => 'redmine_airbrake_notifier'
  end

  private
  def save_plugin_settings(url, api_key)
    Setting.plugin_redmine_airbrake_notifier = {"url" => url, "api_key" => api_key}
  end

  def configure_airbrake(url, api_key)
    return if url.blank? or api_key.blank?
    uri = URI.parse(url)
    raise l(:airbrake_plugin_message_invalid_url, :url => url) if uri.host.blank? or uri.port.blank?
    Airbrake.configure do |config|
      config.api_key = api_key
      config.host    = uri.host
      config.port    = uri.port
      config.secure  = config.port == 443
    end
  end
end
