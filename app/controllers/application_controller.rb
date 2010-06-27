# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  helper_method :app_user, :app_hashtag
  
  def app_user
    return @app_user if defined? @app_user
    @app_user = User.find_by_login(APP_CONFIG[:twitter]['app_user'])
  end
  
  def app_hashtag
    return @@app_hashtag if defined? @@app_hashtag
    @@app_hashtag = APP_CONFIG['twitter']['hashtag']
  end
  
end
