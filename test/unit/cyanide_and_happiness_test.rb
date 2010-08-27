require 'test_helper'

class CyanideAndHappinessTest < ActiveSupport::TestCase
  context "A CyanideAndHappiness instance" do
    should_describe_site 
    should_describe_feed 
    should_map
    should_fetch_image
  end
end
