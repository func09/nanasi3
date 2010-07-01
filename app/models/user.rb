class User < TwitterAuth::GenericUser
  has_many :statuses
  
  class << self
    def app_user
      return @app_user if defined? @app_user
      @app_user = find_by_login(APP_CONFIG[:twitter]['app_user'])
    end
    def update_app_user
      u = User.identify_or_create_from_access_token(app_user.access_token, app_user.access_secret)
      if u
        app_user.reload
        true
      else
        false
      end
    end
  end
  
  # Extend and define your user model as you see fit.
  # All of the authentication logic is handled by the 
  # parent TwitterAuth::GenericUser class.
end
