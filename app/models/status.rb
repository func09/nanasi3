class Status < ActiveRecord::Base
  belongs_to :user
  before_create :tweet
  validates_uniqueness_of :uuid
  validates_presence_of :text
  validates_length_of :text, :maximum => 140
  attr_accessor :tweet_extention
  
  default_value_for :uuid do
    Forgery::Basic.text :at_least => 6, :at_most => 6
  end
  
  default_value_for :tweet_extention, " #{APP_CONFIG[:twitter]['hashtag']}"
  default_value_for :text, " #{APP_CONFIG[:twitter]['hashtag']}"
  
  before_destroy :remove_tweet
  private
    
    # 保存時にツイッターにつぶやきます
    def tweet
      # message = self.text + self.tweet_extention
      message = self.text
      res = User.app_user.twitter.post('/statuses/update.json', 'status' => message) 
      self.tweet_id = res['id']
    end
    
    def remove_tweet
      User.app_user.twitter.post('/statuses/destroy.json', 'id' => self.tweet_id)
    end
    
end
