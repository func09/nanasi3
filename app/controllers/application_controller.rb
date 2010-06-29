# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.
require 'digest/md5'
class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  helper_method :app_user, :app_hashtag, :signature
  
  def app_user
    return @app_user if defined? @app_user
    @app_user = User.find_by_login(APP_CONFIG[:twitter]['app_user'])
  end
  
  def app_hashtag
    return @@app_hashtag if defined? @@app_hashtag
    @@app_hashtag = APP_CONFIG['twitter']['hashtag']
  end
  
  def signature
    return @signature if defined? @signature
    @signature = Digest::MD5.hexdigest([request.remote_ip,request.headers['HTTP_USER_AGENT']].join).crypt(Digest::MD5.hexdigest(Date.today.to_s))
  end
  
end
