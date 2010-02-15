require 'rss/2.0'
require 'open-uri'
require 'net/http'
require 'digest/sha1'
require 'uri'

class Comic < ActiveRecord::Base
  attr_accessor :fetched

  validates_presence_of :posted_on, :image_url, :permalink 

  def fetch
    content = ''
    open(self.feed_url) { |s| content = s.read }
    RSS::Parser.parse(content, false)
  end

  def map_routine(xml)
    throw :no_map_routine, "#{self.class.to_s} has no mapping routine."
  end

  def map(xml)
    map_routine xml
    self
  end

  def eql?(comparee)
    self.class.to_s == comparee.class.to_s
  end

  class << self
    def site_name(name)
      define_method :site_name, lambda { name }
      define_method :url_name, lambda { name.downcase.gsub(/'/, '').gsub(/[^a-z0-9]+/, '-') }
    end

    def site_url(url)
      define_method :site_url, lambda { URI.parse(url) }
    end

    def feed_url(url)
      define_method :feed_url, lambda { URI.parse(url) }
    end
  end
end
