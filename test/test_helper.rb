ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  def self.should_describe_site
    should "set site name" do
      assert subject.respond_to?(:site_name)
    end
    should "set site URL" do
      assert subject.respond_to?(:site_url)
    end
  end

  def self.should_describe_feed
    should "set feed URL" do
      assert subject.respond_to?(:feed_url)
    end
  end

  def self.should_map
    should "map feed to model" do
      model = subject.map(subject.fetch) 
      assert model.valid?
    end
  end

  def self.should_fetch_image
    should "fetch image" do
      model = subject.map(subject.fetch) 

      if model.image_url
        content = ''
        begin
          open(model.image_url) { |s| content = s.read }
        rescue; end
        assert !content.empty?
      end
    end
  end
end
