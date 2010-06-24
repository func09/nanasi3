require 'oauth'
require 'twitter'

class Message < ActiveRecord::Base
  
  belongs_to :user
  
  validates_presence_of :body
  
  before_create :tweet
  
  # 保存時にツイッターにつぶやきます
  def tweet
    # user = User.find_by_login(APP_CONFIG[:twitter]['app_user'])
    # res = user.twitter.post('/statuses/update.json', 'status' => self.body) 
    # self.tweet_id = res['id']
  end
end

# == Schema Information
#
# Table name: messages
#
#  id         :integer         not null, primary key
#  body       :string(255)     not null
#  tweet_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

