require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
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

