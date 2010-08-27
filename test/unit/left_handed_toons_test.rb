require 'test_helper'

class LeftHandedToonsTest < ActiveSupport::TestCase
  context "A LeftHandedToons instance" do
    should_describe_site 
    should_describe_feed 
    should_map
    should_fetch_image
  end
end
