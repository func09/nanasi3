class Message < ActiveRecord::Base
  validates_presence_of :body
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

