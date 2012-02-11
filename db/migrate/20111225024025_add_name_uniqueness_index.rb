class AddNameUniquenessIndex < ActiveRecord::Migration
  def self.up
    add_index :users, :email_address, :unique => true
  end

  def self.down
    remove_index :users, :email_address
  end
end