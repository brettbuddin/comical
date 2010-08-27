require 'test_helper'

class PicturesForSadChildrenTest < ActiveSupport::TestCase
  context "A PicturesForSadChildren instance" do
    should_describe_site 
    should_describe_feed 
    should_map
    should_fetch_image
  end
end
