class CreateStatuses < ActiveRecord::Migration
  def self.up
    create_table :statuses do |t|
      t.string :uid, :null => false
      t.string :text, :null => false
      t.integer :tweet_id
      t.integer :user_id
      t.boolean :anonymous, :default => true
      t.timestamps
    end
    add_index :statuses, [:uid], :unique => true
    add_index :statuses, [:user_id]
  end

  def self.down
    drop_table :statuses
  end
end
