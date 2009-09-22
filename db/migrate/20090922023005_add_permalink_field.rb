class AddPermalinkField < ActiveRecord::Migration
  def self.up
    add_column :strips, :permalink, :string
  end

  def self.down
    remove_column :strips, :permalink
  end
end
