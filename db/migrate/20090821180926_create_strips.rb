class CreateStrips < ActiveRecord::Migration
  def self.up
    create_table :strips do |t|
      t.string :description
      t.date :posted_on
      t.string :image_url
      t.references :comic
      t.timestamps
    end
  end

  def self.down
    drop_table :strips
  end
end
