require 'test_helper'

class ComicTest < ActiveSupport::TestCase
  context "A Comic instance" do
    should_validate_presence_of :posted_on, :image_url, :permalink

    should "define DSL for setting site name" do
      assert subject.class.respond_to?(:site_name)
    end
    
    should "define DSL for setting site URL" do
      assert subject.class.respond_to?(:site_url)
    end

    should "define DSL for setting feed URL" do
      assert subject.class.respond_to?(:feed_url)
    end

    should "throw an exception when calling the base map_routine method" do
      assert_throws(:no_map_routine) { subject.map_routine('<test></test>') }
    end
  end
end
