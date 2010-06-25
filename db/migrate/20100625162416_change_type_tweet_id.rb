class ChangeTypeTweetId < ActiveRecord::Migration
  def self.up
    change_column(:statuses, :tweet_id, :integer, :limit => 8)
  end

  def self.down
    change_column(:statuses, :tweet_id, :float)
  end
end
