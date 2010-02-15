require 'test_helper'

class SchlockMercenaryTest < ActiveSupport::TestCase
  context "A SchlockMercenary instance" do
    should_describe_site 
    should_describe_feed 
    should_map
  end
end
