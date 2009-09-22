class AddTitleTextField < ActiveRecord::Migration
  def self.up
    add_column :strips, :extra, :string
  end

  def self.down
    remove_column :strips, :extra
  end
end
