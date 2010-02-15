require 'test_helper'

class PicturesForSadChildrenTest < ActiveSupport::TestCase
  context "A PicturesForSadChildren instance" do
    should_describe_site 
    should_describe_feed 
    should_map
  end
end
