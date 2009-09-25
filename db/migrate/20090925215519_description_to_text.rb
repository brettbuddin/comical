class DescriptionToText < ActiveRecord::Migration
  def self.up
    change_column :strips, :description, :text
  end

  def self.down
    change_column :strips, :description, :string
  end
end
