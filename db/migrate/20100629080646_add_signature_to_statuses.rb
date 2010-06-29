class AddSignatureToStatuses < ActiveRecord::Migration
  def self.up
    add_column :statuses, :signature, :string, :limit => 13
  end

  def self.down
    remove_column :statuses, :signature
  end
end
