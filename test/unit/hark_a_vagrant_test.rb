require 'test_helper'

class HarkAVagrantTest < ActiveSupport::TestCase
  context "A HarkAVagrant instance" do
    should_describe_site 
    should_describe_feed 
    should_map
  end
end
