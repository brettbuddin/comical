class Comic < ActiveRecord::Base
  has_many :strips
  validates_presence_of :name, :url_name, :site_url, :feed_url, :fetch_frequency
  validates_uniqueness_of :name, :url_name, :site_url, :feed_url
  
  def to_param
    self.url_name
  end
end
