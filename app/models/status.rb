class Status < ActiveRecord::Base
  belongs_to :user
  before_create :init_uid, :tweet
  
  private
    
    def init_uid
      logger.info 'set_uid'
      self.uid = Forgery::Basic.text :at_least => 6, :at_most => 6 unless self.uid
    end
    
    # 保存時にツイッターにつぶやきます
    def tweet
      res = User.app_user.twitter.post('/statuses/update.json', 'status' => self.text) 
      self.tweet_id = res['id']
    end
end
