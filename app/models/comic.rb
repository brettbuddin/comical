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
    open(feed_url) do |s| 
      if gzipped
        content = Zlib::GzipReader.new(s).read
      else
        content = s.read
      end
    end
    RSS::Parser.parse(content, false)
  end

  def map_routine(xml)
    throw :no_map_routine, "#{self.class.to_s} has no mapping routine."
  end

  def map(xml)
    map_routine xml
    self
  end

  def inflate(string)
    stream = Zlib::Inflate.new(-15)
    buffer = stream.inflate(string)
    stream.finish
    stream.close
    buffer
  end

  def gzipped
    false
  end
  
  # Allow sub-classes of this class to define
  # some instance methods via a tiny DSL to describe
  # the feed and comic information
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

    def gzipped
      define_method :gzipped, lambda { true }
    end
  end
end
