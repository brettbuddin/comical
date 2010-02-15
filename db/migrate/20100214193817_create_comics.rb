class CreateComics < ActiveRecord::Migration
  def self.up
    create_table :comics do |t|
      t.text :description
      t.string :extra
      t.date :posted_on
      t.string :image_url
      t.string :permalink
      t.string :type

      t.timestamps
    end
  end

  def self.down
    drop_table :comics
  end
end
