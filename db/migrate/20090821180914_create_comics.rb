class CreateComics < ActiveRecord::Migration
  def self.up
    create_table :comics do |t|
      t.string :feed_url
      t.string :name
      t.integer :fetch_frequency
      t.timestamps
    end
  end

  def self.down
    drop_table :comics
  end
end
