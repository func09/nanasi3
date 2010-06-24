class Status < ActiveRecord::Base
  belongs_to :user
  before_create :init_uid, :tweet
  private
    
    def app_user
      @@app_user if defined? @@app_user
      @@app_user = User.find_by_login(APP_CONFIG[:twitter]['app_user'])
    end
    
    def init_uid
      logger.info 'set_uid'
      self.uid = Forgery::Basic.text :at_least => 6, :at_most => 6 unless self.uid
    end
    
    def tweet
      # @@app_user
    end
end
