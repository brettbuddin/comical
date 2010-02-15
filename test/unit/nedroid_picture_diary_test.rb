require 'test_helper'

class NedroidPictureDiaryTest < ActiveSupport::TestCase
  context "A NedroidPictureDiary instance" do
    should_describe_site 
    should_describe_feed 
    should_map
  end
end
