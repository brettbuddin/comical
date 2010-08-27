require 'test_helper'

class DilbertTest < ActiveSupport::TestCase
  context "A Dilbert instance" do
    should_describe_site 
    should_describe_feed 
    should_map
    should_fetch_image
  end
end

