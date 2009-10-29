class RemoveFetchFrequency < ActiveRecord::Migration
  def self.up
    remove_column :comics, :fetch_frequency
  end

  def self.down
    add_column :comics, :fetch_frequency, :integer
  end
end
