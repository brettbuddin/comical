require 'test_helper'

class ASofterWorldTest < ActiveSupport::TestCase
  context "An ASofterWorld instance" do
    should_describe_site 
    should_describe_feed 
    should_map
  end
end
