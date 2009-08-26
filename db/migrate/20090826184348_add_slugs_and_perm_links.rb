class AddSlugsAndPermLinks < ActiveRecord::Migration
  def self.up
    add_column :comics, :url_name, :string
    add_column :comics, :site_url, :string
  end

  def self.down
    remove_column :comics, :url_name
    remove_column :comics, :site_url
  end
end
