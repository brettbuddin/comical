class Comic < ActiveRecord::Base
  has_many :strips
  validates_presence_of :name, :feed_url, :fetch_frequency
  validates_uniqueness_of :name, :feed_url
end
