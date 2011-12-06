class AddArtworkToProject < ActiveRecord::Migration
  def self.up
    add_column :projects, :artwork_file_name, :string
    add_column :projects, :artwork_content_type, :string
    add_column :projects, :artwork_file_size, :integer
    add_column :projects, :artwork_updated_at, :datetime
  end

  def self.down
    remove_column :projects, :artwork_file_name, :string
    remove_column :projects, :artwork_content_type, :string
    remove_column :projects, :artwork_file_size, :integer
    remove_column :projects, :artwork_updated_at, :datetime
  end
end
