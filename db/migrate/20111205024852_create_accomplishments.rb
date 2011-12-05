class CreateAccomplishments < ActiveRecord::Migration
  def self.up
    create_table :accomplishments do |t|
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :accomplishments
  end
end
