class ChangePasswordToEncryptedPassword < ActiveRecord::Migration
  def self.up
    remove_column :users, :password
    add_column :users, :encrypted_password, :string
    add_column :users, :salt, :string
  end

  def self.down
    remove_column :users, :encrypted_password
    add_column :users, :password, :string
    remove_column :users, :salt
  end
end
