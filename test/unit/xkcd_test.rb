require 'test_helper'

class XkcdTest < ActiveSupport::TestCase
  context "A Xkcd instance" do
    should_describe_site 
    should_describe_feed 
    should_map
    should_fetch_image
  end
end
