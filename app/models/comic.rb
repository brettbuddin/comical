class Comic < ActiveRecord::Base
  has_many :strips
  validates_presence_of :name, :url_name, :site_url, :feed_url, :fetch_frequency
  validates_uniqueness_of :name, :url_name, :site_url, :feed_url
end
